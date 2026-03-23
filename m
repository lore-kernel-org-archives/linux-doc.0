Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577433B3BE5
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283004; cv=none; b=pb6W5AoootbTJpRPFsK5CJzm6wKqBF8wazLsUpLdalKLqrqmRdgtOeCQU1eIcc0IRstMRI87yvOQmLLmcC0V20fF9WOOgcTBrF+9keY/g7lP/3MuL9TlUsNtVsY9S07XXIUJYqhagy5RzNweuBN60bRcCwbQeTzic46zowM2zf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283004; c=relaxed/simple;
	bh=MU1UHlCT8FzYV5iBozHmfjiLmGEZw1XWty2n8Ga4oV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeS4dDxwjdBEY3eyXY/uWgwPMD5hK5tB495UDZre7479LvlS108ej1P0Cm+iLPO7z4XdKPyoaEN/OsqL7nIn9jfKiqZbdE4gC9q8o76BO1CnulNATdD4GIkBhbd5EYdKkp/waPN5hcXoGPrGmOmJUT0pEbFg/XAK83IqdHR7U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpC46tZ1; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpC46tZ1"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c757a9251faso1102944a12.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283003; x=1774887803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=JpC46tZ1sO3V/E7u+alV/2lzQFnVKps/Wx0H+7OPd5nsYqEKfl4MJnJOAmC3O/BJDE
         XcR8IJJIvcL9jO7hdUFOM8XwjIKpZNOZpHzJcV0G+JO4RTSNcFaD3DOHrqI4N8Hqbr9q
         1U6GoJIbMfk5ARmST4oXxEBPQc7neBe9jxgRFt485cN6m7BqqV5c4acyIELND7GfRKCc
         kPVq9lIJBUJ2ECJYU6ogeVJ4eAzg5CgLcH78fz1W09ZookAWOmo7YMXjsylg1pzvXAcL
         Yd8UXSLXDFEf5GqcJ0G59N1kDQc+0Hs8EgpRig1oAa7FSphD95lSUJRQSUDuQ/c4Zych
         AwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283003; x=1774887803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=hZ7vWLYwXnEZf6P8kH9Lf5VmkQPBFju9afWqgBNNYIk4hvt1ZNgr3RDFBErb61dM10
         cxKbxoWpIW//45ScpXa11EtqsvYT97CfAJW4XcPN9V6OfXbH6P86bWBhu8uOLmCZ1mbY
         ksVyh2eQ1J6CUTu9dBU3YJmCJcxEXMFKp9I3TXjB0qeRftPH4InbMzzU3fpDclaYMN2Z
         YbuVPCe6ELRpW4KFt3aArX/J71LYjwriaqMmHlu8RdRwejqwEN9dVeJlNivW14QATS57
         7Pu2XqW9QSuEmEC86p8qorQAhTLfrF3w5JXrTWWH8f/rIu9yixGybKfxncGsq+lVeA2j
         JwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0EGVIV4kXqRVtldck2SUQ9zasjkMjrY7+qiqTGFB4+dznjIPROmFHWw9p+M+4riFFGsrfdGqTeYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMdPlB2po5s1E+64k90i7klvKKyMNOXefJ+lMWGuslrQpsPIgA
	U6gl1PNb4Bak/r/Mniat5XgTAVb1kWOCRsF8Zw2biNSuYhGCPnnf9bLs
X-Gm-Gg: ATEYQzw2K0ym5/RnJm4cTN9/6bQvG0dnipBqZN16Wtms233SIkmFF4eU85lThDRGuJN
	0TFaHkwisYelvT3ZxZOUxTNOAmbUhHMTy5g/B6DNDcZ6HQbeb7cTg6MqGmIIxIqsTIWb14g3lPt
	Lnq1Bf+8eQHoXMMZ4RSwtWZmedS4Y47ez0nW12HAzmU1uC8XMnkNdOuMfT5xVYjovUc8q66viON
	q+kLoo+8/CzeBnkrrAhxQ3cWGxZIzSxfFSzRKzlkSi+rkln4I6RBJSk0oXVosaCzFw6QB96X2m1
	y+JLunir2dserZiVdfOj7l08c65q4YmucVVFpGxlFRKQnOHQ2wGpNsLkkOL1tNQ/qQ1fDSuUrnY
	WGtBOTrDMpNcOSQsfuGS5BbDr55/fmD2hmd0sYNJcY26+nWbHvOwgk6bLGk98GEBT7ddXgNzkSa
	qY1Xckoz0zAgHxOhKVmp4dzs1e64D6YFTNkJw6KSZ1J6Mb+k/zcG8EfjIGth6xcOUzS+wSXUwqf
	6nBYgtBL6EeMWaKY2/pI5fbHbfrjGBxZcfn5Z7TNw==
X-Received: by 2002:a17:903:1d0:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0827484ebmr126158735ad.23.1774283002534;
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 1/3] dt-bindings: hwmon: Add support for NXP P3T1084UK temperature sensor
Date: Mon, 23 Mar 2026 21:52:50 +0530
Message-ID: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The P3T1084UK is an NXP digital temperature sensor compatible with the
Texas Instruments TMP108 register and protocol specification. This patch
extends the existing DT binding for "ti,tmp108" to document the
compatible string for P3T1084UK so that the hwmon TMP108 driver can
bind to this device.

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index 9f6c9f6fa561..47714df5aaff 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,20 +4,21 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
+title: TMP108/P3T1035/P3T1084/P3T1085/P3T2030 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
+  The TMP108 or NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) is a digital-
   output temperature sensor with a dynamically-programmable limit window,
   and under- and over-temperature alert functions.
 
-  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
+  NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) supports I3C.
 
   Datasheets:
     https://www.ti.com/product/TMP108
+    https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
 
@@ -28,6 +29,7 @@ properties:
           - const: nxp,p3t2030
           - const: nxp,p3t1035
       - const: nxp,p3t1035
+      - const: nxp,p3t1084
       - const: nxp,p3t1085
       - const: ti,tmp108
 
-- 
2.34.1

