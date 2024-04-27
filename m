Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171303613E
	for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714245579; cv=none; b=frdaE1LvGcJUmuIuohsDB6WZzk/nNs7ZfD+dLNh/ef4jJkw1ldyFBtFsRTFHG3teQ5owqbyCcDj/MfEyeSmSyCj9x7Po3OhaBANoeSCJ97j11ZFk9C+yQzqnfuT9UTGGIygat8ZImdUCHlfYRG0DCipouCLy1wKMJ9zubdRVBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714245579; c=relaxed/simple;
	bh=FCb4gUHp09GB9/X0ADU1mH+5w0PB2tTUVVzEIRJo40w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxA5XUkjPRf6Z2/SnPOfSF6niQsO2QxrKTrKVvIAvHkT40c+tECcnATkARm2Cyj8A5fWDwoM+zUfqdZlaCzBsSkQUKgvtSq2NQI/L1wtGMnd1qYFRryzpSZoFWgey6Rb0w3Pb+YyFbbvEd+TBpA7LTUNu8N7vYz7lgKopjSFCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=fkNhEruu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="fkNhEruu"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dd615b6c44so34622471fa.0
        for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714245576; x=1714850376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSK5REE5pdCMpfkwAjoBWJ3KnKU2btAjGG6OfQUx75o=;
        b=fkNhEruuF+011VT0BPzR3Sqoyc1jinBnqppJH6K9M5jTJSVVxed+Grei8qLSmmbg3d
         nnlrypQnAXGtIiM6/PZWHiHKomEGzEWw5TjtqtBbw4t1/V3TeWKMp2q8MhKFNxpwLh7S
         I7BiT6cItD8Fnwx9IZG/RDGok5AXiywUhpCPzSf4aZg6E7gNE2D8H0f/uhRwKhbujWrN
         yjk0pmA7I8/xk+VJehzu0LlP7ClMMuNLfIaw8ajxJvRmekipfaDPhIyD6WEtmjIAPRhK
         /yqE26MClW1+QIbMoWY/24musSiDJYOpkqbgdkapiQraFJsGuft9TmcWi3H9H5b+dTyv
         X4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714245576; x=1714850376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSK5REE5pdCMpfkwAjoBWJ3KnKU2btAjGG6OfQUx75o=;
        b=K7Vgm3j1JWmf3AAnFJBsg5SjI3e+TT2eNpOMYUbxQwuKRWgIe4+jWuieb1kSh4v8yU
         AjXdzism/JnwwpCmaDhtDc6f5xPnV3s6Z+mdC4i/6Jh5fW3yNiHaOqB31Sls7Y7GBs9z
         OG0KQ5uynXGFpiDdA40ZP4xQaZhNwLNB12EFaSI+QRlkClDuuTyMQxFlDxU/FC3JFDv2
         mPx9YP4xTBq0Ny0MYWZf9EMmkiZfG3qEROgUJVeWqSinWjP4R6Ie7MwvG3Psv0TgUHLa
         D8f9RfousB9vxt13ohg8XMZp6EQQoVosJRKThPZUrkTLZBNLEDuHkiXt3yKDpXlkTEK9
         F67w==
X-Forwarded-Encrypted: i=1; AJvYcCWojoCfrJKdqv5zLl37C10aGWqnQjdtaIY22Lt88rubDIpTUu//eCbWmpuf83yX/yHOWwmGBAdRaKvUnlGJfNLHUujLSBc4vNnR
X-Gm-Message-State: AOJu0Yx8dF0wG0g5TfDfyY3cTTKXc2EhcoCfJdxlmHemjpnIiC4qXnW5
	bzRjeJthiOsO+TSyRr8wxpFPp887f4v3jsorSozBOIWj5hS/G7bPsRnOL4Rs7rw=
X-Google-Smtp-Source: AGHT+IFM27UQF9V1Lre8uIID+sP9G7WJEekBZHmHCGEs4kOwAclprrtPC9aAIzHBhmd+zl2/Nms1UQ==
X-Received: by 2002:a05:6512:313c:b0:51d:aca:4b06 with SMTP id p28-20020a056512313c00b0051d0aca4b06mr1721106lfd.39.1714245576141;
        Sat, 27 Apr 2024 12:19:36 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id u18-20020ac24c32000000b0051b5e710366sm1945012lfq.129.2024.04.27.12.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 12:19:35 -0700 (PDT)
Date: Sat, 27 Apr 2024 21:19:34 +0200
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
Message-ID: <Zi1PxgANUWh1S0sO@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>

Hi,

For me the mac driver fails to probe with the following log
[    0.123325] SPI driver lan865x has no spi_device_id for microchip,lan8651

With this change the driver probes

diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/net/ethernet/microchip/lan865x/lan865x.c
index 9abefa8b9d9f..72a663f14f50 100644
--- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
+++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
@@ -364,7 +364,7 @@ static void lan865x_remove(struct spi_device *spi)
 }

 static const struct of_device_id lan865x_dt_ids[] = {
-       { .compatible = "microchip,lan8651", "microchip,lan8650" },
+       { .compatible = "microchip,lan865x", "microchip,lan8650" },
        { /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lan865x_dt_ids);

Along with compatible = "microchip,lan865x" in the dts
