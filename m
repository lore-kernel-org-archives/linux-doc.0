Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719C39A076
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208854; cv=none; b=akzQNzFDhCiaFafQpPtVrxyVg+LT4UFkXnfh66ukhGwZBskgCT8io1FvKg5oEkZlfML0tMjBHrgMwiWaxjWcnJvWiyqX+h+RiiPlb1MeOy1TPh/SeFtGFdwmA7IWI7+CE1ooQ0fj0xsUCy0pKJzjKKEpcOjbgn2iGV3MdiKeoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208854; c=relaxed/simple;
	bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LzTD4ffs2c1wk+T4AROPgv8sThaZrTtZl/1OX1S+9DIpHXM+yQGENAX//mC0LM/DkW1XigYrbQLF4lKYSfxcxvhKxj/V8DitDg8k/qUl5ap8tt6nsmyIPVZeugHSNsI2G+3qUD+FKCHMewErZm6XGGSU9q7s0OxV7oo/AA3dPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mx0PxvyB; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mx0PxvyB"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8573e75425so80892a12.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208852; x=1781813652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=mx0PxvyByqbsUbMbFuwjACk0mTEQSjhhIFFfIE5yP315DV1ZjiJINg3vWjJdp/Qo9u
         lV75tzv1n9n9FuZAwfqE1j2YtoeNXJH2Dkar/9ngGbFSGvTZOkxbyLyzm4CUBlD1tZnb
         AzwFG3QB99qYt0YhL9TH6MsWGG+3clDP7HRHmaVnBciC/hVHvE6MTaur9Fnx73lJKu1r
         +LFhiVtOHao1Cqxyhgq7dEvqtBDLjs2ivB60y2Ox6ce7cUb+++AekURqrF4O5bbhXrYS
         X04by9bAt/D/1G8VISHu5ehvkMXH0DrhCATm9pZ7KeNFFxBTNJW1P5DROimBovKKndx+
         U3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208852; x=1781813652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=Cu0Iujo9NYCegub9f6O8Qq9NN4eIeRrPBftkw1SMKOyVK2ta3PdDTAoqyvzL+ElcsX
         MdIgh+Ttl1J66Wm5a+B5+nfsVSQGq8g/5K6aKwyR4Ame0TjxYgAEHsaEl8RmLj04OAw+
         GmkoZR0baq0f3pt4kFOCUiQf4mRbLZBKp4UsDHHzyMm4OTahNH/Xd75bORGJgF1ju1Cr
         kIvK3bmCOUtKVHWNqkOS6GBwzSN89/lgBdkVno0lz6etiXhMQGldQGgVHtrsiKEdVXv7
         ASMir48LEh57put9vlWMdfgnw0HJpmSAFKN0DRYPIITwx9NkAg4NVvtFtBb9w+NlOkZ4
         MtVg==
X-Gm-Message-State: AOJu0Yxn60GvYMqiP5BcOc2k4Bpo+9qZt6uwv/g1CP7UtnDAT8+nOUmN
	ZyvGX5TVFaPIVCty9zCn2DxtToRf0g3mPM35DjW02tK5h3AFZJAn6e+8
X-Gm-Gg: Acq92OFMC3RLRx3MPX0PVz/AeXKWWelmCg8RS3d7rmtsFftrMCUtbcJUw0Yb9N6KT8h
	1zMBamerAnihZKYCR+GNgBhlbzhbXPWhBN3l3vj4UUnP4tuLTuZuYmQTIxAXxbiRM1ZT7SBkZF0
	hvKMll2B+JptIzlVM9uo773Sh5P4BcyrYw8gRApuLEj7ye5KBvUFJQukuZrcaCFwfePQWENjY9i
	3mFOHol28kcSr76DF6sv3CYT1AUyXT6/5Lie10GGpeECNAK/BryeAqX4vF3iJQwizDDDhJh/vHw
	8ozTGICog15qo9roMESbY1aZ9Kc8DjKsUphmaDKHqb5o7XxnqqooYo27RoR6UhQ47+fxWV6UXBK
	duLblAXeHeIhvXdLmitb9Uqfu+4Ptep1eTpv+4hDb3KryWY03XVnsZyBUpfTYv46RcWXIaWFuqg
	==
X-Received: by 2002:a17:902:c407:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c2f2d5b823mr49982165ad.32.1781208851778;
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:45 -0400
Subject: [PATCH v4 08/16] dt-bindings: riscv: Add Zic64b extension
 description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
 b=kA0DAAoWgrIluVNoGREByyZiAGorFsGj1LKmqSZuxM3ds1D1JnMhsEQYTedSZCio+Vjz0G5Wp
 4h1BAAWCgAdFiEEw8WEa7XqTFtN5wn4grIluVNoGREFAmorFsEACgkQgrIluVNoGRFeTgEAlm4q
 TS0RrfZZaJySqif9VGXq49FSo90l1aGtPT74WfsA/0Z6QPZvvgDRClq2yD8QKSJAIMfvQbF+DxU
 A/TYM7CQF
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a  schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..1c24999beb59e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -494,6 +494,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
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

