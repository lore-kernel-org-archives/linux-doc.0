Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F043955E4
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 14:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784472355; cv=none; b=LyP5uVdnZTARZfr7R+P9G5GRDRDZRkL6cPfwOCQsokCKbW/a7zcJ/0QPDoXV2Krh7JbImkGtpNcLgS1rMvWoo3Ji4osmWj3l4YNv8KAei3n7b5z/eDWVdUyhcjHIHHOX8mnC0G9E5j09Y9PCv0LCjWe+wDcc+gfYgYvkaAcWsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784472355; c=relaxed/simple;
	bh=ecKNukjHraacwmCQpiHLIQgYMqOEt1ffTnqANIfDITA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOV6FG1tjWcxNb2qiv1d2Sm1H2ZwjonCMUchCYAOlV+v8H0Yblud2OhdzLVGnwksaJygAO0k1pgmFYdK0WVIH8gAyo4D1fP7sDQ4VeBKGohDW1LRGBuxsFsCcVCbhQrJ6tEyYjkIVWd54xu1G8UhcAP+a4qYL62gy8aIk+oiRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQSeHau3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQSeHau3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceab75934dso96471125ad.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 07:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784472354; x=1785077154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IysUkVKW9kdhzsnMeCXt3xWNhnDtw3JA68trKpVEwBg=;
        b=MQSeHau3V5FTN1Use03Y5htgo1FVSTfhRYWLMbFNVV1LQ3/mHHqjWIZL+8NeLE0M+2
         r4dKn7aqlXEjOMEPdPuasA/2dKuuV3H20E+u26mKojwwe1K+mhJmTl4oLTosPP4k+tjR
         65haKPrv+8zJFqO5W62B+YWlNsjtc0d6/VsVQaBFdq9qSLn22BYbAAh+xXSxesPJwk9f
         1g064YpmMSZ39Tu53YqT9yHvWeNi1o1bQzH9L7ISZaY0FhPijRCJM//zGdLwaHZyqt7z
         25Izl23ux9UCR2EHxjgYGTzWtYKg7nvVgN85r6XnbL5tAlk/KZjCFdBmERMte2dTlzlD
         MXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784472354; x=1785077154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IysUkVKW9kdhzsnMeCXt3xWNhnDtw3JA68trKpVEwBg=;
        b=rzbn2Ds1oQdASFEVH5TzMD0IHOXCrtOfgnugTFxQP0qEC4Ndhp86l1Lp/u1yRhoVml
         DlkHIutdYHDj+H4Q4iisCpCSxGfvgCdoJMJT7I45eU6lKa+y4AMVQY2RtwiRSTtD/r5b
         8PPKxwg8UJj0KHWA8sTPmBJ/60PH9LEQqbzmHy5h0kl//UtiC3Q/zDRlfpg9Wi3bnXVK
         wUvmk0DHiKC2Jlp/Rd1LIntpultQBJEBNAYXm5Mq6WtCy5BD9wIWElwcgJyW18PT8ttL
         p/q23k8X+E4wTThZZJylXPmLX0Si0DKMF/mPflkb2aJ0cHgyyurz0WLQ8olW1tcv5Ef0
         YTjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8oQ+qv+Qv2qnS9eKO+gLt8KcYLSXEN817sai6gkbLVw0yFNnD6Odu+stid9NbaT1P25JtjrnQc2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYc+U2QWbO+I3LB9UsDYsPgiY/OAjxrHR4FE+aQvnnUf/j1dN
	O5UatHbOAtqd906fi6yLaFfo9ZWTmc4SWOlz4wgIF1hNB9jpTHA1Vmie
X-Gm-Gg: AfdE7cnViEGAHZXskwd8keTViwQrjoOpmStspH0kgnW2tII4iMLcvTfZJDyoFZMghZY
	ga3JfiYP3eplq0rzgRWF9j1N99TE4Sr5cwRZR+SGqmc8BlOcOvC6dfl5BGbYksuXR/NoH3Dtvew
	fR7fS2wqsHh+K3ny7/l3+pm0C7sQvFFFAFDW8qDE4rwB2yMMiWAQ3ogw8iTxe1jjF/qXaZ2hk/4
	1mnCIzc1MLRpiRMSbe1zsYfniaf9wqscGFPZsHE26swBKUz90bU8ReG0IiknPdCpT/MH7XJftW1
	y5k9IVXX/O08vOJLcSYBxSVTederVL6r+kD/SWj2UEunpAKib3Ju/dXYLJ/sZHQLQNxxX1aImWN
	niffECde1Z+IBRY1vDdZ8e27CtdXqDz0quAiQyZoiDb1N7Or6i6tnuYvcPk2BAR/HPC99DvVhUl
	0XsRB5ss5qwQVqwFI=
X-Received: by 2002:a17:902:ef01:b0:2ca:c84b:c4a4 with SMTP id d9443c01a7336-2cf3497f663mr115533085ad.28.1784472354006;
        Sun, 19 Jul 2026 07:45:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476ba24sm40630125ad.75.2026.07.19.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:45:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:45:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: tze.yee.ng@altera.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Message-ID: <d7f375cc-40dd-4b0a-8117-28ceca9b0059@roeck-us.net>
References: <cover.1784096224.git.tze.yee.ng@altera.com>
 <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66493aed36c36718ab90d4792d04948d3926d377.1784096224.git.tze.yee.ng@altera.com>

On Tue, Jul 14, 2026 at 11:28:01PM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add asynchronous Stratix 10 service layer support for hardware monitor
> temperature and voltage read commands in stratix10_svc_async_send() and
> stratix10_svc_async_prepare_response().
> 
> Register a socfpga-hwmon platform device from the service layer driver
> when hardware monitor support is enabled, similar to the RSU device.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

This version of the series does not apply to the mainline kernel. Please rebase
and resubmit.

Thanks,
Guenter
