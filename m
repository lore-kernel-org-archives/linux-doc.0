Received: from mail-m1973177.qiye.163.com (mail-m1973177.qiye.163.com [220.197.31.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886822D4DD
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884238; cv=none; b=nXMJy1pBP/rvwifCaUDV4dlwueyeBot23sDJDnrrx5qAuQylEEBD35Na0KaAQJslm17d2AJ7TgIj1/cdwaTq5Tglu/4H59C6b5U2dpDSD75R260mQA/DOZg/P+icoB9PZkSq1BX+ue/4Pe5pFp9ThM5D7CD8JZdgVcnnyvEJ8gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884238; c=relaxed/simple;
	bh=3dlZjAxk7UI6Z2ZoRJwU85RuOz0Jx7FN62/JzmrKBKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kag5lYr0f/6PsmXRhRMx1sothGY2VGyuxabTqhRoW3dn4VkEQqLkVZIDj6g6eDcfjF1oOPdR4QPceOwyWXcok6P47x+eIXSH21wRvUfo9aGC7p/+KLxj6ARP4fH1S7D363Yz2AZyGNcds2Wxk9shBhFwwnNdxIIPv/j/KH/y+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=CsO/kYn6; arc=none smtp.client-ip=220.197.31.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="CsO/kYn6"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99b8;
	Sun, 23 Nov 2025 15:45:18 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 09/25] docs/zh_CN: Add gadget_configfs.rst translation
Date: Sun, 23 Nov 2025 15:45:24 +0800
Message-ID: <20251123074540.34161-10-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
References: <20251123074540.34161-1-baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aafaca3b909d5kunm0cca7198286627
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaH08dVh5JHh9LQh8ZHkxPTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=CsO/kYn6r++5oQcCZVT1PYaW/05Gya+GBT+4pyQWgzNjqv7JuunBznC/ONjDSfA+nss/N40l92c1LTCDmd7x6IXtcSzNopAdoNqQSBWfIxDcG/gtJal8gGJJAmhBuhYnGcGyZKcfrQy5jfXU29tbX4ZqNnj38srxpkTIheT3ekVlnv3Sc860+UrHGEX6MiMSm2crqr7CCVOEIZazwJXdq6c5r1pUe55gQg1mQOy1p4rI62WnecZ4Adm1l+mXHPeLeCC8UGQXY4USl0PNHbJEEyiwywC/hZkNsnWdsTMa9dkVTF75gE/MBeDLJ5Mif2LhGu6MD48OKQDlCItGYgWW8A==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=Hh+vJF7n5rpDFA3Svfqp0UsrOJo4V5wKNNxxEsgK8KI=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/gadget_configfs.rst into Chinese.

Update the translation through commit 58992bf32830
("Documentation: usb: gadget: Wrap remaining usage snippets in literal code block")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../zh_CN/usb/gadget_configfs.rst             | 383 ++++++++++++++++++
 1 file changed, 383 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/gadget_configfs.rst

diff --git a/Documentation/translations/zh_CN/usb/gadget_configfs.rst b/Documentation/translations/zh_CN/usb/gadget_configfs.rst
new file mode 100644
index 000000000000..6001020f89ca
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/gadget_configfs.rst
@@ -0,0 +1,383 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/gadget_configfs.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=====================================
+通过configfs配置的Linux USB gadget
+=====================================
+
+2013年4月25日
+
+概述
+====
+
+USB Linux Gadget是一种拥有UDC（USB设备控制器）的设备，
+可以连接到USB主机，为其扩展附加功能，例如串口或大容量存储功能。
+
+从主机的角度来看，一个gadget表现为一组配置，每个配置包含若干接口，
+从gadget的角度来看，这些接口被称为函数（function），
+每个函数代表例如一个串行连接或一个SCSI磁盘。
+
+Linux为gadget提供了若干可用函数。
+
+创建一个gadget意味着要决定将有哪些配置，以及每个配置将提供哪些函数。
+
+Configfs（请参见 `Documentation/filesystems/configfs.rst`）非常适合用于
+告诉内核上述决策。本文档介绍了如何实现这一操作。
+
+同时，它还描述了configfs与gadget集成的设计方式。
+
+
+
+要求
+=====
+
+为了使其工作，configfs必须可用，因此在.config中CONFIGFS_FS必须为'y' 或 'm'。
+截至本文撰写时，USB_LIBCOMPOSITE会选择CONFIGFS_FS。
+
+
+
+使用方法
+========
+
+::
+
+	$ modprobe libcomposite
+	$ mount none $CONFIGFS_HOME -t configfs
+
+其中CONFIGFS_HOME是configfs的挂载点
+
+1. 创建gadget
+-------------
+
+对于每个要创建的gadget，必须创建其对应的目录::
+
+	$ mkdir $CONFIGFS_HOME/usb_gadget/<gadget name>
+
+例如::
+
+	$ mkdir $CONFIGFS_HOME/usb_gadget/g1
+
+	...
+	...
+	...
+
+	$ cd $CONFIGFS_HOME/usb_gadget/g1
+
+每个gadget需要指定其厂商ID <VID>和产品ID <PID>::
+
+	$ echo <VID> > idVendor
+	$ echo <PID> > idProduct
+
+gadget还需要其序列号、厂商和产品字符串。
+为了有地方存放它们，需要为每种语言创建一个 strings 子目录，例如::
+
+	$ mkdir strings/0x409
+
+然后可以指定这些字符串::
+
+	$ echo <serial number> > strings/0x409/serialnumber
+	$ echo <manufacturer> > strings/0x409/manufacturer
+	$ echo <product> > strings/0x409/product
+
+进一步的自定义字符串描述符可以作为语言目录下的子目录创建，
+字符串文本写入该字符串目录下的"s"属性::
+
+	$ mkdir strings/0x409/xu.0
+	$ echo <string text> > strings/0x409/xu.0/s
+
+在函数驱动支持的情况下，函数可能允许这些自定义字符串描述符的符号链接，
+用以将这些字符串与类描述符关联。
+
+2. 创建配置
+-----------
+
+每个gadget将由多个配置组成，必须创建其对应的目录::
+
+        $ mkdir configs/<name>.<number>
+
+其中 <name> 可以是任何在文件系统中合法的字符串，
+<number> 是该配置的编号，例如::
+
+	$ mkdir configs/c.1
+
+	...
+	...
+	...
+
+每个配置也需要字符串，因此必须为每种语言创建一个子目录，例如::
+
+	$ mkdir configs/c.1/strings/0x409
+
+然后可以指定配置字符串::
+	$ echo <configuration> > configs/c.1/strings/0x409/configuration
+
+某些属性也可以为配置设置，例如::
+
+	$ echo 120 > configs/c.1/MaxPower
+
+3. 创建函数
+-----------
+
+gadget 将提供若干函数，为每个函数必须创建其对应的目录::
+
+	$ mkdir functions/<name>.<instance name>
+
+其中 <name> 对应于允许的函数名称之一，而 instance name
+是一个在文件系统中允许的任意字符串，例如::
+
+  $ mkdir functions/ncm.usb0 # usb_f_ncm.ko gets loaded with request_module()
+
+  ...
+  ...
+  ...
+
+每个函数提供其特定的一组属性，可读或可写。
+在适用的情况下，需要根据具体情况对其进行写入。
+更多信息请参考 Documentation/ABI/testing/configfs-usb-gadget。
+
+4. 将函数与其配置关联
+----------------------
+
+此时已创建若干 gadget，每个 gadget 都指定了若干配置并具有若干可用函数。
+接下来需要指定哪些函数在何种配置中可用（同一个函数可用于多个配置）。
+这是通过创建符号链接实现的::
+
+	$ ln -s functions/<name>.<instance name> configs/<name>.<number>
+
+例如::
+
+	$ ln -s functions/ncm.usb0 configs/c.1
+
+	...
+	...
+	...
+
+5. 启用 gadget
+--------------
+
+以上所有步骤的目的是组合 gadget 的配置和函数。
+
+一个示例目录结构可能如下所示::
+
+  .
+  ./strings
+  ./strings/0x409
+  ./strings/0x409/serialnumber
+  ./strings/0x409/product
+  ./strings/0x409/manufacturer
+  ./configs
+  ./configs/c.1
+  ./configs/c.1/ncm.usb0 -> ../../../../usb_gadget/g1/functions/ncm.usb0
+  ./configs/c.1/strings
+  ./configs/c.1/strings/0x409
+  ./configs/c.1/strings/0x409/configuration
+  ./configs/c.1/bmAttributes
+  ./configs/c.1/MaxPower
+  ./functions
+  ./functions/ncm.usb0
+  ./functions/ncm.usb0/ifname
+  ./functions/ncm.usb0/qmult
+  ./functions/ncm.usb0/host_addr
+  ./functions/ncm.usb0/dev_addr
+  ./UDC
+  ./bcdUSB
+  ./bcdDevice
+  ./idProduct
+  ./idVendor
+  ./bMaxPacketSize0
+  ./bDeviceProtocol
+  ./bDeviceSubClass
+  ./bDeviceClass
+
+
+这样的gadget必须最终被启用，以便USB主机能够枚举它。
+
+为了启用gadget，必须将其绑定到一个UDC（USB Device Controller）::
+
+	$ echo <udc name> > UDC
+
+其中 <udc name> 是 /sys/class/udc/* 中的一个，例如::
+
+	$ echo s3c-hsotg > UDC
+
+
+6. 禁用 gadget
+--------------
+
+::
+
+	$ echo "" > UDC
+
+7. 清理
+-------
+
+从配置中移除函数::
+
+	$ rm configs/<config name>.<number>/<function>
+
+其中 <config name>.<number> 指定配置，
+<function> 是从配置中移除的函数的符号链接，例如::
+
+	$ rm configs/c.1/ncm.usb0
+
+	...
+	...
+	...
+
+移除配置中的strings目录::
+
+	$ rmdir configs/<config name>.<number>/strings/<lang>
+
+例如::
+
+	$ rmdir configs/c.1/strings/0x409
+
+	...
+	...
+	...
+
+然后移除配置::
+
+    $ rmdir configs/<config name>.<number>
+
+例如::
+
+    $ rmdir configs/c.1
+
+    ...
+    ...
+    ...
+
+移除函数（函数模块不会被卸载）::
+
+	$ rmdir functions/<name>.<instance name>
+
+例如::
+
+    $ rmdir functions/ncm.usb0
+
+    ...
+    ...
+    ...
+
+移除 gadget 中的 strings 目录::
+
+	$ rmdir strings/<lang>
+
+例如::
+	$ rmdir strings/0x409
+
+最后移除 gadget::
+
+	$ cd ..
+	$ rmdir <gadget name>
+
+例如::
+
+	$ rmdir g1
+
+
+
+
+实现设计
+===========
+
+下面介绍configfs的工作原理。
+在configfs中，有items和groups，二者都以目录的形式呈现。
+它们的区别在于group可以包含其他groups。
+下面的图中只展示了一个item。items和groups均可具有attributes，
+这些属性以文件的形式呈现。
+用户可以创建和删除目录，但不能删除文件；
+这些文件可能是只读或可读写的，具体取决于其代表的内容。
+
+configfs 的文件系统部分操作的是 config_items/groups 和
+configfs_attributes，它们是通用的，对于所有配置的元素类型相同。
+然而，它们被嵌入到用途特定的更大结构中。
+在下面的图中，有一个包含 config_item 的 “cs”，
+以及一个包含 configfs_attribute 的 “sa”。
+
+文件系统视图如下所示::
+
+  ./
+  ./cs        (directory)
+     |
+     +--sa    (file)
+     |
+     .
+     .
+     .
+
+每当用户读/写 “sa” 文件时，就会调用一个函数，
+该函数接收一个 struct config_item 和一个 struct configfs_attribute。
+在该函数中，使用众所周知的 container_of 技巧获取 “cs” 和 “sa”，
+然后调用适当的 sa 的函数（show 或 store），
+并传入 “cs” 和一个字符缓冲区。
+“show” 用于显示文件内容（将数据从 cs 复制到缓冲区），
+而 “store” 用于修改文件内容（将数据从缓冲区复制到 cs），
+但具体执行内容由实现者自行决定。
+
+::
+
+  typedef struct configured_structure cs;
+  typedef struct specific_attribute sa;
+
+                                         sa
+                         +----------------------------------+
+          cs             |  (*show)(cs *, buffer);          |
+  +-----------------+    |  (*store)(cs *, buffer, length); |
+  |                 |    |                                  |
+  | +-------------+ |    |       +------------------+       |
+  | | struct      |-|----|------>|struct            |       |
+  | | config_item | |    |       |configfs_attribute|       |
+  | +-------------+ |    |       +------------------+       |
+  |                 |    +----------------------------------+
+  | data to be set  |                .
+  |                 |                .
+  +-----------------+                .
+
+文件名由 config item/group 的设计者决定，
+而目录一般可以任意命名。
+一个group可以拥有若干其默认子group，由系统自动创建。
+
+有关configfs的更多信息请参阅
+`Documentation/filesystems/configfs.rst`.
+
+上述概念应用到USB gadgets时对应如下：
+
+1. 一个 gadget 有其 config group，其中包含一些属性（idVendor、
+   idProduct 等）和默认子 group（configs、functions、strings）。
+   向这些属性写入会导致信息被存储到合适的位置。
+   在 configs、functions 和 strings 子 group 中，用户可以创建
+   其子 group 以表示配置、功能以及某种语言下的一组字符串。
+
+2. 用户创建 configurations 和 functions，并在 configurations 中
+   创建指向 functions 的符号链接。
+   当 gadget 的 UDC 属性被写入时，也就是将 gadget 绑定到 UDC 时，
+   这些信息将被使用。
+   drivers/usb/gadget/configfs.c 中的代码会遍历所有 configurations，
+   并在每个 configuration 中遍历所有 functions 并绑定它们。
+   这样整个 gadget 就被绑定了。
+
+3. 文件 drivers/usb/gadget/configfs.c 包含以下代码：
+
+	- gadget的config_group
+	- gadget的默认 groups (configs, functions, strings)
+	- 将 functions 与 configurations 关联（符号链接）
+
+4. 每个 USB function 自然拥有其希望被配置的视图，
+   因此特定 functions 的 config_groups 定义在各自的
+   functions 实现文件 drivers/usb/gadget/f_*.c 中。
+
+5. function 的代码是这样编写的：它使用 usb_get_function_instance()，
+   该函数会调用 request_module。
+   因此，只要 modprobe 可以正常工作，特定 function 的模块就会自动加载。
+   请注意反向并不成立：在 gadget 被禁用并拆除之后，这些模块仍然保持加载状态。
--
2.34.1

