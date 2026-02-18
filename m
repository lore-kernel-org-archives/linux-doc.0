Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1AD2FDC52
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410810; cv=none; b=DistWVclFZZRo4mRPaBIbnpxIp0Q08ueGRAq8hivexeFMDsD9cXz0AsKZBF0G1sAc7f8J6ZrYkmIoeqmr4pcZ9naxtFfDFQBi2sg4/X6ZBN5CpaqZSktM/CqJyCBCyZRKwDl9fxW8rBLqBwcBjK88bOSwEH1Ilp8qKV5p2bmSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410810; c=relaxed/simple;
	bh=YnHM+eV0z+jijcqodblN2kWciPy3OdYCgyy1r2MOteg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ckB91iIjHo67SYblrgTf9AxlT3vylw4rfVq0Te+MJHwTZzHMaw/wvXjrCln6EyCWe0Kvcbzug1Gbty1x6oYQv8xSfMsYeXLaJy2U8kpd7x9kqo4GyL3PlDIcCY7pNZDkb7Wo1PAZrK8XReUrIfD4nPmL/YT/Eb9hh3+V1jOHbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmNcBt2i; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmNcBt2i"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824a6f2d816so2463809b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 02:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771410808; x=1772015608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tl+IFNGhSDPDqDrqt4/ppfqDWycO1c71mU1Jz1vARm0=;
        b=AmNcBt2ix2iDKAHkmosNFXkboUoP5Wj23S1CcYBskujxqvE6GYXWvTmjvfcnpuhZJ+
         /5RBGMEQYmy3ebqvPyisJGA7Bd0i74Xql0Nt+fZ/SWgfRYMEbp3ALYdHExgG4wvmfJ5K
         NxibanjUxcsnD23fnZ4OiEL3BRnaGaUsMKNHX5YbfJe5A7It3oQm42shQSrsYAIWjInJ
         /Ju5BfcfBbs7Nq9HWnsJItVWc38p5SeaKrl9qxxai7kg5Q+V2EmaWEWCSNS5snR2NyZC
         ndnTNcSwUYLsg/he9o8bSW2vUkqp74PXc5kyisV52JybmDrv8jIkceuMfFE8xjgct1yx
         O55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771410808; x=1772015608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tl+IFNGhSDPDqDrqt4/ppfqDWycO1c71mU1Jz1vARm0=;
        b=UO6PZ6pQwF9PAH7etIwIJlmPUvw9fzlufo9rIndo+a5aX+XbWWAEdY6+iYp1A3gW+q
         FJXBc47sc+zhlu1UDiEwaZKdY1Nka0aH/35WwonIVizgczxL/Myar8FPyZATdzc/yT0I
         l7ug8E1vcDEYc3lSK628hMqMBP6t1jYFLgzWCBG2nT1L7BGESdbYttAfW45boctYxY4H
         FAUyNWAiRy4k5zFlk/gEbZcvIM19AI904xJTjQbXakP5KEWjztAlhFrfiCE1KYe8HyL0
         G0ojCptzLg7Ji7V1hzAyiR+w6KV6OrgAfjJ/HUx3NRGdCb7RxxxSaG/758jFuZ2EJFB6
         HleQ==
X-Gm-Message-State: AOJu0Ywg4+BDnjTf6uhbVdolGKhlR1+aiLxW/uLp3/gJdbYT0SAvJMgE
	Ncf8N6Chlid1x+130BaDnWcMqhWsQn+lP89WKPw6wuLUveybO5gxKNb+
X-Gm-Gg: AZuq6aLG4P0I9C8nIqibcSyxAxEKXpRBFc7WTNPx5JFhlueagzH2SRjQCkP8U13kwCS
	uBX8v/XxNdqe9aAU0VvJ2aLcUpr+ez/sRjU2X2lkSwd0RhbqTss34rSPl3bukqwtl0G2R4wl6gz
	8dWEyBHJ0sVMl4lsSsSg6wIwmzgwAleZX7BQ43q8oZ70ZggeEWzv622eG/ldlRojQ0f8S5tFmSB
	FAvgLdZaQn1/qON7dbO9EkcJQC9QE6dSwdTu6YOGMjyq1zba/5Mr7yotAwMAIPL+M92rIBEix5h
	+P5kxwCRvEYLCqM3DfUCsb3qz2bZDcDZqqC3O+v+4ndpIkpXCdjJ+mxNNcBjmmn0UEH6m+dzQrX
	TAv4hRDZAbLubmAYu9WABw7spT+lVech6MDhl3CUMuuOWN7kfSd8/c6/zGAmkF9DI8sq+74Dp5S
	w1vD8GdAuDSkfNTtK2F/L67wkpzisnb5tpulRFM1hkjCz1bQ3H8BCFOBW8K0sqPRn9zzb6oyhBs
	c3FndOl8Q==
X-Received: by 2002:a05:6a00:4fd6:b0:824:9451:c1f5 with SMTP id d2e1a72fcca58-82527603895mr1332510b3a.58.1771410808308;
        Wed, 18 Feb 2026 02:33:28 -0800 (PST)
Received: from pranav.. ([1.22.126.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b94009sm16514813b3a.52.2026.02.18.02.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:33:26 -0800 (PST)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH] docs: kernel-parameters: fix double word typo in initramfs_options
Date: Wed, 18 Feb 2026 16:01:57 +0530
Message-Id: <20260218103157.110404-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the repeated word for at line 6485 in the initramfs_options
entry.

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca..38fa10e92 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6483,7 +6483,7 @@
 	rootflags=	[KNL] Set root filesystem mount option string
 
 	initramfs_options= [KNL]
-                        Specify mount options for for the initramfs mount.
+                        Specify mount options for the initramfs mount.
 
 	rootfstype=	[KNL] Set root filesystem type
 
-- 
2.34.1

