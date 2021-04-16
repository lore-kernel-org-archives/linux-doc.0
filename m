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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D966C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CD04611AF
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236360AbhDPWR2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 18:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236363AbhDPWRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 18:17:24 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C626C061756;
        Fri, 16 Apr 2021 15:16:57 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id 1so21955808qtb.0;
        Fri, 16 Apr 2021 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uWqRWnPsyW3TcsJv1mZN6YIc5vXGyGLKWqi4ODbi9k=;
        b=flDP6xjpVwX4UOEJB5U/F0Gx/Rc/M6Mqp/8nmFG98AAQAyqrngb/+0u/8G0N06uGHF
         RImB97CqW9oaZVESyozP+Ifd+LFyRrQwAGNwFPFdaDvZWBZhVNncVg4eE821JCrOdRpj
         NCwYj1YHpagZN106L95eUHcoBQ22NYjQsBoNNXi+rwJqBWLEicloGjTE59hrlneJkn2G
         mp6koWADDNFl1SjeXpJ0y3DcsVnnrWkG2OyvrU2/tRmMf4FIivVbsJisMGl46EAMljNT
         oaANmoh27uBfbhPeZ4KmPs9z2eMNNJkCzN9+XUr+AsWQB4ZLr1+QtFx8ICNPAdsscGKS
         Yeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uWqRWnPsyW3TcsJv1mZN6YIc5vXGyGLKWqi4ODbi9k=;
        b=dp9DTIdkjkREJVGI5ccEwwj9lU4vTpLtgRZ/TMw//DOJMzxL39PCX9adk4vSd7Hfq3
         7GVrFdvWCudW8oi0ogSujz9k3jRFBIZOGy58bfXk8r8CzJkrzKtfAh9HwCEoR+JdRz+d
         ARIUpnBgoa7inzLDV1mmzyGj1gij8m3SZAqaDY/Zl4HjB8JW4Wao2BUQxgcKU8/Peq3r
         VTg4Q5vWGaBH1dHg1NMuBNS9p90rPWNpwjqDM914BcyzmrvoTRqdvxyCDyqiC78EFhgV
         vT5/VDXypZCW8vWRrrOak6A2ivaJgvKlReU5v7wvNXsOEm6j9jyyYcOfBGusXK1alrVq
         w3VQ==
X-Gm-Message-State: AOAM5313WmaO+eBIDUC7Kwwy3ObsLGsJ7mg+UZZt5VCzHKjPy+mOkHM6
        NCx0EfhZIeUSAl41K3YjJOo=
X-Google-Smtp-Source: ABdhPJzE8XHkQY7twa4J2ZDnVjTRI30sEPGPQM2hhZxnNI5a/lCVZu6BF4dSl2AzjfHaz/5KofteKQ==
X-Received: by 2002:a05:622a:15c7:: with SMTP id d7mr1302060qty.160.1618611417158;
        Fri, 16 Apr 2021 15:16:57 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:14d:5c21:af45:3b27:576c:7dde:37f1])
        by smtp.gmail.com with ESMTPSA id y6sm5131166qkd.106.2021.04.16.15.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:16:56 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v7 4/6] w1: ds2438: fixing bug that would always get page0
Date:   Fri, 16 Apr 2021 19:17:37 -0300
Message-Id: <20210416221739.501090-5-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210416221739.501090-1-sampaio.ime@gmail.com>
References: <20210409031533.442123-1-sampaio.ime@gmail.com>
 <20210416221739.501090-1-sampaio.ime@gmail.com>
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

