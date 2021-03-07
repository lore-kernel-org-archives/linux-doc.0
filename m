Return-Path: <SRS0=pILf=IF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D402C433DB
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 01:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44DE56509B
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 01:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCGBdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Mar 2021 20:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhCGBdV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Mar 2021 20:33:21 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630BAC06174A
        for <linux-doc@vger.kernel.org>; Sat,  6 Mar 2021 17:33:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d23so21664plq.2
        for <linux-doc@vger.kernel.org>; Sat, 06 Mar 2021 17:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odz3qsxKjryCQfF/I8BZ9Bit9VVwbcSu5aab+WzDkDM=;
        b=GdJ+bkiwiwMeoh+RezjeOedX1o4tHNAGN+wV1kic8jqjKuk/BcjdgaudI7QT/D9ud2
         A6tdevraLbgZCVZBTVg5iL93KyQAomACOTK/MbQL84MMdnyVSyyC+PG7SmDQ24XG4hT6
         0FUdj01OLzkj8DkjaawdoP7yQirRQMAtF8I/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=odz3qsxKjryCQfF/I8BZ9Bit9VVwbcSu5aab+WzDkDM=;
        b=JIItEkm6jOYjjJUM8C9hVgGgygTYNar7yad+zayPkfUPOWFQYFmHxn0cQUnSne2Ras
         X1wCAJCRMtXyJ6EG0jFKYTzl2RlqmQ7LT2F9xrv0YxDMuQgG4kkfgaDWjR5fL3eqdGyR
         XUtIwNmRSs5MZh/XwL7Zqe0IqmKAj9wWWRt8K7C+OqnFr/fBnA2tb4mFfhl82HawZ2Vn
         fEaXzL9OUbWsqvcHwt6aUCxK1Wzwn7mOnKW1XYB+U2sLRIIHxhZUhNsdh/8dtoPfwayu
         mlCP9krPQfC2EXCjgd6iiKuG0heyfirrGSudW+BbqYapONn1cseBQwRM3PXeh2oD/TL5
         46IQ==
X-Gm-Message-State: AOAM532Kq6Q2yPIqLIBm9pnq5l07805EfQN+Zldx8GnsAYDqIgsjI9KW
        tFb8Yk8/cNgtNj42df19wpAsBg==
X-Google-Smtp-Source: ABdhPJzxz6CWc24so1S+D/77Q5LumcDuTMkAXBCbiJxm58vXRhjCTFMVI96DcJE3iazuanixEfR21w==
X-Received: by 2002:a17:902:8218:b029:e6:190e:48e with SMTP id x24-20020a1709028218b02900e6190e048emr603726pln.33.1615080800695;
        Sat, 06 Mar 2021 17:33:20 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id 68sm6340538pfd.75.2021.03.06.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 17:33:20 -0800 (PST)
From:   Wren Turkal <wt@penguintechs.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wren Turkal <wt@penguintechs.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Expose the bus kernel docs to the build docs.
Date:   Sat,  6 Mar 2021 17:33:01 -0800
Message-Id: <20210307013301.39420-1-wt@penguintechs.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Before, the bus type related APIs that were defined in the
include/linux/device/bus.h were not referenced anywhere in the docs, so
I linked it to the bus types api documentation.

Signed-off-by: Wren Turkal <wt@penguintechs.org>
---
 Documentation/driver-api/driver-model/bus.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/driver-model/bus.rst b/Documentation/driver-api/driver-model/bus.rst
index 016b15a6e8ea..4cd237ded827 100644
--- a/Documentation/driver-api/driver-model/bus.rst
+++ b/Documentation/driver-api/driver-model/bus.rst
@@ -144,3 +144,5 @@ sysfs directory using::
 
 	int bus_create_file(struct bus_type *, struct bus_attribute *);
 	void bus_remove_file(struct bus_type *, struct bus_attribute *);
+
+.. kernel-doc:: include/linux/device/bus.h
-- 
2.30.1

