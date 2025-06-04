Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9731F869F
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057381; cv=none; b=rZHF4VHYb+aZO92dvS6tZrwbrwKY9CetPhqvZMpnqKJDTIflfbDsdXgwMSibGaEvFlsDtKiwUyo8C25aPDUSSsmEFuZ7s7urpPfn4cg9sbz6GVqP2r+lNFS+JD54VIFYfFwsvUsci9ETlG80nOHECEy6vanghMU5u3F8igjtub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057381; c=relaxed/simple;
	bh=0tq61D9uccU6FiQqC8xv/y4u19vkZ7ShJckqXhsFT6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRmoU3UZAnKW7W+/1vW0Qqio13nLHsbkddzK1iGIm2ayjbVJwIZhJwyQJ7rDFYFfAb7j7qXlIi52YEAESytSD4scUFgKlUP9f0xKC5sPxbiXYHf1fceCwH3XLkU7bOjiJ5FrK5jntrEPAsoDbdyyEeP/ClCRlltpxxrZrDp9VJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YYZImV4X; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YYZImV4X"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3109f106867so111470a91.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749057379; x=1749662179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=YYZImV4XAxaoX3dv1PEm4++u4SUVmagxZ5gO6578St8oHtI9Yq+C54jWNio035aFQf
         drwQ3kAA3DWXVEF6TtBub4CmoS9epqX1qBGuI2QO1+5lZXtOBTGVE0SX03C6xSAu9fEu
         Tr4zKwupKeBjLdh6ErJEYkCd1xy4g4jnxDH1Ym8H+SxRYMkeBUIx1FYBMlN9119NH5dL
         H1fBBhuK4mjP7hF1PqMyRbvfRpMV3oocFkNTwwctZ/K1t9RfRXO65DhgeYUwBGmf93Vi
         gIKTKg08X7Ew2fjPwnTqqoPyW+YKVNXypYnZ1w5elSzyRmmN+/u3Q90Vq4S8Si7w+AHt
         Q6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057379; x=1749662179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHp8skVfcDwQ99Y8qvuLL+UOu6n4/KmOGLmf3JbJ7iE=;
        b=j+vGov2qzr69/aPKmEkKt+5D6DDEHVHDgV9PEMwfoed9grT9KQoHXB2r0Gw2vRofv9
         Dz+fqsGjZD21GurTUAi2r3eJLKu1rkxdXOL7P2b4Ptdju4Q3vpyAANtYc/yLABaAa40d
         mOrRZCHd4JKwK6cgl6Y7Fu7QIyl+izzLb+0yW3WJXBtRbqZofFO/Q2OX8MkbIB2f1Gsn
         aOinplYNcApbi2q+0sZBSLdeElpepZaaldnqAhUxesGupsjKAxi92kHH4A+VQdTTumLc
         Q9gn/5ayF4TSEXh+IoGlrKhy5eihDlFJeIlM23JcsFE9JiJF2LIXndkt0MnKQYdsXGrx
         kyBg==
X-Forwarded-Encrypted: i=1; AJvYcCUXy3Pkx1eVpINPM5N51wapvALYIyHOJjQd1FEIy8I3kj9YJ05C4o85ZAyXY4P3LVQm/slwDezhJIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJSNy+UNtdyASMiexLPKTqzvwUZ2MI/gd8KD/F9bpKfEDdiYv
	RGLR/kjLdJ6tmsT3I8mi0FawcsbCG10Kol81zDruqg71gsmOmzNbdHhy7nqKMeauWXc=
X-Gm-Gg: ASbGnctnNTgXDcoShJdo/fzwAmHtIx/h96YYl89E/+m+QP9xfr5a8dHmRT1htw5+GOp
	ouZLpUQRtbChgSzU00cqqIyeVFuZJUUUun47xPV1L2rScZx03BSFsf4dHM/lHQq2Puw4KRXm6Aq
	L7TICnP9AhLsbYSuqkgqiKbe2kzl67oWDrMR3lPmKlKAZ3cThn3Hcsf1TUh9FMyBVhQZUB4tGmn
	hQVtELHfei+h4i/k/aL/9zvPRDXaldI+Sp6029Ps5CmXdq2AZrn/o9V+UizpQySVqvov8BLMjLc
	7RbqDvPoU02HZWjSePn7O2ivBS43TqnXigm+dbkAklvksqkBCYRcua+pVGdARbzpOUFzAGm/
X-Google-Smtp-Source: AGHT+IGkexVwRd4MBugt686K9ooA6BwNW7BY3mlzIvdhU2r4+d354fip8huOwZDJ0pdHlmWrSOoHpw==
X-Received: by 2002:a17:90b:2692:b0:313:279d:665c with SMTP id 98e67ed59e1d1-313279d6ba1mr1336750a91.7.1749057379093;
        Wed, 04 Jun 2025 10:16:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9c9fsm9178972a91.30.2025.06.04.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:16:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 04 Jun 2025 10:15:26 -0700
Subject: [PATCH v17 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-v5_user_cfi_series-v17-2-4565c2cf869f@rivosinc.com>
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
In-Reply-To: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
index bcab59e0cc2e..c9e68bdbf099 100644
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

