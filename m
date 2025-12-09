Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06182BE7AB
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 03:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765250687; cv=none; b=cINRCBSijxlbmElTymYbNHLb0dHmmuB9d+EQrLD87tm4C0TCmDWfRXW7f3h0CfyMkUxmhmfo/fGnR8sqXs15+EF+8yV6wh6HVVj9VtwXwRZKy1sqPb+muzo/pSwFW6/ek0+vaGWxQ8ZCWYEk7WtBO/9331D+w35hw/azxN3oI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765250687; c=relaxed/simple;
	bh=kb3vJ6UB4YMJ5FVxcnw8Y1Iq2Iyz6h9yRcwHlaiERiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AX7NyB5YZVz8ydXFGwUtseNFn2sOdz524t4wEBux8FANE3n0IHWoUP5ThxhrHkpeLvhrXvwfqqI6ztqittNqBY0nBc4EMh57jVzw0W9B9MNP01dQGMDCLo2lKZRs81zchcobPOuLKH5GKPZcdVba0BMovIHBRcKZlELFb7aKxdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cahidfJj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cahidfJj"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34374febdefso5340941a91.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 19:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765250685; x=1765855485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y3JLkwkp4BSFjOFTSB6aXglZIWfTKVg/p0YUgbKz/M=;
        b=cahidfJjizeCQq0TLnKdw9/yoDca+/N5giMTHxeWmFauJzT40jQcc3eIZ3pyDJGKb9
         s32jOiQuKFsBvQESJcEt4LpQ7WDmEoESwwbGVXJkbgassaEi96uQUvQJmTIXrjZ6yPWo
         UBEIbPv1brYEISrJDu5QONPtBRXa78P+RLpiNZUjYONqs03mLhM2JWqzb6iN0OlJngN+
         cw47CcjwgNe0e1aTAmZWHLKrLKzBIFLSvNWxvXqMAwGbmN9hcpvRt0TM+qCOsH1QaEme
         pn6UeEkDIKiU0kZZid6m0PtoTV+NQx71YR2bmYLF5hO5iYR2BqbvMT9jgEfNNQSe8AHN
         zagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765250685; x=1765855485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Y3JLkwkp4BSFjOFTSB6aXglZIWfTKVg/p0YUgbKz/M=;
        b=KPBQ8LD+DES0fpbUboW3Fgj4iHfXZInmdAFV+4YjZiRi4U5Rge6GiFbXAJyXNT1TYQ
         F/GxHhvNosywLiEjTQlVlk1EBF9OJ/pqeWb2d561o0HrC6c3+VOyeGKJx/qicW7BqHyV
         fhpEzx/yHgVWZu66q1Nar6vUdjOVdTKU2N5Y1lEK2x2xAoLXbm5kXedPBl0XM+BAVBta
         dT3dNKFwpSkF9G8jneafeMw4fC6CeZGuLsIGf8QcCy/wO1Ef96lD7GJ4SdG2lMgcCXEF
         wyfqYYRIe2y456EFNl/bRUTVPUZVIwHnAmbQMaIVuNLlE2R0m4OkKO3XEMoaAahLOC16
         Et9g==
X-Forwarded-Encrypted: i=1; AJvYcCW6va1M0Jz0uiq+SPGrWPzQQ3wLeq3LbP0KhUeGT9ckO3pPHmfoCz8eVLjw+ALxtBgiS+ZUtb+DkFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAcy4bfIt+nid2ltMr5Oibjs2iIyagapcOd9wvGjqmefYERyE
	fhwoqX8prz5xthyKxbOilzsCBHV3CJRGe/uaZA4CTBqZ5Y1IVSAA9ZxV
X-Gm-Gg: ASbGnctSrD9hqgIezgbAFcQfqb4SAejiGgzTWs27MeE1dEzaP+PnF8EW8kyCDj7r7kq
	SqQxCMU7gfpkk0MEWpR+qWc6SguXmc2D0u5hGFDPhnPcF396lT48FLQEB9xE9EzVmRCeHXWIESe
	FrSnxrXvVHlOSGcX2FLwyK603XgFwrCOd2yRd9mpVQ/M4hnOw+CjtEzUrPsxN5Rsv2nBPU4v5Wl
	nqVhdSKfd6l6r9A0/JOigzrWnL6Vjt9/Dp4Jo0k+skbMZOddKqeRJylqjSLL+BuCwl//ROZI4kv
	X/QFjDZBPgpMPyepT7itkK9XhueIqvI9kSfDCdlY3znJR3o0ci7YZRjyXd3QFQyJpTNfWIhZrOM
	AHv27g0v7CIR9wq51jCCThZblAmULIM6nXhnc17xtqmjHERRSjpjqeSGO2+uk4fXy7Z0L0dznQW
	sQLRx6UhYQ3qFnNY5AM6I=
X-Google-Smtp-Source: AGHT+IHhOVSt0SjhTQ3auM38UGEJYSoFP7wZjQShcl4FYhb4BuTbd0u83ptp6sbGfV/QVPGh5CtOxw==
X-Received: by 2002:a17:90b:1e53:b0:341:8ac7:39b7 with SMTP id 98e67ed59e1d1-349a25bd90dmr8386564a91.25.1765250685088;
        Mon, 08 Dec 2025 19:24:45 -0800 (PST)
Received: from LilGuy ([2409:40c2:1049:337c:5ab7:d5cc:37be:2a0d])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-34a47bfecf8sm456535a91.2.2025.12.08.19.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 19:24:44 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: swarajgaikwad1925@gmail.com
Cc: bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david.hunter.linux@gmail.com,
	hpa@zytor.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	skhan@linuxfoundation.org,
	tglx@linutronix.de,
	x86@kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] Documentation: x86/boot: Fix malformed table in boot.rst
Date: Tue,  9 Dec 2025 08:53:30 +0000
Message-ID: <20251209085330.9124-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx reports htmldocs warnings:

  Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
  Text in column margin in table line 2.

The table header defined the first column width as 2 characters ("=="),
which is too narrow for entries like "0x10" and "0x13". This caused the
text to spill into the margin, triggering a docutils parsing failure.

Fix it by extending the first column of assigned boot loader ID to 4
characters ("====") to fit the widest entries.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
Changes in v2:
 - Dropped accidental whitespace changes (the second chunk in v1).
 - Simplified commit message as suggested by Bagas Sanjaya.

---
 Documentation/arch/x86/boot.rst | 48 ++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 6d36ce86fd8e..89e785850f7e 100644
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

--
2.52.0

