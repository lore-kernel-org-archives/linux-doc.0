Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A8EC43334
	for <linux-doc@archiver.kernel.org>; Mon,  4 Jul 2022 13:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiGDNoR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Jul 2022 09:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiGDNoP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Jul 2022 09:44:15 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B992ACC
        for <linux-doc@vger.kernel.org>; Mon,  4 Jul 2022 06:44:13 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id q28so9040179vsp.7
        for <linux-doc@vger.kernel.org>; Mon, 04 Jul 2022 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pRW6I8f353gFSx8l2p/QjMjzjYlOCAEBTBrB4U1APYg=;
        b=aIMw3MmfMEhSW/ep6EHztQeCAiU0KVetf20gN80QB5qAvQSf5gbO9E7aJwkqZgMu29
         e2yFOvZi3GZjlMDFlnHC690B1kiBPFAoHYXYjhWN5Whr/hL/Dk86UPNwv15MC/qPJDDZ
         A+b3A+CHdkQfagaA0vT83dnU+Ydb3IJ4G0bPBrGvJ3Ngo2BiQIx9FCaOQRlcegYlnjrf
         t0eARojq7wh2miq/x5PdNQ3Py6iLUobs2BW92Vb3VPDVKa7ebDUpXiAWPZccVkquslkT
         ZUuNhjgl2h97LRnJO3ZXUU55CVvD3+r3VCSEH37oupmHwxNyT0bPSCbHMXBPm+fcbh1Q
         wY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pRW6I8f353gFSx8l2p/QjMjzjYlOCAEBTBrB4U1APYg=;
        b=dZxyVW8QY7Gz5wD9/CEEPSgWQYI/bGi/Kth9onljiqXiJnWxUWtnmPSqHJcT8c3QxH
         kyveFWaBXKxo0YOkg2XXI7i/7hYW7tnEJkkHRl9TOq9wAMA9UJiMN/gHH83SPyX5H99j
         MYkANLoVKw0E9WD5w6w46y1Uw1TOHsa1IzIfU04rUTidISnYPKSO+KPZlWaJs8d2RTwG
         Gs3sf13GuqH8MPJv6q3kqzbtWitX3hMKVrIsBkQNTaM0rjh7B/+PgU8eAOWyluTGuRbM
         Sdlbuad5AFyuWa6FRQbMD1CyUMZYhuAeV9D8wGy0rJhzUc/SIHVs9WdbGPBGZcqc9XGb
         gYiA==
X-Gm-Message-State: AJIora/B9PZTU2I143/6ZSGLqPS+JFADg5BAvU0wmyT2CHuTNbB8kGXC
        Rg0FnQ1MTpVzlWYvXA9hZJyj6KAeMs4tZFa6rJcbW7G5wqxLWa8FF06FlKTpP36A0VLyfvT0npN
        KPo6FohctxZJvm1M+LLyEyLUZDX9jz+gbA8NJLkwKcxpk8vdmP4XNB1NfbPYfwseJV5v7UzmI3P
        512Ex9STbIq0g3
X-Google-Smtp-Source: AGRyM1uZL76q3HVNMManzanpEcOLdCKoOmgpRU/26ID1MiN44xut9MkPvslL+mgIyx4XxYlgCEftvg==
X-Received: by 2002:a67:2645:0:b0:356:4519:b587 with SMTP id m66-20020a672645000000b003564519b587mr16633078vsm.23.1656942252281;
        Mon, 04 Jul 2022 06:44:12 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id y8-20020a0561020c4800b0034c00d40507sm3335852vss.3.2022.07.04.06.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 06:44:11 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-doc@vger.kernel.org
Cc:     dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v2] doc/checkpatch: Add description to MACRO_ARG_REUSE
Date:   Mon,  4 Jul 2022 10:44:02 -0300
Message-Id: <20220704134402.1486566-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a description, an example and a possible workaround to the
MACRO_ARG_REUSE check.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index b52452bc2963..f7ed2c1f9d5e 100644
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
+     #define min(x, y)  ((x) < (y) ? (x) : (y))
+
+    If you call it with `min(foo(x), 0)` would expand to::
+
+     foo(x) < 0 ? foo(x) : 0
+
+    If `foo` have side-effects or it's an expensive calculation the
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

