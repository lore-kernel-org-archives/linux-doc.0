Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A917CB;
	Thu, 26 Oct 2023 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2SVt5+y"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F44132;
	Wed, 25 Oct 2023 17:45:35 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7af45084eso2678857b3.0;
        Wed, 25 Oct 2023 17:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698281134; x=1698885934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHLkCINn4lLbGVxfHW9b6lP2oBxUh7swZgx4nk2Gf9U=;
        b=m2SVt5+yAdbFYyD3wtZ3TfiufeqtEw3DVOC+/MZKwUkspzcIy45otEVElXYoa9L3VB
         XUpdH1wlKotdfsZl0I7E94rFhAOF67rK3PhMde3ah8IIpbrWi9N0VUWtW/ztxdApZayx
         LZ8oaCIXz2XlFiZfVqzXw739KaY7ybZdcrLNhkQoJVi/dm7rCyXvOiagKuU69HZk/56N
         Gu0W4xT3+u6NEJL/xjWyQEQKl4XBUHac/y2YagShuCbZn7DXdqcsDhWACYJ6yJEidIAZ
         7citZkCPPsctDbHKePgC6OazVlgi3EHegz73lF+ppipZn/YqaQiPC0xL2gAZPL0nXrOe
         GR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281134; x=1698885934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHLkCINn4lLbGVxfHW9b6lP2oBxUh7swZgx4nk2Gf9U=;
        b=XW0BPN55IPifRmTlDlV08R4WHCSy0aCZuU/psOpJkDANEG00Hh1oCPokCDG/j5lVKL
         2fVlWDiqW0LGoPlFywwOd+DsUp25+OdAiReQykp2EMf0UVmfKXLKxi5vqE7us+kMcYJR
         2NW62VoHhxHoYvD5Xbi6A0m1/2XSNvJkWd90rZUNFECVd/ZyuloSvxKc6gnpfueIhTRv
         v/6mmlBuhWXGePCEuCCEIdJt/ETORcVwzqdJH9XJy+c/sclfSKt0OFubTkZv15lxOugK
         3Rq3K0gOFUqdkbTUHbAF7UbgaSoXX9pOUyn+dRwFqouCXmdsR9fTyHFm0c+VeWQToQKZ
         PUcg==
X-Gm-Message-State: AOJu0YxygrRzpk3InbKV4EaQXYI0SE44wDmM5RHH2UzrHRGNdIELj5pJ
	/HTmVWegSTAEbALbADrDGe4=
X-Google-Smtp-Source: AGHT+IHEbieQxLQCtt5DWYc7u9VlLEOehm3MzdT8/hVsDTTjkJxTV9jydPsXZAMlWbkiK6AdptoY8w==
X-Received: by 2002:a81:5258:0:b0:5a7:b797:d1e4 with SMTP id g85-20020a815258000000b005a7b797d1e4mr16145909ywb.21.1698281134313;
        Wed, 25 Oct 2023 17:45:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a0dd202000000b0057a44e20fb8sm5503494ywd.73.2023.10.25.17.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 17:45:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Oct 2023 17:45:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, kernel test robot <lkp@intel.com>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/7] hwmon: max31827: Handle new properties from the
 devicetree
Message-ID: <bb4ccc53-c5e9-4994-9467-1c662088b0e4@roeck-us.net>
References: <20230919093456.10592-1-daniel.matyas@analog.com>
 <20230919093456.10592-4-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919093456.10592-4-daniel.matyas@analog.com>

On Tue, Sep 19, 2023 at 12:34:52PM +0300, Daniel Matyas wrote:
> Used fwnode to retrieve data from the devicetree in the init_client
> function.
> 
> If the uint32 properties are not present, the default values are used
> for max31827 chip.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---
 
[ ... ]

>  
> +#define MAX31827_ALRM_POL_LOW	0x0
> +#define MAX31827_FLT_Q_1	0x0
> +
[ ... ]  
> -	return regmap_update_bits(st->regmap, MAX31827_CONFIGURATION_REG,
> -				  MAX31827_CONFIGURATION_1SHOT_MASK |
> -					  MAX31827_CONFIGURATION_CNV_RATE_MASK,
> -				  MAX31827_DEVICE_ENABLE(1));
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
> +	} else {
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
> +				  MAX31827_ALRM_POL_LOW);

Since MAX31827_ALRM_POL_LOW is 0, this code doesn't really do
anything and just pollutes the code. Maybe that is acceptable
or even common in other subsystems, but I just find it confusing
and won't accept it. If a field is zero, leave it at that and
don't touch it.

> +	}
> +
> +	if (fwnode_property_present(fwnode, "adi,fault-q")) {
> +		ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Convert the desired fault queue into register bits.
> +		 */
> +		lsb_idx = max31827__bf_shf(data);
> +		if (lsb_idx > 3 || data != BIT(lsb_idx)) {
> +			dev_err(&st->client->dev, "Invalid data in fault queue\n");
> +			return -EOPNOTSUPP;
> +		}
> +
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
> +	} else {
> +		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
> +				  MAX31827_FLT_Q_1);

Same here and everywhere else where I missed it.

Guenter
