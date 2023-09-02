Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB5CCA0FF6
	for <linux-doc@archiver.kernel.org>; Sat,  2 Sep 2023 05:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351549AbjIBFZ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Sep 2023 01:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351542AbjIBFZZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Sep 2023 01:25:25 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E364FE5C;
        Fri,  1 Sep 2023 22:25:21 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3aa1443858eso490619b6e.3;
        Fri, 01 Sep 2023 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693632321; x=1694237121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DmxFHXC1C0iktfuyQUeeT9djuPKgjaBZaXtzx74Xe4=;
        b=jhDcm9csM0bI2DVto0B1T7uXhkc1qLcMwRBn7jjt/2sMHVuBfEIo4+rQSBEVJ5x6PZ
         viogqpTZV+u0IWKY6Z013P+XNxhMlzmVILnq/sDSfykpUstclDy1Uk71ZwlBThTMP5RC
         OMujDWPm/PXF4IIewe225gLTdAv/S8FL/j6rKA0YU0Ns4hKfyCTrwiWYHHFW48a/LbbG
         QOggKHMLTuH1xqamGWtyy3yYOkdw9eoiB3hGavxjUx/sd8p4XeVx+HHiX2p6qEW3Dp/x
         ctZMZUA1plKEgEoFQcJCf3Rk5xdIMzOVYxiLPhlfOXua2TZXyLWovV7fRtQiNvSIA1zf
         bQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693632321; x=1694237121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DmxFHXC1C0iktfuyQUeeT9djuPKgjaBZaXtzx74Xe4=;
        b=cNtbM2Tw6zetqdHWKDiU2X9T8lC4ckFtZhE6FuH9Zd7E9nDDfya6SUL9iyhW4T5xTw
         9eHOJpiACutrDOzaDSiDlFIsCrHAF/RvYEyH7BNA5oKnqEuxNKgwohRGELdqh9olehCQ
         jfrqmAxPdepRUiSTmFWjJkDdWaJx762GMz//tQKslbiodDswohwtDBBWqqJFx3230Uo9
         g9gQha/q12frlQfM86QKEIjRe4plb+yr2P/P+LAZobUIaqnyY10s+ZS8Am5oPeZnnC6Q
         qdD8czNMsuz5NVEVo2kyLoDIWlxrlasXrfE9vcZtGTT/XakJYQi6BXtWDrv5PwRPMXtw
         HRvA==
X-Gm-Message-State: AOJu0YzlPtNy2E55O7Oly/tu/ermUqyvm2YFBv32MNWX0qfFiuXRvj1g
        dn6w/xRha0UKu6Rqr6MnbFw=
X-Google-Smtp-Source: AGHT+IHWTTeM0lsTEeo1B05XSjBnVrrmlqAoY/4lPQyGtBFHffRK1guu58/1bwszq3WkS6k/Ni4nfA==
X-Received: by 2002:a05:6808:d51:b0:3a8:4dfd:4f0b with SMTP id w17-20020a0568080d5100b003a84dfd4f0bmr6126382oik.19.1693632321242;
        Fri, 01 Sep 2023 22:25:21 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-78-250.dynamic-ip.hinet.net. [36.228.78.250])
        by smtp.gmail.com with ESMTPSA id b15-20020a63714f000000b0056c24c2e23dsm3708320pgn.25.2023.09.01.22.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 22:25:20 -0700 (PDT)
From:   Min-Hua Chen <minhuadotchen@gmail.com>
To:     Hu Haowen <src.res@email.cn>, Jonathan Corbet <corbet@lwn.net>,
        Hu Haowen <src.res.211@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [PATCH v3 1/3] docs: sparse: move TW sparse.txt to TW dev-tools
Date:   Sat,  2 Sep 2023 13:25:10 +0800
Message-Id: <20230902052512.12184-2-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230902052512.12184-1-minhuadotchen@gmail.com>
References: <20230902052512.12184-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Follow Randy's advice [1] to move
Documentation/translations/zh_TW/sparse.txt
to
Documentation/translations/zh_TW/dev-tools/sparse.txt

[1] https://lore.kernel.org/lkml/bfab7c5b-e4d3-d8d9-afab-f43c0cdf26cf@infradead.org/

Cc: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 Documentation/translations/zh_TW/{ => dev-tools}/sparse.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/translations/zh_TW/{ => dev-tools}/sparse.txt (100%)

diff --git a/Documentation/translations/zh_TW/sparse.txt b/Documentation/translations/zh_TW/dev-tools/sparse.txt
similarity index 100%
rename from Documentation/translations/zh_TW/sparse.txt
rename to Documentation/translations/zh_TW/dev-tools/sparse.txt
-- 
2.34.1

