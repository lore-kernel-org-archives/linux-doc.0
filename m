Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5931CCEC4
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798840; cv=none; b=d3qaU8QB6aaIAYHtibJ+R0xhhdISBWfR6rGvZWapjGVFryu4tDMGPDcb5h1AKa4sbLT12/uCnu8fsDYshi5+dk34X+s89/TARipWiC6WJx3F5VZVLDKQYHI73ZEDkQY+PKuDrdoMD6eqWaRFG+0cRDCyukIM34gSF4oJQMGs4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798840; c=relaxed/simple;
	bh=9D3t/x5ldu0vCmZ6SpOxBl6mFpP5YEsCpnxU+0fCsAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/MRPsXC97zKvBYLLb8wpF/8/0vQIfUbaegRhxzM1ccyO9C7VK7ZzEB/ivsCswdHLh2+a24ByisZ7BKrHQM8XCfh6cLlXDQ4pin+46thUFjjaD6JT9ui6B0/CCbsRjc1WHZfE5WiD+f4zsRUQ42aQTtBpgTVItZL/TSRFEleiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YfDEZ+0Z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YfDEZ+0Z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20bc506347dso910405ad.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798838; x=1728403638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=YfDEZ+0Ziov2Qey0fUVLrN3D4eyVU7O7R2TQgjAlWvWj6yoBHMhaJjpXQm3dvopHNG
         QYdirShh+f09sMQng0W9XCdPt56+MI5caQA5AsLkwJDlZMGYxErlHmqXRxpDhg/z9bxL
         +ZzN8N1xdoDj1ceQvPdWUo3q2BFDsrzXnIFGcdx7powX4FOgWljNrDtVBWIWNEYFLRr5
         P/iZ7A4jQNH57fOfaeSCMucHQoMH4AyAM/2tkbcHTYO128XREbCmFdZxM/h3jOIs5VPh
         1t/UzcggXddCXUQyxaaBnXU/AU68wioasopczipdek+bBAuah3APXG4Rgb270dV1G9hm
         WVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798838; x=1728403638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=cknSUCuH7KaYfzQb6kX6xtiqtiSZKfwzKHTCaa1FFhUSSlLRWM9G/nCswMVjRczZib
         cr4KMnC/sZYDmFn8AwYa8HYfGUuNSQEd0r44/oXCEbkzHQ1Y+e8HMvj+W61RhItta0J7
         aNUlyfBUU+Xazkimmd/HHWFpkxdX807aNPX0w8r3ox/vooTBvl8kjGonMNFGq0LOic1G
         X7u6p0g7PtedzLmFPIlTE9GgkNt6FByHThFS3gPh31Tg+4AyCIFYIKgh6ajPv4tpw1P8
         m+SAlpGigwGItpVvWMfIdV+L1BmG8CC1Oa+pipQ6YyYtL1sp5+/amfgO0CfEGxcydW8z
         lKGw==
X-Forwarded-Encrypted: i=1; AJvYcCXpXUow3TZX993hzcUix4/D/40F0KvCQNAlIy1QLfwbNxlbEnONmf5KnGt3hEOce9RfinY2P9QSg2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+vRURoESxRVPDV1y5NctjoUgv4c/JgWpKrCBZgtv1J32KeHPo
	5CAKxXpaw0kH3jykGYxc4FetsCt2/FmFjDRIFWWnl9Cj7lTO+9xw6xP3nqjiWm8=
X-Google-Smtp-Source: AGHT+IGUHiuJzYzZ98ttT4VkP6ZUowafZttsMI2A0s9DSSKJP7pFR0E95zO3sMygBlOUl3biGdauQg==
X-Received: by 2002:a17:90b:94e:b0:2e0:ab57:51e5 with SMTP id 98e67ed59e1d1-2e1846bc39dmr235253a91.23.1727798837693;
        Tue, 01 Oct 2024 09:07:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:12 -0700
Subject: [PATCH 07/33] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-7-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
2.45.0

