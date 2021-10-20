Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F9DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 01:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61E1561167
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 01:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhJTBhU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Oct 2021 21:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhJTBhT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 21:37:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED67C06161C
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 18:35:06 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v70-20020a256149000000b005ba4d61ea0fso27944638ybb.22
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
        bh=IYOJmQ2nEaASN59pmylXXLLP+FrglnzeH7l3JWIvSSI=;
        b=XGXOwhu+3ly4GGQ1oRi8qz2yqWWUke3CkXEYsjduM7C/tJS6yJeHXy2j5xGYawLq2z
         rb1FEnzkNVoLle2OjDHjZTO+RnowokFV8JDHe5avoDhfLbEKSnFnO2Vtk6N3UDhuSxty
         v+KTsqzaz9kw8ZRK+XP10KKGJhyeWhJ2IF9/ZzDlXeo28BAZ57R/6WkRD0tRd7hZRUqs
         nqR77wQaksmIDKYEDKZcJ7Fv9+8ByKyq5+OWyZfZh+CDUSSc/qhD/H0VKYKloOMGPEB3
         lcj/VdaCp+ojGLKD7HKQPGhf/g0uwhUvK74T39GjDQecSd1WGaxrgrPT/QGdZDJEHvsV
         8WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:cc;
        bh=IYOJmQ2nEaASN59pmylXXLLP+FrglnzeH7l3JWIvSSI=;
        b=ofnlaC66lLiYegXHyyTSFRveX2nJs67i2u5//oJ9tYWWlCYXQS8vw3/joaiZDEVN++
         amv5uTcfVutJCQS+eLGJmsizln8kVHXbHk3iteoIwIxk9ByIWWuP2g/Metle8PE+Z5E7
         TkqZnrjOrfOm+IR8SKo9vYb12lEj2tzBtQDOQb/CMNWvwnvFMr0jWObUkofz+aRHFIYT
         8oX3g6uYeG6FSe2rhPeeTjvFv3/XTf8VIWGXO9y+O0TVYESAv+rHY3tu3ql0CdMITukY
         kzPYUrLdjnBsEaXoUgMabUAhQcstwTvVqTn/CgNA3mxdVKj1xEvi6tU40DsSq4MC7EMM
         VEDA==
X-Gm-Message-State: AOAM5332P+iHeHnGRWs5BfEIYlCFnztbGwMsuwLqsfWL5ZWh5VFJlCpg
        66Eq8eiS8MswmeE0ckl+NGWLmaw+30CNllfTyg==
X-Google-Smtp-Source: ABdhPJwdmdJ3rocY1RE5RBQflLKGa7RbWoXi5F/Gb1zI4tZm2gFPWWaQWmi5tTLT+iznoarcNeyZ7eNWYJDXAepx0Q==
X-Received: from kaleshsingh.mtv.corp.google.com ([2620:15c:211:200:1953:b886:7a6c:bf0])
 (user=kaleshsingh job=sendgmr) by 2002:a25:1b0a:: with SMTP id
 b10mr40405957ybb.520.1634693705344; Tue, 19 Oct 2021 18:35:05 -0700 (PDT)
Date:   Tue, 19 Oct 2021 18:31:42 -0700
In-Reply-To: <20211020013153.4106001-1-kaleshsingh@google.com>
Message-Id: <20211020013153.4106001-6-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 5/5] tracing/histogram: Document expression arithmetic and constants
From:   Kalesh Singh <kaleshsingh@google.com>
Cc:     surenb@google.com, hridya@google.com, namhyung@kernel.org,
        kernel-team@android.com, Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Histogram expressions now support division, and multiplication in
addition to the already supported subtraction and addition operators.

Numeric constants can also be used in a hist trigger expressions
or assigned to a variable and used by refernce in an expression.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
Reviewed-by: Namhyung Kim <namhyung@kernel.org>
---
Changes in v2:
  - Add Namhyung's Reviewed-by

 Documentation/trace/histogram.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/histogram.rst b/Documentation/trace/histogram.rst
index 533415644c54..e12699abaee8 100644
--- a/Documentation/trace/histogram.rst
+++ b/Documentation/trace/histogram.rst
@@ -1763,6 +1763,20 @@ using the same key and variable from yet another event::
 
   # echo 'hist:key=pid:wakeupswitch_lat=$wakeup_lat+$switchtime_lat ...' >> event3/trigger
 
+Expressions support the use of addition, subtraction, multiplication and
+division operators (+-*/).
+
+Note that division by zero always returns -1.
+
+Numeric constants can also be used directly in an expression::
+
+  # echo 'hist:keys=next_pid:timestamp_secs=common_timestamp/1000000 ...' >> event/trigger
+
+or assigned to a variable and referenced in a subsequent expression::
+
+  # echo 'hist:keys=next_pid:us_per_sec=1000000 ...' >> event/trigger
+  # echo 'hist:keys=next_pid:timestamp_secs=common_timestamp/$us_per_sec ...' >> event/trigger
+
 2.2.2 Synthetic Events
 ----------------------
 
-- 
2.33.0.1079.g6e70778dc9-goog

