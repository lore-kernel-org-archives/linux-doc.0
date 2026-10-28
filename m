Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172411;
	b=qIUuLpMGs0s3qcvx4uEJ16ueuoCxj9vIO64zj/gE5R5M/DyDY4OF8pUojesbqT05syrI
	 R4FDGQdjEWdLr78wd1d+ZszdiVTz2IGlFjQBS6yU7fURQ+M9DN/+Vkob/gPDsv+g4+1Pr
	 VmrQCWEKvzKSGrweZFr8y1jkV0MRO4n7/c5kTCWZxNKimzFwjx/FrQnZ+bb7NoghxD49g
	 cokL+qBVzNY4HIKGisH5P86w7kwBQI18mqgwNQPDmDqHvZ7R0v9lwo6IFQ2W13IHJLfWk
	 DQU1X1+UmGMS5+Ndoxgrr0xrcQMVE8O8FE4EzA2zsiawZVy5d/mIUXDM2HBut9pCxDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
	b=xe8qJUN6jQBi7EL4MtS+a4BAoaFcK0yaREAfQGqRJ8tOZMBYU40YvLaWxPvGyJj3DXgJ
	 ILD6nyQFFlWgEitRMLWZcxVEHGuEe26Ry7lwh0WG9Q9HEE0zyB878kxD3Ly1A2eQDKFDT
	 u7seGQKtmN9Wfz4we5wGXK8Egym8+26++BrcD0RahcREc9yVDuYA/3eqYabqu/TuKOJ6+
	 Yay/MbQhW+B5l5DZTDaKB3ejkR2ZipOTnS0ewiEsrYTsShIEMgzw+veUykkmzezanVBNt
	 sujo70wGhCwzStUfyFuil9+MgZn7ClqTeIS2moATzx40X+3kiZtN/FVLn3gONKkDvVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTxc01Xt;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954D606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 07:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E954D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTxc01Xt
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4395d31228so91141666b.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172409; x=1793777209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=KTxc01XtexAWBJr6OrZOfuAvgMg+gEOwA5+7/Mcz13J4YoEvTeIaMOw/5roWGCi8Q5
         k5OtJRjb+W2CttkG8CkChCJRu/be7C/QHocZuXAaqRlPK3aS9eDvJKeduDIjBA38AyQy
         0E3FSb/4LbLMrt/2Wxs5rRhxnk5Rs5d2tVoh//HfpgxjVocdlCO6V72KvO1NMTXx7Uxv
         3YntGDWu1wdpttTfCC2iE6MUKKi0cDZnyu94mB5WMo1DiPp6n/d3q8GBPDnd3LpdP6J+
         Gos8dm3b/5EDRffG5o4oUWqYfPPCwK6n0+y4t1X5zSFn0gDSMmWSgJSyyYmrt48Nt9L6
         vTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172409; x=1793777209;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=rnehvx1cA3zppB44Ajk7fDZ4CrzB8qI2WY45P3rm9WXVX6WVr8BA7cvFLVgqobavKo
         uzh4UsbRtAJDYKhr3mIR/NfQ0p3bNl8Vt7TcOOXfjsFnLe6mRSMYJfD28pzyOA1zqb3/
         7XlpmhLRd0cAcKIRwbpSgGOrWDnGsmbSSUyUfYy793GBIW9XKlMvGsySyCz1I6LFXxBc
         Cp0GNl01XWYlWoCeKyG1dgrSqM9FWFmqzG21yPdEwEioTC+JxKLwNt9CD6ezON4cHuPX
         7oFNphNGGMT9glhn6w5vf3hW6quFRF5nahYXkAGH5aQ4XB8Bv0LpyXSsC6zCHdFds+gT
         tTrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqA9TmgUfhDPMAOzSc4cDgp/ViTfiRffVJzGrHtAZmj9/V1SFLDHm6Ja8rzIXkASWjR171pD+r/tQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8q+2Et/mV+rnCfbiH8eP9BKYAQuG3n4iK8lBmBLJzPqaqvo+j
	mty11VUoQVIkDq6C74Xu24pEim0cDL4v30NcxhpmKzQJ2Odk2JDD7Muf
X-Gm-Gg: AYBFou0VjByxvXKGLgGxNEhnK2QVLwWN2kRBn2WxYCa3e782pn/E9tPnOE/BKYiFXHI
	/oGXccl9osI949sr6lxqqJHngt7Dlyl7Hg8iqypWocUY/KVyfk1aLzEAAj/8HbeRzfhb/7facuk
	X2BpsOBSOWo2ga/jbrIFtqx3EiOompzj52Nhs36ncFbXm4ap9GeKGveLOPYxPc6fOzOtz3phVa+
	MIkj1w0ivK7GHymgiwdZQbGz4oB9y+9fEMaxdRPDVw8Tfv1axVr4t7qfmVFHCn2efz0tpmRSZG3
	kZoj9EfYMvvUOTtDivUGHed2PjuimXgVg7EPT6vYpfeYOJ5LjWmLeee6rqvWJ9AAl+Y9ZdTl37a
	DmLtG+BrwWiphG9uhkUTKC1B0+V7sFFneg0LbUzAkxOF+BJkNgFzIB4ddVjF9fSa1ElCx5WzS/u
	6thSPbRgY2epdXwGjAEA5pXJuQtnjxk9l9I0CkX8lIn/tvT2F9uEAPPD+pPiAKdfdshZzaO70jk
	2j6E17k12qDpRqzQhfozmiHqk6n+bVurfHbCdOQn/U3BTI9tLSetzNR3n7lPpMUP9yoXleotKUe
	ykZNajvz5Au+IE7GiqpicPVa6R0fNRbE89XM
X-Received: by 2002:a17:907:3f11:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c49bdf2b6ddmr121255066b.9.1793172409029;
        Wed, 28 Oct 2026 00:26:49 -0700 (PDT)
Received: from RuiTian-14.guest.local ([2a09:bac5:303b:28c::41:144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd795bf8sm564019566b.70.2026.10.28.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:26:48 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Wed, 28 Oct 2026 08:26:43 +0100
Message-ID: <20261028072643.32250-1-jiamingouyang13@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
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

Changes in v4:
- Replaced spelling problem.
- In your cited discussion [1](https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/), I still would like to keep ':翻译:' line.
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
index 000000000000..5f2bc7b41f29
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
+硬件寄存器协议。“与英特尔早期的“通用主机控制器接口”（UHCI）相比，它将更多智能功能
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

