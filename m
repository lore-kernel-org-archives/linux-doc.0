Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219243BDD6
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791123786; cv=none; b=Xl9AYms2+7ctiGj+A6/RUcAWQi/GceX1tPazF9pGcFWAqUrAKKw+qF3CIR6QhL3t2a15crtwsZkjyyYlhaUXkJNrdWLgi/DeB13tiDcLfTv51FdmfR8syrO7LRpdPS0UJrc/YJHJI6E7+s709XKaF1F329nRlkIlOkeST4Hjdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791123786; c=relaxed/simple;
	bh=D5oJblw1Mk2D0oXCU0ZAWnjEkCSIw80thnwcJYQpFIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JsSkfSNRIqum6qzNIKsDxJR/HmxP6E+lkZB7d83un/YIAmRtvEFm/BqBDJokAUo+k7Amx+bLAs/fJInmoqvOMMl4LVt+oA/7grlMhA33oQ6BkwsBS0mybc6iu3Tv0tCXByG3RniV/y1FMjmqXEQ1+v3cShZzHg/v2OkhhLgddVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrJoZmMO; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrJoZmMO"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso191105366b.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791123783; x=1791728583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=nrJoZmMOp45M0+Bsh4itLHainNHp8yq9lyofsgw2RgO+t9UI8Ip5Lp5TWrizmbNSUq
         MpHyo9tbhuIhqevdbukMXUIbifvHlgmdof1A201V9fI+hv0hgHxvy0Bam/b3JH/MWm/H
         pp73sSpuOHFtgECWUsisvlxGrLQDDbTnz3fXM613jFJGKuz4MkPe+Nz0V+gC5YU9kXVi
         lcfPWIaK/ALejNBzHXISEw3iOPaB/oD8GnRT4U0VgRiL6vnkEO1gYIhKuGin7B0E2KYV
         AjI04+CcTU6Gc4r5fXE1Qowq3MOEh+q56BSNV46zGfQZDAKZmha39JHsjbmAVWzqTJQP
         mXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791123783; x=1791728583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=q2W/aFpnC8Tunx4Z8JOnBM6Q3WmHQUt+pu4HmiB4L25t4+onPiw6EtL+Hb78grGxhU
         0AT6ZO5jVdJlcjJuG3roXzxq//ePoDvjxZFlWEiLbJjm2HUQRwTuU/jv680+4M3h3keK
         0yPWF5yycBmnA6kqy3/IVNbhvVKDbM5KUlDIpdbixXHHJYKlWusWoIeYT4hv7K6QJimx
         YGZaRMPqr3hzAQnK3GPX7KM96q/v2r/C23tnR0/OvtIxnlDVywARNSDyUgpILbv2S1Dr
         drrqUOURSMhVoPpm3mTLXGrzbXy1havqUcpF5lVop1ndCPYoITq67PrpEMe5qURUKoS8
         Fl0w==
X-Forwarded-Encrypted: i=1; AKwUvBxADo4+i5pmjmo8dArykcCkDBIMkjGnomX8Rl4zHe6NSpXg6L7NvlJDGPpkkvw7rIAu10DuoRf6PxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgxhK2xkC4psZQ47tCPIXsNydtIfKbi2Dym78QNui94fkeIHID
	9gr8GABNgO5ALhIGzvs21yxBg0pTSZmAnVDkdosn8ardH+JggIqD4s4e
X-Gm-Gg: AYBFou3gCozNaC2ArwKzosXQd+ldOGj1q2ezc5A6qVrcKTmnBo/Xz/355ONr8/gZT9j
	i1sR5k+YWzrN22nlTgtUh0ui3CfuEDBbCPaytdxm94m5N6CLLm38OI5wBA9ep3yA1QXD6TCfJy3
	F/sp+pfaoy9lPutQsKxBlLHJKaVJp2YJ/VWoijza8L3CUS/INqbSUjeO6Norvn9QktCgrIsfJYJ
	qo6ybsG5dDwAmW2wzvj//OZpoHSW8T/I4h2heVL0bqNyZjYpnnA/P6/f/W2aXuXd9ZLnp7xA3ju
	fWs/qlNfyQAMmXLcNtTR00XYByiFQpQf/eyaLIjGrkeeY6+gBDKcz3UI2j+JJ8b4MfDbKC49R/S
	3ufkd0V2TRk9/I0Rm4GarB5OeiP2OT+OP+WL1Hkh1Z+yxmJofvp2HTYM/2NfXZzvk1ABPtj60rg
	YS3taBos3m3vazi8pNr/Ic7tlv7i8UOmVvJPp3TNROMUe3VtOzA+mverWXMWh+Hw==
