Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD922CBC6
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883927; cv=none; b=JxCEjGuH+XYtugSRrzP892a1DKivK3p+sDCqsu1W4mg6iZDj7zs/m22qYNGd6sYLGp/BQ2k7G9ktAS+F7w9XbfTbi5GW7TBnt9lRZf/KHOk/6H4ZzZ6QRB1/t0tzwmTVfcwNtPEyzek7WgfB1TzHUvQiHsLlmJTyiD9oLbneo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883927; c=relaxed/simple;
	bh=U6f4nHxpiji3/toI8kZJbtHwoEuXozmPZDVanPCneo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BNedOcHwEst26n+myIs/rNoy4fo9s/mZrwBF5CjUZR7WkabmP3iDBo+r34eNQd2j7nwmMCWYldzH3ywPJl7zFpm8aRYC/ZHb/hc7AWGJZl/FPMVzHi+UrgVO005RtNF7Amci7aZ8Pa6XwxyxlB1MsjqJnd4kKuJCUy/X6+mu+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=rvEaGZm6; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="rvEaGZm6"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99b1;
	Sun, 23 Nov 2025 15:45:15 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 05/25] docs/zh_CN: Add dwc3.rst translation
Date: Sun, 23 Nov 2025 15:45:20 +0800
Message-ID: <20251123074540.34161-6-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafac970909d5kunm0cca7198286617
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ05OVk9MGEpKGE8fGU5MS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=rvEaGZm6kjBJONLpTU3i/QqNEeumbKsgGKJ38hyxc4H9MgU8wRBZvPJA6kzi0LzlvSEz57NwtZ4pnOCr7Bs1MxDh56yvMg8jnvQrgq0xEs0PHE+UmwyWadi9TY6ca4bWmyqZUHuhow0dhuGOIc4TBv1ZQk6F9bLh/Gem6TqjzAfo6KM3LqTOnG330Oi3lcef4tzPD+EqnBHPZK11u/olG+xsEl/SQ+dDBuf/ErHXsBjnAdXmXaPkSTOH6bt16Mfpp2OL9I/JhTSMMQBP/ZI80Zh/Egx+UvYbYjpUvgC+FfzSk4iX5su8/SZYs9liog5C132EJFx3le8g67ZEK86V8Q==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=FSBMJBk6rC7eFWMWsoPUJKmZdHNOgIHNIN/yvgoedcA=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/dwc3.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/dwc3.rst | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst

diff --git a/Documentation/translations/zh_CN/usb/dwc3.rst b/Documentation/translations/zh_CN/usb/dwc3.rst
new file mode 100644
index 000000000000..63ee43278ffe
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/dwc3.rst
@@ -0,0 +1,59 @@
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
+阅读时请随便挑点儿东西做 :)
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
+    提供独立中断，那么这个虚拟的IRQ控制器就可以被硬件真实的端点
+    中断所取代。
+
+  - 中断在调用usb_ep_enable()时申请/分配，在调用usb_ep_disable()时释放。
+    最差的情况是32个中断，最少为ep0/1的两个中断。
+  - dwc3_send_gadget_ep_cmd()将在wait_for_completion_timeout()中休眠到命令完成。
+  - 中断处理程序分为以下几个部分：
+
+    - 设备的中断处理主程序
+      遍历每个事件，对其调用generic_handle_irq()。
+      在generic_handle_irq()返回后，确认事件计数器，使中断最终消失。
+
+    - 设备的中断处理线程
+      无
+
+    - EP中断的处理主程序
+      读取事件并尝试处理它。所有需要休眠的操作都交给线程处理。
+      事件保存在每个端点的数据结构中。
+      需要注意：一旦将某些处理交给线程，就不要在这里继续处理事件，
+      避免出现处理事件X优先级高于Y而X > Y的情况。
+
+    - EP中断的处理线程
+      处理剩余的EP工作，这些工作可能会休眠，例如等待命令完成。
+
+  延迟:
+
+   延迟不应该增加，因为中断线程具有较高优先级，会在用户空间普通任务之前运行
+   （除非用户更改了调度优先级）。
--
2.34.1

