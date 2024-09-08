echo "Type in new hostname:"
read newhostname

hostnamectl hostname $newhostname
