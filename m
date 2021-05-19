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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05CC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 22:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E6B3613AA
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 22:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhESWbK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 18:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhESWbI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 18:31:08 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA100C061574;
        Wed, 19 May 2021 15:29:46 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 5so7713572qvk.0;
        Wed, 19 May 2021 15:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uWqRWnPsyW3TcsJv1mZN6YIc5vXGyGLKWqi4ODbi9k=;
        b=dwYhpaSRg8v7N4qwTBjHBoQYbMbNuAXTce/dITMXS864nswEV0vtqCS+wbLoxNb+je
         TLtWpjTxsUuGfEnkygDq9qvxQKrYflw7nThpVZLjL7upnfLQrsHTifF0ft9Oy6Y20fIu
         IvNoosCbrKwOuGywuite0BMnjVRr482BFRNaBohKAhHRZ/a3/IUtbgah92eGWaLDod5s
         WldcXn8UPwgfFJB8fPpH611c5Pg++PjNU7SKHySFsihNp5Pm4PEO3tZK8I2ODM0UGdhd
         DvQG3RLAkOKa1XuDxRkuVo5onvJi/2NxcMvYs2xHqXvzkCkFKaHnUGPznThd2y5deapV
         OKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uWqRWnPsyW3TcsJv1mZN6YIc5vXGyGLKWqi4ODbi9k=;
        b=Th25cDYwDDRpFDBfTydXholsjfloaKPXju70sckkdiAVCngTnlkxfn72I3X1YtO0ik
         nSNMc0d/VhEeAJIwdxHxArpBPIxUeG28Cd4xN9LR+HVnAmJ1TjFk/rKZkKNuecmJ62G2
         no3n7CMWPDYu3qJnRG9d3n4wnNYPt9szjNxR8XjF8NZR4330Rwisr0rFyhwbe6jThxxm
         X9nDzqgKWEb5se2xES4dynS0UNMMbMc7YvWEamZUGZiJvjJcPBzVBMMWczyKaIZf1m4y
         +6dPkRvPV/xSU8djnjjmByoywGcI82QG4PU3yKLdqVE+bOPR13m70PO1Xvcs7DnKkMRu
         EPDA==
X-Gm-Message-State: AOAM530xycDTLqALMQ3PaN8g/P7z1NousS11jIhfz1m3lcL3MFfS54A9
        OZYhXAbOYTCCWUaxRnfJ09s=
X-Google-Smtp-Source: ABdhPJxk4/+9yGa9axerXc5i76E31bRjdzkDe3+pXWTgINNcWGGNZMBCaokjDSSIfSiMqJdh/MxRwQ==
X-Received: by 2002:a05:6214:702:: with SMTP id b2mr914571qvz.43.1621463386215;
        Wed, 19 May 2021 15:29:46 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:214:8175:da27:c352:bf96:2102:fa64])
        by smtp.gmail.com with ESMTPSA id d18sm823716qkc.28.2021.05.19.15.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 15:29:46 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v8 4/6] w1: ds2438: fixing bug that would always get page0
Date:   Wed, 19 May 2021 19:30:44 -0300
Message-Id: <20210519223046.13798-5-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210519223046.13798-1-sampaio.ime@gmail.com>
References: <20210409031533.442123-1-sampaio.ime@gmail.com>
 <20210519223046.13798-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The purpose of the w1_ds2438_get_page function is to get the register
values at the page passed as the pageno parameter. However, the page0 was
hardcoded, such that the function always returned the page0 contents. Fixed
so that the function can retrieve any page.

Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
---
 drivers/w1/slaves/w1_ds2438.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 910e25163898..1e95f3a256c7 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -62,13 +62,13 @@ static int w1_ds2438_get_page(struct w1_slave *sl, int pageno, u8 *buf)
 		if (w1_reset_select_slave(sl))
 			continue;
 		w1_buf[0] = W1_DS2438_RECALL_MEMORY;
-		w1_buf[1] = 0x00;
+		w1_buf[1] = (u8)pageno;
 		w1_write_block(sl->master, w1_buf, 2);
 
 		if (w1_reset_select_slave(sl))
 			continue;
 		w1_buf[0] = W1_DS2438_READ_SCRATCH;
-		w1_buf[1] = 0x00;
+		w1_buf[1] = (u8)pageno;
 		w1_write_block(sl->master, w1_buf, 2);
 
 		count = w1_read_block(sl->master, buf, DS2438_PAGE_SIZE + 1);
-- 
2.30.1

