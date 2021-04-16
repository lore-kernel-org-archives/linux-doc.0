Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A992C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:16:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C334611AF
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235558AbhDPWRR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 18:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235727AbhDPWRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 18:17:16 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9CEC061574;
        Fri, 16 Apr 2021 15:16:50 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id i6so12334953qti.10;
        Fri, 16 Apr 2021 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=et03yqOqpGISagTVprudhL8f3OBi+8uNy9K7WISaF/Y=;
        b=uHwHwSJWSJFDaHwSVOh/hj/JoGJsh1RSO9N9nM250siAoAYFxotm+j1B9mJfWZvXUQ
         B74cz7lBmS8yCv1dlvexocq9YbSQlSLbCTA57modMZtUUazeAT0kI+I6fO8cTAodRbN4
         Pk989skHaiMRJgrdRur4mRB6KYnWzmpmptutGO8n4MEGzr8qYyGwajdK1oFAK1uO6vjV
         ONJi/0UyWq728PVIBEcx1Q5LfL++LnakUYsyBfuD6JsXBd/9gYJ8TTl4F1cLCcrg1XSK
         sNb1FdSU6QUixGOEpdaHZYuKPECOHRDzCyEDalXs7+gfmNF4xaSCbC8GHALiwhRUJMJ3
         goOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=et03yqOqpGISagTVprudhL8f3OBi+8uNy9K7WISaF/Y=;
        b=PprXOJcKKhqG4xRtkxjl43iRVGlN0M/FfHDJcz2kGS0BdEoTxGpKCZVdfoHEmyD2+F
         650F51iQRDtiQ+BRrU7PIv2dzSpEgxHI31fJ2N77+lSAywzAoIjMxfQvLa4gzpEKk/85
         tgNnJJb9HiqyLVAbgtP5VAwr5FIigkTcukoADiCUJw3KY1Y9bCJsUhF3Y76hNgj3TbBt
         wuNRSqXkWUhGnx8z+BHOlun25t2aghEjQIDSfusrHlzgDXAaiXukEtROnSK8NR44N1Ad
         CTIojCbfRaZI4aFaASHLbH9ODKH31hgw31Eosux6s556TSSvd/A6CJb2+LNVBucrVwoI
         5cXw==
X-Gm-Message-State: AOAM533QX72/6VROrGghPtVKes3lQUmb8xOz0GzuVozzQazyWECm+Faq
        LjcXnlc203QrzAjDP18Qz0E=
X-Google-Smtp-Source: ABdhPJwlK5zd3/2tfXDoXnk0V1/Zws/JTJBa90l7GW2CzrQc+l1KW2Cmpr7pbS0Fl+/Jg5dtsJwOzg==
X-Received: by 2002:ac8:68d:: with SMTP id f13mr1261683qth.300.1618611409966;
        Fri, 16 Apr 2021 15:16:49 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:14d:5c21:af45:3b27:576c:7dde:37f1])
        by smtp.gmail.com with ESMTPSA id y6sm5131166qkd.106.2021.04.16.15.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:16:49 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v7 1/6] w1: ds2438: fixed a coding style issue
Date:   Fri, 16 Apr 2021 19:17:34 -0300
Message-Id: <20210416221739.501090-2-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210416221739.501090-1-sampaio.ime@gmail.com>
References: <20210409031533.442123-1-sampaio.ime@gmail.com>
 <20210416221739.501090-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There is an if statement and, if the function goes into it, it returns. So,
the next else is not required.

Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
---
 drivers/w1/slaves/w1_ds2438.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 5cfb0ae23e91..148921fb9702 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -154,11 +154,11 @@ static int w1_ds2438_change_config_bit(struct w1_slave *sl, u8 mask, u8 value)
 
 		if ((status & mask) == value)
 			return 0;	/* already set as requested */
-		else {
-			/* changing bit */
-			status ^= mask;
-			perform_write = 1;
-		}
+
+		/* changing bit */
+		status ^= mask;
+		perform_write = 1;
+
 		break;
 	}
 
-- 
2.30.1

