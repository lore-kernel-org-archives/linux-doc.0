Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3172FC89C
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290381; cv=none; b=CaKo1FwfyuHXHbdJOJOCQimHsh9dVO46NKDBOi/S6vBDlWdTQGnfWL9YquXM9c2D/uTl651dgx/dP/M/AtvS0Z1swE9oa31NL+M3EQFEF4u0mz9ikvFRnDoT8TCR40KGkexzeHqY6oyXfedIvrfbjCGdf0GpCpakcZ2LUrbgpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290381; c=relaxed/simple;
	bh=wimpNbGQyk9u8e5Qt5gFXUuJ3GuTlbtVqW9EiDOWvHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpDhDxGhOh1CSKax5kenLLURZ/uAFXKgtI9uPoZdkZTz3aVxHX7pHP/E5lTAwvslwn/Q47JPnprzABSoyd3vMkVk64Hr+rZUOQH2wGPCpF3wuY5OA0C4o8Z5BwaIOYya/l196cG6waPZpdZXK/pvKl0UMnf+hk+pLh7F/BNlC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ebz1+qmJ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ebz1+qmJ"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a0834769f0so50224095ad.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 23:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290379; x=1768895179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=ebz1+qmJJBIvCQAtnIlFOIxoNHUyOJzcoH4X14plXxR3AkR5toR5faYVU6vUH8auKM
         X6/531TOugtU+n7zGJYLCHkBPpVydFwoOwwlioC8GW4nATMwIIzPaHTjf9Cka38Rwk3o
         5O96mWCn1BE0EDXSXIJc3bw0ab5tie9R9GgtvkjPxcakf2p5poglYDtrhRHUpm2THgEU
         +UPPBSByCAvtUQv6yFpNqWZfkbXyI9aeOEXrgji8U4YU/6ZnYBV3krGHJ53RVJMvhMNT
         9iyWSAhwgkaPh/SXWsbzWIefF6SOz9erqlAb0UthK8SH20UR9y6VzR7imByPhZANAB/d
         QkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290379; x=1768895179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fNeknCfa8wEEbV/WEcBxY/dqGiWsyOavd00Bwdi/7Iw=;
        b=TuB8zOF50clu763+4RvxqZ3U+E4kGjVM8dhVW/n895oUjfryD3AOiDENRakZ6KHJ2/
         pvIIVOnKqtGQ+gnns3TBP29+m9pjlU1mkKv2fePxTJ8Zbb24HgEeSMVgnwIxni8UwN9J
         Ydc/elo5OOKJ/h7M5Mmw6ebc3f4BAWBgNawXzGVWaz17HNgJgtjSNl/2I6YXM0+d+7aV
         Xbx+gq6HvTit/AF9NL9D4p6Ij9R0aixOMWvDMTjnw0gHG5L+b5DnUsJr32HAGIOIrsxk
         gI5QLCbV2ZETwE5oCPGHkfzdcgFl/AML6MDdKMscGuO+uxDznIPgBrGTwixAmPH0CtLv
         yWAw==
X-Forwarded-Encrypted: i=1; AJvYcCVnidjUwsOlRXroSMGsbc9f/9PqUxqWeOA8pR+MEswXg/519cKhG6c+8GMjuDkUF0CmlkKZPgkxZm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa1bpjRFya+GEbUX/X27ml7aDM3xIBe4ObzJX+NDKPMPEujT/m
	S711yJ5+ZJGokisLGMAhOWGRXLkaVUiH6ifiMosg24/Uc+2a4K57MpIRHCI1MJFKXT8=
X-Gm-Gg: AY/fxX6F2Tuzq0CtRukzrm8m4XtxsakAZ0Maj4HT4jGcnwY8zpi9GMVArxIYDQpf16a
	c7iQu3JC4VT9eIGmqpuFKYY2SzPwt9UaexB9Iyk0cp5MZKGZfWGjr5Aej9KG+wmDi/Hf304O72Y
	aS2GXi3xpgGVKLgKCXQw6i9iljQXCfVOUwjZErtqSHrmyMee3zPM61WxsFVEjC5x+zG/FEaTy7v
	fmFUuFPMMzX1t1js7ncqXa8lkPq7OocU+0IH1NvdeS0Iy3OGny2IiTUfUTW+zOY4xgQIc5S1xRa
	8ORkeHiVJlu9Eu/Shee3a8HvduhpqVe+9mtyne/sIArv/zRxD6EU/hMp/7+aImEtZLtTpAX/1Og
	S5603+3qY7rL+pF2qBsW+dpLR+g4TEvf2yMTuA/tWNlbmgnnprXeQFf4X8hOUjiIXzsj8YNdBTk
	MsSGCTwcYcvTesjonImNPbJCFO6blaBd/NzOdf7VQfR1SC1RqiwBJp/M7W8Ab8+ybW
X-Google-Smtp-Source: AGHT+IGrssuTQycrsW+2hCknhmQdMnpg0esEoKPvLFi/81f/ttHiYeTe2gILmVWkDFy41Vy2Qxe06w==
X-Received: by 2002:a17:902:f547:b0:295:8a21:155a with SMTP id d9443c01a7336-2a3ee48ff6cmr185468915ad.35.1768290378939;
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:18 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 13 Jan 2026 15:45:53 +0800
Subject: [PATCH 1/2] Documentation: riscv: uabi: Clarify ISA spec version
 for canonical order
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-adding-b-dtsi-v1-1-22d6e55d19df@riscstar.com>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
In-Reply-To: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Specify that chapter 27 refers to version 20191213 of the RISC-V ISA
Unprivileged Architecture. The chapter numbering differs across
specification versions - for example, in version 20250508, the ISA
Extension Naming Conventions is chapter 36, not chapter 27.

Historical versions of the RISC-V specification can be found via Link [1].

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/arch/riscv/uabi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/uabi.rst b/Documentation/arch/riscv/uabi.rst
index 243e40062e34ed5057e3e79ad61311f94b7dd404..0c5299e007622a123d64cfd36ac1491b22d4255b 100644
--- a/Documentation/arch/riscv/uabi.rst
+++ b/Documentation/arch/riscv/uabi.rst
@@ -7,7 +7,9 @@ ISA string ordering in /proc/cpuinfo
 ------------------------------------
 
 The canonical order of ISA extension names in the ISA string is defined in
-chapter 27 of the unprivileged specification.
+Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
+(Document Version 20191213).
+
 The specification uses vague wording, such as should, when it comes to ordering,
 so for our purposes the following rules apply:
 

-- 
2.43.0

