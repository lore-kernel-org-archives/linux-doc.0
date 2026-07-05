Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9B7233938;
	Sun,  5 Jul 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783239925; cv=none; b=uSGbeorWdlJIEnkCHTEoDvo41Jkjilv7BOZPuWK8gUidJmZ6/d1kMBGXSM3/S7VdyWMim5kN4AlzHgC+/dRIDEi1GISXGPJSYB/KyeHZAGzwwJzooFVKEXgbIqHPpCrtygSp9aGzkata6k4IfUg4UeigV72iCCfW9vTi05qQfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783239925; c=relaxed/simple;
	bh=SnBNntRnuhe9qdRjZh82IxJkBHAHpncp4Lohh4VCOtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r88Ysb0PP7/ravHwvNNXaWA34qfJB9xsdVOzn1TmA3N9pAEGPoDPrkdWbYpFpvNuKzhHBq5z3ScLLEwEKqOs19NRIbF/VvokpQwA37+j5cnhupTkzjPkdZzGy6XIOk+GyKRim1Qcn6oLEW27m4sUpOVzDVG0kc7J2A7WVy1foHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAB3f7OqFEpq56RUAA--.38745S2;
	Sun, 05 Jul 2026 16:24:10 +0800 (CST)
Received: from [192.168.43.20] (unknown [10.200.80.159])
	by gateway (Coremail) with SMTP id _____wAnAneeFEpqo6BPAA--.14019S2;
	Sun, 05 Jul 2026 16:24:01 +0800 (CST)
Message-ID: <f9d35cb9-4fc6-4d2e-821f-ff949035eef8@hust.edu.cn>
Date: Sun, 5 Jul 2026 16:23:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs/zh_CN: add process/changes.rst translation
To: Jiandong Qiu <qiujiandong1998@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <20260621131215.1303439-2-qiujiandong1998@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260621131215.1303439-2-qiujiandong1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAB3f7OqFEpq56RUAA--.38745S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3CryrtF4kCry3XFWxKr1kGrg_yoW8AFWrWo
	WfKayYkr4rCw15Jr1jyr4DJF9rtr18KrnxAF4DCrnrJFW0kw1Fvr4DKa17JrWvyrW5Xas3
	Ja4UuFW3J3W3CF4fn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOy7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYY7kG6IIYr7AKxVW5JVW7JwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUvBbkUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/21/26 9:12 PM, Jiandong Qiu wrote:
> Add the zh_CN translation of process/changes.rst.
>
> Update this translation through commit ece7e57afd51
> ("docs: changes.rst and ver_linux: sort the lists")

Hi Jiandong,

Sorry for the late response.

The latest commit for process/changes.rst is 2c1ccd9a1d78(docs: 
changes.rst: restore pahole 1.26 minimum (regressed by sort)).

Could you please catch up the latest git commit of original English 
documentat?

Dongliang Mu

