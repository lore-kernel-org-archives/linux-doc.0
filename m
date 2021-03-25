Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3504FC433FC
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 16:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080C561A31
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 16:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhCYQrw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:47:52 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:35707 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhCYQr0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 12:47:26 -0400
Received: by mail-io1-f48.google.com with SMTP id x17so2570433iog.2;
        Thu, 25 Mar 2021 09:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bFFWeBhKbBRq7bfBXvZhpXaSQSynL7MnfXgS4NCGGZQ=;
        b=VWHcZ/Z/398Mn+/3IQ8j6qHX4qZRHMlwZEBQ5hOcajQWXrzwM+QVuGlle2Dm9voamL
         ByRAEebexzMgu2tp0wSmi+V34iPrE8ahTvSvJw7p0vVLHzCAuULJHF5uHAIqNt0iQ9MZ
         JEr9sP2oJ6hgRN5hBdwgJxz9B5qQtyo4BztV5XTmfNxV5fwKQfnvLsHKM4b7mYz6q98T
         7JgYaeEIj13ajwYj5pq1rXZOvCUiGdjtg+swkFLPfhBxKMieO2JbhdvsfTRO7nvKC2OE
         yk6wleYBAR5xMnqa6AgvBrsVvdB6sHZpQ9VYytyXh6UmKDT+zu/uamSy7k5507VvWDfR
         aeqQ==
X-Gm-Message-State: AOAM531KzIrdaYumPgvLtVeqvROVsjEcWxoxG54D7p63Ect0sMlCmu4U
        d4C/74ausvJ+I1jvyULKksmxbsnzmg==
X-Google-Smtp-Source: ABdhPJwrE46hefT0QnvkjPW8iePRYG2zYhUFdPB70XUQwOH4QFM8jAtcgFrhTHLVHjIgYI93VM2MDQ==
X-Received: by 2002:a6b:7f4d:: with SMTP id m13mr7072312ioq.134.1616690845065;
        Thu, 25 Mar 2021 09:47:25 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id h13sm2868615ila.82.2021.03.25.09.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:47:24 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: Fix reference in submitting-patches.rst to the DT ABI doc
Date:   Thu, 25 Mar 2021 10:47:06 -0600
Message-Id: <20210325164713.1296407-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325164713.1296407-1-robh@kernel.org>
References: <20210325164713.1296407-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

submitting-patches.rst has a stale reference to ABI.txt. Fix this with a
proper rSt link.

Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index 68129ff09967..42e86f978be2 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -84,7 +84,7 @@ II. For kernel maintainers
 III. Notes
 ==========
 
-  0) Please see ...bindings/ABI.txt for details regarding devicetree ABI.
+  0) Please see :doc:`ABI` for details regarding devicetree ABI.
 
   1) This document is intended as a general familiarization with the process as
      decided at the 2013 Kernel Summit.  When in doubt, the current word of the
-- 
2.27.0

