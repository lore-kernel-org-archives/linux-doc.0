Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099B379966
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238017; cv=none; b=TqQnaYnVdWSMHwGyFulYY93bdexJhIJ/i3HM0Pp2t3G3Ov9nS9hh+euw6+dJxqFDm7dAEE8s7aebrv41lVL+VtyDyqfCpJyd+FGgFhTx+Gx8ts7v39O8kzTGRuVNGQggETcMsxP12Dszy1yoEmEV0zhtvUPX/I3bszbUqp7wAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238017; c=relaxed/simple;
	bh=eOnk/u/GrSWEzyj0PXJycE8kCXganuI9Yeoa4tZRL/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnhLiRslcqGYedW88mRbXJlcQx0H64vz4GHRDSkoSkVXPie+P3MDtndoeHGgCoAiCDNALq87jEf3W5IsIBOuJA5dQzBvvVjTRJO3YkKiN3gLDsB4K1Lt7d5pGvWr+Sjd/juJkrKCSTnfeX34WZxa8cYS6wN/JfaDvN0qKoiJHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=lEPecpFZ; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="lEPecpFZ"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026082015000089b34592a2000207e0
        for <linux-doc@vger.kernel.org>;
        Thu, 20 Aug 2026 17:00:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dQKBkoYJT617xzrt/A2MoQz1lnW09udjgRt3UhSYhFA=;
 b=lEPecpFZh4K1omCGsdNkFfY0dk6AztHFoEuwjPuZD3j24ZfdjsdUJCoAtpq+ZzQkovgKXb
 6QFrAvUMdGp6sOB//P5WSkjHYeE/rizgUuKoqRrr01YzSHDkKfkemAtxmECvdl8+mIjiM5l/
 3gMVyxvSVCGzYFNJOc8NvTHUMLLLpVqVgD2Ps0LFcvAc14OjjcSDsdbBnlR0okAM3kfViLHB
 Ct8y/sXINFYezsMxwKbGgo9kWuTTa/eEwaMSJMCmGnPDFFO2icR99CEgXcViJxkNTQk1r021
 EIofnjU/cmZuqqtEoxhiTHSqgqoxuFt1lzxtuWCXwlztEBCKvgj4gkcw==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x series
Date: Thu, 20 Aug 2026 16:59:45 +0200
Message-ID: <20260820145946.35468-2-alessandro.zini@siemens.com>
In-Reply-To: <20260820145946.35468-1-alessandro.zini@siemens.com>
References: <20260820145946.35468-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
series of digital temperature sensors.

Link: https://sensirion.com/resource/datasheet/sts4x
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 435c4baab4365..48ded1b746723 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -423,6 +423,8 @@ properties:
           - sensirion,sht21
           - sensirion,sht25
           - sensirion,sht4x
+            # Sensirion temperature sensor with I2C interface
+          - sensirion,sts40
             # Sensortek 3 axis accelerometer
           - sensortek,stk8312
             # Sensortek 3 axis accelerometer
-- 
2.55.0

