Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A6C17BCA
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773075; cv=none; b=T3sWvUwl5xwFrVdwSbH/+4OV0Z3CLpdV+XGTqtnxeU+Az+oaxKmaiGZYXfrHjx7bjdRDolf09b/NqxBJOwGIs093waXNYT99aRLfUauF8ljls8SAfpwt2yvZw2xtEVcIngQt87caFYNDLalLk7qe59o0X5wKAAducfoxKnf75PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773075; c=relaxed/simple;
	bh=4rSZtHlDLJaB2uv/GrrTNg5hx74qMe6US/U7hmvGau4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vlj+0xW2HcDGXB5nKycp3YNqQmMHRamc/ZfQE524bG/Micg762gZnuvTlDpIganHpB2CohebTnIiwxn5An/B/17zXn/RCWbItBHt6vxAhzJZMz6RKGE+GdHOlNsQq84Cf8vxXKgp6hmLaBAaqRq0FTKgxy9uW05NY4pB5or70IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMU64vX2; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMU64vX2"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so748453137.3
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 00:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767773072; x=1768377872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zecwOUY6lT3esKdCrwKhUrQbaY02OdlNIqSrdr/R0Yc=;
        b=fMU64vX2mWJ0AX8hBOgo66m3sV3tHTTYVSujrYkyI8g3WJAJ+kIboYW49GoEWrABmo
         cbvGV3o1PE9g62GWVOseU0xtDJm1ZRzE9aMH5jW7m6LAYAvbO0Yxoy5kYkiPnhVLhnxh
         mKuvTlMZ/d6FniUSK9Nxs6key+LpWC9J5QZ/7xYU+JOs9ah1cuPr6cQg0j7R5FH50hwP
         tFI5oi+7nWsxgqm3pdmcLsFtoOHs57oJjsvUWeAlJKRSG+4tqxOvjsByb5IMhbxb6+dZ
         gaArjGF4Ebsst98F5HAO29ElLI8qkNQDmjvGXr3O/nEjchC5ooKn4u8DDUMkPDLksWT3
         w3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773072; x=1768377872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zecwOUY6lT3esKdCrwKhUrQbaY02OdlNIqSrdr/R0Yc=;
        b=DldiZEjX7JSnoJJoCqeQdAcLtrng1ToQ2LriteEheuDxERrf/5YA2y9J7N9caMFC2U
         vgHCFfnlEFpWxuU7WtpQWQVVkjtfDTDHK48a8W4SUZe1wx5JWxHD2N+dQVhhMLhcfmnv
         asdvvOU0RPJ/vGVbtX87Knl36OfQGV7K0dsQAEWRGFDX/jTPgqJMAFJQguOn1jfDSARS
         9DJYS1h2Ivdg/Zm9yfwx8dayHrjDg3zrBDGsrlzVRfEPjb7e+uaJlvkqTB/gy6RnjYln
         zjrBon5N8ufo8Dd70+ybFnLGwAEnCjPWoDg40aP53AcwKSsvz6zq1Fxg95geVanthz21
         teXg==
X-Gm-Message-State: AOJu0YyHag/3VC1VK/7Mv6Qlbjj4qU2ldfTg/iOEIsbeFH2ZL19DSdzn
	mvQPi1vP9q0nO+LpdUeuBBGKUSDzaE+GaND6/QiNxyk0sbWXEk7p8g7Wta0yPLg8
X-Gm-Gg: AY/fxX7auOiHTFY47MtWFDk4NdCFTymaqVgIT6aNObYCu6EddtsoGgh6FU7GewedLMI
	1OR7zapO7Kl96mizyK+N16xHUKMBM5JPLdqOeLU2pPHeqK/ZcSzka9+/JnmsFCU9Qap0J5Q4OXc
	VS6LiHA8GVP8Occ2XWl0rp/va7G+duALo8gvm28xbXTLlnYUE9sRZotG/Js57eyuh/UcXHurqOe
	i0LituJDSP1TLBnaNI41zojk1lHuw/Uc3RxUVr4yJbuSG2YhE4I/LG6gnY556f0qwztPQgnZLBI
	jnTqdUxwMWSZk2eP5aLZ1MTS9tFzUedI1Wx+bDcL0fnNJXCh3SCIiVD2uVTbn0s1isGbcnvdBgv
	rhE+b9fYAROD/LJXBWlWv0/RlCG6VR/Pv3vdh66AZM25aJg8VXfWkYsliyBlSOwzAxZC9PhRdzU
	b3eCNDlT9zWsfMoCHUx6DZe+X/oz8=
X-Google-Smtp-Source: AGHT+IFTPij8GH53CC2CnagD+KvHgGV+pwbTJE04CrA7K4ExCsYKDmH3CTT+0WQGX7fjx9DulSRliw==
X-Received: by 2002:a05:6102:9d9:b0:5dd:89ab:aa08 with SMTP id ada2fe7eead31-5ecb6882d87mr564156137.19.1767773071949;
        Wed, 07 Jan 2026 00:04:31 -0800 (PST)
Received: from localhost.localdomain ([179.235.13.139])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a378csm2025700241.9.2026.01.07.00.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:04:31 -0800 (PST)
From: Diego Viola <diego.viola@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Diego Viola <diego.viola@gmail.com>
Subject: [PATCH TRIVIAL] CREDITS: add whitespace before opening parentheses
Date: Wed,  7 Jan 2026 05:04:09 -0300
Message-ID: <20260107080411.59483-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

in order to maintain consistent formatting across the file.

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 CREDITS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/CREDITS b/CREDITS
index ca75f110edb6..33b2bc96ddbc 100644
--- a/CREDITS
+++ b/CREDITS
@@ -695,7 +695,7 @@ S: USA
 N: Chih-Jen Chang
 E: chihjenc@scf.usc.edu
 E: chihjen@iis.sinica.edu.tw
-D: IGMP(Internet Group Management Protocol) version 2
+D: IGMP (Internet Group Management Protocol) version 2
 S: 3F, 65 Tajen street
 S: Tamsui town, Taipei county,
 S: Taiwan 251
@@ -1997,7 +1997,7 @@ E: bkaindl@netway.at
 E: edv@bartelt.via.at
 D: Author of a menu based configuration tool, kmenu, which
 D: is the predecessor of 'make menuconfig' and 'make xconfig'.
-D: digiboard driver update(modularisation work and 2.1.x upd)
+D: digiboard driver update (modularisation work and 2.1.x upd)
 S: Tallak 95
 S: 8103 Rein
 S: Austria
@@ -3609,7 +3609,7 @@ S: Finland
 N: Deepak Saxena
 E: dsaxena@plexity.net
 D: I2O kernel layer (config, block, core, pci, net). I2O disk support for LILO
-D: XScale(IOP, IXP) porting and other random ARM bits
+D: XScale (IOP, IXP) porting and other random ARM bits
 S: Portland, OR
 
 N: Eric Schenk
@@ -3986,7 +3986,7 @@ S: D-50968 Köln
 
 N: Tsu-Sheng Tsao
 E: tsusheng@scf.usc.edu
-D: IGMP(Internet Group Management Protocol) version 2
+D: IGMP (Internet Group Management Protocol) version 2
 S: 2F 14 ALY 31 LN 166 SEC 1 SHIH-PEI RD
 S: Taipei
 S: Taiwan 112
-- 
2.52.0

