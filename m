Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F1238C0C
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452327; cv=none; b=WEmX1vlxWfSKaB17sJrdim4a1bxzQTb5JLTUMcp2QYBpKYid1YaQNFwm2UZLTuAi5OJbQyI4Tvjr0GJot7eF+/Hg46SV6sJP6blTGEId/QaRBSxf4rChCI4MbJf6S/sUADPw8tnMaaJUQcNl+/tBaPrneTUA29cGPhODNKlXrKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452327; c=relaxed/simple;
	bh=ZIPepwL1zAjT3/W18tkz2vKEYlRwn57a6PC+KSBfoZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6EzNDW+Xw21KdhMjinyAHIlB7o8UAR48aYJHp7qCa/Es847/dGMaSfefjNUoXB6J88nEEarbPJ42nzXUWbxPhJiWEnBDSUajPg3B7sA0PIypU9UHP6EEfN0GdNchO8GomlTFBnoKDvlDeZcaWUL8ByJkqFXmqfTsB46J1bscvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=J3d/vSYk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="J3d/vSYk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453608ed113so42789805e9.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751452322; x=1752057122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zXDzDU4TR6t6LCGPz2CtkRVWsYIWYd3/8o1AXqP8JIQ=;
        b=J3d/vSYk8opocU0piDvqaKzjBrnanMQ1d0D5zxbXmNs04jPctePD1aatvNvRd6O4zI
         VoZWvUe2VeYJ3UtEyo99293Di9gZX16zX3VZRD6FVxPCA2nzl2MU4K8vU4GdbdiLbPXi
         wTG165FZqZkQhkZhuPMKoGbYrmwmFcujddWf0maC00rn6B3npN/9VT+xU0icuZbFm74w
         1SS2cfvo0h6sSqyJJgENf8ORLRL1HK8MWdri5Tza1zUjF5UyaO/WEKys+Zq89GFu0iWT
         Mvrtr3/QdBb1YA4x2pLZURJuvIMeKDH+h7rd++X6Da7FANh5KxhvNvP5B7L97eNfnAoP
         53Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452322; x=1752057122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXDzDU4TR6t6LCGPz2CtkRVWsYIWYd3/8o1AXqP8JIQ=;
        b=fXxKD/d73sBSbWAdidVWuQIoZ/eSUgzCTeAwZLPNOJgiEyB+LoG6pStDGHSjn3eoJD
         RbyHeLLmGKj0xENx2DoVzp08QKx+eY/KTAoNnHUnroxZgTPYXEhHqT6pOcyBg3ruaju2
         HN/1ry+EwlweJWUJuG1+owKrbz3uoqgQgJtL+h/nXXaLC5pfA36PH797YOvYvvf5t/KK
         w82ziiS6vEIbovF5XMeX7bpWk4biY9RsZwgTvx9O9G8npdZFMMRRitxC1RMcVwBQ0xoi
         YdLZyCQIb6PAOV151APOtj6DmSywLmiaBMZyayzyx3+tJewAiJeLCx9Cm6QYJUgrySuP
         PXvA==
X-Forwarded-Encrypted: i=1; AJvYcCWc7J7WSSgYPZoNBy+Iu7zAje8gyrRgrU7o7n4nWeB4C5DoTsdKIhqG03Klk3FAg12zNBa7Ab/a+yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYBo18tNQ98/yFUlYc79RsO3SZ1vmst2L+kNP9TLGRAO0HZLa
	yC8Ijb38DPrcuskjptg2R6G2XPl9Q4rJgkfO1eUqf8zixhwljTCfePBvK3EXq0omcIo=
X-Gm-Gg: ASbGncvxt3YuPB0us1VJFzg6GTI0PhGTZxqKOlruwJN2sgetITT3ybilfygDkdgGg27
	dgnuJtaX0XBhYtfndJTe8HcmJfP+VhzBupOeg7e9WmH4/O9fHwOYQvDOhGIUZZUJ2qaP4+kjpYm
	XtV+c4ddvYT6TmzEtPrzmE4zUNC2HHy5l/YigCWbbuCgevFY1oabu/THjlKtE6FaHBnV/gDS5vk
	c0Lzx3rK7vgUyzGvrY5KOoT32/iiCQU5F1KkWwMTZlk4KNgCDuLeHVpvWykV9TsrCoDPQvzsFde
	z0MoWNCtCaKoymASaFLO0p01cMfDJpkWstsQzwmueIMTUNuZEKpml1F6nTiaqC1j2yhSVEnq/29
	SzsUz
X-Google-Smtp-Source: AGHT+IGsTcnn79M2AkJYx6VwIu5Aao26W0bXZaJfZo1nGUhdH+xTH9BKoW+BRHywWzGq0ruyEcPoQw==
X-Received: by 2002:adf:e196:0:b0:3a8:38b3:6e32 with SMTP id ffacd0b85a97d-3b1fdf02726mr1536066f8f.8.1751452322382;
        Wed, 02 Jul 2025 03:32:02 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm195088325e9.20.2025.07.02.03.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:32:02 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:31:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 07/14] dpll: zl3073x: Add clock_id field
Message-ID: <amsh2xeltgadepx22kvcq4cfyhb3psnxafqhr33ra6nznswsaq@hfq6yrb4zvo7>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-8-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629191049.64398-8-ivecera@redhat.com>

