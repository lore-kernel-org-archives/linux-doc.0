Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB018BBAE
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783234967; cv=none; b=XETVZBNoQ7h2ISEVgpKYaPjdC+qCAuHWNjaZhHAHPk0ZrLls5HQjaZaaDnsl3nbS+JG0S3ygTy39OygL1pfG7n0uw/YE1N6/G4YOAqXc+MVM7pltEFg0MNzBmKx6qixrahnmsoxPm8D5/X3qWfJuyz4cAMASWA4/pRlvsOF2XME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783234967; c=relaxed/simple;
	bh=rVUEl79PoXlXUwAmZC2UErhUtKZCSu0B1xf6Wz6IFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R258uOPuP9xX/yOCKfuhRhUWj/t6Q2BaxMrlKylFrknB1AIwL/c8K6TcGiDzTy2ZKo6fJpJGal87HhGLAKf21nNoiKveMmihPP50w5bg++mF7TNcdmgDBtWPvVuNXq+4sLD4/w5M0sQT4OVyHMmCdgaXwiM0YtzoDqZyVK17A2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYrNWtQ8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYrNWtQ8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842338c18e0so1545491b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783234966; x=1783839766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=aYrNWtQ8iQNM9lFPI5jQxIoi4hKd87FDdAN4lG1BvJrDZFI+3bdZQk3fxhDp3VbZdm
         nSaR4R1KybVu6pQcX98yaLrBubQaP5vJuiUCSMGVSOkrh89axXL/VmJ3ef2z98qw7rSU
         AyUWJNNX9SvsYhTI1hrXSbKGV/AWrfjZlgQVfmrne3ZDenynnma7kDAGonOjQZH+KOJn
         KVzVuIEJL1eTNH3zWeBqpazCq4BxRlpbP3i09D6Ygwr1cMWvwI0y6y6vUhvySATSvKZ4
         4sJBy0ZZ2Fk1Bi5aaz3GFz7VojS97nt9dDeaEZEX62n532TM/6ZBlasM4XAUz1shLwGU
         xpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783234966; x=1783839766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=N2L3VM59XPJW7sGiVtGXty7xa0fy0VjyV16/TLNOp4jD5DABwu7ICEM5thHtE0unIl
         uo6ywlz3u13tIC7oZ1Lqg/1/D2JLaRrbCDxUFSk57tkanuqlXhcbSWqkhYRAoVDKefdL
         wOe7Vnwd6LO4yo3rzOdhmFlhd5cRyOcw7cKQibwU7nOUUduFIyJEYIMlQ10tYTu/5dDT
         1Z0XCUUSbvcquJl2XJcGfuK5PUsTKpptLbzkHi+slAtpkcuxM2bMdJCnewlNMu001EyH
         xJ2X8TKMF5gsIJarQKz5JjfCyCybMjB/UTB511p5UO+e/tBPuPjG41gkD3R25+VrkVjy
         sgLw==
X-Forwarded-Encrypted: i=1; AHgh+RroLCfSAm+9/xcM65MC/qphhES16NDetSX6yuxv6X9/jCJWqXWOcDc0mV2KSujDulRLj4dPhwU9q9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv25yfX3rkDz+v2KiCXLFcmNDBAdNx1nDCDgeRDCxl0+PAtC98
	W3WqtXtAFuH5renULKGcNw/K456BV6cVO1z0s35GWy8zHGVXPhzC6Gd1
X-Gm-Gg: AfdE7cnbGX1cgFLKsbD0pGK2DIBqYIZ0TVXQ8pNrLlsUxf3LE3/5k69kuWnQio/QvXz
	iHONVQ4ocuozBImX8YrLeoyuVZa1hzj9ND1ATNWhRyLyaj5fjd090J2CFnJmFTjp8euOEFS+o4x
	jq/nWAzeo1bhCvCnbpeHXR3YOEMqzusnzzQIIRKp+DZftg8Ecmkw1ieKWR1xrWHm4eGIx/r8sKM
	IrSr4vdimz3YDjs8QngchhZaVHXJ/km8aVL6gWS1r2TDaverdRkSd7qPZCYyPplqXxQT9PwVnDv
	KpCAx6VdPf8+cDBbOMQtmGZwJQp3xMqBxMswh0tvFDruVuPOn7sJs8AVY5varLGluB9a8omB+1/
	u+VvzOwFdn2HwjqsDQwoeY18AtFprmydjlq2J3EJT6t8XyiZRqXUABzEnJGHqEnS1l2/YnhlTMX
	axxtzYh7dMdLyYOc8Cv2vU
X-Received: by 2002:a05:6a00:3c88:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-847f6d6785cmr5452983b3a.12.1783234965144;
        Sun, 05 Jul 2026 00:02:45 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm1998071b3a.46.2026.07.05.00.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:02:44 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: linus.walleij@linaro.org,
	corbet@lwn.net
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: driver-api: pin-control: fix spelling of below
Date: Sun,  5 Jul 2026 15:02:12 +0800
Message-ID: <20260705070212.1123-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of 'bellow' to 'below' in the PM API section.

Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 1f585ecca..80106e44a 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init", "sleep" and "idle".
   selected after the driver probe.
 
 - the ``sleep`` and ``idle`` states are for power management and can only
-  be selected with the PM API bellow.
+  be selected with the PM API below.
 
 PM interfaces
 =================
-- 
2.46.0.windows.1

