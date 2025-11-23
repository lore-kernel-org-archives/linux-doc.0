Received: from mail-m21468.qiye.163.com (mail-m21468.qiye.163.com [117.135.214.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A42F2144D7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 12:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763899273; cv=none; b=BaLjVT3LFA4khHgClwSbWbuLjh6lYh1AWaUHev7oq9elRRLQXCI0NkL+68wxsNsn9pmDhVNvCdfcVqI7x2TpSrj9ud6EO8rMW5mzUHDivqs1zBcDSye8mnMypSfKQLJKQuPcp4UWbVBp41A0ZR2Z/WeotKiExbp9tEXR/xxmBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763899273; c=relaxed/simple;
	bh=N8HmvUO/jW7hFwZGh8H1Bt6suMviDR9VKvEbcJk1ptE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ndij+OS5fKxTspdlJ9V5bu+yPtNA6BjlqlESDHcYwqbferWkjNFHRiv2VySPgymcgv71YvQbmVw1GQpzE1AgOdN+KtsD1lDAmqlnAlQXXPX7DGNURonNkf+abHjnTZSBhOtv/HfQl7f5OHRWVTr89u2zBQQzmbWjcRCsTsAoAmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=m2kqZByv; arc=none smtp.client-ip=117.135.214.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="m2kqZByv"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a90290f7;
	Sun, 23 Nov 2025 19:56:00 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 07/25] docs/zh_CN: Add functionfs.rst translation
Date: Sun, 23 Nov 2025 19:56:05 +0800
Message-ID: <1344b44f2d90fbb6d464b42f80f6b20a5d9c1fba.1763897036.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763897036.git.baikefan@leap-io-kernel.com>
References: <cover.1763897036.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab092296a09d5kunm2b5c8c0429ada1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSR9DVkodGR5OSUwYTh4eQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=m2kqZByvifl2I7qzAU5VAJnsDgpVwH/Iigbrp0xnqbpwHgm8alEuKJMrPTu/cgLLlvgxXd/NLBFawlWHTQ+54Os6uaqrv3OS7PKSDNcFOaaX0yQEx8KVY7VkrFX8ZrgrNqSuj2VuA7OmRlHANLvYGjIVWqZv/rmYOoAKxSwCnCjYt5VOx4hUvCmH8ynLNxLpXIl6infbhZ4vN8w1x2BZT3QQ2ZS0mfQFz9ZmskZBo4x9g8Qxk25MF3Unn31EQUNrGChTu6C124Ur1nT3oXT8WIKYsIGs0LEETbOfK4YebKU18q7uQjiVayhaHYickHa+YKHH/DGLJ0MC3TaMVyAmoQ==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=WQsrWncTrTfD1VoivFQ4Rc6WKcPjlprsQqm1Iekg1CQ=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/functionfs.rst into Chinese.

Update the translation through commit c26cee817f8b
("usb: gadget: f_fs: add capability for dfu functional descriptor")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 .../translations/zh_CN/usb/functionfs.rst     | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/functionfs.rst

diff --git a/Documentation/translations/zh_CN/usb/functionfs.rst b/Documentation/translations/zh_CN/usb/functionfs.rst
new file mode 100644
index 000000000000..64e50272f9ae
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/functionfs.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/functionfs.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+====================
+FunctionFS的工作原理
+====================
+
+概述
+====
+
+从内核角度来看，它只是一个具有特定行为的复合功能。
+只有在用户空间驱动通过写入描述符和字符串完成注册之后，
+它才能被添加到USB配置中（用户空间程序必须提供与
+内核级复合函数在添加到配置时提供的相同信息）。
+
+这尤其意味着复合初始化函数不能放在init段中（即不能使用__init标签）。
+
+
+从用户空间的角度来看，它是一个文件系统，挂载后会提供一个ep0文件。
+用户空间驱动需要向该文件写入描述符和字符串。
+无需关心端点、接口或字符串编号，只需提供描述符，
+就像该函数是唯一函数一样（端点和字符串编号从 1 开始，接口编号从 0 开始）。
+FunctionFS会根据需要自动修改编号，同时处理不同配置中编号不一致的情况。
+
+有关 FunctionFS 描述符的更多信息，请参见 :doc:`functionfs-desc`
+
+当描述符和字符串写入后，会出现"ep#"文件（每个声明的端点对应一个文件），
+用于单个端点的通信处理。
+同样，FunctionFS会处理实际端点编号及配置变更
+（这意味着ep1文件可能实际映射到端点3，例如，当配置变化时可能映射到端点2）。
+ep0用于接收事件和处理setup请求。
+
+当所有文件关闭时，该函数会自动禁用自身。
+
+此外，FunctionFS 的设计允许多次挂载，因此一个 gadget 可以使用多个 FunctionFS 函数。
+每个 FunctionFS 实例通过挂载时使用的设备名称进行标识。
+
+例如，一个gadget具有以太网（Ethernet）、MTP和HID接口，其中后两个通过FunctionFS实现。
+在用户空间层面，操作可能如下所示::
+
+  $ insmod g_ffs.ko idVendor=<ID> iSerialNumber=<string> functions=mtp,hid
+  $ mkdir /dev/ffs-mtp && mount -t functionfs mtp /dev/ffs-mtp
+  $ ( cd /dev/ffs-mtp && mtp-daemon ) &
+  $ mkdir /dev/ffs-hid && mount -t functionfs hid /dev/ffs-hid
+  $ ( cd /dev/ffs-hid && hid-daemon ) &
+
+在内核层面，gadget会检查ffs_data->dev_name来识别其FunctionFS是为
+MTP（"mtp"还是 HID（"hid"）设计的。
+
+如果未提供 "functions" 模块参数，驱动只接受一个任意名称的函数。
+
+当提供functions模块参数时，只接受列出的名称函数。
+特别是，如果"functions"参数的值只有一个元素，
+则行为类似于未提供 "functions" 时；但只接受具有指定名称的函数。
+
+只有在所有声明的函数文件系统都已挂载，
+并且所有函数的USB描述符都已写入各自的ep0后，gadget才会注册。
+
+相反，当第一个 USB 函数关闭其端点时，gadget 会注销。
+
+DMABUF接口
+==========
+
+FunctionFS还支持基于DMABUF的接口，用户空间可以将外部创建的DMABUF对象附加到端点，
+并随后使用它们进行数据传输。
+
+用户空间应用程序可以使用此接口在多个接口之间共享DMABUF对象，
+允许它以零拷贝的方式传输数据，例如在IIO和USB栈之间。
+作为该接口的一部分，添加了三个新的IOCTL。这三个
+IOCTL必须在数据端点（即非ep0）上执行。它们是：
+
+  ``FUNCTIONFS_DMABUF_ATTACH(int)``
+    将由文件描述符标识的DMABUF对象附加到数据端点。
+    成功返回0，失败返回负errno值。
+
+  ``FUNCTIONFS_DMABUF_DETACH(int)``
+    从数据端点分离给定的DMABUF对象（由文件描述符标识）。
+    成功返回0，失败返回负errno值。
+    注意，关闭端点的文件描述符会自动分离所有已附加的DMABUF。
+
+  ``FUNCTIONFS_DMABUF_TRANSFER(struct usb_ffs_dmabuf_transfer_req *)``
+    将之前附加的DMABUF排入传输队列。
+    参数是一个结构体，其中封装DMABUF的文件描述符、要传输的字节大小
+    （通常应与DMABUF的大小相对应），以及一个当前未使用的'flags'字段。
+    返回0表示成功，返回负errno值表示失败。
-- 
2.52.0

