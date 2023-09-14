Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2A5EEAA40
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 13:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbjINNqC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 09:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239311AbjINNpt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 09:45:49 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50BA42705
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 06:37:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso10694895e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Sep 2023 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694698653; x=1695303453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UtEDLGrLEJ6Yf0BlzG31NFuV4f9+Z2ng7sP9jomSPgM=;
        b=pIWuhaNBIDi7szqefVU+F+ne+2YflreFExbq95b6zRS+uaqcP4l34xMBi/0klcbhCB
         drE1R1fPaeDqJ4zEZee3kcb1AgWtzKOW8jQwvF1+ygUmSldOVPf+N637rurUd5srFVkl
         dX5DY9RN9cjdPC5UxVTjgaM4wml9o6eRuLvptAoI82UZf6uWOWgFR9dVsQaZtVvsBBtg
         fSbF1IjHsHwOI1NY1NJYBFunLf8fCcFvERtkgOeMgKR2O2xOOHZC+lailtlbkL7zlfdn
         kWLq3enmIUZcfGhQEWUf26by9KhBzn6CfoWDASWVcJCdLpvVqGhMLdvPozOnqY1Gz/zu
         AunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694698653; x=1695303453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtEDLGrLEJ6Yf0BlzG31NFuV4f9+Z2ng7sP9jomSPgM=;
        b=GnrBwYDx6zrXPHRWmr7eFgZG6xZDwEqeKihkUm7hbuoWzgpRoHx0mF8u9G6GWEw0R1
         eaWLnrYYKCQogqCXstGMfE1n5kkv9KIU+dnc/ekGxAHV2C1CuNIesMtJPFKWdqZK5wTg
         /5rAqRfFlVYS911enk8gzY4DC2b3rzMBIBwwA9d2VVVu76DSjRRpXpd3Nb9HPzue2yaD
         /kr3U7E+Ud+nKgsr86WbQoDf2peTig8eLT4NQbnoOGm1jqctjouUCc85CRHBVRHvpbHt
         ZPkRE/aQ90i9Xy8c17ZFzyjUphR21bhog46B72DIiaNCEZeDpO7fenwzXRvivJvALx2v
         96aA==
X-Gm-Message-State: AOJu0Yx3rP/VCB1QBmXe/QMSouBMaPoqc5lFAIYLmzIU4D3IvkEuR0fG
        WDvt3PWfTl+4NlhrFdCC7xeApQ==
X-Google-Smtp-Source: AGHT+IEpMsWeTM1Aa8jmxIP5P65K/mbegu/VOKs43KIrqswYDTztiwkAzB/UX/3KB10SAajS1EkwbA==
X-Received: by 2002:a7b:c44b:0:b0:3f7:f2d0:b904 with SMTP id l11-20020a7bc44b000000b003f7f2d0b904mr4478679wmi.8.1694698652704;
        Thu, 14 Sep 2023 06:37:32 -0700 (PDT)
Received: from ta2.c.googlers.com.com (206.39.187.35.bc.googleusercontent.com. [35.187.39.206])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b0031c5dda3aedsm1824865wrs.95.2023.09.14.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 06:37:32 -0700 (PDT)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        corbet@lwn.net
Cc:     linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/2] docs: pstore-blk.rst: use "about" as a preposition after "care"
Date:   Thu, 14 Sep 2023 13:37:28 +0000
Message-ID: <20230914133729.1956907-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reword the sentence to "care about the {oops/panic, pmsg, console} log."

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/admin-guide/pstore-blk.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 2d22ead9520e..1df5d4f93219 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -76,7 +76,7 @@ kmsg_size
 ~~~~~~~~~
 
 The chunk size in KB for oops/panic front-end. It **MUST** be a multiple of 4.
-It's optional if you do not care oops/panic log.
+It's optional if you do not care about the oops/panic log.
 
 There are multiple chunks for oops/panic front-end depending on the remaining
 space except other pstore front-ends.
@@ -88,7 +88,7 @@ pmsg_size
 ~~~~~~~~~
 
 The chunk size in KB for pmsg front-end. It **MUST** be a multiple of 4.
-It's optional if you do not care pmsg log.
+It's optional if you do not care about the pmsg log.
 
 Unlike oops/panic front-end, there is only one chunk for pmsg front-end.
 
@@ -100,7 +100,7 @@ console_size
 ~~~~~~~~~~~~
 
 The chunk size in KB for console front-end.  It **MUST** be a multiple of 4.
-It's optional if you do not care console log.
+It's optional if you do not care about the console log.
 
 Similar to pmsg front-end, there is only one chunk for console front-end.
 
@@ -111,7 +111,7 @@ ftrace_size
 ~~~~~~~~~~~
 
 The chunk size in KB for ftrace front-end. It **MUST** be a multiple of 4.
-It's optional if you do not care console log.
+It's optional if you do not care about the console log.
 
 Similar to oops front-end, there are multiple chunks for ftrace front-end
 depending on the count of cpu processors. Each chunk size is equal to
-- 
2.42.0.459.ge4e396fd5e-goog

