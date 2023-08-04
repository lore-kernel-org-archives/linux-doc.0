Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A9FC001DE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 21:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjHDVI4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 17:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbjHDVIw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 17:08:52 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD2F525A
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 14:07:35 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso2316742b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691183254; x=1691788054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpU2xFaaF3Xyb1VXPjBfCVgipxCUGfroeAS7mPX+g1w=;
        b=cEUGE6wsJwsRZHdJ/r0L0sZaGTK5F3K/xw3fxbwU4+7awGdBhuIueX5dlIc0n8u+cg
         54pS6miJSNZg+HoThr4CiTgxUdnVx39P/JieL0ooRs8tEAK+ereTgwxpTjgeU3zSxmS+
         UIbWy6KSSV6s1jO2Sd7Ner4SJSIrVXpveIY3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691183254; x=1691788054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpU2xFaaF3Xyb1VXPjBfCVgipxCUGfroeAS7mPX+g1w=;
        b=cl2ugTJ9nV5n3vYN973z1oIFTJZ45UNb4z1+xoiII7wDF1ORUduVL8zPimaWvvSvkB
         SnkTD4vD/5PyoxIRqmCVVyCPmFXf+poDcrIPC3bHVYaORj364qW4xfHZ3txW5qzDa1w4
         wWfGaKsKkKovmJouiI2JUP1rPNl0b2YPLnY3mx5vOnsnDIvaYIir3LY66ne94vf85KBL
         3HZqdCbv+mbXXF832WZpR/QqA800xMJWSLXU3s3majXom4COBqLpARLu+eJ2eQj/nA4o
         ZHUAYgMDVGsFx9Bgv2eFmvkcP302sjRiBRRcAQMzIMMGsJmeKmG2FKCcK4yrzr7r+Hk6
         T5Cw==
X-Gm-Message-State: AOJu0YwIgosCfBH9x5+Lqz6e2adJbM1Ujct++r2ckUUyUb0L/qvVhzf4
        WZdOzqkHmjjX9FsTZWi+KNyU2A==
X-Google-Smtp-Source: AGHT+IHAa5PFI7E7ljoNguOyDV3zMc+VCG8XxoylBnS1MC5PEbgpVz5WqE7OI7hD0tr47yDAi54uWg==
X-Received: by 2002:a05:6a00:8c4:b0:687:96f2:72af with SMTP id s4-20020a056a0008c400b0068796f272afmr3777918pfu.17.1691183254593;
        Fri, 04 Aug 2023 14:07:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
        by smtp.gmail.com with ESMTPSA id n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 14:07:33 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 10/10] drm/panel: Update TODO list item for cleaning up prepared/enabled tracking
Date:   Fri,  4 Aug 2023 14:06:13 -0700
Message-ID: <20230804140605.RFC.10.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
References: <20230804210644.1862287-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that most panels have been updated not to track/double-check their
prepared/enabled state update the TODO with next steps.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/gpu/todo.rst | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 139980487ccf..c73d9dbebbf4 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -460,26 +460,19 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
-Clean up checks for already prepared/enabled in panels
-------------------------------------------------------
-
-In a whole pile of panel drivers, we have code to make the
-prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try::
-
-  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
-  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
-
-In the patch ("drm/panel: Check for already prepared/enabled in drm_panel")
-we've moved this check to the core. Now we can most definitely remove the
-check from the individual panels and save a pile of code.
-
-In adition to removing the check from the individual panels, it is believed
-that even the core shouldn't need this check and that should be considered
-an error if other code ever relies on this check. The check in the core
-currently prints a warning whenever something is relying on this check with
-dev_warn(). After a little while, we likely want to promote this to a
-WARN(1) to help encourage folks not to rely on this behavior.
+Never double prepare/enable/disable/unprepare a panel
+-----------------------------------------------------
+
+As of commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
+drm_panel"), we have a check in the drm_panel core to make sure nobody
+double-calls prepare/enable/disable/unprepare. However, that extra double-check
+shouldn't be necessary. The caller should always be matching up calls of
+prepare/unprepare and matching up calls of enable/disable.
+
+Hopefully the warning printed will encourage everyone to fix this. Eventually
+we'll likely want to change this to a WARN_ON and (perhaps) fully remove the
+check. NOTE: even if we remove the double-check, drm_panel core still needs
+to track the enabled/prepared state for its own purposes.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.41.0.585.gd2178a4bd4-goog

