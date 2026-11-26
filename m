Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=OSIAJY+B9AgK/BZo349bfr3oxmiK+ma3oDPHotpgeAr2xESvyV2VpWJD10p/I4u1dMui
	 Z17ZLdWe+iWvnSQUkI7O5LMZdNqov5mYxoqwNr+AE6PlxxqU+ri/OeMBuSU3FAXyoTvZk
	 wj7hwQsH/s2AuWPc8gpGre6lc/E6/383d2kKEz6XhqOyzvxVqL8qgJTl3sLbudjpYxs/k
	 qz0i2hopSqPzhBVnxPCce8LHAV3mCyVKG5qUkejJp5nJRRdZIp0pGNEi5sTF3MY1VcUcQ
	 6/q/hUvvnVLm+mxYjNYb8kfeZ9NnCOl5VrUtUkfWUQ6dH6L7rNEE01c2mhzWhmNb7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=MVmIt6NFAwPM/8uTV7aHYPdBYHe8IBdW8La0Gk/MmWrMS5rzNYU1fvMHr3kHSd6QzWGL
	 7gmf+gPtznPbDxu95nfYDfiwqVoPLfPC+2zpIU81AW2glTH++egI15e0LmcwmH/pZIUNm
	 em4wPPjuBKhtIii/yPE3miB5McSNknOLP9QZvu3+5x4glkJ2k5NR6ppEYbLYUUKTs1e+Y
	 Foqfun4R20KPa0RuOHMdEMvFJkYAOWeeHpQOXCnehnaGqn4y6pN8QaqpCm7CulpuHCMBV
	 j4v9yYBMKcjTQU0bfrJ3nA3e14PtOI+Vds+Bza+gjyUy6jv1mZsFJJjdoa3QeLmX06w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A91606A333
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A91606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5720923f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698228; x=1796303028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Oc+4uOFH7gxgWYT7IEWvRP9q9C/nc8WHA3KgPi9lcFkiqDMog+1534PSwq0wiYe7pK
         vqlRdDRnjFdqYFpwvNritESF/2HA9WYmFdjNWmTPXQn4TyE6VsNedJ8wyt04fkcpC7eR
         8H9tslSzbX4tZqyXYLBEQ7tDEAnxQcOxjPoyq1LlhtB8JX1GRb3vGmeMJZkgLokfrjve
         vZwH88zSww3JYFdkmO23Pw/tKUfVHAhTNTB/Sbl3Gt3PLfnofwB0gKpaJKamTULPxXUa
         NjzP4FFFKa72mdQE/hT14yHnoxXMLXo1VS1kgv3HR0NnYgraYviWv4dfrjFuP+J8KZxV
         fgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698228; x=1796303028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=fS7XFxe62jEg2rcbJYGhd7JoX2vHJlzWg09guBMOJRa61qPq8ANPR+ajr/RHt/xjlq
         2FA1NDCM9KGH7RRQIC9kVoxYBQx3uVCAzbhEut85hk806qBqy1/cCCh6gzbg0JJiuHmh
         Cwl4v9vufQyAK3qLq0rjBgMaorBzyM57+6kHbusamQCo3YeSdsHyK/ZcyVbyZAVdW7/k
         OILAED0/kdzLct4sKf1H7gkcPwuil+upJSzCk+FsVJdn9lKXhilLUPhV9l76Br45tx4o
         lEbEvVD8xBawiy+C/utKsReRDdLqe07mW0by8Ab+/wPGsAUiBV9YYRxier+cvQWL54ve
         QNvg==
X-Forwarded-Encrypted: i=1; AL+hErHCh8gHu3Lw3gr93au5iTBDXrlpnctm1ZRIFf19XGzPLY0aHIG4FyYYc8yZQsQVSuUtx/zsOwNlUrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2lcitwGLeE7cxnFB2m5XoVb7XY2dea+8mOAIOTgvwT3Rd1f6X
	m7fYdkhrRUcSSOaqdqCUgMl0tY5uMS7Rk0hMhwpUmmaN9Jnjg0yzfU1D
