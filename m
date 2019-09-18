Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E3017D922
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfIROXO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:33184 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728507AbfIROXO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 05B47B67C;
        Wed, 18 Sep 2019 14:23:11 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/11] drm/vram: Add VRAM buffers for HW cursors
Date:   Wed, 18 Sep 2019 16:22:56 +0200
Message-Id: <20190918142307.27127-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset adds dedicated VRAM buffers and cleans up the memory
management of HW cursors in ast and mgag200.

The ast and mgag200 drivers support HW cursors of uncommon pixel formats.
Both drivers manage cursor memory in dedicated GEM VRAM buffer objects
with a double buffering scheme; either by alternating between two GEM BOs,
or by alternating between offsets within the same GEM BO. The code is
convoluted and can lead to memory fragmentation if the BO is stored the
middle of VRAM. This is especially a problem on devices with only a small
amount of video memory.

This patchset introduces VRAM buffers, a simple data structure that
manages dedicated areas of VRAM. The VRAM buffer supports double-
buffering (or more) to allow for flicker-free updates. A typical use
case is in managing small, static buffers, such as cursors or sprites.

The patchset then cleans up cursor memory management in ast and mgag200.
To avoid the fragmentation issue, at the high end of each device's VRAM,
a few KiB are reserved for the HW cursor. This memory is maintained by a
double-buffered VRAM buffer. For updating the cursor image, each driver's
cursor_set() functions fills the current back buffer and then makes it the
front buffer.

The patchset has been tested on ast and mgag200 hardware.

Thomas Zimmermann (11):
  drm/vram: Add struct drm_vram_buffer to VRAM helpers
  drm/ast: Don't call ast_show_cursor() from ast_cursor_move()
  drm/ast: Move cursor update code to ast_show_cursor()
  drm/ast: Reserve space for double-buffered cursor image
  drm/ast: Store cursor in reserved memory area
  drm/mgag200: Rename cursor functions to use mgag200_ prefix
  drm/mgag200: Add init and fini functions for cursor handling
  drm/mgag200: Add separate move-cursor function
  drm/mgag200: Move cursor-image update to mgag200_show_cursor()
  drm/mgag200: Reserve video memory for cursor plane
  drm/mgag200: Implement cursor buffer with struct drm_vram_buffer

 Documentation/gpu/drm-mm.rst             |  19 +-
 drivers/gpu/drm/ast/ast_drv.h            |   5 +-
 drivers/gpu/drm/ast/ast_mode.c           | 198 +++++++++--------
 drivers/gpu/drm/ast/ast_ttm.c            |  13 +-
 drivers/gpu/drm/drm_vram_helper_common.c | 259 ++++++++++++++++++++++-
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 252 +++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  24 +--
 drivers/gpu/drm/mgag200/mgag200_main.c   |  20 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |   6 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |  15 +-
 include/drm/drm_vram_helper.h            |  64 ++++++
 11 files changed, 607 insertions(+), 268 deletions(-)
 create mode 100644 include/drm/drm_vram_helper.h

--
2.23.0

