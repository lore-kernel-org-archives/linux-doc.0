Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95952BDC1C
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783235095; cv=none; b=EHbktxtDBntslwPS5rzgz+JqKKUd/N9IFwy61cZ1fzHGV2TDUHrh3yEVpjHKJk1WodphcsFl+jI+5TAFLoxJYeKOzn4rcT/LtEEGibVXa+6GE6RE5Z4MErIIVq9qEzJcoDIbJ+GGT+XitEr7/kXTPrgb7vBypJ1lemCCDdyjy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783235095; c=relaxed/simple;
	bh=rVUEl79PoXlXUwAmZC2UErhUtKZCSu0B1xf6Wz6IFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dcc3hYYJS6rw0YhhfotBGWIIRDhKoI14pQqaSgU2CdLOPrXa0AR/OsUv5h5WUvBDB9N2yqK38hbCuS+Lm3GOA6VwkDsFUFcQzx43r+22Rq10+329KRYeha+YfDSvOQhCJJGZq53bRygnIrQsphXuIOlWJ7hcifbOMmq1dVYduXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otsbk5at; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otsbk5at"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-842338c18e0so1546525b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783235094; x=1783839894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=otsbk5atf66UubxH+brOs/j3GW8dAEIbsHYGvvNLRt5K2KYQuNzJOnDQ3pqigI97WU
         vhMW1pkZzU6ZEzDz/gfpTDZw/forUg2LDY4vEtqZRJxNyLqi08kmtt8enheiKEujVgSQ
         E+pHy4a7X/D6EHxVr0vFguyEGNOMwYi9vZUHTyAfyjdB5Ck8kO6s74KP3FjhEMPfxLaM
         rgpbSIW/jvEVzfDlXOujm2LYlVOnAMhVd9EXpBAvdS0EAHZPXDnUTTEHyGpPxgB4FfRe
         edKN1wTHGIwhmBUm8sHMWpBjW3/f2sJmzZIRfPnlWdxIcGff9TfGsunjz4ENmOrCHFpq
         aW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783235094; x=1783839894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=PmFypLPAJobkEe0O5PLiDe145VOuebYJfMMtuGprHFg7JDPOHSUPwaySFlJTHREjRR
         CDMQckdoC5m0UdiKFF7ZHXFh+2wWIVJ8IK8UClR46++y1yHPLA9FfJTkEohHDY/Zyhyk
         deC97+X2jnZ5mauM0cEvyaMGeXB8LbHXagaXeSgTzr3mZ7hn3Z553897SvrZr3SXbHUs
         WmRyEsJYXd9TCRt4zTAkpq7rDdupaQr2YUPnfva7Nb5tM1V0dmxjQi1DwbGUHFsHOYb3
         azod2ZKhYliG44OGwRdkIKu0g+lcrvJuP1aS94HNs+2LCU2mAFdYHbnrqZ3udM5Bd0xj
         Nc5g==
X-Forwarded-Encrypted: i=1; AHgh+RrIyL1AScZVLZ3oAprYRe9IvEuc5nU7cwObXNtwOgs7Kjwae38AOqQjavO13t18A3RsWXP2iQISOKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrwg8PGSg1b+MlaBrlHCxIPeHVspIu4dJT/GPtJho0Tin5eT/
	qXoqkrFqGKoZbV9Id9ToBRhgx1+IRJFzs6J/0Uq71KLeIs9VMvUARLCR
X-Gm-Gg: AfdE7ckYQNo54Ze6vZOFIP2ob2K1UxeMXA5sX7u2YrrM15bjVCy6lE8RZy2Ve3iidwv
	ieKpT5i6UiBedqJh/TIUBBr+E/G6MoIHgraue8P6Sf22ipbztljxNMXS9C9eeHSyI/DuIKhIUTM
	YzfnUmGP7NMt3I9XXYIkHK89gJIJlkmYyTYwzPDhGzacsjvN+qYUY+OjxXGK+zhA4e/zlONkdI8
	EAxX9Vfben5O+8JdMzY8basUCqu1xJh+6VA2jfGqWbrNTkPuj/k8W/U4QdAcVugR+v5ogot9AR6
	QS4msyQaMOkxhvg3E3Q6Px99bytf6SA2225s4rIdSwGXURXaXGzDZsyqj4Exi3dQycvPXLax0+/
	78xp47VKnPu4StqDyfb89BXcpAV7TOvg2L2FmVD1X4ME4qg8imtd47284xedQdrQcuhxbLx7pAD
	suQzcHxe0HPdj1rAb0+HPm
X-Received: by 2002:a05:6a00:189e:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-847f6d67be4mr5897810b3a.10.1783235094116;
        Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bcf03bsm2012675b3a.26.2026.07.05.00.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:04:53 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: linusw@kernel.org,
	corbet@lwn.net
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: driver-api: pin-control: fix spelling of below
Date: Sun,  5 Jul 2026 15:04:22 +0800
Message-ID: <20260705070422.764-1-ceohunk@gmail.com>
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

