Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C32E5B1B
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460091; cv=none; b=u24UdNbVBT9WHag21S3XBtHH+gLV7sEqUFx2IRYuLWkBWwITHROngOE8asozWqpZ9vUd8VJnJDacSi8dUupjOFus6PxlWaAEMKQ56uaFuGGih0DtV+5kXQsXSPRzDNmLUHlBVSFUcKO2rOqndiz54dOPgAxPRI9jqPYO4JG+cnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460091; c=relaxed/simple;
	bh=9X9qUD9ipPpSq/A0kUNrN/Gec9csbdil19xTfrCir98=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U/trRDy61xm9UyNaaHGCSIcerBxjj7PcDmmPAZNWvfMCCwCIw38dY90k33lRoas15Ws+GxRTWtt1b/sM+9rU0VBR1RaMn9LXZffcKynawoxGsnzEbqtVcwP72OFPBM4ASnBSrkoDp1VQiWtFDC9JaPKX27FJp5HbXfBLJhHquCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cEXSc3mL; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cEXSc3mL"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so625465a12.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460090; x=1771064890; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhIYGzpYATJxZa6gNLgY5YsbM5g0zoUSoycbocUPjoU=;
        b=cEXSc3mLn6HxCpouYX4dKH/UR5zp0K5Ykfbmj+OGeSu96ybYJf97saF23o0JoaQ3PL
         afvdHn8tRsPOp8jdP5ImHszW2Qj3Xpok8QO7y6ewZ/Cvn/4Hx6QxDAjfo4sGFT7xsLyO
         ZMgvcK5oBicoZRxbvqUyLCMHXnRwoGkw6b5o4r8fhUVQpJBlWZkS6g1iEC8LCKLg0AWd
         +iJ8igMs/xMBwlbocHzI5jtlrNELVdcxO4L/wQ2hwnorPu/5yikXvHPBIFmxMAk0QHWC
         9K+y28BPmiYiYIZhu4qAxC8Rp5hably9vkZQCMK+PO7PpJ0N0Ene1ExrclX9avQY5eNY
         1Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460090; x=1771064890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhIYGzpYATJxZa6gNLgY5YsbM5g0zoUSoycbocUPjoU=;
        b=nB3MFXg/7gb52BJGdhxJamoN0YGMzUHOOSPW0BLAAt13Emn0BN0rFl7QDsXRxFqmm3
         NF3WiRnhWsefyfCtHGelZg92I3F/+STex+bCJhoxqptKZuR4edAHCHHuPQSjkHJP5hMJ
         XR15gS0mM1BQLNdK/XTJm8y4BUtRu1Pu3KxtyDSyys2eniBIdZHE+t/BO1d+9nTHZdDd
         dmaFEF9+503FnIIkxbwqm0t0W4jJT7jQgwq0cqlSPyvgCg2I2WzjFvzuHsdmf0RRoAap
         ndAImgG9gG49aLAtB6dmz7ieIlXp3THA9iA4txRWBMFclixcSch4xwXIzI5iAjXh0hIC
         +iMw==
X-Forwarded-Encrypted: i=1; AJvYcCWKvQC0G3CXInHaH1uokZglDtRhH1SBmHL9iGEQXTJTCmhWrewv0a/uh9vD6jStnggCi2t6J61rgLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzNIklFsBXIDyfJgnKQ9PJdjdfbGsk10p6Jsz6U804Nrj8eLJa
	41fA+kus7US8tM+M2+67d3u7e+Y8//wJcXPqAzAJVwmLj0SJGNv6GZe65at1lj6MO8M=
X-Gm-Gg: AZuq6aLwXVLhtE+mL8w7+jLDQ1tDh4dJ82fGXW88WUm+PE/Sfohyd7AROK6ushtFBwN
	Nwucrh0GDrq+fRnzGYq4dXFH+XsIotPfnNqQqT57pbn0qiHkZIq5kyQn87QzzDs8bt5ueVDJoWl
	LrNVgjD/AnSjWy4booKGb2TDD5d2+AyR8RZK0ew4T6oYTcrrQTdqT2DXR3inQEjTatORpT7eJAL
	N4FsOWJAdJhEqotmo/y311LvWOlk2p2PYu6qnSrBWeUdtwgcGGfyxaXBJeCfH4kWDHdBIZoAC+g
	aeHGlMPD2t4NvieDTCpQ7nmGx6C4ftWQDr6g/z8dStokzpfgmOaZaQgZhICDu+U5JZC4s9in+U5
	hpxJHjUZkkPH+hWC9jQz+S3WROEmb+F/EsA7NyCAxR3NnkFj+DhE6jJh5coJSy1pI0VRxRkfxHa
	sSSFJxnTwiZl7pFxPyXsYn/oF3Tv1vCp8jHG8y0PvSktYrIRSGxT/ijQ==
