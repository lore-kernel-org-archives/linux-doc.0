Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651B1A83F2
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574049; cv=none; b=fSAq7hxSVuogmYSQezHXob4oDGTrGOTuNMQ3E9zpzTwW2XvqzxmyCud3XxdXy5ELXzu5MnV2dbUa7/MDb9oSW3/1WToK2v7gAX6+GbgqdftHaHdWE4rH/qqxfOY4E1kxvNMlg6tTxAk2vFXKwbuyeW9g4bQ2HUIeJ/K6zixQHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574049; c=relaxed/simple;
	bh=erSS0zHbDSdMQXcMzPU50jjiLozz2LSMUEEDbEpwpkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sy5dl6BBQ3VrgEcJgJVzrCwYunc42EAxmJbTlGEyr9NEK5kzXAWyH70WOsGR53LHeWoYAhx/TNH4/tv2ntNug/FEmUuji378mBGdUmuZu0TiGNLX6N+fzfsbOKZZYUr3s7y1okkteMFneVKo6niIBtK0N/+ekca3yD+Z2qljXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=EaTIaIIq; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="EaTIaIIq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eVEaBGIQlTqnU3vHo305GyXFideXHuyIQxW5KwoF+7E=; b=EaTIaIIqgyfnNu0OOdXFrqNVZv
	/FBXv6A44el9okzJ8NoVDfiMZxQffHtuJgxdl0TlqkH3pvAQTjYHil71XRys46KIOrz0z2LrWAqN2
	l3FL25lX/JAcxIGp8Z4NL4KpF0qV87jE+hPCpIl1m6BE2i94vIUEUjZVSlqp3ebIun/vkQCPjGxb3
	Sm6azXh54VL0FxuK14dxtlVY+WPHk9Fe25ddOhBqJ1lIv2x+0In1eXPwbIlNYXNvcsgJZtH4JTJqK
	b3BL+C+Mu7oe/gbCAt8w/vNB9Ep/FHktRKZuDFIwvuWxakZBz0F5BGibDrshjWMZXLiZhZBHI74Xv
	F9hu5Tzw==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tj4fg-002QaF-9c; Sat, 15 Feb 2025 00:00:38 +0100
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	kernel-dev@igalia.com,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] Documentation/gpu: Add acronyms for some firmware components
Date: Fri, 14 Feb 2025 15:59:45 -0700
Message-ID: <20250214230011.439163-1-siqueira@igalia.com>
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

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 00a47ebb0b0f..3242db32b020 100644
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
 
@@ -80,6 +83,9 @@ we have a dedicated glossary for Display Core at
     KIQ
       Kernel Interface Queue
 
+    ME
+      Micro Engine
+
     MEC
       MicroEngine Compute
 
@@ -92,6 +98,9 @@ we have a dedicated glossary for Display Core at
     MQD
       Memory Queue Descriptor
 
+    PFP
+      Pre-Fetch Parser
+
     PPLib
       PowerPlay Library - PowerPlay is the power management component.
 
@@ -110,14 +119,26 @@ we have a dedicated glossary for Display Core at
     SH
       SHader array
 
+    SMC
+      System Management Controller
+
     SMU
       System Management Unit
 
     SS
       Spread Spectrum
 
+    TA
+      Trusted Application
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

