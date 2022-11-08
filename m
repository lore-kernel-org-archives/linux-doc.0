Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA224C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Nov 2022 11:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbiKHL5S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Nov 2022 06:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbiKHL5Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 06:57:16 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFD61274F
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 03:57:15 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id t25so37919531ejb.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 03:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVfGNdtNg+zCQhJb8JnZXraJEUpvWY2XlNM2DVwiefU=;
        b=Es1qARbsX7RS0Xd92HZZOXqamwXebEAT3D2rXZ3242oq86HzzlEKeouCKkE0VHuTdS
         wV5oVWbgvc1NgAKIFqN8aujoG++ihft46CuIV9EBKh+8ZOeAr+ECVeYP3n7kbgEcJzqU
         PASmZvErmpFvngKyJXPLWQGHor2Qink3rJUPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVfGNdtNg+zCQhJb8JnZXraJEUpvWY2XlNM2DVwiefU=;
        b=jUmrGHWIVJj0ZCfeDVnt++MDa9+d4FoDmh7EUbe7fMsmT9lyKmifkRJiaIvRrvuOIS
         sLY2HRgkExK070F6WStQPG6I3B58OYmWMVgQuR5wtErLMMUWSVtlYq0ZAFpIY8g7ohBZ
         K6eUt6xabMxXAQIvMxq4cCbNgl0vY1lVQXr4nGZ311kL6sxQRVV0PR04EClE8AmOuQ5b
         7pE8JxBmoLYhQ3Dd05Ty+dimqDSwvdTMUK6CP9rhrQZxDLdQIsDCe9Ijq0DLZakff7qO
         MiKcF/bWZ5oFKqGp/2c2AxbbCJa0leU5WCniB3e6wYWJPQ69F/fJuBDLGfkzaB2xhDo4
         bEdw==
X-Gm-Message-State: ACrzQf1v86fRwqe1LuDXdpUdtD/CN1tg11vzd1PkID6uAiWUA60u4fL7
        Axxj217WeT/qW3ihghchq+4aPg==
X-Google-Smtp-Source: AMsMyM5BuaFCyJpqFWdC5RbAV59Rp2Hk0lf/tuzgBE7M6wyhtpIcHG60tUWHoycUppUGF1bFN6wtdw==
X-Received: by 2002:a17:907:e8f:b0:7ad:923a:5a2c with SMTP id ho15-20020a1709070e8f00b007ad923a5a2cmr51867849ejc.736.1667908633613;
        Tue, 08 Nov 2022 03:57:13 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id ky26-20020a170907779a00b0073cd7cc2c81sm4513201ejc.181.2022.11.08.03.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 03:57:12 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
Date:   Tue,  8 Nov 2022 12:57:07 +0100
Message-Id: <20221108115707.1232621-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We love to nest our documenation for good structure, but that means
the table of contents needs to keep up or you can't navigate them.

Realized this trying to find the drm property documentation, which
with some shuffling around disappeared. Why I didn't realize we can do
this earlier, no idea.

Since the relevant parts of the toc are only loaded if you're in the
right .html file there's no harm in going all the way to unlimited.

Note that this has no impact on the alabaster theme (which has a much
simpler sidebar toc which doesn't show the entire hierarchy, only
what's in the local rendered file) nor on the various :toctree:
rendered inline in the output.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
v2: Rebase onto linux-next, reword commit message to take into account
that alabaster is the default now.
---
 Documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index c715610d6297..a5c45df0bd83 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -296,6 +296,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
                 # Add color-specific RTD normal mode
                 html_css_files.append('theme_rtd_colors.css')
 
+        html_theme_options = {
+            'navigation_depth': -1,
+        }
+
     except ImportError:
         html_theme = 'alabaster'
 
-- 
2.37.2

