Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08422F0E3C
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752263182; cv=none; b=oOY7LS0iDUP8tX0zdih3Lg1MtqGPAUgf20ZBhuCQhd2RGbKgxKq5x9le8QB5Hj0d7wJOYfsB/OOLfFtvXLjWuyhOP6eKTcn6ROfOQs0Jc1+JI0wALZistrc1/Ohu33kmlemOc8qPnw+Hcla7hqreNhSkLYdjvMbLIZN9KvnOAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752263182; c=relaxed/simple;
	bh=3rWM+6ai+GAHLkW+NDrA2ZDlcBd4pzb4hc2PSkPwx/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8xEzIxIrED+9g0G+m5ofjtIw8aRwou18LZbJKn+hbxmH+UgBLXTPXZvtWP+uytVk8SQ3eEfRDksh+xfVvL0HbhHX+e1SGb4MMhJTZz6CpSujh5PPi+GMJ+X0WSqvHsgI9ShYhANu1TovEL+wUFrYYgcbRY1WOJP83QhDRqq5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VqzHxGRu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VqzHxGRu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2426513b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263180; x=1752867980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=VqzHxGRuFyWb7yi1RfxJyz820IdryJVfsjcg2d+KAjlE856xBXEsACzyEHpekSb8c9
         afeYxcnO2M+6Ops3heIBwoL7+UL7FJA9sSFyaAS6ryX2I5neHmoMsafgQbSFVJbv5Bhl
         HRchJmighc4nxu/YzhAli6Zzl79LRRA+XozSCZqAAH41G6GHUyW9NOugOh2O05NWggau
         55QUysn5WgB4fN5zjN+hEpKkOM0i+Ix9BhpRE+X1ddeHBeS0VD7fjZkatqGk/7mp72hq
         C3bCSe8xVNOh81A9rexdlAPBuX6zAqPaItV7/W0Co0hCOaxsia7LpjrAOGBgEU1pqxGE
         Qptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263180; x=1752867980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AetdkWsxzLbheuZJ3kb+4mhEhv1uz8fN4NCKhkFj5X4=;
        b=Yp1GioLDd4Q/IwBlKsdO2QG3KWHbUNx1YVneGkJnjIgsXl9v/wZ2BN3odScCHCdTti
         coI3sUaepWblVphbRRPdUTD97EREXveLmd8MTkOWlENgabw1xw1MJofyujDZV1xNLLJq
         FYx8kCeDIFEVKGCkTUbrHtx66NxIbX14kKVsT1ldTHhfwe1W1+s0Y5QFloPz7gLXI5RS
         T8o8S1mTV8i6WZnfh0YoclNzJ+6gnedBtqaf/aYoaToJg5RyNi8h/scvJNhZ3pftbpdZ
         igCAVdOlScMXuAfpEIC8l+lYoSyOO/CeLXAtz2C6bZksu4CHkl1a7w7Ccm66orNJqv4l
         2KNA==
X-Forwarded-Encrypted: i=1; AJvYcCVV5Jzq/UR9aTBbdRExuDwx4QUI64LdXG9rgnEyJuV9XRmZMuXuWWQ8mvVoqJfhg8Bhi8PlQE0Lukw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxuFzN3a8H3EiK8z85b2nGqHylvch41/yiRrHOHsX9Km82Oqm
	wCNAbHQhJb5jveifbiiaaqYrygvFDpR8N6ejJuU1f/OwtyHEEfFnR10Idm6DcfNX0y8=
X-Gm-Gg: ASbGncsZR9asFXyGMkYpuYks8YjbIr2dXiPTvuImFbd07ZwWStRjCfDX+6wrEFBC6nQ
	JY5WQcQ/rSLBFqvQ4mOxaeREvs0CkI6YfZfEUUIRBja2r/XB0JQHTC5A3PaALavFw47YzzOVduQ
	bHxwyz0f2xqO1QsXf54SkSAknKUawGZslXbYmQLzsAjqRtr1tK2n55RSG2LGLvncFFcnUgIdy3R
	FccT0/I0I/mjiw0+GazbYq+/0Jpi+mYI5g0i8x50zu5wEpuHGIYN39d1hv+yRyMvCsyPmNAZpHP
	HqD68A/ZadODIlzrtNTa1NSZvXxHlgrH82iCo93e4AKr8HmD3JYsmXFtEqGsHMhZAho6+K6ERp/
	U4PR47J45Li39g1N+rjY21W0zWXlX4E65
X-Google-Smtp-Source: AGHT+IGG9zUveN+w+4yPj09VqnZk/eoU1QYfxfcvhNX9xjSOkBgHVVRYnM8aiNz4kJy5tfw7guLwGg==
X-Received: by 2002:a05:6a00:4644:b0:74c:e253:6c83 with SMTP id d2e1a72fcca58-74ee12977cemr5069378b3a.6.1752263180028;
        Fri, 11 Jul 2025 12:46:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:46:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:07 -0700
Subject: [PATCH v18 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-v5_user_cfi_series-v18-2-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
index ede6a58ccf53..9cfe4381f3cf 100644
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

