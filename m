Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D566C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jul 2022 23:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiGDXAK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jul 2022 19:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGDXAJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 19:00:09 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E55FB863
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 16:00:09 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id s4so3995358uad.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 16:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=im3qEeAmdXUHO+WGiZDrLtlzO2iC5TQaRlSt5RR4Yi4=;
        b=b3sf35YMLlMnmD0XI2MndG/Ki+SJhIzMgSnCCrFH/29wWiHzDH/QrUNbA22VZSyhdm
         ZSCDP8PHvScDBrTjwXEJSFh0S9lZ+46+kf9ok5uQUggEZjFq4qQ/dsylgdZ/c+ASmLRf
         ljBJplHwo6Dt741eMJNgx8JDuxyRBbW9DxWxg81ANQNcVHHJxIDG73iguLzWIMT7yFQ3
         CyF0/gO6ExhT/Pyjgwu00JOQSxhQY4LoymZBhxl+L1AdEOjyFtzEz08heY+TmG2dQdXk
         AsD5t7S0WVS6YYFxtyZXuoxpi59nWDRP392uF28svhsdadLJCuknkSNbzzlEyD3ysYqT
         qeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=im3qEeAmdXUHO+WGiZDrLtlzO2iC5TQaRlSt5RR4Yi4=;
        b=tvmrUrE40ySA6TnvAZiy0/+6CS9bfW0plSSmaljXajvkKlMwAOQHID0QZjUr7yR8GM
         nVc/Vas0Y35Ox6WVuyZTbPjXgNGwG+GBHrw68HVAu4jGYGDEr8LvoQQihYAV1joETxiO
         6aQltTvKf9INop7uTia9zmUe4uEZf5RF5X4egPGp+aBz6atpx8IB+Ce8WHKcVpqlr+Ze
         rlP1EPBSaZwZs5yxdyf8UCBGw/f8UT1w0oxKK1oqyrSMEOF3Uh02RAK2VV+DsC+Z72Wo
         SVu0YX/UAmCwX+THL7imSUJVv9hOy/NdltCIULwEcKCN7Dc7VSIBjaa4aN8perV+LJI6
         ISNA==
X-Gm-Message-State: AJIora9M2+Z51x4EEY9Ox165huIjNlwHIV3qwfvMK2XWxnp+7S9uInZl
        Lv1kFYD9Q5pf0v4cjAYOaMUAZuDBM2pwC2Zs+U4J89Y70l4/pIgz7My/t8bG4cGRXWZsJBJcjb1
        o9rrkG4n/Eto1fag+kQjpOsdOD1A1rAf0gNwaaaCRNbLwltwGqzBqfrSoYgoun0j85XhUu+etZ7
        1g1CH+nozCQE/D
X-Google-Smtp-Source: AGRyM1sFL3izaOkzTcb7s1T8dZRv7qt9i++B0cfjkrrXU0zdL7pZMcKJd17fmC1GtNf+fi4Di5ALYg==
X-Received: by 2002:ab0:7a43:0:b0:382:96f8:7457 with SMTP id a3-20020ab07a43000000b0038296f87457mr2774227uat.45.1656975608035;
        Mon, 04 Jul 2022 16:00:08 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id z4-20020ab03404000000b00381eb3801d7sm4182449uap.1.2022.07.04.16.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 16:00:07 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v3] doc/checkpatch: Add description to MACRO_ARG_REUSE
Date:   Mon,  4 Jul 2022 19:57:57 -0300
Message-Id: <20220704225757.1811311-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description, an example and a possible workaround to the
MACRO_ARG_REUSE check.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
Acked-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index b52452bc2963..86545c65cf7b 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -759,6 +759,26 @@ Indentation and Line Breaks
 Macros, Attributes and Symbols
 ------------------------------
 
+  **ARG_REUSE**
+    Using the same argument multiple times in the macro definition
+    would lead to unwanted side-effects.
+
+    For example, given a `min` macro defined like::
+
+      #define min(x, y)  ((x) < (y) ? (x) : (y))
+
+    If you call it with `min(foo(x), 0)`, it would expand to::
+
+      foo(x) < 0 ? foo(x) : 0
+
+    If `foo` has side-effects or it's an expensive calculation the
+    results might not be what the user intended.
+
+    For a workaround the idea is to define local variables to hold the
+    macro's arguments. Checkout the actual implementation of `min` in
+    include/linux/minmax.h for the full implementation of the
+    workaround.
+
   **ARRAY_SIZE**
     The ARRAY_SIZE(foo) macro should be preferred over
     sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
-- 
2.30.2

