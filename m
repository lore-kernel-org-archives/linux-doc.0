Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8944998F
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731075; cv=none; b=P8l1E57qqWxjyNwlnd2+PFul3bCaXec+P0InuzydZfOa5lCoRxbBywEjju7JHryXLX86AUPviiiimBdSWMLZbVRIvFC9tMwIIq7QAndrfihERSGIYl70Wq/7xyUu8oB24tgpoj2yGkEKKbE94BrGqjEpduNa3br4oGeR3xmSu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731075; c=relaxed/simple;
	bh=D5oJblw1Mk2D0oXCU0ZAWnjEkCSIw80thnwcJYQpFIw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rmOgOv9l8pTZVWAvWw9vTKBr3mgNJFHaQg0S95ty9FNNbz6hnJUXsoI7RM0M44KA+N9jlJbr8/caXy74SUi6kpcc3PEnFFVB1XaLy9COD/IUlXVi+PBt7aE9uP//gmv6aZhaSESolnRu2UJQv5EdKnGNWRL91r8+3zZ23iBFrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCcDefz1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCcDefz1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c315869241fso167106966b.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731072; x=1792335872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=FCcDefz1j0nhXLi1HkLsKO+YTf+XomH5UerjENYsEiRgkylRxAE15oIG0cwSBCO4NZ
         PRCAMVm5HIGp72IBZOKkHHJsHoUeKOmH475icT2X4YB+2kq7JntDRoVAkqjHLx5pdEPF
         +JWWZbSaAwFGcCqW9s9pRcPofaCjl9eRjlCrVhcP+XCUWbfGxs6XsvkVvFgw7fufEehp
         yzeefJjcNP7+Y8hj/GVdOLdGQUjf8HqhBiG2pTnzBf5ull9nEhW4vH4Nf62e2xztq9dC
         vMXQPsUqUZ+W/eARQ0lQ4PRVQrSP1hl7jkOY8NkbASbXpgx5OkaH9/9naeSvFLQi27C8
         nsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731072; x=1792335872;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Iap1AsRv1qyz87XD+IHHgucFbHNuqIM/DFpF+PMZW0=;
        b=b0lWoN9dbOHCuskvbD90LB7Bd+uJGvEQNEB2iaH9fCvMbbap//L3Qi9H90a23pjcoj
         P2pzF7tBrUX/5s+l6aWKgb81oJDK1f8f97YmDIWsbgrUBylHQARnR9T+ZBA47djubmSR
         2Pg1dvk5TETIdmbp3gKhomBwCnVAlkzru9wYH4CPWahajpaz4Yo4XWZI+hrwGMPj30Ei
         f1FlPXtYEyzmcc8kOe2ncCBfkko9nc6WYuUw8fuxeY3JXlZYHvpJ90izRqxW4BM97jxt
         D73FGQtwfgczPGeicKBSNSn1mr8FN+Gyt3bOhOErwv16yQd5mWn5zBomeneUAUI3DCQV
         EfKA==
X-Forwarded-Encrypted: i=1; AKwUvBwuw3oXzm1Skth6rc/Bd7gpMjfscn7Rmpe6aVuohUXGqPRunJ/OH2zxVmBLRe4+FYWNfCjlfoi32Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzdY4OHf9Of+MwcThVkJR0GIYKy1m9Og/3cD+PD5vm+GGBPDsr
	TVilNSiytr5ohMOGQUfl/BuqW5sg/j4dYcqWKfJByD0n0mFRCv7SgV5TJ7smDKd2XG0=
X-Gm-Gg: AYBFou3vYnTvyS9as01s57BMo0wauQkFNWdcgt23zLebKZE9zLODoeKXdr9a7cikI3N
	GJioZw9QX4tjML1wDlQY8qgLKuprvK8zIer+rJo0wKECofDbziHAeRvCegtCCBJMya32q6Mxzvc
	LmOOI9Du96HN6bZvHFuES7dZhKk+64aisc+3M4Fo7Hhrw7QyFHP89Q1nXgxvJshtXP9iuug39BG
	yuWpVv1i9qdsceQxDk7Usqdgw/SscezUbmAVvfuDqgzYpQCU6fL0X0Uz7hLVoTziav7FAdILKT9
	RhUIx7UjR5dn/iSWRR+5yXu/JjkzvQQhn3zC+tuOcKPjvEJEZsNcuNOKdjG1VR9vEIJbznuLpJV
	x1OlTKojk6HYx3FC9R8TiHoe+x7PsNFri7l2Rl7l3jyNK5TBjYNPoPlR2OVjvlGVki2BbRIJ5wB
	6UNaXehVgyqZBZrJnO32jRHlQHv6cfVWdHn3E5E0whYlCj/llv/sm7UZx4eqdwDw==
X-Received: by 2002:a17:907:7296:b0:c2e:4f16:fbf with SMTP id a640c23a62f3a-c31a9f8af14mr724308066b.31.1791731072224;
        Sun, 11 Oct 2026 08:04:32 -0700 (PDT)
Received: from RuiTian-14 ([2a09:bac5:303d:28c::41:134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c346637b997sm62035566b.30.2026.10.11.08.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 08:04:31 -0700 (PDT)
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
Date: Sun, 11 Oct 2026 17:03:08 +0200
Message-ID: <20261011150310.51673-1-jiamingouyang13@gmail.com>
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

