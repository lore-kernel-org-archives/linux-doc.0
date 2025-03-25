Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24F19D090
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923612; cv=none; b=dh9duAFyqZkk/qO7N1TeaNCegdmDs0LSB7q70MwS9AKOZWYNDKsAag304yFak1MMqNiLtH43IIOJdrUsbeD25K9V2mq8CZRBKJkxcHbCqJnLzrNOnHVpj11j9GWqh76UsTJQmU4z/8HehG85nve07SGCHASXl6r9ur+xPqCcKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923612; c=relaxed/simple;
	bh=OmrfvMhkiaTKdzQqFMrY3DOLhi6+yvSNn32B5WZq5HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWCZY311jLLugTT656AyJ7VJgXLGEjKJodd/8MrxOqhJsCWRFjGQvzH2Wb6aqZRA7GZtAGz4i6vUvvKdw8EqKCO33xb04/hLgDJVMoCS9HwcSDB7XAf7NxQN7oP+0EmwcP8B/a5LXIFYNHxxY+HC3I9JYC45h+g07HYPNeJ3KR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pBxBc/BP; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pBxBc/BP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GmjFnrihjVc0EG1uQ8V65xmrxiTWdWQbXmk0sDhP6KE=; b=pBxBc/BP40tUiIp5TmnNzeMZ9G
	bVOu+6p++bTwf24ZyU4FfjzhVnZ3vh/qNsO4tYzim5ZK/MKSxjWJ99CmVDlRXfJ6Ol1LRvvIJef3z
	Hl884WRPEG5hTKZAH4D16zEuk/ISzRfpVBEmRzuUmGlxyC4a8WnHaNImGVY3RCRYKch5liRnbFoWJ
	z3wPwLLR851loLNXcsU22UJOWJTXs9aJAI1y/TcDTWXnkhmP2yH85YzbW8R8KGDwDy07yreZjmAF5
	JJD/CYmnoRtlCvbdV6zulz+x9ZFMUUY5oGujEWqicFHoTZ8/oZzJEBDv31ANqfkmQ/CSQ3Bn/TZeh
	vB24RePw==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14] helo=maloca.lan)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tx831-006FdA-U0; Tue, 25 Mar 2025 18:26:44 +0100
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
Subject: [PATCH 2/6] Documentation/gpu: Change index order to show driver core first
Date: Tue, 25 Mar 2025 11:18:43 -0600
Message-ID: <20250325172623.225901-3-siqueira@igalia.com>
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

Since driver-core has an overview of the AMD GPU hardware structure, it
makes more sense to keep it first. This commit move driver-core up in
the index list.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 Documentation/gpu/amdgpu/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
index 302d039928ee..3832aa764c72 100644
--- a/Documentation/gpu/amdgpu/index.rst
+++ b/Documentation/gpu/amdgpu/index.rst
@@ -7,8 +7,8 @@ Next (GCN), Radeon DNA (RDNA), and Compute DNA (CDNA) architectures.
 
 .. toctree::
 
-   module-parameters
    driver-core
+   module-parameters
    display/index
    flashing
    xgmi
-- 
2.49.0

