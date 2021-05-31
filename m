Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A71C47083
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 14:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6262C613C1
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 14:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhEaOWe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 10:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbhEaORf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 10:17:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF3CC061347
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 06:42:46 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id z26so5049403pfj.5
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXH51W1Ix3Bhx2ZHzM7vpDgXhk2IvqzWQ3xGcMdutpE=;
        b=EQvVzBSaj+89LR2aJ422SXnwPm+iWVMzVQ1sW4MSqDtXuBYMEXHMYZ1R3UPiCeiytS
         08FFucrBKJvWjMvBthT5aqmVjSC2RzaDgKWqM7Lkvpluoc7j3Mw35NmegWt6AWVnRaDH
         SZmxW4pS3m9TTY1Z/Ci0FI4D8Lo3yZOJ9hgIZpZSyaEp3tambM8e+tD881Lz6RmSrP/y
         k2Bmb0uKn9WhmC55WUJFDt0rn58Tl4PUYnyGER26IYk0Hk+KkiVJVJnyiWyoU8+Ezfn6
         Ms0Qm4HK7+f3KAqOKJPE1q0gVFdBo0T2Z2ePp2kBUUpvIKVyxTAmOYSGnMCKY9C2IZwW
         PKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JXH51W1Ix3Bhx2ZHzM7vpDgXhk2IvqzWQ3xGcMdutpE=;
        b=HeqkxArOi4XNJZeY3bGZphXrG7zeiRbx4C8eScOWxh7JXEkP+RscYN469KX52L9a+S
         RHNFpYHT/zyWtyj0mYM6lOOwOJ0Vav5OlfQM+Cph2hfJbEjrb52HizHNhtZQwcfdGcmE
         Hd+oqxFUZjHju7+Jc/fi1MHhAMwXN/2dbK9TB9KbhxQuCA36Foc7nkm9HjDrJtNj2leg
         558sacpaSa5cGiB1N6agDv0Neb4CoSLXCvMluKX/QDzANMnG9OfzxkWpQwORJgskfRyV
         WK9MhsHP0CZUkDcBe2xJQL2qVt/b3Cgg81DsEVwb+VcvheAMB6BZi3Nj03Ogts/DjkUe
         nzxg==
X-Gm-Message-State: AOAM5336pox3gh4bF6bvY9c9ny3OoC4mfmYhFQ0hDfOFYeoEG3MKS79V
        mlXl4Dfhh7zgGObhAQNYYxNI
X-Google-Smtp-Source: ABdhPJz9Y3LZ2nejC+u23ZMDk5NTDzjSBATptAYUVyWxSbtSiOCv41jzhIVjHZPyH0THy9Vnxi2D5g==
X-Received: by 2002:a65:58cf:: with SMTP id e15mr18964984pgu.269.1622468566127;
        Mon, 31 May 2021 06:42:46 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id x190sm6738618pgd.41.2021.05.31.06.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:42:45 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew@lunn.ch>
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] docs: Fix typo in Documentation/arm/marvell.rst
Date:   Mon, 31 May 2021 22:42:35 +0900
Message-Id: <20210531134235.720351-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix typo in the documentation, changed from 'comatible' to
'compatible.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 Documentation/arm/marvell.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm/marvell.rst b/Documentation/arm/marvell.rst
index c50be711ec728d..db2246493d1827 100644
--- a/Documentation/arm/marvell.rst
+++ b/Documentation/arm/marvell.rst
@@ -259,7 +259,7 @@ Storage family
 	https://web.archive.org/web/20191129073953/http://www.marvell.com/storage/armada-sp/
 
   Core:
-	Sheeva ARMv7 comatible Quad-core PJ4C
+	Sheeva ARMv7 compatible Quad-core PJ4C
 
   (not supported in upstream Linux kernel)
 
-- 
2.30.0

