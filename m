Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118137;
	b=Prozq/IdrIR8MEy7x9kBa35GLA7syOacdg7RDWwIQmZ4stjrHHrHNGsKjRhi5nDYniu2
	 xkr2ZDaFCT7BD+tSlznXF7oKnaS3iKJicnil/QYk7YCEG/gK1byOyBWgTq514EqEYQLux
	 k1B5VSD9T46M+tb9clLpNlVieBgQ5ZviDz0mHZSl1TIHev4xEbhGg9cf6SkZtRWPyMNaC
	 Mvqod3SlwCOZpls1CFrz+6VMnYRj7Lxgs/ewSQF87WepydMkh18tJWXv+qgAgdy5VUD12
	 ogGjJYF3t8BJu04ol7zOVUFfxWJ1feljZVq88NzIW5HoATge/uXFhGstfQcDvDmGT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=js2MD0PTA3Lg0OcW38RKzagMzlmyLiGGLY7z9KtjNin8836mRAZDd1J4p+L8jQavsW+k
	 QNzVjcP1zebfW3+XQlXKkLDf875tBMNYN+si9aSJ5Z5wBRbj+k90P6lXuInbGCfjd3ayS
	 MSYtvEFgqNGJ85JZLjJ9JgUFAJ7ZCNci0VV/hSMLpP7yzVp9SLtAQVQvXH3ziecVltCcu
	 N4J13DrsIc1q0WC/D0lecW9GIJzE4NXtEun6OZZnG6tWWfsAWxDHC2vJKlfG9wejo1NVw
	 0bX3DCkGLYioGj9sfOxS9BVSLdM08JhSPJ3T0kPLVBFfqmoj1618DHHOdmbRx/y0l4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7F606A33C
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB7F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so56038f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=awL9SL51GAF94ZkXOA2QXOfkl6D8oBwv43SYFqN1vMM9CcQo1zA27EcNnQ8ErXm+9b
         +KvbYSFDOwcqKPJFgpTZNqqXGuEEGXh0tuQhtRw2YR8xJBgYFN2m2Vn/k23U0NP6F5ou
         GZXMdZ+X/OrhPq5aCgrMoQlZ/NPbOsoYN/ap1Pq+c7OZgT8bVOG26Tm3cum2LM9s/833
         HyxRevCtklZWrHfuOYhpJIa0Qaw1TIj2yQMkFHBD0vo0t8EGtnGyqxMDRO8JbUemq/Cc
         j2OT3Wqu2twsZrgYKy9Ae6dGak8BtQ+gbGvplCriw5mpLSYrFweu7LW6hnFsPemfytzM
         ICSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=iXBpcBOIoiANX0mjPvpxpfQNRWhyLn0GkpW3PvpxBMCSJIzxvS+HQxg/MdrYaKtipE
         DB+sMwwiumLlcswOBNTERo6HXm68DoZSu5jtJ23DZ/2LtiOWmebt+V90pIfAFFUg9vdD
         093dVEIIp3Wzn+3gTlDOnKOc9DZTbKxBYqzXBz1EoSq2TrEmWp5HRLRwu2cLVlxUTJtC
         hjo0++EnKyHlFlUDwRGS8xB69hYteXuDFpQgDwv992w1Sdi5cXoH35qyr2VAMaSIBhQt
         r3E/nRrJYwOzj4NmDwYg4nUTlYEQj32RrzYQoc2SFy3McNQc/zfQpaJ3eikj5ERaRpTz
         syfg==
X-Forwarded-Encrypted: i=1; AL+hErFKB/Q6AewVfqSAudhz134MzbgMzgAacCnlxt8eEZx9h19hJ2n9KyOZ3Sd9Z2mtsSAGEFbKafX6pOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vEEZ1/gnQ6nd9wsIz7fSq4IYqlXI19nJhjZVuMrMKDq9g8CFo
	APoaKJDQ7JnCep8qktccMe1cfdwgrQ70+qv1Hen4S7hJcZ4Di/VixNdz
X-Gm-Gg: AZFdTZfv+IhG+FnWPg9VdH0I+hFDmvMysv+ptwdyEMhpIMjgKPOKFeC4seDbHbUBG9C
	xPTutSc0/BYBupwqH8jRCQKuzl9YDU5JhkN5YzlY2l8nbvnzUq9WXT2VV68nDDx64Eb6HgEJK0V
	ZKJuwQRrMYhC0cJFq7qLeWokRlP7e2xKISN4LodM+qB0BzkD4wYZ/cgjoVJwTg74j56pgZaZpnB
	yaBnpeJ5qn8AKU6wA7BdthzN09lKGbDDc95tJtv79LKUaL/dCyDT2gsjpF67jDF3zmAlNFMcdGI
	lndpxkXWPYkl3STz23tLdsWK+e3nDrhwr51EEF/KeRAbRj/EfPV9N3QslrMiz+Nd2q4Pys5FRP3
	j3MgtU++4MqWaed1Q/VNGdFv42BPxWmG5vVmaG7BbBlgd96M7YSttMRvWLay/Wetc6Mqhvqivnu
	dk0TW9FaID0XKewog6JDer5R2tcxkdg9rVVQyrfWPn6qrvkXbTxTDslnZ09Z5OqbfpvBImTRm8i
	/raWpNn7hxC+OKHOsrT/iRgwKRR+Vz4PCwOF73794w1aVf+nZk/MgEsYk1nqQRAdj+ziqUJqHJ+
	W+lgNIxWNaBCZ6PNk3Z10OoOPCH+PV/N1jXF/Hycq7rNnTjtblVjjAGAnikVslRGVyF7hMdjve5
	KwXQkBqXF+XNVDZw=
X-Received: by 2002:a05:6000:186e:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4abb225ebacmr959607f8f.25.1795118135348;
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:31 +0100
Subject: [PATCH v4 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
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
Message-Id: <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1hSNXDBZPA8BDKMuebBK+XYMMCVqHzsEva
 /o+P2IReHGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z9geD/0X0ve2bjnBdQk+E5KD5v8e5ClnFtyUX0zNo1Vy1ASx7d+hZGYSZl3S6mrafmpH8PZ9i9c
 ZOnN+f12gku/0Rhd71Acwatt582FJh3m05WnP1WheUOYRvoK0i9dnq/DwqxQluxQ+DxmVaVA7ok
 /xwTa7RTWR5CsphiAWErORUkwGoBqCI17ehfS93G93VV4sk29ikcTh6Ln7S5kBvmY0jyA7k38DR
 160GuhLuZeRwstADN0uNRc94EUUp5mJ6083fCJtYYKiFg+LCdq+6c05J4+u64i9Tbi51cWCVU+9
 3eaGym/X9MjkJGwamT/D51h2vhZsu1Jg2yxUwtZqr2s7J2qbAoE5qij/LahYeeg5EgoQZatQEL4
 j4vneI9qwgBLbmJfT6j4+z7B/Dt4elLYNFYkpUxCkxucmP4J9lnRNNYVJ7jodpnVTB0t5vg/hzk
 QVCz5pBZE2n2K90VyJqqrdue55VXYvEiCTkefeeJmTl1khz118oH9hDUo7fkMuNuFA5oQG6/guf
 qnbmdeumiaS0qyGylJeHOCylE8qgbLy3CZTn3KBHFeUEpRxQ1oYLLxlsx3uQp+2nfVjcFUQzOVI
 9TGMT1Rdf2yRzmW0lFm4ilpppSv4AOwcMUmpLyydPLQkLjKyQdzoKMEIQQwol2ZbH2nYpHiGVWz
 rBTXExGi0YTV0VQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1

