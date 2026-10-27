Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107310;
	b=cqnFFjYfwmublXQj0BX8TXjFot4NS+Vw3nxpZs3ThTTakzXWZ6azlecATQmUyA0iphwE
	 wrLOGFHY4AGka5/ZZH/sEQrVdxh5pf7pfYdHui5uzrME3wIee56FU2W+zUIbuCWbmMCW0
	 7nE3zRQGndXHAq+DFomjz3pSz1yMf8OReinw371ufliS2+YxMBulVc+tsUPzqFJcjiN3p
	 jRdaXqt+HZlhymLyo2KudwS6NgSgu3+9Gc3nk77RtoId2YIGArYWm/bgS0iAhl+QOKorJ
	 FspiOXvifDxLn3an5CU95DEVjexZ6dZny8UDoDqyKQViAIEOCkvP5uWePE9t5FErlQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
	b=x1g4aL6Mao5zB28FjydrMlfJVPE+D9FkmdS5JaWWgbNK5t4XZnvoCq7cSrNJOW9Dli9v
	 FEWExqCnpjnHyprfa6DwnGD/tYfby/GJxkWLwKPKj0rGWUu1Thzcu+H2GD3I1yFH96+9q
	 nfwDBmn/1m/K88FQnzZG7rL1kLZZTrewhQ3Ktb06BFiV4RHXhQtzxMA1LDN3/nGNvgbe2
	 2dDAGbQ8gHPX8scPv6iMpAiqKF9+U3in/hBMDLkZoJ0QVWMbPl8naza8j/O05/25K8GUn
	 4AWqcD5GlHDAk3lVT2jQqdLkFIV7y6KdN9Au0rUTQ7msHl9GJUSvdRVFW9tku2veRmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hNzBfPIT;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E098606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E098606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hNzBfPIT
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4697404c2bso534175366b.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107308; x=1793712108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=hNzBfPIT6WfFbZkZgUrbg3BtTPPdQT/WlkH8PE2UnqVKBlVwAVv1LHzdXNeV7KEDm6
         TiWKyVH8INlJKvxjThjJE4VPmOXxKt8PvXoDtk4yZbRIU69pZevx6KnpwAN/1oZzPNly
         cbvW+/I1RL0344Xycmmy3X7gui51/h/7iisowu64gUH7dj95hD08cyKRE4AaHX0kmkWU
         H8OeUneO31UxvD9aC5xueLTsHCuqONy6JwjZ+bzcQNN2+JBzie1yvkkzGo0A40M+kdbC
         UC24HBzNHxIO2cgMq26iQpzrYJID0FQr4Fev4dp7o9SnqlNCED4lxME9wwenoR+dGvmD
         Nczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107308; x=1793712108;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fL9gMXaJRZ0Xj4WziyDDNMiCJApIpywa4WB+ca7aWE=;
        b=1o+t++ya5T5zRXmpiFQdiiDzLgLDF2i67twJTywthuVsPUFp/BPEsKSEAOD9XTakSn
         sV9DM6Nr8g8ZaGHSwZrShuM/WPfewf9hWhXBX4knGRH+HOSNSLM1UxeXsOfqFcXEpBzV
         APgIwawdhQqiZSenWgqpqrzP7x1WcQ1WwcUp70l6bo4SX+fTC2114UnukAbFiANUahGL
         cBHgJfNPKmbO2SfVXDqXMKhkISLOa+USFR5dwvmsksnz0joVejaqeo0QlObBDr8Mzh9t
         yK1RIB+8GJjcFoces/8beNDiaOOO8Wwm1kDgUfg/wqnnBsnTuP05LS1m9Z87YD02Bmmw
         BwEA==
X-Forwarded-Encrypted: i=1; AKwUvByHDG0Elwweqmcn9O0uAdhKQ/D25NPdAgeBaRkDxmmRgJ2ZdKtUpnkrk6W6Vse5nD+rXecVXkrj+sQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX7WF7XgkNGl471+fbbMOa1lKSkd6hx9Tzzuuf16k4kNqMYLRN
	ajzM1j1HpSXWlCzTSXTsAgh+g9zMeI+fm8Tzro3cMfU6A2swXayGT0E4
X-Gm-Gg: AYBFou3YCgnmJPVTy/stl2Pok59gwkQabUKegFNFG4QXM5UMVsCeJ0wqCwnwh1Wb6F6
	J4TQAbJdFNFIMCCzoI/IZfqDB12XBawwZJWrB2GBuB6BwI26qgMF48nJHCusjUiFVNOKANvWr9C
	s/Hkn/FOEIjWdi/WT34IklEMAsfc0TAVWEzao4S5F9TJ0mrl8l1kZqF3/BBIwCpjmcxvPjB5E3+
	U1/vw8/sh7xqN/Acj0ERIO8uE158v0IkibEZWf3USWw7pZVQHvW5LKZcqhUolemDV+3W6RzbGXE
	1brmTfKFbJPxBxojqt2lCPrmMPUPluWKfCRgEfI0Nz2TU98SoH7HJZXbqaMH/5xd44BAkXhqtAO
	EAYGsqQoDzQdHW8wfeHP/W4n7FXb+hD8yruHEjkQIqppqq14ttM0oR0IRtGpxG4m/RMeA9A4qYT
	ONj0z91oITIdFcTze3jDKimkKguq4ej4sB7y6tGK0Iqs67i/v7TNLID7DVOjONS/+NkdKgFN0Lu
	lQ83ZaESXuLSLm3pn5Yx9Hots+9m7SCFme2StmlPTIm3w==
X-Received: by 2002:a17:906:f58f:b0:c40:19dc:a248 with SMTP id a640c23a62f3a-c46bddcdf09mr1054920666b.15.1793107307377;
        Tue, 27 Oct 2026 06:21:47 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac1:1f60:10::41:127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd15sm448714966b.55.2026.10.27.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:21:46 -0700 (PDT)
From: jiamingouyang13@gmail.com
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_CN: add Chinese translation for usb/ohci.rst
Date: Tue, 27 Oct 2026 14:21:40 +0100
Message-ID: <20261027132140.16295-1-jiamingouyang13@gmail.com>
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

