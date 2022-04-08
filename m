Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0860C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 16:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiDHQPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiDHQPv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 12:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0B148541BD
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649434422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FxweDGdSiPFYVaaLK6PgKCqH4/CRdU5joOpSS8tgup8=;
        b=fyjC2baQzHeTf5WZ70coqgwy2lD9TA4hJa0Kg6qJOw5jqTKIBMPoDZK/4JUqHaMrPWc4Nj
        7aftaHf1YTVV/31ly/BXWV/AvSqKWaXemGUBIrQRlahXNbScieCEBrxgz9aEHDS1EvxkWa
        EvLAU3U7HErSgQimwgWwpiHcrtEDfV4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-aRdZZpRYOt-42O5ECAAedA-1; Fri, 08 Apr 2022 12:13:41 -0400
X-MC-Unique: aRdZZpRYOt-42O5ECAAedA-1
Received: by mail-wm1-f69.google.com with SMTP id n21-20020a05600c4f9500b0038e3b0aa367so4269737wmq.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 09:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FxweDGdSiPFYVaaLK6PgKCqH4/CRdU5joOpSS8tgup8=;
        b=Io+L/Gr0caRbMyAKv8D+B+cQPhEQrMHq773muZb5hh7LR7Stj4iEphNiq2SFI3Z4my
         3OPjIIjvK7Z8hHaBPX/VV0LeV16ys4t9Cg0BOM03bauQGAQD8EggO1Ig4eexv3dz1yV4
         Zi4W4G9d/e3ppsimtQTcw/PoGkXOsk8DTHV/9ZqzlvYGKCcjc6lh56aLGKqoVhlkH5oN
         mxbkOyU9FCE2anQ/CvLVeag9uByNr6ACJ2/mJhUj9JHI0BuRBwCLvBxbeCo965Zz9gjq
         wqgHhbAP3F9ARRAE75GQAx9ndhGi9e7x6bIvB6hNpp7t8MtweGqelEkas603igck1GVB
         7wUw==
X-Gm-Message-State: AOAM530b4crkmnMKcJ1lay4vO1P9Sam4RHxosmsvsDpCRWKLNQ8Av/SN
        S+g9D5zxNj1sdC8qPm9fHPiF4GOeUSutlZjS3uj9EHspHfk9zRqkK1fXc92AvEkIBy3MERu8kkv
        TxtnUxTTWwRbHNlUI37Yp
X-Received: by 2002:a5d:5918:0:b0:207:9b1d:d577 with SMTP id v24-20020a5d5918000000b002079b1dd577mr1401027wrd.263.1649434419784;
        Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGuPJtm+OK8CRzVMa6iObLDan7gUZy/Va2rhrxWCO/ThvzUASQ21sgFx01F5fPgAK4DQEKmw==
X-Received: by 2002:a5d:5918:0:b0:207:9b1d:d577 with SMTP id v24-20020a5d5918000000b002079b1dd577mr1400995wrd.263.1649434419456;
        Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t15-20020adfeb8f000000b002060d26c211sm14377455wrn.114.2022.04.08.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:13:39 -0700 (PDT)
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
        Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v2 0/5] Fix some race conditions that exists between fbmem and sysfb
Date:   Fri,  8 Apr 2022 18:13:17 +0200
Message-Id: <20220408161322.270176-1-javierm@redhat.com>
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

This is a v2 that addresses issues in v1 pointed out by Daniel.

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
 drivers/video/fbdev/core/fbmem.c              | 57 ++++++++++----
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/linux/fb.h                            |  1 -
 include/linux/sysfb.h                         | 29 +++++--
 8 files changed, 150 insertions(+), 58 deletions(-)

-- 
2.35.1

