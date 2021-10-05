Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CD3C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9296361139
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 11:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbhJELEJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbhJELDm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 07:03:42 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD23BC061367
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 04:00:37 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id w10-20020ac87e8a000000b002a68361412bso22862529qtj.7
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GVi87uCC9iTMZ0tahcA01mPlZX23fhUUuaenbQ1/OXU=;
        b=eBKhKFS4x1q99vUTWlhpytTALPtvi3mgku2eaV9j+J7rB3DErHSPoLRonHHdXa8PGK
         6HibdPdPZNy+o32rjdkB5tY0E11xrK9Ac3m5LDrgA2eA7J4HLKzrEbZQKgIw1AY8VNHy
         cAXItLXIxr8LebyG5GXhJ5+H92uEdXLdYsxLq82kMDMHBfWpeoLyU9FKZpfWRWKR30/e
         40g9aYJKuuWKDqCwSD6vrOeXjAUAmFMMNRQ8Wu7WwLiT+hOd27rLzpsYzEuWPDXPx3F4
         L1BPhdtoHS1Yj0ZHU4Y3K79zG6ebY4E4kLEZBtO7noFlNeKlrDewmFrRbhHEejhMl+79
         /MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GVi87uCC9iTMZ0tahcA01mPlZX23fhUUuaenbQ1/OXU=;
        b=XinRYkxUoGZ0vi2NcaVUUXz8I3z/VZLTCCXIQsvhqC7Pp12UQMG0/rvjeDctYpNWYX
         51Wtc7fNeSLQhIsZvhpjx2FJrHeGywi356Fag6A6oAgL2/YyUFpmGmJblqk5wWdKfdBm
         gqgytd9UAQVCWAsAfXxuYAVdY7BPTQtZVYfmK931LrBylpWP9Me4nBS0vGw7NuBqHKi+
         Mt2LZ1bgnNXyhFLDttQcUtKxntAbkD7j8EACx6G4eaqjrojCnlDDSXICsRw7+ORI5uIT
         hL0STho9RD91P6zAhKwekvJp+XRw/iHCSEC4rph9zU8lef+RhLWhRMEeicubF5ZgbvHO
         YpQQ==
X-Gm-Message-State: AOAM5307IPMJoc4jX8GwosIYe4ID0rkKxbt49gZL/Cgr4cvE6BhUw4Q2
        CU6s2so1vc4f+wV2NaWqg/Ekl50Lvw==
X-Google-Smtp-Source: ABdhPJyqnmEQmSHt6KCacfuyURYDmMa093deSnQHXsO3BMcqzTTUKZjrrxibP+T5sEG2RF9gpTkjLb8Zvw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
 (user=elver job=sendgmr) by 2002:a05:6214:1305:: with SMTP id
 a5mr21006975qvv.64.1633431636934; Tue, 05 Oct 2021 04:00:36 -0700 (PDT)
Date:   Tue,  5 Oct 2021 12:59:05 +0200
In-Reply-To: <20211005105905.1994700-1-elver@google.com>
Message-Id: <20211005105905.1994700-24-elver@google.com>
Mime-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH -rcu/kcsan 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E . McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Teach objtool to turn instrumentation required for memory barrier
modeling into nops in noinstr text.

The __tsan_func_entry/exit calls are still emitted by compilers even
with the __no_sanitize_thread attribute. The memory barrier
instrumentation will be inserted explicitly (without compiler help), and
thus needs to also explicitly be removed.

Signed-off-by: Marco Elver <elver@google.com>
---
 tools/objtool/check.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 7e8cd3ba5482..7b694e639164 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -965,6 +965,31 @@ static struct symbol *find_call_destination(struct section *sec, unsigned long o
 	return call_dest;
 }
 
+static bool should_remove_if_noinstr(const char *name)
+{
+	/*
+	 * Many compilers cannot disable KCOV with a function attribute so they
+	 * need a little help, NOP out any KCOV calls from noinstr text.
+	 */
+	if (!strncmp(name, "__sanitizer_cov_", 16))
+		return true;
+
+	/*
+	 * Compilers currently do not remove __tsan_func_entry/exit with the
+	 * __no_sanitize_thread attribute, remove them. Memory barrier
+	 * instrumentation is not emitted by the compiler, but inserted
+	 * explicitly, so we need to also remove them.
+	 */
+	if (!strncmp(name, "__tsan_func_", 12) ||
+	    !strcmp(name, "__kcsan_mb") ||
+	    !strcmp(name, "__kcsan_wmb") ||
+	    !strcmp(name, "__kcsan_rmb") ||
+	    !strcmp(name, "__kcsan_release"))
+		return true;
+
+	return false;
+}
+
 /*
  * Find the destination instructions for all calls.
  */
@@ -1031,13 +1056,8 @@ static int add_call_destinations(struct objtool_file *file)
 				      &file->static_call_list);
 		}
 
-		/*
-		 * Many compilers cannot disable KCOV with a function attribute
-		 * so they need a little help, NOP out any KCOV calls from noinstr
-		 * text.
-		 */
 		if (insn->sec->noinstr &&
-		    !strncmp(insn->call_dest->name, "__sanitizer_cov_", 16)) {
+		    should_remove_if_noinstr(insn->call_dest->name)) {
 			if (reloc) {
 				reloc->type = R_NONE;
 				elf_write_reloc(file->elf, reloc);
-- 
2.33.0.800.g4c38ced690-goog

