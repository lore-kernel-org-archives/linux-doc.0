Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425C3F0764
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301923; cv=none; b=USENlqK5FR/SnPmiAr6+g/uyNeFQ/n0jRHJOxSuMpU66jp5vIpJC5b8FiGdT/Ohw8vjOOgmmjkrGzQoz5zDRk7bwrwJb/kvVbvKdV/iPbpfUXvxr4Z8CALvbQTzI8usy3aqEni/KOo89aAJ67qyYjl48nJPKCWVPHPaBwRhiRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301923; c=relaxed/simple;
	bh=KrpVq21uAPBgvMwD5bVVvOvj4m0oV3UgX1RtALao//I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCai3GnyUvtOjxf0GT2Tk9lPx+mxSH+m9CwcaTUpqxgzR+itm70+eu7+6K5JqimY0YX5II+FzFiTrrcAwS+uIYJs+ArjRUWOVW7ncD9NZBe+bp9HBjSJIdTvX4vpUUwyZUT5Yf5a/YRIWGPyj9ALflJUZtjoDF9JNUWF/W7VlJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtsXkg+s; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtsXkg+s"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso578415a12.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770301922; x=1770906722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWMAbfW1h3czFpPAr6dxtSn9+/tMTdi7V3empbBhtRA=;
        b=FtsXkg+sNa0qzWzZpm3Ti8pleS/bqFWS+IWo+QERjEk+ellcBkOmpZT3CmEWmGA4HT
         nraZDIVCPqt3Il/Hw0IVbkDiH7xXGQdEEW6z71JFI9GqRevVcTRWBgTQLtWbK1MS5OwZ
         MkDoJA1UD0DB+t8uuUA49Gv4nyo43xe1gunGUhVqqEYMaZfyKYezqNBDLr+wZZH4naHi
         PNnrbwFLSGlfqu0Yv7RWc7oILrjeEtdvfNEZbf/GXCx5VEmnd+vTVa6PvnFpAgsdmp9m
         FcD1EIGWqvQ8RR+M40gTKOSzEnZpiyvK1ONCV/ZzFOL8B6Z8sjk+6glKDqpGwGlA9zSa
         YQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301922; x=1770906722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWMAbfW1h3czFpPAr6dxtSn9+/tMTdi7V3empbBhtRA=;
        b=UGdwMWByKzzdF9+58qhCMjdEcGcOZuXyeY9BTUq0z3OrwfaoQoV5IEYIw9XiO99jvf
         5G69JraIn3AhePT47bKVryOlGVlTsAglepVroC1pLkZ2Xqc8u3Gv8YLWGCU6VzlYgHDN
         6Ue/+/wf79LicMshx6aFyahT0hwKpl4UqLI056EmjvPhm9dWIriBwNItyJS7aWtObMKj
         g/+JyTO+iEEAsLXgj8EPxS4jD2YNLufcbyAKkdWxKBE+NF5vgsaXnjbEQ7pOmiacC3f2
         6Hp2FWOUj23xcMJA2cIF9zPvCFJ06az7ppwHTMaA0GeHmYNZV+yxe5rfF+Z9urNaDpwF
         Je/A==
X-Forwarded-Encrypted: i=1; AJvYcCUMpythIFG8D5+NopNbq7RcicR1glN9+ZOa8SvlvSU3DphySYdS89UYkGsG/s1rOW1Fzqpxpcibt6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/osN08HGCSyabXmU7ib979I+TznzwI+XoZgsODx6EPq60Sp2
	fb0vILwyKQ055M5YwgPV9bjoWjZmK3N7bgbzqdO/G4m25vYWr7Pl/31g
X-Gm-Gg: AZuq6aKF8v/nHPfn37uxKmO3QASEdoB+K+HYCqFBHpMjyWrRx20AUTROk3UB+dCUtUs
	xQFdL7wDa4zpDtrJ3/FPX8yyP56skNFnEF5QpkYR8My8KTyQkjIvajVz6JjYV6LmPr6Eu0FmSsP
	OpHqlTvusUdlbArEJwJlf9LOuaf+jrudfqGDQ/lCvVeCEMGNY5p7/ixQQprdSfMLjs1yZm4+W5N
	HOS9aDdsGzEaR4oAHxnmJ3AZJzPGWxn1OKxZXJDnAW+OBOBFGL9IgVRwZtO7gypkiPARVyTYG+0
	ByKjSSwvP7c4xGpL8cmx1PGTDdJPq+enrDkP2LxvYtNMAGDQ8/vi63NjJUhjmE/20wfpSX/Xb3i
	8EdYHVtvmhFVtSL6wmnoC9niGe4jitVnyYRdCLN1ezqloQX5wqySPadcNrD4nNJ1eNShmgLyR4v
	Qp358NLkaW7tuyL48nbFfREAIScVfTAH+PnTI=
X-Received: by 2002:a17:90b:5870:b0:353:5595:3247 with SMTP id 98e67ed59e1d1-354870dd823mr6355651a91.12.1770301922346;
        Thu, 05 Feb 2026 06:32:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487726e6bsm2092960a91.6.2026.02.05.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:32:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 06:32:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 3/3] docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index
Message-ID: <a3094382-087d-4167-900d-1f2c587aaa18@roeck-us.net>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>

On Thu, Feb 05, 2026 at 09:34:37PM +0800, Colin Huang wrote:
> Add the Delta Q54SN120A1 and Q54SW120A7 PMBus modules to the hwmon
> driver index.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  Documentation/hwmon/index.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..62d6fc0817eb 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -216,6 +216,8 @@ Hardware Monitoring Kernel Drivers
>     pxe1610
>     pwm-fan
>     q54sj108a2
> +   q54sn120a1
> +   q54sw120a7

Documentations are for drivers, not for chips. There are no such documentation files.
Add q54sn120a1 and q54sw120a7 to the documentation of the q54sj108a2 driver instead
and drop this patch.

Thanks,
Guenter

>     qnap-mcu-hwmon
>     raspberrypi-hwmon
>     sa67
> 
> -- 
> 2.34.1
> 
