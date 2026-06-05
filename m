Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013543A7828
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683925; cv=none; b=PrmfwFFMExij+drYv94WeQlSyxgt0efZfbroMD7/ht+I6bNIWhq+7y+cZoZFltNCNonA17A/eHdufaZwMiTeNWUP0zfjmNCDNBvk/fTcZdsSjmuodf453TgktuO83JU786G/CU6qAG4NUuWrAa5ukH4RsiQUyuBKkI5jZ+cHGRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683925; c=relaxed/simple;
	bh=ODQinMMdxsaY6RL0hYX0pZOFbL9zrSNm1pmSWChLaA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5JnIPNCu/pWpBUpNtn+JB3sH54Qe0lNYAfaDvAjv3u+x0cYkMbDBhjjx6pCJ7sBYLMm5FbNzn9c0apT/SZ1Z0n2uN6lBoyqX8ZyEN3ETQVzwXM8QVAlqp5Hps48+KaQQ9Xm+rRuKm2IRXvEMk8NR/NzHxFGg1Kbk7orkpqRKjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iiuICafn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iiuICafn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf2911f93cso117275ad.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780683923; x=1781288723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6t9Y3TUDX8gOECAz6pcChptmfsUqRuuX+pFwbulAEyA=;
        b=iiuICafnvH8RuQx0+dpLIBD9tvUC6/HmIb6q3PxVV3k7YDOLj+eAWZ1mShsgSHs6gc
         MLmStcZp6Z12piph3rME9XGOsVwTXUIVpgWMCcn0cJnFP4MDljuwT6XGfFnf6q0cihs+
         oljC4fV43Sid9Fk+C16048vY/jeLcKKMylyKNBQLU8vCdOJVdPN5d5gGa/HyFlIJnaDb
         +t0jMctZtQq+6FpG3vnM8nw5EQ5Ibd08kiVZWfFlozdfjsCskii1zHWArZjTADziJiWl
         OyXE/w7tdV2JrybeYlU7AmzoTQP1woikGJZxGwnHeQR5n38StKIZAnsnyir/YROuAOBo
         YVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683923; x=1781288723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t9Y3TUDX8gOECAz6pcChptmfsUqRuuX+pFwbulAEyA=;
        b=XfPhnMRFoVMXoxY4Z0QGh6Uta4+zHMXOZaxv8EKM20eqsTCfPgyHppXpab7z3mdP6w
         ly9i7vyOvE9UTwHkxkeB9Viwvj26uwiaVSJXK99+9OCMjuSctGus3oB2vmQl+ntGoXHl
         7LKxhB0tpyO5kX3H2TpzAgT9c26t+7mKrisrQMOcFewpKohCM10G6tsgK/K80J/ygGlg
         tafm2C7mI7CF9f6TQCjp8MBmBV/lyfUgeuVKqKMpI6G1yHnMOlXXCDmqRJnjKCKd7DRm
         9rs3EDOnd9q8qtSJPQNHuCfARycMtDhYZ8hXC3uY50Xu2o9vpjgEoXtB3CsGyxyXzjIC
         rAdw==
X-Forwarded-Encrypted: i=1; AFNElJ9qR8vmqWvTpusHY9WerV6leKgfzubIhv/P7VEBT6gR9fjbFkszH1ttE1UICGMjo+xYaoVeFDffj8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgD9Mbk+gV3QQY6RqvK8+OYZe8iQD2Scizx7FgSgCOEpJls5Xz
	1RDBcRTWxhWinlR3AFxPBGQ38L9XoTs1CIZ12EZvmDzBRN6XgVd8afAX7a6/Irk/ADn1ERXXl/+
	2vzGSuv9U
X-Gm-Gg: Acq92OERPp8p2cQGQtZmM0rLtS7gaCqh2mZN7KV3LmQiAV77nhD2Uff2vEg8t/DcXgj
	hgvtTOjhEV0DTspgUZ8ccwgpqF5Lg5khD726JniFtotPcN+/M+i5Fb3n1YNCLq9ogRPn6CMweFa
	sYs5XXFshWXCiNdaJPTMU4lcTAW51r+DC1PfUx4NSCXACDjDcfSYxdCO5Sr3jKjr8ej2LTmuIuC
	jxExnCkUNkcmUZr/oM62RHc67ZzQB/ol9pe3PZtgQbjUuUKyX2cTx9Iygm4TnWa3qLM25+uv0Zu
	uAmWCY7l26emKmEfmKo1ePoCsaxJmzveYXV+6w+3O8zko8cMwCabICvdFRzZ6FX6h85juvPDIwG
	RycxlHnf/Jn6Tu5exXtUKKvZXLCgBz3f4OHnVAV4kGIynEuiGAvwe0HhCsSxaiRwgmkYNO+NR0M
	SqT9U1F868c6PFKjngbpevgemMFLhmkjPtFPT0ZaaH+qsUHVrtVFMFO+knWB7RHhXVxl+EH23PU
	Hr2tA==
X-Received: by 2002:a17:902:e842:b0:2bd:6dad:3df9 with SMTP id d9443c01a7336-2c1eb744312mr2068635ad.23.1780683922744;
        Fri, 05 Jun 2026 11:25:22 -0700 (PDT)
Received: from google.com (171.46.125.34.bc.googleusercontent.com. [34.125.46.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm100327885ad.8.2026.06.05.11.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:25:21 -0700 (PDT)
Date: Fri, 5 Jun 2026 18:25:17 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 1/2] module: add CONFIG_MODULE_RESTRICT_AUTOLOAD
Message-ID: <20260605182517.GA2939956@google.com>
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
 <20260515-autoload_restrict-v1-1-40b7c03ddd04@9elements.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-autoload_restrict-v1-1-40b7c03ddd04@9elements.com>

On Fri, May 15, 2026 at 07:20:19PM +0200, Michal Gorlas wrote:
> Add CONFIG_MODULE_RESTRICT_AUTOLOAD and modrestrict parameter
> documentation.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>  kernel/module/Kconfig                           | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 03a550630644..1013104f0943 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4185,6 +4185,11 @@ Kernel parameters
>  			For details see:
>  			Documentation/admin-guide/hw-vuln/processor_mmio_stale_data.rst
>  
> +	modrestrict=<bool>
> +			Control the restriction of module auto-loading to
> +			CAP_SYS_ADMIN. If no <bool> value is specified, this
> +			is set to the value of CONFIG_MODULE_RESTRICT_AUTOLOAD.

Doesn't this default to true if no bool value is specified? It only uses
the config if modrestrict is not passed to the kernel at all.

>  	<module>.async_probe[=<bool>] [KNL]
>  			If no <bool> value is specified or if the value
>  			specified is not a valid <bool>, enable asynchronous
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 43b1bb01fd27..c9e01bb848c0 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -337,6 +337,21 @@ config MODULE_SIG_HASH
>  
>  endif # MODULE_SIG || IMA_APPRAISE_MODSIG
>  
> +config MODULE_RESTRICT_AUTOLOAD
> +	bool "Restrict module auto-loading to privileged users"
> +	default n

You don't need to specify default n here.

Also, I think you can just squash the two patches. There's no benefit
in splitting the config/documentation into a separate patch.

Sami
