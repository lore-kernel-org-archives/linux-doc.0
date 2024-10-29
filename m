Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466F20E029
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245475; cv=none; b=KypecNynfd18aqlk5oz2HAFcZHgO25rX0/D9ZQ/2nEON43WHuunuqJ1fc2cLkOlcHwnLMJqfCRbIdpuyZ2po8kn1UupJaFFdLA1mVwprhXJldIa07uOkbB14EhJE3skFuJEPHHz8sV2XW24Kn8+sweRjVxlWGYt8Jo2OoozDU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245475; c=relaxed/simple;
	bh=35FkYSG+J4y3QJq1mLXVeHO3QekabQvwyuf6ZmAOm28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gSUhCTdrvtpuYquiiALEFmsE+SqdTvbfV0KGsFHL1XswwbBRawKmDp43RYy1mAJw0JROKJDfNNemutALlHH8MlE0kQM0N2yurlNPah8ZFPcvlFbySFfJO3Jn41VGE47dsjOhH1olYfyqDWmpGbkiNVE9CqF4cIGNEKjcknMrqLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qhGalQZQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qhGalQZQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e467c3996so4617365b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245471; x=1730850271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqlGzJEOA0rIxMbra4aAEQkUCqIib9RSzM8TmOHOkBA=;
        b=qhGalQZQlDRpden4R+Tx+1CiX38EywVzIoTXYgCbuR9ui1kquD1aLE5p5Bfpt+Dh9n
         MB694030YvczW6QW7mf/6kjL+vV46wMHUFDSL0JQxPI7wESg7YxdxoukStjbuDA9G4ci
         n9DfnhboYYq0bFQ3IugCc5tNw4HS4FVCvo2PAysLF/DilBk8EeTJpTr/ONpUAoESx6tu
         ycKvcR+uheLC83+V/8cLQMJz8OL3Zsx6Gf4vj+di0WFWeh+pt3egJuFhLH3op3JDIalh
         Ocu6C8PJf6OHvdzDKagtcH+u7g/cU+HvL8XL7yftRI8u2V9xNkZUwiw32/Om+LjEgvk+
         +8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245471; x=1730850271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqlGzJEOA0rIxMbra4aAEQkUCqIib9RSzM8TmOHOkBA=;
        b=ceNSb+8QQNZhga0Yq4oFw1DHtwCPamEbmIUZaLqtsHBcNtcP6bSEkrILfl5zhB6nVc
         viHYETbZOPODok9Qa7xfTNOtDSPVlxRTGJT6zYz+9ebYNn5GXf/oZf4lzA5lEss6rtoO
         3vYMb1y7xCLq4/5ktq/HCO2fmgJs0hjve+nE7SAJcH04HUCHzASMPp0fcwjgoCmpm5la
         KDWO4IKDBVjVuHLLpE06UyYbQUW5G9rNqDD4KQhqBaeQPr1gs5ibQn+E8gt8uhtep8C3
         80GeWbPNQW4iQo0IG2uFBHFMCdS6kvfvnZiPHvP0dXN4QOXcxVUA1DU0Me3vpkO0m50G
         D1iA==
X-Forwarded-Encrypted: i=1; AJvYcCWAspx8cNf8Vl+SqfhFLOl0tpr4UXeQ2KO/0zi5x3fa+I5kkODsdITAJa4EqkOyoCgQ6TV6VklIx7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnoVHEfV36jVagXqha0gWnc29Cn3H6cFvsP/GSqgKGS1CTgtu
	HFieWtgzHHpv/PXk8r/G2JAEnwZZz4igwtiEaCUjmMKg5w7Fdp3qRzvTOMZjgGc=
X-Google-Smtp-Source: AGHT+IHPZtS5V83Y7JMjzODTd/hxnTyAzMxstiwXVpmrwh9UhJDy1/DHcrx/nIgBTJ/vKGmAOmeiGw==
X-Received: by 2002:a05:6a21:4d8b:b0:1d9:b78:2dd3 with SMTP id adf61e73a8af0-1d9a840aaf4mr18555145637.26.1730245471399;
        Tue, 29 Oct 2024 16:44:31 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:30 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:06 -0700
Subject: [PATCH v7 06/32] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-6-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
index 2cf2026cff57..356c60fd6cc8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -368,6 +368,20 @@ properties:
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

