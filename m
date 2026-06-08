Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD672618
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922030; cv=none; b=mfvioKIwCOXuive3ltZfS2WSboCD9dyujdV+OBnQIa8QBg4o3ml+XrCopXCSqlPZ9QpFQE3sSdDJg6br9eOS3Zm2NZRPPlRWY/fcJNncCqopN0hvSsnvsjW0MzbirgfZKohdAChGSn1gkmoT/F9ve8TBAjMcpFDUxkFwlI613cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922030; c=relaxed/simple;
	bh=CtPGOwn+c21B5ZxD/CyOJk2kuWxqQj6QpYPnu1/17WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruFJKKmCiJG/AZiIqIX2Xu4K3610ZR4xChGx9H+ARbMyFw2ZSmS6NFWZ5My2WNcZlTtwMdeM/ESKDkwCkAggeXw++Qs4OnFqVc1JPhkKxJTH+7Ol8bpTNk1E6y0kabHNIrboPlOruof62cZVl44OO91o9tHQkw9HjFbthOGyRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw7aXeP+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw7aXeP+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0b944f6edso44410145ad.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780922028; x=1781526828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4SamfGu8OlSHhBzdC2yYZSudOgVmzcUrQiqe/RzLKA=;
        b=hw7aXeP+Zf7sBqYBJll6xsSPNZmTZ8P0tuKf43EoPs3Cyzm7DryNoboh4NkfLPolPo
         WmLaDeDCwIJ+5LTNTrMAyqiA53ihi262fSg6LDAKMoaWKh6dOhYJvnJkzS8xK3t49PzJ
         gIePYI/bG8vUewgfjbylQ+eEzAQ+0ebobvyts69eb0x5U5yIH+Oya3P7oktzWcoYO9Qe
         C5Qu8disDavUHGuRqDpEgBHfGfiqS0KQefVPgzfnPpaOpEBbI7aM8G+wx6Ef+ZhLRP9r
         PAlHt4tJFWrMssRDT9/n0mB0DNWZdEWM02wqGCffZP3sveyDn3oSTctwWoOFa4UUjXB5
         /n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922028; x=1781526828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K4SamfGu8OlSHhBzdC2yYZSudOgVmzcUrQiqe/RzLKA=;
        b=Vh8GzDH8Nv3mfEkeu6NarSLs0MmhVTzaFWhR39LQoED2Y9fUtvTIT0KmWP2Dg/GCZ2
         TxLixoqjnK6Hv0gCn8e3tJy2owWBt1phNLgTHYXqjtyyeAgkAbMJ0WqJASFMA9DpZeAk
         wf01jiH9YSc0fy30X5XdSIXbqioXL1UhXJSSXUF8nuwexGTb6ROcgn/dpZ+R+bVfG5cq
         1l2Bpi2ixH8arpDSzyY7NMiL7W1owBKhKnl/55/3LzvvTZRec8jpXzCjiT/k4TNoebZy
         F0lfsW73hUcxS4dLRcy9IcvVMf2v3qcXgR73itWmfuZ97B2px7OZuOQeJgXHLbBBcAIB
         lUTg==
X-Forwarded-Encrypted: i=1; AFNElJ8hzMow8pP/+kOpGXVf9Xg8zArWXLeHKkfqsX2F/kWLwAg1cRcryBRn5Vn0V+9BV4Fkbe2rEbWjsyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wQ1h/EDFz6q8jYGjWbLYxV8M9NQNpJEiTWZ9hgdJsXjbXv2v
	HPgZlXKk8cT7QWmtnbENUjH0qGDabJiP0Vd1CXXGVTP28aLAxiviPjLZ
X-Gm-Gg: Acq92OEcLkfZrWc0GfEPOxS7GORzM+Ztqb7iVnjlchr1DiLvZFv/go1k+FWFi6a/Qsn
	sunkOA9vwAdZBjFdAZyQlleOoN79w86xPxEFXRo3dCq9S8ITWn9laonQwVmpbMxx2HrdAfEAWhV
	PHVq5YNt19jHEtRraHG2Pe60ZAGb+AEjFRemE63w5WajsuGDO5ePkYUBfevh0ZfXMLIk8iVtWML
	8MmZOi0eUWK6Rv8rclLcLHjOqoDhbVle9z23VeRFDdrH3U/YBqyrGWtvBcDHHUzsKzpQYAwrxnL
	jDk6EQavUSUvQM0Y2NhHvACC4mjXMaYFmgEe38LTwtMWmhWu0yzD4XFo3l3hAZkRWU3QCFkNmsa
	QsIujEJysBo4lCI7b0nTRhyInJMDqUKNjMA2lVKSF0NJpAl6N5ty6sPLzUIXTOXRyoDoOtQ/vfi
	7XcFpnzK4wTTw8F3rkCnBmKoKcbt6siXLI+vrZCu4rv9FIoVA=
X-Received: by 2002:a17:902:ce8b:b0:2c1:11b8:3c80 with SMTP id d9443c01a7336-2c1e833c530mr168489655ad.30.1780922028201;
        Mon, 08 Jun 2026 05:33:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm178839555ad.40.2026.06.08.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:33:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 05:33:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Brian Downey <bdowne01@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Message-ID: <c4e1c8e9-f098-4c3c-9d09-c0332002b1a6@roeck-us.net>
References: <20260608060855.40469-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608060855.40469-1-eugene.shalygin@gmail.com>

On Mon, Jun 08, 2026 at 08:08:41AM +0200, Eugene Shalygin wrote:
> From: Brian Downey <bdowne01@gmail.com>
> 
> Add support for ROG MAXIMUS Z790 EXTREME
> 
> Signed-off-by: Brian Downey <bdowne01@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied. Please provide change logs in the future.

Guenter

> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..60f1a6036538 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -29,6 +29,7 @@ Supported boards:
>   * ROG MAXIMUS XI HERO
>   * ROG MAXIMUS XI HERO (WI-FI)
>   * ROG MAXIMUS Z690 FORMULA
> + * ROG MAXIMUS Z790 EXTREME
>   * ROG STRIX B550-E GAMING
>   * ROG STRIX B550-I GAMING
>   * ROG STRIX B650E-I GAMING WIFI
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 070bb368f2b7..0e78750de34a 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -399,6 +399,12 @@ static const struct ec_sensor_info sensors_family_intel_700[] = {
>  	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>  	[ec_sensor_fan_cpu_opt] =
>  		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> +	[ec_sensor_fan_water_flow] =
> +		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
> +	[ec_sensor_temp_water_in] =
> +		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
> +	[ec_sensor_temp_water_out] =
> +		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
>  };
>  
>  /* Shortcuts for common combinations */
> @@ -509,6 +515,13 @@ static const struct ec_board_info board_info_maximus_z690_formula = {
>  	.family = family_intel_600_series,
>  };
>  
> +static const struct ec_board_info board_info_maximus_z790_extreme = {
> +	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> +		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> +	.family = family_intel_700_series,
> +};
> +
>  static const struct ec_board_info board_info_prime_x470_pro = {
>  	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
>  		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> @@ -857,6 +870,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_maximus_x_hero),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
>  					&board_info_maximus_z690_formula),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
> +					&board_info_maximus_z790_extreme),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
>  					&board_info_strix_b550_e_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
