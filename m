Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF8E1E4AB
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 18:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739991310; cv=none; b=lq5AdUWs472af6M6OK/t301hpbT9seau1/lGyVOK8OdOhlgX64iwrfYPtUgqvyEtyKnRryJ1FfJeKBVlogQymFFSUeuiQgGNBrLCPFKKWHlIncQ9xBX2L+Pqd48Ytz4iuuS8f13q/pnDzvLGG9kmGKcsr2NJKjagtQk5FGyD5Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739991310; c=relaxed/simple;
	bh=+nVAeMzAmxyS7BmFOQ9YfEMpBoqxdx/xia83ZJmB8P0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CazVhp2Yspd0VVpo+5MykyCtGHJXOHmSiFNxdavZ44onwg+k/R40WO9udACU0jOsPrjI5caTZLfBbz1jKx2dpY9qu0/UM2xVsCz3xyX2ubxLGVVW/ooGcnA6HuK/b4h7Vgql3Y36pPJLp64RkPLzFckb9BMl/AFWQwM9U/sDpVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=E0DNYkk8; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="E0DNYkk8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JCMPPY5S29I+t4B4G65pYj1uU/yDmZsIffdEDz/h0d4=; b=E0DNYkk8/fO01kNre/mRSi5aF0
	5ExDrrk42pRwmkvXAcIiSlzGFKca73wXaOG5o1AO+ytTOhArK6ig+KeLyobvfNqVvfO6N286cDslu
	J5Jm4pH4Fb9NKJm1hPZAWf7M/rIHgSmXzUnYo1ds/exiFFdpxO2ayXcyNcVLvbmiaocRsroewkOr0
	sfFSZPwZGbWrAEQjhmFFsa+1YCDYjbkgg4UeHazDH9T08kOijwbiXvoOhKbBb8QTXy9QKbRwscJjl
	7dNNzZLliZLhWJ6FgqbVB+MpbxHILrvmkGy2rRfVYQ0zF0r//+2SwhA7/tpMxP7avKfjR8bX6kIVL
	fYovlWcg==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tkpDl-00EwSg-6e; Wed, 19 Feb 2025 19:55:03 +0100
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	kernel-dev@igalia.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH v2] Documentation/gpu: Add acronyms for some firmware components
Date: Wed, 19 Feb 2025 11:53:45 -0700
Message-ID: <20250219185415.243896-1-siqueira@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users can check the file "/sys/kernel/debug/dri/0/amdgpu_firmware_info"
to get information on the firmware loaded in the system. This file has
multiple acronyms that are not documented in the glossary. This commit
introduces some missing acronyms to the AMD glossary documentation. The
meaning of each acronym in this commit was extracted from code
documentation available in the following files:

- drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
- drivers/gpu/drm/amd/include/amd_shared.h

Changes since v1:
- Expand acronym meanings based on Alex Deucher suggestions.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 45 ++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 00a47ebb0b0f..1e9283e076ba 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -12,6 +12,9 @@ we have a dedicated glossary for Display Core at
       The number of CUs that are active on the system.  The number of active
       CUs may be less than SE * SH * CU depending on the board configuration.
 
+    CE
+      Constant Engine
+
     CP
       Command Processor
 
@@ -68,6 +71,9 @@ we have a dedicated glossary for Display Core at
     IB
       Indirect Buffer
 
+    IMU
+      Integrated Management Unit (Power Management support)
+
     IP
         Intellectual Property blocks
 
@@ -80,6 +86,12 @@ we have a dedicated glossary for Display Core at
     KIQ
       Kernel Interface Queue
 
+    MC
+      Memory Controller
+
+    ME
+      MicroEngine (Graphics)
+
     MEC
       MicroEngine Compute
 
@@ -92,6 +104,9 @@ we have a dedicated glossary for Display Core at
     MQD
       Memory Queue Descriptor
 
+    PFP
+      Pre-Fetch Parser (Graphics)
+
     PPLib
       PowerPlay Library - PowerPlay is the power management component.
 
@@ -99,7 +114,10 @@ we have a dedicated glossary for Display Core at
         Platform Security Processor
 
     RLC
-      RunList Controller
+      RunList Controller. This name is a remnant of past ages and doesn't have
+      much meaning today. It's a group of general-purpose helper engines for
+      the GFX block. It's involved in GFX power management and SR-IOV, among
+      other things.
 
     SDMA
       System DMA
@@ -110,14 +128,35 @@ we have a dedicated glossary for Display Core at
     SH
       SHader array
 
-    SMU
-      System Management Unit
+    SMU/SMC
+      System Management Unit / System Management Controller
+
+    SRLC
+      Save/Restore List Control
+
+    SRLG
+      Save/Restore List GPM_MEM
+
+    SRLS
+      Save/Restore List SRM_MEM
 
     SS
       Spread Spectrum
 
+    TA
+      Trusted Application
+
+    TOC
+      Table of Contents
+
+    UVD
+      Unified Video Decoder
+
     VCE
       Video Compression Engine
 
     VCN
       Video Codec Next
+
+    VPE
+      Video Processing Engine
-- 
2.48.1

