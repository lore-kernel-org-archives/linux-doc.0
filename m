Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF80ACCA481
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jul 2022 04:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbiGHEtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jul 2022 00:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbiGHEtP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jul 2022 00:49:15 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528BE76960
        for <linux-doc@vger.kernel.org>; Thu,  7 Jul 2022 21:49:12 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o200-20020a2541d1000000b0066ebb148de6so2656457yba.15
        for <linux-doc@vger.kernel.org>; Thu, 07 Jul 2022 21:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=UquCbMkMEN53oDqhrIsDuW+/Yi+lnpJDBsKu7NltgmI=;
        b=SPGqZ7snq0dDaZavBhTshBo3GD/RIz16PYHpkAZP09NkIM7rSc3+bp+s6l/7++Cv7B
         XWa5GQMin+l++ZOP/yB/e+b60YfCQdDYXY2VcElGWwTBkz3vCLMTOOcnR9cOfsiNGmj8
         tlqh1FLXZ3uERR/doIcBKL6AyyV2xy+uFI/GmTVeOB6R3o2WyolQeIvTIgXgI3a+UUqv
         c5paBcyBylaDfDM1yzvksVPzvjik6pRI4mF17AwFW08HuS2JXclpRWj3VnAvBFZNo7Ea
         6QdKwSftZV1L52yNE7NANxbkca+Rdd+HxSkS2rq66Tt7UH0+HZ+lXRb32QqGn/pRABWO
         nFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=UquCbMkMEN53oDqhrIsDuW+/Yi+lnpJDBsKu7NltgmI=;
        b=MeCMsykDv1aPjBkQZHiHSZXInJf1e/Hcw3pHDb3kB5F6EEZum+iJ3nto6J5p4a0FY0
         fQoCQAiyjsycvPVS00SJrCTxAI88PcyF2lIApplvdoSJrZak0ziiVX/dbLtJ9toFEeKY
         q5bykLoHGeyOIIuckK7JyAqRYYM5APQZXO4PiBnvv6mSiEIwH63FByOiYr25EIi96JVu
         bEi6cw5uT/qL3/xHl5kr8BhFshg7HniYndZjd0/Kcave26pMdzKEa2ej3cWZ+HPGLL6t
         U3IaNHwEV7yF1Ms+562u1bbduGwij+GfxqQ7wxqRkn8sDJtDfGhqbOL7+44+g1/Y6gNz
         tljg==
X-Gm-Message-State: AJIora96/9OSwpIGMOELKjIR6any9yMWBp6+Y2lxH6QHANSZAoRnLBtg
        bgz1bf/FMaCQQ2HoCRcZ1U2MvQW6n8Sbvw==
X-Google-Smtp-Source: AGRyM1s34hRTvZB8Y7Xk9te1i17z6IbWppPGWTLYgGaU9rmBgS1u+VkLNYZr0Wk1pk93+iVd+YYx2UmXUKNKpA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:ad14:0:b0:66e:cb9e:8d43 with SMTP id
 y20-20020a25ad14000000b0066ecb9e8d43mr1664970ybi.176.1657255751621; Thu, 07
 Jul 2022 21:49:11 -0700 (PDT)
Date:   Fri,  8 Jul 2022 12:48:45 +0800
In-Reply-To: <20220708044847.531566-1-davidgow@google.com>
Message-Id: <20220708044847.531566-2-davidgow@google.com>
Mime-Version: 1.0
References: <20220708044847.531566-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v6 2/4] module: panic: Taint the kernel when selftest modules load
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     David Gow <davidgow@google.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Taint the kernel with TAINT_TEST whenever a test module loads, by adding
a new "TEST" module property, and setting it for all modules in the
tools/testing directory. This property can also be set manually, for
tests which live outside the tools/testing directory with:
MODULE_INFO(test, "Y");

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed-by: Aaron Tomlin <atomlin@redhat.com>
Acked-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---

Version 6 of this patch fixes the issue pointed out by Nathan here,
whereby the check for the module property was inverted:
https://lore.kernel.org/linux-kselftest/Ysd9FG1fOSnzKv8d@dev-arch.thelio-3990X/

Changes since v5:
https://lore.kernel.org/linux-kselftest/20220702040959.3232874-2-davidgow@google.com/
- Fix the test for the module property being inverted, making this patch
  do exactly the opposite of what it should. (Thanks Nathan Chancellor)
- Revert to using pr_warn(), as we already don't warn if the kernel is
  tainted, so won't spam the logs.
- Add Reviewed-, Acked-by tags.

Changes since v4:
https://lore.kernel.org/linux-kselftest/20220701084744.3002019-2-davidgow@google.com/
- Use pr_warn_once() to only log a warning the first time a module
taints the kernel with TAINT_TEST
  - Loading lots of test modules is a common usecase, and this would
otherwise spam the logs too much.
  - Thanks Luis.
- Remove a superfluous newline (Thanks Greg)
- Add Luis' Reviewed-by tag.

This patch was new in v4 of the series.

---
 kernel/module/main.c  | 7 +++++++
 scripts/mod/modpost.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index fed58d30725d..4723f1316709 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1988,6 +1988,13 @@ static int check_modinfo(struct module *mod, struct load_info *info, int flags)
 	/* Set up license info based on the info section */
 	set_license(mod, get_modinfo(info, "license"));
 
+	if (get_modinfo(info, "test")) {
+		if (!test_taint(TAINT_TEST))
+			pr_warn("%s: loading test module taints kernel.\n",
+				mod->name);
+		add_taint_module(mod, TAINT_TEST, LOCKDEP_STILL_OK);
+	}
+
 	return 0;
 }
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 29d5a841e215..5937212b4433 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2191,6 +2191,9 @@ static void add_header(struct buffer *b, struct module *mod)
 
 	if (strstarts(mod->name, "drivers/staging"))
 		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
+
+	if (strstarts(mod->name, "tools/testing"))
+		buf_printf(b, "\nMODULE_INFO(test, \"Y\");\n");
 }
 
 static void add_exported_symbols(struct buffer *buf, struct module *mod)
-- 
2.37.0.rc0.161.g10f37bed90-goog

