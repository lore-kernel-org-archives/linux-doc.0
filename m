Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E5349B1D
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197093; cv=none; b=hIIOSa2p9rSCXqN75bufBuryVSUkPruUWPf5OlC4l0pllB3HENwIRfK0cU32HZMQJTYPGWCPBj3mj/3+pdwdAN2duEm+HpToZAj/I2T00mK6bxGCfhr5RjVN13SB6n693GwiNReDFr0uQ8Bik1S0szTIccKiWvK/aeendub7jQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197093; c=relaxed/simple;
	bh=AzxKAZm/nl7pcn7SMGa+wkaWx2pzjLH+P7jHPWrIvAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyBlXmlWSe1gYzEiua40slZaGRg9pt+SpubTI9XTj+ztpLgSniwKPJrpasmuyp4uUGyI480xYClRcDXs8vIj8vBLzM2IpF0at3Kx6wGPzJzf1zM/UMn2qVQtqstGl+Ct0rJNPMTNZMYrGDiVYtSRvtC/Mk2MriMFyTHIVcZ4VrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzdueDN0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzdueDN0"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d73d6976adso2675388a34.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 19:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773197091; x=1773801891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+q0dNvBbupC+6tyHU0OlnBS7KtJOe+yMxAJG2X59mY=;
        b=TzdueDN0lHuHBy6DsiK+fCmnhKZ2YDwIZPrN9+ZW32Lg71SMn6w2PetwFqbia/gvpY
         iQdYgzuUTXAlYvLwNf7MxTBo/5zMCOEhCwXeyFYZWEY/QcsPB2Bv5Z2djygKO9JOBXtP
         7DKAnXSQ0gBfx7207x5fABF3GGKbtL5/hJzy2g48vle3vDWlHAk0RNhM5ZdIcCUeijdS
         1/uR8PYDxyIbj4muPOtxCCpbD0KIQzE2+bFiqilUI2/SNLubwOwwNwV5cxEZZs4uRgLA
         V/FPy3LyyjBMUk4518/F8QWC63c6GG01mMJr3E1SCzX4030XhLrEO9TTWAvh89Xdxf4T
         YNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773197091; x=1773801891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+q0dNvBbupC+6tyHU0OlnBS7KtJOe+yMxAJG2X59mY=;
        b=N33/VQfgjLGzm2kaOpZAXA2AFOV6wWTfVPhmeb/35ju0uuIYq6qVWjLmZqaKHm1um4
         HPSeAGkVveU5MXzlEGpfff7wCgBVulhNvvOLJP8WgHlZ2ec47sA33Ibf4sRjSpBJykxm
         5ccqwBO2a00nmyuYkLw6Ex7e0r8pTJ7x9ck/xBKgsvgqxBQDSAfCGxVjCU9BUsXC9wa0
         dOD00Q7QBVIBwhP5W8ZcVn78eN6nHbvLL7471/xQHMmKcd+zaPcIfvhgiJp1wtyREFfz
         L0VUPs9VhWxdNt0U/u89bv/ZtzDMam4Rs2I/j52fa7bj1FInzGNxwXU39ydWUc6c62tN
         J3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe+R2hhGNT0B5x23DGEocY/+nzLG5jxLm8gFuksb7LOszEDkX3CCcmrq+BDY8nJwewUN7E4ncJFrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iQmuG8ZByal/lzXYhzlZO+VH3Beh5tX8oA24hEjjq3tJCA21
	P9caG3qYivqTskbvPYI0INX8SsHgC9wO8xCbGuxZnBXdOUI4dCGkws7F
X-Gm-Gg: ATEYQzx7efFpVpQ4MrHGIFizkISd2y5BpenPvMUzjvgOCOAGFiv8LKJsB3KePQHhUTJ
	saVLCQT5ky5cZ3OOy6T1CR1Nh9kGwG8RkooYpbixq0GcWlORBFiodOxTe4UJ60ep55582WCSa8Q
	GWze1GVGcfjbx7rnb3YhzCoW3MvuRmuRbqYWmGfNc/h9jrwGDOCH/KOYwXA0g5xcF2Ff4kS7JBj
	N0lKwwVnyu/bSrq3zm4kDSJsWSiac6jd0Q5N4FsnpFTqhEw1liYkU0rs5OPG5g4CsXfXRFiT6uC
	Jkl3wPTRG6B+dscHbZePMFWIygO62uiE/yutoA95dYqCtCOt0FRZjxyYBQX+I5vyaYsTqTc1lrU
	IVjwD5ufWSay7KAsATbldJntdfNiQcJbEnswiG0DDFue/ME2sav33THIz3F6iEElLDn/i6s4iWo
	gyqaC2eyjO7Q1J0Omv4FhEuEztSQv+3pqSUJzfbwaAmRLBcShu0PiSIugJZHwk3lWwYKcj+YVwd
	2XiOw1Ivf63
X-Received: by 2002:a05:6830:67fe:b0:7d7:3c44:c80 with SMTP id 46e09a7af769-7d76a60ac0fmr822844a34.1.1773197091416;
        Tue, 10 Mar 2026 19:44:51 -0700 (PDT)
Received: from ShravyaPC.. (r74-192-25-180.bcstcmta01.clsttx.tl.dh.suddenlink.net. [74.192.25.180])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae398fcsm691944a34.16.2026.03.10.19.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:44:50 -0700 (PDT)
From: ShravyaPanchagiri <shravy112@gmail.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ShravyaPanchagiri <shravy112@gmail.com>
Subject: [PATCH] docs: octeontx2: fix typo in documentation Fix spelling mistake "Crate" to "Create" in the documentation.
Date: Tue, 10 Mar 2026 21:43:11 -0500
Message-ID: <20260311024312.6760-1-shravy112@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: ShravyaPanchagiri <shravy112@gmail.com>
---
 .../networking/device_drivers/ethernet/marvell/octeontx2.rst    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index a52850602cd8..c31c6c197cdb 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -323,7 +323,7 @@ Setup HTB offload
 
         # ethtool -K <interface> hw-tc-offload on
 
-2. Crate htb root::
+2. Create htb root::
 
         # tc qdisc add dev <interface> clsact
         # tc qdisc replace dev <interface> root handle 1: htb offload
-- 
2.43.0

