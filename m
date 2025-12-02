Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6C311C21
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677537; cv=none; b=Xm1970VoW7MYBejaYRmnSmgh5Pt47gK3GxjRtRu4Ogch/BCEtHSjYk0+3buyGmE+BV1vwvjD0q5EkxUqqXzIPLBjH1o+Sn/Jb0fDYymDtruHOsaEFU7lCXLFBRWk6TePQRaYiA9lXu1+Fouu28D2IF7ejR14lkhtBIyRjGc/z9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677537; c=relaxed/simple;
	bh=WheXOLFqqX7z6YtbXQuO4R7bW7AEymOGFVPNr2JYMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AXuJfFhCRGH8hg3+b477xAdAqV3BnclzQaeDBXZ8+8Ua0wjubB66fNQV+sejuUyo8+51F0uNLuegm46l94EiDbhXvGSoAz5v/Xw4sfI8PZC45XdQocU2KNVdC0H4+ZW46gqW+RU3GB5sYovDZSK/U5osg1QfsxUvsZiEnyTzIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=WoAmf/Cr; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="WoAmf/Cr"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2bb0f2e7a;
	Tue, 2 Dec 2025 19:56:52 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v4 5/8] docs/zh_CN: Add dwc3.rst translation
Date: Tue,  2 Dec 2025 19:56:38 +0800
Message-ID: <f44f47ede4b63979b608b6d5c058442b1b5fa8d6.1764674650.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764674650.git.baikefan@leap-io-kernel.com>
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9adeec303509d5kunm0f4dae893d3f6a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkhCVhofHU8dHUNKT09NH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=WoAmf/CrXTEBvAmRaGBVocCsbCEzWNSZqpqzXxfgAJRtGUpHS41/2NqeRoamepmy0J8xsLf0e+zdVSVIcQ9CZiNlJGj2q3yXsyfgKqWieDHcEss1IXJsuczn4VCopY77hMXYx5KYgk7UUHEqKqO4Riyws/hBbyHorFx1xCgMM0CEdMKBXjzdlhrXxlMb1JNTTVPrTp0wFo1orpBddA/XT+YGL6Rkg9u1ux2dqAjmsJv1lX7pZ+t5OoXNFo7u0vdnHJaQ0mFs3+eFm++13D+DNONNPCGHFB0Wjx8zePRPqRADiWakEa44ZRas+O8LEXVaacIL2HE7k42fFtmJvkBdQg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=n9qXxpaUuEdtmS+BQ29jkzcCuHC/iC547r+912xGp5E=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/dwc3.rst into Chinese

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: Kefan Bai <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/dwc3.rst | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst

diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
new file mode 100644
index 000000000000..700aee545559
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/dwc3.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/dwc3.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+==========
+DWC3 驱动
+==========
+
+
+待完成
+~~~~~~
+
+在你阅读时可以随便挑点儿东西做 :)
+
+- 将中断处理程序转换为基于每端点线程的IRQ
+
+  事实证明，一些DWC3命令大约需要~1ms才能完成。
+  当前代码会一直自旋等待命令完成，这是不好的设计。
+
+  实现思路：
+
+  - DWC core实现了一个用于按端点解复用中断的IRQ控制器。中断号在
+    probe阶段分配，并归属于该设备。如果硬件通过MSI为每个端点
+    提供独立的中断，那么这个虚拟的IRQ控制器就可以被硬件真实的端点
+    中断所取代。
+
+  - 在调用usb_ep_enable()时会申请和分配中断资源，
+    在调用usb_ep_disable()时会释放中断资源。
+    最差的情况是32个中断，最少为ep0/1的两个中断。
+  - dwc3_send_gadget_ep_cmd()将在wait_for_completion_timeout()中休眠到命令完成。
+  - 中断处理程序分为以下几个部分：
+
+    - 设备的中断处理主程序
+      遍历每个事件，对其调用generic_handle_irq()。
+      在generic_handle_irq()返回后，确认事件计数器，最终完成中断处理。
+
+    - 设备的中断处理线程
+      无
+
+    - EP中断的处理主程序
+      读取事件并尝试处理它。所有需要休眠的操作都交给线程处理。
+      事件保存在每个端点的数据结构中。
+      需要注意：一旦把事件交给线程去处理，就要注意不要自己再去处理它，
+      否则可能会导致低优先级的事件先于高优先级事件被处理。
+
+    - EP中断的处理线程
+      处理剩余的EP工作，这些工作可能会导致休眠，例如等待命令完成。
+
+  延迟:
+
+   不应该增加延迟，因为中断线程具有较高优先级，会在用户空间普通任务之前运行
+   （除非用户更改了调度优先级）。
--
2.52.0

