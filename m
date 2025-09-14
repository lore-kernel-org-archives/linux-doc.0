Received: from mail-m15567.qiye.163.com (mail-m15567.qiye.163.com [101.71.155.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C91B85F8
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757854942; cv=none; b=FFXgZhXmNaTV1zxzQEl1Ss2ZJQAC6d4g9haSFCLT9eef60bXbdOe84pabKA8scRqJRj7Iu//buemU4IrVMXJiWQnepBNOyXjOldboAhi0amF6/AR8R0OaeL8t69zK7gSzIIn4vYIASlDG8jeCKNNSjriEKWSP2yeNn4u2a3rH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757854942; c=relaxed/simple;
	bh=EZtCjHL8ws9ObDjDoMVg4O8VbeMgXZgrLqRPjZxPB2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8zNXHhO/m24V0cC5fFYAy/ld9nr14jU1I0icZ40FWNmUw3Q9kLn1suQRCMviBpp+fhP2vsVOkcR5HuzOiVi2EPltbbr+oFPdwnT7dwVxSS2RloowrRt/Cv+G+Yv6t1G6sCVYo6Vin9Y7KJx1U/T8wEbAAdygp4PYm1nlyJ/L3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=FECYJ+kL; arc=none smtp.client-ip=101.71.155.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="FECYJ+kL"
Received: from localhost.localdomain (unknown [120.246.23.60])
	by smtp.qiye.163.com (Hmail) with ESMTP id 22b62fc49;
	Sun, 14 Sep 2025 10:52:11 +0800 (GMT+08:00)
From: doubled <doubled@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/7] docs/zh_CN: Add scsi.rst translation
Date: Sun, 14 Sep 2025 10:52:03 +0800
Message-Id: <0032a24782119ea2900fc38dabcb7e58ba627b90.1757686158.git.doubled@leap-io-kernel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1757686158.git.doubled@leap-io-kernel.com>
References: <cover.1757686158.git.doubled@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a994623207f09cckunmff566153890532
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUxPVkNKQ0oYTkJIHUJDTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUtVSU9NVUlIVU1LWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=FECYJ+kLGeotKXKx7yDGELdDGsK44VTJ5Kcgi7GjVe6W7UM2sPBwzq25fO07CWhhmLHYxDciP0Zd+NGLhwxAeqUjcZpEtofzWA1fqpzhXgha53Ebeta8jJ79OPPZGykixM6v8zaFi0eCtiTFWzacfYSQTvrBUM/cR4HEIZ75aF9zu1Lqr0/3X+B3Ib4Cqh9Mrpvvcs96UrRhTktU6EsW9nJQyRWipbaiByKqeQs29kPGX0O4SwesAv+/GWyE4vC0KbJleBf6bililER4aA9AJw1JAoSf9Jaggy6nvW+yksaNkfAiCaBpv8K/oCg7sRKzQHGiEhpgYTNzmK4/3uqRaw==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=sGG4utjqV/JKX6V1HLP86YN9pOqyaN4SFRPXQBGnMcY=;
	h=date:mime-version:subject:message-id:from;

Translate .../scsi/scsi.rst into Chinese.
Add scsi into .../scsi/index.rst.

Update the translation through commit c4e672ac8c49
("scsi: docs: introduction: Multiple cleanups")

Signed-off-by: doubled <doubled@leap-io-kernel.com>
---
 .../translations/zh_CN/scsi/index.rst         |  4 +-
 .../translations/zh_CN/scsi/scsi.rst          | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/scsi.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentation/translations/zh_CN/scsi/index.rst
index 9126a642e43a..ce3a7741d941 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -24,9 +24,7 @@ SCSI子系统
 .. toctree::
    :maxdepth: 1
 
-Todolist:
-
-* scsi
+   scsi
 
 SCSI驱动接口
 ============
diff --git a/Documentation/translations/zh_CN/scsi/scsi.rst b/Documentation/translations/zh_CN/scsi/scsi.rst
new file mode 100644
index 000000000000..5d6e39c7cbb5
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/scsi.rst
@@ -0,0 +1,48 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/scsi.rst
+
+:翻译:
+
+ 郝栋栋 doubled <doubled@leap-io-kernel.com>
+
+:校译:
+
+
+
+==============
+SCSI子系统文档
+==============
+
+Linux文档项目（LDP）维护了一份描述Linux内核（lk） 2.4中SCSI
+子系统的文档。请参考：
+https://www.tldp.org/HOWTO/SCSI-2.4-HOWTO 。LDP提供单页和
+多页的HTML版本，以及PostScript与PDF格式的文档。
+
+在SCSI子系统中使用模块的注意事项
+================================
+Linux内核中的SCSI支持可以根据终端用户的需求以不同的方式模块
+化。为了理解你的选择，我们首先需要定义一些术语。
+
+scsi-core（也被称为“中间层”）包含SCSI支持的核心。没有他你将
+无法使用任何其他SCSI驱动程序。SCSI核心支持可以是一个模块（
+scsi_mod.o），也可以编译进内核。如果SCSI核心是一个模块，那么
+他必须是第一个被加载的SCSI模块，如果你将卸载该模块，那么他必
+须是最后一个被卸载的模块。实际上，modprobe和rmmod命令将确保
+SCSI子系统中模块加载与卸载的正确顺序。
+
+一旦SCSI核心存在于内核中（无论是编译进内核还是作为模块加载），
+独立的上层驱动和底层驱动可以按照任意顺序加载。磁盘驱动程序
+（sd_mod.o）、光盘驱动程序（sr_mod.o）、磁带驱动程序 [1]_
+（st.o）以及SCSI通用驱动程序（sg.o）代表了上层驱动，用于控制
+相应的各种设备。例如，你可以加载磁带驱动程序来使用磁带驱动器，
+然后在不需要该驱动程序时卸载他（并释放相关内存）。
+
+底层驱动程序用于支持您所运行硬件平台支持的不同主机卡。这些不同
+的主机卡通常被称为主机总线适配器（HBAs）。例如，aic7xxx.o驱动
+程序被用于控制Adaptec所属的所有最新的SCSI控制器。几乎所有的底
+层驱动都可以被编译为模块或直接编译进内核。
+
+.. [1] 磁带驱动程序有一个变种用于控制OnStream磁带设备。其模块
+	   名称为osst.o 。
-- 
2.25.1

