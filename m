Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D838DC43
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 01:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202171; cv=none; b=M5ib3U17K1Zad9f50/eVPnEiNudqMsQiaTbzOibv0ylVS7Cpz69OpgIVXHLaIxnFAY5UXBgLtUh88WgPFY3yr58FrkL/GqTxpKj+YSeMFZ2abrah2XGJOFd9hrp9lC0mX5495EWhBYR4fLEyOUYXTTHB9OOvViB+18w0c6lvGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202171; c=relaxed/simple;
	bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVMrzLilEINxrxK576XNL1DJQhXCU49OKgTYJstD2duG6nqy+xvagYeP/ven/mRufjwOSvbIZkEHc9gVUq3MFV2h2egwnXNUD9l7eX32wsx0DG/xiUPVQE1cSoGaOblJZdzEh+3IItdnG9yGpPpGr0GEUuGC8yGbwfuviiqT36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g03DmBHX; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g03DmBHX"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b0d126f631so4283817b3.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202167; x=1792806967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=g03DmBHXk9PAFolHh9Tva+e72oO+o1nns2f7Z02WJwU9JciCrJvhVyMnajTZOCceDS
         Vxk61xbFTMyVLCkjIzGG/mbdGvIHGLX03snvkVitNpEMvAiGYWuHDfsZRsm2p1Xm2d03
         9BKGcOzetRaokciA29Az+dr9/FiuSDuG/lPUYaZJgBGp5bZQjrQ4ppHxLpBbgBsjRaTa
         Mr49a6q+gjs37Tcy8gvn3H72+7En79dQb/nFalXwc6ELuAhPTSJiPnWZwil25tY2AXKM
         7H5rkKwTnhZY5y9q7jAdsdTFtGVjROJ3PzEdHHJyd+7xe6K7Nt0t1Mvgp1jOVAsaz06K
         8Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202167; x=1792806967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUlIHV3Y/eyAzB+bNbhTZ2vi/60rQRriQzgaW1YAFSU=;
        b=BJbbFIF3ZcwR+W8hyY2GRy7j1+O1yLwbazhSAHqq+xglyJEj38e5PlT+rCFxOa+csz
         D4k6tcfl1DIBFLIbTe8ISDeiuaIdutQPUH4XRMS4I6Cef94/T8r3VoWnklBiMK1sptmV
         pfVan7NoZJufcZl6zkCwg72skxNxRF9m4bqR4je7cmptdckkNmdFKi7t9tOpif0uHD0A
         q4qn5347FAIiV5hr8sWBTjHzMx5BkdJPwM+EZxHrDLXmBZmW1KEeLg357Uv4XNpm+muz
         pIti3LOqK7El2Cbe21dH9hq53mfPhYNL3rUXjx1ljtOUpqvMKHfXX2J5M7bPgXldbIEy
         Movg==
X-Forwarded-Encrypted: i=1; AKwUvBzsVrkYS41rq4Qr6T4JV4Bs2ezK6sHgrpj9+Z2RAw8+aR+n1cT6vacnCjoV0yMh4uIZiiB+31sMU6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxT9m3YXi11N1+i3yvg8A2uRjmVfHySkhoQpk7lP/y2RkVJ2P9
	HxiCltLly5dsbounPz3QI1/XPypy9Q8z4vZSX1KpbpeLr9Mlk5hH0KE/
