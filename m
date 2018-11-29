Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC2A57D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 15:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbeK3C6j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 21:58:39 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33783 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbeK3C6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 21:58:39 -0500
Received: by mail-yb1-f193.google.com with SMTP id i78-v6so936199ybg.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 07:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YbImJLgvXpHMCm9ocN1DSeQ3qJAm9X3astsJcqsRH8=;
        b=GEy96kUExJcD5FRE1icXsRpjWyDDBITQaJBJCWuQtzyyJTxgY/cicYAekDKHsJ4cYL
         s1lbaEMTASLFFvRS30NAkmhgtA+7EWXwRzpptrMS/mE8vrvrwGEcno9fWVaUvev8f+Hn
         MJei4CSwzPIrC6R72guyvEFUxc5tv5drb6WhAbSBxlJRFUo8WEabfScbLGC5TKRXB76c
         GConztiZP0SPMB2EfS/siSjRUkP3kpiMPEXOB8eC4dzh+j3n5ipK+IQPJzv2xJim15qW
         BlQETz0aYEGpxVg2+ytG8wwkYpJ6RwT/cYopGklDVnFe5LZpGs5g6LWT03q6QLL5MHey
         JhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YbImJLgvXpHMCm9ocN1DSeQ3qJAm9X3astsJcqsRH8=;
        b=MAz+AayBpN3U2Oij2GkPeeExNEAYrCh5ZEaY7O7OXa0pO9+BFyOVWqMZtYW0AuwhFo
         3crmcNlyr2n6Ct4WgKouY80TJsnBy55hNjLYODozZ7safAMl/qiFKnoRlax1syMT7FPc
         /Rz36jMLzWw1Qilmydn6G6JQ40GC6XQIdqdGRL/DlOO6IWtp/z0rx59g/7KzpmjSbza2
         ABVsO5DO23CLCkH1LugxleWPz7dylzGBSQljixd/yIAEuFsv3HTEfMhUD2oHTDgfNLmy
         cMkeUXzbejaXiyGT5z/auSQI6KZxP5aZcavMSPpJEBFPirnlooewzFGid4IEBZEzTIJd
         /tdQ==
X-Gm-Message-State: AA+aEWa2ER/cb4+yKcIWZgOkhfFHkMWFFfAU5YCT+vibHj8HoLpAtUQe
        QbkdO3KjqgE5pJqA2bMi6ZP2XQ==
X-Google-Smtp-Source: AFSGD/WEIFOmCirwenIbKa1TTbSBTyHC/JhDTyV1nVKUWKftudwHNtNJPGDH4ge8Me8DhJtURVKXZQ==
X-Received: by 2002:a25:7c83:: with SMTP id x125-v6mr1809399ybc.152.1543506770271;
        Thu, 29 Nov 2018 07:52:50 -0800 (PST)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:ad55:b1db:adfe:3b9f])
        by smtp.gmail.com with ESMTPSA id f191-v6sm988214ywh.98.2018.11.29.07.52.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 07:52:49 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        linux-doc@vger.kernel.org
Subject: [PATCH] drm: TODO: Add DRM_MODESET_LOCK_ALL* conversion to todo.rst
Date:   Thu, 29 Nov 2018 10:52:40 -0500
Message-Id: <20181129155249.30096-1-sean@poorly.run>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

We should also get the drivers using the helpers. Seems like a good
intermediate TODO item.

Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/todo.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index ab347dec50796..1a6dc586fb156 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -241,6 +241,18 @@ struct drm_gem_object_funcs
 GEM objects can now have a function table instead of having the callbacks on the
 DRM driver struct. This is now the preferred way and drivers can be moved over.
 
+Use DRM_MODESET_LOCK_ALL_* helpers instead of boilerplate
+---------------------------------------------------------
+
+For cases where drivers are attempting to grab the modeset locks with a local
+acquire context. Replace the boilerplate code surrounding
+drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
+DRM_MODESET_LOCK_ALL_END() instead.
+
+As a reference, take a look at the conversions already completed in drm core.
+
+Contact: Sean Paul, respective driver maintainers
+
 Core refactorings
 =================
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

