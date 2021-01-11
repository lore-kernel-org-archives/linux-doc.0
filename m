Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B09C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 10:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43FA120735
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 10:34:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbhAKKeY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 05:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbhAKKeY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 05:34:24 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C04FC061786;
        Mon, 11 Jan 2021 02:33:43 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id q75so14557287wme.2;
        Mon, 11 Jan 2021 02:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbrLZ8WTPGAsZD8pPmORFSKZzWFo2KyWvC0I69a1emQ=;
        b=EyOyI0s/8D+ZLv06FszNdfopdBXggLn3Y/dr/1cRwETBupnBanwuop+Jn1CR2HJgyC
         d2xjycfQliepqcxXV4j4/An2pniJBwxco5ts5eJ7gx45cf4/yafZEkXSUZB6K8MDn8Nr
         P16S0c3Z9QnG4CAvRpXIw4Axfn315lTHcNd7wLifNy0CfJMQDSGbTJUYsptzPqHFsggu
         1aHdMtAi95Rmx6V7H7lHmVAt7dmYLoU5GbuvIUKXpvrmq1Y+0He/jdnVkAJG3EwLOFGL
         /kFqaCqgJMYJXnda8L1XAV76N0DpTOpI/MprnknkqMbuPrxhGI7li8kjmTGS8dhrBh0H
         ZE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbrLZ8WTPGAsZD8pPmORFSKZzWFo2KyWvC0I69a1emQ=;
        b=g/SZ1TH8B8+UIfaMrzsjdza+lhlnPp8g5WzzuBejailmnJ/bA2+0lA52LWDCz7QMl5
         73jwrujKlmJUE0FUSXCHnAzEb9O6Xik0rOk8lIBtUjmUxZkccGbOioPdI2D05q6x10dh
         o8RHJ00L8wY+nFpOZVAuMNcysg4N1p9u39OBwU+rNL0q3ycvXzTwzOOfpyjoHa8i7qhi
         9OrUjbiRAR/7YxogiP34iXCNn6B51KmtzKxgK2Zt/m6S5jD/So5TXRcQDAiiRpWStO7Q
         Z8pZ/y8BnKFVpaLyB/qXCUZ0fqoVkOY4hLwcOxzG+0nVl5saUN72YMXZRn74lyGUiz6Q
         FhsA==
X-Gm-Message-State: AOAM530S9rlQd4QNHdtSRUySsRADaSP5a73GiW1SiOIQNs/B+w0FaHP4
        bQyofNiOtBl2YL5PWooP08qdHn0ctWhZAw==
X-Google-Smtp-Source: ABdhPJy3H4vUmZKPaaxnih+V4jvjXFzRweyPsPK2cKyeDQrImEQ+BTO1sjnbvHX1rSQmBbdfGmp2WQ==
X-Received: by 2002:a05:600c:224b:: with SMTP id a11mr13949574wmm.97.1610361222248;
        Mon, 11 Jan 2021 02:33:42 -0800 (PST)
Received: from localhost.localdomain (242.23.159.143.dyn.plus.net. [143.159.23.242])
        by smtp.gmail.com with ESMTPSA id u3sm26256808wre.54.2021.01.11.02.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 02:33:41 -0800 (PST)
From:   Joe Pater <02joepater06@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joe Pater <02joepater06@gmail.com>
Subject: [PATCH] Documentation: kernel-hacking: change 'current()' to 'current'
Date:   Mon, 11 Jan 2021 10:32:41 +0000
Message-Id: <20210111103240.7445-1-02joepater06@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change 'current()' heading to 'current' to reflect usage.

Signed-off-by: Joe Pater <02joepater06@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index eed2136d847f..451523424942 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -346,8 +346,8 @@ routine.
 Before inventing your own cache of often-used objects consider using a
 slab cache in ``include/linux/slab.h``
 
-:c:func:`current()`
--------------------
+:c:macro:`current`
+------------------
 
 Defined in ``include/asm/current.h``
 

base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
-- 
2.29.2

