Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCCEC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 08:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhLVI2o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Dec 2021 03:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48112 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhLVI2n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 03:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640161723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=E4JXbmbKDkqfAMNbIkv/r6xGh5or/gMN+DXKn1vGRis=;
        b=BcRIfC/Fb0vUofEyunt+GN4JYY4MaqaSfBiOEDjT73jF4ps9M6g0peKTYgacxJZGoWeM/J
        DA2ErGz/d1iV7dFm09FOqSQkOU34QeURkzJ4LI3zZVXKzm1enHcpzzTJ+UDrx2vMgRgpzV
        90q6SILFbq5IewG9K5d+bZV+HMjRENI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-w18qHeQuMRix6CpZPfQW4g-1; Wed, 22 Dec 2021 03:28:42 -0500
X-MC-Unique: w18qHeQuMRix6CpZPfQW4g-1
Received: by mail-wm1-f72.google.com with SMTP id r2-20020a05600c35c200b00345c3b82b22so743875wmq.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 00:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4JXbmbKDkqfAMNbIkv/r6xGh5or/gMN+DXKn1vGRis=;
        b=TZ1VkmdZTPlhXZk2K6ZiDuc8HvAaAIpMG30iqRuTYX5cx2FrxNQ7CAb3kvXa1EiK+o
         Di0CqN3TXVJo0a0F4FBEr1pkPa+z28f1hnBXGw8llA3C6zmpH9QdS7/WgvVzdDHT89zj
         9ne5mUkyGGDFWc7dxq8iT0PhEQk+Vs4XVGLz9wx5m3RQuezZ7podSlvnI/vwndhBifJk
         i4s8y5rYvOEGISRXYU82bZIOITLuUKO8X4IpecjGosDvs5kOkEX9nUONBktFagSwWCVk
         Us7NIInGIo8uTd/vpSId3SZ8vt6pCJcJfTHVCBtrSn4EFZlc9/xMtzqSyC2cetPIyFH8
         X//A==
X-Gm-Message-State: AOAM532ZtcgwIG4eYEUKmdiR+oO0adgoD0LG4nDxwY1CjiR/qC0G922s
        Z4qpqnlqlqlauM+DhVqJ2VSTa32TfXvZXoRdFHgMXhMcTIlg2QVaeyqwcLJyjlDhj2DUX2lO7+Z
        Gi6yNGJ4Rs7YT91Hfcywl
X-Received: by 2002:adf:80ca:: with SMTP id 68mr1271924wrl.528.1640161720886;
        Wed, 22 Dec 2021 00:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkoCJtHVX3pDhOPdiUKxxW7/e5x5c7YtwSOGtxy8UoUjYgTN5fseYcbOxjAI29EVId5+1dNg==
X-Received: by 2002:adf:80ca:: with SMTP id 68mr1271896wrl.528.1640161720623;
        Wed, 22 Dec 2021 00:28:40 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 00:28:40 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Fabio Estevam <festevam@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset parameter
Date:   Wed, 22 Dec 2021 09:28:21 +0100
Message-Id: <20211222082831.196562-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The nomodeset kernel command line parameter is used to prevent the KMS/DRM
drivers to be registered/probed. But only a few drivers implement support
for this and most DRM drivers just ignore it.

This patch series is a v3 to make DRM drivers to honour nomodeset. It is
posted as separate patches to make easier for drivers maintainers to ack
or pick them independently at their own pace.

The drm_module_{pci,platform}_driver() helper macros are added, which are
just wrappers around module_{pci,platform}_driver() but adding a check for
drm_firmware_drivers_only() and returning -ENODEV if that is true.

PCI and platform DRM drivers are then modified in the following patches to
make use of those macros.

Only KMS drivers will be ported to use these new macros, and only for PCI
and platform DRM drivers. A follow-up series might do the same for drivers
that are rendering-only and for USB/SPI/I2C devices, but it will need more
discussion to agree whether that's desirable or not.

Not all drivers were posted in v3 to avoid flooding the list with too many
patches. I'm only including the patches adding the macros and some patches
as an example of their usage.

I've built tested with 'make allmodconfig && make M=drivers/gpu/drm' but I
don't have hardware to test the drivers, so review/testing is appreciated.

Best regards,
Javier

Changes in v3:
- Include Thomas Zimmermann's patches in the series and rebase on top.
- Add collected Acked-by tags from v2.

Changes in v2:
- Add drm_module_{pci,platform}_driver() macros and put the check there
  (Thomas Zimmermann).
- Use the drm_module_*_driver() macros if possible (Thomas Zimmermann).
- Leave the DRM drivers that don't set the DRIVER_MODESET driver feature
  (Lucas Stach).
- Leave USB/SPI/I2C drivers and only include PCI and platform ones
  (Noralf Trønnes).
- Add collected Reviewed-by tags

Javier Martinez Canillas (5):
  drm: Provide platform module-init macro
  drm/imx/dcss: Replace module initialization with DRM helpers
  drm/komeda: Replace module initialization with DRM helpers
  drm/arm/hdlcd: Replace module initialization with DRM helpers
  drm/malidp: Replace module initialization with DRM helpers

Thomas Zimmermann (5):
  drm: Provide PCI module-init macros
  drm/ast: Replace module-init boiler-plate code with DRM helpers
  drm/bochs: Replace module-init boiler-plate code with DRM helpers
  drm/cirrus: Replace module-init boiler-plate code with DRM helpers
  drm/hisilicon/hibmc: Replace module initialization with DRM helpers

 Documentation/gpu/drm-internals.rst           |   6 +
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   3 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   3 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  18 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   3 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |   3 +-
 drivers/gpu/drm/tiny/bochs.c                  |  20 +--
 drivers/gpu/drm/tiny/cirrus.c                 |  17 +--
 include/drm/drm_module.h                      | 125 ++++++++++++++++++
 10 files changed, 147 insertions(+), 54 deletions(-)
 create mode 100644 include/drm/drm_module.h

-- 
2.33.1

