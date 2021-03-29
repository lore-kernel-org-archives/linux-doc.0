Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89144C433C1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 425776195E
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhC2FQI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 01:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC2FPb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 01:15:31 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4238DC061574;
        Sun, 28 Mar 2021 22:15:31 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id y12so1440147qtx.11;
        Sun, 28 Mar 2021 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCKmEQSNsKKWGMYiyJ0t3TaBQo9I4uFo0zEUdY4DBoM=;
        b=lw5Qa9uvy64Ei9xHPLKo3pNL8/DxbyIWV7winLOPRiLxy7/l/ESWQnCneLfsZaeef8
         qrt+TNf5kXNTx+nDR0zE7Sgenyz/reS1JwBsKCtZ6Esrk5mQQdyX2O4Vzm7DUPP9M/XA
         84C+8MEzFwE3axGwqG8VRiC408BHhroglXmgN2mvrp8yo4ycRCD/5EhyVq0VY0c1aLTO
         D7m1twBaYrS8doPUTFSI6hIm5SVs6MjiKIGvtujrgWCH4rn3pPBnj32DpjpZ9MLst9Or
         JTdG2YEIeOqrb/Nsv7wh3eCTLg1reWJJd4CGDve2Wnr8WFBA0TXj54uUEm87VQTVN+JA
         dOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCKmEQSNsKKWGMYiyJ0t3TaBQo9I4uFo0zEUdY4DBoM=;
        b=N/Vt0Nt0ZbzBQ0uxDXY6FJp577WeWxcVt/Iw7LLKaxPGftC7lSSu2QW+lGRFqMFw4a
         zPhCnmu+sLZWoIGWsodYddcoyJaDUPmuAbB3QJoNruB3L8r3fXzj2y5c4pucaOnFrqYT
         qAw7ndDcSOrRVVcTis79Lx9336fQF8j5wolABXKPmPpkMcyD63GblkN6+8lTHO3GXR60
         F+kWj0GZNlQmC4iHn9o0oZwGfQ+NRmwYyfY3RkuoCjAShAKZsINBfYwr8HNQ89c8gKpk
         VxEAdTKSa+lnmkMVuyyaRqvdRHKpP0wgkF1Zx6kMC0QlS6B/i6BKh2TjJJhs1LyaCPSy
         1Iew==
X-Gm-Message-State: AOAM531zf+cC8YaU8tQ1imKBR0bv6yvoijZs0vpPZ4tuNWBZh3giYWC7
        9GiqCabWrHFQNFonfMQQ0c3uDjYxuFLa8w==
X-Google-Smtp-Source: ABdhPJzc4yUPjUL0QPTlgZx7nDVCFrT1fvgGhitIoKi1UHhjq4IybIxEYKqs0ul/nGhYf1ZwyvjX8Q==
X-Received: by 2002:ac8:134b:: with SMTP id f11mr20657595qtj.184.1616994930564;
        Sun, 28 Mar 2021 22:15:30 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.195])
        by smtp.gmail.com with ESMTPSA id z124sm12993181qke.36.2021.03.28.22.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:15:30 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/23] w1: ds2482.rst: A typo fix
Date:   Mon, 29 Mar 2021 10:42:38 +0530
Message-Id: <0b38f9398163d267f8f008fdad4e95b82445f485.1616992679.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616992679.git.unixbhaskar@gmail.com>
References: <cover.1616992679.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s/busses/buses/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/w1/masters/ds2482.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/w1/masters/ds2482.rst b/Documentation/w1/masters/ds2482.rst
index 17ebe8f660cd..5862024e4b15 100644
--- a/Documentation/w1/masters/ds2482.rst
+++ b/Documentation/w1/masters/ds2482.rst
@@ -22,7 +22,7 @@ Description
 -----------

 The Maxim/Dallas Semiconductor DS2482 is a I2C device that provides
-one (DS2482-100) or eight (DS2482-800) 1-wire busses.
+one (DS2482-100) or eight (DS2482-800) 1-wire buses.


 General Remarks
--
2.26.3

