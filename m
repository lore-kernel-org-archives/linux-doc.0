Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4555DC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 23:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhLIXvj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 18:51:39 -0500
Received: from smtp5-g21.free.fr ([212.27.42.5]:12146 "EHLO smtp5-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232760AbhLIXvj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Dec 2021 18:51:39 -0500
Received: from localhost.localdomain (unknown [88.120.44.86])
        by smtp5-g21.free.fr (Postfix) with ESMTP id 87DC35FF96;
        Fri, 10 Dec 2021 00:48:04 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     amd-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        linux-doc@vger.kernel.org, Yann Dirson <ydirson@free.fr>
Subject: [PATCH 3/3] Documentation/gpu: include description of some of the GC microcontrollers
Date:   Fri, 10 Dec 2021 00:47:17 +0100
Message-Id: <20211209234717.8897-4-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211209234717.8897-1-ydirson@free.fr>
References: <20211209234717.8897-1-ydirson@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is Alex' description from the "Looking for clarifications around gfx/kcq/kiq"
thread, edited to fit as ReST.

Originally-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yann Dirson <ydirson@free.fr>
---
 Documentation/gpu/amdgpu/driver-core.rst | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
index 909b13fad6a8..453566c280c5 100644
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -75,6 +75,28 @@ VCN (Video Core Next)
     decode.  It's exposed to userspace for user mode drivers (VA-API,
     OpenMAX, etc.)
 
+Graphics and Compute microcontrollers
+-------------------------------------
+
+CP (Command Processor)
+    The name for the hardware block that encompasses the front end of the
+    GFX/Compute pipeline.  Consists mainly of a bunch of microcontrollers
+    (PFP, ME, CE, MEC).  The firmware that runs on these microcontrollers
+    provides the driver interface to interact with the GFX/Compute engine.
+
+    MEC (MicroEngine Compute)
+        The is the microcontroller that controls the compute queues on the
+        GFX/compute engine.
+
+    MES (MicroEngine Scheduler)
+        This is a new engine for managing queues.  This is currently unused.
+
+RLC (RunList Controller)
+    This is another microcontroller in the GFX/Compute engine.  It handles
+    power management related functionality within the GFX/Compute engine.
+    The name is a vestige of old hardware where it was originally added
+    and doesn't really have much relation to what the engine does now.
+
 Driver structure
 ================
 
@@ -82,6 +104,19 @@ In general, the driver has a list of all of the IPs on a particular
 SoC and for things like init/fini/suspend/resume, more or less just
 walks the list and handles each IP.
 
+Some useful constructs:
+
+KIQ (Kernel Interface Queue)
+    This is a control queue used by the kernel driver to manage other gfx
+    and compute queues on the GFX/compute engine.  You can use it to
+    map/unmap additional queues, etc.
+
+IB (Indirect Buffer)
+    A command buffer for a particular engine.  Rather than writing
+    commands directly to the queue, you can write the commands into a
+    piece of memory and then put a pointer to the memory into the queue.
+    The hardware will then follow the pointer and execute the commands in
+    the memory, then returning to the rest of the commands in the ring.
 
 .. _amdgpu_memory_domains:
 
-- 
2.31.1

