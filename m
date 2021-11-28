Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D65C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 28 Nov 2021 17:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358652AbhK1RZI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 12:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347577AbhK1RXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 12:23:07 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA21C0613FC
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 09:17:48 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l16so31397563wrp.11
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 09:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkHRXqEQtQ+qcD1vnPAznM2HrwKJkhnoJzM/vvoO3xs=;
        b=Vook3QADbLqzrl7Ku2XEEXJuqViRTzWc2gbhzEIlvVd8RLXLR1IEq9jQ8pYF6/FQU4
         owmQsOSJb2dxl7u+D4oJubM/52L10XlL59bS0tqAUf+4YRq3lwEC9Io5J3XFns8MyG89
         JNM08lMbPxWqYNzKvdKL0DYwux3GG1twrDO7CfO4aERG9IbmsWL04dR3jM/3+MlwVf3b
         JyGwfH7h00z8AMA8p4EdlNRHj0Ajj1qKclU5doLG9zeJLtMkAsZWSXd3uVBCiaYjiJem
         jiQBdTw9NnPAflw8fWG256+hlwZoeD/mLp6MHbE28V2XoyFIV0eF0EBtRTBGyZRjpHPZ
         HWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkHRXqEQtQ+qcD1vnPAznM2HrwKJkhnoJzM/vvoO3xs=;
        b=nHl8udXM6P+uImD+yX23fysVnodANu+qi9qoXEyrA7F+CFm6sIzkM88O7uTo3fLH6w
         yIkDP2aB61ajgFH81+P56Hhf7ZzSkqSVf7L4WpHi1cfWSHZTdJy14HqV8jQXxpIAgOkp
         ZUtmIK4PtvkFS2buqIpD8WepPMO/xK563/s4e/DdzM7UgO4BCzp6OiJYdrvXEZ3C0364
         XnCDsR2DsqBNOB2FO0fmlpsR03JRD0Zkoqsx5slRBek3Kec+G+gVrjeITedQAzqsz6SY
         HF22id+9LjuhZqMhRlknfiaYqAODM/CBG2LsLcEbydTFI1sY15pMTDWo/frwhyvy3hi4
         RFtA==
X-Gm-Message-State: AOAM5334wt3FHC+p8y3lqaMRvqH67w4U0zlfQrHzWGRSNpQrsBxbhwDY
        MYbv3QJEYHInTKwxga4CjCkflHrPcfepDA==
X-Google-Smtp-Source: ABdhPJyOoiFa20mUEt50Ltth8ziTZXsNX07ZMqZ/3YCTTQdeZUvt3xVbXHlBXNB4Ghd9lAPMlyh1ng==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr28284600wrq.254.1638119866952;
        Sun, 28 Nov 2021 09:17:46 -0800 (PST)
Received: from localhost.localdomain ([154.177.194.243])
        by smtp.gmail.com with ESMTPSA id n32sm21814404wms.1.2021.11.28.09.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:17:46 -0800 (PST)
From:   Ahmed Zaki <anzaki@gmail.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     Ahmed Zaki <anzaki@gmail.com>
Subject: [PATCH] Doc: networking: Fix the title's Sphinx overline in rds.rst
Date:   Sun, 28 Nov 2021 10:17:19 -0700
Message-Id: <20211128171719.3286255-1-anzaki@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A missing "=" caused the title and sections to not show up properly in
the htmldocs.

Signed-off-by: Ahmed Zaki <anzaki@gmail.com>
---
 Documentation/networking/rds.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/rds.rst b/Documentation/networking/rds.rst
index 44936c27ab3a..498395f5fbcb 100644
--- a/Documentation/networking/rds.rst
+++ b/Documentation/networking/rds.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-==
+===
 RDS
 ===
 
-- 
2.25.1

