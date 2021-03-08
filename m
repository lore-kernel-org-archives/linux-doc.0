Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30197C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 19:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0379F65295
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 19:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhCHTQC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 14:16:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhCHTPg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 14:15:36 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CF6C06174A
        for <linux-doc@vger.kernel.org>; Mon,  8 Mar 2021 11:15:36 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id i14so178322pjz.4
        for <linux-doc@vger.kernel.org>; Mon, 08 Mar 2021 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LWecoEPEy7ALFRmQYpSfE1kaYSEjuJUyw+bo5UyVzWw=;
        b=LvnxUKbwQmtaiY55wHaHLYFa+BIjo3x+Iz2ruou/w8AK9km3h+FloxJdaRogOZUc2z
         +YHNDGJalFqpTUBxwyU2qB6M9n7j8N4znGUF3pgItH07q/hi9CvuqY06eTfBUvbkuOBR
         O6P1HPk+0Tv4F1UOW69bjeXgVlv86tSrcPuTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LWecoEPEy7ALFRmQYpSfE1kaYSEjuJUyw+bo5UyVzWw=;
        b=GyvwDVvZkPClTDBBvMD+ZI76a24P8T84ERu5/Se8opk9nOEyRZlCYEcKkP7dSMWXs2
         E+NBOM1YwkAaK3ztU3iBpkmhbUSlX/8s78M9t30V5xs6wrTUtCkIm9KkBzsZ2rh3j8Ni
         Dl0cNAn9RoiGEFr26CaFrnI5tVsxT2uXluNzA0volFw79f137APdNlODY+ak9yTiPBRH
         4E8esGDu6csSr1/n8tgRHG2NvUIh58J9S1EGh7dqXgAkzDvSrgBIPMgmqElCfNEfj4ZG
         kIVza0h0IyU54r4NZuDgDcmWBcIO66Zf6rnxef8zVvFL1SzY6BVeXbEBI5UULvTbfiDt
         dXlA==
X-Gm-Message-State: AOAM531xhrgn8BcXmHqSj03Oi4Jpm9UayvjySjT6lU32Zr3Fb9eJEVit
        z+J+9L98UyPbksdE5Nu2IzfqITvu70dQ7g==
X-Google-Smtp-Source: ABdhPJz/q8yb8z0xFqrhp9PKIsoD/fcfNovQUef6x2RryOXROcIONe3GPxShRTkiLzELlfwZpH1+iQ==
X-Received: by 2002:a17:90a:f2d2:: with SMTP id gt18mr382352pjb.210.1615230936307;
        Mon, 08 Mar 2021 11:15:36 -0800 (PST)
Received: from braindead.localdomain (c-71-202-115-154.hsd1.ca.comcast.net. [71.202.115.154])
        by smtp.gmail.com with ESMTPSA id j3sm10331735pgk.24.2021.03.08.11.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 11:15:35 -0800 (PST)
From:   Wren Turkal <wt@penguintechs.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Wren Turkal <wt@penguintechs.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] Expose the bus kernel docs to the build docs.
Date:   Mon,  8 Mar 2021 11:14:18 -0800
Message-Id: <20210308191417.4750-1-wt@penguintechs.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307031611.GU2723601@casper.infradead.org>
References: <20210307031611.GU2723601@casper.infradead.org>
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
index 016b15a6e8ea..c53b01e95fd9 100644
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
+Functions and Structures
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

