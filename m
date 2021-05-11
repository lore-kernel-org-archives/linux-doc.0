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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D35C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 13:51:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD492610F8
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 13:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhEKNwR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 09:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhEKNwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 09:52:16 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48093C061574;
        Tue, 11 May 2021 06:51:09 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p4so16168903pfo.3;
        Tue, 11 May 2021 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LGbrTnG017iKJQPX5tTGAJAGa5rEnsm9gxB0y9eldqM=;
        b=GKK0tRzTrRY+0cxV01p3/Y6xFH5FqJwCY/kmncFOTcxvCj9Q3vch08BoLxPCiEHFwh
         f6Wm+3kP2xwVGZgDzhi4JuGEKU+CSJ4HUDzr+HG0LJAqHaIwzyodH+/+UKIt+SYumYzf
         ID8hryk2MLTTj4o7O9zYaLjuB2HlspUeo148D9SvyGIOvzOHJHgnQGChwBUGt0/56+iH
         blsLXsgHlUpbzv6YFcN6qzyAZS3Qbuag0cyljT68pkRXSm9BBj5y6rR3Bha75eL2ItgK
         8rRUPu4evkGxVeCw56x+sHiv2OIBrUs1tMm1VZ9sZPp4K8vuMM6VqsFW/FIiTgDnLOK6
         UkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LGbrTnG017iKJQPX5tTGAJAGa5rEnsm9gxB0y9eldqM=;
        b=qUCTXC2dGWSo+E11cTdnglu5x7UNIY+zW439/uBxD2vaqUtMiD/6BzLQz+0p9xH4ZK
         1CUz+Q3eAIAzVqjD6COlCBqAaJQ8ElDDmEJIGsYkoEu5XFgzF08KTVO5FlLbnnMjd8cS
         HBXSadumGPWoFUSWlHNbE49UufzbB5fqj5rjoPs4hLu62DJIkjOOxHfu/UJ6GGjPu4mu
         GTxFFpVKYYLbiNsgcmcKW79/d6mmMnWx+odmch//MzSxZHOq7vdI8R5MSJz2XetN+1/b
         O7EHMreJuiep37eOi2BbP8PRdQ3KfwtH9uNQl8QqZfDLm2RiYYjeH4quyzqROt9xV0dt
         CVAQ==
X-Gm-Message-State: AOAM530vvrmzmQQXEOBhzV9+uF3J0ShY9GWtPDomNhfmwrAHmqfbvu5n
        xg9LPZE4LywbyrSMuRFMoxROVjBSqaF4Za5HaB10Ag==
X-Google-Smtp-Source: ABdhPJxVtfjS4c7o+1/HaB7uOPcnPB1skyETDuUD7JjscREPsT9p/mlclzeYpixqjxMEzSD5Jzu9TA==
X-Received: by 2002:a62:92d7:0:b029:2c7:faf1:b1bd with SMTP id o206-20020a6292d70000b02902c7faf1b1bdmr5150327pfd.41.1620741068797;
        Tue, 11 May 2021 06:51:08 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id a7sm7035607pfg.76.2021.05.11.06.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 06:51:08 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     gregkh@linuxfoundation.org, jirislaby@kernel.org, corbet@lwn.net
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Remove link to nonexistent rocket driver docs
Date:   Tue, 11 May 2021 09:49:37 -0400
Message-Id: <20210511134937.2442291-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixes: 3b00b6af7a5b ("tty: rocket, remove the driver")
The rocket driver and documentation were removed in this commit, but
the corresponding entry in index.rst was not removed.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 Documentation/driver-api/serial/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/serial/index.rst b/Documentation/driver-api/serial/index.rst
index 21351b8c95a4..8f7d7af3b90b 100644
--- a/Documentation/driver-api/serial/index.rst
+++ b/Documentation/driver-api/serial/index.rst
@@ -19,7 +19,6 @@ Serial drivers
 
     moxa-smartio
     n_gsm
-    rocket
     serial-iso7816
     serial-rs485
 
-- 
2.25.1

