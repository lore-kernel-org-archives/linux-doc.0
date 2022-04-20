Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE54C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Apr 2022 08:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbiDTI4E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Apr 2022 04:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355414AbiDTI4D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 04:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 905513B2A7
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650444796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=E0YhsAgzYjv+lmX1BaJJCZkRLt/I7LvOa39GZEIhqUY=;
        b=Mx6Q8Gin59B4iHh1wHy2Da5V5QSje/Ei3YMOIG5XGUOeBkFRoz9u4jaxx9SSTzSGvUNVM2
        ebUm5lHlsK75JSv8tP+TWJR0NpmcZ/8vXMM35Q16zbfPlvxfmzzjh7bg9JKaentBvr0OvC
        rbZq8gfgHCUlh7jMEavMdXCp+2JqRnM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-YnqR2I4hMNK_Evi0WasKMQ-1; Wed, 20 Apr 2022 04:53:15 -0400
X-MC-Unique: YnqR2I4hMNK_Evi0WasKMQ-1
Received: by mail-wm1-f69.google.com with SMTP id r9-20020a1c4409000000b0038ff033b654so658798wma.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 01:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E0YhsAgzYjv+lmX1BaJJCZkRLt/I7LvOa39GZEIhqUY=;
        b=LXVZzdES6JzyX6E19fG+PPyPYE7RA4WTIkXAGmfQAIlFf0K8aaVyTebutXy2zlEPQ0
         13GUrJ9HJO88p4DEyAxWmtPtiUz/YM5eDlozYZI+lkPAhoE4IN99Rbvx4SZRwOboXeSb
         fyR+/4QuKWnAa3TDoonu71CqmdWJuiQXGCnluHiIXCbbhREVo5jiHqtdi4TDUxA1KKoA
         bbkRwZbGjyIa34Z7yZ5y5xoeeGK5+HAjdFQfIWG/SOPxp6VLJMMwBIfmM8xcTTe7gK3+
         gr0QKjbfVrfq+7eSW0HyFevHMUca7x6k9ABdXydbPxQEGJA5TdSu1ifhqrNAVZJtJUXI
         j8Dw==
X-Gm-Message-State: AOAM533t8Aj9+BoIs+XsOhqzRbmmvJEBxCTdbY7SP25106KmY1G2/VpA
        OH9GjN9WBOMCHIVApq7fDYFTX+Gk/aU5rd5E5rPRCYfhW3dCfA6lPUE38r6heYSq6u5YrFL2/pF
        nQQ9y3doo7IRdUOF1IDNQ
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id a24-20020a1cf018000000b0037bc13c3128mr2496893wmb.157.1650444794362;
        Wed, 20 Apr 2022 01:53:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxheIU3MZtHSmbm2S30h9XB//sGVs+fBzUrdX6TE0Ye/x/JWHfdB5GuD6LrNgo08kTzLr689Q==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id a24-20020a1cf018000000b0037bc13c3128mr2496874wmb.157.1650444794081;
        Wed, 20 Apr 2022 01:53:14 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b0020aac00f862sm1895343wry.98.2022.04.20.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 01:53:13 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Borislav Petkov <bp@suse.de>,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Yizhuo Zhai <yzhai003@ucr.edu>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 0/5] Fix some race conditions that exists between fbmem and sysfb
Date:   Wed, 20 Apr 2022 10:52:58 +0200
Message-Id: <20220420085303.100654-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

The patches in this series are mostly changes suggested by Daniel Vetter
to fix some race conditions that exists between the fbdev core (fbmem)
and sysfb with regard to device registration and removal.

For example, it is currently possible for sysfb to register a platform
device after a real DRM driver was registered and requested to remove the
conflicting framebuffers.

A symptom of this issue, was worked around with by commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted.

This series attempt to fix it more properly and revert the mentioned hack.
That will also unblock a pending patch to not make the num_registered_fb
variable visible to drivers anymore, since that's internal to fbdev core.

Patch #1 is just a trivial preparatory change.

Patch #2 add sysfb_disable() and sysfb_try_unregister() helpers for fbmem
to use them.

Patch #3 changes how is dealt with conflicting framebuffers unregistering,
rather than having a variable to determine if a lock should be take, it
just drops the lock before unregistering the platform device.

Patch #4 fixes the mentioned race conditions and finally patch #5 is the
revert patch that was posted by Daniel before but he dropped from his set.

The patches were tested on a rpi4 using different video configurations:
(simpledrm -> vc4 both builtin, only vc4 builtin, only simpledrm builtin
and simpledrm builtin with vc4 built as a module).

Best regards,
Javier

Changes in v3:
- Rebase on top of latest drm-misc-next branch.

Changes in v2:
- Rebase on top of latest drm-misc-next and fix conflicts (Daniel Vetter).
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Drop RFC prefix since patches were already reviewed by Daniel Vetter.
- Add Daniel Reviewed-by tags to the patches.

Daniel Vetter (1):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"

Javier Martinez Canillas (4):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Fix some race conditions between fbmem and sysfb

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 77 +++++++++++++++++--
 drivers/firmware/sysfb_simplefb.c             | 16 ++--
 drivers/video/fbdev/core/fbmem.c              | 62 ++++++++++++---
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/linux/fb.h                            |  1 -
 include/linux/sysfb.h                         | 29 +++++--
 8 files changed, 158 insertions(+), 55 deletions(-)

-- 
2.35.1

