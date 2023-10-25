Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E381341B5;
	Wed, 25 Oct 2023 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcKWV/16"
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02072132;
	Wed, 25 Oct 2023 14:43:22 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cbf47fa563so1353155ad.2;
        Wed, 25 Oct 2023 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698270201; x=1698875001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pKgvc0ZdpThrYsI9owOdyfg7XAKBM9BBvoNuBA2SpU=;
        b=TcKWV/16SXF17jjO6d+gEk6uKNc/kq+9eQpMMLw46Gkm10JEpa6MWqiQ5mR/S/A3SQ
         YTDTzIjrU4TFqsRGolojh1qik8rWlByZ51q111jUiDH3Shq56lgvATbYqYWLKMn1naKk
         3KhrH4KI4hoxfrw9/t8yo8O1pbuhbVzVYq0v2lxQNWp3CeBHjLnBW6pdzQwJP1wlU5nY
         CqbCcn6zsSCErcgktloVFsop2vefu4EEZyNaikT/dRI9iIFlDDrQsVKZwIj2XzrfcdDB
         tsE5ib98VDAnBYBpDS/hUs9V8TEP4oLsGgdlfeYQVNkx9rGf94qFCcIWurhQ8qd6QNh7
         K48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270201; x=1698875001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pKgvc0ZdpThrYsI9owOdyfg7XAKBM9BBvoNuBA2SpU=;
        b=LyF6WnwErbROOKZbzfUqkyJCcnzx6x0iVDn7V+oMpBuGawfV0uKk109dGZQ1vjo0Dk
         BlkbrE6ARBlQstlPN1NpNWAx4UHAxklNSXfXBQYXQhgkiaLf9i2+LugoPb5CFBT3nGy5
         LNMIdVlrUiE8DTTGriWdCMecNmzzNppkl3bPze5JbBgjloGeClYK3PL+S8VsJWtGGCYe
         7YfgvVfkcUvDX+/Fcn5U83ssPuh2NNNZblhAF1W6oRBYa8C7Gi4KvOeaXPFFGsXfUiqJ
         pGKoVuS69pj44TjbD4GO3TOlCNjcpDvoVmVWWTTm4jOTP4yfsp0WwWeRCDiH/Rzp3ox6
         G61w==
X-Gm-Message-State: AOJu0YxcooMg/BIk3ox8WvqFO39H5f9Sxh9fYMU1GyO2hzPblAfCOENH
	TWQyyToie1HI08xvOHTn0e4=
X-Google-Smtp-Source: AGHT+IECzA5Qaal68VFpZkxbxUHSJ5OGnDeFpmeFEnzT+dlBRb9pAUcCONJWtr+3AlOwkp8EKbDr6g==
X-Received: by 2002:a17:902:ecc2:b0:1c9:dee4:87ec with SMTP id a2-20020a170902ecc200b001c9dee487ecmr17216487plh.39.1698270201197;
        Wed, 25 Oct 2023 14:43:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902704100b001c60a548331sm9534098plt.304.2023.10.25.14.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:43:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Oct 2023 14:43:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] hwmon: max31827: Make code cleaner
Message-ID: <5376244a-c6ec-466f-a42d-97d2d52af2cb@roeck-us.net>
References: <20230919093456.10592-1-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919093456.10592-1-daniel.matyas@analog.com>

On Tue, Sep 19, 2023 at 12:34:49PM +0300, Daniel Matyas wrote:
> Used enums and while loops to replace switch for selecting and getting
> update interval from conversion rate bits.
> 
> Divided the write_alarm_val function into 2 functions. The new function
> is more generic: it can be used not only for alarm writes, but for any
> kind of writes which require the device to be in shutdown mode.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> ---

Applied, with one change.

> @@ -333,39 +330,27 @@ static int max31827_write(struct device *dev, enum hwmon_sensor_types type,
>  			if (!st->enable)
>  				return -EINVAL;
>  
> -			switch (val) {
> -			case 125:
> -				val = MAX31827_CNV_8_HZ;
> -				break;
> -			case 250:
> -				val = MAX31827_CNV_4_HZ;
> -				break;
> -			case 1000:
> -				val = MAX31827_CNV_1_HZ;
> -				break;
> -			case 4000:
> -				val = MAX31827_CNV_1_DIV_4_HZ;
> -				break;
> -			case 16000:
> -				val = MAX31827_CNV_1_DIV_16_HZ;
> -				break;
> -			case 32000:
> -				val = MAX31827_CNV_1_DIV_32_HZ;
> -				break;
> -			case 64000:
> -				val = MAX31827_CNV_1_DIV_64_HZ;
> -				break;
> -			default:
> -				return -EINVAL;
> -			}
> +			/*
> +			 * Convert the desired conversion rate into register
> +			 * bits. res is already initialized with 1.
> +			 *
> +			 * This was inspired by lm73 driver.
> +			 */
> +			while (res < ARRAY_SIZE(max31827_conversions) &&
> +			       val < max31827_conversions[res])
> +				res++;
> +
> +			if (res == ARRAY_SIZE(max31827_conversions) ||
> +			    val != max31827_conversions[res])
> +				return -EOPNOTSUPP;

Changing the return value from -EINVAL to -EOPNOTSUPP was inappropriate
here. This needs to return -EINVAL because it is the result of an
invalid value provided by userspace, not the result of an unsupported
operation.

Guenter
