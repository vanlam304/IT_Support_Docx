# Tổng quan

KVM là một công nghệ hỗ trợ tạo máy ảo trên Linux. Nó giống như các phần mềm tạo máy ảo khác như VMware hay Virtual box nhưng KVM là một phần mềm mã nguồn mở và được tích hợp sẵn trong Linux. KVM thuộc loại ảo hóa full virtualization.

# Chuẩn bị
Một máy ubuntu cấu hình với ít nhất 2 CPU, 2 GB RAM và 15 GB disk.

Máy có card mạng để kết nối mạng cho VM ra ngoài.

Lưu ý để cài được KVM thì cần phải được CPU hỗ trợ. Để kiểm tra xem CPU có hỗ trợ hay không sử dụng lệnh

**egrep -c "svm|vmx" /proc/cpuinfo**

Nếu kết quả trả về là khác **0** thì CPU có hỗ trợ.

![image](https://user-images.githubusercontent.com/111721629/188532814-ceae26b5-a4f2-4b74-9fca-788463292891.png)

# Cài KVM#
Cài đặt KVM và công cụ quản trị **virt-manager**

**sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager**

Trong đó:

- qemu-kvm: Phần phụ trợ cho KVM.

- libvirt-bin: cung cấp libvirt mà bạn cần quản lý qemu và KVM bằng libvirt.

- bridge-utils: chứa một tiện ích cần thiết để tạo và quản lý các thiết bị bridge.

- virt-manager: cung cấp giao diện đồ họa để quản lý máy ảo.

Kiểm tra để chắc chắn rằng KVM đã được cài đặt

```
$ lsmod | grep kvm
kvm_intel             204800  0
kvm                   593920  1 kvm_intel
irqbypass              16384  1 kvm
```
