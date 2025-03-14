Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335F1FE44A
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988375; cv=none; b=Ee9jiilwMDwnFyNx+ZpESC+9gg+bXy6AZnyCvD01unITd4Ubm7fpGSi2wQn8Hq7fvnWLyHrI7f56agOMiHgV4xQurSZTCpMWorFjfuWf99VxSE/hRZkVa1HnfBKcLiKCm1afPD+JF2UDcEbw1hg5LowPgI/OUtoauedLx1eiLWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988375; c=relaxed/simple;
	bh=DjlSjyKZg5L1RJtFrw9Awsbe+InTSaQHdJt80sHp1pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0kK5fXhMORe9MCXpTMgLxIw9G/sT15lqY/1DCHsGFvOO3O0Xz8MmLJXBVpwMlzLT/KU7WPq65TH9+vOXWx+Jd97yaUlKB6bxWLTRisaGKxjiwowOGHTqoH3eNSXPe8KhZYpDRI58q9hvQtJ3Zb7bpzoIwN/mYXffuTirugia5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MzbqRqCW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MzbqRqCW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22359001f1aso66236395ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988372; x=1742593172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=MzbqRqCWSJ8CtszHi/mnADnI6VJCkta3sH5rI3oL/sEu//8DIaiOQyQyLio8dWhrdR
         LECyZG2hqGQPpt213s+1YoheO8WCRAVw5uWpe1tc+ZRdN2K+HLkAfEzOZO3P7l/WnCLI
         3as/gR34036PfDskYCQR6ryxllVt1nY/86xryJbFDm2nn1NQuMq5hL33PST+Wz65JrQG
         wTFnurV5aywd+Toz+ArM3w+7YFaj9AiOmw3fKH2P74tV0SluPHzVOoJ78jeeLNnpZZZE
         tdgu6zIIzJDa4ilF79lYUChDfWUmBm17g8CmGd9qbXxZ0OBPUSmMkeo+3vjA/fOEExbV
         WQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988372; x=1742593172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=jYZhkKNRErbs5G3ypn6J1vHw7eKVcMmbMb2oxCPSMKZyI6T/MOoKlOYQnB1oYDKgSr
         FoV/1fqSxdzUASR8OmO5NdfzDWvjM3kghCewZP7juRvIwnoTBTnJhh9YkmOEREk5YEk2
         gIwnCKks2IcF1xt1dBbYK7iYabLM91WOHZhePG07mWbKN7smvn6Z2Mz/9DwfoL/P9YqI
         jVZI44LkMqrIxd4HARDnpnDq7UlfKzPjjf+C6SFZ4dF2Trd6+riS0KV3SFk2mfKZ2QTv
         aCnsuem4c+tENtDfCYIq1+eiJ54K1UjaYtvuNgR791PN21d/4/kn55AVoqE9KVNTPdMI
         24IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6XIri0q3KBjtKIsk9XAfmBdkgcO8gSYlrxgvZuYqG1arvzh484rpaQ6dkbmNxSbaQedKdA2QJldg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYPNhi8cwDaw0kJECNvw6FXKB3baMQ4z7Sw4qEkQdQQGRFEcB
	5YFZU36qVbezqmy+4Co/dnK/O0sugAS4nt576YXC7VvEttviM7SZK0Vv+ALgOFI=
X-Gm-Gg: ASbGncsxweucV+juGhqZfwINdykeKAl40MwpepdXJyhINlqgSlH8LY5TR8Rqa0OB4rn
	qDDzWw20BWXkzCDoA15QaEIjjgPThVGsSuQxmh7STyWWIRyb97Kr8zxXOBCGQUUijzU6KaPI5tZ
	ci+yYeDO13nG8AKekwnNuj3FYYfO+ocJMudzSb6tQtstGlpKKlrPSmv+7a0UzvLMaMzEsRSJU3q
	oHIOVLVLsX6uA3I0aMWW20XlytQ3m/ZaYVZP+BP58AXX5HhlWHHwiF3ti/WWxRtQb4hlrHSLhzi
	yzjGk8SoI0ZRP+L7ez41UXEU0dr9em3n2e672GMf3CFDy17jbL+/LQ0=
X-Google-Smtp-Source: AGHT+IHD2xqF6ISXqrc66wt93NwJ9QpiMUhs8Y+9GVF8Ev9srJWeDiSZWraNiRIMMMrHSoWJEgWxBw==
X-Received: by 2002:a17:902:d50e:b0:215:94eb:adb6 with SMTP id d9443c01a7336-225e0aee9bbmr48831645ad.40.1741988372408;
        Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:21 -0700
Subject: [PATCH v12 02/28] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-v5_user_cfi_series-v12-2-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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

