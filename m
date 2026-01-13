Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3A30F94C
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290376; cv=none; b=jjgpVOSlsb85pkVZQWlPVHil3dA+xgausH12HmC/fPpINqCWym1XpdrONg8MMAmWXMv3Mh+voMVQ8Xu963TDdlMI0piTyBDZVDBwRjZ+UjZ2y4P5zhUAJH9WNcXD7ek93KeIxDmwSEp2SP2Z9sdQzt4t63tKMXFgFT61N/kPdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290376; c=relaxed/simple;
	bh=G/wZDvuQOJ/sIgMSogrhCI0LOUdTTDMoWlE7v4CDGBw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iOBowvrUj9IVGNW0ONBsd6iN+X2AbpKo2twwnPnbITlM5Cgm1Mm+O5gmGLDz+dnnRD66OHtuDbXPwcb/XRbZ9U6HZaDmz1DhP/mGDeELyPJK1hVkftCQRE8CAWwOYGBNq+eivJLv2Fp8JLG1j2MB3Ro3+GYMr4VKXHDSqrPDwuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=On/Uzie+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="On/Uzie+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a09757004cso66223625ad.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 23:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768290371; x=1768895171; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=On/Uzie+HCknzvJKw6z4ikjUIKR+F4aes6QTrWNxTQ61gXuF/H+G00dZIJUDAOEWjD
         WDSbuVEYNMP0P1MXUbgmG/lnVDwekQWHQ2+Lg5wtW7EaTD65DK3HulnGY5R1tMT16C3d
         SggF/SREUlGSAfMDLhdhYuGJPTUMjLj0gGIenP+CersPCCl4U1CbskPUmQrdztYvCaLM
         uCW9s9fn8dojVdbk/q48zT4KkFkMcm2J3W0wX9vcEgZOCDXGIQEeiOA62W6p/McNXiYQ
         qTA7GnnZjrcFegjBejoy50MhPUOmcyfk8Jzq9xgotbmVMwQr5qyvPQg/0vnpKyhZDZQ5
         n5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290371; x=1768895171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVxSFr5roBVYFLRhnAgNNp/8sMao7GowEf9CUckDDWw=;
        b=PZlDmoVKwLXIisn+Oqachytl2LTHLmwGCPTSxkmZs0T4OjTTJkbpoG2zmbRNfpObFA
         4/82gUBwPwkUdHPATJA19u0dgoYNzAbJ0Wh1jYrkAGcRRm60oKCbbXlAFK/FCDyz8Vec
         1wc8UL8Io11BpUvwGiFv35yyYnnjVeBo9oD7lCGIEPHK+LGsaczzjTRWLaEIV9J8EJct
         A1FkIOYtXSJVnXd0ak6WPazIwdpjRaWPAitVbhEotRtov87B/jNFmMVASVLSLZHfwo6i
         xsnTieCRaUJnWPEs9ipFRDLMEsdgZtgdrQCU0643DFwuoaQxs1XrgoPeKFvn9b35qryk
         0IMA==
X-Forwarded-Encrypted: i=1; AJvYcCXVF0MW0/oydEnpRG1f/sIM5SAqSvKIWPaN6JmQpLQhnbyXEMF+hwXiQ2mzh+2D1J2humnYwXNpgOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4LkOwlJL8rbcJYdQYLzUwGwlMaJd1u8jCrah+ktZgHINRocL
	uV/TycavxIlYcNh3weNQj+lA/uw7irFqrrZOjKIXChNhKPHpL+TpGZM9WgNynpmhnmY=
X-Gm-Gg: AY/fxX6eUgaa4AC0MplTkC8YVT5wuZIb1ta0qlg5RrFMbXwlwJ6x3bOZdOQh3Nzi2aQ
	VZOKcW89KBOv36KULwNDDjE/2Gb94AscUlSebPlyJnWC2E+7fXl8jtVMeQU1CQ5CgR56jzWHvR9
	EsNOvHwy7MT7DIKjputgvNv6SLDoyY12MUAjNe/zHkP2ZipOkob4dDckHRSFEMCb3V1RVnxEb2w
	gha/2gHlJfafoFesdt92QbQJXmy5TlGqqyr8OSjI6Ym/hEmu7T0oCHiDj3IgtTDqIRJuePdUe09
	cZVGg4DQueLIF4DYZB8Go4Oh5/zCDYCYqdGOfYvANUvo5Xlf5FqZ6z+yR1o3M4llgzE+n/ORxD8
	3yhMLgutIWsuuxxirhmNlgfoJjeVcFJdFkP/OZui44xvBAUAe3LBCFbhgHDAhDt0md+3QMJMBfJ
	SjNbSiVxipvIyQ0aCKubGlIZWqWldwp8ISFlmxJdqDSHHDI5eb4blskg==
X-Google-Smtp-Source: AGHT+IHbHcGmc6lMn+EQWcpZEtvrjvUz6htmK3Tb0lxfDS12q7Bh+oS5FfObSwVuTxLhekVSu4CkJg==
X-Received: by 2002:a17:903:1a6b:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a3ee41516dmr200714135ad.1.1768290371623;
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd4bd8sm190956165ad.102.2026.01.12.23.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:46:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Date: Tue, 13 Jan 2026 15:45:52 +0800
Message-Id: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADD4ZWkC/y3NwQ6CMAyA4VchO1uzMRQhxvgehsNgHTaGoeskJ
 oR3d4LHv2m/zoIxELKos1kEnIhp9CnULhPd3fgegWxqkcv8KJXSYKwl30MLNjKBKk6lKg5aO1m
 KdPMM6Oizerdm64Cvd2LjNhQDMpuVrbPzX5Xw0NAapi6pMBUgwRZV7rTR0jlzDcQdRxP23Thcf
 m/SLkKKgWKdefxE2CRZiWZZvrj2++7VAAAA
X-Change-ID: 20260113-adding-b-dtsi-148714533f07
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

The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
much later than its component extensions zba/zbb/zbs (June 2021). Recent
updates to the device tree bindings [2] enforce that when all three
component extensions are present, "b" must also be specified. Related
discussion can also be found in [1].

Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
It is a trivial update, but can help readers reference the correct
document version.

Patch 2 adds "b" after "c" in 3 device tree files (anlogic, sophgo and
spacemit), fixing the related dtbs_check warnings.

This patchset is based on top of linux-next, tag: next-20260109, and
depends on [2].

Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/ [1]
Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [2]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (2):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order
      riscv: dts: Add "b" ISA extension to existing devicetrees

 Documentation/arch/riscv/uabi.rst           |   4 +-
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 4 files changed, 150 insertions(+), 147 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-adding-b-dtsi-148714533f07
prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

