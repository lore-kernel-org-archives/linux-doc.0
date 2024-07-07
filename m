Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0D18E28
	for <linux-doc@vger.kernel.org>; Sun,  7 Jul 2024 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720368936; cv=none; b=I8dCEps3MEKTuWTOGzPheNBM+LWoeXPysaSiXodu5IlPTvfzC8BzXtATUHuvsqQkB8Vkf8rRG5xCIuQujaCHYTD8isVlWqKf87xp1Ng+zKFxz2u0zlF6/5rn1bRXTDaC5zfG9VFMsyFcTD/dhZsbrr2tlbfWX/TQ++Qrw7WJFXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720368936; c=relaxed/simple;
	bh=CcbO9mal7o4Z7kla4wUPITnR5YQHnXSLPu+2L8jeCdg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=J8ADh3XaxlGqF5xE9IQm8CSV6c+92KkOobfPUp8gcZOucTCJEryzaNme6EgLDGwJsVXfWAioXT4qeaNkpxR1ur5xRtcU5z3BdbwsvM5hZLZl4jayxYQ8svghT2hHEYVfPtRs7eW/OBftuGXZ6Y3hbXBlBsMattT0u6M7qq0gZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uuQa9TWX; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uuQa9TWX"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1720368931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oAnCpXFlsaLK2Hpd3SeRhOA5IpW0O6zNcEfcdZMEQSk=;
	b=uuQa9TWXoIs9yAe7ahCoMSjVY4saRRbwkkGbrc6H/NNFhNzjCr3xSmsvnI2cxG49eLiI5U
	WkJSK4pmkd/m3EcL1AZLsD+vpEkrcYSRJED01oVRu8utaSWwQajeYYdmILCpSpidgcae/g
	WVo8QRMcKLaasoM5bukSQBej0IyMDpM=
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: alexs@kernel.org
X-Envelope-To: siyanteng@loongson.cn
X-Envelope-To: corbet@lwn.net
X-Envelope-To: zenghui.yu@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alexs@kernel.org,
	siyanteng@loongson.cn,
	corbet@lwn.net,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs/zh_CN/virt: Update the translation of guest-halt-polling.rst
Date: Mon,  8 Jul 2024 00:14:44 +0800
Message-Id: <20240707161444.98715-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Update to commit 1954d51592b5 ("Documentation: virt: correct location of
haltpoll module params") to fix the obvious mistake.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/translations/zh_CN/virt/guest-halt-polling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/virt/guest-halt-polling.rst b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
index b798d1cf0b48..463d1d829062 100644
--- a/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
+++ b/Documentation/translations/zh_CN/virt/guest-halt-polling.rst
@@ -76,7 +76,7 @@ guest_halt_poll_ns将保持高位）。
 
 默认值: Y
 
-模块参数可以从Debugfs文件中设置，在::
+模块参数可以从sysfs文件中设置，在::
 
 	/sys/module/haltpoll/parameters/
 
-- 
2.34.1

