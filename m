Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4341F80BB
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731518001; cv=none; b=nEguuft67HYs9Tl8RBwcVwQYmMior3QNy/bBkVux5ZJdftBYYmLdT405c0OPxxp/BD13xtWblfD9H1FXP50hCyVlN3TWYu7+DCpUxIhwwKhSq6DuicQ/VtfruSyYxSuayoqnzI8t4Iff9vNsLjhdGdBBcmv7mSWjqTZ0czkJzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731518001; c=relaxed/simple;
	bh=P5LV97zKsjwbvc8pKFqu/eBd7S75Qg86hvnx5B/heBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjwunrZrMAkGKZKt21i+Htz5n4ixd8lAIq+FIVWry1tI+EcI1UZDVwUjlw4oYVRXE96jxDmyQmEUdke6PvZjFqQkeFS0Ty8ZDjiUFSwN4dDOeGeHsa17Acsi4drXfntoYevzt2ZHpeQ42afCdPYMmWXCgc0UdikmiuOPZoVQKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCI6g6B8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCI6g6B8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso5261645b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 09:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731517996; x=1732122796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifvUbRomJOM9ONw4x5k/S8xJ/QeZBsF+nhD23qyoV9U=;
        b=bCI6g6B8fhBjG+1zPQgjTq0GcuA5XQMmy6Cm7G0HInY+hloNZUq9aEZzkD7YABiDvK
         PxLd6ikGadIkoU65ldATGxvyfKYmQ9/0sk2qt73OlCybI/iqNsFFbaIHMvjk0GVk+iOT
         oxsMuu+hlFXM/9W4OhDWdNiLMu7g7GMte/TXxwdzDcYn/HN6ljhFIQWke0v/EivcYmsw
         F5/RDFGg/5caipm+Jv6quRKhMDEELp+smHKid/CamYHFWQas0a+9lp1jq4r9yfsAphC6
         K5vvxfT0DDNBMtZXZfKNJHX3z2L6mt1bt6K5xQwguQ/zPcbgm1a9ITwxSlDCgYozWRxm
         GI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731517996; x=1732122796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifvUbRomJOM9ONw4x5k/S8xJ/QeZBsF+nhD23qyoV9U=;
        b=Q4qQyMJEO8v7TGA+P0dVm51o09VlfbFtsds0SrBtlekrXtfogzqx3Zl8dYiitxvYes
         UXGQbqgSVLsUBfEgyzWpkxzObM9g3NtUDl9Y/o/7wJck0kbTMBx5baEAmoi73wa9texV
         0zO87TQ3AubmcjyECkBEjsYfbrfuMDFc1K2wYH1CR3UWdIMSytmApE23cBfdvqBZRSbo
         wOWOA6p2rKd/HX3oVgKhmMg1NnIfVvOtMQIuxkbyhgkhkgLQPLbV/TY/eJ0qwIIc0Ygr
         ch0voNbwmmFQMQzLyGi6G9uFWhBu3Ob8T4Psgziw6tGcrNkgCwbXvGAU5/rItT7bUG88
         UHLw==
X-Forwarded-Encrypted: i=1; AJvYcCUruHhAy0tBrjG2J9eCLw3DIC1gDJgOac5w+yd1ZytvnB32KywxGhjnngcpJdy6l/V1+iPrKy7pox4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOMrb9geiOZ0hgPNjsHjey+mmFoUF2wvf3i8DcUi3lFYOBqY+
	NiLr0hUYxjsbuMGIE9F/9h8jjEffWqAjVtWLSe1aZHdyNuMDkzytW2Qkm3mLHNM=
X-Google-Smtp-Source: AGHT+IHA5WiA7MiqyH8efQNCAK7Lo6QO+3s/96CcV1jpasTbglmJ9Zdpo8EFQj71/9GwdyTBs800kA==
X-Received: by 2002:aa7:888c:0:b0:71e:4e2a:38bf with SMTP id d2e1a72fcca58-724133632a1mr27813959b3a.18.1731517996303;
        Wed, 13 Nov 2024 09:13:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fd79:a2fb:87a9:f18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a50493sm13427196b3a.172.2024.11.13.09.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:13:15 -0800 (PST)
