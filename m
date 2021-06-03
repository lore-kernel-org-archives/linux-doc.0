Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34310C4708F
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 01:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05A51613DC
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 01:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCB3x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Jun 2021 21:29:53 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:42786 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFCB3w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jun 2021 21:29:52 -0400
Received: by mail-oo1-f51.google.com with SMTP id v13-20020a4ac00d0000b029020b43b918eeso1021438oop.9
        for <linux-doc@vger.kernel.org>; Wed, 02 Jun 2021 18:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S2SAJkmDlFiv1zDdSq3eVzdZaZuHtIDXtQgqfR5tDxI=;
        b=Y/TC2hmDe+GVvYMdciUA0R7BSIU0WrWicNv2pevZnCaqzBIFwC4fhnc5gYMKxSXhnl
         A9oNYvSv+LZNUfswddOLsMvJMjMYlfnYnZmrMEkGhEWNKByS4Ged6el65r5i4mLogLYo
         uc95bFUoC3m79DmSs7IyHhwpNg8cpd0GGTNt/bBZcGopo2LXvfGnWjeqOOq0zLh6NPV5
         zE1GGbNgymvAmDCq6ZAk2a5rzgcTf1bF6RkUpC7NNbnaaoTRa2bRAcJMlCS/pmV0CSxo
         gjCvy0eZ2KascfNW44xZUkjMfQQOYO6e6hVtL+taZy6y7JDjJspEL5BCTFNTyj8MmU7+
         UTBw==
X-Gm-Message-State: AOAM530fWfkniOO3zwKlYI6V4bYHXN/CQbw6dwdlSo07yuVW8mbYKr7o
        gj+pBfxgJz7FrsZ2B817sw==
X-Google-Smtp-Source: ABdhPJxV9UH4qTY1QxmdXA0dquwwhr1zY222awLfdtH3GhVI2rtJ2MLLQGxDUD8KtUSH+zq7FRO+Zw==
X-Received: by 2002:a4a:95c4:: with SMTP id p4mr26518512ooi.51.1622683688153;
        Wed, 02 Jun 2021 18:28:08 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id n186sm371737oia.1.2021.06.02.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 18:28:07 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH] documentation-file-ref-check: Make git check work for multiple working directories
Date:   Wed,  2 Jun 2021 20:28:06 -0500
Message-Id: <20210603012806.331132-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With multiple git working directories, '.git' may also be a text file
linking to the actual git tree instead of a directory.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/documentation-file-ref-check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
index c71832b2312b..7187ea5e5149 100755
--- a/scripts/documentation-file-ref-check
+++ b/scripts/documentation-file-ref-check
@@ -24,7 +24,7 @@ my $help = 0;
 my $fix = 0;
 my $warn = 0;
 
-if (! -d ".git") {
+if (! -e ".git") {
 	printf "Warning: can't check if file exists, as this is not a git tree\n";
 	exit 0;
 }
-- 
2.27.0

