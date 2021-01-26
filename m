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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C36C433E9
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 17:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7150230FC
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 17:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389520AbhAZRO5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 12:14:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389580AbhAZHlf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 02:41:35 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDE4C061793;
        Mon, 25 Jan 2021 23:25:38 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id o7so925333pgl.1;
        Mon, 25 Jan 2021 23:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=773+RXZkteimM+S1ETqgBQNdS5zGsgoZEJtrpOYRkE4=;
        b=kyAJly/9CBI1UylWR4mgCXsFSiP+kmjhAGF8l/n5Nevk6mv0qeblpxVuyJeszm6Z1d
         a8OtUUqtKJCq53P9TyCXzcw0t0RNAc4X6XGAr+JN7fT3ED4d7VPmHsRM1z4+AKsrmTNJ
         Hc4nFsHJAXewgucu0G36aKgUw3x7x8YOddTQ7VCCiBiPiRCGoXSEu9Nn6ofhchWe4UjT
         0w3TM/gd1gwam9Fnv4kyhwx7oHIR5/K7MBPLgIsW8tVyh40hSsbI1DKaAJHTQtRSRCB9
         n6rYgRh35GneZnrjsct0p3VFwZsPHoCDm+58A7XPIH9UaCrKQIOFF7kbyL2K1zDPNnZB
         jWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=773+RXZkteimM+S1ETqgBQNdS5zGsgoZEJtrpOYRkE4=;
        b=DiLfm9wjy5YLxxoTtVFOXBuME+DdDefFKJd8Cu+Oss/2aI2TC0yX6SVU9TzxY0Px7R
         xkIaaCLc5pgydqerPHxYplSzzoFxDPL2DSBC2SwVCxfSZeEgHXdwAFiVUs6AhwfhNEN9
         BDLvrZLnsL/QKSWvOBxo+xF/WZ4gBjoCA/FM9bzEHegVm8VLCaG9YP6d5KKwl/JWPpYz
         SJJTQ2/TgYA4WV5TcZ1ozpu/G/FRt7xlALu2qTI7Pb3usD6ZO0a5QCZUnJUDz86sUQKV
         O9+Kjg+UXyKMAZaS8AeFjIElJ73P7+hBrEspAZAPNIjPpwJTVyLpUrbJTk1p2+I7ZQTg
         gPWQ==
X-Gm-Message-State: AOAM530YfiPGjNOyMAoAsTedQJRPk7ZPo7BEuGvH9RfXOtqG0OoSO56U
        PsqPXhM2ctzJhKArrA8HFJ4=
X-Google-Smtp-Source: ABdhPJxkXqChmaOs6MWJVXk25b/y1mCAb1kjZkoJlDfQnIh5yo2tFNEfKi56qbKDo76/OOGLH+ya4w==
X-Received: by 2002:a62:1741:0:b029:1be:3fb:447 with SMTP id 62-20020a6217410000b02901be03fb0447mr3961453pfx.50.1611645938304;
        Mon, 25 Jan 2021 23:25:38 -0800 (PST)
Received: from cl-arch-kdev.. (cl-arch-kdev.xen.prgmr.com. [2605:2700:0:2:a800:ff:fed6:fc0d])
        by smtp.gmail.com with ESMTPSA id l12sm1320256pjg.54.2021.01.25.23.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 23:25:37 -0800 (PST)
From:   Fox Chen <foxhlchen@gmail.com>
To:     corbet@lwn.net, vegard.nossum@oracle.com, viro@zeniv.linux.org.uk,
        rdunlap@infradead.org, grandmaster@al2klimov.de
Cc:     Fox Chen <foxhlchen@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] docs: path-lookup: update WALK_GET, WALK_PUT desc
Date:   Tue, 26 Jan 2021 15:24:41 +0800
Message-Id: <20210126072443.33066-11-foxhlchen@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126072443.33066-1-foxhlchen@gmail.com>
References: <20210126072443.33066-1-foxhlchen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

WALK_GET is changed to WALK_TRAILING with a different meaning.
Here it should be WALK_NOFOLLOW. WALK_PUT dosn't exist, we have
WALK_MORE.

WALK_PUT == !WALK_MORE

And there is not should_follow_link().

related commits:
8c4efe22e7c4de1d44f624120a979e31e3a584b8
1c4ff1a87e46a06fc00a83da2fbbc3ac0298f221

Signed-off-by: Fox Chen <foxhlchen@gmail.com>
---
 Documentation/filesystems/path-lookup.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
index 915c9ffe22c1..921779a4636f 100644
--- a/Documentation/filesystems/path-lookup.rst
+++ b/Documentation/filesystems/path-lookup.rst
@@ -1126,13 +1126,11 @@ stack in ``walk_component()`` immediately when the symlink is found;
 old symlink as it walks that last component.  So it is quite
 convenient for ``walk_component()`` to release the old symlink and pop
 the references just before pushing the reference information for the
-new symlink.  It is guided in this by two flags; ``WALK_GET``, which
-gives it permission to follow a symlink if it finds one, and
-``WALK_PUT``, which tells it to release the current symlink after it has been
-followed.  ``WALK_PUT`` is tested first, leading to a call to
-``put_link()``.  ``WALK_GET`` is tested subsequently (by
-``should_follow_link()``) leading to a call to ``pick_link()`` which sets
-up the stack frame.
+new symlink.  It is guided in this by two flags; ``WALK_NOFOLLOW``, which
+suggests whether to follow a symlink if it finds one, and
+``WALK_MORE``, which tells whether to release the current symlink after it has
+been followed.  ``WALK_MORE`` is tested first, leading to a call to
+``put_link()``.
 
 Symlinks with no final component
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.30.0

