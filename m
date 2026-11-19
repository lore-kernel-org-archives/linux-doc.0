Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117312;
	b=YDeteX319FWEmsczUCCR6cUv7SmsATaR941n5vVzx3ctZkpMLQ+YYAEVA1c0eghSlldU
	 TPfuiIybm7iWlxw05cL443Wdog9QQSSmyP0XdsX8GNscHEsmAmaU1cEKcb3M4vNfiLvKp
	 eQgWfTQI6XYUKIUzm26t5WiLXnAAPDxEv9sYGYy2YTZSTePL49BLv7iTP2IIirPIVi091
	 dk7g4CjXqA5RruAdhIDRfvJ7FSXFWd2lLsBL/gI6IklIUlhJ6S9VT29+rJm3P0+NWbvS4
	 BhR/hunJmErvTS2J6OeF1PylJpcFZA0Dzr+gxC+GhVTC7yVHneqlYJdAYITVdr9zPxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=Z+uOwcruTwGgCBn4QfUbki2kJ7F+oHBMS7RIA1otVCUTOgnRl+Rc2kuZoZs0BDlbLE7q
	 m7OQhNmuO16O0/30LCpDC9wgVguYE6u1K04HC9GHdFekdzuKMHOhwwnNqoU4tCJUrY+Nz
	 50N1uNiKIQtrnyf4BhTJG1LLUUqVZc9FwEV4O5OfuLBDCM08HukVRLAdKkkAnBgbz6B6W
	 lUyAdsTplXsUCwt7txbgOFXq0fEsapX0FxvWYdD32q2Kk8QHrpb+opAX7cWt7UwZ2djDV
	 ECyO5g7EItGOFhFUX15yPc3nZWv9x327gC262iBeA6bZu28jqjnVYRg9SIgwDzrFoaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F73606A33B
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 19:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F73606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso32808f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117310; x=1795722110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Pggkvc43bdzFxBdBLrMha7tax1IJw4WFhDv8r0c2/fSngg5OX8dXy6DEu1LNip3Mm9
         O+izM5BTYiR0AzgXkE+3awXmyVbTCw1sjE+YBsrqs2SPPwsdQi6RJVHtcnQdddl5UH8h
         E4YLX1BLrt/QNfK4yGvBWucm8SaueRx6/dGUnnEJhQZHudqKA0j05EWDgcwR+dIJPXhH
         1eCmhXHCPSxIiYibany++bRdE4Vn846DoxCzaf5JjUrp93hBAVA9h/IeHOcgz4Yg58t7
         oJiJ5b7PvGg41avCu+yP2KmXjlFqmmCJiX7py/PNAArqDI26mgMFEAoyO4bssiADKP8c
         UQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117310; x=1795722110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=YO///kG6Fd7Y9GXYH71bBv9ochHPm0ma9lAQFkIyjFw7hk2xJlTFA7KW8X/pqVuCYB
         EQhva9fAf0rgKNiHy/5bILw8rPBTzGkjot34vuk4z9v+bQ9Cl+F0cx3katqatV2CDTkO
         qD/9QJOKSu0u5pVHbVspBIKaam/EulYI7uPZOaYL6Wk6xo2sIJE6mLDfu7iLOTKBpYp3
         qNAWY6hTO7eD6a0mED1XYcWLSWkjetd/im8JnO1ERLzqE3qxuP5TV22vGieCob4Zjh0+
         EhHVZUn2wrlX46TiJCbsxk1yiEXl8CjKmymu2ALALLipWAZDaYZqgRdhvEIgZ7wo82Ee
         +N/Q==
X-Forwarded-Encrypted: i=1; AL+hErH7fEwFaz4A0gfCJcr6Yz5Lu+bGZNvvgiVxTXEVmvoDfLzomRb4X8QhCw+twnB9OBR9mFa1gcvF48Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6p9ROYA1I9/WT2kxCRFORNIv4GDc/lmtnuRe8Bd3mtjk3dvKH
	XxA1j5m9LRuMO9ThEGJOPPoa9bTrzzMrEjmZjmWcKfXb7sYuk1IxWL3DnE9UCJ6D7fY=
