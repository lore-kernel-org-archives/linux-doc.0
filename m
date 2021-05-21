Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44846C4707A
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 17:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A59460FE8
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 17:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbhEURcC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 13:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbhEURcC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 13:32:02 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB65C061574
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 10:30:38 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id ez19so10812652qvb.3
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cAcPpMHaJ04SovWKobTFPploOThAcqripiT531NS1Q=;
        b=Hpzpc3op3tM6S9DyxttC6UBtA9F8pcHjoylzPaBYRX29nomvd1GxUHg7vhPqAlzu9u
         n6hJ/ljC4AnTpk/d4jjTM0FL/L6YsbgweTk+vpOGXX1LYH1q2TCLvRSRO6B4y+MGHh8h
         TOLcqLKmzTTVeXkxpCvdEMibCz3soxH5xZ0hvlGCqGQpopyFl+HodZKNZEA3dke1OauC
         nmhwrNtIQLRqOv5NiV9rK3V1moR7As4xa1C9bmXOX5E8cgTsPr6nFaY7ibikl2GuCgHK
         kP2jRl8LGM41/Qm6zDMMA5VUBxOVVUdRzMvk1/gmF6A6IJX/B6RBmcm/hJKB9PJ4sQKB
         hMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+cAcPpMHaJ04SovWKobTFPploOThAcqripiT531NS1Q=;
        b=GO6hyjVZAybTD/ZYQea4AZ9oHKmrRuLbjKvBCey72Fum3SxR1kAMKeGqsiKDGE2LuJ
         s6zkMLlneWHofRxbg+rADCNxesGbOGxOQT3fohHmnzAL494HjkgPSZ+sQgPPMZOqp0l0
         TiOAUSm5KRn5Bp35+GWRbx+uVMmnSuOwr1H+1FSduKre1MTvAniaZ+BXAe8sJ1NBiobT
         HkjYzgem/9+ldUnxEP0OZdswFYnW+0wnVnmJiKjfD+tp6NXUn1uqEKIuzhBWmkBUwgri
         9dy+wRfDH0JGtO/5g8z4rj/aqEa7kJ3gX3DIugDjr8u5dXh0XKKcsqoqzm6q2Zf9MJjc
         qzNw==
X-Gm-Message-State: AOAM532cjRZ8K+cgnMoxd64Zrdd9Kk6D+HR+hngjO2Xh6/vnVHeiqO4n
        URmHwH0Nz5xnEy8tvTCh4n4=
X-Google-Smtp-Source: ABdhPJxUee/qzu0putrnlfwaxP/ZN1t2DYOB9DQjNwe5gYDahhN9EETCdzfTHCjPOimoC72V6m3GFA==
X-Received: by 2002:a0c:f48c:: with SMTP id i12mr12922955qvm.7.1621618237404;
        Fri, 21 May 2021 10:30:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:21c2:ce5:d6c8:5ba1])
        by smtp.gmail.com with ESMTPSA id r19sm4835354qtm.35.2021.05.21.10.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:30:36 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dan.j.williams@intel.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] docs: cxl/core: Fix the title underline
Date:   Fri, 21 May 2021 14:30:28 -0300
Message-Id: <20210521173028.37989-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 5f653f7590ab ("cxl/core: Rename bus.c to core.c") has changed
the title, but missed to update the underline length, which causes
the following 'make htmldocs' build warning:

Documentation/driver-api/cxl/memory-devices.rst:32: WARNING: Title underline too short.

Fix the title underline accordingly.

Fixes: 5f653f7590ab ("cxl/core: Rename bus.c to core.c") 
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/driver-api/cxl/memory-devices.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/memory-devices.rst
index 71495ed77069..73f6b246c583 100644
--- a/Documentation/driver-api/cxl/memory-devices.rst
+++ b/Documentation/driver-api/cxl/memory-devices.rst
@@ -29,7 +29,7 @@ CXL Memory Device
    :internal:
 
 CXL Core
--------
+--------
 .. kernel-doc:: drivers/cxl/core.c
    :doc: cxl core
 
-- 
2.25.1

