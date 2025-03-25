Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C025A351
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923611; cv=none; b=Ts1e7lTrlQPhLs+Lj/FzyyZ6IbEaOZQO3X2JFCEt9q+6LPHHdsEddH36X8GdCOCE3HGiJytDa1PkoN0iZvifpS3X4nnNZu0Gzb0fL+xxSLdRTMp+8LIQUW7v3+I5DijJFZyvlt6nGYOzttIzjq2YRmRfUFrReCqYaP+YeYwfP4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923611; c=relaxed/simple;
	bh=srx9/gAHfqEKF6bYpAujRGj5OgPx8QR/23UkFgdN9tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obFL1WQJJBNPjcIXc8XuIoEIjwx6T6d7dPA0YMPMfe57V7f3dcTp7oN9ZDOS6MeIm7c1QCve8dAHM3LqkUkCIjBhlRcw4BVDmIF/y4irk8ykYk0TVXrafbR5BLj6cYjb0Ml4159KOsezv/zPcxuVFTaiuKCe/aT/w+qs+OUMPMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hWxAnGTg; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hWxAnGTg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6Nw3B19pitYU98/3dVe/smy1yTn/FgrrC1c8pbKjUZU=; b=hWxAnGTgA/xFAWnOMCEFT9uEUX
	Z8GBsLO6iFBOaE35J0mxJUSphyWgQeAyXo5YReOl6sOPtcInE9lXRYsza6rkyurPV//pwqOPf2J3D
	9mSgiS8196oo6ju8OEn7Fas084pH9aiZDSyUNoAq16Fzi267lBghlEdNsdM53yL8msjxv7c9S/3ZM
	j1XFwzb5+YOGAh9mDz0YXVsHukZ5RuW6f7Ve3lw52sPfuSZk/hKh9Lx5T0oYE8h7I7juDzef9A0Ln
	jRSdMnnHeF83VZwscgHWrk9IhWicJHTZsdGv9+NRtEGhbV0Sa7PYeoW8rf1JqcvoDQNmFWxajPAya
	1nt6kgAA==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx82z-006FdA-Jy; Tue, 25 Mar 2025 18:26:41 +0100
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?=27Andr=C3=A9=20Almeida=27?= <andrealmeid@igalia.com>,
	=?UTF-8?q?=27Timur=20Krist=C3=B3f=27?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	kernel-dev@igalia.com,
	Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 1/6] Documentation/gpu: Add new acronyms
Date: Tue, 25 Mar 2025 11:18:42 -0600
Message-ID: <20250325172623.225901-2-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172623.225901-1-siqueira@igalia.com>
References: <20250325172623.225901-1-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces some new acronyms extracted from the source code
and found on some web pages around the internet (most of them came from
ArchLinux, Gentoo, and Wikipedia links).

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 1e9283e076ba..080c3f2250d1 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -12,15 +12,27 @@ we have a dedicated glossary for Display Core at
       The number of CUs that are active on the system.  The number of active
       CUs may be less than SE * SH * CU depending on the board configuration.
 
+    BACO
+      Bus Alive, Chip Off
+
+    BOCO
+      Bus Off, Chip Off
+
     CE
       Constant Engine
 
+    CIK
+      Sea Islands
+
     CP
       Command Processor
 
     CPLIB
       Content Protection Library
 
+    CS
+      Command Submission
+
     CU
       Compute Unit
 
@@ -33,6 +45,9 @@ we have a dedicated glossary for Display Core at
     EOP
       End Of Pipe/Pipeline
 
+    FLR
+      Function Level Reset
+
     GART
       Graphics Address Remapping Table.  This is the name we use for the GPUVM
       page table used by the GPU kernel driver.  It remaps system resources
@@ -80,6 +95,9 @@ we have a dedicated glossary for Display Core at
     KCQ
       Kernel Compute Queue
 
+    KFD
+      Kernel Fusion Driver
+
     KGQ
       Kernel Graphics Queue
 
@@ -89,6 +107,9 @@ we have a dedicated glossary for Display Core at
     MC
       Memory Controller
 
+    MCBP
+      Mid Command Buffer Preemption
+
     ME
       MicroEngine (Graphics)
 
@@ -125,9 +146,15 @@ we have a dedicated glossary for Display Core at
     SE
       Shader Engine
 
+    SGPR
+      Scalar General-Purpose Registers
+
     SH
       SHader array
 
+    SI
+      Southern Islands
+
     SMU/SMC
       System Management Unit / System Management Controller
 
@@ -146,6 +173,9 @@ we have a dedicated glossary for Display Core at
     TA
       Trusted Application
 
+    TC
+      Texture Cache
+
     TOC
       Table of Contents
 
@@ -158,5 +188,11 @@ we have a dedicated glossary for Display Core at
     VCN
       Video Codec Next
 
+    VGPR
+      Vector General-Purpose Registers
+
+    VMID
+      Virtual Memory ID
+
     VPE
       Video Processing Engine
-- 
2.49.0

