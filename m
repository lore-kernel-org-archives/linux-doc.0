Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FE2C05052
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 07:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358202AbjHRHf3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 03:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350576AbjHRHfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 03:35:07 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC13C30E6
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 00:35:05 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-564cd28d48dso500918a12.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692344105; x=1692948905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJDQ0Q6umiB4bUJMycjG5tKNxnue/UQEaetlxWpI1pk=;
        b=Hxmj74KRaUDHF6LcLmGBbtwzqB6lmN9RiLrwyIIHVZxt4WwLQaLKfeFIloQ8hMirNn
         nzz5oY0Wl4d1vzj1IqM8ahl/SeVuHdH6C70QIsQNzNtTNPomp+qYbbsUri/0jmH2ZipL
         b5T6sUoTf/Rx/+zYgsKbUe/X/t3zzJchDhCVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692344105; x=1692948905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJDQ0Q6umiB4bUJMycjG5tKNxnue/UQEaetlxWpI1pk=;
        b=Np4czUQl+tfiRgAIip1SpYQkZj5CCzLtsXcP9wKrLgvXVIktT4XuZ3zqXKbBLJ4jYz
         gzTP11tw7FIaNi1hNA6osQ1NJpZrGyvU0WIH6hkgfNy9OMYTBr3SPW8M9f7+RdIBgNHL
         YW30coeRCaK+BH9QJCgAie9WKAFeCVrWpkdLcCwQvtCzf74Nk9z+m2JNdTgKby+D2HbB
         mdVGcUfel6dGjB2eil5Po7Q6PAcDRCg/ws+dlWRoNFo9O+j51FHtu9v+uUHhMIIY7nsu
         c01tdPIQvFAfvr20ZQYgOIIXFLBGY6C8dE8OvcczlU8uzrnpqD5Vu9/5lKsKQ22JLhyU
         qC6Q==
X-Gm-Message-State: AOJu0Yz/POl2e9Q2XDnrNbI/CInL/9mmmzpX7bqp7gCFEASyJES+EYOC
        i5Zsdd6T7M0LESXmhoZ/rT6Lkg==
X-Google-Smtp-Source: AGHT+IGvdG/gnXY9RxmZ0hYWbOFJy3DD5ZavoDeTknPRN2tPGgKeLAEbYTLh5AMwXXhkdHOTuFLcLQ==
X-Received: by 2002:a05:6a21:338e:b0:13a:bed2:948b with SMTP id yy14-20020a056a21338e00b0013abed2948bmr2317093pzb.43.1692344105258;
        Fri, 18 Aug 2023 00:35:05 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id c2-20020a62e802000000b00686fe7b7b48sm906041pfi.121.2023.08.18.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:35:04 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com, jshargo@chromium.org
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mairacanal@riseup.net,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de,
        airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org
Subject: Adds support for ConfigFS to VKMS!
Date:   Fri, 18 Aug 2023 07:29:25 +0000
Message-ID: <20230818073411.3414628-2-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since Jim is busy with other work and I'm working on some things that
rely on this, I've taken up the task of doing the iterations.  I've
addressed the comments as best I can (those replies are to each
individual change) and here is the patch set to go with those.

I added my own signoff to each commit, but I've left jshargo@ as the
author of all the commits he wrote.  I'm sure there is still more to
address and the ICT tests that were writtein parallel to this may also
need some additions, but I'm hoping we're in a good enough state to get
this in and iterate from there soon.

Since V3:
I've added hotplug support in the latest patch.  This has been reviewed some
and the notes from that review are addressed here as well.

Original Message:

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


