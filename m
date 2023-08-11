Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24397EB64DD
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 15:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbjHKPgJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 11:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjHKPgH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 11:36:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD70E10E4;
        Fri, 11 Aug 2023 08:36:02 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so1619988b3a.0;
        Fri, 11 Aug 2023 08:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691768162; x=1692372962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5Sy+viDpwuj5RaEr5MPoCnUg4BQqcL7Em1Rlvg1jlw=;
        b=bdRE0LOuQeSup9CX34n8WjstimDPtBliWrpAOJvOoONOMHqtWJqvcCvAEINxUQc8BB
         WKFp+68Wmm+ADVVHJx0Mv2wm5BilskPRaFNhy5VcKUym3QuhvdQoGH0OddxkrLWWxdLY
         0yLRfdxCx4KHtOfACyvGGt1fTeQ6elOnUXVjC10DHVqdJ4W7iE17zIBIdyLjDjX3Hgdp
         RVdx7dRLWKIKTLo5HfiUqUrcL0tCSarmYzdLLmOYtvPMaacdsjhEMWUGRz9o8Ds/jXFE
         uTDDzS/A5sXBArjP2gVhPBgfzDCUa/rHy50sJLU0kRxTX9M0DxTHQ0Ilk0U/Pn/HiVtp
         +WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691768162; x=1692372962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5Sy+viDpwuj5RaEr5MPoCnUg4BQqcL7Em1Rlvg1jlw=;
        b=LsVpvNF3ATrimlyVFYhoUgl2mOnMf/Ve/GhpPzBHuJMZeCra+ZRIK4uGhMkWKswueh
         6/Ag+2iZl2F5VASa18jKpY+OWRon3vJl2XXi9jbkCfCXxSct0rQPUP0DL42R0weCXsCU
         bdhkiKdXTDTh9srrGYvBrnsPO1KPtX4ClUfaZfFry6H0Fdg6ucYs7ufQGWcrl2KZLXne
         34dYDgFr0DFTX8exx4UF4Rv9ydZmq7cqKyCas0qgijUxmR66GELYQ1s8J5T18hyDU0g4
         Sg3fqwYhva1N9hgnd82TiDYW2Hw3XH6hP5UC8Fh9Ohj0doeu15EfUpo6QUF90/SCShxe
         dhbw==
X-Gm-Message-State: AOJu0YwXrvK/LUoBClCGSOqH6S9KN/Edp0EAj4tYhdB1dNXvt8jOWjcJ
        2ZG0lWs3e3hUkZZ6vvqKp2w=
X-Google-Smtp-Source: AGHT+IGVwQJPZrgm4IUxTkCnTjOp6M8Jxg4xIvq0PEKKnYrGR+a/vzuRiHG067ymU3fwbpBaRzs7xg==
X-Received: by 2002:a05:6a21:33a2:b0:137:fa5:8519 with SMTP id yy34-20020a056a2133a200b001370fa58519mr2697300pzb.31.1691768162215;
        Fri, 11 Aug 2023 08:36:02 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-78-6.dynamic-ip.hinet.net. [36.228.78.6])
        by smtp.gmail.com with ESMTPSA id c15-20020aa78c0f000000b006826c9e4397sm3467602pfd.48.2023.08.11.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:36:01 -0700 (PDT)
From:   Min-Hua Chen <minhuadotchen@gmail.com>
To:     Hu Haowen <src.res@email.cn>, Jonathan Corbet <corbet@lwn.net>
Cc:     Min-Hua Chen <minhuadotchen@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] docs: sparse: move TW sparse.txt to TW dev-tools
Date:   Fri, 11 Aug 2023 23:35:53 +0800
Message-Id: <20230811153554.84571-2-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811153554.84571-1-minhuadotchen@gmail.com>
References: <20230811153554.84571-1-minhuadotchen@gmail.com>
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

