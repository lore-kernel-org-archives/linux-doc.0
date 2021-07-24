Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D18C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 921D260E95
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbhGXVJI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:09:08 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:58592
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229949AbhGXVJH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:09:07 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4C36D3F245
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163378;
        bh=lqncaONSiNw90ZsWSl9AH9IIEf03wH8Ti3Z9kPsi5zE=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=HRA3Gnoa+RlPT5s4iYQ0//vnLXwsCMTAgsCwe0RJAtpRR3Kbeu32owHXgc+aEZfAA
         WWHBL8dUverPoyPV/3Ru/Ym0PIwH2byzNfSJYPEXdH2IcS16JmKflArQhYSWIEbjU9
         tRSYyvirb03zhiAGBruCJHi9ioPjnOKEUumEy67XuZhtEQRB1iBl8TPNLhM9TSpmq8
         li7tABDEEPPtSUBnGlVmO8SAc0P/WXLcbygnvZsXBSwDJWUurOSx9ofJBE0aGCswv9
         F0A2x8CMU0R/oD0vbc27/fsaxf0AAMVHYa1RXR6XGpUbsdm2tRGUOjeff9gNLg0hJD
         YnDePwXSSJNIQ==
Received: by mail-ed1-f72.google.com with SMTP id f24-20020a0564021618b02903954c05c938so2814608edv.3
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqncaONSiNw90ZsWSl9AH9IIEf03wH8Ti3Z9kPsi5zE=;
        b=ZJIkLntjT+khYzEp+KHkPX/f/504w8w/59tl1UUjIKQJv9HSFj50yGYtLOFz0ATa8a
         V1NFmrQZ2RAVB7k0DzgrIWP7uJu6K7IOsC+Ri9v7g+TkrzJeVIjoTZfB76EI5QPeL8rS
         VNZ5E709YqJZuAGk+3yaUsiwrewqOIGmZ/COJMnxsSGV9QPx2Wek3tHcTcKEqEwlu1G/
         B0QgasOwumf1cDqTHTjl9+0gyPw6sfOSLoFYl1XFmGkSlR24UpZyQIQRtv57UBThesfN
         5qBC+bq5OlSHSIOwEwcwqc/K/jagCEfBim77pNL7wPNrurDffJiHyfsYvSOFL9pKNDHQ
         Qa5g==
X-Gm-Message-State: AOAM531U18F1OQa+J7EYNrBM6eeQHDuEqzydDishoUaZhmRs2UvDl81l
        vOdpO2MN9jYZkt77MwgNf225v53ok3Y121I7QW+wwMFZu9Uk+o9Pdpl/E4hmu/Xv8YpJdbeJDED
        0U+E7SOkVzBS1FW1YV0vLlYEeywMJGXAdPEvONQ==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr12994081edj.168.1627163378106;
        Sat, 24 Jul 2021 14:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs2MCWxVY/iIgBmUT84/VHcn/wv31k1R7oXnENH/7sKHYpMW13rHzV1X6lKvVGgvVFlM+aqQ==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr12994078edj.168.1627163378020;
        Sat, 24 Jul 2021 14:49:38 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id s10sm12821908ejc.39.2021.07.24.14.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:49:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Gorand <charles.gorand@effinnov.com>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Bongsu Jeon <bongsu.jeon@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH 06/12] nfc: st21nfca: constify file-scope arrays
Date:   Sat, 24 Jul 2021 23:49:22 +0200
Message-Id: <20210724214928.122096-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Driver only reads len_seq and wait_tab variables.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st21nfca/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 9dc9693a7356..1b44a37a71aa 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -76,8 +76,8 @@ struct st21nfca_i2c_phy {
 	struct mutex phy_lock;
 };
 
-static u8 len_seq[] = { 16, 24, 12, 29 };
-static u16 wait_tab[] = { 2, 3, 5, 15, 20, 40};
+static const u8 len_seq[] = { 16, 24, 12, 29 };
+static const u16 wait_tab[] = { 2, 3, 5, 15, 20, 40};
 
 #define I2C_DUMP_SKB(info, skb)					\
 do {								\
-- 
2.27.0

