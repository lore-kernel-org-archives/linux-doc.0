Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333F3290D81;
	Wed, 23 Jul 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266538; cv=none; b=ArvAoLAD8kb4ECbWugef8ig4XSpwvudDfL2KOnrEimHdhXXxDYNK+ZBi0N+sjYzCgm4s6/QISmCM3JiSPTq74u8sx8/fx2V0zhA664auHRn9VluEYsVAEK/RUuUqURiZvQtm59H//5VczOyHJ1FrLQ0TtoTfNlwwsdyM+7mKfzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266538; c=relaxed/simple;
	bh=bFxpcfU5uznN6hBkGOvTdOd9t5GcXUXbQ0Fq8JKd3rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZexs9S4ENpUtfjEeoTM127Vivdz+erXdqZ8PxwhvOR8Z7KMFtnDm3BMiJhxcumvQ0OmC+kjSiEM+gzXmmxncXc/OfWGwsl3+lKvQ/QXoB0K/ri0o31R6MZPPC+e54B8BCAySau+Ixji3HkHMZEAjUgLGL9pGVRs+tpWXs5ncQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F2syURHU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F2syURHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753266534;
	bh=bFxpcfU5uznN6hBkGOvTdOd9t5GcXUXbQ0Fq8JKd3rw=;
	h=From:To:Cc:Subject:Date:From;
	b=F2syURHUji8VIMGZ4fUb0zflEGa0I+pH88nIJmlmqdApawKY1+e/e09Nwl91oJM4B
	 SYDAWVsLFEWOm7MdDIi2zMelcVnOTFXhwJLxIXmYvbb37ZCd3sc9EtZi5wjGfGtxHt
	 HP0Ext5nb6X/gkAcvVxqjc0d0e/vfyVcORy6l6gQZxsuuZgWBHBlXyLxOq+E0vBS92
	 1oXFXR3O1Cb4hpT2MDva4+TIYAOZyGtImOy7Sf1UsELQlaLjVGw3ceiCQOUa12YYgl
	 s2UmW8ay6n9JrID1VeLAyujB7LXABnnoWFWxaJG1bdDQswJg6Bpigpcz5appDDJOLt
	 /gko7pHX8H0Nw==
Received: from debian.. (unknown [171.76.86.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C6B917E0C96;
	Wed, 23 Jul 2025 12:28:52 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-doc@vger.kernel.org
Cc: akinobu.mita@gmail.com,
	corbet@lwn.net,
	laura.nao@collabora.com,
	arnaud.ferraris@collabora.com,
	vignesh.raman@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] docs: fault-injection: drop reference to md-faulty
Date: Wed, 23 Jul 2025 15:58:32 +0530
Message-ID: <20250723102835.232740-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 415c7451872b ("md: Remove deprecated CONFIG_MD_FAULTY") removed
the md-faulty driver, so drop the outdated reference from the
fault-injection documentation.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 Documentation/fault-injection/fault-injection.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 1c14ba08fbfc..c2d3996b5b40 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -2,7 +2,7 @@
 Fault injection capabilities infrastructure
 ===========================================
 
-See also drivers/md/md-faulty.c and "every_nth" module option for scsi_debug.
+See also "every_nth" module option for scsi_debug.
 
 
 Available fault injection capabilities
-- 
2.47.2

