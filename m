Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976A6C49361
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 10:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 723D361153
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 10:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhFTKnP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Jun 2021 06:43:15 -0400
Received: from m32-153.88.com ([43.250.32.153]:29590 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229558AbhFTKnN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 20 Jun 2021 06:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=CRrh1Y/4+Z9AoE6w2oPEMgbmnYHiO3cHJFUOD
        eMPhqk=; b=BPpuoY6JONXaHBOU57pNot4pnRcanqLgMhT2+oQvPqvGZTIWn/aYf
        iGRguTA0KjOe7I3E63CRz1mcbjMSB+OGaS/dyByKwM3gnbTY+7H83R3+XxZw6SxT
        Xglvi5+JxsxbRGAVsQtFi00jN+bybGJEU0w3ZhilrGVT1CwxhVRX/c=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgB3Tv0zG89gb1YgAA--.3185S2;
        Sun, 20 Jun 2021 18:40:53 +0800 (CST)
Date:   Sun, 20 Jun 2021 18:40:50 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 1/2] docs/zh_CN: Add translation
 zh_CN/admin-guide/efi-stub.rst
Message-ID: <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
References: <cover.1624169811.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1624169811.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgB3Tv0zG89gb1YgAA--.3185S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1DWr4kAF4xAF4UZry7Jrb_yoW7CrW7pF
        ZIkrWSg3WxGryYkry8KF47Wr1UJFySgFZIg3W8G3WrXr1SvFWkt342qryrG3s7Wry8Aayk
        XFs3tryfCw10vw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gw1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07UjLvtUUUUU=
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new translation
  Documentation/translations/zh_CN/admin-guide/efi-stub.rst
and link it to zh_CN/admin-guide/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/admin-guide/efi-stub.rst            | 86 +++++++++++++++++++
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/efi-stub.rst b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
new file mode 100644
index 000000000000..b6a4cedec8eb
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
@@ -0,0 +1,86 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/efi-stub.rst
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+=========
+EFI引导桩
+=========
+
+在x86和ARM平台上，内核zImage/bzImage可以伪装成PE/COFF映像，从而使EFI固件加载
+程序加载其作为EFI可执行文件。修改bzImage头以及固件加载程序跳转特定入口点的
+代码被统称为“EFI引导桩（EFI Boot Stub）”，分布在arch/x86/boot/header.S和
+arch/x86/boot/compressed/eboot.c中。对于ARM，EFI桩在arch/arm/boot/compressed/efi-header.S
+和arch/arm/boot/compressed/efi-stub.c中实现。体系结构之间共享的EFI桩代码
+位于drivers/firmware/efi/libstub中。
+
+而arm64没有压缩内核支持，因此映像本身伪装成PE/COFF映像，EFI桩链接到内核。
+arm64 EFI桩位于arch/arm64/kernel/EFI entry.S和drivers/firmware/efi/libstub/arm64-stub.c
+中。
+
+通过使用EFI引导桩，可以在不使用传统EFI引导加载程序的情况下引导Linux内核，
+如grub或elilo。由于EFI引导桩执行了引导加载程序的工作，因此某种意义上来说
+它 *就是* 引导加载程序。
+
+EFI引导桩通过CONFIG_EFI_STUB内核选项启用。
+
+
+如何安装bzImage.efi
+-------------------
+
+位于arch/x86/boot/bzImage中的bzImage必须复制到EFI系统分区（ESP）并修改扩展名
+为“.efi”。没有扩展名的话EFI固件加载程序将拒绝执行它。尚无法从普通的Linux文件
+系统中执行bzImage.efi，因为EFI固件不支持这些文件系统。ARM平台需要将arch/arm/boot/zImage
+复制到系统分区，并可能无需重命名；arm64也类似，需要复制arch/arm64/boot/Image，
+但不一定要重命名。
+
+
+从EFI shell传递内核参数
+-----------------------
+
+内核参数可于bzImage.efi之后传递，例如::
+
+	fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
+
+
+“initrd=”选项
+-------------
+
+与大多数引导加载程序一样，EFI桩允许用户使用“initrd=”选项指定多个initrd文件。
+这是唯一的EFI桩特殊特命令行参数，其他所有内容都在将内核启动时传递给内核。
+
+initrd文件的路径必须为从ESP开始的绝对路径，相对路径无法使用。同时此路径为EFI
+风格，目录元素必须用反斜杠（\）分隔。例如给定以下目录布局::
+
+  fs0:>
+	Kernels\
+			bzImage.efi
+			initrd-large.img
+
+	Ramdisks\
+			initrd-small.img
+			initrd-medium.img
+
+现工作目录为fs0:\Kernels，要使用initrd-large.img文件引导，则须使用以下命令::
+
+	fs0:\Kernels> bzImage.efi initrd=\Kernels\initrd-large.img
+
+请注意bzImage.efi是怎样可用相对路径指定的。那是因为我们执行的映像是由EFI shell
+解释的，它可解析相对路径，而命令行的其余部分则传递给bzImage.efi。
+
+
+“dtb=”选项
+----------
+
+对于ARM和arm64体系结构，必须为内核提供一个设备树。通常固件应通过EFI CONFIGURATION
+TABLE（EFI配置表）来支持设备树。但是“dtb=”命令行选项可以用于覆盖固件提供的设备
+树，或在固件无法提供时来提供一个设备树。
+
+请注意：固件将在启动内核之前将运行时配置信息添加到设备树。如果 ``dtb=`` 被用来
+覆盖设备树，则固件提供的任何运行时数据都将丢失。 ``dtb=`` 选项应只用作调试工具，
+或者在EFI CONFIGURATION TABLE中未提供设备树时作为最后的手段。
+
+“dtb=”的处理方式与上述“initrd=”选项相同。
diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 460034cbc2ab..d74f5e864898 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -65,6 +65,7 @@ Todolist:
 
    clearing-warn-once
    cpu-load
+   efi-stub
    lockup-watchdogs
    unicode
 
@@ -87,7 +88,6 @@ Todolist:
    dell_rbu
    device-mapper/index
    edid
-   efi-stub
    ext4
    nfs/index
    gpio/index
-- 
2.20.1

