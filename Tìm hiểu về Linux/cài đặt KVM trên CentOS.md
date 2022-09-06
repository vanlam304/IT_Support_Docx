# Tổng quan

KVM là một công nghệ hỗ trợ tạo máy ảo trên Linux. Nó giống như các phần mềm tạo máy ảo khác như VMware hay Virtual box nhưng KVM là một phần mềm mã nguồn mở và được tích hợp sẵn trong Linux. KVM thuộc loại ảo hóa full virtualization.

# Chuẩn bị
Một máy centOS cấu hình với ít nhất 2 CPU, 2 GB RAM và 15 GB disk.

Máy có card mạng để kết nối mạng cho VM ra ngoài.

Lưu ý để cài được KVM thì cần phải được CPU hỗ trợ. Để kiểm tra xem CPU có hỗ trợ hay không sử dụng lệnh

**egrep -c "svm|vmx" /proc/cpuinfo**

![image](https://user-images.githubusercontent.com/111721629/188567306-2d9d34fd-1113-4813-b61c-9a91df2aabf4.png)


Nếu kết quả trả về là khác **0** thì CPU có hỗ trợ.



# Cài KVM
Cài đặt KVM và công cụ quản trị **virt-manager**

**yum -y install qemu-kvm libvirt virt-install bridge-utils virt-manager**

Trong đó:

- qemu-kvm: Phần phụ trợ cho KVM.

- libvirt-bin: cung cấp libvirt mà bạn cần quản lý qemu và KVM bằng libvirt.

- bridge-utils: chứa một tiện ích cần thiết để tạo và quản lý các thiết bị bridge.

- virt-manager: cung cấp giao diện đồ họa để quản lý máy ảo.

![image](https://user-images.githubusercontent.com/111721629/188567698-8a1143de-be4f-4935-a172-11ec2520c387.png)

Kiểm tra để chắc chắn rằng KVM đã được cài đặt

```
# lsmod | grep kvm
kvm_intel             188740  0 
kvm                   637289  1 kvm_intel
irqbypass              13503  1 kvm
```

## Bật libvirt và khởi động cùng hệ thống

```
systemctl start libvirt
systemctl enable libvirtd
```
### Tạo 1 card bridge
Ta sẽ tạo 1 card bridge br0 ở chế độ NAT để khi tạo KVM sẽ gắn card mạng vào bridge này:
```
# nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
# nmcli connection modify br0 ipv4.addresses 192.168.37.55/24 ipv4.method manual  
# nmcli connection modify br0 ipv4.gateway 192.168.37.1
# nmcli connection modify br0 ipv4.dns 192.168.37.1  
# nmcli connection delete ens33
# nmcli connection add type bridge-slave autoconnect yes con-name ens33 ifname ens33 master br0
```

# Khởi động lại hệ thống
```# reboot```
