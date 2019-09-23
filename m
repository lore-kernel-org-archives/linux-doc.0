Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 126037D92A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440165AbfIWR2C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:46358 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2439938AbfIWR2C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A977BB618;
        Mon, 23 Sep 2019 17:27:59 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/12] drm/ast/mgag200: Place cursor BOs at VRAM high-end
Date:   Mon, 23 Sep 2019 19:27:41 +0200
Message-Id: <20190923172753.26593-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(was: drm/vram: Add VRAM buffers for HW cursors)

This patchset cleans up the memory management of HW cursors in ast and
mgag200. It further moves the allocated cursor BOs to the of the video
RAM to reduce memory fragmentation.

The ast and mgag200 drivers support HW cursors of uncommon pixel formats.
Both drivers manage cursor memory in dedicated GEM VRAM buffer objects
with a double buffering scheme; either by alternating between two GEM BOs,
or by alternating between offsets within the same GEM BO. The code is
convoluted and can lead to memory fragmentation if the BO is stored the
middle of VRAM. This is especially a problem on devices with only a small
amount of video memory.

With this patchset, the cursor handling in ast and mgag200 is first split
up into separate functions for copying cursor images, managing buffer
objects, setting scanout addresses, and moving and hiding the cursor.
Furthermore, each driver dedicates a few KiB at the high end of each
device's video memory to storing the cursor's buffer objects. This reduces
memory fragmentation, which may prevent displaying the framebuffer on
low-memory devices.

The patchset has been tested on ast and mgag200 hardware.

v2:
	* remove VRAM buffers in favor of GEM BOs
	* manage BO placement with pin flag

Thomas Zimmermann (12):
  drm/vram: Support top-down placement flag
  drm/ast: Don't call ast_show_cursor() from ast_cursor_move()
  drm/ast: Move cursor update code to ast_show_cursor()
  drm/ast: Move cursor offset swapping into ast_show_cursor()
  drm/ast: Allocate cursor BOs at high end of video memory
  drm/mgag200: Rename cursor functions to use mgag200_ prefix
  drm/mgag200: Add init and fini functions for cursor handling
  drm/mgag200: Add separate move-cursor function
  drm/mgag200: Move cursor-image update to mgag200_show_cursor()
  drm/mgag200: Move cursor BO swapping into mgag200_show_cursor()
  drm/mgag200: Reserve video memory for cursor plane
  drm/mgag200: Allocate cursor BOs at high end of video memory

 drivers/gpu/drm/ast/ast_drv.h            |  43 +--
 drivers/gpu/drm/ast/ast_mode.c           | 235 +++++++++--------
 drivers/gpu/drm/drm_gem_vram_helper.c    |  14 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 316 ++++++++++++++---------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  22 +-
 drivers/gpu/drm/mgag200/mgag200_main.c   |  20 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |   6 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |   4 +
 include/drm/drm_gem_vram_helper.h        |   1 +
 9 files changed, 387 insertions(+), 274 deletions(-)

--
2.23.0

