Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EF18DB35
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207898; cv=none; b=bReZDbfN6Rz3V4oAeX0Z7icInsz/IQVOFJ1A0EbiRyo97IhtiB4gn4OH4PEZ5i71XPjeUh3oWxqMyU8zv+kw61jasjzKj3+xzBaTz/kierP/8coXLBDs8vfZ0MLS0oUapcfx17y9pg1rsGismFbKwepIy2G4+n369LDK4BgdEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207898; c=relaxed/simple;
	bh=yFjHybU6jkH/65wlYItO8dl7SQJCxyFvZ2X/km0ngKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oRxCgPs+0Lgj8gftIv97uFMMLDD5IC/3yOV8ifPpa6hVMwjmUS8ZrAZEoUhZsQ6qozYG0iddf+7LS9q31YjzF/AAZtgu+Ob5j5WctgoRcDrLmDsBZfHaaHIQ+O7CquhnorvlaOqsYkcidKAbbvwjhtuPCvQ6u9LwVZsXZiSwZ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3rwsFO8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3rwsFO8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ba49f92362so2533077b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207896; x=1765812696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Bex63zNM0dV0NLY9BABQaGQ0KBu7F1kvsYCKz1b3Ds=;
        b=P3rwsFO8N+484aeun76op5qJafHWhMmU8gdpfqWu6Viu+29auQV6vgJGjI2NKIX0QH
         8rmByNQjaUlEi/53gJaxLXM7MtCwOYskGlw5ZhmVvoIPG2ovEfRIfnJGJvAHbmlUvv9f
         9pRBX3uWqBWwt1VNXpY/+aQq5MVVq+4Al3WnP78aJs/BjhkF/AUYVIO+Xo2lgyhytCv2
         GipIrLEeWV3E0uB9owZFroSXsfACBnSkhHLafpICDeNDrE0WRjWwTak/7k7cLCcv050B
         omYtbx61+7aOjRk+2mKWWRFJOEeC0pyt+rSx3fE6NnXHC+dMUqfUqjqhwGVjvG/F6O4B
         62cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207896; x=1765812696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Bex63zNM0dV0NLY9BABQaGQ0KBu7F1kvsYCKz1b3Ds=;
        b=OwzCnllaqq+6a/PHj1NZYVbT7BdwXl+yFEl+kVmAt5EHdBzlaCFFnJkjjQ2JYZwXpt
         Sshew2m/PQP5Auwet6BZ+uAR5sKRBVLLgstYuJh7AAwoPtKhm8mAds2oPAzeovxBe5B8
         dT6jT941K8Mu4nMu1JmmJSAQ5+eRxIX+Iic30C4JJz2dQAxvpQGxB/tDerp4DOWp+mfk
         8Zp+K13iBsk39aSD6PajwNdMheDZ/zGWSQt2yKuXWAWQE8ShmkEvOWs68S2rW6QaRrCK
         ZEzcfCk0kPU5R3ab2j742vqxR/YJAi9caVjGdr8C83MXGtoKboj34WjELv8fui+QkzC5
         7Vvg==
X-Forwarded-Encrypted: i=1; AJvYcCXYLdVnhySvxEvKf5zmKZx/z9irh70BCV5CVjvEIGAwfEeMNj7uZdGr4MFfWFPef1y4ppn4VSc3sPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzOb/w2ZvaLeQhZPneauMBu8zvYa+qVIGGlRZ6NyYjb8xSKA8g
	60Y6NkSG8PLyN3L21UfM78vn7UGkEI7tgYiW8luzzih3U0O38+2qqrkH
X-Gm-Gg: ASbGnctbUFYBijUfgNso5rK+YGkivE7R9ALp13dKaUxTP4HvZ5FjbkbS/wl+zNb0aZd
	Ta1MfmrsYOKEl+o3QBnLGUUK4WGQKv9t0LqbefGvZpduwkqQ9oRXkXFCiAsaWnLT6pe8Xolu2tN
	NUlr6x2dwD0DMCZIIX3KEnTh4nCFU86724s8j4U+JFvvN5FZF158mthTimdrIudRdR7JQqa3hUr
	kh+wp+13m4j3IhnUL5iysqEXaS+vaguxCS4XPFP0OEvwUQOMNkg/DdlDNl/vMC3bUN1/jQw5zmy
	I6fH5ttKjv4KArKoLezCD6ghmsE0nzHW3r2o89+w7fMjLlCP/LJ9D6wAvEphs0VyBDg97nb9TNZ
	dlNuPs2GzUzHzIR84zgCTv6Qp2re/rTdgaPQFsNXxlHNgHYtDok/4c8sNJ7FWUobGniAzkI+Dp+
	xz7dwpdRgxRmMmBUI7Y3M=
