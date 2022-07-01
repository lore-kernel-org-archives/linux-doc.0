Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A802C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 22:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbiGAWVL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 18:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbiGAWVK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 18:21:10 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465FD70E54
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 15:21:09 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-101ec2d6087so5334896fac.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Jul 2022 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Ofk4rFTEKTX2BS6YLbv2/ECvbG4xtPGd0CKO3Y0KEk=;
        b=f+k2wwbsoXsxQplpI0Z3ofLGdLGUK4vadpJiuC+K3M8nWLHFcrH/SQqDZ8dorslFL/
         T898icSAnmLSoWUTi+JUiFlZ7Qgnh4iRFI29VfcDniiySClhG+Y+N90p5AM5glUBgk/i
         ksuC776eM5fpJroIfDI4OlUV/ArTbqQujQhu+dLAGP09rB8Sf5ijiQF0FKtzdlbaOfQO
         9ydZd26EbeQ+jZ2lxe4XxYzOSLK4Xb/pqiUbBfV4t9F/cFLEm26LljBFf85umYn5mM4D
         n5BmpoA8KqTz1mlu/UZy4dryBkEQ69bTzMtEbcabRqPBaj0meiAO+8PTXl9Wu70U+dbE
         IdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Ofk4rFTEKTX2BS6YLbv2/ECvbG4xtPGd0CKO3Y0KEk=;
        b=H6QLKwJ7loL4On8usqbjKDUswEpw613hkVtkPC2Htu6VaGKe/93/rvXF/jtQlg8zKF
         GsPOL2fAqAheSYQoxX9SjSEVZHCbL45PnN+TIHLhcD5wLQ1CEKsXFeQmVmGvvH8EVF34
         W+thKFIV3dWcBiOM6OTj1mxzAP1ZivBDA39FZmJkyE10GX+UOX8NslfGqQWK0xX9jCb9
         f/jAOzKfD3uM1BwO88DwvJ9e8Tw8GehJoP6/aiO1voZey8hMYtX+abEv+CLfY2XJGO6k
         QngrUwAu3Fdl3CgwFOfM7HISrGgoiki6ZBYxUnpG8ZYZ69EZijhx5M4GPnW6VP0cPQs+
         z0yQ==
X-Gm-Message-State: AJIora/KjgRIMncA8P/O4gK4LoG+QkC7B5U2wBJcckstS2xjJR8xOC7P
        4AFCSYc9N3ztP2uJumwsg+FwccK79wf5TAlJNRNI3ecjf365VX6kayKIAtbo+CgKN8oV5IiBj/G
        0Uja9cjKBNKHmmzBRXF82vTRngKNw0zGldZlpWFc0aJ0RayeMTm/YVacv4qL0ZjOVj52ySjOoo2
        szTDr4fObLi4wl
X-Google-Smtp-Source: AGRyM1v7FDLcOQXUp14x2c+g5iMRTDqmxnTN/sybAY/eDiJWO/frDiSbSAgfhND9yAC8tyJsqTRZWw==
X-Received: by 2002:a05:6870:e750:b0:101:bb92:718a with SMTP id t16-20020a056870e75000b00101bb92718amr9889954oak.270.1656714068391;
        Fri, 01 Jul 2022 15:21:08 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id ej40-20020a056870f72800b000f5ccbb7d75sm15188581oab.1.2022.07.01.15.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 15:21:08 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH] doc/checkpatch: Add description to MACRO_ARG_REUSE
Date:   Fri,  1 Jul 2022 19:20:40 -0300
Message-Id: <20220701222040.1471655-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description to the MACRO_ARG_REUSE check.

I feel like this is also a good place to put a workaround although I'm
not sure if there is a cannonical way to solve those kinds of issues.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/dev-tools/checkpatch.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index b52452bc2963..43fa99f188f5 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -759,6 +759,21 @@ Indentation and Line Breaks
 Macros, Attributes and Symbols
 ------------------------------
 
+  **ARG_REUSE**
+    Using the same argument multiple times in the macro definition
+    would lead to unwanted side-effects.
+
+    For example, given a `min` macro defined like::
+
+     #define min(x, y)  ((x) < (y) ? (x) : (y))
+
+    If you call it with `min(foo(x), 0)` would expand to::
+
+     foo(x) < 0 ? foo(x) : 0
+
+    If `foo` have side-effects or it's an expensive calculation the
+    results might not be what the user inteded.
+
   **ARRAY_SIZE**
     The ARRAY_SIZE(foo) macro should be preferred over
     sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
-- 
2.30.2

