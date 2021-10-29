Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E548DC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 29 Oct 2021 18:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC42860FC4
	for <linux-doc@archiver.kernel.org>; Fri, 29 Oct 2021 18:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhJ2ShH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Oct 2021 14:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhJ2ShE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Oct 2021 14:37:04 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405FCC0613B9
        for <linux-doc@vger.kernel.org>; Fri, 29 Oct 2021 11:34:35 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id on18-20020a17090b1d1200b001a04d94fd9fso5735073pjb.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Oct 2021 11:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=pIwkJUfmtLBNksnvSqi0P2Sms1nGm8KESnXHMvPX9Og=;
        b=fJCpI/BWluL77Q7maCUxV2xrKIE+7MJas3Ods1U9PNA8EVVEg95yke8fKTcyY8b5H3
         qPFp4lJHYBh4nWeGtYn5hserusYrCK1Br4zRywROqExEvOSB1g9ntzQDrKSIgOuZvLrJ
         lm8Ddp8sI0mxV1VKh1SYYv0Ck5uYEBxH23e/iXASqfCQD1VkwFColi3LuL9hFOkxdqYb
         htog9a+F6r88oqlvXkA8xpDdDLsYPoMCWfAPebfHfL5fNV/bGoVKbp7YFsmzaihDEHKY
         E32M0jl5nylSJRI6SdPa7u35G0iPjLPdRwtqfUcv17P8yqXgx1hcX9tLDMC3dkD/lpBY
         Yqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=pIwkJUfmtLBNksnvSqi0P2Sms1nGm8KESnXHMvPX9Og=;
        b=oxvq/Q4qF8HBkgAplFE9PwbOTAOxZjCtuIrAEuwSFlvVQBRDCehM4DZ3+e9trhO/WD
         J741tPGq1qwD+aXws4M3PvUVr5k2d1FtCiZcMKyrkGbdZnW8SlfZnxW1xv34xtWgvRB2
         T1qyr0ksACxv6XXNQskkIzjtJfJE1T3zu5vZY7XaZbotJmMXtpWf2a6kr9jJ1jmyPgFz
         3vkIiQilXOf9RrjuvcUnNlwXlCigJb1WpQ8fiDbXXe26G/5cWsxlf1/vmOSFMR3ZaOZM
         5zKsofUGdqdCT+EIlRrUltsBBinX7p2FKe8BMeUULDtvX8G/sEnV/qrCI91lFVTfAl4D
         8t5A==
X-Gm-Message-State: AOAM530nvX33JkIrpfPdTkOHb5cnP5UwtI547RcjJVA1PlJoko+zrsvS
        r+JHgRP6Zl1/lxfLq6m5oE5aVXl8nNFzT3mY7w==
X-Google-Smtp-Source: ABdhPJyz6W/gui/zwEmv5bNzGDfKp0W8dihkKOo9bnSi1OrzlXVkeu3uX3rua6U5CwSOAHKySI/G0Nydiq27fR+0dQ==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:b03:1d88:1cf2:4973])
 (user=kaleshsingh job=sendgmr) by 2002:a17:90b:4c4a:: with SMTP id
 np10mr13446930pjb.233.1635532474572; Fri, 29 Oct 2021 11:34:34 -0700 (PDT)
Date:   Fri, 29 Oct 2021 11:33:30 -0700
In-Reply-To: <20211029183339.3216491-1-kaleshsingh@google.com>
Message-Id: <20211029183339.3216491-5-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211029183339.3216491-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v7 4/4] tracing/selftests: Add tests for hist trigger
 expression parsing
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, rostedt@goodmis.org, mhiramat@kernel.org,
        Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add tests for the parsing of hist trigger expressions; and to
validate expression evaluation.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
Changes in v7:
  - Add error check test for divison by constant 0.

Changes in v6:
  - Read the expression result from the trigger file,
    instead of creating a histogram to print the value.

Changes in v5:
  - Add README pattern to requires tag, per Masami

Changes in v3:
  - Remove .sym-offset error check tests

Changes in v2:
  - Add Namhyung's Reviewed-by
  - Update comment to clarify err_pos in "Too many subexpressions" test


 .../trigger/trigger-hist-expressions.tc       | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc

diff --git a/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc
new file mode 100644
index 000000000000..05ffba299dbf
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/trigger/trigger-hist-expressions.tc
@@ -0,0 +1,63 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: event trigger - test histogram expression parsing
+# requires: set_event events/sched/sched_process_fork/trigger events/sched/sched_process_fork/hist error_log "<var1>=<field|var_ref|numeric_literal>":README
+
+
+fail() { #msg
+    echo $1
+    exit_fail
+}
+
+test_hist_expr() { # test_name expression expected_val
+    trigger="events/sched/sched_process_fork/trigger"
+
+    reset_trigger_file $trigger
+
+    echo "Test hist trigger expressions - $1"
+
+    echo "hist:keys=common_pid:x=$2" > $trigger
+
+    for i in `seq 1 10` ; do ( echo "forked" > /dev/null); done
+
+    actual=`grep -o 'x=[[:digit:]]*' $trigger | awk -F= '{ print $2 }'`
+
+    if [ $actual != $3 ]; then
+        fail "Failed hist trigger expression evaluation: Expression: $2 Expected: $3, Actual: $actual"
+    fi
+
+    reset_trigger_file $trigger
+}
+
+check_error() { # test_name command-with-error-pos-by-^
+    trigger="events/sched/sched_process_fork/trigger"
+
+    echo "Test hist trigger expressions - $1"
+    ftrace_errlog_check 'hist:sched:sched_process_fork' "$2" $trigger
+}
+
+test_hist_expr "Variable assignment" "123" "123"
+
+test_hist_expr "Subtraction not associative" "16-8-4-2" "2"
+
+test_hist_expr "Division not associative" "64/8/4/2" "1"
+
+test_hist_expr "Same precedence operators (+,-) evaluated left to right" "16-8+4+2" "14"
+
+test_hist_expr "Same precedence operators (*,/) evaluated left to right" "4*3/2*2" "12"
+
+test_hist_expr "Multiplication evaluated before addition/subtraction" "4+3*2-2" "8"
+
+test_hist_expr "Division evaluated before addition/subtraction" "4+6/2-2" "5"
+
+# err pos for "too many subexpressions" is dependent on where
+# the last subexpression was detected. This can vary depending
+# on how the expression tree was generated.
+check_error "Too many subexpressions" 'hist:keys=common_pid:x=32+^10*3/20-4'
+check_error "Too many subexpressions" 'hist:keys=common_pid:x=^1+2+3+4+5'
+
+check_error "Unary minus not supported in subexpression" 'hist:keys=common_pid:x=-(^1)+2'
+
+check_error "Division by zero" 'hist:keys=common_pid:x=3/^0'
+
+exit 0
-- 
2.33.1.1089.g2158813163f-goog

