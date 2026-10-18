Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977C3C10A0
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339794; cv=none; b=lbRZmw2OebcogGxAoF0+DDcG4ddLLL+ok/jkZgxWfYnQQwxQf0Zvxrj18Tgs/J7ydzep2Io2udNVdDQKrxRBTsCmpfryhtUyolvg17c+jUocyKW79Zajn3WG0aFEuCNZ+18K4PzuKQK3pArwbdJ1NzPMa/0ieSNP7Pb82cjr6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339794; c=relaxed/simple;
	bh=K7+HPRoT8cC9vA5FhgvhzRNw1g9Mo76Ky1GUeYVLRfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMtT1Jjmi8pqCt4NrD2Ez/DRWeOUxXC/l3PABkHF1ILGye8DYFmIYB40+Y9Ai0qm/mp8bUJS8TtSmOD6iu0UYEaMRiAMULoaT4cZP6ovhAl3vOO4zWcFDpKp1WsMAgyrwo5ifVKIoJD7/2wcEEYMlETCt/QoUlcv7nf6vyG4T/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIxOpE27; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIxOpE27"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso114672eec.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339791; x=1792944591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ltRwcLJB2IvTeYU1P4tvckFXLR/qTUoJOrgmykztVO4=;
        b=hIxOpE27TBfTd9z+/+LRrmHxFaBFUK02GZk2NjHeQZhrilLl35DZPUGoSGyKspiRYc
         w6B14WFbVzsVyYd3htwhh5wECpHyZhTbqreTE0sMwinZwtHooW3vXwgKg5pfrrsC+Yll
         BxgrdNEEdRwnNkCflDm+PktPFkRb3vmca04vOPDNiIZPIWuaJF1y5GqctM/xCMK+oAog
         kwAsNMfs/qcojris8KuT5Bqgga35j1BrnxpStdJ66+wtXKZ6HCObC6TwY4gYK9JSs72L
         35DE6ZDgdu3Mk+BpEMTqtcOcsQDtCmJfrUcFexvkGxt3m0xC5vle/I31SXI7ZxZoswu/
         7qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339791; x=1792944591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltRwcLJB2IvTeYU1P4tvckFXLR/qTUoJOrgmykztVO4=;
        b=GB1Pq2fYGq0GkGo+PrSJdZoAM3w2oU8RDNiPjZ57gGbcKsXmrpt79BlHRELmPOD3P7
         8mSQAP3RJKiAAFPsAucf4TnFea7xc0w6RRXTOWVICtQjnSybJ2aWPHGpO2iusSUzfJX3
         EGGu41BkNlR9JY2zUs/Di9zq2Vha7kmJQZkJPWnFo/JRgA6HfYCq/HYg4PJNj1iYH1Vx
         euJJCN+DDs3iufnqP50A99s077JyZBAipkHBglquaWI6SNYL0uICzAiS7uFFsQfoFcjB
         KNWk+H+FTtup+iP1yIyHZcjqkbqc3Y7TE6euQGOlbssidtPv1JUADx1Sugd8HuQWGGg7
         5f5A==
X-Forwarded-Encrypted: i=1; AKwUvBxI9aT+srbsT4rif5ZxuOWN5OhVYFo1FLU9ziCyzOIzgNhOGgjZF9aUHr6bRFGxgV3y6uZEQMlKE5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMRtdZJ4M5eQr7WQ0QT4LHj2B3oBhkwzLloPAWk3eXOqbmkWqP
	Flb8OtESNZrOmo17oDe/7F608dt2QbPy3O9LC6nbGrtq3woSH3fdZvoB
X-Gm-Gg: AYBFou2bq0b9wHlSM+Cm3e4BVg71yh0XPYLeI2Ne0jG3B1qr+4ABplZo+NikmtTUcsp
	2ZzSG2HMajKv8waGHuMCR/AyoMdqAB809r2afnhQdt+dDRXCUVw3hSrHqtvJSHGn2v6j2TBuIxf
	Cxb+kNP3/1Sn2GFs4DDfP1dtTrrdBs25WcBAgZbOb7nRxjQ2GExpH3RJZ7kDNbMR8H8i7A87vrf
	xm2qA+9a760mHwi9E1CD6U50GbXJd4QloefGm/51+hoZeMqXd5TSp1peWxbwMFoqP0Kkl4qGPzF
	nTttgcEOXo5nhxawCOJfnMFBuw3cKGf7oXbMvLLrSAGuNc+UEjc5p7Zt2iwOSbO8FFq8ht9Oyf1
	Yrcr7lrd0Bo41mMCTUDZOEjkT2p1SLji7LtTwMAGcs/qm0FrE8rJiUdv8PuNhbzmR558ZlISkYh
	3/h9wsVO9bkOUZhORXR8vzJZxQNt6Idv9VR+nZ9LGENESgwA5EjteGImfI7ZT1+zsWJkDpce/+h
	Id1zSRtTMRC
