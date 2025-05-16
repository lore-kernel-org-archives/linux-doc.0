Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC5822F744
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364738; cv=none; b=cJ9qUN7KANuyujAUS04j504GRMCaSpbwNOapxReGdKLWQhUNDrtO0E515D/YxuJQunVqR/q+d5y5HFE2kdTBxek+CwDqQxI9Z04Zsg3yfxWmUZ24tiXomVszLtrMsJ1HjGAziB2GPlkAMKkmqXDyPP6WPwjGEbdWBQPwd1Sa0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364738; c=relaxed/simple;
	bh=N+R7MYI7KzIypIdB3/ZwoQxKrlb5u9Y8qGMUtdhagXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JJwMxkr3EAVAXTaEec88jD4Kl6StkH08v63g4kSnC6/YctpRusHwFct/3/9KUOaYaEMXkbow7kPmEY/MCoZ2w3nqsjRkU1G5KISv1zTfvbOjXQ0K8UMSt4ych2gJSJJzzxhMftC81SXG9hjguFVlIg+3eity6OqwTHrOj0vN2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=CzuL0Q9J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CzuL0Q9J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2302d90c7f7so20584685ad.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364736; x=1747969536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=CzuL0Q9JkMa1eu4YDOFf7aPRU37LAwF+IHh0EOd4E32A3oRG2B9Lz+DyePGZ5sP5kY
         AgJgFAc361iHCZ1wc8wYmenPdQW3yrA7q2O3jld5Wx5M9pKcEsCf8wUIqSgFPgFv0VCO
         ZGAsJGS36tYY1UBBJ+9FLk7LDktDPc8WXfYqu/SKAc6tMzrevpDpxhSDkS0fESjqIz5c
         Vv9jBdZ6+En9ITIEGTbLFhvSvt8ER0DYvQ2Q0P+KrdDp2/18MDSxcQaLjq8dU4y6Ztwh
         b1dxVW0WLctYdgaYEEfab+/UkIarklqkXQhwXrnUXTYaDGp8QXUv4oWNuU/ZKInJGoC1
         MAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364736; x=1747969536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIGyh9W0JvoxjrKUR0AkLZUbqALah2Rv2i60UdP+uX4=;
        b=rVZIh8AaHY4nP8+ZiED/UeGo5qUKCf9sWtOlIoBLlo24DtioloOVWulnSXaKoJT+mi
         utb9EZYiydHkdPSTofh/0S1UqxWeC7fsuSuRbdt58gYZaBVIxGozMN9MLOV7Bks8sjB0
         /yHmJVfF7QQ0PQ063CSWLdVIbWV/J2tfFMChiIk6EHRpFOSPInUUXBUQORN74URccgvo
         USW0sD220NslyFycWYwI5FSI8j56TFb7elucR8VY+Crxy+ZdzMU5GFBBtBnYX1t+35J3
         PPEpOmyCx2mmpFzCuCbUd+7l6f1xzx0EnBNeU4bo09aaibrXq4apI3/f8iqwub60bfWv
         rMbg==
X-Gm-Message-State: AOJu0YwJQWp1eYu/5rtKBPROs3fD/wZzRkrt1E22YCt1gfsKwT3Q4lJ/
	0XGVx9U9jgqVtJqYPTA2dDUpTPkb1NUMJn9a/6kaOscMlht0Hk8FrboOTupqhkrTY7k=
X-Gm-Gg: ASbGncsZEMggHWLXQdM6cpwD1XEGzNjt4BURT94csM/IsR0ChrqQEs/2v9sRxBSmrsJ
	PIuQiIsXbKV2YL5gB5D9sRJ19+Op/qBBeuFPMBoZe737OVHti9sqLOgWJPVsoGpwdEEbUEHSd5P
	rK5ZqsrniWAb0jTMTZLAdo8CjFJstRy6nAaBTbVz8Ph0W0xKvgcrna9UjZVHvAiXmvvW49nq3nb
	HYvTKhLmOUqhbg/N/lMbo41WHbvGs/CVzWbiHUh+polT/GaUEFthh29SfcAHj4+mbcIgmmKaD16
	fun5v76sF3NHbWRv3ziTiIyo40JNUPh0f4pmKa0pf04ZB6SfuD6aqyAAspnK8nLvsjzckxSUMIc
	03lTXU1ytxSI=
X-Google-Smtp-Source: AGHT+IFV+4ue4pHbZ3acCvgAnlMAR5bRIjj1Ic0kd5kGB0kSO79yQHTYUTk7y+Xm+spnNhWWuTTQiQ==
X-Received: by 2002:a17:902:c951:b0:22e:421b:49ad with SMTP id d9443c01a7336-231d454e4bamr23708045ad.46.1747364736303;
        Thu, 15 May 2025 20:05:36 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:35 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 16 May 2025 11:02:58 +0800
Message-Id: <20250516030310.16950-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

---
Changes in v2:
 - Fixed a sparse warning
 - Link to v1: https://lore.kernel.org/r/20250418053239.4351-1-cyan.yang@sifive.com

---
Cyan Yang (12):
  dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension
    description
  riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
  riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor
    extensions
  riscv: hwprobe: Add SiFive vendor extension support and probe for
    xsfqmaccdod and xsfqmaccqoq
  dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
  riscv: Add SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
  dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
  riscv: Add SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

 Documentation/arch/riscv/hwprobe.rst          | 22 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 25 +++++++++++++++++++
 arch/riscv/Kconfig.vendor                     | 13 ++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/sifive.h    | 16 ++++++++++++
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 arch/riscv/kernel/vendor_extensions/sifive.c  | 21 ++++++++++++++++
 .../kernel/vendor_extensions/sifive_hwprobe.c | 22 ++++++++++++++++
 13 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

-- 
2.39.5 (Apple Git-154)

