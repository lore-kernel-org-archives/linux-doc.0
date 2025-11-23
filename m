Received: from mail-m19731117.qiye.163.com (mail-m19731117.qiye.163.com [220.197.31.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E128313D
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883936; cv=none; b=E5MOe6rRB0Kj2uthmwsfNyB8aR2HAKD0AWHy5rWWvq34YTgXRETDqqn1Sze6tlSdW1F1ldDeUpolIH6H1ErHxbjWeVKooO6PO4aMY5n904Hh7Iv4ntTYVPOxDGr99gCfXr5NJQcBBiPX0VdcpMOpkA5DZaMpT4brWWkEIh7eVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883936; c=relaxed/simple;
	bh=4ShUc10MinjSj3RPfKZCIHZIfb5gjV9yxL6KSBZPLV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oyth/spxQPY3YwJj1xF9Jd38zwDHRTGdJLVBz2gm0PKSIVIYFoFlEwES220R0nAY6JjpaZjGqtq1Zq7bFCsDlpcgqszDgrt9v2Q2O+nZNBBk8VWY+NDQbLKWwe30PsdQv2L4W91NO1Y45Ep6i5+F3+w3HSADkvkCszwmX5PZNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=KBJ6cvrE; arc=none smtp.client-ip=220.197.31.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="KBJ6cvrE"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99c7;
	Sun, 23 Nov 2025 15:45:25 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 17/25] docs/zh_CN: Add mass-storage.rst translation
Date: Sun, 23 Nov 2025 15:45:32 +0800
Message-ID: <20251123074540.34161-18-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafacbffb09d5kunm0cca719828665e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTR4YVk9LTEIYSx8ZH0JKGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=KBJ6cvrEAeywAM/SEaYaeQ5iaj/Dk66CMMVFBQeNCuc3iD+hrxp20FRY081qpEx0HxAgXUl3R05XN7XtQJjUIVuGeKeoAJAnZxmDyQvVtAxfxiRBDLXztLfOysJ65p2HEoceFgnUrUEz+YlQ4Fy9XaiMmwmJvOEtHTYS6Dqne+/aDMZSfkBwc2/ppe6uEY4TwQ7/cbG28IpOjrvE//bKYD4h+UBdk1fbx+DPQLZx+cAMITXY8lO7Qm8ln0TGwlr1GqqedwC/a+k+0Wvny3gmZgEY5TG/sSQ1tRZyfgt4bYYG2SJ3ekL7bvTHQeQLeGiKRluA+IschY2gxBD1aXA7gQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=Euza916S4tXdJhbIjeaCuDX5e6hfMF6UfTFo2mdRXUQ=;
	h=date:mime-version:subject:message-id:from;

docs/zh_CN: Add mass-storage.rst translation

Update the translation through commit e4157519ad46
("Documentation: usb: correct spelling")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/mass-storage.rst   | 196 ++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/mass-storage.rst

diff --git a/Documentation/translations/zh_CN/usb/mass-storage.rst b/Documentation/translations/zh_CN/usb/mass-storage.rst
new file mode 100644
index 000000000000..2e258ff27af1
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/mass-storage.rst
@@ -0,0 +1,196 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/mass-storage.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+=========================
+大容量存储Gadget (MSG)
+=========================
+
+概述
+====
+
+ 大容量存储Gadget（或MSG）作为USB大容量存储设备，对主机表现为磁盘或CD-ROM驱动器。
+ 它支持多个逻辑单元(LUN)。
+ 每个LUN的后端存储由普通文件或块设备提供，
+ 可以限制为只读，
+ 并且Gadget可以指示其可移动和/或为CD-ROM（后者意味着只读访问）。
+
+  它的需求较低；
+  仅需一个bulk-in和一个bulk-out端点。
+  内存需求为两个16K缓冲区。
+  支持全速、高速和超高速操作。
+
+  注意，该驱动程序在某种程度上具有非移植性，因为它假设
+  一个内存/DMA缓冲区将可用于bulk-in和bulk-out
+  端点。对于大多数设备控制器来说，这不是问题，但
+  可能存在一些硬件限制，一个缓冲区不能
+  被多个端点使用。
+
+  本文档描述了如何从用户态使用该Gadget，
+  它与大容量存储功能(MSF)及使用它的不同Gadget的关系，
+  以及与文件存储Gadget(FSG，
+  已不再包含于Linux)的区别。
+  仅会简要说明如何在复合Gadget中使用MSF。
+
+模块参数
+========
+
+  大容量存储Gadget接受以下大容量存储特定模块参数：
+
+  - file=filename[,filename...]
+
+    此参数列出用于每个逻辑单元后端存储的文件或块设备路径。
+	最多可设置FSG_MAX_LUNS(8)个LUN。
+	如果指定更多文件，将被静默忽略。另见“luns”参数。
+
+    注意 如果使用文件作为后端存储，则该文件不得被其他进程修改。
+	这是因为主机假定数据不会在其不知情的情况下改变。
+	可以读取，但如果逻辑单元可写，由于主机端缓冲，内容未定义。
+
+    逻辑单元大小将向下舍入为完整逻辑块。
+	逻辑块大小为：模拟CD-ROM的LUN为2048字节，
+	后端文件为块设备则为设备块大小，否则为512字节。
+
+  - removable=b[,b...]
+
+    指定每个逻辑单元是否可移动。b为“y”“Y”“1”为真，“n”“N”“0”为假。
+
+    如果逻辑单元可移动，Gadget将接受“弹出”SCSI请求(Start/Stop Unit)。
+	发送时，将关闭后端文件以模拟弹出，
+	在用户态为设备指定新后端文件之前，该逻辑单元不可被主机挂载。
+
+    如果逻辑单元不可移动(默认)，必须在加载模块时通过“file”参数指定后端文件。
+	内置模块同理，无例外。
+
+    默认值为false，但历史上曾为true。
+	现改为false以更好匹配FSG，并且更合理。
+	为了兼容旧内核，最好显式指定默认值。
+	如果依赖旧默认，现在需要显式指定“n”。
+
+    注意，“removable”表示逻辑单元的介质可被弹出或移除（如CD-ROM或读卡器），
+	不表示整个Gadget可从主机拔出；后者正确术语为“hot-unpluggable”。
+
+  - cdrom=b[,b...]
+
+    指定每个逻辑单元是否模拟CD-ROM，默认false。
+
+  - ro=b[,b...]
+
+    指定每个逻辑单元是否只读。防止主机修改后端文件。
+
+    如果标志为false但后端文件无法以读写模式打开，Gadget仍会回退为只读模式。
+
+    非CD-ROM逻辑单元默认false；模拟CD-ROM的逻辑单元强制为true。
+
+  - nofua=b[,b...]
+
+    指定是否在给定逻辑单元的SCSI Write10和Write12命令中忽略FUA标志。
+
+    Windows默认在“优化移除模式”挂载可移动存储。
+	所有写入为同步写，
+	通过在SCSI Write(10,12)命令中设置FUA(Force Unit Access)位实现。
+	这会强制每次写入等待数据实际写出，阻止块层聚合I/O请求，显著降低性能。
+
+    注意，如果设备从USB供电且用户未卸载就拔出设备，数据可能丢失。
+
+    默认值为false。
+
+  - luns=N
+
+    指定Gadget拥有的逻辑单元数，受FSG_MAX_LUNS(8)限制，超出值将被截断。
+
+    如果提供此参数，且“file”参数指定的文件数大于luns值，多余文件将被忽略。
+
+    若未指定，则逻辑单元数根据“file”参数指定的文件数推断；
+	若file参数也缺失，则假定为1。
+
+  - stall=b
+
+    指定是否允许Gadget停止bulk端点。
+    默认值根据USB设备控制器类型确定，但通常为true。
+
+  除上述参数外，Gadget还接受复合框架定义的参数（所有复合Gadget通用，列出如下）：
+
+  - idVendor      -- USB Vendor ID (16 bit integer)
+  - idProduct     -- USB Product ID (16 bit integer)
+  - bcdDevice     -- USB Device version (BCD) (16 bit integer)
+  - iManufacturer -- USB Manufacturer string (string)
+  - iProduct      -- USB Product string (string)
+  - iSerialNumber -- SerialNumber string (string)
+
+sysfs entries
+=============
+
+  对于每个逻辑单元，Gadget在sysfs层级创建目录。目录内创建以下文件：
+
+  - file
+
+    读取返回逻辑单元的后端文件路径。
+	若无后端文件(仅在逻辑单元可移动时可能)，内容为空。
+
+    写入可更改逻辑单元的后端文件。
+	即使逻辑单元不可移动，也可执行此操作（主机可能认为奇怪）。
+	若主机通过Prevent-Allow Medium Removal SCSI命令禁止介质移除，可能失败。
+
+  - ro
+
+    反映逻辑单元的ro标志状态。随时可读，若逻辑单元无后端文件打开，也可写入。
+
+  - nofua
+
+    反映逻辑单元nofua标志状态，可读可写。
+
+  - forced_eject
+
+写入后，将强制从LUN分离后端文件，无论主机是否允许。
+写入内容无关，写入任意非零字节均会导致弹出。
+不可读取。
+
+  其他参数值可从/sys/module/g_mass_storage/parameters/* 读取。
+
+使用大容量存储功能的其他Gadget设备
+========================================
+
+  大容量存储Gadget使用大容量存储功能(MSF)处理存储协议。
+  作为复合功能，MSF也可被其他Gadget使用（如g_multi和acm_ms）。
+
+  前述信息对使用MSF的其他Gadget有效，但可能不支持大容量存储相关模块参数，
+  或参数带前缀。是否适用需查看Gadget文档或源代码。
+
+  想了解如何在Gadget中包含MSF，
+  可参考mass_storage.c、acm_ms.c和multi.c（按复杂度排序）。
+
+与文件存储 Gadget 的关系
+========================
+
+  大容量存储功能(Mass Storage Function)，从而大容量存储Gadget(MSG)，
+  是基于文件存储Gadget(File Storage Gadget)的。
+  两者的区别在于，MSG是复合Gadget（即使用复合框架），而文件存储Gadget是传统Gadget。
+  从用户态的角度来看，这一区别并不重要，
+  但从内核开发者的角度来看，这意味着：
+  (i) MSG不重复处理基本USB协议命令所需的代码
+  (ii) MSF可以在任何其他复合Gadget中使用。
+
+  因此，文件存储Gadget已在Linux 3.8中被移除。
+  所有用户都需要迁移到大容量存储Gadget。
+  两者从外部行为来看大体相同，唯一的区别如下：
+
+  1. 在FSG中，“removable”和“cdrom”模块参数会对所有逻辑单元统一设置标志，
+     而在MSG中，它们接受每个逻辑单元的y/n值列表。
+     如果只使用单个逻辑单元，这无关紧要；
+     但如果有多个逻辑单元，y/n值需要为每个逻辑单元重复指定。
+  2. FSG的“serial”“vendor”“product”和“release”模块参数，
+     在MSG中由复合层的参数分别处理，
+     对应名称为：“iSerialNumber”“idVendor”“idProduct”和“bcdDevice”。
+
+  3. MSG不支持FSG的测试模式，
+     因此FSG的“transport”“protocol”和“buflen”模块参数不被支持。
+     MSG始终使用SCSI协议，采用仅bulk传输模式和16 KiB缓冲区。
--
2.34.1

