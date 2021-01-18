Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4D5C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 532C822472
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 16:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406197AbhARQHb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 11:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392135AbhARQHJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 11:07:09 -0500
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com [IPv6:2a00:1450:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F0FC061575
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 08:06:29 -0800 (PST)
Received: by mail-wr1-x44a.google.com with SMTP id o12so8463072wrq.13
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=fseQZC2z3/hCn+AUW1qbQoNHcJK9F6WJRE0sDWzBE4A=;
        b=lgK97nkynzgkiD2qXBqtYzFJxHbCDUgmNAo31Abw6d3x05grRmNMS8BgLa2UHOkDjI
         wZLRZrAkZCksg8LnP1eMeeSIX2np8Ulju/rlSegTHoeNrwH8hhF9kixm/0+DqpEHSib3
         pA6q7LD9aU2WbmwOX/Zid/xD6f0bc8eLpRqT3W7+Pb0gMO5j0kdpmYEXARQ6RJ04zOjn
         BPWBPaZNml4GgIt955DUlhzIB5Q9HQQ3DPrDtWjBk7MjLIdLVt8CpH5K5mn8DzY5Ohiq
         sFXCWbuwAaF1YwmkuccvaiOgRFNJoAydgj5VFQ7RC0bb2r5PwCv1A9Q41cOB0hYnlfR0
         lH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=fseQZC2z3/hCn+AUW1qbQoNHcJK9F6WJRE0sDWzBE4A=;
        b=CqAW5XUe4OfFeliVTCyJ7Ly6GFJSgb0RXrsgRtCSODP1r66256VanKFzhqaX57wI84
         Md3US8uPrntnDNb0MQgaJMvjvNNpgyCl2pd19wzDvVVozUfpvTJa0b/MpclI10SGZQg6
         Gw6AolIAlFXC5CBe37qpyhvR9oCs9QdEBM4upHqMqwcR805FxKZ5YaM1sPuxfFh3r12J
         fitpnd34ipx9Y+wkje3+yUr3nSEKVGReVsIe6RUcT9eM5WNrw40KScgDBzR2OxOdNQ8o
         0cGiWyc4c9Odhp+khnYgs2fula9cOypF/YQ7urdFfTBeHCw9TEpHobGxGoNQrxyHgInZ
         /M/Q==
X-Gm-Message-State: AOAM532M729L3K8IspzdJysBk9jVvtvrQZcMCV8YxE6MGOa0md7wEOrU
        k7+i7nCLk+hgSr4A0+0Q2qbX2mr1VbUzTw==
X-Google-Smtp-Source: ABdhPJyshsLFlpro9xgpb1Vpx6VuTaHda/g+0PitiNDQWtVpGTWdH8A2NGf8+6lRdmeWUbfmCEBtDwwohqohFA==
Sender: "jackmanb via sendgmr" <jackmanb@beeg.c.googlers.com>
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a7b:c044:: with SMTP id
 u4mr59238wmc.1.1610985987578; Mon, 18 Jan 2021 08:06:27 -0800 (PST)
Date:   Mon, 18 Jan 2021 16:06:13 +0000
Message-Id: <20210118160613.541020-1-jackmanb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH bpf-next] bpf: Propagate memory bounds to registers in atomics
 w/ BPF_FETCH
From:   Brendan Jackman <jackmanb@google.com>
To:     bpf@vger.kernel.org
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Florent Revest <revest@chromium.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When BPF_FETCH is set, atomic instructions load a value from memory
into a register. The current verifier code first checks via
check_mem_access whether we can access the memory, and then checks
via check_reg_arg whether we can write into the register.

For loads, check_reg_arg has the side-effect of marking the
register's value as unkonwn, and check_mem_access has the side effect
of propagating bounds from memory to the register.

Therefore with the current order, bounds information is thrown away,
but by simply reversing the order of check_reg_arg
vs. check_mem_access, we can instead propagate bounds smartly.

A simple test is added with an infinite loop that can only be proved
unreachable if this propagation is present.

Note that in the test, the memory value has to be written with two
instructions:

		BPF_MOV64_IMM(BPF_REG_0, 0),
		BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_0, -8),

instead of one:

		BPF_ST_MEM(BPF_DW, BPF_REG_10, -8, 0),

Because BPF_ST_MEM doesn't seem to set the stack slot type to 0 when
storing an immediate.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 kernel/bpf/verifier.c                         | 32 +++++++++++--------
 .../selftests/bpf/verifier/atomic_bounds.c    | 18 +++++++++++
 2 files changed, 36 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/verifier/atomic_bounds.c

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 0f82d5d46e2c..0512695c70f4 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3663,9 +3663,26 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 		return -EACCES;
 	}
 
+	if (insn->imm & BPF_FETCH) {
+		if (insn->imm == BPF_CMPXCHG)
+			load_reg = BPF_REG_0;
+		else
+			load_reg = insn->src_reg;
+
+		/* check and record load of old value */
+		err = check_reg_arg(env, load_reg, DST_OP);
+		if (err)
+			return err;
+	} else {
+		/* This instruction accesses a memory location but doesn't
+		 * actually load it into a register.
+		 */
+		load_reg = -1;
+	}
+
 	/* check whether we can read the memory */
 	err = check_mem_access(env, insn_idx, insn->dst_reg, insn->off,
-			       BPF_SIZE(insn->code), BPF_READ, -1, true);
+			       BPF_SIZE(insn->code), BPF_READ, load_reg, true);
 	if (err)
 		return err;
 
@@ -3675,19 +3692,6 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 	if (err)
 		return err;
 
-	if (!(insn->imm & BPF_FETCH))
-		return 0;
-
-	if (insn->imm == BPF_CMPXCHG)
-		load_reg = BPF_REG_0;
-	else
-		load_reg = insn->src_reg;
-
-	/* check and record load of old value */
-	err = check_reg_arg(env, load_reg, DST_OP);
-	if (err)
-		return err;
-
 	return 0;
 }
 
diff --git a/tools/testing/selftests/bpf/verifier/atomic_bounds.c b/tools/testing/selftests/bpf/verifier/atomic_bounds.c
new file mode 100644
index 000000000000..45030165ed63
--- /dev/null
+++ b/tools/testing/selftests/bpf/verifier/atomic_bounds.c
@@ -0,0 +1,18 @@
+{
+	"BPF_ATOMIC bounds propagation, mem->reg",
+	.insns = {
+		/* a = 0; */
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_0, -8),
+		/* b = atomic_fetch_add(&a, 1); */
+		BPF_MOV64_IMM(BPF_REG_1, 1),
+		BPF_ATOMIC_OP(BPF_DW, BPF_ADD | BPF_FETCH, BPF_REG_10, BPF_REG_1, -8),
+		/* Verifier should be able to tell that this infinite loop isn't reachable. */
+		/* if (b) while (true) continue; */
+		BPF_JMP_IMM(BPF_JNE, BPF_REG_1, 0, -1),
+		BPF_EXIT_INSN(),
+	},
+	.result = ACCEPT,
+	.result_unpriv = REJECT,
+	.errstr_unpriv = "back-edge",
+},

base-commit: 232164e041e925a920bfd28e63d5233cfad90b73
-- 
2.30.0.284.gd98b1dd5eaa7-goog

