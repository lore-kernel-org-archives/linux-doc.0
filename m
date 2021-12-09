Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58296C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 23:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhLIXv0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 18:51:26 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:10662 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232760AbhLIXv0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Dec 2021 18:51:26 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id 712E65FE03;
        Fri, 10 Dec 2021 00:47:51 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH 0/3] Enrich amdgpu docs from recent threads
Date:   Fri, 10 Dec 2021 00:47:14 +0100
Message-Id: <20211209234717.8897-1-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series starts by splitting the amdgpu/index file to make some
room for additional contents, but I'm not really happy with the
result, we can certainly do better.

The rest is basically bringing Alex' descriptions of the hardware and
driver internals into the doc.

Yann Dirson (3):
  Documentation/gpu: split amdgpu/index for readability
  Documentation/gpu: include description of AMDGPU hardware structure
  Documentation/gpu: include description of some of the GC
    microcontrollers

 Documentation/gpu/amdgpu/driver-core.rst      | 181 +++++++++++
 Documentation/gpu/amdgpu/driver-misc.rst      | 112 +++++++
 Documentation/gpu/amdgpu/index.rst            | 298 +-----------------
 .../gpu/amdgpu/module-parameters.rst          |   7 +
 Documentation/gpu/amdgpu/ras.rst              |  62 ++++
 Documentation/gpu/amdgpu/thermal.rst          |  65 ++++
 6 files changed, 440 insertions(+), 285 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/driver-core.rst
 create mode 100644 Documentation/gpu/amdgpu/driver-misc.rst
 create mode 100644 Documentation/gpu/amdgpu/module-parameters.rst
 create mode 100644 Documentation/gpu/amdgpu/ras.rst
 create mode 100644 Documentation/gpu/amdgpu/thermal.rst

-- 
2.31.1

