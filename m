Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47566C67871
	for <linux-doc@archiver.kernel.org>; Thu, 27 Oct 2022 10:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbiJ0KoN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Oct 2022 06:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiJ0KoM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Oct 2022 06:44:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE987DF61
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 03:44:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id l11so783975edb.4
        for <linux-doc@vger.kernel.org>; Thu, 27 Oct 2022 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=giuiXYYLk+f5QLS50ASlMusr4jOA07sul4BoLmCP2Tg=;
        b=IN9rKSLQysrc1zS8/Aoy0aq5vrB08zsUfVBZNbxbclZikymid0Wk8I3Lp7v/HwF4GB
         rV8Ar7hRJgWBBNYj406pMQkOXFslXJbPhUoLOUPKAWyYwJWp1C532zZC3zoKvfAHbSjS
         KRHuRUanvg2fCyM5XUnSGVsrL4XRBVeVYoWHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giuiXYYLk+f5QLS50ASlMusr4jOA07sul4BoLmCP2Tg=;
        b=p7pckfZWwLNEKkIoQ/8kuqg4dxK8iY4jqlksYt2+mkyDgB+U4NNN6hSK1/+tTLUXUc
         foNmKX19WUhg3spjtT1luucVWIJJZhDQvYluQmtDFXfmWCsxAT0yw68foUTfXYfS6xM4
         iShVbd/X6Dy1rlRxPzEuVZx8WI+cUlA5WzGquyKIv9JLsgrljjuKsd4aZLjqYmgMSVdY
         yim5aDRKAJ2uUPbxO4Jp6T+PBRDBAnc8otvk7lPB7qRMqZSOhA6jLakeCv+hgu2Dx47B
         bFpLMYuVOaP8rMu6XYsjQ2Xw5V1UB/2USMoXmHVTkb3M63iy0kWoxU15Hjcpn66mjBG1
         yYiA==
X-Gm-Message-State: ACrzQf2uv6GU2DtJrpT+HPyhpgsEJE9bAGi0G8zBahspj7JCZswyJSUi
        QHgD8nRMX008FS0S175AJ84x3A==
X-Google-Smtp-Source: AMsMyM7YmuQMOzkUROoct74BrEyBOXOY61+z4zYghz3wpEMzNkYu5jz8gJBxDNSYk3HcGTxe4XoSaQ==
X-Received: by 2002:a05:6402:5291:b0:45c:3f6a:d4bc with SMTP id en17-20020a056402529100b0045c3f6ad4bcmr44696532edb.285.1666867448979;
        Thu, 27 Oct 2022 03:44:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id n1-20020aa7c441000000b00461c6e8453dsm774012edr.23.2022.10.27.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 03:44:08 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/sphinx: More depth in the rtd sidebar toc
Date:   Thu, 27 Oct 2022 12:44:06 +0200
Message-Id: <20221027104406.549734-1-daniel.vetter@ffwll.ch>
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

Note that this has no impact on the classic theme (which doesn't have
the sidebar) nor on the various :toctree: rendered inline in the
output.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/conf.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 934727e23e0e..5dc141c66726 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -240,6 +240,10 @@ if html_theme == 'sphinx_rtd_theme' or html_theme == 'sphinx_rtd_dark_mode':
                 # Add color-specific RTD normal mode
                 html_css_files.append('theme_rtd_colors.css')
 
+        html_theme_options = {
+            'navigation_depth': -1,
+        }
+
     except ImportError:
         html_theme = 'classic'
 
-- 
2.37.2

