Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C78C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 01:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF12E2388B
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 01:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgLHBr0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 20:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLHBrZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 20:47:25 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6416C061749
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 17:46:39 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id f9so11716992pfc.11
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cDDiT2/fbCtDgoUoiOoWGl7ZXPm3o9da6nFh8mXI6bY=;
        b=PUZrOtrULhDFxgf/Y28n4N01fRcozJWagyTMVZxEqYBy6F9YQvovkNr7qLjVAbeGRn
         jbAT2Zt9Jt88adx1jIHALxH6yq0EJOldqFdbecfjqxE3tuVlDmaDokj7TBDFDK47zvh8
         ECYcfYPG0mrhb+4kg7zynDhOSKTh2MvVxZMAWNi52emFwYz7WCyyJRDqMUDb15/TCRlS
         l4Z4g2GHnc9cHYpctC0vNc5zAE5EKyzER0yAMtOUzckKF8/ec4HDxOyYN7yRzjuvhpQz
         IwUwzG2ahTV20cjYnyOwi3obLcDe/uXv7i6MT+Mu/KLpzJFcuO43yWerBjNiJOu0FMKF
         p+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cDDiT2/fbCtDgoUoiOoWGl7ZXPm3o9da6nFh8mXI6bY=;
        b=NbU9G/uiGJteEfr1Hz350fpCCt2btYNerr1ovzfIah4AtdoGcR/BHYl4bvSpQ8/qQ6
         gOfsFWIFEs3j1dQYMPZYnlNxbW9q6k365r5GqDTjmJ+4SGqjUpliD0ZWr4geEPtL36dK
         fkkFMW4zOfAhggKa8LdGL2Otcw6QlgBeSagFidGXHZkxZSdIZ1PgcYoYqn0hHxLH4Rm2
         XCemoRkTkzmOFcPs67Z8HD+Zige5gG5Efj6uUdSnNCWxjTo9vtV0ay19nLhsLMeLNI+7
         Ypo7xMma1gRxer6G4nJhDXRV6JCb64fNlC940Ptm2YVtI6iTVTPHAEdJrQW/R6GagHU+
         EFYw==
X-Gm-Message-State: AOAM532B/vutpUDR2NgCN7R+NQ9E7RvAqfOgB3HJtol4g0ykpIpSUHcm
        tqMDHHVZvr/I4xB+Olyd4Q==
X-Google-Smtp-Source: ABdhPJwyu10Sstr3Ppz2XCkDNjW+ODffjC0WiND0bSWei0fMsmqvqJeRS5L6lwbkwSSAL1vk++69lg==
X-Received: by 2002:a17:90a:db48:: with SMTP id u8mr1642744pjx.81.1607391999221;
        Mon, 07 Dec 2020 17:46:39 -0800 (PST)
Received: from JSYoo5B-Base.localdomain ([1.237.110.143])
        by smtp.gmail.com with ESMTPSA id x10sm14489096pff.214.2020.12.07.17.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 17:46:38 -0800 (PST)
From:   JaeSang Yoo <js.yoo.5b@gmail.com>
X-Google-Original-From: JaeSang Yoo <jsyoo5b@gmail.com>
Date:   Tue, 8 Dec 2020 10:46:28 +0900
To:     corbet@lwn.net, jsyoo5b@gmail.com, mchehab+huawei@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.org,
        markus.heiser@darmarit.de
Subject: [PATCH] docs: update requirements to install six module
Message-ID: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On the update of Sphinx version to 2.4.4, the "six" library won't be
installed automatically. (which is required by kfigure.py)

Main reason of this issue were occurred by the requirements changed from
the sphinx library. In Sphinx v1.7.9, six was listed on the
install_requires, but it has been removed since 2.x

The kfigure.py uses six library explicitly, adding six to
requirements.txt seems reasonable

Signed-off-by: JaeSang Yoo <jsyoo5b@gmail.com>
---
 Documentation/sphinx/requirements.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sphinx/requirements.txt b/Documentation/sphinx/requirements.txt
index 489f6626de67..5030d346d23b 100644
--- a/Documentation/sphinx/requirements.txt
+++ b/Documentation/sphinx/requirements.txt
@@ -1,3 +1,4 @@
 docutils
 Sphinx==2.4.4
 sphinx_rtd_theme
+six
-- 
2.25.1

