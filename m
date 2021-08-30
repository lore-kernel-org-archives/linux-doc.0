Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E3BC432BE
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 16:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E9DA60F57
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 16:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237621AbhH3Qfz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Aug 2021 12:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbhH3Qfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Aug 2021 12:35:54 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D244BC06175F
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 09:35:00 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so10993170wmi.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=BlM1qgwK78ZJD3Qinqyqb58/9qg2GmD42jGtidijjH4=;
        b=WNB/soJYe7oDJbFB4ip+Nlqf6OKTHD/1+otQvv07EsMWwfz/Dqrf22Bkr9+6/OSjLK
         0EM7GB2czEF4Tb6tBLgP845xSw3qcUHnL5pilTYMU9xGcxv9PKSZlS2a+3OxR/TSsbb6
         wwhn8UZmPKmiV/edIrYzYTn149O/lBJHaRLsuNti7RbhjVtJeKM76jHFc03ZylTdaSDa
         fgpMH3A20a66uM0eM3uwnXdqmk8Rubj7rE84CDSeCfE3cIO4RvEvldj5m4lcdWzXVp8+
         DEbVkYGIb+nX/2BaLxETNZWMqH/R6Cu7pXIlU5p1+EE3zqPKCqRxe+nV2/ruBDl7pOBu
         NW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BlM1qgwK78ZJD3Qinqyqb58/9qg2GmD42jGtidijjH4=;
        b=PTs16NKxIhEIjbJxIIB6hUJoYYbI5VRIx/2oeX0vT4+4dE5Zggbm0FCWO/cXZxDZiI
         fFsqcbAy9LGZBCYNsUERJrsB9fZKw1SPLYZCR02SbiNzJ9Ok1g7V3sC734/+jg1DWTav
         9tih0HIgOo4mJ+k08hm86jHVT2+RAD1yEe1YXtiCrkHXgJwNsHDEbWpLnCN655hn8z9K
         lV2zYp7s0EAwtfn5OyWTky3YFcnTAGTTbrMbImmqIAfF4L9H4pB43Dyi/wjqplukFpAQ
         mSl3kYgYDFGYsUYMz9fugKgznWVtxpbq4T1fMaZlpeVRfvt3uQCsM9YI4kMx0GBnsslP
         7wig==
X-Gm-Message-State: AOAM531xnKzJt/5G/RBvr2zcZP3zyzoJfG1wJ+gAk0kPQAwCggeHFPhk
        ouwv0RsEEc6YnNty+A2dIF0TRawrKiN6fA==
X-Google-Smtp-Source: ABdhPJy4I+aibeJuzvIOHpqt9YWkSYmFMHOTdoSoTTAiAsOBrSZJwAeJdb4M//1hkf/y3i1zQoaGbw==
X-Received: by 2002:a7b:c405:: with SMTP id k5mr22936394wmi.87.1630341299337;
        Mon, 30 Aug 2021 09:34:59 -0700 (PDT)
Received: from localhost.localdomain (81.227.26.93.rev.sfr.net. [93.26.227.81])
        by smtp.gmail.com with ESMTPSA id z5sm5225wmp.26.2021.08.30.09.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 09:34:58 -0700 (PDT)
From:   Roger Knecht <roger@norberthealth.com>
To:     Jiri Kosina <jkosina@suse.cz>
Cc:     Jiri Kosina <trivial@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Roger Knecht <roger@norberthealth.com>
Subject: [PATCH RESEND v2] Trivial comment fix for the CRC ITU-T polynom
Date:   Mon, 30 Aug 2021 18:33:24 +0200
Message-Id: <20210830163324.12537-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes a small typo in the CRC ITU-T polynom documentation.

The code comment says that the polynom is x^16 + x^12 + x^15 + 1, but the
correct polynom is x^16 + x^12 + x^5 + 1.

Quote from page 2 in the ITU-T V.41 specification:
  "2 Encoding and checking process

  The service bits and information bits, taken in conjunction, correspond
  to the coefficients of a message polynomial having terms from x^(n-1) 
  (n = total number of bits in a block or sequence) down to x^16. This 
  polynomial is divided, modulo 2, by the generating polynomial 
  x^16 + x^12 + x^5 + 1. [...]"

Source: https://www.itu.int/rec/T-REC-V.41-198811-I/en)

The hex polynom 0x1021 and CRC code implementation are correct.

Changes for the resend:
  - Extended patch description
  - Added additional CCs

Thanks,
Roger

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 include/linux/crc-itu-t.h | 2 +-
 lib/crc-itu-t.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/crc-itu-t.h b/include/linux/crc-itu-t.h
index a4367051e192..2f991a427ade 100644
--- a/include/linux/crc-itu-t.h
+++ b/include/linux/crc-itu-t.h
@@ -4,7 +4,7 @@
  *
  * Implements the standard CRC ITU-T V.41:
  *   Width 16
- *   Poly  0x1021 (x^16 + x^12 + x^15 + 1)
+ *   Poly  0x1021 (x^16 + x^12 + x^5 + 1)
  *   Init  0
  */
 
diff --git a/lib/crc-itu-t.c b/lib/crc-itu-t.c
index 1974b355c148..56e6e0d63d1e 100644
--- a/lib/crc-itu-t.c
+++ b/lib/crc-itu-t.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include <linux/crc-itu-t.h>
 
-/** CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^15 + 1) */
+/** CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^5 + 1) */
 const u16 crc_itu_t_table[256] = {
 	0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
 	0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
-- 
2.17.1

