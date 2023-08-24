Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFABC3DA6F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 08:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbjHXIoi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 04:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240588AbjHXIoW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 04:44:22 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F356F1739
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:00 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-26fb8225268so821078a91.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692866640; x=1693471440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9yjcEfs2OFrUeBpnL2ajQE3l0qYqeBYQoYwLcaGsKQ=;
        b=DFvh/wKLGcXlv5D9In26iDuLC0aD9R5iukoxmW8IrfmwGz0uQLumNxZLniCMJcONbr
         43s36PB/3Bi93GdSd807VcLcE6Q15KutpqOKpKp0oUvWM9v1IQeRowNe/lktpecv2o9I
         NK+AjhE2A5ucQpZLaG6wWuKKJV0Qo7SJZ/+Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866640; x=1693471440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9yjcEfs2OFrUeBpnL2ajQE3l0qYqeBYQoYwLcaGsKQ=;
        b=g6WNyFTH8clU43m2WlFKWP9ZMUmEttVc5Sh1U+7AtQDzZjj/fVT/UvWsj1wxjYB0ec
         CCWjKtOslOmgDaQAVzAf3GUGQj3lYcP0osvmqv+j6QCt5lU23E6bBozC/5gva8A84uGD
         xudjYXjoPoF4AOmKsdWemdkNQQr12Q1Z4J1EScJL2Cmi+jI0B6SeghkQyqfEbMguk4/0
         X8YaPFxG4qBGkHQNmVBf9AeF/50B5L25neeEvE8y5QOJqMF2QRDketMkkp7gZUMbES/1
         G0yg01Q1yWJfdTvKsUtEaLeKQxUhLlEHv900Lk+h0bj6BnxyxmwtwnlJb/coabykwDh4
         eeZQ==
X-Gm-Message-State: AOJu0YxpyO+jzJTvy0uGNQmCzGc3I9ZSb93xaZ36pIaMG1sTmNa6WS1E
        psoi7G86X2nG8BojC0nH5CT72Q==
X-Google-Smtp-Source: AGHT+IHGy90y1dicpE2qaM/R53DR7qOXY+58m9LmWY0PWcbYHXJaczn5XyI9/K5jArmR9OEYZloe1w==
X-Received: by 2002:a17:90a:df07:b0:268:5bed:708e with SMTP id gp7-20020a17090adf0700b002685bed708emr10757082pjb.24.1692866640376;
        Thu, 24 Aug 2023 01:44:00 -0700 (PDT)
Received: from datalore.c.googlers.com.com (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
        by smtp.gmail.com with ESMTPSA id 12-20020a17090a194c00b00268188ea4b9sm1150216pjh.19.2023.08.24.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 01:44:00 -0700 (PDT)
From:   Brandon Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com, jshargo@chromium.org
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mairacanal@riseup.net,
        melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de,
        airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mduggan@chromium.org,
        hirono@chromium.org, Brandon Pollack <brpol@chromium.org>
Subject: [PATCH v4 0/7] Adds support for ConfigFS to VKMS!
Date:   Thu, 24 Aug 2023 08:40:31 +0000
Message-ID: <20230824084350.1062579-1-brpol@chromium.org>
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

Since V4:
========
Fixed up some documentation as suggested by Marius
Fixed up some bad locking as suggested by Marius
Small fixes here and there (most have email responses to previous chain
emails)

Since V3:
========
I've added hotplug support in the latest patch.  This has been reviewed some
and the notes from that review are addressed here as well.

Relevant/Utilizing work:
=======================
I've built a while test framework based on this as proof it functions (though
I'm sure there may be lingering bugs!).  You can check that out on
crrev.com if you are interested and need to get started yourself (but be
aware of any licensing that may differ from the kernel itself!  Make
sure you understand the license:

https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/LICENSE

That said, you can see the changes in review on the crrev gerrit:

https://chromium-review.googlesource.com/c/chromiumos/platform/tast-tests/+/4666669

Outro:
=====
I really appreciate everyone's input and tolerance in getting these
changes in.  Jim's first patch series was this, and other than some
small cleanups and documentation, taking over it is also mine.

Thank you everyone :)

Brandon Pollack (1):
  drm/vkms Add hotplug support via configfs to VKMS.

Jim Shargo (6):
  drm/vkms: Back VKMS with DRM memory management instead of static
    objects
  drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
  drm/vkms: Provide platform data when creating VKMS devices
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support enabling ConfigFS devices
  drm/vkms: Add a module param to enable/disable the default device

 Documentation/gpu/vkms.rst            |  20 +-
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 721 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 403 ++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  31 +-
 11 files changed, 1506 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.42.0.rc1.204.g551eb34607-goog

