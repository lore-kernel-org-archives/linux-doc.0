Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E8BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 13 Dec 2021 23:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242432AbhLMXai (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Dec 2021 18:30:38 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:16888 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242103AbhLMXah (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 13 Dec 2021 18:30:37 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id 73C065FF67;
        Tue, 14 Dec 2021 00:30:36 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH v3 0/4] Enrich amdgpu docs from recent threads
Date:   Tue, 14 Dec 2021 00:30:26 +0100
Message-Id: <20211213233030.6719-1-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is basically bringing Alex' descriptions of the hardware and
driver internals into the doc.

Changes in v3:
* camel case in titles (Rodrigo Siqueira)
* link DCN description to DC doc (Rodrigo Siqueira)
* links to email archive in commit messages (Rodrigo Siqueira)
* acronym expansion in intro (Rodrigo Siqueira)
* new commits for kerneldoc content fixes

Changes in v2:
* fix typos (Harry Wentland)
* get rid of double headings

Yann Dirson (4):
  Documentation/gpu: include description of AMDGPU hardware structure
  Documentation/gpu: include description of some of the GC
    microcontrollers
  amdgpu: fix some kernel-doc markup
  amdgpu: fix some comment typos

 Documentation/gpu/amdgpu/display/index.rst    |   2 +
 Documentation/gpu/amdgpu/driver-core.rst      | 117 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c            |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 include/uapi/drm/amdgpu_drm.h                 |   2 +-
 8 files changed, 128 insertions(+), 9 deletions(-)

-- 
2.31.1

