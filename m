Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA460CCA481
	for <linux-doc@archiver.kernel.org>; Sat,  2 Jul 2022 04:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiGBEKO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Jul 2022 00:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbiGBEKL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Jul 2022 00:10:11 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335622ED78
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 21:10:10 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id r142-20020a632b94000000b0040c978aef47so2068425pgr.10
        for <linux-doc@vger.kernel.org>; Fri, 01 Jul 2022 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2l3RLFgAAfB5gJrS1WFhkf1GPwe6iqzG1+pocvCkvn8=;
        b=n85fmgV8YL13NHOXAmDkw3hynV0Gh5QmNiSYsQm9jCdqtwslpAV93ZkYc8QzXG/8ep
         v9U2XDzaCoZBQ8BppCGZehEzLXTSKwGi+Zpi4ojVgQAxgVqVHZXNO0duA3b4gAoTMt80
         +sHwKmRZxha0fJjw+Qztxf8qBWq1NZ/3BSsSp0HINUSML2vIsTS0UIbfMcbG+aeYsgD4
         sPJ6AgB6kCdT7jUGinD6jUuhntlOLxQ0Be12GKo/Ra20XkoVtDN1yGG6N6aadBczZ4dQ
         WsL/dZ1TVlt+6M9D6Oeoci3tRrtxwPx+1Ii+kKcRy9o4ydGTIlLMjK0kgyXLl4CcWRNI
         2q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2l3RLFgAAfB5gJrS1WFhkf1GPwe6iqzG1+pocvCkvn8=;
        b=b4dcjOoqcUU3BTMo2E51Nw0g0rXvERL9IJoLKFHKyPiNW+Kn3NuFHebEg9j90l/1gD
         ktOWh81BXS5eYVRXAr3P51+VkFTd1YH7V+WOW2EIlh1H0uhsqxqTqGYOUrPsQdku7DJY
         b1SBZ/d7Rduu/NOS2MTvXi3tf5OPtwyJdZqsQ1tlZ4cYt+HjIFyLQ1Mt1ayQ/enzEXb0
         5VDt6m7uEJuOnivdnp6UyqfAW/Qts5AS3C/xOLZ6JiC47IKWWb7BipAm9KP7XL3nwIxI
         noWaV5XfUCz1fN0aLVy3exMasrdxOy2AD4bGLqEJN9N/TN/E40Jyj2jVk1ggQVtm8wuC
         xZug==
X-Gm-Message-State: AJIora+I24v9bh7igI20RBtnpYzRZFnNNvTpe99eM131dGUJc/eCwiMc
        BdN7qTGIQJgmbeA98UvhOhB+wKN/vMYvgg==
X-Google-Smtp-Source: AGRyM1t57UbR+SZZR/NQAR1HDFq+gH9joW4fT50YArEFanjs2sHJOJuDfSxR47/JHfZFnFLUaBY6Az3aScZMCg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:902:e5cd:b0:16a:6f96:eb9 with SMTP id
 u13-20020a170902e5cd00b0016a6f960eb9mr23833900plf.69.1656735009687; Fri, 01
 Jul 2022 21:10:09 -0700 (PDT)
Date:   Sat,  2 Jul 2022 12:09:57 +0800
In-Reply-To: <20220702040959.3232874-1-davidgow@google.com>
Message-Id: <20220702040959.3232874-2-davidgow@google.com>
Mime-Version: 1.0
References: <20220702040959.3232874-1-davidgow@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v5 2/4] module: panic: Taint the kernel when selftest modules load
From:   David Gow <davidgow@google.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
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
Signed-off-by: David Gow <davidgow@google.com>
---
 kernel/module/main.c  | 7 +++++++
 scripts/mod/modpost.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index fed58d30725d..730503561eb0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1988,6 +1988,13 @@ static int check_modinfo(struct module *mod, struct load_info *info, int flags)
 	/* Set up license info based on the info section */
 	set_license(mod, get_modinfo(info, "license"));
 
+	if (!get_modinfo(info, "test")) {
+		if (!test_taint(TAINT_TEST))
+			pr_warn_once("%s: loading test module taints kernel.\n",
+				     mod->name);
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

