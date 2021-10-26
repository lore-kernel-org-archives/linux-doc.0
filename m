Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABC9C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB2AC60F92
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 08:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234326AbhJZIeK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 04:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbhJZIeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 04:34:09 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA927C061767
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:45 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 65so13042122ljf.9
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hvjBpS0WQUpHH6xnR9S7oADkbGeXX564pPdc4gb5058=;
        b=VZcjvQUL5lvIUQb7JbjlWotIYeRbEvfm5KDsiTM3mSpS4I5z/RcS3NbV75bZbHlTp7
         LQcIJRuiLdhEklLz2y7Ca8kne37wZk5Ruqr9O+IePFhNMcaSi+9kdW4NDTTmcMeacCnR
         l9XQ+tFYGPMNyI9obP1G/xDghH4J4bgVe533MjaSFxH2XxPVItbqio9DpAhbzDfG61iP
         sgbPcY+WBijIyh8ymmeOjSAvNOMtaVSiXyFKy/y9uw/OpyRJiZ5rDQsTceQrnI4gMoDK
         4H2fMckERh/J+BnK8QwmWie/zThPezP0IRy0Gn238hR1xAKPlWUm1cqA3NKGCmUjJ1fr
         cMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hvjBpS0WQUpHH6xnR9S7oADkbGeXX564pPdc4gb5058=;
        b=2mVhTrOreim4Z6wOTf04BC+HRhvZq+lO8fsEB4xlJpElQ8fS3dXda5FiEjukCfLgFT
         OJjqO0wVOnUwBXolaq5FytSTG/n+8rnQOYkSnQ5vZxyElB1z24HSiAJnjDa0qeMxWAd7
         o5du53hg634wkt5dhKA0yphnfpUcv/NB0SyfC+1oDQ9+nxCaknMyPVFPsVYhiREQDPOC
         K8/9c5lqdn7vnqqHcnlvh9hbyy5HBdmZFV4lWAqYjxrPUc/eQDaQDb7VRJ1PubfUIqzd
         kBWTxY/lJOtQCVHKWfjkN1cGBEu2ftbCjrGGBVfzDw9FCSrgtJdq+dmaAlakFWBXG6Ny
         qG6A==
X-Gm-Message-State: AOAM531PIohrhs6DjSIn+xmFbyAtwEv1yovugomEgX37LTsE4uDY1pH5
        N+WQMbi8JjvlZH/OiNAJf49YOkD/gRMiorUZ
X-Google-Smtp-Source: ABdhPJzsA7vMWo/V630/oC1Bt0cC2WhkKii/4cRJucj3IpqEe90SIEX/iuuHl24z8jwZtEvJNccrHA==
X-Received: by 2002:a05:651c:1506:: with SMTP id e6mr24696526ljf.129.1635237104122;
        Tue, 26 Oct 2021 01:31:44 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id e4sm1944598ljn.131.2021.10.26.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 01:31:43 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>, jens.vankeirsbilck@kuleuven.be,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 0/6] Asynchronous notifications from secure world
Date:   Tue, 26 Oct 2021 10:31:32 +0200
Message-Id: <20211026083138.1818705-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This adds support for asynchronous notifications from OP-TEE in secure
world to the OP-TEE driver. This allows a design with a top half and bottom
half type of driver where the top half runs in secure interrupt context and
a notifications tells normal world to schedule a yielding call to do the
bottom half processing.

An edge-triggered interrupt is used to notify the driver that there are
asynchronous notifications pending.

Only the SMC based ABI of the OP-TEE driver gains asynchronous
notifications. Future support for asynchronous notifications in the FF-A
based ABI will rely on APIs which are expected to be provided by the FF-A
driver in a not too distant future.

Most of the patches here are well reviewed, but the last patch "optee: add
asynchronous notifications" could do with some more attention.

This patchset is also available at
https://git.linaro.org/people/jens.wiklander/linux-tee.git/log/?h=async_notif_v7

v6->v7:
* Rebased on 4615e5a34b95 ("optee: add FF-A support") in
  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git with
  34f3c67b8178 ("optee: smc_abi.c: add missing #include <linux/mm.h>")
  cherry-picked on top. This allows to resolve the conflicts with
  pull request "[GIT PULL] OP-TEE FF-A for V5.16"
* Factored out the interrupt handling added in "optee: add asynchronous
  notifications" to only go into smb_abi.c. A different approach is
  expected with FF-A once it has asynchronous notifications.
* Addressed review comments from Sumit Garg:
  - Replaced 0 and 1 with the macros GIC_SPI and IRQ_TYPE_EDGE_RISING in
    the example in the bindings.
  - Replaced the magic number to optee_notif_init() with
    OPTEE_DEFAULT_MAX_NOTIF_VALUE in the commit "optee: separate notification
    functions"
  - Switched back to tagged error path in optee_probe()
  - Fixed a few nits in "optee: add asynchronous notifications"
  - Applied Sumit's Reviewed-by on all commits but the last,
    "optee: add asynchronous notifications"

v5->v6:
* Rebased on v5.15-rc2
* Replaced "tee: add tee_dev_open_helper() primitive" with "tee: export
  teedev_open() and teedev_close_context()" since it turned out that the
  normal teedev functions could be used instead as noted by Sumit.
* Changed "optee: add asynchronous notifications" to use the exported
  teedev_open() and teedev_close_context() functions instead.

v4->v5:
* Rebased on v5.14-rc7
* Updated documentation to clarify that one interrupt may represent multiple
  notifications as requested.
* Applied Marc's and Rob's tags

v3->v4:
* Clarfied the expected type of interrypt is edge-triggered, both in
  the normal documentation and in the DT bindings as requested.

v2->v3:
* Rebased on v5.14-rc2 which made the patch "dt-bindings: arm: Convert
  optee binding to json-schema" from the V2 patch set obsolete.
* Applied Ard's Acked-by on "optee: add asynchronous notifications"

v1->v2:
* Added documentation
* Converted optee bindings to json-schema and added interrupt property
* Configure notification interrupt from DT instead of getting it
  from secure world, suggested by Ard Biesheuvel <ardb@kernel.org>.

Thanks,
Jens



Jens Wiklander (6):
  docs: staging/tee.rst: add a section on OP-TEE notifications
  dt-bindings: arm: optee: add interrupt property
  tee: fix put order in teedev_close_context()
  tee: export teedev_open() and teedev_close_context()
  optee: separate notification functions
  optee: add asynchronous notifications

 .../arm/firmware/linaro,optee-tz.yaml         |   7 +
 Documentation/staging/tee.rst                 |  30 +++
 drivers/tee/optee/Makefile                    |   1 +
 drivers/tee/optee/core.c                      |   2 +-
 drivers/tee/optee/ffa_abi.c                   |   6 +-
 drivers/tee/optee/notif.c                     | 125 +++++++++
 drivers/tee/optee/optee_msg.h                 |   9 +
 drivers/tee/optee/optee_private.h             |  28 ++-
 drivers/tee/optee/optee_rpc_cmd.h             |  31 +--
 drivers/tee/optee/optee_smc.h                 |  75 +++++-
 drivers/tee/optee/rpc.c                       |  71 +-----
 drivers/tee/optee/smc_abi.c                   | 238 +++++++++++++++---
 drivers/tee/tee_core.c                        |  10 +-
 include/linux/tee_drv.h                       |  14 ++
 14 files changed, 522 insertions(+), 125 deletions(-)
 create mode 100644 drivers/tee/optee/notif.c

-- 
2.31.1