X-Gm-Gg: AZFdTZdJ3wutWqgLVQZBhkNiy1lu/5etPJCwYD500z4AIxai1YFVp9g+NZjy6zr+TUy
	CoajDOzxqzA5rVkTJHfer6btvy9q0rJhiIg//gnmh+OP9pn/0tg7lcucyeW9XtHneXSmL8CEopn
	OfgSk/+fnFDTtGT05N3hywfiqFsoWhRUR7d2w3DQe7hq+4bCPiZNX9k3Qf4yGaFv/TjvXhRIiE8
	pbRZpJxFGuNkDeLlqe2cva5vKdFH18vzAFuRQeaM+jTk+49CF6DgXabhnWLQguFBGnBQHkf5A9A
	zq5OgW47kWKjHs0LCZQ83qNpAD3/8QedhUSVYci556T8qfYnob2ggkUHxcilZZsGMIwThcmH/VK
	P3ot7Du2FNzNu87+0zhm70Gfb+WFEKxoPJGRHYLorT1cei64ZcHyqzdRGbxIUFaKMeOrpiMN6JV
	lvBS9vxgPdRI/qvndRvJqY1yOOCFfUnHl1ygRk8eKzkR+9dJxwioYcQzleDoJpbRndqV0dLI1lI
	xi1OCq2p6YVLvZLcWKB5kpWy/SlrhxkB3nNBrzkj/plnPwyHKj0ZwVOhid40pb498sMaxWHs83P
	77+ZCZFbDXpbzadHZuntlU67tHr182pno7t7hhnWcpprUnkV+BjU5uJKrIU+W/Mds568LOp24N8
	c1uaWueDZBh0kOzo=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr623352f8f.47.1795117310023;
        Thu, 19 Nov 2026 11:41:50 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:41:47 +0100
Subject: [PATCH v3 2/2] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D8hT49gcrO0owQ6GAVVxBPc9dALdWiwmeBh
 7wzQUpOUs2JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q/AAKCRB4zXhFDAXI
 Z3F1D/41fT/30zUKBoREaKGpQ6CcwTaTKbaai06qAahviHvMfc1xgx7/Vvi8BZnNW46KjEDjbKJ
 XpK7WKd3to5oCMOOpSotgCU7nSghiSXrsb7res+QxchabwX9sLdnrMU/HqQO/EXcBgaHw6Vf47u
 Ehz/jcyxmiyws6JcpkJ7eiyZvmKtYCzlK22MJ2lBFnEXcC6xEtbyNUOUs2ZcoM/RTjdVNSI62Tn
 UhQ7H9dJZ8O7lBIahrri0MMvoG4RgO0weyHV6CZzsV3+ZvJ+2xSlCq8p+K9R5WMJN05iN/5Pb/w
 EDOEDc/L0zVKbo9/aOMykkBkEngHrnWOxk/V9rcETZ/ijDSdEo7GlOqXzsvV1bBaz1uqkf9shmY
 R+clSeni1rzCcaYATDChIVTeQ0Z8OvsGkSR25Wz4+xW+asFR8gy5pNY+f50vuh6ITQZHSiJ0sQ8
 5bGCFBkfuwBupgwc+ImE2VynI1rvcNcjjrPP5xk5IjRjjSlrcrtl5Y6mX1vm5h8KJO3TysUCRUK
 H5FN971m85rU6Jras20aTRL+OR2gv9mPNee17i8wYIJM2Y3I/BFstsNV/BckMA0yyn/qBKUobjc
 5FUEpfG5R9a6/+wFLeY3vbG9D/ZDWmgWi7gNj2z+87Fv1qObomrOVZq7scAcC8X+6DB5iMtBLfE
 9rMSTdBO3nht9MA==
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

