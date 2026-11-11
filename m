Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413793;
	b=1DDCfcDm0uf6akGuW4jOdTmqiik00N6G3J4Uu3s70N90TrPK3pLOcs5FsLwVnTWZMZ7A
	 tRfZrXntdp/dMTidtKhrKb7/LdQx4LUpXBNL4ClV47gec0L8w6ZAIulAgbsLcK2mKttDb
	 oXqNegjmarOhKW14zEM5OgYO+pXOzsfltTF2XxVJpn3Y60BnnRwVS1mhssdxgG4N83m+x
	 wEOf/Ysub7mRdd14JLb0IEitoQQlqDH0NMfJ06ZSi73OXcddC01curN4mogu/rscnS90I
	 ZkAJjW2i9UeU4fn0l3oyd9qY0VbQGRcfteQWW248YQHlBwi9kju58cUHeBZ0bROcIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
	b=gBcM1k8P5AW7fkoCIVeIVJ/p3o+Ox+4cfd+fhjGyh9L69QrKQKHS+I24i0VTP0/d7543
	 SzcY6H6T8A0GccKhPqe3yTOheJpaeE+E11bYX4nz4F7QZR5gcjSVGbhN+AZKYMTDV2MXU
	 JzQY6AmpJ7LBpqx/s2WYmhSGh5+lpjUnUCXqb7gSF4LluNIqH5y7FMSXk7hjXNdJsRG5v
	 ip75+AhQzf17xSK4qsk51qhx7XO1azlIOXgkuUPrs98dT3XgDBmENXiOO72NLm5cM6meV
	 MTZceJZn2zoa+wCTFr7c8m/gol04dVmARBSyWHgcpkxY5uonMNZi4Ndggu6Sehf7muQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9707606A32A
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9707606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=l7LxDYNQ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32057515e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413791; x=1795018591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=l7LxDYNQO/ktuoSV8CAdZ5TDHuJEAW/pzLB0sbQ0wOpmhAl7anQ4L1+DrgtEFMHXTi
         qPszFxpwtRiPrtM5FHhfHHjGOOkJbv4lDlpEnSGomlz6tMwSYv7Vcgq+ZndRH8td/Dc/
         7RtyNgIYqr89gQ82DAQnBor2py8ks/BVoCJPCcHZCwfbaozBctN4ATrL6931ZzqdXDZP
         UOguDUjcJwm+W7lEKIy7LoyabOnqyDnI+JJarCo/FLj8HR2Iv0jNn/b/4cq/Liv5MntV
         MZ/TFVTYRhWico5wfus7vRP4XOk4IThG9z5XjfZ7JjecTWNXSXhqcGpatjK3dMs/TPgo
         ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413791; x=1795018591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWKya5sSJ9j067I6HNGIq62Mm3D1tDLxOBn52Ir8mow=;
        b=TuJRHOV68U3A/cYuMfwdIDnO5hiqPpyH9e5G4MuwSUiRjao3amJRbd12/M+qaxtnHl
         ml+jyULoO3r2ffeThw3NQ417D2J4a4t+buf0GUDtk5+9OPNEQ23eoZqTNsi9kMKYkVb+
         i1FSuuUy+9wukMc9FTbLe2890J6VsA2iBueRUuCZ57L0Cy9qf3dcNGiiyDaRieUPKzqZ
         OccBjk8EDe5oXaL4vXATDBXV45UqSo+BlWhegj/LNcR0YT8l5nhDizXZms5MDHrC/lOw
         n4BiEfNuPkiLI+K2Sb6cWtb+56CRzaNxPE0X+jZmXEAPl7reI9wwY5PN7UK1p0L9gDH9
         Qqfg==
X-Forwarded-Encrypted: i=1; AL+hErGaX+FwNUfbuVPnVK83JxPaLEjrFJSLla2W2HV+sI3T8+a8G+F6I6/+TdJX5WIVprqsjDpFivHZgB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xx4sfMlbxTxVVLBCn93mzycWMIoKUSme5IHsBk/ih9jIGYeyP
	0gNkt6oFQS7sM3Yk64OF8D3wZr8EDHlyQ8UQpr6YWDepoJ7pgnucV/OCtqOz2/fyCKY=
X-Gm-Gg: AYBFou3y40WNY59TfSo1xsTnz61nG7Q5ERCH88WEMcul29vmRsHiEELfzT5QKwylW8/
	EjQuQt1kbN5feSSjD4eWa4PMfAuxAgtcBiiWfR/2EZVcuNWEIbC1SQtLFjJhXDU6cKaPuCV0cv+
	2Yun86ZAYtmYHD3UOPJk/wyvma21AxgMEJCfFYvtAaaNlcHi8FRDEo87sznFBlLmCZxIQ+GOQkA
	SXaG1p/6KwOXth1wZWsY2w7raWSU9iFFu614l8bkIVavrcES6E8uFv64QnuD6pfs9KJOLOz/tH/
	gGXlFnptxATUObmzuE5zl41K2ZeJffIhOMi51fMTiHoETNeJcwMwLeJEB0GZ6TccWNCvv0w1ynf
	TmycVxJQ9qQFRDfd1kpvUHCv0doFuqbzh8ywFGCqj8kDezE7NkCjdAPnjX4rWx7fCosOdrgKuJi
	VKkVUUGQWFJvExQvWo25Bu66wcDBNrYV1mAUFmNfgLguSwEhbjBM84UxeJEpnvIzP7JIQcUXQ0o
	QJEVzHK+ZeqSnRU6NLLJKattPSZLHyarxf/wjW+9SuWpk/bh59SXHXbRgiJAHwqi3aJ5UOe/ceu
	CiEsbcpDC5NmpJE0DKvR5Ct4/ZxToo3r3oiDc53ogADL/UIc15kxk/WveNV2BfTuMEPmNTiDVT3
	JU8MxDqp2N076KroK9IYtypjKcZssZUDNbZDwlfogHUlapCUM7fmVo8eknf9wgjhQ9oRC1FPjXO
	U9akdTs24neLQVgizCPh/6c4I=
X-Received: by 2002:a05:600c:4e87:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ba0938ae31mr51209845e9.32.1794413791046;
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:29 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero pulses per revolution
Date: Wed, 11 Nov 2026 17:12:45 +0100
Message-ID: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A fan sensor cannot produce zero tachometer pulses per revolution.
Add a minimum of one to the shared fan schema so every user rejects
this invalid value.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- New patch: require at least one pulse per revolution in fan-common.

 Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
index 0fb7380816994..63a369628a3a1 100644
--- a/Documentation/devicetree/bindings/hwmon/fan-common.yaml
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -27,6 +27,7 @@ properties:
     description:
       The number of pulse from fan sensor per revolution.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
     maximum: 4
 
   tach-div:
-- 
2.56.0

