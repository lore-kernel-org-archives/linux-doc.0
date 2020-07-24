Return-Path: <SRS0=Lhqp=BD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BF7C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D77CC206C1
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jul 2020 13:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcR0seyz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGXNar (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jul 2020 09:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXNar (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jul 2020 09:30:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1504AC0619D3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 06:30:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x9so4436744plr.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2020 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uv1DUHSuJ+u1CvXAO8BUMDn6svIUPcaq/RzGlbb40CE=;
        b=EcR0seyz1oO4WiNrVNtPk9p8cmuMfrOkocTP1pu5X/mlsvGq6p5xgTFPta03KDJfAw
         htdpi1pUGnYLNWjTqIdG8Aamlg30TkbfexR7+wAmlgBUC/U5/pO62xgrvNtOqcniLbWU
         zhf8zoAxisW60ZmU2vF87SLdJUb34lb4eaLDypsh4LWwCp1d25AkK2amEET7dGgvCG0Q
         yeMr9vuJZGMNezaU9PJTY5mZMF1g/DbJZGhtuWLnUg5VLg3HphJqUNAzIl1um+UJlwLN
         E0VwhSJrUB2kVoLI3y1qDC30srJfXoGY2tN5/YHhvMQxeCzpmm6JpNpEPuEcc0X68Ijm
         /Lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uv1DUHSuJ+u1CvXAO8BUMDn6svIUPcaq/RzGlbb40CE=;
        b=Y0BAQOzakXW6dcj0arbJIzZ+KBIV0B3HnaFX54PnkGo+uwkqDmt4y7xgXm86PtdW66
         sjYok/Rh+k8FlS0+UUjQ0eOcQsRDtvloOuXSCRp2RXPUlJ1Tiuf2cUPUpGxSJADTfUSt
         LLbbQXknAB7+6vnf/N8WvhM940FHJmHqtSphvmkhJDEdYP7hjTxfGnDiXED/lrxEg1Bq
         Wd+MTBAhAMVoWPuGfdgkIyPJeHbpSfRw/W6BHH/sEjuLJ402MAfdiOI3iwNUmop3kRHM
         e5e4760x+o8pmc0tNHLZwZgZ+0j/E+QiiRUALoqZaQZs+rvmBaH/DDpKrEWJE6AKZNjb
         W5aQ==
X-Gm-Message-State: AOAM531f78m30rH8dR/H1iWW/KSkeU4SY6rXFfOnAgHzPtY21sVeN3X+
        9y/JjOSnIkWkUYJxzZcodIM=
X-Google-Smtp-Source: ABdhPJypaESra7NEST6KE5i9yBAd7d49ZZK9EHShAKM61BK3O1KpAOdC5IWpNgWlujAbaDEDVCgaHg==
X-Received: by 2002:a17:902:aa84:: with SMTP id d4mr8091131plr.208.1595597445650;
        Fri, 24 Jul 2020 06:30:45 -0700 (PDT)
Received: from localhost.localdomain ([185.212.170.182])
        by smtp.gmail.com with ESMTPSA id 198sm6488036pfb.27.2020.07.24.06.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 06:30:44 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     mchehab@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] docs/admin-guide:binfmt-misc:duplicate apostrophe
Date:   Fri, 24 Jul 2020 18:54:02 +0530
Message-Id: <20200724132400.26808-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/admin-guide/binfmt-misc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 7a864131e5ea..0f5f82236853 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -83,7 +83,7 @@ Here is what the fields mean:
       ``F`` - fix binary
             The usual behaviour of binfmt_misc is to spawn the
 	    binary lazily when the misc format file is invoked.  However,
-	    this doesn``t work very well in the face of mount namespaces and
+	    this doesn`t work very well in the face of mount namespaces and
 	    changeroots, so the ``F`` mode opens the binary as soon as the
 	    emulation is installed and uses the opened image to spawn the
 	    emulator, meaning it is always available once installed,
-- 
2.26.2

