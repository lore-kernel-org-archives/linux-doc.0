Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A221D5CE0
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 00:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878151; cv=none; b=gYqpaIoc/giNfMqIprFCSsOZQbup4TClJ0pQyzmvJSGWtKX4g5AXqBxS2/IYlXrCce0m5wLTFeIlzWK9DNCggVzHV/rKHtite8b/YJxeUaqJgEVKCLuTtGHuJT3iNyUHxM1QpowUPK/Is7IBi1EKApUVqobBRXHen1//U09Rwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878151; c=relaxed/simple;
	bh=HefiMDs5T1KyjSP2zDY9X7nzX1TtrbHziBskoJWjJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkxCe+6tGyJNZ0lhGIphSriJQRYYNc5k5MT3Mjon37LJrTGwX+oMzrL9czV3MDC1sJPnWsTYqv+8yuqSWWZoZdh4CsagNk2M83scL9M0D7DM/XsF2aoYO9MQHehdjjTY2X9eMzTc5KvdPknI7dS+VisuQ1Qacn3/oKrt79NEBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxoBVJ4L; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxoBVJ4L"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3075ce9c05aso6720951eec.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 17:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878149; x=1781482949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjF0EWl7MQGGTkR5fyBPqpK6B4Vr2VFhRJBsPsGHejw=;
        b=IxoBVJ4L5jl+myLgaqUXCsTjl8JmfSWkmXXR/O0rmnZdhJMrh+97bpYEYrCIxOXkgu
         XFcz6bMK2EDc+mvWQeAgXNW2aYDhZ3RT9L5vy1+5Z+FWMfmQjH+/yvfzRkOJNAvDzNr4
         5X9cAXa+Phgqh4hrcI/k+3nohkNEHYiOOku5EBZfMQbFiqWNlDDFZzQNskGdWAdeuEfh
         FZtnQWf0lYecAGdz3PSpTbVkg8D9iqXgL0ncbbjw7yPEKblDvznO6OQagBYhz3rS6DtH
         dWMhRrmXgk2E2OhQ0s+vBXGfRFXOWZHgGs5qgxForthlTXJ/ttuJzMke8oEwSOngm4QJ
         qOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878149; x=1781482949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LjF0EWl7MQGGTkR5fyBPqpK6B4Vr2VFhRJBsPsGHejw=;
        b=J9aByf7bEKdgXgNoHOVgyVRH2bouaLE/om6hE4eEnl6MFrA6TxG39yb7D6mBaAfpvP
         +KvWaUePaCLRuSITtp9lkqF3vyBSkGZKiYnYxzyoj5daVC42xW8QXGaccF8G2CvsmPJc
         q+oVvl+MjioHdQYSM6tYK4w10l+hRBHTeHiZg3T0RO2tE2NkX1397n97SjUgyB/z1gxM
         tCdcR58JhDYULqw5VsaaHcCip7bpDAGxMm7AeIGt64CJVkjVIA3+tuwMS2M8GLbVZSv7
         IYSeimkeqjctVlrt4lOQRKAcZD5btKjaWYSCI6M/b8MGmDBA9ffsYHBXNcs2BRuTgfRn
         o3pw==
X-Forwarded-Encrypted: i=1; AFNElJ/xE0AUn0afCnNinTrn2/UhApHUL1JmVmz+Q0CuCcONLKpY0RfPQF46zgjz6jNe0MyxqCYUMfcaCck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyViCOrhS7LkS/jv6Duln0DeskF5zX8ZBYZWCoaaq9ooqN93BjM
	llFG/qx3snmyzIcL5292/WSabsI7BG3yNmu/LgC4i7/b65GJNeva6aXr
X-Gm-Gg: Acq92OEWKazDRtztGT/K+qx5PElA/Tx6M4U16AjXm1SF8Q2D7oUE6u1Pkk6A7F61KPc
	hTDh+D83WQSe4yn/WWe2Z1YUa5SLAfN2FhXJjIWrGZAYWxy+qyX2/O0oYJPk9sKcokyJQmgbTTj
	g2Zkbh+8K8IiqnnFeHHzYYhgbZJKcr2xRB1vNIFcZCEy7Te0qNZgeBkONOZS5yBfJhSogrra6xo
	OhaZW4/eNoK1AFrZxdTBqylhmhZ9bKIRhSARuQJX6gxZ8/IMZ6E85a1jZZcVPAly3LMwvQ1hrTT
	VWV1CClguTppbI1kyL8RTMPrsVFHU2buk7dRmtxgzYjYXRydxD2o0jX4Eeo6TyIVXgLRfKeukxC
	cSq0PkKuf6jCehKdnE4vEMcA1TX5eNkl+A82OhyVvuanoYAcMic4lWvcuHzgLtujNI+Jd9UPEId
	584Of/R+PQdwY+yn905EuQ8UvWqA+hgjUFLXCTOfnQ1ViPibDnxiv/dwdHuA==
X-Received: by 2002:a05:7300:8cac:b0:304:fa0d:85ba with SMTP id 5a478bee46e88-3077af576f4mr7794021eec.12.1780878148924;
        Sun, 07 Jun 2026 17:22:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8708sm15964925eec.15.2026.06.07.17.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:22:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:22:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING WIFI
Message-ID: <385707f2-db47-4dd0-b90e-bf6f58a91518@roeck-us.net>
References: <20260607123626.100630-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607123626.100630-1-eugene.shalygin@gmail.com>

On Sun, Jun 07, 2026 at 02:36:16PM +0200, Eugene Shalygin wrote:
> The board has a similar sensor configuration to the
> ROG STRIX B850-I GAMING WIFI, but includes an additional
> T-Sensor header. The patch was provided via GitHub [1].
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter

> 
> [1] https://github.com/zeule/asus-ec-sensors/pull/105
> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..9669e729bb8b 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -32,6 +32,7 @@ Supported boards:
>   * ROG STRIX B550-E GAMING
>   * ROG STRIX B550-I GAMING
>   * ROG STRIX B650E-I GAMING WIFI
> + * ROG STRIX B850-E GAMING WIFI
>   * ROG STRIX B850-I GAMING WIFI
>   * ROG STRIX X470-F GAMING
>   * ROG STRIX X470-I GAMING
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index b5d97a27f80d..27e39138011e 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -628,6 +628,14 @@ static const struct ec_board_info board_info_strix_b650e_i_gaming = {
>  	.family = family_amd_600_series,
>  };
>  
> +static const struct ec_board_info board_info_strix_b850_e_gaming_wifi = {
> +	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +	.family = family_amd_800_series,
> +};
> +
>  static const struct ec_board_info board_info_strix_b850_i_gaming_wifi = {
>  	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
>  		SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
> @@ -868,6 +876,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_strix_b550_i_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
>  					&board_info_strix_b650e_i_gaming),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-E GAMING WIFI",
> +					&board_info_strix_b850_e_gaming_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",
>  					&board_info_strix_b850_i_gaming_wifi),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING",
