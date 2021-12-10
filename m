Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D37C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 18:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245275AbhLJSYQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 13:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbhLJSYQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 13:24:16 -0500
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B90C061746
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 10:20:41 -0800 (PST)
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id 922225FFAC;
        Fri, 10 Dec 2021 19:20:39 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH v2 0/3] Enrich amdgpu docs from recent threads
Date:   Fri, 10 Dec 2021 19:20:27 +0100
Message-Id: <20211210182030.3834-1-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series starts by splitting the amdgpu/index file to make some
room for additional contents.

The rest is basically bringing Alex' descriptions of the hardware and
driver internals into the doc.

Changes in v2:
* fix typos (Harry Wentland)
* get rid of double headings

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

