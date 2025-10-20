Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9794D337BAE
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991791; cv=none; b=OMzwCPFHozQASPqSXz1cSkn2X9AYoIvFNF93eOHpZtMh70wlOZq4abH0LP/fiyAh2XLKwtxP5RNYRDjWqPqW0Sm3DtF8LSIdwYr93T6Ckv5gEKP8gFd2CpujmuRoj9x5qVpj1dRBr/BQJZ0vIqpIHSv8h4+r2ynkVyHqlsAyfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991791; c=relaxed/simple;
	bh=V0fZ1gTEaUM4WvTM6gLqWNFL/94gok2xI36CL7DsCMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4aitbvrJvelOQs0nWyvIWCo16TZ3k4lbi+dTfVz6xN/TVZJZaFmyvtZCEmazEyBzUcjsH7GZAuJK0W7G8ZSxnvDWSXwXPG8HkvExNepp8HYYWfo956OOD9SnSN7wx3aLsuuESYBDlh8ryITcbqla+QUHqSJaD4IeWqheawZjdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=NaMapfpw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="NaMapfpw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-789fb76b466so3989683b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991788; x=1761596588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDbWTk2WVPVaxlh5Iv33uWf/3wg1eJTKjZr/iSDoWjE=;
        b=NaMapfpwDScXxsOTbDCMuUJrn7/TRLey3roTUnD8wXpRptVNM3PeSMeleSmj05aK0S
         Oik2aJum5Y0NlYgQYiqJpBSaysZQ14Kl0yoKcFzLcXWkyTyOqp1vtN+OjzxxL+4bs1gd
         O5HgUsaom2gdqnDl5voIOgtNT6pibsEZysDuaQJ4s1brC0SrkD5qD3c4yGC57/l4oBYJ
         Y9r4xRTx8DEWvcVALbtcmllgHmRxTTCoMiE29hSx355LVXAnq1YI+JvmpTCja/qmWm3t
         Bm4bQGntXS7Wu4LL/+dMJm79BM6AeX8B7194hGdmVB3p1QX438Ifn/BNBLa5FJVhhYmd
         NTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991788; x=1761596588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDbWTk2WVPVaxlh5Iv33uWf/3wg1eJTKjZr/iSDoWjE=;
        b=tA8DY+BM3yDa6RGxoDj2kvIEridiyeIacV/0rIEKrDOeNSSGqB7/1584VAxgQM9mVh
         tBnxT/6+DvZ43NEa63mAv/hINO+C7yBhP3rRvegV2LM3JM+EgoAUNlv6LpV9lmfM8xnw
         Ryh/1II3L3jm6/A+5pH2FClYI3FWciS0qTh8xtFn1AFer+C4H0osRJ7hQlvwwLYUwuru
         lZR+j9mcJ4KZcDmxceQ2ZZzmbwNS0mnlKU3XABm9emLNo28wKb+XncZvG4FdHeuMTJzN
         zhaCDR+c7XU32H3PqDyDyNMqeNe6EBAJBbSoSv6bRUniD0wjV3jus11SEmpg1Ff3UpfF
         Cfxw==
X-Forwarded-Encrypted: i=1; AJvYcCVOysrhz2kQmnIZuCFaOVsfp/XBl3rypM4TQwP96HNjQaRhqzv4WDk0flI1Eyn4OFN5c669DgYs1JY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnrqBeJiui+3WdgFO9v/DKb+mTPhqBG+T9kFjGHnODp99ZWyy
	qaSaqVgVPnEO6ASjtKzvjCoM1G+TG4owj5Hf2mOXiPZUdIlQ5/1JzsKMxVy9FpQAz7w=
X-Gm-Gg: ASbGncv62CQNj4WOuPTH91Iy2SNNPowVocfGaa8blthX77Jj2TLf2NUDkeaxHgMMrIb
	fuf2vFA38rxg8xXX0gJjyKBNfnsK4HpVbnqds4idr2zCHAcpoPXEbegGiQIXuqSumvillWxbu+r
	hva5I9L4IsT3n+q8CLQC8SvpCY0WaM21aoP0n3RETVuXN/BvK26QwEi6+Tz1X4tIn14T2dWRvq9
	K31X0fYtG8OPLtz1o33LGSV5RRxme5VLnMtsymEH52bWv5fQXCHEfYjpQRNUqwOP5GpguVGH2+P
	XqqQZHrZ0DOIsVgUjfIQHn3uDSuaduE081Hf2xP2irsDB7ytup+z3EedOF+HwiqgO5eLwwSbFa9
	G1TvhV41h6UOTUqt9KTZJI7CZp25Hf6Mq/Mjm0J9YaOV73MVOaMXAwfIlxWruGVON0C4VzBCbK9
	lDaI4vLD/L9A==
X-Google-Smtp-Source: AGHT+IG7MKaHxN29QuP7Mlh9O31TufBG5Vi84qlYiOsjhNCiZEhtoNnVZFzmHBGE3wVlnk8jzANcVQ==
X-Received: by 2002:a05:6a20:3943:b0:24d:7926:bb29 with SMTP id adf61e73a8af0-334a85151bfmr18243135637.5.1760991787784;
        Mon, 20 Oct 2025 13:23:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:23:07 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:42 -0700
Subject: [PATCH v22 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-13-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses
memory operand to perform control transfer in program. As part of this
tracking on indirect branches, CPU goes in a state where it expects a
landing pad instr on target and if not found then CPU raises some fault
(architecture dependent)

x86 landing pad instr - `ENDBRANCH`
arch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
   branch tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
   tracking.
   Following status options are allowed
       - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
         thread.
       - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
         thread.
 - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
   tracking for user thread.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/cpu.h        |  4 ++++
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 487b3bf2e1ea..8239cd95a005 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -229,4 +229,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
 #define smt_mitigations SMT_MITIGATIONS_OFF
 #endif
 
+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_CPU_H_ */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 51c4e8c82b1e..9b4afdc85099 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -386,4 +386,31 @@ struct prctl_mm_map {
 # define PR_FUTEX_HASH_SET_SLOTS	1
 # define PR_FUTEX_HASH_GET_SLOTS	2
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      79
+
+/*
+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
+ * enable cpu feature for user thread, to track all indirect branches and ensure
+ * they land on arch defined landing pad instruction.
+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
+ * branches will no more be tracked by cpu to land on arch defined landing pad
+ * instruction.
+ */
+#define PR_SET_INDIR_BR_LP_STATUS      80
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      81
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 8b58eece4e58..9071422c1609 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2388,6 +2388,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 static int prctl_set_vma(unsigned long opt, unsigned long addr,
@@ -2868,6 +2883,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_FUTEX_HASH:
 		error = futex_hash_prctl(arg2, arg3, arg4);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
+		break;
+	case PR_SET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, arg2);
+		break;
+	case PR_LOCK_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_indir_br_lp_status(me, arg2);
+		break;
 	default:
 		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
 		error = -EINVAL;

-- 
2.45.0

