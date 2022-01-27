Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB16C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 08:21:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237721AbiA0IV1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 03:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43361 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237706AbiA0IV0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 03:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643271685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=aqucoy4XGsTZkTOddjEsvTdomJ0r/Uc6V8VLwfxZoJ8=;
        b=Vl7kYAkR0+sJRCkBcaR/gRulfYJ5X9d7b2ndSGympfHHy6QoPIlMJou4PBGx/btAD+JTYi
        zQ4+1U8Pakud/dtzQT1llTQ3fE+Px4Pnzbp/zd4j9F+Jy6Prxbbrml3uYo4XsWbmH24ya2
        r0hpMYNKkqw/uVrnzdVxc1/jt+7+l8s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-tQgWCwloMUqVB27ZI9Lw6Q-1; Thu, 27 Jan 2022 03:21:21 -0500
X-MC-Unique: tQgWCwloMUqVB27ZI9Lw6Q-1
Received: by mail-wm1-f71.google.com with SMTP id i26-20020a1c541a000000b0034dc8bd7078so405150wmb.8
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 00:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aqucoy4XGsTZkTOddjEsvTdomJ0r/Uc6V8VLwfxZoJ8=;
        b=2JvP8NnZZTR+8ptAzBJvvx48tAZqCDcxI9kWCNNsR1/IQcJ7eeOQEd3WkKC+mkmNyG
         JihBjsAj8cFWXT8cidqs8DdoBbbMHTwH8mWLlYRCtXDaoQD9ZkNuC38cMFJqQRztJswR
         rJerCwk50kJJPV0/e/u5Tgn7bQDyURbAKQeuijoTcQrLUdUX1CHHbIik4lKRIAd6JExf
         yQwJdlO44aBIB4GuQIZwemebDe1/Gq50fk5g81u1ZZSykRxBswleVF0u+ebU/PXBdOTp
         GFeLB3OcKhCdXShRVrXfdqsPy5q6zFeAIy9tIZzEkBkQm6M+b8z6eGi7HJbbdOqdiPuq
         45Fw==
X-Gm-Message-State: AOAM530uNTEWjuOvZBJgvbrO4QQf4NDmPmlH7fU1AGG/SxI4tf7AQ6MQ
        xQaj/q+vD02iq4i1u9HLKbfY1Fh5sPKX5/4++CJTO050fXHksSdUzReV0pii8xXV3HRtF45gLP3
        C7ZUOhT0Ipr42V/d/OSC0
X-Received: by 2002:a05:6000:15c5:: with SMTP id y5mr2159690wry.656.1643271679945;
        Thu, 27 Jan 2022 00:21:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ/ZlKYqVE0iVqFH4AaZjGEnemdYNWmvhTud3sB/CSRe+UTC4Mv6f2ZPwV9RWl4nRIixdB4w==
X-Received: by 2002:a05:6000:15c5:: with SMTP id y5mr2159669wry.656.1643271679638;
        Thu, 27 Jan 2022 00:21:19 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h20sm7466wmq.8.2022.01.27.00.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 00:21:19 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [PATCH] drm/doc: Add section in the introduction page about learning material
Date:   Thu, 27 Jan 2022 09:20:58 +0100
Message-Id: <20220127082058.434421-1-javierm@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Linux DRM subsystem supports complex graphics devices and it could be
quite overwhelming for newcomers to learn about the subsystem's internals.

There are lots of useful talks, slides and articles available that can be
used to get familiar with the needed concepts and ease the learning curve.

Add a section to the intro that contains these DRM introductory materials.

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 25a56e9c0cfd..35986784f916 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civilised manner when
 interacting with community members on mailing lists, IRC, or bug
 trackers. The community represents the project as a whole, and abusive
 or bullying behaviour is not tolerated by the project.
+
+Learning material
+=================
+
+Since the Linux DRM layer supports complex graphics devices, it can be quite
+overwhelming for newcomers to get familiar with all the needed concepts and
+learn the subsystem's internals.
+
+To shallow the learning curve, this section contains a list of presentations
+and documents that can be used to learn about DRM/KMS and graphics in general.
+
+The list is sorted in reverse chronological order, to keep the most up-to-date
+material at the top. But all of them contain useful information, and it can be
+valuable to go through older material to understand the rationale and context
+in which the recent changes to the DRM subsystem were made.
+
+Talks
+-----
+
+* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
+* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
+* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
+* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
+* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
+* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
+* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013
+
+Slides and articles
+-------------------
+
+* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
+* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
+* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
+* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
+* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
+* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
-- 
2.34.1

