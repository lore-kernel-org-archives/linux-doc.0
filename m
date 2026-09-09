Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742D3E8C74
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985703; cv=none; b=Vle19EbYGFmFIIhjZOliHmadSJGsJXD8BK6eIFClB+3irxDrkk0dF2xp8+bRutp1iJYrQGKRg351fXyCJtteZd4WMyibhqvWcs7hmNF5ZoncrUqw6YTrYmJ6OpseZgpgb/nlDGq2Eogq8Juz+28kivkIDBGw4fXuqZPwobUj6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985703; c=relaxed/simple;
	bh=W5JXtiEI1GAvGT/64QMWOtm3bVHKWsvJdYfasU41N9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB4r0/ecHzzO7xUku9yyNff8HC2DZlf+OUXxiFTJYjxlbbd4iMi9oun5aHKyMBgD6ln20LJK/AoV9Nb+EwrMKJ9zNigXWE6sNmBOer/dGWcBEduyiOkZWPZHUcogKmBExr0fsql56+6CiVKge+dTZvdYFP1wsIT95m+8LUuTVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gt8ZOElh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gt8ZOElh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so7366279a91.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985696; x=1789590496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=Gt8ZOElhwjuuUxUcP99/D9HeSgGkHyVSX5spNNTrK6ezlxDH3kYrD3FuwgXU4sU6Nd
         etRG3UdQTh7Jiy1SMrLYPF0+BYVvMx73BxsZ1zguDnCKAshmUSv4WMr10mY4Gh2+cBQA
         qS3CImtiCwKPdb7Z3U3h81TNLMEiMIeoKs/xcDvANqkjBSDrDVy87PU/5NLKB7OWj09f
         yvLswRdMwbjScOrcMJgMA9wAn0szAVqU8kZdpUCXj9jWL18SgRbDJUoYHIF0Fsll4Nuo
         Teldl7MITb5D1h2KcOIRt3U5PCzcKj/ltgrbwVprPisdmDn1tJHj2eIaCQwyAQDyhlCG
         dtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985696; x=1789590496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEzU3fsaUeqKNU36+P/KzrJW02m3H6Ngnj8OsDYtm0w=;
        b=kp8rbSk3CW8gpozs5o6rmW2fGIGV2Mnz7V7AeeqF1uNXVjUNSXgU5+9yKns4RWYYIw
         fNf7IXSZUV5N+S9R028isrx0Iyxc7nY463QJyYtTh+f7+yLciNg02XNxCHs/NkoAqn2P
         YwXvS43+PY4EGLEnIcOP4hGqy6AQDilltL3UJZt+WIdgZZL8W4jKF2QONfZjlsNXtwse
         Fxvb0GnD6voIdX6PxCbndFSJu0nRBFr6OlRzvycTRgJ3numd5v7Tfpi+A6LEab1GhY9g
         vg/bQmp62hSMCQuR1yyvjERknWSc/EkTTtdJmaH/mdbj4hgZQwwJXYCHmdyaZsPryQyn
         YqSQ==
X-Forwarded-Encrypted: i=1; AKwUvByIks/r8GQLU9VJGg0sZRjXCMPxXoxdG8BI7uJxIJiQXBuNm+Gjrs8/xOOmIZUTUoqSe85khEsQ0SE=@vger.kernel.org
X-Gm-Message-State: AFuF++kO87fGteUeg6XsXZRVKh9hMKaPs/KCgJ/Mjm1y4TA6uAny4rWM
	VbU1PbmZ4MJtEv5NtnjNYIl2ZsCB5R4lxztprBE4oRpjOc/joUA54sMY
X-Gm-Gg: AYBFou0O6fqaHhOgTh43V0Gnoo6VAm7/yJjbH2sIPfVYgmR6Df6MWjPmQChdgasldXb
	EmSGSkeF618yseWFpBbGUeSRhBL0VkCrw6074JJp3DWH7rpdDH2Pr5lOXBgihVVz4oJquwcmuZC
	wtnr70ixrbLpmlLajmXJiXkKOaeWNvNQaBqW1MGLqwieagG/9Kt2Nf9FsX1+GIyOQqshm9lGtuV
	Ibzgj4DvTjVmDu62sRPwdY0/auxC6Kdn+YpXp6+OpFYYxaZoTqL92jqpp7aq7iQ3ndbqZl15wN3
	ed0fExbRxFQcz/48OfR+n0MY7YeG7zPGMxXGqqXG6DcEnlcLRvAHiR7Sao3aNUj2MoviFGKe7UR
	yE9Db3Axdf6YrFxPIFSEd0jmAPEnJMiB9jQ7GaUFdg8QPvyWWKiD5AJcMMvvJt5a5LI0enmYcRi
	D2waBedIGx4yg/LdlZMwxlzz+kQdZoqBRZyaUXblRVjmZTjzjnqvQ8JbekBXZUEBZxslwu6wV1a
	N9+455sO22n
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr58732068a91.11.1788985696439;
        Wed, 09 Sep 2026 13:28:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77388944sm1156264a91.5.2026.09.09.13.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:28:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:28:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Add support for NCT6126D
Message-ID: <be37aafc-6b6b-478e-b01e-9e6f0a932608@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:55PM +0200, Paul Louvel wrote:
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
> Signed-Off: Paul Louvel <paul.louvel@bootlin.com>

Signed-off-by:

I can not change that, so you'll have to resend.

Thanks,
Guenter
