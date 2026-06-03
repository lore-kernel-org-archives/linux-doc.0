Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524F3CE080
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 23:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442047; cv=none; b=bq0YBrKODVbqElH5HABcEuJhzxdHkiJJ4MCLNZ8YqwOEB5Q4ZFTroGIRv6/UcU+MFz+S1kHz6Il+5Z+mVz+nUUYDyuXNTKKA12oWVp2gunjMTP3fKGL4ZFNqS7fdb3fCv7JFBUfjqdPNVp+zNpxYfNpwXzMU7DDDRJW2fLlHJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442047; c=relaxed/simple;
	bh=iGkU1xGI6N0CG6KK3Wa2Gjx9gV+MFto48jC9Pj8TI+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UdwLByCInDs8QtNkvfSru9UTcDDaxuEUqkzypQY/pAssGIfYkSHUUGdymuyTUj6KQ7pznbDBf7+bJhQwp6G71gHJ81aeVN7vfShzyZhd3+4TCRxqk8MCYmCUK3d9ZQTze2svijpPtxhOav7TdxY87ITjtUBg5E8JuevRkLYK3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhQBiors; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhQBiors"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85b2139015so1037585a12.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442045; x=1781046845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=ZhQBiorsJCvdSRRUvcvQMT4SCDp3jUiVIPo7ssAJ6dYBQCsVxk2du5jMqvsHv4rhS0
         DvOgqnRH6CC81Z5zSJQgGPO2YdicRSfcAy0NqPVKi7ORfSoKyG9OLgvoNYLUbXG5Mk+N
         BJckfMa99Iw3gt8UwAe8Ne0F4DctQW0ud0RzT4yoIBj8tSWhwAhLVc/4pv1m6cEuUz75
         30iDNHHxkHqzVRkGZ2Kl+Gs2cqubS4qddM/UuhVapYxEDLv0K9e+U+ENpBuEVIgRpbmL
         0iA4wKFdGOhP1PjQCv8aDUarJSuqfcUdSOTotxzlsM1WA2dq8TEgYtIudB/LnRKQ+sfn
         hMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442045; x=1781046845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=PvYSjDHX5JTlJTp4eauxc8wfdDTh6WvZxUtq/V2wFWMsgIBj7EnjGML+SZlCpTOKEf
         VxCCwClwZYwCPpvdRTH0KLOk4sJVqkc04D1WgqhWaPcAndsl0hAGVAvl7jmNY1hkhQUY
         PaDJnoXIBrSFCfTWoTvByQ7wMMHreByUL66X0Vubnys2spxQ9ntz9p9N7c+8MHdDRzib
         KeA/GnP9ZfQVHtHInMqQVywcZIF84AbKwN05nxCmfkbyNBJ7lh/05jssyFc2zstoU2LX
         k/xSEzisGQxrkdRCmid9lCjUXwCVCNXzhR9FGfwdj9355PqgnQXlOixBVW0dKQfmJYRw
         Q+nw==
X-Gm-Message-State: AOJu0YyDQGXSGyOeY/X1RKs9caflmr3+if7e9nM7Gm+3vp0QZnrA3IhU
	CsZZyJlAYfVmS9YIqTgTeid8KGiIMjuQLI51EJ8vAZIUUmhy4ZpBm3l9
X-Gm-Gg: Acq92OEhGbVHr9RtDYrm8T3CLv4I8pDk5NrNLsRPuMfYMgUX0DEI5vdor3N4m/M9N6G
	EW5QKrqs/o+af+L73OKK7ABnecMsmlPYedZ0aMp4c0d3xfk1+fQXWy/EB/oQwjUFCvCVMKbVUhr
	H84BHDBYTuxocMzWSdAWxmN5RfO2AAPqDEEIUkTiLrGSD6s9vaafRhX9iWX7sBjatNZRXG8KwGl
	DYAGn72scBjc44f/kyuG/cJQOJLkECR2pVtaNcNGBZMPWEyM5vd7faBGPyl7aAWZV1NWsjwEnei
	E2YMXFGKI9JTfRojQ/4J5cLogw99fyV19i1qbq2yebbsQCmJ296pn4ZEP9LYpOOItaqiQoZT+pu
	mWICmIQ2n/Nq1fykBSzNv28g7qsgxqcGvvMR1eHJAwmMi5sD2ynN1BoVShAbRLhjvczr82Ir6hF
	47Z53Henk5VQ==
X-Received: by 2002:a17:902:d4c6:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2c1644dc902mr7074735ad.40.1780442045431;
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:02 -0400
Subject: [PATCH v3 07/15] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-7-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=iGkU1xGI6N0CG6KK3Wa2Gjx9gV+MFto48jC9Pj8TI+0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhZX60yng3sfSKyeLnNFOnCOeau1WPd/DvXlT9Msl
 vy5zSPbUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABP5eoLhf7ZSe7qiblJtxs30
 XtUralUK+yu+KhZlh9p7rtwxO1qzgeGfHcvSFV6qKy/IL1czmcDivZPrbkamCJ/8EevA1Zzcfdz
 sAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions.  As
Zic64b is the architectural guarantee that the cache block size is 64
bytes, also require a hart that advertises it to report cbom/cbop/cboz
block sizes of 64, so dtbs_check rejects an inconsistent description.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..ec1c9473d4256 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -590,6 +590,12 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0

