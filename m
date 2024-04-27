Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBCD128368
	for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714246512; cv=none; b=ruYGt7x/e11OwofsQWut+cAkJz/PGPIPHwyNcXN/LD5udJG6BEIo1PK+Ph6kGAvCcJBkbs4LaAo//q2XlHfxjSToM99pSCHQVLY0EunBiOId5A8NP+L/dXYUptPsE7eDhhI1fQkixKNOlhiSw5IpSUN+1h/qtSURgHnPch+IXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714246512; c=relaxed/simple;
	bh=3z8Zh7U9QP1/ViV0+8coj4+NlZaD7ONwEi0b3r4n5cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCRODd2GwPV9gCIv4NRIU7neASfxLx5Ljs6O9MLQrXc75Iq6/Bsblx7Y0Oo0D3wcU19wu3OMJyvR1bHWx28G2eTPHLvRS+xhGQc07sBfec3gKsNtO7CkcE+C3AzFHM8UULJEHyYEI5UCY8DAcm7jdw6Z2wfCOEFie1V3G2cVNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=JMy7jO/8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="JMy7jO/8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so4021613e87.1
        for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 12:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714246508; x=1714851308; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Stx8L8fGNoLmhu7uwssiRKsIuNsvkM32vbRcX+64kfs=;
        b=JMy7jO/8UnXM2iKz4Iz7z7uztnzbYcpx2LcJ2QY9/v8mV4F2LEQXeAnnWrgr0loauo
         pkbGuNidlcvuMONqaUkjdCi+Bna3KIZqCV3GexZhv41nmDAv5tX1jaHQoQSSsSCBBpjP
         XhSZ23aq4Qwv1yQehsyiTsC+oB1R3Wlk6w9mSUtTBxSnX8JtIL+frnvt8RJN9RSOgOwn
         iSVr7zxzs/IhQ2ga5gcTvO/jQE0JLnDauh6aV5RXAET1vjAO7lunBJft14+lxu0myvZ0
         xXWOGD8toC+lqFzYahpTsMMvg2wlDGWz+FfK5GBUWa2dHv3+3RGHbelewZIfAKDmu+py
         rGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714246508; x=1714851308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Stx8L8fGNoLmhu7uwssiRKsIuNsvkM32vbRcX+64kfs=;
        b=KBvXynTvCzW5+TGlybH2l64boPfIKdZULafJo7z87zlHpeqXOWEkHWLUpZJv7S9gin
         ZdLWx9WA4XJvaCI0iISgpThX4UxCWrFMvamMsKlXJBawOsp+0aQEqsTSciID/v6Eao4w
         6r5xawt6XFL5adMbA28li/VtfY693KmrLviFdeaQOp4OY2uDe2Javd37Ot0H+zjYQK1Y
         8NsK2ePAH5Scgyqw0ZGvMFJTGOSjL201Xw67yXk2nhqj1PkTwi0kxyHetFQl2RzbpFd9
         5A5HIXqzYJ52SKDj8T2sxuN8HI9i8ITCUAUhh7JxGUJpgA+A76BJcZ5H1LJWRkEH3K6z
         DWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJsZ6N8/Tn/TXE+H6DvEHIQTrsIq1JZG+VzEPne7+j8fl/oBX3IVoogjyrLk09Mqea2r+d5+TPPITOsTSBLXJ6WOQQUsyPYOFc
X-Gm-Message-State: AOJu0Yw6d4x/3GMQIKLRDa+V09NyIJWf95lkPF5gHMb8g+UWpKUxAYbP
	aRB9ej6jFK+2dohZlVAdFhtVi9jMClhc1JqbuXz9Zx+pgKMUzB9PPe4WxULH2Ho=
X-Google-Smtp-Source: AGHT+IES5MUiJ9OraOakB9jf7NP4P4rHXIOSA7qspSCjNVFlnKT+Q6NTqcrIAU2hiEKur9kyJBoOOw==
X-Received: by 2002:ac2:5f62:0:b0:51c:d6c9:e964 with SMTP id c2-20020ac25f62000000b0051cd6c9e964mr1729562lfc.50.1714246508455;
        Sat, 27 Apr 2024 12:35:08 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b0051ba2fb069dsm1665427lfu.37.2024.04.27.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 12:35:08 -0700 (PDT)
Date: Sat, 27 Apr 2024 21:35:06 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, horatiu.vultur@microchip.com,
	ruanjinjie@huawei.com, steen.hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 11/12] microchip: lan865x: add driver support
 for Microchip's LAN865X MAC-PHY
Message-ID: <Zi1Tang5RQMmEFdx@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>

I'm running a dual lan8650 setup, neither IC passed the sw reset in the
oa_tc.c module, I need to pull the reset pin low to reset the pin before
the rest of the init stuff happens.

The datasheet recommends not doing a sw reset, excerpt from section
4.1.1.3 Software Reset
"Note: The SW_RESET bit of the Clause 22 Basic Control register will reset only the internal PHY, not
the entire device. This PHY only reset is not recommended for use. If such a reset is detected, by
reading the RESETC bit of the STS2 register, reset the entire device."

Doing a hw reset followed by a sw reset seems to work fine though. I
added the folloing patch to get things moving.

diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/net/ethernet/microchip/lan865x/lan865x.c
index 72a663f14f50..993c4f9dec7e 100644
--- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
+++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/phy.h>
 #include <linux/oa_tc6.h>
+#include <linux/gpio/driver.h>

 #define DRV_NAME                       "lan865x"

@@ -36,6 +37,7 @@ struct lan865x_priv {
        struct net_device *netdev;
        struct spi_device *spi;
        struct oa_tc6 *tc6;
+       struct gpio_desc *reset_gpio;
 };

 static int lan865x_set_hw_macaddr_low_bytes(struct oa_tc6 *tc6, const u8 *mac)
@@ -283,6 +285,29 @@ static int lan865x_set_zarfe(struct lan865x_priv *priv)
        return oa_tc6_write_register(priv->tc6, OA_TC6_REG_CONFIG0, regval);
 }

+static int lan865x_probe_reset_gpio(struct lan865x_priv *priv)
+{
+       priv->reset_gpio = devm_gpiod_get_optional(&priv->spi->dev,
+                                           "reset",
+                                           GPIOD_OUT_HIGH);
+       if (IS_ERR(priv->reset_gpio)) {
+               dev_err(&priv->spi->dev, "failed to parse reset gpio from dt");
+               return PTR_ERR(priv->reset_gpio);
+       }
+
+       return 0;
+}
+
+static void lan865x_hw_reset(struct lan865x_priv *priv)
+{
+       dev_info(&priv->spi->dev, "resetting device");
+       gpiod_set_value(priv->reset_gpio, 1);
+       // the datasheet specifies a minimum 5µs hold time
+       usleep_range(5,10);
+       gpiod_set_value(priv->reset_gpio, 0);
+       dev_info(&priv->spi->dev, "reset completed");
+}
+
 static int lan865x_probe(struct spi_device *spi)
 {
        struct net_device *netdev;
@@ -297,6 +322,9 @@ static int lan865x_probe(struct spi_device *spi)
        priv->netdev = netdev;
        priv->spi = spi;
        spi_set_drvdata(spi, priv);
+       lan865x_probe_reset_gpio(priv);
+       if(priv->reset_gpio)
+               lan865x_hw_reset(priv);
        INIT_WORK(&priv->multicast_work, lan865x_multicast_work_handler);

        priv->tc6 = oa_tc6_init(spi, netdev);

Since the chip does have a HW reset pin I think it would be nice to
at least expose this as an optional dt binding.
Maybe ignore the prints I forgot to remove :)
