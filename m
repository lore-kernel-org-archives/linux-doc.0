Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159456;
	b=QlZlz9a/bZiom+PwcneOVu8FfUVgmk8rTXnfNE/CkLobDSq83zCpDETR0iWy3wfIPYal
	 bPHD2wXxo2D3s+v5neAbQmAlVPhwZin88IsDyXN7s2YBn1KZlbPu/jRBUe0e8wh0NNNFb
	 jhpyYszizu5zutUgehk/GmQZLTa3Y53Wk8z91h1wpP14MOtvHEX2MOAn+Tx5VoaejWs7H
	 gsWvr7uUmNUGRnoZVJyxV7YeQ9f1iiAUQm5I+Gx+vZQ3XBiTQHSBmlo2Nk3FTmpFCELJI
	 Mrl8FKeiEXxOWDJNATzO0gR3l1mpaP9KNnca9rPDtaAWtsDQg1/BRZElBeI0lrPEP6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159456;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=B8saxQIRuryLIB2uPbtxpxz9Dxl7rb7rJLmHtBeiJyo=;
	b=gkKXpa2N/OaWsmGyDcil7obl8yYPb2FrjsPxiux2OeJxtc78wsVDCjLFD5+nj8itvgxF
	 GMPOeWoeYahDKnf+iRwvEZWxFA0/2UlE7r6hLn0YJp8p7hvIs61xCu5srZ6dXiBYQ85Xe
	 Sq01FDF3X7ojAqrG1CuyRLyFpP23IsTyE1Uh2+XBLntovUzuzgcE9vw391DIf18624BZg
	 9jktEq4xgN969tYt3UreXEr19pLI2fOUHIP27U5/jPwAI1lN8AaRKja02I81BaVHYLNw9
	 76mb+/lKeHmSE/8t6iH/nYNKqtBM9nMjuVLHETbYtcJ1gX6qlRzTTe3JwHRk9zjg+lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kuXg0NZF;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C073606A320
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 07:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C073606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kuXg0NZF
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA201C2F4DD;
	Fri, 20 Nov 2026 07:24:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5555D6017D;
	Fri, 20 Nov 2026 07:24:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07FBD11BC1101;
	Fri, 20 Nov 2026 08:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795159451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B8saxQIRuryLIB2uPbtxpxz9Dxl7rb7rJLmHtBeiJyo=;
	b=kuXg0NZFplGDB68XyNfvSFTb7ZeU55Oj1B13Q9K7Z/bmnKqmdMyBc43r6zwjagH/0xNgmn
	Lo58UJ2TjCCvC03N5ncXiucAOYbLQR6HSGBRXiNNguhZFyPeHVERkomZhGJqhB6djr32UI
	ngXm493SdO/ik0Qv+7ec3I+3oHwwUF9TIykJjqazO3QMh9W9kB6+AMMqaVWV3u2ly+g5Mv
	n57BUo1U1x1GF8QOby6bH3Pf73udwECF4AEyWZorJfCFRg/RQaUj/raRJvP7BoMtVVFZUb
	/uhmjm36zi/2cbJ6dYs/n/AUoTcUlZ6cllzncKsOJQ3Zh1krmdh1tZa9t3sNmA==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 20 Nov 2026 08:23:53 +0100
Subject: [PATCH v10 1/5] dt-bindings: vendor-prefixes: Add AAEON vendor
 prefix
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-dev-b4-aaeon-mcu-driver-v10-1-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, mfd@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add the AAEON vendor prefix to support the AAEON SRG-IMX8P MCU driver
devicetree bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..a7d2f773df1a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -32,6 +32,8 @@ patternProperties:
     description: 8devices, UAB
   "^9tripod,.*":
     description: Shenzhen 9Tripod Innovation and Development CO., LTD.
+  "^aaeon,.*":
+    description: AAEON
   "^abb,.*":
     description: ABB
   "^abilis,.*":

-- 
2.56.0

