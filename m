Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713CEC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 12 Oct 2022 20:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiJLUnG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Oct 2022 16:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiJLUmd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 16:42:33 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F6DBBE10
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 13:41:52 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so12925672oop.9
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7HMhLLtCvatZ/NCQ2qP4QnkJ9MKHHBUhlnE2Vt6NLnc=;
        b=YwT3v1RD1Rj+jJChHbrju59pLRX0a6lFfTe2pB1YEc8tqiL661x4Lq47dPKhVR8bFf
         RfPHGAsDJxj14ly4bLDywT0SVkvbBZbASKcr9yE1HU7ydSflQbguxAttBBCX5yp3kv2e
         Ut8GG8wuNZJUnBGxeoG8ZMHmJUnKyTeYAaHZZ8Uvd07iqjdqbuedNZgty6fj+S+Db0BN
         Vm4fQ9YTnHkR0Fr3/+rPOLeIoXJeMPOLEQO3+rwCkXeFGsPIZn20wZtJAexLxuDzSxhB
         q/xEq3/S6hlff9OD/+yhHQ/dTpgfRhFIbfdiIckmrD20TPbGobxf2EI15/CuD8ZiWpRP
         Mhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HMhLLtCvatZ/NCQ2qP4QnkJ9MKHHBUhlnE2Vt6NLnc=;
        b=SPHg9U/AXRkmSxAgQR5H2NJpB11GRTm7dk0ZZQi0Nz1RDbgq6ENxw8Rod9isGuMMVo
         qgeGdrwMVQbjgiR+R7hjBoW3cA7fX5IMR9gBsn0xjgfwzlnfIH7B/4vAI+DY/a/hyXFP
         WqJeeiXWhU5z6xzMeEIsRyxZydkdZAO+1I85/DI8VQcAEd5lzszZrfPjY6MbIwfTD/07
         yroddkX0HeRoQMJYoW8CqKnLPiV5Vaf0ghXEQTlNgOKp7kjEUXhMsmkOUq5wKM+Ap7SJ
         r8K/UKw4oajSevTbl7TNVCpB+rtKrVDu7D760jQMK89n3mdHo1D919ZLjdk0wD77jZYx
         gFoQ==
X-Gm-Message-State: ACrzQf1PaiJAidNGOd9Zu9IxDeldSnMqkI5WGtUzUv+y/2GY41qp3jvX
        WqXBshYEMeD0ElwOPm2CMfVJcy4Ng6Ags1ZmkqGWDZ8mrWV6pax/lfyKWOtkuYgCwepEMsx4fQ2
        2Dka7tsGHr92Z+RaZLrRAmh+MHlAAoUgMdLz6pA3iS4T+pxJCuQKUJ+mjcxCFlmHoWTYg2L8Sr8
        kTndkPyZ2WMzPO
X-Google-Smtp-Source: AMsMyM5chMv9UMsmj06BQ5R5Sz5oexIwHqWE8zc6BrLhx8J/PAa/3cmpfALeB+uqXNDe4kRzNpYUtg==
X-Received: by 2002:a05:6830:b8c:b0:660:d97c:cc21 with SMTP id a12-20020a0568300b8c00b00660d97ccc21mr13293922otv.355.1665607311304;
        Wed, 12 Oct 2022 13:41:51 -0700 (PDT)
Received: from localhost.localdomain ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id b41-20020a056870472900b001327e6f230bsm1619830oaq.27.2022.10.12.13.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 13:41:50 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        rdunlap@infradead.org, bagasdotme@gmail.com, akiyks@gmail.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v4] doc/checkpatch: Add description to MACRO_ARG_REUSE
Date:   Wed, 12 Oct 2022 17:39:39 -0300
Message-Id: <20221012203938.909734-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description, an example and a couple of options when it is safe
to ignore it.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/dev-tools/checkpatch.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index c3389c6f3838..678c1956468b 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -854,6 +854,32 @@ Macros, Attributes and Symbols
               ...
       }

+  **MACRO_ARG_REUSE**
+    Using the same argument multiple times in the macro definition
+    may lead to unwanted side effects.
+
+    For example, given a min() macro defined like::
+
+      #define min(x, y)  ((x) < (y) ? (x) : (y))
+
+    If you call it with ``min(foo(x), 0)``, it would expand to::
+
+      foo(x) < 0 ? foo(x) : 0
+
+    If foo has side effects or it's an expensive calculation the
+    results might not be what the user intended.
+
+    When it's safe to ignore:
+
+    - If the macro arguments of all uses of this macro are free of
+      unintended side effects. Passing a constant value is usually
+      fine, as the compiler will use constant propagation and further
+      optimizations to produce acceptable code.
+
+    - If you defined local variables that will hold the value of each
+      argument in the macro's definition. See the min() macro in
+      include/linux/minmax.h for example.
+
   **MISPLACED_INIT**
     It is possible to use section markers on variables in a way
     which gcc doesn't understand (or at least not the way the
--
2.30.2

