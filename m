Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 01AB47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Sep 2019 13:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbfIINE6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Sep 2019 09:04:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:38486 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725897AbfIINE6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Sep 2019 09:04:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C4625ABCB;
        Mon,  9 Sep 2019 13:04:56 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie,
        corbet@lwn.net, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] Merge VRAM MM and GEM VRAM source files
Date:   Mon,  9 Sep 2019 15:04:49 +0200
Message-Id: <20190909130453.6718-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

VRAM MM and GEM VRAM are only used with each other. This patch set
moves VRAM MM into GEM VRAM source files and cleans up the helper's
public interface.

Thomas Zimmermann (4):
  drm/vram: Move VRAM memory manager to GEM VRAM implementation
  drm/vram: Have VRAM MM call GEM VRAM functions directly
  drm/vram: Unexport internal functions of VRAM MM
  drm/vram: Unconditonally set BO call-back functions

 Documentation/gpu/drm-mm.rst                  |  12 -
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   1 -
 drivers/gpu/drm/ast/ast_main.c                |   1 -
 drivers/gpu/drm/ast/ast_ttm.c                 |   3 +-
 drivers/gpu/drm/bochs/bochs.h                 |   1 -
 drivers/gpu/drm/bochs/bochs_mm.c              |   3 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         | 361 ++++++++++++++----
 drivers/gpu/drm/drm_vram_helper_common.c      |   8 +-
 drivers/gpu/drm/drm_vram_mm_helper.c          | 309 ---------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   |   3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h         |   1 -
 drivers/gpu/drm/mgag200/mgag200_ttm.c         |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.h          |   2 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |   3 +-
 include/drm/drm_gem_vram_helper.h             |  90 ++++-
 include/drm/drm_vram_mm_helper.h              | 108 ------
 18 files changed, 375 insertions(+), 538 deletions(-)
 delete mode 100644 drivers/gpu/drm/drm_vram_mm_helper.c
 delete mode 100644 include/drm/drm_vram_mm_helper.h

--
2.23.0

