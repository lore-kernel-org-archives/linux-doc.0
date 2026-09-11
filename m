Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7928640B
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088463; cv=none; b=LnZMLNqIxyzOT7Z/b9+oLBhar1EREQl6R5uL/VDcJ0IIdwDecrx1GD6m11lcT16mQXvElA2gEZL7W7y9vyU0mW0SO/qIaahAiCIVZmt0Cdw2G8tiuHDuQRWAlXNTi1+bJp2Lq4RUixvdTxBEmJQyvPnDUMScZIrC+Yx3Gr1FR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088463; c=relaxed/simple;
	bh=Hve8OTKMJK2Sw15IWoumCJ3fcui/3UMynRb/vn3eBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVg1jqcgPMTPDgc1Q2WTpcBI4OL3HWZkskCncpKOXvkRoCVaEAtix4NX6cR78BaMpAK6hBTO7DSg8V0JqHfEPw3JozFRMzymzHWXjeiVZA9Sj8l7bGr0Gl5izPwSOLlt0iJbBm8Ic2J4YkjCbaFpkFB6nHX3/eOpUhaifycF224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFKlUubq; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFKlUubq"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so259252b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088461; x=1789693261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=KFKlUubqgLuu8Z0rBHUwcR55NmuXcSQcT0xPhqIZIVWTtTi/yTycGiNEs/cboRY7xx
         AOufONlvfHZvHHhCRgQjOn9MgAvZPgN3xHSIXPnNAf6GiA6aLT5g0fkvvI6pvvYaJfKE
         9nEY7IMU0nhC6gt6waoI9A5YvdT/5ad95Kivq7o3Yrb9P66qTs4+mITqERiwq8P8lj0c
         Ui6K/31WUwcK08Ml+b+ORbYQPA0M4PFIhyaMpHMV0c+g+cfMSn6jUy/RrRlW0NPfHv5d
         UhkBdKf+EbpioBgEzU/HCSe55AwR1nZJc0fPFVVdBVg5E2kaVlM38JncVgiAvmSOdcg+
         1ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088461; x=1789693261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FX4dycJodbNcgNlbRtvzoO7X64Th34ZYUbHEO8PTdJ8=;
        b=MNKGilsD4j1URgYJDRpc/8pyorWbdY0PbK62la0II38y5Hq0buR/Kc74VF05zRtYpp
         gAI+LCHBrR1/c535jNzifkdB6qf7vbbB2RnjTCI9lvowCi0e6fMIUTZbgbglKU2MUj9A
         V3HjeM3Vytf4H1lvAOS0zzwqiPii4Rs8Yi9tdLSzFoZtWSNgBaJTth0aB78lfNmob9mN
         hhO5sw/a+DQ/gnvcoN09X1ePZ+ZdXT86a6TGRgh3f67iSQpLWpAc/C4eM2yFW3zfqQgp
         ATqBV01NX4s/+5xnyQ47A+07dGAcUNKpAJ8pamGgSooAJWwgBDl93n1Pi0xRHBAh04V7
         pokA==
X-Forwarded-Encrypted: i=1; AKwUvBz6dxxCFnfVHaNV/aoN0gJBHCClSNiozGcdl37bkGMqhS/Smi88J8VmxmfopvXaoDGaEgFi8LHXcgs=@vger.kernel.org
X-Gm-Message-State: AFuF++lg/57IqlGb3pmLvtp7IfRrQlhIbmcZX9YD9qCu9ke3OcVj0gUI
	d+i8Y8LjNAsvcK+WFFzAXC5KiTqawRuzQlQzjccHSJtSNJzUOP9MYqJwmG8c8eqf
X-Gm-Gg: AYBFou15owGLpq+Re05Om5sTn436eVR86Ml7mhZu5dgXZHpWs2IBuyAHg4pQbjdkrqa
	uz4l1KWM0t3LSciKt5BWVLEyrG9A0i+DltdE1LMos+bxyQPGS90YDVEnwM7ETz5R15B5bOa2i3m
	Zi7DXwyATBLg6oEY+rNjOWAYtRYROcS6mvX4NhNmHIkbhkAwY3AhUWZC3PVD9iCkfCvVh1ayjly
	8VcJv8w+IkrzH8yq5GjBJZvCKKtiSnWgZ+l6P8wCGXSPUiK+KcAw3kfM3wNCP2iMYcESVJl5XEj
	rjALRh7tNkomFOwxZZnztVrB0DJDOpvQ5/QYp4QfRvPFyk85KobI4sKS5IPbUdIaoyHl61BkgF/
	liByKrPI/yUmFY+SU3rG0vNgom9yWfFZ+LAxcR5K1pTj7NeO2p6uoeRwPyXMTeyrPo63q7uCpqx
	6KfxpqPfXsMVfzCn2Kp7TAt79WyQXtNdgdi8hJ7rZyxxSSk7MVLR9WWdMzotaSDdmodHA4dLqmf
	zSs01OuePxb
X-Received: by 2002:a05:6820:1c88:b0:6be:7782:5a5e with SMTP id 006d021491bc7-6c0bc9b78aemr1075003eaf.53.1789088459704;
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1928004c88.11.2026.09.10.18.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:00:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:00:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <c12d334a-4c95-4a43-b7b0-390e15dd95aa@roeck-us.net>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-2-ee629ab35e49@bootlin.com>

On Thu, Sep 10, 2026 at 09:02:39AM +0200, Paul Louvel wrote:
> Add support for the hardware monitoring functionality of the NCT6126D
> Super-I/O chip.
> 
> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
> fan, PWM, temperature, TSI, alarm.
> 
> The differences are:
> 
> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>   Instead, compare the full value to distinguish from NCT6116D.
> 
> - One additional VIN: VHIF scaled at 16 mV/LSB.
> 
> - The fan count limit registers are documented for all five fans.
>   Also expose fan4_min.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
