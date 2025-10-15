Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF2302CDE
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552028; cv=none; b=VGQ6qLLaKb50El9LUxrnxPeMv+eDpnsyYCdTej6HJpwYb3pZ2oGmYau59y2PFB7iztaAQlZtXBNFtM+UDgI3UNaHH2yFQwh8MlObOaJHyDNxGhTi2RpLkvuUgihyaCVimUxRkS4KR+4+s3IFFGQyY7LvspkiX35UPfWbXYTjW+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552028; c=relaxed/simple;
	bh=onQZPDO/5PI+EGQWomoauY3V7EJZG9au2H7fkbOgnBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRrlcpjEzHSNbxkRaSwA0phO4/wR2u4Jm1XjPw9AZPXnkE3lVgdyLra/aODT4kEcF7wEQ1fv82YEm3noFN1+6ko+thLxEzQ10IMPLoF0HOsj0deJXAygshKmauiqUA8e+y8Kc9O/IoTPlez9dAD2RbvC11/Hh4Zw72uEF7VAjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Q8ZFNbuH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Q8ZFNbuH"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso6731175b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552026; x=1761156826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=Q8ZFNbuHG2AEPhvEZXnbKpfGdBxs1HiFJF2cXbOmjFhGMg+0wAW9f0N+5Y7bT6Gi3i
         wQM49YzIJ2xf1vqe6zUcbjH/aoX2sG0Yh98I+beaUiJJDSesmRbnL31I0ty/6IA4sWyD
         g1zJ2YY/UWV0+UIDaoqrO0vFEk9INv12rom6K6QkWZ/G1epvAaAt23W5p9kQ4e3PouYW
         hby/wsuD17jm9OC1Pv2+l0wOenDvPIu7kJl+rgCyOK/JV47kn+LXjds71cRBa5ihq/Bv
         PbwYkf5dSh5SYSh0KQ2UGi7ZcPpBrLLjF2fCC7OXD2UTHqhti4mGHKhZwnQI0vlj4QNZ
         5YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552026; x=1761156826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Vc18KrWuMNfUoArR2DO1WTDm9aMJ2VnekXi8RaYkOI=;
        b=WSny8+W3XsfakQ/qU1peC/oUnLgr4WslQUnYoMbZBiJM5gq0qdFfb7Pmk6AC8Dg/Aw
         33v44NNoLs29diYLAdYtx6vCV+sOKKNy082EMwsM69/kSO8ysYinU0/3mC9X2zOnCJhj
         Rhl21LbRbDJNDw7nmnQEpt74pn1aKwwzzXz/Wnrwv7i1xvIWI4u8/4wlzBvBDqXj5JK7
         CRLdvmwegZUjbhNwcGlABc5BglkdHbZiaTUR1Gu6jGPqiOwhnYuE1c4/U5/s/QPFPFCk
         iXYhwuopDzAuCV0Id/hZEpBThzL+HDjEjH47i5CyeWfeenJ/h4iD/YJYX5BMwHKfkshJ
         TaHg==
X-Forwarded-Encrypted: i=1; AJvYcCWy8U0r9dVs2nv3Y+GX+FSzIos6Lpyzw3wswhc9JIuZjhhNA0E7RnSJ1aa/Gjx/UQAFnHzVJFdVxLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrBF+vPR1jQ2g5bpjeJB4gCCkSmseAJcDOaiIGAvfEzPFFT3C+
	WvB6bBMTq689AgbGrvZXkH54UrhFmiayKrqMCxa1oVaqJoejcjYO8m/IxZKDl+tvgqs=
X-Gm-Gg: ASbGncs0oR6kOpt71B5BlTnnaKGl6vLrnx6y6MkG+ATZyBCxIqY3db0F6k8+Bw2QMiP
	Icx0tiQNrJ5C3Z2P4E1/kl+cNcTx4U8Zk2lWWmachjhFXy9y8YuRpgXfsAw3nViqCTzemC8HfSa
	VQdPipJu1SxfiZBmTum9r0vuqs+sETB6DPffBjRdEAHRRlpRrXMJaL/wJKBbKn41/2GL+sbshZs
	pFbHlDvASeQWdofDdwdYnRiNxiax6+sZ8PRxUQLf8ayALZNByy6dy8p7s3ceE0c7xTY00Tgr/NE
	v498XBuv4o54mAkJBdhE+t6SNOlXmxkdVzoZzOhJnMWVxhSEMrsmey0kBTo+Q2X3TMqDAU0bbL/
	eNsG3K0yLvotzCFOu4WmjIgdDbF3Woq/QgNmSTvad1XK86ynoaYk=
X-Google-Smtp-Source: AGHT+IG5lE0uCP31F892Rhz+3o+LdNX1Rw5571X/JjIijPM/WottLx6odEgFGO357kvJF6BtLvDxeg==
X-Received: by 2002:a17:903:3c25:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-290273ef107mr347052995ad.32.1760552026115;
        Wed, 15 Oct 2025 11:13:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:34 -0700
Subject: [PATCH v21 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-2-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 543ac94718e8..3222326e32eb 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -444,6 +444,20 @@ properties:
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
2.43.0

