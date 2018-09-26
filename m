Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 967337D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Sep 2018 05:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbeIZLME (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Sep 2018 07:12:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53554 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbeIZLME (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Sep 2018 07:12:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BA809263B51
From:   Helen Koike <helen.koike@collabora.com>
To:     dm-devel@redhat.com
Cc:     agk@redhat.com, snitzer@redhat.com, linux-kernel@vger.kernel.org,
        enric.balletbo@collabora.com, wad@chromium.org,
        linux-doc@vger.kernel.org, linux-lvm@redhat.com,
        kernel@collabora.com
Subject: [PATCH 0/2] boot to a mapped device
Date:   Wed, 26 Sep 2018 02:00:45 -0300
Message-Id: <cover.1537936397.git.helen.koike@collabora.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is reviving an old patchwork.
Booting from a mapped device requires an initramfs. This series is
allows for device-mapper targets to be configured at boot time for
use early in the boot process (as the root device or otherwise).

Example, the following could be added in the boot parameters.
dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0

Enric Balletbo i Serra (1):
  dm ioctl: add a device mapper ioctl function.

Will Drewry (1):
  init: add support to directly boot to a mapped device

 .../admin-guide/kernel-parameters.rst         |   1 +
 .../admin-guide/kernel-parameters.txt         |   3 +
 Documentation/device-mapper/dm-boot.txt       |  63 +++
 drivers/md/dm-ioctl.c                         |  50 ++
 include/linux/device-mapper.h                 |   6 +
 init/Makefile                                 |   1 +
 init/do_mounts.c                              |   1 +
 init/do_mounts.h                              |  10 +
 init/do_mounts_dm.c                           | 475 ++++++++++++++++++
 9 files changed, 610 insertions(+)
 create mode 100644 Documentation/device-mapper/dm-boot.txt
 create mode 100644 init/do_mounts_dm.c

-- 
2.19.0

