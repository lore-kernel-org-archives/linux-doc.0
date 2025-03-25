Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326E25EFAC
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923613; cv=none; b=SXEk9GlfHgv+Kjr+qhff8LdJs0tXy3KA+Mltp/aIcY65b9nnlwAtSRg6/VPggUQl/LhP82p7OOODJc8Oq8T/wyOim2S9+vOqhXafrv7vbKHH23LSg1EUCMnm2g2gZuCxSgRGBYFxarG27vvsNziQ+W5kp0Dj9+HmRwp/xJvPtlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923613; c=relaxed/simple;
	bh=QBHPT43bBmP3l77iF85yHlwQN/Ni5A0grsgQjB4YmkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0C6Pgv6+o0zHGupbVOghFey5otdyrD2UamWR17Gm9l74z8FaYkYobrTkKAxLQ4vTYZCYEjB57YoC5f+FN1ps1D9nhl3fcL9l5R20rlg3kb37LS389nSTRQl5ar8XVe9joaaX0kigAWQ3UbSWVcI2usUiNIGQIDOhZZBpIHwNNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RCfGLW7F; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RCfGLW7F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=M1owNA9LTalVJORCl+yeCvwoBz1nTBHdJqePTwwU49Y=; b=RCfGLW7FHu3crkTbw17OEwduYQ
	OLHWoccMMqPhvveUlHsQnYGy15nagjkYC5l6l1oW5wpQcCwS3PspRrnNGL0/LPAZKYimOX+G5RM+k
	2qGlal9grjIMFamlBuTgbni/VHDMyj4mXqn40aLhTNuMhkySAI03al1tCma4JatnT+zSO6ll0RtKD
	J16H74sv36lnhDv1sg+uT/xhS90r/OUQB99N9HwbFVuuovPSXdTYmz7b8AiHtLTQdDh7zpiPanvuj
	XQGX+UEBGcH4tTYMweZnzXiYA+xFuVL9iLJHq714qGLXDc52e/Xd/UsS9qqDlLwY/pIoHhxxZQuFF
	jAIlLzaw==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx834-006FdA-7g; Tue, 25 Mar 2025 18:26:46 +0100
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
Subject: [PATCH 3/6] Documentation/gpu: Create a documentation entry just for hardware info
Date: Tue, 25 Mar 2025 11:18:44 -0600
Message-ID: <20250325172623.225901-4-siqueira@igalia.com>
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

The APU and dGPU tables are hidden in the driver misc info, which makes
it hard to find specific hardware info when users need it. This commit
creates a single page for this information and adds it to the top of the
amdgpu list to improve searchability.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 .../gpu/amdgpu/amd-hardware-list-info.rst     | 23 +++++++++++++++++++
 Documentation/gpu/amdgpu/driver-misc.rst      | 17 --------------
 Documentation/gpu/amdgpu/index.rst            |  1 +
 3 files changed, 24 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/amd-hardware-list-info.rst

diff --git a/Documentation/gpu/amdgpu/amd-hardware-list-info.rst b/Documentation/gpu/amdgpu/amd-hardware-list-info.rst
new file mode 100644
index 000000000000..1786544fe7c1
--- /dev/null
+++ b/Documentation/gpu/amdgpu/amd-hardware-list-info.rst
@@ -0,0 +1,23 @@
+=================================================
+ AMD Hardware Components Information per Product
+=================================================
+
+On this page, you can find the AMD product name and which component version is
+part of it.
+
+Accelerated Processing Units (APU) Info
+---------------------------------------
+
+.. csv-table::
+   :header-rows: 1
+   :widths: 3, 2, 2, 1, 1, 1, 1
+   :file: ./apu-asic-info-table.csv
+
+Discrete GPU Info
+-----------------
+
+.. csv-table::
+   :header-rows: 1
+   :widths: 3, 2, 2, 1, 1, 1
+   :file: ./dgpu-asic-info-table.csv
+
diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index e40e15f89fd3..25b0c857816e 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -50,23 +50,6 @@ board_info
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
    :doc: board_info
 
-Accelerated Processing Units (APU) Info
----------------------------------------
-
-.. csv-table::
-   :header-rows: 1
-   :widths: 3, 2, 2, 1, 1, 1, 1
-   :file: ./apu-asic-info-table.csv
-
-Discrete GPU Info
------------------
-
-.. csv-table::
-   :header-rows: 1
-   :widths: 3, 2, 2, 1, 1, 1
-   :file: ./dgpu-asic-info-table.csv
-
-
 GPU Memory Usage Information
 ============================
 
diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index 3832aa764c72..7e9d60754287 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -8,6 +8,7 @@ Next (GCN), Radeon DNA (RDNA), and Compute DNA (CDNA) architectures.
 .. toctree::
 
    driver-core
+   amd-hardware-list-info
    module-parameters
    display/index
    flashing
-- 
2.49.0

