Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com [220.197.32.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D12221ADA7
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 07:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763883938; cv=none; b=jOOBK3HOaxYW+OWnstMgWh8wJZAXAB+nuaZBXfe1YgwVl/yH+t/3r2BCFe2TI+hOmYr3JP5VvsVp/cHJnNoBzCOurSogWz+psn0QkZxk6pqspaPpfHTzt6jxCOLdWFSkxIUVOKrlAi+ZzDlNXGflPEPQTkUmTr6AnMjgzneifTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763883938; c=relaxed/simple;
	bh=CqOkr5x5Puvl88/oBWAG3LIbRjx121dEF9aqwLoGij0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZ8XXak7pZkFx1XdP2kN1EruztmwXPcpPmmdYsEeLWkXCqShKQ31D+iiHgZwNyeORWdnpl97e18Bspnu9eSvcGQS1UrGkbkHbOfwxWQJzrRP/2BqJSoZzILaVM8XllgN+x4znLMj20eEQh1vQYWfn+/wdpBUgJUXvZrpVhocXf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=abSuKkEy; arc=none smtp.client-ip=220.197.32.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="abSuKkEy"
Received: from server001 (unknown [1.203.157.252])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a8df99ce;
	Sun, 23 Nov 2025 15:45:27 +0800 (GMT+08:00)
From: macrofun <baikefan@leap-io-kernel.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 20/25] docs/zh_CN: Add ohci.rst translation
Date: Sun, 23 Nov 2025 15:45:35 +0800
Message-ID: <20251123074540.34161-21-baikefan@leap-io-kernel.com>
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
X-HM-Tid: 0a9aafacc88709d5kunm0cca7198286671
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUlIVk8ZGENCGR9JGE1JGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUlLSFVKTkxVSU5JWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=abSuKkEyYvhIzx22wHj9dSlJIjFO6LfKbGzUVZJaiV+jY1bdwekmzkirVEOIyEnIt7IMpNeOwRlNUP/TM9LTPDshruPyJunasLEhi/XQev3g982U1+q5FSZrL3xXoTcXYprsfW6WB8Y101jSZClfoJdCICA/R/wgUGzuiqTg6LGUfnWOueGLbHndgcrvn3mtJYIxOHMVUEtu05/4tbYJYT2WGIy0ULgBBnBCr7yvN+FR1l+aNKsaRphfXednZWzxTfJrtD1WIbcoRVuNsiAEiXNIT/rSvt1lAAi9/O6xkSR9Tyu0lpu+FDjezy4UjER1toR3xLZsHi+E1LUSUj4hDg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=EiR/u+gHU3bd3NCCr0Xyw5VrrFHEZxCDlrgU/LR6hDk=;
	h=date:mime-version:subject:message-id:from;

Translate .../usb/ohci.rst into Chinese.

Update the translation through commit ecefae6db042
("docs: usb: rename files to .rst and add them to drivers-api")

Signed-off-by: macrofun <baikefan@leap-io-kernel.com>
---
 Documentation/translations/zh_CN/usb/ohci.rst | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst

diff --git a/Documentation/translations/zh_CN/usb/ohci.rst b/Documentation/translations/zh_CN/usb/ohci.rst
new file mode 100644
index 000000000000..62bd8070a25e
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/ohci.rst
@@ -0,0 +1,46 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/usb/ohci.rst
+:翻译:
+
+ 白钶凡 Kefan Bai <baikefan@leap-io-kernel.com>
+
+:校译:
+
+
+
+====
+OHCI
+====
+
+2002年08月23日
+
+“ohci-hcd”驱动是一个USB主控制器驱动（HCD），
+源自2.4内核系列中的“usb-ohci”驱动。
+“usb-ohci”代码主要由Roman Weissgaerber weissg@vienna.at
+编写，但也有许多其他人的贡献（详见其版权/许可头）。
+
+它支持“开放主机控制器接口”（OHCI），
+该接口标准化了用于与USB 1.1主控制器通信的硬件寄存器协议。
+与早期的英特尔“通用主机控制器接口”（UHCI）相比，它将更多智能推入硬件。
+除Intel和VIA之外的USB 1.1控制器通常使用OHCI。
+
+自2.4内核以来的改进包括：
+
+	- 提高了稳定性；修复了漏洞；降低了开销
+	- 支持更新和简化的usbcore API
+	- 中断传输可以更大，并且可以排队
+	- 通过使用上层的"hcd"框架，代码更少
+	- 支持某些非PCI实现的OHCI
+	- ... 更多
+
+“ohci-hcd”驱动处理所有类型的USB 1.1传输。
+所有类型的传输都可以排队。
+这在“usb-ohci”中也适用，但中断传输除外。
+以前，如果使用一个帧周期，会因IRQ处理的开销而有数据丢失的风险。
+当中断传输排队时，
+可以通过确保硬件在操作系统处理相关IRQ时始终有传输任务来最小化这些风险。
+
+- David Brownell
+  <dbrownell@users.sourceforge.net>
--
2.34.1

