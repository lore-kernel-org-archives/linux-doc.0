Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E88367B99
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025947; cv=none; b=kZ79lfR6QUgMfM3OCR1rOmFX8DsVa6O/r9U4jGvAvGO6q/sBbGJrm7QHze3OuMSvxzcD0ziF7cZVNE41TpYuqFvN6UO/+PfZRM4jPHogBiX12viQTjDqhoX2ahhzYY0RviuiH1FfZOKc+FjdK5o2hruvW/87U1XOwFik4ZBZajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025947; c=relaxed/simple;
	bh=UMheiGJ+IYh6NeNqTWKDS0tzUKZuqqqno6XxNoZMMtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlgwp9V+b9oXSqg89JS+q+MdLJoRyKSJoNVV9x9y78t5x4WcBb+GopCT07txzBO/juOPnVBK0JfmD9EaCEbexO97Hku+OOs8di6u7dd29FSg/zVTQo57AWlT14DxzcsAx35rMBHExTc0QwUh2sSjRMetuax5KiYH9dfCXTh6Ozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzY2X0V6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzY2X0V6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso3007097a91.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 21:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787025944; x=1787630744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0y6x/DIGt+ql5yub96W044u5GeXxY/ACqN4aUzyUNk=;
        b=TzY2X0V68KxhTVnwpRf2xs/q9k8jyZ6t/ZxDVEhJ8IKYbVUnhzksDGXLGJi3RDscVW
         3JtU1y/jIgtrMpF+oDxt3795AdCZ8zeW+rrsiT0yLdXisO5vp9jAwPZUm74oe+DtQ/uT
         8G3jxTAWvl/nWvawqyRYEMZaArHzENl9tVk+bbz47dfjojqwNLqHPgURZJp55z1kYU7Z
         JcMasM2pFOBn/iFZzt72LcCKqX0Zsi6H2C5AVpZLik9Y1fbiKQPYfWVr17eXYWl4TZdD
         Md9+6YIVGqW3X04X4J/Hqg1vFgN247NG7Vi3qeSHQxFmA3WYhx6I5MkVfWyfX1/HLMX1
         8/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787025944; x=1787630744;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H0y6x/DIGt+ql5yub96W044u5GeXxY/ACqN4aUzyUNk=;
        b=Bq8BDxzcQO4vXPaXgUxxBPoRALVL7wGX0WOW+ttd0RELowXj/F+czBUe1+U859WRla
         Vl6kQxYH4OD0zTKY8e+c7Srbf0xeaCv5xMyDi8mrA5F6mNB5XSrrb/eU6Kl+RSx4X9Hs
         GLHOWEreFzpkn68wkU/ZadCo1888XBLfBrfuXDimt/j67A4rfTJtDG/A8/bcV0MYTXJe
         xjxtoS1nxVxSxXIQvigniE/I5RA4riFU0z/3m9lJL4C9+o4ADZfQ8KUTbGkaXuyGODNu
         OxFqZfGa6sy0wtBkxGS6aiLIodQwKUA4GP9c2r1XmIRIBlt1RIu7z1DxphrF8mAkzHcE
         K1rw==
X-Forwarded-Encrypted: i=1; AHgh+RpB0Nw8cPQfQElYoQwadkjB5E252xqmLxGK7R3YYuKWcZknSoiOVT8XSR0kqfsJr7lRmMG0wNpY+78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwKBt/Us9iNGbCVgSXtURwj1bGmy3bjzjU76YihizIWUdOGV/y
	dvp2duj5FGPTnac6BzN8mJC1QgVq0wlYKY3qDcyPLS0DXMSxT8y/hHZj
X-Gm-Gg: AR+sD13JeuzCLVpQ9GcL8WtwIALQcVC80RAFRQPCdNmIDVZekVAgmXlKwbVjxTpZjzn
	InYU1ZCMmdC5nY5JnX6Mnc9Jq2nKfumWJeowHkpPnbtnys3biywFKRzazR7wRYlz9RD+ufwakPu
	rt7VBhB3WjkZy7O4Q1x3k0nPWGHzQiZSZNvdBj83aK9cKxIUbgGzuSVChMRO2jIybOR3LfFS/dE
	hb/1ZHfXiJb6fsJQHso4+MeFG7SN1miUC/58xunXZr740dmgOeRTMKl7sz/opyfoe6I3KLDepWa
	vW/n6RCfiWXC+eZGesnuPzZ4wyrAME1b+NA51MPqTYS3NcvpLstScaDlPWYRrH9i2emrGNKJAio
	AMQmpFFNIkVUrkM3NX8ZnQVIRXpOWud4njrZbLXwiSe4TbXemz/ovKKAuJyripqggsEiZlXk4ob
	n38IwmKgjoQUAeA79ItgsLk93xTB63ii1wvBVp65fqhUohfyUj5vF429G1BiSMLBiYCMx9UotnU
	ChYeSHXd1AWrAgiNad1VSmEcGJ5dYfNWMgOmA==
X-Received: by 2002:a17:90b:3912:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3955a783987mr4766753a91.10.1787025944281;
        Mon, 17 Aug 2026 21:05:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b40basm4470814a91.14.2026.08.17.21.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 21:05:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d85945c9-41e2-4cf1-8058-f73a355f165f@roeck-us.net>
Date: Mon, 17 Aug 2026 21:05:42 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: hwmon: replace a confusable
To: Antonin Godard <antonin.godard@bootlin.com>,
 Cryolitia PukNgae <cryolitia@uniontech.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/17/26 02:46, Antonin Godard wrote:
> Remove a confusable that prevented the pdfdocs target to complete,
> prompting the following error:
> 

The term "confusable" is confusing. The patch is replacing a "Fullwidth Colon"
with a standard ASCII colon.

Please either resend with updated subject and description, or I'll
fix it up while applying.

Thanks,
Guenter

>    Latexmk: ====Problematic refs and citations with line #s in .tex file:
>    Missing character: There is no ： (U+FF1A) in font DejaVu Serif/OT:script=latn;l
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   Documentation/hwmon/gpd-fan.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/gpd-fan.rst b/Documentation/hwmon/gpd-fan.rst
> index 29527a77fe88..b27657d33056 100644
> --- a/Documentation/hwmon/gpd-fan.rst
> +++ b/Documentation/hwmon/gpd-fan.rst
> @@ -67,7 +67,7 @@ pwm1_enable
>     at full speed. Write "1" to set to manual, write "2" to let the EC control
>     decide fan speed. Read this attribute to see current status.
>   
> -  NB：In consideration of the safety of the device, when setting to manual mode,
> +  NB: In consideration of the safety of the device, when setting to manual mode,
>     the pwm speed will be set to the maximum value (255) by default. You can set
>     a different value by writing pwm1 later.
>   
> 
> ---
> base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
> change-id: 20260812-doc-hwmon-remove-confusable-de457420ec02
> 
> 