X-Received: by 2002:a05:701b:21c7:b0:168:6ad8:e8c6 with SMTP id a92af1059eb24-18512c382d1mr7146694c88.15.1792339790889;
        Sun, 18 Oct 2026 09:09:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm28812835c88.16.2026.10.18.09.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:09:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH v2] hwmon: (coretemp) Return -ENODATA for invalid
 temperature readings
Message-ID: <ef041f4b-4592-4693-a9d7-a5c82aab9c77@roeck-us.net>
References: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>

On Tue, Oct 06, 2026 at 06:04:56AM -0700, Ricardo Neri wrote:
> IA32_THERM_STATUS and IA32_PACKAGE_THERM_STATUS have a valid bit, bit 31.
> The Intel SDM documents it only for the former, but the package register
> implements it too: x86_pkg_temp_thermal has required it since commit
> f1a18a105660 ("Thermal: CPU Package temperature thermal").
> 
> This driver checked the bit for both registers as well, until
> commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
> temperatures") made it ignore the bit because some CPUs clear it while
> the temperature is too low to be measured. Since then, temp%d_input
> reports such a reading as a real temperature. Userspace cannot tell it
> apart from a genuinely low one.
> 
> Fail the read with -ENODATA while the CPU reports the reading as invalid.
> On a CPU that clears the bit, reading temp%d_input now fails where it
> used to return a low value. sensors(1) shows N/A in its place.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/46f9f319-de71-412f-a424-6cb801478456@roeck-us.net/
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - Patches 1 and 2 of v1 have been applied. This is a rework of patch 3.
> - Drop temp%d_fault and fail temp%d_input with -ENODATA instead. (Guenter)
> - Link to v1: https://lore.kernel.org/r/20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com
> ---
>  Documentation/hwmon/coretemp.rst |  3 +++
>  drivers/hwmon/coretemp.c         | 21 +++++++++++++++------
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> 
> ---
> base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
> change-id: 20261003-coretemp-enodata-e424540e3b4c
> 
> Best regards,
> 
> diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
> index 349301683381..09f885a847e3 100644
> --- a/Documentation/hwmon/coretemp.rst
> +++ b/Documentation/hwmon/coretemp.rst
> @@ -50,6 +50,9 @@ All sysfs entries are named with their core_id (represented here by 'X').
>  
>  ================= ========================================================
>  tempX_input	  Core temperature (in millidegrees Celsius).
> +		  Reading fails with -ENODATA while the CPU reports the
> +		  temperature as invalid. Some CPUs do this when the
> +		  temperature is too low to be measured.
>  tempX_max	  Maximum recommended operating temperature (Tcontrol).
>  		  All cooling devices should be turned on.
>  tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 0ab6bbff5637..a9edbb4924a7 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -60,6 +60,8 @@ enum coretemp_attr_index {
>  
>  /*
>   * Per-Core Temperature Data
> + * @temp_valid: Whether the CPU reported @temp as valid. @temp is not
> + *		reported when this is false.
>   * @tjmax: The static tjmax value when tjmax cannot be retrieved from
>   *		IA32_TEMPERATURE_TARGET MSR.
>   * @last_updated: The time when the current temperature value was updated
> @@ -72,6 +74,7 @@ enum coretemp_attr_index {
>   */
>  struct temp_data {
>  	int temp;
> +	bool temp_valid;
>  	int tjmax;
>  	unsigned long last_updated;
>  	unsigned int cpu;
> @@ -398,7 +401,8 @@ static ssize_t show_temp(struct device *dev,
>  {
>  	struct msr val;
>  	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_TEMP]);
> -	int tjmax;
> +	int tjmax, temp;
> +	bool valid;
>  
>  	mutex_lock(&tdata->update_lock);
>  
> @@ -407,17 +411,22 @@ static ssize_t show_temp(struct device *dev,
>  		tjmax = get_tjmax(tdata, dev);
>  		rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
>  		/*
> -		 * Ignore the valid bit. In all observed cases the register
> -		 * value is either low or zero if the valid bit is 0.
> -		 * Return it instead of reporting an error which doesn't
> -		 * really help at all.
> +		 * Bit 31 indicates whether the reading is valid. Some CPUs
> +		 * clear it while the temperature is too low to be measured.
> +		 * Such a reading is not a temperature. Do not report it.
>  		 */
> +		tdata->temp_valid = (val.l >> 31) & 1;
>  		tdata->temp = tjmax - ((val.l >> 16) & 0xff) * 1000;
>  		tdata->last_updated = jiffies;
>  	}
>  
> +	valid = tdata->temp_valid;
> +	temp = tdata->temp;
>  	mutex_unlock(&tdata->update_lock);
> -	return sprintf(buf, "%d\n", tdata->temp);
> +
> +	if (!valid)
> +		return -ENODATA;
> +	return sprintf(buf, "%d\n", temp);
>  }
>  
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev)