Date: Wed, 13 Nov 2024 10:13:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: anish kumar <yesanishhere@gmail.com>
Cc: andersson@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [RESEND PATCH V6 2/3] Documentation: remoteproc: add overview
 section
Message-ID: <ZzTeKTieC8YHC1Pv@p14s>
References: <20241106051016.89113-1-yesanishhere@gmail.com>
 <20241106051016.89113-3-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106051016.89113-3-yesanishhere@gmail.com>

On Tue, Nov 05, 2024 at 09:10:15PM -0800, anish kumar wrote:
> Added overview section which details
> how the remote processor framework works and
> how it handles crashes.
> 
> Signed-off-by: anish kumar <yesanishhere@gmail.com>
> ---
>  Documentation/staging/remoteproc.rst | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
> index eeebbeca71de..e0bf68ceade8 100644
> --- a/Documentation/staging/remoteproc.rst
> +++ b/Documentation/staging/remoteproc.rst
> @@ -46,6 +46,49 @@ of several key components:
>  - **Virtio Support**: Facilitates interaction with the virtio and
>    rpmsg bus.
>  
> +Overview
> +========
> +
> +The framework begins by gathering information about the firmware file
> +to be downloaded through the request_firmware function. It supports
> +the ELF format and parses the firmware image to identify the physical
> +addresses that need to be populated from the corresponding ELF sections.
> +Once this information is obtained from the driver, the framework transfers
> +the data to the specified addresses and starts the remote processor,
> +along with subdevices.

Here again, some information is inaccurate and some is incomplete.

> +
> +Dependent devices, referred to as `subdevices` within the framework,
> +are also managed post-registration by their respective drivers.
> +Subdevices can register themselves using `rproc_(add/remove)_subdev`.
> +Non-remoteproc drivers can use subdevices as a way to logically connect
> +to remote and get lifecycle notifications of the remote.

All of the above is pretty much inaccurate.

I do not see a way forward for this revision and as such will stop here.

As I suggested before, I advise you to take time to read the documentation for
other subsystems.  You will find that narrating what the code does, as you
are conveying in this work, is not a common practice.  The code speaks for
itself, there is no need for duplication.

You are obviously able to read and understand code, have you thought about
fixing kernel problems?  Buy a development board, boot a kernel on it, follow
the patches people are sending for that specific SoC and start testing them.
You will find more problems to fix that you can handle, and it's a lot of fun.

Regards,
Mathieu

> +
> +The framework oversees the lifecycle of the remote and
> +provides the `rproc_report_crash` function, which the driver invokes
> +upon receiving a crash notification from the remote. The
> +notification method can differ based on the design of the remote
> +processor and its communication with the application processor. For
> +instance, if the remote is a DSP equipped with a watchdog,
> +unresponsive behavior triggers the watchdog, generating an interrupt
> +that routes to the application processor, allowing it to call
> +`rproc_report_crash` in the driver's interrupt context.
> +
> +During crash handling, the framework performs the following actions:
> +
> +a. Sends a request to stop the remote and any connected or
> +   dependent subdevices.
> +b. Generates a coredump, dumping all `resources` requested by the
> +   remote alongside relevant debugging information. Resources are
> +   explained below.
> +c. Reloads the firmware and restarts the remote processor.
> +
> +If the `RPROC_FEAT_ATTACH_ON_RECOVERY` flag is set, the detach and
> +attach callbacks of the driver are invoked without reloading the
> +firmware. This is useful when the remote requires no
> +assistance for recovery, or when the application processor can restart
> +independently. After recovery, the application processor can reattach
> +to the remote.
> +
>  User API
>  ========
>  
> -- 
> 2.39.3 (Apple Git-146)
> 
