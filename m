Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F510C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 19:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbiKPTCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 14:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234366AbiKPTCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 14:02:43 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121B26069C
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:39 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id z6so11328495qtv.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUrldZBz1fysD9xfJrPkqOKAy0kR3uY/Ocf35pyumZY=;
        b=S3HDEJw3q30IRf84c2QhF6udE43xL+iJti5gA7UBOaDy7e/2gCZrHk5mhFYq2zaVio
         cCSKuIsRzhMFLEBUvSCrTfv3t2Qrkbe+OtDE3yrJkKYopjjRMtx1lvQ49bw/fKbWv435
         P7qr/lO9t3YwDnByFQJ2Dg+IqPL+tvhvV6//GAbQc3HI1OzzxPRE3xdbhzge9y2QULDW
         vcY1SPp7ZzQeO4JM96AsDEOnJIG3q9C6E31oRA5HEuO9KEN/fiv7CF8z//noTAekODlD
         Rt5Hr76CeUZyglmWXM9Wu4BAp9oXWrtjsSKU02H41mYwsxMQbocbCTmoUIFQYG/JTDI3
         8Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUrldZBz1fysD9xfJrPkqOKAy0kR3uY/Ocf35pyumZY=;
        b=rPqsf/tEx02Db6QbkCZ65hg3iMYHGh2/70Q+/iffMo2H4JLRAv7EbLyUZgGcCoVr5p
         d5mw9lei/lyA/MiHcQA25SyH0UJhbhNgjDEhpIXuI4TcarrVed5se4K2uKDirT75Fu7X
         tHcqRBxGirXfGfisOFliOaDdghQOVPdCSN7MiyehvgyP07PS2t0B8wW+C4kvWjQBsLg+
         3SBRcVe9Zf4dh/SPsXToYMh2IFvSWZRpweK//XvrMOykzpotOh4arER4O4Uljv7bHxuy
         Ni6ZCXONe9CT+6YUJB4swtchf+Q2A5RxkKFasSyjPcSsvnMiq0pZw4mkgeiWgR+E87BJ
         Idmw==
X-Gm-Message-State: ANoB5plzzbig+LgJWZ3ZGiqJ6/DlMjQ53snu/FAK1UaTTzyewYOXXLen
        SkCyXpScS9bpfrexC2K3zGajWre9KaLZ5g==
X-Google-Smtp-Source: AA0mqf7HZfrgEaR0oCTzklPcGHRpiP6+Kdzd4a4r7qtpNvqr9rLV2UPB0Ay2x+1/L7LavuScx0uSmw==
X-Received: by 2002:ac8:4418:0:b0:3a5:f916:1d35 with SMTP id j24-20020ac84418000000b003a5f9161d35mr8928284qtn.435.1668625357712;
        Wed, 16 Nov 2022 11:02:37 -0800 (PST)
Received: from localhost.localdomain (dsl-10-133-21.b2b2c.ca. [72.10.133.21])
        by smtp.gmail.com with ESMTPSA id o5-20020ac87c45000000b003a494b61e67sm9256304qtv.46.2022.11.16.11.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:02:37 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: [PATCH v2 2/2] doc: specify an 'html' build sub-directory for the htmldocs target
Date:   Wed, 16 Nov 2022 14:02:10 -0500
Message-Id: <20221116190210.28407-3-maxim.cournoyer@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
References: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Having the generated HTML documentation under its own output
sub-directory makes it easier to install, since it's clean from
.doctrees or other output formats.

Signed-off-by: Maxim Cournoyer <maxim.cournoyer@gmail.com>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index bb73dcb5ed05..bd8dac560633 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -93,7 +93,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 
 htmldocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
-	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),html,$(var)))
 
 texinfodocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
-- 
2.38.1

