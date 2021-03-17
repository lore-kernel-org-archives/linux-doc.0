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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF53C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 10:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F093F64F20
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 10:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCQKVW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 06:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhCQKVQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 06:21:16 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEFBC06174A;
        Wed, 17 Mar 2021 03:21:16 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id s2so943580qtx.10;
        Wed, 17 Mar 2021 03:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n51gjbecvVbClzThaaf0zcDPA+9qxy+vlw2NAqOSGp4=;
        b=C5Fw55cxZcAIoDfHOjJe6iFBjeSLC6B87f7331/hdeHXe4JN6s8q/X3eCZmp/iXVxG
         +ZpBgzjAewjPVPkb14j6DCjebuOw9uYUFqGzu4WGztQ9FTqltdHdz54/SEmDgCjnjqRE
         QbZ8m90xbtz/oryZX4YBs+1hASmghgsWEkHUvbVw8Oz13TPdemwm2msjoPHU8YhHfIrX
         IDMunVR2a66Jqp3D6JSUNa+SIoIXruOO3jMj112DsSzxu5plWhZxdFt7bH4t8KXxAPVL
         +do5QBKELxbqvohD8wS6PDvNKIDpOrwUPH2QL7hBLw1Zj7a5FPfAbpfaQPXMzcDRLSoQ
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n51gjbecvVbClzThaaf0zcDPA+9qxy+vlw2NAqOSGp4=;
        b=A00wOpLnHVzv/sjZEisVCO9N4MNVoV3SirTr60lKy9+I6JNhsh1k0LzYdiXHrGGE7/
         +qZLt3nzEZ4yZajngb6Q93uraUvagz4MrN9N0M969dvbinN/Mx7qqfOESBWqy+ZUPdPL
         8OCn5zIcJIDjow3A11yZuqi+UTbvMHbQXFLHuqXbgdXKPBfB9tDNJuj35ikAYOKkjgk1
         i1UjplHbz9KkuGwR2CoO6NGviUvE/nap2W7ZWeVMmyXAzPBJcrY9hJmbe/ONC+JATiY0
         e434bCClCgdP1mXoPg1QkxXrrqQGqysOOyoAg9f9SyUIYyiU/pvekpOZwfC+QMGRcO/V
         7d2Q==
X-Gm-Message-State: AOAM533IjKQourGdGpC/fIaR33lOfA6rgUaKVUBeU5utmlMREWQYeyAT
        0ONUa+xCWOqEP0J6hcT3p5SF1RwctY3FP+cD
X-Google-Smtp-Source: ABdhPJwnZGiKH+Rdt5HtLSlvJiY6C135A0r1HWKfWiiirltMRT5J3mBAVnDWoiPgSoTA5nqx11T88Q==
X-Received: by 2002:ac8:6696:: with SMTP id d22mr712038qtp.67.1615976475827;
        Wed, 17 Mar 2021 03:21:15 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.48])
        by smtp.gmail.com with ESMTPSA id z6sm14997773qtv.69.2021.03.17.03.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 03:21:15 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, unixbhaskar@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] docs: sphinx:  Trivial fix of a typo in the file rstFlatTable.py
Date:   Wed, 17 Mar 2021 15:50:56 +0530
Message-Id: <20210317102056.3003768-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


s/buidler/builder/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/sphinx/rstFlatTable.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index a3eea0bbe6ba..1d2b9be6b6c5 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -161,7 +161,7 @@ class ListTableBuilder(object):
         for colwidth in colwidths:
             colspec = nodes.colspec(colwidth=colwidth)
             # FIXME: It seems, that the stub method only works well in the
-            # absence of rowspan (observed by the html buidler, the docutils-xml
+            # absence of rowspan (observed by the html builder, the docutils-xml
             # build seems OK).  This is not extraordinary, because there exists
             # no table directive (except *this* flat-table) which allows to
             # define coexistent of rowspan and stubs (there was no use-case
--
2.30.2