X-Gm-Gg: AYBFou3wYTxbJDEicjnOnsFcJ24HgNXkrAhnsqpfjgXtLSW5Hk681wUSg5ULhGipOOX
	cABno3o4wQaZKeQLAPtM9LKSA21a0nI6u5BoH/JPSw44k7ZFnxGr5+76JelLStns2RMvZ6kzFls
	ttxeIOnbKudfYvGidzIkStTWotunXlftwpazlhTtqzneL5COa9+5+hc67TKlVHdd+9Y9qm2SA58
	Yu6hgxUM6069a0z/GGO/qIRUIYnYJLGTJwkBUIb9d3mLYXJYgMdxzUFEvfZeFvP0PR/fSOOPfZD
	+INE7khCgZOlMOTXTu+cuf5ayJ8jharYsDAoyDy6GeU7mx3BI1WtF+rQnGiiCQyzqNZQwfp/Dll
	QXy29/CtfABXJnSnFNAvRaWbqhoVbVKLsTMcsLPQvIrCLoly19UzYTMxLoQNdmjNZDRCmaEqNde
	HIybJRDhgPjkRses5+AutHS9rfjK1pbcXz5rwk3uwCdGNk7hq2p07pDvpbgs/NQKVjhlZqqm7Qn
	7KQd9R/XHjYDb20qKOvzvKwC1EzvkmfoA+YdX/6ZeizWUEfgbfAl29BC84sGhkQVBuBrUcNzFYK
	1Qn4bl18wKUtTMv6GJA7KyLid5Io
X-Received: by 2002:a05:690c:47ca:b0:88e:edf8:e375 with SMTP id 00721157ae682-8b0f205768bmr6093527b3.5.1792202167343;
        Fri, 16 Oct 2026 18:56:07 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58af029sm16566577b3.19.2026.10.16.18.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:05 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:48 -0400
Subject: [PATCH v2 2/5] alpha: stop storing the user stack pointer in
 pt_regs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-2-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3175; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=VxOR/bCOVZkIw8KCvCXFIKKLhAZToFxwLD68oZ1t8k4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV1c59RwxmL5JvtizY70OTqfrzt+mix8xUqFJWeKL
 d/xHGmnjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmpJaRYfnyxdcPpY
 RMFeWabq+1/MNa61/HF1pEJbbz5qYJdRx5xs7wP4d1+el0ZovUZzuYVrFbXXVo+3StvSZ+94Uy7
 aULjzrcZgIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
Drop the stores, which saves a PAL_rdusp call on every syscall, and
give the field back its old name.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/uapi/asm/ptrace.h | 2 +-
 arch/alpha/kernel/asm-offsets.c      | 1 -
 arch/alpha/kernel/entry.S            | 5 -----
 arch/alpha/kernel/traps.c            | 8 --------
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 9d86b2a1526e..72ed913a910f 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -43,7 +43,7 @@ struct pt_regs {
 	unsigned long trap_a1;
 	unsigned long trap_a2;
 /* This makes the stack 16-byte aligned as GCC expects */
-	unsigned long usp;
+	unsigned long __pad0;
 /* These are saved by PAL-code: */
 	unsigned long ps;
 	unsigned long pc;
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index c89792c86044..22ed3c975b1c 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -30,7 +30,6 @@ static void __used foo(void)
 
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
-	DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
 
 	DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
 	DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index bfa116d455fb..790389a15c3c 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -476,11 +476,6 @@ entSys:
 	ldq	$1, 0($sp)	/* syscall nr from saved r0 */
 	stq	$1, 8($sp)	/* regs->r1 = shadow syscall nr */
 
-	mov	$0, $8
-	call_pal PAL_rdusp
-	stq	$0, PT_REGS_USP($sp)
-	mov	$8, $0
-
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index cfaef96c4ce8..5882c65b7ef1 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -30,12 +30,6 @@
 
 #include "proto.h"
 
-static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
-{
-	if (user_mode(regs))
-		regs->usp = rdusp();
-}
-
 void
 dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
@@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long write_mask,
 {
 	long si_code = FPE_FLTINV;
 
-	alpha_snapshot_usp(regs);
 	if (summary & 1) {
 		/* Software-completion summary bit is set, so try to
 		   emulate the instruction.  If the processor supports
@@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 {
 	int signo, code;
 
-	alpha_snapshot_usp(regs);
 	if (type == 3) { /* FEN fault */
 		/* Irritating users can call PAL_clrfen to disable the
 		   FPU for the process.  The kernel will then trap in

-- 
2.55.0

