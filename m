Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300138AC99
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202166; cv=none; b=EvwjlkwAa4pNcb2alVkj2Igez79Bjsti54Y5xs/ENSGXQwUMIXEELPPNLW5nnkgoeizpSsNggkd+BBhavIV7rh9ReVJYUYRAT9uXR5uPB3+RjksKOmE4HqN2L5kKzoi9G68jsoEuSwFGECWk2w8k8zmvyrd0u3S95BRTyK0Of4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202166; c=relaxed/simple;
	bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZE/J+dbG4j+QtqK5Xmx8lHjAefhLVUyIc29UiuspmK3kV3BVq+qPTsJOvVEiZHs0SqmE/1GqvswDVQyU9632UMuZNsG9JjOaHucuQVK5TAvJP/ALFYRnwFW2MZXG3eLXSx4D+QzTCIiDnpwF8BXlPZOQxgG3TgFfKHehPzIvE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnZxd6lu; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnZxd6lu"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677dbe051d4so539753d50.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202162; x=1792806962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=MnZxd6lu/Fga/o9/N50ER54dQZKvDC1oQr+qaafebeN/JCYaalHT+UFFycxYn9LM2X
         bpkNJw6sAeYCEWpHooBPoQFlT5+01jdXZP1s5AUBCa87Tw7IbalHyvzA3ekDQ3K+QWvf
         aa3pZ9OpI50KUJsL+8/lPO0Huw62q2hsEGwh1whclpLz1bdhJIxyEbvff3YoeWqw6QjV
         l3cYZdgMfDwLp/4a2VsQRg0fC3z7amY0GbfGwOeKLldJif5H83Za+tBhX7i4UqS8pSKE
         D/WRQNmhSDQQD2LGX542DugeFPQhPBmtHGYVlHq91yOM3wKuWHtHaY7vnyGYicBxJTA3
         C8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202162; x=1792806962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=nHo7bJewBj8ltSV+6kOQc1C5qD7d2AINUVM1qK4Gu9qQ32xWG7qRSNETJJ2gnABB7o
         NVfUUbnn6Fz0mXeVkYzeya1k8gbZZsTrja7bNS7pWZl0h9ko4dphELGbL0pfIuqzcqHx
         +lpTjy2wDuSp75EXlZhfIzfVHHPRs7yhiguPljIDbSwu+CY/AaOrfCeEVDSi3L/RzUAA
         GHEihZOD+JvvL0EfiUAPeeI6ZALAGyZVykdERxavWEiSMPn8cUVfZqtr4ZsW9S79TrMe
         qDwwOR2QaTZwl1ngwKNXV0neq7i6mDn89DVtjnr9+TtO9aiPPXPwGErYindxlF/eLAXZ
         yeeA==
X-Forwarded-Encrypted: i=1; AKwUvBwX+MI8KL9p7p0B8Pdd2Q+ZYB7tSDyM80TGhlTvnR0YsQwu1uzS+08uNPWKI+7xFIdFJKDTWzDvv1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI4mppnxbB6Iamcur4vgkGFpj4S5VtNOoRNR/K+FtAQdoXbBdR
	ZR+ZxDT1AUyTOg/zA33ia8rWwLhpjpHi+KJUPKPB0rlJ9kEHrH5lEAAY
X-Gm-Gg: AYBFou3qLdiWyACpj589HpRj5rkbhp4fV9QD4I4cYN9qLbBt8lM7Tof/Rtn+w+Lwhqf
	Pzqa2KaGcTw/ioT2AZ83mfDLBGiEgK1S/lWxQu72WOvYH4e0wifuAA65VBhKQyKRUrFg6B5Cz8s
	J+IxF5jCZrBKh2IsZ/lWm37BTOO3YDUG34swEK6sFWyhNXqk8FgpSB6D2/XFhB/GB+9SUD9sP2Y
	FJXUOgmY03HjrRuEmNE+oLRQlV/VRhST2WENTGcIJAkKPVz+PjqaC04i5O2lFjHHnYlYun7Xc2a
	Mpct+czwVfTg/xztrcL3Jg1PDve5fiEgWklRfjsE4sr6UWcZpaPybw5c8kVlpHphKrtbmOb1r+R
	mRybYdsCrxr7+Iv3eSlXIioRjcp5RaYbn8FB/icko0iYqHeALcYMrTR6XjnHhz2OyjnnpeEqd5f
	fJ3aV5uovntPyJno9REYGvNSzX2tWA7LBL1CEBOw1+Ohg5zKoWkssJ9kh4D67cu1jYfVovz2E9R
	Um1II9AnzcofZeZVwSj8LXqkQoaiTHxs6jpYF2LfxlwU3gu6fIrFNQ5LlCrJ3u+90xqdDlFs2zN
	zKl/505U6I32ASEoAMt9Ezwyw0RH
X-Received: by 2002:a05:690c:c386:b0:8b0:a352:f978 with SMTP id 00721157ae682-8b0f2072ca1mr5509447b3.4.1792202162390;
        Fri, 16 Oct 2026 18:56:02 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5885546sm16379857b3.16.2026.10.16.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:47 -0400
Subject: [PATCH v2 1/5] alpha: fix stale user_stack_pointer()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-1-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV18W33zl227d0zLODlNyiLth9GZ36qJfc9uvru67
 dGWLZ+2POn4yMIgxsUwU0yRJW69Isusth1LfU5L/4KZw8oEMkRapIEBCFgY+HIT80qNdIz0TLUN
 9QyBDB2jeIicHoNGZnFxaWqRblpBkUNefkliSWZ+XrFefkFqXkF6gV5aZlpJRkZ+UXEq0Ai9vNQ
 SU1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dLcwYuTgGYazo+MzK0yKU0pR
 2aXPAhoNPn9MdCvuvP02b2qk8r+i/+5tIW9SnODH94uyZ9Wnv3S9jbNy1xAVav9y/vSs488rxTu
 2m62rr1LcXsAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PALcode keeps the user stack pointer in the PCB, not the trap frame, so
pt_regs->usp is only valid where entry code stores it: entSys,
do_entArith() and do_entIF(). Interrupts, page faults and unaligned
traps leave it stale, and ptrace and /proc/<pid>/syscall read it
through user_stack_pointer().

A user-mode pt_regs is at the top of its task's stack, so find the
thread_info from it and use rdusp() for current or pcb.usp otherwise,
as KSTK_ESP() and the regset code already do.

Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h |  7 +------
 arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 430e8dc27ff7..45d1229344b6 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->r0;
 }
 
-/* Helpers for working with the user stack pointer */
-static inline unsigned long user_stack_pointer(struct pt_regs *regs)
-{
-	/* Valid for user-mode regs */
-	return regs->usp;
-}
+unsigned long user_stack_pointer(struct pt_regs *regs);
 
 static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index e1d8c2f69688..dba7e9905cfa 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
 	return (nsaved != 0);
 }
 
+/*
+ * PALcode keeps the user stack pointer in the PCB, not the trap frame.
+ * A user-mode pt_regs sits at the top of its task's stack, so the
+ * thread_info is at the base.
+ */
+unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	struct thread_info *ti = (void *)((unsigned long)regs & -THREAD_SIZE);
+
+	return ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+}
+
 void user_enable_single_step(struct task_struct *child)
 {
 	/* Mark single stepping.  */

-- 
2.55.0

