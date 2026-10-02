# create 3 nnetwork namespaces
read -p "Enter the number of network namespaces to create: " num_namespaces
for i in $(seq 1 $num_namespaces); do
    ip netns add ns$i
    echo "Created network namespace ns$i"
done
# assing ip addresses to the namespaces
for i in $(seq 1 $num_namespaces); do
    read -p "Enter the IP address for ns$i (e.g., 192.168.1.$i/24): " ip_address
    ip netns exec ns$i ip addr add $ip_address dev lo
    ip netns exec ns$i ip link set lo up
    echo "Assigned IP address $ip_address to ns$i"
done
# create 2nd namespace and assing ip address to it
read -p "Enter the IP address for ns2 (e.g., 192.168
.1.2/24): " ip_address_ns2
ip netns exec ns2 ip addr add $ip_address_ns2 dev lo
ip netns exec ns2 ip link set lo up
echo "Assigned IP address $ip_address_ns2 to ns2"
# create 3red namespace and assing ip address to it
read -p "Enter the IP address for ns3 (e.g., 192.168
.1.3/24): " ip_address_ns3
ip netns exec ns3 ip addr add $ip_address_ns3 dev lo
ip netns exec ns3 ip link set lo up
echo "Assigned IP address $ip_address_ns3 to ns3"
# create linux bridge  and connecte all network namespaces to it
read -p "Enter the name of the Linux bridge to create: " bridge_name
ip link add name $bridge_name type bridge
ip link set $bridge_name up
for i in $(seq 1 $num_namespaces); do
    ip link add veth$i type veth peer name veth$i-br
    ip link set veth$i netns ns$i
    ip netns exec ns$i ip link set veth$i up
    ip link set veth$i-br master $bridge_name
    ip link set veth$i-br up
    echo "Connected ns$i to bridge $bridge_name"
done
# configure routing between the namespaces and the bridge
for i in $(seq 1 $num_namespaces); do
    ip netns exec ns$i ip route add default via $(ip addr show $bridge_name | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
    echo "Configured routing for ns$i"
done    
# configure a new network interface and conncet with host and bridge
read -p "Enter the name of the new network interface to create (e.g., eth1): " new_interface
ip link add name $new_interface type veth peer name $new_interface-br
ip link set $new_interface up
ip link set $new_interface-br master $bridge_name
ip link set $new_interface-br up
echo "Created new network interface $new_interface and connected it to bridge $bridge_name" 
# namespace access to internet confgure host as a getway for the namespaces and namespace are private so outside  network  not have access to them
echo "Configuring host as a gateway for the namespaces..."
# Enable IP forwarding on the host
sysctl -w net.ipv4.ip_forward=1
# Set up NAT (Network Address Translation) for the namespaces
iptables -t nat -A POSTROUTING -s 192.168.1.
0/24 -o $(ip route | grep default | awk '{print $5}') -j MASQUERADE
echo "Host configured as a gateway for the namespaces. The namespaces can now access the internet." 