Sun, Jun 29, 2025 at 09:10:42PM +0200, ivecera@redhat.com wrote:
>Add .clock_id to zl3073x_dev structure that will be used by later
>commits introducing DPLL feature. The clock ID is required for DPLL
>device registration.
>
>To generate this ID, use chip ID read during device initialization.
>In case where multiple zl3073x based chips are present, the chip ID
>is shifted and lower bits are filled by an unique value - using
>the I2C device address for I2C connections and the chip-select value
>for SPI connections.

You say that multiple chips may have the same chip ID? How is that
possible? Isn't it supposed to be unique?
I understand clock ID to be invariant regardless where you plug your
device. When you construct it from i2c address, sounds wrong.


>
>Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>---
> drivers/dpll/zl3073x/core.c | 6 +++++-
> drivers/dpll/zl3073x/core.h | 4 +++-
> drivers/dpll/zl3073x/i2c.c  | 4 +++-
> drivers/dpll/zl3073x/spi.c  | 4 +++-
> 4 files changed, 14 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
>index b99dd81077d56..94c78a36d9158 100644
>--- a/drivers/dpll/zl3073x/core.c
>+++ b/drivers/dpll/zl3073x/core.c
>@@ -743,13 +743,14 @@ static void zl3073x_devlink_unregister(void *ptr)
>  * zl3073x_dev_probe - initialize zl3073x device
>  * @zldev: pointer to zl3073x device
>  * @chip_info: chip info based on compatible
>+ * @dev_id: device ID to be used as part of clock ID
>  *
>  * Common initialization of zl3073x device structure.
>  *
>  * Returns: 0 on success, <0 on error
>  */
> int zl3073x_dev_probe(struct zl3073x_dev *zldev,
>-		      const struct zl3073x_chip_info *chip_info)
>+		      const struct zl3073x_chip_info *chip_info, u8 dev_id)
> {
> 	u16 id, revision, fw_ver;
> 	struct devlink *devlink;
>@@ -793,6 +794,9 @@ int zl3073x_dev_probe(struct zl3073x_dev *zldev,
> 		FIELD_GET(GENMASK(15, 8), cfg_ver),
> 		FIELD_GET(GENMASK(7, 0), cfg_ver));
> 
>+	/* Use chip ID and given dev ID as clock ID */
>+	zldev->clock_id = ((u64)id << 8) | dev_id;
>+
> 	/* Initialize mutex for operations where multiple reads, writes
> 	 * and/or polls are required to be done atomically.
> 	 */
>diff --git a/drivers/dpll/zl3073x/core.h b/drivers/dpll/zl3073x/core.h
>index 2c831f1a4a5d1..1df2dc194980d 100644
>--- a/drivers/dpll/zl3073x/core.h
>+++ b/drivers/dpll/zl3073x/core.h
>@@ -57,6 +57,7 @@ struct zl3073x_synth {
>  * @dev: pointer to device
>  * @regmap: regmap to access device registers
>  * @multiop_lock: to serialize multiple register operations
>+ * @clock_id: clock id of the device
>  * @ref: array of input references' invariants
>  * @out: array of outs' invariants
>  * @synth: array of synths' invariants
>@@ -65,6 +66,7 @@ struct zl3073x_dev {
> 	struct device		*dev;
> 	struct regmap		*regmap;
> 	struct mutex		multiop_lock;
>+	u64			clock_id;
> 
> 	/* Invariants */
> 	struct zl3073x_ref	ref[ZL3073X_NUM_REFS];
>@@ -87,7 +89,7 @@ extern const struct regmap_config zl3073x_regmap_config;
> 
> struct zl3073x_dev *zl3073x_devm_alloc(struct device *dev);
> int zl3073x_dev_probe(struct zl3073x_dev *zldev,
>-		      const struct zl3073x_chip_info *chip_info);
>+		      const struct zl3073x_chip_info *chip_info, u8 dev_id);
> 
> /**********************
>  * Registers operations
>diff --git a/drivers/dpll/zl3073x/i2c.c b/drivers/dpll/zl3073x/i2c.c
>index 7bbfdd4ed8671..13942ee43b9e5 100644
>--- a/drivers/dpll/zl3073x/i2c.c
>+++ b/drivers/dpll/zl3073x/i2c.c
>@@ -22,7 +22,9 @@ static int zl3073x_i2c_probe(struct i2c_client *client)
> 		return dev_err_probe(dev, PTR_ERR(zldev->regmap),
> 				     "Failed to initialize regmap\n");
> 
>-	return zl3073x_dev_probe(zldev, i2c_get_match_data(client));
>+	/* Initialize device and use I2C address as dev ID */
>+	return zl3073x_dev_probe(zldev, i2c_get_match_data(client),
>+				 client->addr);
> }
> 
> static const struct i2c_device_id zl3073x_i2c_id[] = {
>diff --git a/drivers/dpll/zl3073x/spi.c b/drivers/dpll/zl3073x/spi.c
>index af901b4d6dda0..670b44a7b270f 100644
>--- a/drivers/dpll/zl3073x/spi.c
>+++ b/drivers/dpll/zl3073x/spi.c
>@@ -22,7 +22,9 @@ static int zl3073x_spi_probe(struct spi_device *spi)
> 		return dev_err_probe(dev, PTR_ERR(zldev->regmap),
> 				     "Failed to initialize regmap\n");
> 
>-	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi));
>+	/* Initialize device and use SPI chip select value as dev ID */
>+	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi),
>+				 spi_get_chipselect(spi, 0));
> }
> 
> static const struct spi_device_id zl3073x_spi_id[] = {
>-- 
>2.49.0
>
