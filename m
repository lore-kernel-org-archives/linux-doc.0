Return-Path: <SRS0=pILf=IF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE5C433E0
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 03:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75BAF65066
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 03:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCGDMz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Mar 2021 22:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhCGDMa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Mar 2021 22:12:30 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A91C06175F
        for <linux-doc@vger.kernel.org>; Sat,  6 Mar 2021 19:12:29 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u11so3257246plg.13
        for <linux-doc@vger.kernel.org>; Sat, 06 Mar 2021 19:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oiRhle4TTum29WBndw3nlIp4Qv2NDLxbnTie42IDOu4=;
        b=NmPk+Kxg1z7kuzVBw3tqljeRtZKghfrQkQc54IbKIUjCljpfFAoNUe6EED0099ejIT
         axeNugqurE27yihRz7oj6uWLk7iiLVvsJko9xYVMDv7dDcGhFwq3IfNehPGbyqiBydWV
         qPz6qOd/AZY3BUYULTpuQ9AyQLI5irCodk7gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oiRhle4TTum29WBndw3nlIp4Qv2NDLxbnTie42IDOu4=;
        b=khIkcRzNV+Af+xUpyYQOIphl3nCoZLWgXkIAY81kgkRYf+TicaxVuKQfAVlU5Q6UCW
         bDKOLCcv7JitoHrXLmFbBmDzMllPh0VstogEF+T/e8JgImTtmIw2ocIhUNEDjM4deWbw
         N8vXrhywDDgSYUBVR1PgK8nN5BCmK6vE5CKEK7QFoaGY//pZZ9yt5NySfgTaJru1x/Ui
         dDPsUzUZzELw+0UxUzy7rzSzhZvxyK1Xv9ormPmzaJgk1yiMfi6eFbTwqhUK0Pkjpgsy
         y8mk8maKIcHBI5rApviWqrwWe+721DJp068m5xcybqVklvgwEvxyeGbh6Jy3xzi16XbD
         U47w==
X-Gm-Message-State: AOAM532JPCsst59Qr+Wxbfjz7N3JMRKpNoz/ut2xPjA/zki2qiFsjco7
        dUpH5GZSqLqaOS5SDbEigwuMGw==
X-Google-Smtp-Source: ABdhPJyTwPvdlRukE8dmyMuxmUCWUcOVgAe4lw67VL5ziFeAgfWeZFDGN9TdazTssdzF+wunVzgrGw==
X-Received: by 2002:a17:90a:d311:: with SMTP id p17mr17904181pju.43.1615086748344;
        Sat, 06 Mar 2021 19:12:28 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id s194sm6329911pfs.57.2021.03.06.19.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 19:12:27 -0800 (PST)
From:   Wren Turkal <wt@penguintechs.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wren Turkal <wt@penguintechs.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Expose the bus kernel docs to the build docs.
Date:   Sat,  6 Mar 2021 19:12:19 -0800
Message-Id: <20210307031219.53800-1-wt@penguintechs.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307014445.GT2723601@casper.infradead.org>
References: <20210307014445.GT2723601@casper.infradead.org>
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
 Documentation/driver-api/driver-model/bus.rst | 8 ++++++++
 Documentation/driver-api/infrastructure.rst   | 3 +--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/bus.rst b/Documentation/driver-api/driver-model/bus.rst
index 016b15a6e8ea..6bed459b87cc 100644
--- a/Documentation/driver-api/driver-model/bus.rst
+++ b/Documentation/driver-api/driver-model/bus.rst
@@ -1,3 +1,5 @@
+.. _bus_types:
+
 =========
 Bus Types
 =========
@@ -144,3 +146,9 @@ sysfs directory using::
 
 	int bus_create_file(struct bus_type *, struct bus_attribute *);
 	void bus_remove_file(struct bus_type *, struct bus_attribute *);
+
+Fucntions and Structures
+========================
+
+.. kernel-doc:: include/linux/device/bus.h
+.. kernel-doc:: drivers/base/bus.c
diff --git a/Documentation/driver-api/infrastructure.rst b/Documentation/driver-api/infrastructure.rst
index 683bd460e222..eb2a2c9e3c0c 100644
--- a/Documentation/driver-api/infrastructure.rst
+++ b/Documentation/driver-api/infrastructure.rst
@@ -41,8 +41,7 @@ Device Drivers Base
 .. kernel-doc:: drivers/base/platform.c
    :export:
 
-.. kernel-doc:: drivers/base/bus.c
-   :export:
+:ref:`bus_types`
 
 Device Drivers DMA Management
 -----------------------------
-- 
2.30.1

