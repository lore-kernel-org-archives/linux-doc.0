Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7629B76F
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164734; cv=none; b=QwQ2p1r+iqbCJskJiowZ0iG1O4B2u/boWrO8L2QxgQlMK3dn+0+uE/7/hX251E6QjwL2Xj+HXmbKhXdnlnWc5VoZSFQT3KCBD3VR6t/ZwWPcoPphC6j82/Jm6+ZgR1Oi1iL3U4xsjy7HS1pK7j5p3zyWxhFPsv8T/xaeDQYiL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164734; c=relaxed/simple;
	bh=A5CNpnVdW3A1xY+wKTwWENUP/Wz9NPD/eZUD+3yyMos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSsP6x4dfICQaZ6MbUMPVqDY64RwwXgzRJeFeyrxfV45kPEV9/Am6jZwImSnyadPsZO/wytBbFqRhyVAGMIbl3JFIpwXEfWkLkXy9W3r0rk9bXRb7hQa0OaD1PKIX/cKRaux1i4m6Xh99xUj28W3yH78Ar83apSiM3fyePyyVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BRZdIBqD; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BRZdIBqD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766164730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cWvDfk0GKrvCrlYz9aF47qBNsBtUgWddP1I/pwoSFEQ=;
	b=BRZdIBqDI89HGkplLMGxjVP1hbIDbKiMpE6R8nhZZ4IVUVUr3LAjObGxiIeJpI0cfLZNyf
	wPt5+cLx2+xbnIL3rcpqOQikhXMrM4VHqNOFCynsVqGUXSQQr+pND9mv9Y+E1kuH/sZ5Vk
	CFX2MFlV5C2O6Cg0sTB/czaVA8uUKSo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: kernel-hacking: Remove comma
Date: Fri, 19 Dec 2025 18:18:26 +0100
Message-ID: <20251219171827.44015-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The comma is wrong, remove it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 0042776a9e17..06fcb7c662d3 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -49,7 +49,7 @@ User Context
 
 User context is when you are coming in from a system call or other trap:
 like userspace, you can be preempted by more important tasks and by
-interrupts. You can sleep, by calling :c:func:`schedule()`.
+interrupts. You can sleep by calling :c:func:`schedule()`.
 
 .. note::
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