> Assisted-by: Codex:GPT-5.4
> Signed-off-by: Jiandong Qiu <qiujiandong1998@gmail.com>
> ---
>   .../translations/zh_CN/process/changes.rst    | 528 ++++++++++++++++++
>   1 file changed, 528 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/process/changes.rst
>
> diff --git a/Documentation/translations/zh_CN/process/changes.rst b/Documentation/translations/zh_CN/process/changes.rst
> new file mode 100644
> index 000000000000..62ec7f0e3533
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/changes.rst
> @@ -0,0 +1,528 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/process/changes.rst
> +
> +:翻译: 裘剑东 Jiandong Qiu <qiujiandong1998@gmail.com>
> +
> +==================
> +编译内核的最小需求
> +==================
> +
> +引言
> +====
> +
> +本文旨在给出运行当前内核版本所需的最低软件版本列表。
> +
> +本文最初基于 Linus 为 2.0.x 内核编写的 “Changes” 文件，因此也应将功劳归于
> +与该文件相关的同一批人（Jared Mauch、Axel Boldt、Alessandro Sigala，
> +以及互联网上无数其他用户）。
> +
> +当前最低需求
> +------------
> +
> +在认为自己碰到了一个bug之前，请先至少升级到以下软件版本。
> +如果你不确定当前运行的版本，建议使用右侧命令进行检查。
> +若要列出系统中的程序及其版本，请执行 ``./scripts/ver_linux``
> +
> +再次提醒，本列表假定你已经能够正常运行一个Linux内核。另外，
> +并非所有工具在所有系统上都是必需的；例如，如果你的机器没有任何
> +PC Card硬件，那么大概无需关心 pcmciautils。
> +
> +====================== ===============  ========================================
> +        程序             最低版本              版本检查命令
> +====================== ===============  ========================================
> +bash                   4.2              bash --version
> +bc                     1.06.95          bc --version
> +bindgen（可选）        0.65.1           bindgen --version
> +binutils               2.30             ld -v
> +bison                  2.0              bison --version
> +btrfs-progs            0.18             btrfs --version
> +Clang/LLVM（可选）     15.0.0           clang --version
> +e2fsprogs              1.41.4           e2fsck -V
> +flex                   2.5.35           flex --version
> +gdb                    7.2              gdb --version
> +GNU awk（可选）        5.1.0            gawk --version
> +GNU C                  8.1              gcc --version
> +GNU make               4.0              make --version
> +GNU tar                1.28             tar --version
> +GRUB                   0.93             grub --version || grub-install --version
> +gtags（可选）          6.6.5            gtags --version
> +iptables               1.4.2            iptables -V
> +jfsutils               1.1.3            fsck.jfs -V
> +kmod                   13               kmod -V
> +mcelog                 0.6              mcelog --version
> +mkimage（可选）        2017.01          mkimage --version
> +nfs-utils              1.0.5            showmount --version
> +openssl & libcrypto    1.0.0            openssl version
> +pahole                 1.22             pahole --version
> +pcmciautils            004              pccardctl -V
> +PPP                    2.4.0            pppd --version
> +procps                 3.2.0            ps --version
> +Python                 3.9.x            python3 --version
> +quota-tools            3.09             quota -V
> +Rust（可选）           1.78.0           rustc --version
> +Sphinx\ [#f1]_         3.4.3            sphinx-build --version
> +squashfs-tools         4.0              mksquashfs -version
> +udev                   081              udevadm --version
> +util-linux             2.10o            mount --version
> +xfsprogs               2.6.0            xfs_db -V
> +====================== ===============  ========================================
> +
> +.. [#f1] Sphinx 仅在构建内核文档时需要
> +
> +内核编译
> +--------
> +
> +GCC
> +~~~
> +
> +gcc 的版本要求可能会因你计算机中CPU的类型不同而有所变化。
> +
> +Clang/LLVM（可选）
> +~~~~~~~~~~~~~~~~~~
> +
> +clang和LLVM工具的最新正式发行版（依据
> +`releases.llvm.org <https://releases.llvm.org>`_）支持用于构建内核。
> +较旧版本并不保证可用，我们也可能移除内核中为支持旧版而加入的兼容性处理。
> +更多信息请参阅 Documentation/translations/zh_CN/kbuild/llvm.rst
> +
> +Rust（可选）
> +~~~~~~~~~~~~
> +
> +需要较新的 Rust 编译器版本。
> +
> +关于如何满足 Rust 支持的构建需求，请参阅
> +Documentation/translations/zh_CN/rust/quick-start.rst。其中，``Makefile`` 目标
> +``rustavailable`` 可用于检查 Rust 工具链为何未被检测到。
> +
> +bindgen（可选）
> +~~~~~~~~~~~~~~~
> +
> +``bindgen`` 用于为内核的 C 侧生成Rust绑定。它依赖 ``libclang``。
> +
> +Make
> +~~~~
> +
> +要构建内核，你需要 GNU make 4.0 或更高版本。
> +
> +Bash
> +~~~~
> +
> +内核构建会使用一些 bash 脚本。需要 Bash 4.2 或更新版本。
> +
> +Binutils
> +~~~~~~~~
> +
> +构建内核需要 Binutils 2.30 或更新版本。
> +
> +pkg-config
> +~~~~~~~~~~
> +
> +从 Linux 4.18 起，构建系统需要 pkg-config 来检查已安装的 kconfig 工具，并确定用于
> +'make {g,x}config' 的标志设置。此前虽然已经在使用 pkg-config，
> +但并未进行检查或文档说明。
> +
> +Flex
> +~~~~
> +
> +自 Linux 4.16 起，构建系统会在构建过程中生成词法分析器。这需要
> +flex 2.5.35 或更高版本。
> +
> +
> +Bison
> +~~~~~
> +
> +自 Linux 4.16 起，构建系统会在构建过程中生成语法解析器。这需要 bison 2.0
> +或更高版本。
> +
> +pahole
> +~~~~~~
> +
> +自 Linux 5.2 起，如果选择了 CONFIG_DEBUG_INFO_BTF，构建系统会从 vmlinux 中的
> +DWARF 生成 BTF（BPF Type Format），稍后也会为内核模块生成。这需要 pahole
> +v1.22 或更高版本。
> +
> +它可从发行版中的 'dwarves' 或 'pahole' 软件包获得，或从
> +https://fedorapeople.org/~acme/dwarves/ 获取。
> +
> +Perl
> +~~~~
> +
> +要构建内核，你需要 perl 5 以及以下模块：``Getopt::Long``、
> +``Getopt::Std``、``File::Basename`` 和 ``File::Find``。
> +
> +Python
> +~~~~~~
> +
> +若干配置选项需要它：例如 arm/arm64 默认配置、CONFIG_LTO_CLANG、某些
> +DRM 可选配置、kernel-doc 工具以及文档构建（Sphinx）等。
> +
> +BC
> +~~
> +
> +构建 3.10 及以上版本内核时需要 bc。
> +
> +
> +OpenSSL
> +~~~~~~~
> +
> +模块签名和外部证书处理使用OpenSSL程序及其加密库来创建密钥并生成签名。
> +
> +如果启用了模块签名，那么构建 3.7 及以上版本内核时需要 openssl。构建
> +4.3 及以上版本内核时，还需要 openssl 的开发包。
> +
> +Tar
> +~~~
> +
> +如果你想通过 sysfs 启用对内核头文件的访问（CONFIG_IKHEADERS），则需要 GNU tar。
> +
> +gtags / GNU GLOBAL（可选）
> +~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +内核构建要求 GNU GLOBAL 版本 6.6.5 或更高，以便通过 ``make gtags``
> +生成标签文件。这是因为它使用了 gtags 的 ``-C (--directory)`` 选项。
> +
> +mkimage
> +~~~~~~~
> +
> +该工具用于构建 Flat Image Tree（FIT），常见于 ARM 平台。该工具可通过
> +``u-boot-tools`` 软件包获得，也可以从 U-Boot 源码构建。详见
> +https://docs.u-boot.org/en/latest/build/tools.html#building-tools-for-linux
> +
> +GNU AWK
> +~~~~~~~
> +
> +如果你希望内核构建为内建模块生成地址范围数据（CONFIG_BUILTIN_MODULE_RANGES），
> +则需要GNU AWK。
> +
> +系统工具
> +--------
> +
> +架构方面的变化
> +~~~~~~~~~~~~~~
> +
> +DevFS 已被废弃，转而使用 udev
> +（https://www.kernel.org/pub/linux/utils/kernel/hotplug/）
> +
> +现在已经支持 32 位 UID。尽情享用！
> +
> +Linux 中函数的文档正在转向以内联文档形式存在，即在源码定义附近使用特殊格式的
> +注释。这些注释可以与 Documentation/ 目录中的 ReST 文件结合，生成更丰富的文档，
> +随后可以再转换为 PostScript、HTML、LaTex、ePUB 和 PDF 文件。若要将 ReST
> +格式转换为你所需的格式，需要Sphinx。
> +
> +Util-linux
> +~~~~~~~~~~
> +
> +较新的 util-linux 版本为更大容量磁盘提供 ``fdisk`` 支持，支持更多的 mount 选项，
> +识别更多分区类型，以及其他类似改进。你大概会想升级它。
> +
> +Ksymoops
> +~~~~~~~~
> +
> +如果发生了最糟糕的情况，内核出现 oops，你可能需要 ksymoops 工具来解码它，
> +但在大多数情况下并不需要。通常更推荐在构建内核时启用 ``CONFIG_KALLSYMS``，
> +这样可以产生可直接使用的可读转储（而且输出比 ksymoops 更好）。
> +如果由于某种原因你的内核不是以 ``CONFIG_KALLSYMS`` 构建的，
> +并且你也没有办法重新构建并在启用该选项的情况下重新复现Oops，
> +那么你仍然可以使用 ksymoops 对该 Oops 进行解码。
> +
> +Mkinitrd
> +~~~~~~~~
> +
> +``/lib/modules`` 文件树布局的这些变化同样要求升级 mkinitrd。
> +
> +E2fsprogs
> +~~~~~~~~~
> +
> +最新版 ``e2fsprogs`` 修复了 fsck 和 debugfs 中的若干bug。显然，升级它是个好主意。
> +
> +JFSutils
> +~~~~~~~~
> +
> +``jfsutils`` 软件包包含该文件系统的工具。可用工具如下：
> +
> + - ``fsck.jfs`` - 启动事务日志重放，并检查和修复 JFS 格式分区。
> + - ``mkfs.jfs`` - 创建 JFS 格式分区。
> + - 该软件包中还提供了其他文件系统工具。
> +
> +Xfsprogs
> +~~~~~~~~
> +
> +最新版 ``xfsprogs`` 包含 ``mkfs.xfs``、``xfs_db`` 和 ``xfs_repair`` 等
> +XFS文件系统工具。它与架构无关，2.0.0 及以上的任何版本都应能与当前版本的
> +XFS内核代码正常配合使用（推荐 2.6.0 或更高版本，因为其包含一些重要改进）。
> +
> +PCMCIAutils
> +~~~~~~~~~~~
> +
> +PCMCIAutils取代了 ``pcmcia-cs``。它会在系统启动时正确设置 PCMCIA插槽；
> +如果内核采用模块化并使用了 hotplug 子系统，它还会为16位PCMCIA设备加载相应模块。
> +
> +Quota-tools
> +~~~~~~~~~~~
> +
> +如果你想使用较新的 version 2 配额格式，就需要支持 32 位 uid 和 gid。
> +Quota-tools 3.07 及更新版本提供了该支持。请使用上表中推荐版本或更新版本。
> +
> +Intel IA32 微码
> +~~~~~~~~~~~~~~~
> +
> +新增了一个驱动，可用于更新 Intel IA32 微码，并以普通（misc）
> +字符设备的形式提供访问。如果你没有使用udev，则在使用前可能需要以root身份执行::
> +
> +  mkdir /dev/cpu
> +  mknod /dev/cpu/microcode c 10 184
> +  chmod 0644 /dev/cpu/microcode
> +
> +你可能还会希望获取用户空间的 microcode_ctl 工具来配合使用。
> +
> +udev
> +~~~~
> +
> +``udev`` 是一个用户空间程序，用于动态填充 ``/dev``，
> +仅为实际存在的设备创建设备节点。``udev`` 替代了 devfs 的基本功能，
> +同时允许为设备提供持久化命名。
> +
> +FUSE
> +~~~~
> +
> +需要 libfuse 2.4.0 或更高版本。绝对最低要求是 2.3.0，但 mount 选项
> +``direct_io`` 和 ``kernel_cache`` 将无法工作。
> +
> +网络
> +----
> +
> +通用变化
> +~~~~~~~~
> +
> +如果你有较复杂的网络配置需求，应该考虑使用 ip-route2 中的网络工具。
> +
> +包过滤 / NAT
> +~~~~~~~~~~~~
> +
> +数据包过滤和 NAT 代码使用的工具与此前的 2.4.x 内核系列相同（iptables）。
> +它仍然包含与 2.2.x 风格 ipchains 以及 2.0.x 风格ipfwadm 的向后兼容模块。
> +
> +PPP
> +~~~
> +
> +PPP 驱动已经过重构，以支持 multilink 并使其能够运行在多种介质层之上。如
> +果你使用 PPP，请将 pppd 至少升级到2.4.0。
> +
> +如果你没有使用 udev，则必须拥有设备文件 /dev/ppp，可以通过以下命令创建::
> +
> +  mknod /dev/ppp c 108 0
> +
> +需要以 root 身份执行。
> +
> +NFS-utils
> +~~~~~~~~~
> +
> +在很早期的内核（2.4 及更早版本）中，nfs 服务器需要知道哪些客户端希望通
> +过 NFS 访问文件。这些信息会在客户端挂载文件系统时由 ``mountd`` 提供
> +给内核，或者在系统启动时由 ``exportfs`` 提供。exportfs 会从
> +``/var/lib/nfs/rmtab`` 中获取活跃客户端信息。
> +
> +这种方法相当脆弱，因为它依赖于 rmtab 的正确性，而这并不总是容易保证，
> +尤其是在尝试实现故障切换时。即便系统运行正常，``rmtab``
> +也会积累大量从未被移除的旧条目。
> +
> +在现代内核中，我们可以选择让内核在收到未知主机请求时通知 mountd，
> +再由 mountd 将合适的导出信息提供给内核。这样就不再依赖 ``rmtab``，
> +并且内核只需要知道当前活跃的客户端。
> +
> +要启用这一新功能，你需要在运行 exportfs 或 mountd 之前执行::
> +
> +  mount -t nfsd nfsd /proc/fs/nfsd
> +
> +建议尽可能使用防火墙将所有NFS服务与公共互联网隔离。
> +
> +mcelog
> +~~~~~~
> +
> +在x86内核上，如果启用了 ``CONFIG_X86_MCE``，则需要 mcelog 工具来处理和
> +记录机器检查事件。机器检查事件是CPU报告的错误，强烈建议对其进行处理。
> +
> +内核文档
> +--------
> +
> +Sphinx
> +~~~~~~
> +
> +关于Sphinx需求的详细信息，请参阅
> +Documentation/translations/zh_CN/doc-guide/sphinx.rst 中的 :ref:`sphinx_install_zh`。
> +
> +rustdoc
> +~~~~~~~
> +
> +``rustdoc`` 用于为 Rust 代码生成文档。更多信息请参阅
> +Documentation/translations/zh_CN/rust/general-information.rst。
> +
> +获取更新的软件
> +==============
> +
> +内核编译
> +--------
> +
> +gcc
> +~~~
> +
> +- <ftp://ftp.gnu.org/gnu/gcc/>
> +
> +Clang/LLVM
> +~~~~~~~~~~
> +
> +- :ref:`获取 LLVM <zh_cn_getting_llvm>`。
> +
> +Rust
> +~~~~
> +
> +- Documentation/rust/quick-start.rst。
> +
> +bindgen
> +~~~~~~~
> +
> +- Documentation/rust/quick-start.rst。
> +
> +Make
> +~~~~
> +
> +- <ftp://ftp.gnu.org/gnu/make/>
> +
> +Bash
> +~~~~
> +
> +- <ftp://ftp.gnu.org/gnu/bash/>
> +
> +Binutils
> +~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/devel/binutils/>
> +
> +Flex
> +~~~~
> +
> +- <https://github.com/westes/flex/releases>
> +
> +Bison
> +~~~~~
> +
> +- <ftp://ftp.gnu.org/gnu/bison/>
> +
> +OpenSSL
> +~~~~~~~
> +
> +- <https://www.openssl.org/>
> +
> +系统工具
> +--------
> +
> +Util-linux
> +~~~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/utils/util-linux/>
> +
> +Kmod
> +~~~~
> +
> +- <https://www.kernel.org/pub/linux/utils/kernel/kmod/>
> +- <https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git>
> +
> +Ksymoops
> +~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/utils/kernel/ksymoops/v2.4/>
> +
> +Mkinitrd
> +~~~~~~~~
> +
> +- <https://code.launchpad.net/initrd-tools/main>
> +
> +E2fsprogs
> +~~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/>
> +- <https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/>
> +
> +JFSutils
> +~~~~~~~~
> +
> +- <https://jfs.sourceforge.net/>
> +
> +Xfsprogs
> +~~~~~~~~
> +
> +- <https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git>
> +- <https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/>
> +
> +Pcmciautils
> +~~~~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/utils/kernel/pcmcia/>
> +
> +Quota-tools
> +~~~~~~~~~~~
> +
> +- <https://sourceforge.net/projects/linuxquota/>
> +
> +
> +Intel P6 微码
> +~~~~~~~~~~~~~
> +
> +- <https://downloadcenter.intel.com/>
> +
> +udev
> +~~~~
> +
> +- <https://www.freedesktop.org/software/systemd/man/udev.html>
> +
> +FUSE
> +~~~~
> +
> +- <https://github.com/libfuse/libfuse/releases>
> +
> +mcelog
> +~~~~~~
> +
> +- <https://www.mcelog.org/>
> +
> +网络
> +----
> +
> +PPP
> +~~~
> +
> +- <https://download.samba.org/pub/ppp/>
> +- <https://git.ozlabs.org/?p=ppp.git>
> +- <https://github.com/paulusmack/ppp/>
> +
> +NFS-utils
> +~~~~~~~~~
> +
> +- <https://sourceforge.net/project/showfiles.php?group_id=14>
> +- <https://nfs.sourceforge.net/>
> +
> +Iptables
> +~~~~~~~~
> +
> +- <https://netfilter.org/projects/iptables/index.html>
> +
> +Ip-route2
> +~~~~~~~~~
> +
> +- <https://www.kernel.org/pub/linux/utils/net/iproute2/>
> +
> +OProfile
> +~~~~~~~~
> +
> +- <https://oprofile.sf.net/download/>
> +
> +内核文档
> +--------
> +
> +Sphinx
> +~~~~~~
> +
> +- <https://www.sphinx-doc.org/>

