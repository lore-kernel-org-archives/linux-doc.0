Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F491228389
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718521; cv=none; b=vGfr+Q42EAQmCVdrV6vGogNlH7PAJbLsfQ7cuqAc4hDd7qGa6fG5R0HzAdD0N0oJ1ZAJRdC/qibC7zr0xs8+Att2GK3ti0qWoWgds3D5m8mme7ikmvbBSYWpCSPwFYL3feXG/+NJeBAGCvgNvvrEDwRBLiLLIelzRonOAwQOiy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718521; c=relaxed/simple;
	bh=DjlSjyKZg5L1RJtFrw9Awsbe+InTSaQHdJt80sHp1pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J93tRtPgBptZ388Rw2m6Q4VDIdwky6LE7/vmBssC5EzEBbWBQx1hcZZ/dVlAoNs8cTesl8DcKsONDSX2n5u0d8NWQBMDN4YVrWZfyklD5wwb/n0fPSZxXaEmz3vUi2Kv8mThnkdBF7T6aTUpcaPo6Wz2hCVcudnNzLVOEcHx+KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2SuG2IHV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2SuG2IHV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f0bc811dbso5059245ad.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718518; x=1739323318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=2SuG2IHVeSCEy6VslnXTwB1Zyu/SHh9Xyt5jI/6LbsU5hfYh219JX9L4ybPfJlIiRe
         BbbhC6+r5Ctti+6beAwhJJjoeR63cAK6cm+dhfolEguRVT2ghxGxHuovStB6+pLoIXl3
         NmE3JpCLdmV4UaKXd7hSNcG1pN//dL98bPc+ujkyp7Xj4jfKT22LlerO54Qf5iy1rf9o
         RUYoP+V90ugw0o54SFc1as1qQ1s4BZjgsmVusccJO/IOVThSE8ZGoCa0q6Z07R9DfmN4
         0CF9EcPLqY9H43h+FqUpHI/ymJiU9hEQckyhv9e6S18718YY+awAugVgIvqJa5XVHwpZ
         dH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718518; x=1739323318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=nCsG8A+X8Ozln8erjTl9OfFSD3cseRYtcbUDV5EosnHBYMqYpUWQUkg5HT2CzDBY49
         WpqFJK44Cv2BRD1mPDB3+ywbMnpg3vgzJ08zNn4a2HIbmJLoMoSsh4phkj3+cQQAqP8o
         sNNcEBJmjnsV1plylX+clckUThEyH0+jWZikOaNw1VlzGY96t4SHRRCM5Nob0EZefoHx
         PGXFZbzpWMNar3586aa7rE5zDtTtY8/zm00Q/t/3y5rMNVb3K0UA8Azj73l7fmLZcCMX
         hdyTepw2QbbWjwsv2x8VDJPCZLQKbwluAF7Pnn9cHaout+PWmDEtGje5u3jO9rRR2sIi
         s5JA==
X-Forwarded-Encrypted: i=1; AJvYcCVuwqyPV4ZNNKet1fLyrRWmoDGBjP+MYZh+h/QapenCCI1gf1YaKqIN6sRnibQLKvvBjfhc5XMu5r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfR0kkyi6xI3Pm+3dq6EV1aIzrupX5QX8xjGhGZzNWpShYjJc
	HoHHvh8y/Z1eYEcD5os/ztuPO6ry69G2O5slgVDupAn/BWnoxFUqiK4DaQrvIqY=
X-Gm-Gg: ASbGnctMwBNDlcZUIbQvJFA5TEMwNuNqZqAfoJutXXyWBUAv3o4VsS2J+9aZ9u2oQgW
	w5zoBRT6n3n8mBs7F6c9oAZYRtL0EtwL6sp3/brGH2JeslfLlgrSt2+KOO3HPs5UBcsYe0uze1Z
	EYAlUcTVFXoDY168EZmWquKfd5bXW1zBCn76YwAycV7+UtkdTRKbM2uvaNhqWeNva34qpYQm0ic
	y11Pxn5xASil2Z7ApJuuOynkv60ejWIXYIxLFbWCo0N2CHnYT5rmTZgXuDyoUbklSqx75tsIqtI
	camyBEsXEhi4pMQcKzBVuGYPQg==
X-Google-Smtp-Source: AGHT+IHzHonQ1oXGudf3ZfMVrMZV3mKwGoRuXs9FutPohSBaJGIm20BPBEq9+EHRoF58EkXIbMe1gA==
X-Received: by 2002:aa7:888c:0:b0:726:a820:921d with SMTP id d2e1a72fcca58-7303523eaaamr1533935b3a.10.1738718517175;
        Tue, 04 Feb 2025 17:21:57 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:21:56 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:49 -0800
Subject: [PATCH v9 02/26] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-2-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..9b9024dbc8d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -426,6 +426,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.34.1

