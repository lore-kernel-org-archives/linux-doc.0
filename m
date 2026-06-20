Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231F391842
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958502; cv=none; b=S6p3nSRCoo7UbxOR1S22bZ5tp2oJYjGUgVKb1M4dx+wmmKUoqmrXFU3U19sCOie9j2Kfymf0zJ5TfZvLXrOEeaM83lvIKgbNBzCXAMmLLE6dzy/Dg0HluFVm06QFWxXv/GYOPqEslBu4k8xs0ZS22B5m3yEDng9F4HmVcbdfxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958502; c=relaxed/simple;
	bh=UoFXDjdBbg+2Xy8AuMCMnQqEYq6q072VLR6TEOR9m4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cEEKnme9n3MrRBNedpenQkxnUO4MzzJ9YbrJ10zCUzy+EQl0tjQwdbP0WLfiIrf27pzBg3AFaW04fmU+F8BimAfCENYOXT+nQrkzuO1SkYnk5emon1YSNprtqA4x8EzV6Pd3gCZtV87txC2vuH9CWpqS+2SR6X0qOrROjEzAKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WEXsStHl; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WEXsStHl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781958497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AMozjfseFR3D7uPfm1ySGa3f+IL5txozUFi6PIwGyns=;
	b=WEXsStHlf3/vrNf4B3kffMSyWiEIf9T4zrfllqcZF/DCj5Xr349kdQWhAmZImVG/Xkg2Yr
	iCiSZONDg7nPDkyga5uNv8IEHD/Ok7TlKqwESMRBCnGjNXiEB82toJhKEd/tvTQtqXw46z
	691xBSrkD+fILqHXaaZoB7GvLyLO61w=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: openipmi-developer@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corey@minyard.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
Date: Sat, 20 Jun 2026 20:27:47 +0800
Message-ID: <20260620122747.7902-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The correct path of the "hotmod" module parameter should be
/sys/module/ipmi_si/parameters/hotmod. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/driver-api/ipmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index f52ab2df2569..d08cee98e34a 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -495,7 +495,7 @@ tuned to the user's desired performance.
 
 The driver supports a hot add and remove of interfaces.  This way,
 interfaces can be added or removed after the kernel is up and running.
-This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
+This is done using /sys/module/ipmi_si/parameters/hotmod, which is a
 write-only parameter.  You write a string to this interface.  The string
 has the format::
 
-- 
2.53.0