X-Google-Smtp-Source: AGHT+IF6J0kBEC8FKvJK51K8z5dLkwOeyMrvRtMkX0bAAqgUo81rOgj5u96jbKAPyZpuceYCg7/Uxg==
X-Received: by 2002:a05:6a20:6a0d:b0:35e:d94:525a with SMTP id adf61e73a8af0-36617e6c82cmr7252847637.13.1765207895651;
        Mon, 08 Dec 2025 07:31:35 -0800 (PST)
Received: from LilGuy ([2409:40c2:12af:9b19:45ec:8f6e:22bb:1870])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-bf6a274af53sm12511815a12.28.2025.12.08.07.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:31:35 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] Documentation: x86/boot: Fix malformed table in boot.rst
Date: Mon,  8 Dec 2025 21:01:12 +0000
Message-ID: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation with make htmldocs previously failed with the
following error, causing the "Assigned boot loader IDs" table to not
render at all in the HTML output:

  Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
  Text in column margin in table line 2.

This occurred because the ReStructuredText (RST) simple table header
defined the first column width as 2 characters (==), which is too narrow
for data entries like 0x10 and 0x13. This dimensional mismatch caused
the text to spill into the margin, triggering a docutils parsing
failure.
This patch fixes the issue by expanding the column width in the table
header to 4 characters (====) to correctly accommodate the widest
entries and alignment. After applying this patch, the documentation builds
successfully and the "Assigned boot loader IDs" table now displays
correctly in the generated HTML.

Build environment: Python 3.13.7 Sphinx 8.2.3 docutils 0.22.3

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/arch/x86/boot.rst | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 6d36ce86fd8e..99b42e9d0e1c 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -433,30 +433,30 @@ Protocol:	2.00+

   Assigned boot loader IDs:

-	== =======================================
-	0x0  LILO
-	     (0x00 reserved for pre-2.00 bootloader)
-	0x1  Loadlin
-	0x2  bootsect-loader
-	     (0x20, all other values reserved)
-	0x3  Syslinux
-	0x4  Etherboot/gPXE/iPXE
-	0x5  ELILO
-	0x7  GRUB
-	0x8  U-Boot
-	0x9  Xen
-	0xA  Gujin
-	0xB  Qemu
-	0xC  Arcturus Networks uCbootloader
-	0xD  kexec-tools
-	0xE  Extended (see ext_loader_type)
-	0xF  Special (0xFF = undefined)
-	0x10 Reserved
-	0x11 Minimal Linux Bootloader
-	     <http://sebastian-plotz.blogspot.de>
-	0x12 OVMF UEFI virtualization stack
-	0x13 barebox
-	== =======================================
+==== ==============================
+0x0  LILO
+      (0x00 reserved for pre-2.00 bootloader)
+0x1  Loadlin
+0x2  bootsect-loader
+      (0x20, all other values reserved)
+0x3  Syslinux
+0x4  Etherboot/gPXE/iPXE
+0x5  ELILO
+0x7  GRUB
+0x8  U-Boot
+0x9  Xen
+0xA  Gujin
+0xB  Qemu
+0xC  Arcturus Networks uCbootloader
+0xD  kexec-tools
+0xE  Extended (see ext_loader_type)
+0xF  Special (0xFF = undefined)
+0x10 Reserved
+0x11 Minimal Linux Bootloader
+      <http://sebastian-plotz.blogspot.de>
+0x12 OVMF UEFI virtualization stack
+0x13 barebox
+==== ==============================

   Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.

@@ -814,7 +814,7 @@ Protocol:	2.09+
    	__u32 len;
    	__u8 data[];
    }
-
+
   Where, the next is a 64-bit physical pointer to the next node of
   linked list, the next field of the last node is 0; the type is used
   to identify the contents of data; the len is the length of data
--
2.52.0

