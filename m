Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E8265CBE
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765033438; cv=none; b=Zbq5bwlFJySlX6IrilyZllruwFYAPXwPE3IfW1e9nzVoDsSw+A2Eqp059mZ99GUn3vWbAGbgoo7MYyPJMDaerQsi37HEZqqydAA9JhphSLbsT3LKLd1Ebr92CVh5z72ZhehsGGqJrX7lyVeWgj3HO8oZBBVFABUlPccN5hL5KDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765033438; c=relaxed/simple;
	bh=fN2Xexoi/B9ctLaAFFwv+iZ85CtawTyBDeizMK5ec0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSiqhM15MZxMPHERjDKFerHS51i+OwkRmxMcz40LP49b/EaFMcxvVuAeS2ZG/QOKs95wfJpL97Ck+0EOPS2nbEORMAFsFo3ndavM6l3G3FUsAl+PhiLhZPbCx9vavMlCoEuc/bcZxZLm7eUbabaFfDi79h8cz/CtobRDSzi2jxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkDo3C2B; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkDo3C2B"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso4785082eec.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765033436; x=1765638236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=TkDo3C2BlByiQMydnq8cPWPlaZPem9R/6d2mM1DE/IMsJ+C8QwQTIVVZfWc+97XtQb
         Zp46JEKP+WiP9p6hZjeEhNU3t0LJksfLRBSVeLJBPydf3Ciflee7eqoVmc8nkuxl7oy7
         X7Rmz19CO4rBMEQwHk9gTszK/PFaQCjL/iGoCajg1L657alimqp3zhF4xF6KwaCmozMj
         imqoq6U4YzlFCxj4h5zqBy9EjZDaiRS9JudtNRLH00aKrq49i+xgeH/zBRDLO5OineR/
         4fqJEm3CqO2lklumWqnSYq5f6VUv9ZMPNcLcKLb4IYVjJOOzJWfISOFSafoJeHvn2Nyk
         KbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765033436; x=1765638236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=QPshjeydck11fxXWfA2RMxJfRJRbd3372TcOY6f140L6327u6948PTr6MJIcqGCx0G
         sD8olGpMve6WDj6Q07xJEbcKChsStbIBNCbJdNVUGgFjeJLDMgCRscYtpGgWHPbgMZSC
         k8ymDKofJXYUNabK7G2rgjEHiJkwOfcGx3+ACinD4md7Lz8g5N4SC9+uBwoH4sFQVO0x
         qRo04rahYri/oZgU5vttEQoz26rLqSqbiyKdjHvsnKjlrpHodTunuRV9B85NXflXY2kG
         zd25eKIkOw8VCcdMeczwzzhimTlD1GEKxstklTlBkGQW/kvaFtalWdhx6qFHRXEOytkK
         buGw==
X-Forwarded-Encrypted: i=1; AJvYcCXJnuuAsR3+Jor0W4JjBQZ/2u5B3aWY0q4YvQQzT+LYPHQ2tzSDqBEaGGrs+qaZc9MoUTwYcAzoqww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxePTvBgTMpaJucYXxwfmsPi4hI7EZ4IyhZMiwOv6PHhk4/p+RO
	vrvqzGryr31NZKpab+G87eLBFph3AkT9oWo437d1fzE+ghuFYnnZAuz5
X-Gm-Gg: ASbGnctwkjWmKviGscCrMT/lj8SIqJbptXjx1/3neJGMqNFbaku2kRv0UEDRPy89zmN
	pr5WD3xJc14axz06UL2nTjdtjGpBsp66Ne9L1shCXfljSX4pRIfCNSr16asPhD6nPavxbTdAlZ9
	XOS+Nw6h9ogJyPRgzC3RAh2SfHxp0T/YZQoykZkuTvrwIika8108do3Bp2cMIi9pvzHoaAQC0KC
	LmAe/SZGNmqiqr4IFP5qPAOaNXvZbwsi0E3kswZuywkuyzp4fUDv9rZRDC3Xw43X39sCyE8bFrn
	ERKyRE9e533b1LJvubcpNeVioof8STPBYiwwyIZzxIkGIa52ncaDt40242leKGjtJxtewjmhrIQ
	v2b4tuhSI3qQlg/a4yNeHFbnQvwpLz910upW5neqMUPBjX8ECXRtrJIsH+EJ71fBiAAmquyanVW
	zTfFh6zlei5ZW7kBbmd+RJ8Rk=
X-Google-Smtp-Source: AGHT+IFzojphrHRVtMjAYXF3z/dTrYB/zZKE8NoGiyXHbs+9+cXXnLG2F0IpmuMealC4iJgXnHs01w==
X-Received: by 2002:a05:7300:e7ac:b0:2a4:3593:ccc8 with SMTP id 5a478bee46e88-2abc6f0ff38mr1683190eec.15.1765033435525;
        Sat, 06 Dec 2025 07:03:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba88433fesm21958618eec.6.2025.12.06.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 07:03:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 6 Dec 2025 07:03:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762
 binding
Message-ID: <0b01dafa-9d77-4ea6-a10e-05bc67ee2eaf@roeck-us.net>
References: <20251203181213.51618-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203181213.51618-1-sohammetha01@gmail.com>

On Wed, Dec 03, 2025 at 11:42:13PM +0530, Soham Metha wrote:
> The old text binding 'g762.txt' was replaced by a DT schema in
> commit 3d8e253724170ae9c8948c36801204fc2aa53682
> ("dt-bindings: hwmon: Convert g762 to YAML schema").
> 
> Update the reference to point to the new YAML binding:
>     Documentation/devicetree/bindings/hwmon/gmt,g762.yaml
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> Changelog:
> - Use proper commit SHA reference syntax

Really ?

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")'
#106:
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

I am going to apply
https://patchwork.kernel.org/project/linux-hwmon/patch/20251205215835.783273-1-katharasasikumar007@gmail.com/mbox/
instead.

Guenter

> 
>  Documentation/hwmon/g762.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
> index 0371b3365c48..f224552a2d3c 100644
> --- a/Documentation/hwmon/g762.rst
> +++ b/Documentation/hwmon/g762.rst
> @@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
>  Note that those entries do not provide ways to setup the specific
>  hardware characteristics of the system (reference clock, pulses per
>  fan revolution, ...); Those can be modified via devicetree bindings
> -documented in Documentation/devicetree/bindings/hwmon/g762.txt or
> +documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
>  using a specific platform_data structure in board initialization
>  file (see include/linux/platform_data/g762.h).
>  
