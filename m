Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C51E49F
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 00:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779409931; cv=none; b=WqD+Jl7deva/GXzOiYym5uVvMMVliYpIfArUa/cyj/WYO7omY33nanonfPZxcuHyVCbgCKGmoz7cH1XEG4J1g0H9AU37BislVYbiBQgpXusBXXkpl2bD3DVRZDCNLmLcF2yWzvGI5FUNLjcFHL3iIiComcK7NU0n65Ml/nd2EPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779409931; c=relaxed/simple;
	bh=rZ0H0h//qDNGKY8GDvPtVdCXlD/nbmIuNPnZ99a35Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQjGLl3Rz6hwZOCIeKkkj1e9ukpandAkytcu6KuxjamRVDsMVavcLjnM1gR6XkTn4fv8xQok54M6W5vIsu4mQDPGX218niD69LPXzkHhN67kIVNgGG1B0l56a0fkiJdXRibTl3zzIuBedPU21HNoAy11BUrh05mnHB1KCWq38D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r563VPHW; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r563VPHW"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-839dc688d6cso3037790b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779409929; x=1780014729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjbFFGxpjHtBckQfss9b7/B1q2YfKvMiS3b7SBxQBOI=;
        b=r563VPHWQo2EDzkgTuOsHMeBqWCH+D690JbkUsw23/Dkr8PL3CLjtt6lxyfYLPC08s
         EBZIV4cYo/J8gh89EoB/UUOHnruD4oPmzV63ebVWZMbCQb7PLp5XrVEvZXvRVx9Wv3eH
         RFqMJ+IcvmuducPxJceaucvq5/1rUK3mUqLKDC3004oAooeaY1oj4zHNlYPIVbAv/UhQ
         mOhxY/YRGGtVqEBabc9q/9FsUeCCfNsoQlOZ9DW+ezlkf4JXUGhx+4ABtGju/NjFy9jI
         /ps0Ze9np6IfhikXVKSfwdccPR5EhPWg7Wsd0/Y1Lu8GDkwuJOrYhgBV0WV4q72UgfPA
         IW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409929; x=1780014729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjbFFGxpjHtBckQfss9b7/B1q2YfKvMiS3b7SBxQBOI=;
        b=Y6yChSRBWvZ4Q9CgFp2E5ZVSh2NlCIav19m7TFHx+1VSZtWGG+J/EaFftoxVEbhYs9
         9tIbluwO1DoJZFEkRxjkIODVfLJfxndxh552YYC64vGV1L/Q39HbTDK49d1PvAALpr8s
         7aIPd+iY0cb9EmgZdaE/ElFh9YTqqw4w0V4toekMQqCfgrxYu5ZSAZRsSvP1bSxu3iKx
         THTdp8wtf8ipYHkP0RJFylTUKvbofeifAqEJuaG1jNTdqXPEku5dV/7pSaXiIX6OT4g/
         bnaVzLLEi57d7GBKNn3yLLpSl0dACuOnUP9BVTKnjQ4kkQ2+Zdk9xQLHQsk5O/gOiT9n
         sxKA==
X-Forwarded-Encrypted: i=1; AFNElJ8m6w4zIStEWA+bdkYus3gli/vbHQaAvHtpzvVCC1RpubanRoHBhhwhAL5u3JJ6+f86Gatvuywcy0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aZ+iEZKsnofwQavLhcjrVFrpjxHZyc9pLiUq2UmFVluZeW9s
	fFi5dD5YTtb9EqrdY2R/iP6SaWl7SDpft6FRaPFhYhsW1W5ujUCJHkg0
X-Gm-Gg: Acq92OFuv+rioJKDDcLzSkaaLwTRLmV8ED86N0Xk6NjjYMKk5U7HTYpvJ9UrKckEhNa
	cvaGvDIr+ApZNzOJk3L5b/+bPNx7EHqirYSDb87q7nuI7mT6yfkXJcO9ltSSYa3bn+Swdikoumu
	/2VvDTNHmKkl/YtWWXasCzDS+SoBy81E63L/JF5O4xJCMziwBqL4++gbhn1fPMvJrQyrxQ/uY8p
	2iPkVLsIBJnIdWHtvgAyj7w+K6e9EyFShsx7w7zwj5DhxUrx96ToCPo6kHF6F3DwxGPjfv9kS1J
	n2HDNx4DRDxR/SmTiIFbO0xqNFFWwq+7zUepNiCC0tln6KNbfX61XUfe8yn0/lXZ0ZNLmO+yOy/
	QOnFXVP5TXsME8A/SpNvTXcVZmNStyBFY2wZKewqisyvACIu2bZr3raBbXY1ysSV3izSc/+Qgwy
	mwn6kpWbflWyrtmzrKva69RkCKwBU42l22bwzZ4v9OM6c4Oi3PUCb+BkXq5R2VhgkUAVr+YAMjB
	wTxJeax
X-Received: by 2002:a05:6a00:a0b:b0:83a:4846:90bc with SMTP id d2e1a72fcca58-8415f3c291emr1366848b3a.48.1779409929219;
        Thu, 21 May 2026 17:32:09 -0700 (PDT)
Received: from Kalki ([103.173.206.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm37970b3a.41.2026.05.21.17.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:32:08 -0700 (PDT)
From: omkarbhor4011@gmail.com
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Omkarbhor4011@gmail.com
Subject: [PATCH] docs: fix typo in Sphinx custom CSS
Date: Fri, 22 May 2026 06:01:56 +0530
Message-ID: <20260522003156.70389-1-omkarbhor4011@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: omkarbhor4011 <Omkarbhor4011@gmail.com>

Signed-off-by: omkarbhor4011 <Omkarbhor4011@gmail.com>
---
 Documentation/sphinx-static/custom.css | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index f91393426..5aa0a1ed9 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -30,7 +30,7 @@ img.logo {
     margin-bottom: 20px;
 }
 
-/* The default is to use -1em, wich makes it override text */
+/* The default is to use -1em, which makes it override text */
 li { text-indent: 0em; }
 
 /*
-- 
2.54.0