X-Received: by 2002:a17:907:980f:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c2e4aac126fmr651934466b.11.1791123782696;
        Sun, 04 Oct 2026 07:23:02 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac5:303d:28c::41:135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd0457bsm294393366b.15.2026.10.04.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:23:01 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wy@wyuan.org
Subject: [PATCH RESEND v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Sun,  4 Oct 2026 16:22:53 +0200
Message-ID: <20261004142255.25723-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jiaming Ouyang <jiamingouyang13@gmail.com>

Translate Documentation/usb/ohci.rst into Chinese Simplified.

The translation covers OHCI driver overview, hardware protocol
differences (OHCI vs UHCI), improvements since 2.4 kernel,
queueable interrupt transfers, and non-PCI support.

Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
---

Changes in v3:
- Correct the docs list in index.rst
---

Sending this resend because last send is broken.
---
 .../translations/zh_CN/usb/index.rst          |  2 +-
 Documentation/translations/zh_CN/usb/ohci.rst | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/ohci.rst

diff --git a/Documentation/translations/zh_CN/usb/index.rst b/Documentation/translations/zh_CN/usb/index.rst
index df99814c6497..c96eacf13e11 100644
--- a/Documentation/translations/zh_CN/usb/index.rst
+++ b/Documentation/translations/zh_CN/usb/index.rst
@@ -32,6 +32,7 @@ USB 支持
     chipidea
     dwc3
     ehci
+    ohci
     usbmon
 
 待翻译文档：
@@ -49,7 +50,6 @@ USB 支持
 * mass-storage
 * misc_usbsevseg
 * mtouchusb
-* ohci
 * raw-gadget
 * usbip_protocol
 * usb-serial
diff --git a/Documentation/translations/zh_CN/usb/ohci.rst b/Documentation/translations/zh_CN/usb/ohci.rst
new file mode 100644
index 000000000000..5e36831bf370
--- /dev/null
+++ b/Documentation/translations/zh_CN/usb/ohci.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:Original: Documentation/usb/ohci.rst
+
+:翻译: 欧阳家铭 Jiaming Ouyang <jiamingouyang13@gmail.com>
+
+========
+OHCI驱动
+========
+
+2002年8月23日
+
+“OHCI-HCD”驱动程序是一个USB主机控制器程序（HCD），它源自2.4内核系列中的“usb-ohci”
+驱动程序。“usb-ohci”代码主要由 Roman Weissgaerber <weissg@vienna.at>编写但也获
+得了来自David Brownell <dbrownell@users.sourceforge.net>，Linus Torvalds
+和Gregory P. Smith的支持。
+
+它支持“开放主机控制器接口”（OHCI），该接口标准化了用于与USB 1.1主机控制器通信的
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多只能功能
+注入到硬件中。除英特尔和威盛之外的其他供应商的USB1.1控制器通常使用OHCI。
+
+自2.4内核以来的更改包括
+
+         - 提高了健壮性; 修复了错误; 减少了开销
+         - 支持更新和简化的usbcore API
+         - 中断传输可以更大，并且可以排队
+         - 通过使用上层“hcd”框架，减少代码量
+         - 支持一些非PCI的OHCI实现
+         - ... 以及更多
+
+“OHCI-hcd”驱动程序处理所有USB 1.1传输类型。所有类型的传输都可以排队。在“usb-ohci”
+中也是如此，但中断传输除外。以前，使用一帧的周期会因为IRQ处理的开销而导致数据丢
+失的风险。当中断传输排队时，可以通过确保硬件在操作系统处理相关IRQ时始终有传输需要
+处理，来最大限度的降低这些风险。
+
+- David Brownell
+  <dbrownell@users.sourceforge.net>
+
-- 
2.53.0

