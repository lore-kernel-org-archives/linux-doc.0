Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2369B221732
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479283; cv=none; b=qubUKm9h5Eh+LeLySq6ijSZM9RMdPcKLiAqv8seKiywSOwKvb4aIqxLQ29FPmInF4ki7aTRvHroRzZOISIFqJjGlCes1qCqikAmNOxyJFUuQrGdNb2iavFdkSGDeFe7q2gOkmRT9v5Lz62JT9ljvCesB6oDuqOfEYWhb523GfgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479283; c=relaxed/simple;
	bh=HSj61/DKHbscjrSxiKNrJbrvkTbOzS+iDBZfj2iqRRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVk57qs57OscuzAud6aG98rmCIye62yyFkdQ+CScTa9dZNws2ATna2s4R1QhTFwUqFbRzFGdENNXNnmUnyxpByaMPJKxcq7y4hke5kR/mbIq1+SHCDW8Clj1DT14ApetcGOOxg5BsbAg9NyS0kgAaxFQM56one/gPQSkYOD8vsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ubg6cZpa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ubg6cZpa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223f4c06e9fso6224245ad.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 00:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479281; x=1746084081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=ubg6cZpa5Vo6Fxp4Uf4waBarfwLeXRuCfcO/4vqI+fldUtLeg3Xx22zxIpeTEkrUay
         HsuBdUC+tJ+I1kp5tR6Q0ZqsH/bfmJC3GzVbx4DHQLeyTqNYCSeaQWO8RoS7tNWAarVj
         cflSY0Nge5CjCiFk3STI8oQKDo/gdP18lAXiMQtn9HFxM1l5a61OFBuA940E6+cI3nuk
         YJ2AWET8CwN+QBYeHaHRu2AklzMluGu+JAmgYD8Z5PKT/DBxzcObMjvY7fKUdaCrqrmJ
         oSulIA8fMwbtSGXjDZ7bW/WAuTovz/takJJtL4SX5Ea/ERtDKG0IH5+tUqoFuA3AnCkW
         DdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479281; x=1746084081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=Cv6xLrgPX/RVToWFX1UBaQ7z7WzKVToYoq0zUIsTDUhA9u6SB0VbaK2bamnYhor0VK
         B/S8GFuyCvSqleIwxf59B586009gh9jR2DnBbKIk9RZKHqVb9b77wliAAoOolKPfRRMK
         G7YYOzLsTnSd7hSymnSehc4wLfIMDRvz+OhYOYoJV8MTAczORdkYSCUpzLCeSMflfTgs
         jTWx0TJkJWLH9r/RqeTmtKcN6IkkTOI6KwkmLrctHndFwuwDNVyw9sXHEix4JSlFXKOi
         oe0cCnG8MhzDahHI8nA5dFDO7N7C+FqlV+WBUE5PCjAluARxvw75qS8fIJyXgpmqmx2K
         AIYw==
X-Forwarded-Encrypted: i=1; AJvYcCUAuYoVO/Ow3JMT5/21gUNd59EbTqtsvutxWJY+sUge+VDTce/bPNGQYwOzOkzDJ7szxygPgR8PjS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSPEKOY8JZhLUGNGRCObASPH/SH5dysTGX7qrdF4GEGHo1XLq
	TFlT8G2S/qQ3lZXNaociNHq5K3XLRtgftuo3aXKTWAdGChl70L9hhoUXzRJ94g8=
X-Gm-Gg: ASbGncvZ3etO9mjMM64V9dFiSTlqEiHQH/JlB6NyMdNv6v2Ivq39Yp8Htg9V1GQD1Dx
	fvzkfBjB6Ikl6J3PV845ahh4SEujJX/WIsk4ZybW0ZCBDIF+HuKyF1QHiyzJb2AOA+OLfX6yKYp
	q0DCTYMUSvqve9FMtE0fHHcQEAgMSKjn1df009oqkcBBMsLy9mwVq8TPYMGdvP0L3y4UUxgw1Al
	Aio8i79kQgBxoz27uWwZOiI1iRLvhcyU/9CL4X8XaoT6b4QgJnklSpwt8CZJjXh7Mlir7QmzT9G
	7Crof7cFf+eeM4jbUj5SJuGhzSTS4Bw8U051s+WLEJGOWQ1oqUg=
X-Google-Smtp-Source: AGHT+IGB31thuufoxJYlKx2OJ9+59LtpnF6oD6iN+AzfxNeqUgzSARE3kzGHVOeHGGHAiVK6EGT83Q==
X-Received: by 2002:a17:902:c94c:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22db47e5457mr21504655ad.8.1745479281373;
        Thu, 24 Apr 2025 00:21:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:33 -0700
Subject: [PATCH v13 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-18-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0

