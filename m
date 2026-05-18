Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3061448E0
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142482; cv=none; b=Vxv7USrF9HABeYB/jFa72k99NTeCO9qR1PKp80G6nylc7ZcwoxX32OZXXgEmb7pwwpoCNFV0dF8SMFyW+6wFLdu99VQnLk3d0sNwrRmdzaxvf+KZlC1kp18BeEkGGoOfA3mXKrI6DCTTQ3VFc/uVcH1Q8VtSkI08B6NP/v5cOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142482; c=relaxed/simple;
	bh=FDGfy9RkHrUA1hhX6Q8EIAnaYFrZXOOI9g9WriqUMNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRmUJbLU4c2+IFTv/ZPv94ThwS8/HzeoqLYo4pWtUAfn5FbFKGjXFni3OtVXwO8zka0hTb+nCynMzSxUQJWB8Aby6oNHDjkOuJLgC8OYw823u4RrES0b9rGWj8uld8F2VY1IcbczmlfEAPc3oRKWu1yrxeOzis4cBRwKzmCKUSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7Ew8A45; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7Ew8A45"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-133466cf955so10716055c88.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 15:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142476; x=1779747276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=12UM/UGG3HVTOjCKVDDcmh8GYgIR5ex4BLaqtn6bAK0=;
        b=X7Ew8A457782cnNdLbJu8EEXwU07eMfokxM2CE65L/MGVZdNC0j+t4WF42tkqPBnep
         CV7i2z7SAIPfH0VjnO72UIjEQdGf2ilHDKmmAX75NTZiPGPqcxAxLaJ7krqf2xHeJF6c
         fSeX6KxaZ5IQs58Am5rwTHI7oQb11wIjBpwbK7V2MpLkYQAWLTgsrSD/GAlTpUTdGxE8
         i2VZgOGGhI6k0tLF9yseiYyZClvjU1NezaFOA+MO0ldD5w6DGlYMAPaGdLISxMk0FbE3
         X3zIW2sUYobHcK41KY9ZyOh8de/S9b0Waa0XiJW7GdglS9n7oGy6WuaOyDc2xvV5xRHT
         vcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142476; x=1779747276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12UM/UGG3HVTOjCKVDDcmh8GYgIR5ex4BLaqtn6bAK0=;
        b=f43V4ggL61w+YqO9DiR+TH7Vy3aNQfH6MuQDpxfoLBUnZ9JAKzGvc/Dp/u99C7NM8R
         JGFWoOed8E4MahUqmQ863JqpbOmu3YwhGEAVqln/zYPxsheGTa4rIFePoAuYIfOEb1iv
         zZU/O3Ql6cyGiKX8lQy7icK8YJqV0Mj/mS55GlOmCpDPM809KlU3es3TQOuXkjaeCJwH
         XensC54Mr6rlRRXw5fnFZcs1zGtAg6InJfz3Zz+FEfil+p3J+1KMW31NZIf0P+e4MW33
         gT4XulOyiAfngofv4UgKPieF18s6S9hUdwyNa3vdUoCPqD58NNF6sqU2tvlF32U4SlYJ
         8GCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ccamJOycpzqLcz99CLrL+OtO2j3wzjnHRrOP2H+UZs9pQ49R3NMorfJKvzNqPrlp7GR8sCqEEXKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1YLkBSNhClfkq9ZzLGPsfz9tBI/1T5iEOI7ct4y7RITPY8cx
	utHCTAbakn+bCxvhaxUgmToYjWI8pdw37X16T5vubLx2GaTrqDk/OeC6
X-Gm-Gg: Acq92OGpGONqqWBZMpGBe79sBQnUrw/dguAc8PXsfEzfzQfp3/18gCmCuyjU3+pbQIQ
	LZu2g4bfzBh7KRh2SC2Tlnkv+dXgbjKKAg6HOggOmh2rxfgav6ii6M0LzO+PXa1Pv+2dOb4l8UH
	w+lkQsef0e43BQljhEKQ0XK1YgVB3Ps10FmYYcDZ0ESuhjytsZrYctZaiQ2QoPp26iK5BWgGXoI
	DWIOeJi03OmFGdLclPfRdvUkUg4ot/4G/0Qqy3/aC2dUGkYIjGxb64L2VVQ0LjsKFnuQgVq1q/G
	Js9nyT1Qj1u8c4D+iP/PSUpzZPVUBuP+pSm05umH6yESp15AGvFqyMu8fUHWu7InX1xn/9BuMAB
	UvyV3ZJq6W0R/l5UyEJyaEVqyU76uFT7xZTaRD8M3/QZ9e2ieSiVshQcSEvCz8bvA1DJUzHES9d
	FUe6lT4Zd36Pk/CCkY8kXiaU5QpROrHKIo58MzuTfl1sl0aSsrsBFORVoKvjdZaJ17y/F/mGVd
X-Received: by 2002:a05:7022:eaca:b0:128:d4be:7428 with SMTP id a92af1059eb24-1350483f0efmr8602447c88.19.1779142475840;
        Mon, 18 May 2026 15:14:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm20513080c88.13.2026.05.18.15.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:14:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <006d3f24-b1cd-4fad-b8b6-96ddd904c283@roeck-us.net>
Date: Mon, 18 May 2026 15:14:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: hwmon: ad7314: document sysfs interface
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260518182744.1302-1-eric039eric@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260518182744.1302-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/18/26 11:27, Chen-Shi-Hong wrote:
> Document the temp1_input sysfs attribute supported by the ad7314
> driver.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
>   Documentation/hwmon/ad7314.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/hwmon/ad7314.rst b/Documentation/hwmon/ad7314.rst
> index bf389736bcd1..b454e617d48c 100644
> --- a/Documentation/hwmon/ad7314.rst
> +++ b/Documentation/hwmon/ad7314.rst
> @@ -28,6 +28,12 @@ Driver supports the above parts.  The ad7314 has a 10 bit
>   sensor with 1lsb = 0.25 degrees centigrade. The adt7301 and
>   adt7302 have 14 bit sensors with 1lsb = 0.03125 degrees centigrade.
>   
> +sysfs-Interface
> +---------------
> +
> +temp1_input
> +        temperature input
> +
>   Notes
>   -----
>   

Please stop doing that. It adds little if any value and takes time away
from reviewing and handing real patches.

Thanks,
Guenter

