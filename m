Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C83DEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 22:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjFWWYc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 18:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjFWWYb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 18:24:31 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D77826B3
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:24:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fa7512e5efso15280265e9.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687559069; x=1690151069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCQm6L24JN7h7YAY5YLo/KLz+bCxV7q1iWuvA+ssee8=;
        b=McMM8qRf4LAPhKWB+qH1vWr0eILwaa28nZl4EwjAWZ5JKyWCc8F1KZlflgu6Fenu2z
         8p2L+NJkoq1mwTE13Ec9GlGjDot7H36L526dLhIaQv8q0/BLChNebSU4/0uceAIGt8Zi
         NKWhVtZ/polveq8TKpGBx8XRlKQR8ytpc3EzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687559069; x=1690151069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCQm6L24JN7h7YAY5YLo/KLz+bCxV7q1iWuvA+ssee8=;
        b=QZ6M11CyVszhYhIPeetIRIPnoVQg0NDolkx839ppmwGMpuoaBk1PNyef9TY0KjHA+v
         BY06OUftfXMOTf/abBPffKiFMtVwjZs4GZxSGoe/IMa6Ur98bYuOFsRAM5Z4jzCZ86zQ
         wyvfUfbwkJWu/15gZn6H0HgSvYA+dXB/PtKFjBNrsnOQVSVPT6WIVORQ9EGumdWTY0/p
         p9f3ryZI5jjUbyX3Enw4LGSmtxJrkYJzdB0eHDpP0TjR4HfTjIJzTk3ssTQSWzxp53H4
         LQKFPojb3kNzzfSai/t1iJ57Kvysdy6twh6w9jjQTr9jCiolL7y80OtoAYmMWoMNdjHD
         4zMQ==
X-Gm-Message-State: AC+VfDxE6PvoWzNu68unK6KVAUvxYa/YVnjH758DW7skagRGpwBtiEBd
        3dg9oqvTwFLd+93k/Tw4ufsVmQ==
X-Google-Smtp-Source: ACHHUZ5i4VyTlmfKvSj9N4tKIp95whP30Srd/cZr5yJyHkGu1U/UsDNCUViF0aar0wPXbGemSw+J5w==
X-Received: by 2002:adf:e387:0:b0:30f:fec1:ac0f with SMTP id e7-20020adfe387000000b0030ffec1ac0fmr23653128wrm.36.1687559068747;
        Fri, 23 Jun 2023 15:24:28 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 15:24:28 -0700 (PDT)
From:   Jim Shargo <jshargo@chromium.org>
To:     mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Melissa Wen <melissa.srw@gmail.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jim Shargo <jshargo@chromium.org>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Adds support for ConfigFS to VKMS!
Date:   Fri, 23 Jun 2023 18:23:42 -0400
Message-ID: <20230623222353.97283-1-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Intro
=====

At long last, we're back!

This patchset adds basic ConfigFS support to VKMS, allowing users to
build new DRM devices with user-defined DRM objects and object
relationships by creating, writing, and symlinking files.

Usage
=====

After installing these patches, you can create a VKMS device with two
displays and a movable overlay like so (this is documented in the
patches):

  $ modprobe vkms enable_overlay=1 enable_cursor=1 enable_writeback=1
  $ mkdir -p /config/
  $ mount -t configfs none /config

  $ export DRM_PLANE_TYPE_PRIMARY=1
  $ export DRM_PLANE_TYPE_CURSOR=2
  $ export DRM_PLANE_TYPE_OVERLAY=0

  $ mkdir /config/vkms/test

  $ mkdir /config/vkms/test/planes/primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/primary/type

  $ mkdir /config/vkms/test/planes/other_primary
  $ echo $DRM_PLANE_TYPE_PRIMARY > /config/vkms/test/planes/other_primary/type

  $ mkdir /config/vkms/test/planes/cursor
  $ echo $DRM_PLANE_TYPE_CURSOR > /config/vkms/test/planes/cursor/type

  $ mkdir /config/vkms/test/planes/overlay
  $ echo $DRM_PLANE_TYPE_OVERLAY > /config/vkms/test/planes/overlay/type

  $ mkdir /config/vkms/test/crtcs/crtc
  $ mkdir /config/vkms/test/crtcs/crtc_other
  $ mkdir /config/vkms/test/encoders/encoder
  $ mkdir /config/vkms/test/connectors/connector

  $ ln -s /config/vkms/test/encoders/encoder /config/vkms/test/connectors/connector/possible_encoders
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/encoders/encoder/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/primary/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/cursor/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/overlay/possible_crtcs/
  $ ln -s /config/vkms/test/crtcs/crtc_other /config/vkms/test/planes/other_primary/possible_crtcs/

  $ echo 1 > /config/vkms/test/enabled

Changes within core VKMS
========================

This introduces a few important changes to the overall structure of
VKMS:

  - Devices are now memory managed!
  - Support for multiple CRTCs and other objects has been added

Since v1
========

  - Added DRMM memory management to automatically clean up resources
  - Added a param to disable the default device
  - Renamed "cards" to "devices" to improve legibility
  - Added a lock for the configfs setup handler
  - Moved all the new docs into the relevant .c file
  - Addressed as many of sean@poorly.run as possible

Testing
=======

  - New IGT tests (see
    gitlab.freedesktop.org/jshargo/igt-gpu-tools/-/merge_requests/1)
  - Existing IGT tests (excluding .*suspend.*, including .*kms_flip.*
    .*kms_writeback.* .*kms_cursor_crc.*, .*kms_plane.*)

Outro
=====

I'm excited to share these changes, it's my still my first kernel patch
and I've been putting a lot of love into these.

Jim Shargo (6):
  drm/vkms: Back VKMS with DRM memory management instead of static
    objects
  drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
  drm/vkms: Provide platform data when creating VKMS devices
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support enabling ConfigFS devices
  drm/vkms: Add a module param to enable/disable the default device

 Documentation/gpu/vkms.rst            |  17 +-
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  28 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 657 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      |  97 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 208 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 166 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 299 ++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  26 +-
 11 files changed, 1312 insertions(+), 232 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.41.0.162.gfafddb0af9-goog

