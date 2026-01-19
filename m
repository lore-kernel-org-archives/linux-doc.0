Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53738F956
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849695; cv=none; b=D6Sjw+7cMzPqjoctD2q5xXZ1g67Ntvf7g/y2I86vV43VnCklRFp6A2pclYKPprGX2GNT4TjdIElrZlLUAWJqKQ48xMIL7AajXBo+sar5/V/kDtRfJmltGWvNzvERWqnbPObgzn8hYrCP2qpTbvDtahgk/h33HKJVWerwLlivl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849695; c=relaxed/simple;
	bh=ISqsKDoXGCE7uargYNsShdMm0Y5qbCliuVj3rq0dN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrbmaCbpdjWqBiOwEK+60t242alepGXvzL/TnwfMloMA91cVUikGj2yDWkMcCNt5ET0WpTDAOdZnkiyeDhEKyWnCgfLLyiiTf49HyC2JvvWFBGe2c4Noaq0RYHeK8Gyua5y1eWzNCNasZpVEvGLWlPKK0LBI4ZA/TxfquGd2oUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnbDmoS1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnbDmoS1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b87f00ec06aso122108366b.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 11:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768849692; x=1769454492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J52ytgfbeFADZKDw62J7y5/K+5VVfpLFyRp/PpNxx+0=;
        b=gnbDmoS1WA/HqV0J1PbvQT3w51c5FOUIQELciYPw/hAAv5tF1i6Ht6FGoSyF73TJBL
         vGcl1eeCUVddqc5TU5FLx4QA8XQpYkpTHtSnuwg9p67/D+UsN05YQpJUgiPr4doCHfet
         kz0EnsM+qP4CJwW083vi4lCp3JJ+JWECp0meDAC/GwwXT7vQAyYSU+6AM0k7cQi+nPWs
         ZB9iuF36PAitWvC4YL1OY/HlQLkj7XN/E9ZbtSJsqFRUv3s6XieUON7prIxpGR0bPTHe
         9d180ocqU2UF5cy9Rv+2ubvJSV0w1N+9/4iL5kaadVbR6Yf6GxS7ahqWfCJS/GzW4wZr
         hTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768849692; x=1769454492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J52ytgfbeFADZKDw62J7y5/K+5VVfpLFyRp/PpNxx+0=;
        b=dmfv0gFFyxKKVbSqlNi5sUHY9lBK8qo8eYj0DUUoD1wh7p0WBYaKSIDnpUQQ5Zs+f8
         ta6HlW23vKTWERWnkiFRz1a1FmFGuwjbe7Q6Xx38eFJ6635LEr6FWNrlbeflL5yobqWm
         w9DmgG9/RDUj2vFhZBkbDpqW+PlVsQX/rFVVTEkEDoqkbbiRxPjJ9rbSjC1EINFRufWH
         WrsumgCCgGB4xOKoKu9yjaFpoY9nhMKs8PEHwefcz9v0mwhz1Frn+Gp0i53HpW1pM8a8
         Xu82JlTA+bcPJXCZSgut4k6RyQcYgxLTqcUSzWT8Nwl3TGReS+3mwphitn3EK0/hnHZj
         fflQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ptK5CYxjVbT8stJ1WMyAgx5lH4gCgQfP2hQ+tPTRmmkBmeBi+CjKPtb4c6cLNNsGA8yNZ9sA+lA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOGs6nH9bN2eKplfCm2Q4aJOVR1sAybG33M1djc6bemScfmh0
	kEWgpNlFbOSWxKWrtwPSv2odgcXUJ8GQxJYsgAsXF8ioLeJA7mD30rpY
X-Gm-Gg: AY/fxX4gI8AF8X+feQvRf2TA/+87+zL5zE0geEkt55uQWle4doA0yQgeQMrHtdiZX+m
	cf0TLAuM4tdf2Tvx7dX+FlYlSTD6dkNxR5MQzac+39H/mh0au40ojyB/8KPYWNeBftqwyG2rhhH
	nbMu2quZVxKTrEFB2RSGZeS8uGlPKfox6+sqkEFQuLwlbx6nei4otZB9sOVfABnNPW+vVT/0IsP
	Eg1N+zuKAYfDckTJ/ZyTBkJGpdnt5f4h5YgXInAPmmhDfucScRQV0VJJJ1sDUy8fNqpeQQ6Mxda
	6wCLuwHB9u/3CZUhvUIy/iF2vNITlXi4S5Xf3oZYu1xMSRpZ5keTvppwExkQqRAqF4aHBdk4yMm
	vnLHoeLq+LtdhICxnXqcgA1Elig7atQW9mTdirtgpfo2XSU07cdhDmftmhmVYx9oWyOUC0f08eR
	MF/Wt/pfgc+pDXmfzYVvz1v2yNL35B2X+P0A==
X-Received: by 2002:a17:907:1c9c:b0:b87:39d:2bb4 with SMTP id a640c23a62f3a-b8793028f6fmr1108598866b.59.1768849691548;
        Mon, 19 Jan 2026 11:08:11 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:a4c5:86fc:3b16:bc0a])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1193767366b.41.2026.01.19.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:08:11 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add hitron,hac300s
Date: Mon, 19 Jan 2026 20:08:05 +0100
Message-ID: <20260119190806.35276-2-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119190806.35276-1-vassilisamir@gmail.com>
References: <20260119190806.35276-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add HiTRON HAC300S PSU to trivial devices since it is simple PMBUS
capable device.

Since this is the first supported device from this vendor, document its
name to the vendor-prefixes.yaml file as well.

Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..efa1957948a5 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -123,6 +123,8 @@ properties:
           - fsl,mma8450
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # HiTRON AC/DC CompactPCI Power Supply
+          - hitron,hac300s
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
           - honeywell,hi6130
             # IBM Common Form Factor Power Supply Versions (all versions)
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..fdb11141e597 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -701,6 +701,8 @@ patternProperties:
     description: Hitachi Ltd.
   "^hitex,.*":
     description: Hitex Development Tools
+  "^hitron,.*":
+    description: HiTRON Electronics Corporation
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
   "^holtek,.*":
-- 
2.47.3

