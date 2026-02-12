Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604512DB7A1
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885911; cv=none; b=krq6b15G4GQiBn9dgBYN8dALQXG3vGLpeNxnRL88DkGBd6y1mXsyDQY4iej8ryloivg7A+8vj1MtsOLusrzCExdr91KFUG69DTxiWoM8fEV3C/Splcqk85IipBuxBeFnN7Bo+Dfn/aatuI4MjlY5ITks2EjiEgA4OKuPB/w04hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885911; c=relaxed/simple;
	bh=S4LjTcY8WIdOz/Fa9CMVBB3lEWE7ucfcbiatZtIUpyw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S8frYoJRDOMXPzxrlPW97dUmNlUuRK3fRuA0qhzCIqjpupBLd0OPqh72IVnXTCP35wi0cRF/jaf2Sb0LO/17LPCLMZvOdgBZryGXeNUtf2rBCPtutigFOMkFxQ5ShaMLkMHNpnf2l54IgquSVwUc/NPGGRm7crURJ7RtTVqMHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DoRu0aph; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DoRu0aph"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso17167685e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770885908; x=1771490708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NGh5IYyCcy/eOuT/iqO1H2zbkd7MZApIvvP1+BGFLo=;
        b=DoRu0aphxfMikLEkIws/gZ35AFAAaWq50/8p/ZB3104FdVmD5QkUvLccyEFLbs0JCV
         dI79B4H/pkuoUWFy72hZ0J06XCkQZPkDLqcI0QrNZM9JQn01FgqfodRKsVJ5XdW651EH
         WUMeViR+kCkUytG7nyxYOze/8yXBYF9Bi/r/wpCPBMUeiVZySfrYRhmS8IhpF9Gg4Cd1
         +K9lnwc2guj77uAYJsQ02ilAa60L3Oo1xtiVA11hTLoz2OBLwqAuJJvVh36eYdYlYc4q
         P9olHw5Hz+pkazv+l7oVHbbbxpRdT1ZqfZaffvlmpWtkLcnwPl3DkdySR+4LeK3xxCjw
         gmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885908; x=1771490708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2NGh5IYyCcy/eOuT/iqO1H2zbkd7MZApIvvP1+BGFLo=;
        b=mYInI9PxKMVjQ253NlycyNqlMITqEczIrRtJlAhER9tFbGi478MtMs38vTkewQ/ycq
         Ys9RiNgr9zS738ZfOoulDSN5YBiOI8fZKoxJg0Q+bTIllYPyZtuG5Mr6dhnhl3uqxXUp
         9EZOzpbcQ6oN+p1uQN/OjzrK91QQhb4Nr/+L+3knUek98/PuG4Bt6maYPWoVre0OWIEO
         2jPAHrIrA1BzmpyXYArpRZyBEgP9B0P7z030zHKZ87pHGdgHPmvMrYLvVRdQF/e7boDl
         t1uuhZojaWMMcJG4eHQ6t+89wqEGbLJZ6W9e7kuSGP1CQjw4xwDTLsRZ1Jw8ONb+m8O3
         R82w==
X-Forwarded-Encrypted: i=1; AJvYcCWTDEhgbVUjNNmEoOlXMqYKEYy9r8SFXX4DQOQh1aRL0xvw6gGHjps7/M8Q61UnLvbflZFC0U1L4Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJWYig3uayrGrpQ+UmdHrcDd1sZUPqJQgTNQpIeVVHAWYxSuI
	jARbUExSY2lZM4CZLh24ILzhaiulMH5LKMLNhHFeiHBnDd69R6EBajBu8gvKFVoOi4M=
X-Gm-Gg: AZuq6aLwbWBfBsFBeb+qTAOoto7/LVuLNJBQILy+V11dvjptU5LDOFUCJ3B4TB3wVz0
	nDeBqVlDPnp7aSFuNaPoP9rLEyuBwAfPDKOpSJjlgQVkV1DKo+4dw/D7OivF1U21wjy1pucPAIp
	sRiJ/fyOZWXYZkxzrNdLwKzym5374MilY+fPTgesEhPSMo6qqXfNiQ/OHuIz9oH+kzK8vV1EzyF
	wcamUC0/LsAcsFC3IrjIAbAGNoe5Inb7vJO/YjG1MWsMBndr6R95CKW6a+iHoGAs5H5pfm5lDl4
	BzfHSE+cfdQFAIxbcg57B2cshPfmkcxnKCZdj7TCRN77blUYmABQF3QZsEhN85z/KmlftyEEPvh
	8dB1litYnR15kqGhNyCqsmx09IXzms0wCp/lZGRxM/xChs6f0hr6LRP9omB9iXw59YhlUV6/FJH
	yNT0G0wD2/kiBQalfXj9C50152wx/F+PjLNsShkMVGQ0ZvH/dektpSBj2/DJsoRfpefRXV5zF4R
	3Lbd2yDSQ==
X-Received: by 2002:a05:600c:4e4f:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-483660425a9mr22340565e9.18.1770885907761;
        Thu, 12 Feb 2026 00:45:07 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm82753705e9.13.2026.02.12.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:45:07 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v1 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689 support
Date: Thu, 12 Feb 2026 10:45:01 +0200
Message-Id: <20260212084502.1795-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212084502.1795-1-sbogdanov@baylibre.com>
References: <20260212084502.1795-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..973ee00c2c49 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.34.1

