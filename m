Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6433F1802A8
	for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850854; cv=none; b=Jg5N7ZaUCw7srNqPsj8np1dbbYrqWOsTgmVhFtVUCan9qgI7e4qavIxSQIFDMY10aOtzOxGflUGo2mjgaaL7k9b3z7pP2sWLHrDYUSKAhKPm1nQwtaejOjyylsKYnTHchMvs6qejYVYal1kxoD3fq2Fweb/CBh9wsUXY+7/CN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850854; c=relaxed/simple;
	bh=3p8epjwY1oVoba554UVp1ZMZNkGwAgCoLLhC2PSJKOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFbmHpFUbxMi0nsGudDyJwtiPf/Ovs4mBLnWCU2wa+Vsy3e8l2IBjKW3Dm6rSu2i3BQ/1HV8f7fymtlbzPLU3z4b1NeNsB8NTLEJ3sUHYRmpOgN58FTkxdKxfm0UDXa1Q4jx420bUhh23YhokgNYdFnoADrl9gH/DmGf+zOeWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uL3z3rkq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uL3z3rkq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so2071413f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Sep 2024 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726850849; x=1727455649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auS1Nijn3/MM+vVwjmIp4Kgr8RxjQxso8G43GcLWcTA=;
        b=uL3z3rkqZcPgS5yRPjXj3VG1n5M6ku0OzbGm3pi4wJPQqx8ImhdipFi0KcRVYn3GbJ
         D/peGKRY+1cEpl+xT0jKDLDFigZEqeEQY7mMHlySv6VgOoShfe/ykrRde/pEa2L+CqSF
         OvuaaYyUM/AtE18BMvRYPNpcoH+irBRYcV7vqPGR2dhwIkEemMf3Q9FtZoQhIUJ3CLwS
         mhrHCx3AzMjg/BpdCaCMDHZZgCaU8n6DK2ALH45TpouZS0arZDgOeHEpXK9X0Eba0aNi
         yJefg594tkCt3CBf2b3wVVgqz1OwWj+AEwReUBiclcMSR2KzyU5a3OHBDrM70qMuIHqq
         fsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850849; x=1727455649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auS1Nijn3/MM+vVwjmIp4Kgr8RxjQxso8G43GcLWcTA=;
        b=FW8l0WO54RaCh56lb2KcVhC53w/dBF8LdULwi+xhm5CghUrlN4Y6csvQfDKkf5cLdK
         LXqHJi/ADaSgwLKH9tj9BxJlO4RBZF3Yfcva/kcxs2qZQj6kIlTXSL1zGMWocjrke+Yl
         GIeJR9HDiSKhLRq4x0yS3nY/Lj/384aZ0oTcnRhVW5PLf4pGSS/gGTiw7tWTmVKcSuRo
         YpPRC28NfhyZnDEK+qkUao0L7nlGuqTPdGWe0A3inM7w5slpyPUFBwDaeOR1aisuUwG4
         1GhCfveq/NO2+g0mIhdTPrtH6/RQVmb2Q6I5Je5qi7kvQr8kg7vVZLkRBONTDENsRM/S
         4sfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVytxPj1zTCruNyc0DYdIU/aElOUlVlMlNYbBGLECOLaWaI05qaYMFlsLElEoAiN2c1Pl3auJROptk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDxczOyM4C9y8eJpXFwjAHLPOUyy5xLsXyKBSSkYtkbDOxY6x
	aP3T7NTr3a9ndpNy3wIKuwATg2Kg+oCdJOXWUVV5LRpjBU+MvC9vXUaOljIcisk=
X-Google-Smtp-Source: AGHT+IHXZIFkEVB0paBQKp6NWhbzwDh87vNSKY+P6NiQas53tTtsyxNthvn6Df+xga4/u+MbyHXoIQ==
X-Received: by 2002:a5d:4741:0:b0:374:c6b8:50b5 with SMTP id ffacd0b85a97d-37a422783aamr2678511f8f.17.1726850848643;
        Fri, 20 Sep 2024 09:47:28 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm18172250f8f.90.2024.09.20.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:47:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:47:03 +0200
Subject: [PATCH 2/5] regulator: core: remove machine init callback from
 config
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-pmbus-wp-v1-2-d679ef31c483@baylibre.com>
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
In-Reply-To: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3p8epjwY1oVoba554UVp1ZMZNkGwAgCoLLhC2PSJKOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7acZNBtZ0hTqllWyyFMkYkYea+7oUuVASt9st
 N3sfAwEOmyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2nGQAKCRDm/A8cN/La
 hYf9D/46acuxSjA+sfoQ9+odznEGE2QZudI7LvM+JHSU/uTEuptHRL1hXmdE1Qz6bnv1WEoelb5
 7oVKFTLwZMGp7We3tD8/wedhHL5r01t52dh2tD642SNH5nXOOZgZbazATUe+vSH4DFV05/aYIhm
 HXcQ0L1e2W3/HmXhWmIkfdbly++V3pNkkSDBjbQdJ+iNN1Dh1yX0p+Qnq/ndZnoSDPauKrJmqkt
 xWpM0uObnaIsR5lEQipTJUJOpkQWwzfufyYHdQb2CBdwvSMNJs4SxjCxcBj/HdtrVw9dFG0BDvz
 oyVwKTMwhKodI638sksCw4ZCUkRkrkmJbnD5I6F0iR5yOn6J8gHoYJX2UZSlUKvAyid6VcqAfU8
 0yKY5jx2A1On/UvNFFNBw3BAzY5+dmZNO1ud3iiurAnLqETdxsaYG9B4fGm+CHaBE/q+EzY6V8H
 HG3nLSgyEh2FEfIWwqy0av3r34GXSzueXAYt9iI91E5tc23gw+Op5Mo+tXHCoaL/tdJT1NiIDkf
 90MEHG/fXhcccoStXKKIji+IFMZRxXPBOzhf6+6biaGizZ14hPFUHh7VB9eBJqptmqRzK9fjXlR
 WeK2wU+8Qio/NF2dgy/hx0xQ+5t9aUK2NMMjN2VABPjh0UQkG5ya/eGfbGGpvxVytYKDWschLnc
 dnfdIuMTDuI7igA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The machine specific regulator_init() appears to be unused.
It does not allow a lot of interactiona with the regulator framework,
since nothing from the framework is passed along (desc, config,
etc ...)

Machine specific init may also be done with the added init_cb() in
the regulator description, so remove regulator_init().

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/regulator/core.c          | 7 -------
 include/linux/regulator/machine.h | 3 +--
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 4c90ab5ad876..4666b0e226c2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5764,13 +5764,6 @@ regulator_register(struct device *dev,
 		resolved_early = true;
 	}
 
-	/* perform any regulator specific init */
-	if (init_data && init_data->regulator_init) {
-		ret = init_data->regulator_init(rdev->reg_data);
-		if (ret < 0)
-			goto wash;
-	}
-
 	if (config->ena_gpiod) {
 		ret = regulator_ena_gpio_request(rdev, config);
 		if (ret != 0) {
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 0cd76d264727..d0d700ff337a 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -285,8 +285,7 @@ struct regulator_init_data {
 	int num_consumer_supplies;
 	struct regulator_consumer_supply *consumer_supplies;
 
-	/* optional regulator machine specific init */
-	int (*regulator_init)(void *driver_data);
+	/* optional regulator machine specific data */
 	void *driver_data;	/* core does not touch this */
 };
 

-- 
2.45.2

