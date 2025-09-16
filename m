Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16029BDB4
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016358; cv=none; b=cnNrTd8Ey1Dbfsb10yh28o9TZljhQ5vzgikpVlq9UpGPW9XAmwRakmQjVqGx/d/jd2yn0RvXe1FuLI5EDQcDV3n0PTswwFhIHENfDCN3ONsLVnEzjeA0WGnmyvxxhpE6IerpLf7AAj8hT+7U94JYqlgGZzk+Zn2q1D4s077hyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016358; c=relaxed/simple;
	bh=M9V51AxzPBO5PwhtBLVHE9xHOolKyukF4W20dH50Hk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhYAx2Ss6dvMuZrZedsZsxCtpBWVuOvZO7pNQS+KiAZXw6bz0e7cRQ8bMytMyU52TJKAq54xGSBWeI8mbwgyvZk/auclF4Qed6U1L8+jKmAfMKkr20JN8GKdcq7Bvie/PxaXBovO3eCnVbPBh41h39bQQLM58lz9wzcbKvK7jLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8b7oQg+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8b7oQg+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7762021c574so2887873b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 02:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758016355; x=1758621155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6V/2JKFCs/FeFWLTSODQDr7ffITBUaTSIVuTLike6oc=;
        b=H8b7oQg+0i+beSJ9kOLlOa+OQQES1ULqg896ntTDjZYEIbCJ2VqItDnVuErZr2pEsz
         xmPHVK3pc5CZuEURXZcxGLM2sZN0GdLsz+TvpK0YQdcrUKNLSSf793w8qbsA+/WJBqmf
         L782SVhe9emv8DZENORzOUsyqewCtWb4UHfysgUqEfloC14KHAKx+XTezwqoIrjnpOR7
         +H3zX8f8OPbpM9dO9wun0L3SQpOSgCI6Lw+WwdP3JQtTqioQKpGxCigq+Q8rs/bEYP0V
         gsV7IbZBQhJBVQX3cLsRGd6BuewJp/Tz2/TZKeDFa18nvy0BnC8hH0aPWoRCh0WofJL5
         QBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758016355; x=1758621155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V/2JKFCs/FeFWLTSODQDr7ffITBUaTSIVuTLike6oc=;
        b=po/CiSspU/tbJT2oCWN1+qZSpZi3Fsiuurlhd9owpCjAwYV7AIGrd+jbImQn1vbt8/
         vUR0BLLP/l2unlzFjHDqkZnHAuKWmil5taKnpWaE8nx/UJd70oDYKS3d1HKyTkxTmLV/
         7DbL6FAx0dka0taH39E2Ikf+84Uu4X1IDRqnyM2i3QDbM4yMjABOmd96afmzAvjVH9rT
         AM98E/G/v3wpZWLEzzauGKlCo2BtxYg6/SSn+gfVjdZuU+KALpVZM1XVWzAfRxnqVNq7
         xjxa7t1Jjg5bZTK98TV6yEfI/trFccWFOr1CJsj8YMdorDg7yesB70gZAozfzABZM8Fr
         ydwg==
X-Forwarded-Encrypted: i=1; AJvYcCVAG6eOivu+s1InSHoWXrbSjeKLHpHfQTwN4XLdMfcOC7aqvxt4DuHvcitWF6nJYv+qGzdjBu7Pw1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyzt1M+dFjH//V92zpo8Jdqv+bYpENi04VPAD8BTw/cxryHT8I
	T2Fm6We9pEh/8NDeBmJJwGPaq/K8jg1Rk4z729JDUbPOyPVKUYgtJTJr9vSVIw==
X-Gm-Gg: ASbGnctVXvQ9QW7+Kwa+DrFXr4wM9yHe+TFuZ1uRvUG8tWnR68zO9a89bTZwq4vtcMJ
	MdA8YlYCDXfvbwbKIs080Eo3JEYF/v0VUyfu6hA5OHpaWtk+R1xMrjE+Wcwv1JB6xa2k36ei+qH
	iJ3QWxyaKh+4I6hzOMTo1Zi54VFAHMsDR4VeXAYqExmwhEY9vXRPBeJVn5ip+El3xP0EDdu/Kuu
	rAg8qlIUugfO6+RDqBGgyUfEjmCzUAqy1x4sIiuBaft2+Xe5nU/McigStUwiQAbVrxIguxDwl8g
	1pIWuoCcTddy7STYtpgVksqUHoZXAGVq5+Hd1UGcOc/d7+zTGDOgvBjCB/qvvtWJf/wgn66m8eP
	Z/qf08frQg8Vgog2ZwxM9gDiYCDvnBfwzt/H+CPWBX5cuCFzHyr7Met5AjW3QQoAjZhbN6qTkMl
	vES9SXcQDYQENvsE7H6B12Vg4=
X-Google-Smtp-Source: AGHT+IGzMLRxu46ZOAx5UTCfKaKDFqV7qJKe5pWFw2whXOGJeDPlIq5qn0wXezBFeDOYYir7k6rHew==
X-Received: by 2002:a17:902:d504:b0:267:c8d3:21ca with SMTP id d9443c01a7336-267c8d324eamr34843155ad.44.1758016355232;
        Tue, 16 Sep 2025 02:52:35 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2667b4d380csm53935775ad.71.2025.09.16.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:52:34 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: add mps,mp5998
Date: Tue, 16 Sep 2025 17:50:25 +0800
Message-ID: <20250916095026.800164-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for MPS mp5998 hot-swap controller.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index f3dd18681aa6..d86b2b72d1af 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -305,6 +305,8 @@ properties:
           - mps,mp5920
             # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
           - mps,mp5990
+            # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5998
+          - mps,mp5998
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
             # Temperature sensor with integrated fan control
-- 
2.43.0