X-Gm-Gg: AZFdTZdFYzgcJ1/G3G0ExpnpkQKL+LbdypF19jaNw+HZCiDtrkLvTaq1lsSubfDULZp
	pQN2asQxsjrg0Qsyq29DC3P293cEsa2J7pYIBFWds9fY9k6Oz1PV9bUfmDRCJdS2yoqjDKsjiBA
	x2MoMpfPU3Mw7nuE4GLhvD1Yh9JtOnqidi/foFDAPi8y8vODglKFEHlXZguJgxkjp+fkAp3ci4X
	cNsFykHc4SYOZEtMqa22TWYkJu4z5IQ54Oo0ZF1YsotA1IyfSfDhBhaJytX7XzrC5TeycedyGjE
	RE0zbQoUNf/3SvwS5aqCak9J7d8z9T55+u8cirgLLcVM9AMe1SQGyF2RYBxo+O/vq4WdoDBQA0M
	bTETbnU11mxwHnJo/jl2/c0tfS4+ElI3JzL6acElUU2Q86PeClh0/6woN9tpIXU5A3OEWW8lWtN
	/w72Y3YdzRN277NjSjJKDbUYSPdNwUOltIgu1+91CtmN0ybYnehokLY1q+croYg1+e1WFS7um2Y
	x1JK2wG/h4YRSdjWtXjlVeFDAiHqoWFVoFggS4Dd19x4Z1BZWKJSjHXsuxVrTYWa5eTplb03wQy
	swceA3BSyytYlMOloncs4SVYvu1VL4qs7T/bPi9689jRWcg+L2hPdakXA4cbiDMsgdQmGRImPT+
	5sIVraOr2uAY9miFw4Huyf18CYieP0QWC5AUm
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr45744040f8f.33.1795698227412;
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:30 +0100
Subject: [PATCH v5 2/3] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261126-hwmon-da9091-v5-2-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xetf6hc9yk9GlDHpxKF8KJKG4DJ0Yfo95h
 tWd0n4aFUGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z5jED/9aBU4WlCVfXB+PsNCOFLUJZl9506vsDabSXLzTn3Xk88xdDjnN99nkstV7sEG4+ju8PJz
 MPini3NNQSOyVjivSP3C8GkSHyvHGEnoCkNobYB6hAgiahT1SRmiC/lPjhkAfV0qOXZmUQGXA2S
 rEmZZ4rISFs2lGH3AsN9WxhclXZh179ylEls45Nzjai3fI3anY9e8qsahNWoGeMOqVhjaJdazRH
 as2xOwV74dZ8Lcy8KgwrkRYB6cHLJJie+hlGVbMeNO/Nq7Dvg4RUa0L+2hf+7M2w3ouKgKXmPo9
 D1c/dRYxI6AD3bWEGoACZEOehX2PoCIhg9ZWeYx1SPSBMSmogjFpc4D7DzKuzFf9dbGDR5GmEqk
 DGhs83Tj2a1HdvoC5bveLy20PnQ4S4T9IN1tOMhRs9qT0QyT9PPi90O5JQme6wksDvg+wGVjSLU
 w31LzGeMMBKRH9IYP/guUpzgekiozJNjWqfaMpfxeDljpihvnlrXTB3f5fzaXW1AhEQzxww0tE6
 SJXLVjGPMztHBkC4m8S5L9aJrceEi9k1RwBvcl8l91ZQ2F7Q/w/IA588nxFnbqnY0Jd29jWEZDt
 y8qO3oNV54o6VzlkJFqvr8hvR6VDO7EjQHe2HT66XoLRiH936a1i05StW4U48XehgRbjFJZLLGc
 JAJAA4zcbyAsM+g==
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