X-Received: by 2002:a17:902:cf4b:b0:2a8:ac0f:9ae4 with SMTP id d9443c01a7336-2a9522333dcmr53807265ad.48.1770460090653;
        Sat, 07 Feb 2026 02:28:10 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:10 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/8] riscv: Add cpufeature parsing and hwprobe export for
 RVA23 extensions
Date: Sat, 07 Feb 2026 18:27:54 +0800
Message-Id: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKsTh2kC/y2NQQ6CMBBFr9J07Zi2ICgxxnsYFqWMOgugdgohM
 dzdAu7mzc9//ysZAyHLSnxlwImYhj6BPgjp3rZ/IVCbWBplCqV1AcQWcI7gbWBMlx9CBJWXTim
 VoTZOpqoP+KR50z7qnQN+xmSP+1M2NrXd0HUUK9Gvwn3BZGu/Q2a7bVfi+g9OwKPvtm1qYTKgQ
 GPWXEqdu3Oh7oHYcbThmKw3WS/LDxZj1D3cAAAA
X-Change-ID: 20260116-isa-ext-parse-export-047c0003e12c
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Complete the previous series [1] (Patch 6-9), which added DT bindings for
extensions mandatory in the RVA23 Profile, by adding cpufeature parsing
and hwprobe exports.

This patchset is organized so that cpufeature parsing and hwprobe export
(when needed) are grouped together.

Patches 1-2: B extension
Patches   3: Enforce dependency checking for Ziccrse.
Patches 4-6: Handle the RVA23U64 extensions, namely Za64rs,
               Ziccamoa, Ziccif, Zicclsm.
Patches 7-8: Handle the RVA23S64 extensions, namely 1) Ssccptr,
               Sscounterenw, Sstvala, Sstvecd, Ssu64xl, 2) Sha and
               its comprised sub-extensions.

Noted that among all these extensions, I chose to hwprobe only three:
B, Ziccif and Zicclsm. My observation is all recently merged hwprobe
extensions (such as Zaamo, Zicntr, Zicbom) expose instructions or CSR
that userspace directly executes, or hints for userspace prefetch.

Whereas Za64rs and Ziccamoa are named features, currently I don't see
a need for userspace to hwprobe them. They can be added later if a
concrete userspace use case emerges.

Zicclsm is hwprobe exported, previous LKML discussion can be found here:
Conor Dooley noted the need for "bindings, detection and hwprobe key
for Zicclsm" [2] after Palmer's misaligned access clarification [3].

Ziccif guarantees atomic instruction fetches for naturally aligned
instructions. Exposing it through hwprobe allows userspace performing
concurrent code modification (CMODX) to confirm the underlying
hardware guarantee at runtime. See Documentation/arch/riscv/cmodx.rst
[4] for background.

The B extension hwprobe bit uses a system-wide check against the global
ISA bitmap, following the same pattern as C in hwprobe_isa_ext0().

Zicclsm and Ziccif use the per-CPU EXT_KEY() mechanism, consistent with
individual extension exports.

This series is based on next-20260123, plus the sump patchset. Tested on
SpacemiT K3 PICO ITX board, checked both cat /proc/cpuinfo and a hwprobe
userspace testing stub.

Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [1]
Link: https://lore.kernel.org/all/20240524-ruckus-trickily-1cda26c1a455@spud/ [2]
Link: https://lore.kernel.org/all/20240524185600.5919-1-palmer@rivosinc.com/ [3]
Link: https://lore.kernel.org/all/20250407180838.42877-12-andybnac@gmail.com/ [4]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (8):
      riscv: cpufeature: Add parsing for B
      riscv: hwprobe: Add support for probing B
      riscv: cpufeature: Enforce Ziccrse dependency on Zalrsc
      riscv: cpufeature: Add parsing for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      riscv: hwprobe: Add support for probing Zicclsm
      riscv: hwprobe: Add support for probing Ziccif
      riscv: cpufeature: Add parsing for Ssccptr, Sscounterenw, Sstvala, Sstvecd, and Ssu64xl
      riscv: cpufeature: Add parsing for Sha and its comprised extensions

 Documentation/arch/riscv/hwprobe.rst  | 11 ++++++
 arch/riscv/include/asm/hwcap.h        | 18 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  3 ++
 arch/riscv/kernel/cpufeature.c        | 63 ++++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/sys_hwprobe.c       |  5 +++
 5 files changed, 99 insertions(+), 1 deletion(-)
---
base-commit: 4af4e95edc37ae54f64cbd75b46f16ce15f3a6b8
change-id: 20260116-isa-ext-parse-export-047c0003e12c
prerequisite-message-id: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
prerequisite-patch-id: f10e134f9f9291ace47876fa4b2171094838a40b
prerequisite-patch-id: 59a67878b96d6de42a9bad35fc610ef10dabff55
prerequisite-patch-id: 30a3e1b50fc95ab5a521f4dab693d914713992f2

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

