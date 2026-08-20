Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1517DFFA
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217392; cv=none; b=sI5JMD2G9YrJxenJSoFUr7SZcLy54YslxI7X2XWI+qCbKnaaebupQ2i00dwN4LeA2dM/7hWzv9phkH0H7rZfR9my5d4wibD4rO5Ezj3ULvLYqBRzgfdlpAjeB8tVFKKK7q9Ir7j0FeGvX3QIptBxJoj2bwXPE/58I2SH/QdCaIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217392; c=relaxed/simple;
	bh=Pb9TQ08Axfuci0p1LKatu4mM9oDr1kxMdHkhN0po+fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyBxSJoLZpUZJ3Bt+eVimdyWq1IAnFTdRwYo+Uz5Wy55rkIzExMnm6pBZt7Fmgb44a/JQ+zhBkhbk4pCOBfJZq7hqyUk4cqmp69Z6LsdIEnITzL2OksF+yc7ac7EW+zFX82aR7xnT2CEunJ9T3liVIffQZyph3WGKdxPB3wqwno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gfVMkMhi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gfVMkMhi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso13699835e9.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787217387; x=1787822187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lgaUzptsUdFUIGVJWlRpRIUWGg/tsLTX8TTIYyqa4P8=;
        b=gfVMkMhif7Gt37LbJim3rG5nRTW9Mu8+CDj51hfcXig4jztgLpQ2oYKNYmY87N1zuJ
         tDEfez+W76wCMY+a+atBE823eEdcd0sw2kqmcjVoVAXPzzCyapSREtUvPOiF3c+T0ZWG
         IUK2DHVuuOtwP6HgXnCpUxZVwNXE6Xvsa8oGxQ4CDVvzZk0eT+1maIyX/kmDDck27ayk
         YsZODRtBCndIeZ02d4WmBolyqruLX2k4V7qxcQq6y9+tdCpFqdz//IVRw7qYYftkowaw
         LtzQuYFEA+n3INLelYPJJ5Lsu45+2lE7XN3UUEJvifpwHfO/ZiDVakRYInOhjpDVN+Go
         69mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217387; x=1787822187;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgaUzptsUdFUIGVJWlRpRIUWGg/tsLTX8TTIYyqa4P8=;
        b=tU7ApTCrHRfOYP9X5Sol0NS0PwGCU4sehchd3egjArK0RMS6hE75/xtkSXoFADQYvG
         gS7hNUdc1oNZsIf0alNYa8c1KpENGLJKoYfbOTx4E2GXNuv1GA+0Qkf63OlpE9v/r6Yb
         jRYkpHjqHBjg6SzAaGuufDZ2Z6AUxGpPe17efEzCai84TMK4vcarcevSPHV7YLxGPhoB
         McbjWBXv4cyrMp0d6AKg7GJjlNPqHydElpOF4GLSYeRtsH1O7WI3JoGHbJjYzHxGEGYl
         DS9gkzo66mgQ9XXzHloTvihCIO6KxyBveI8nE1MP1LbxheMl9HTFscyu/MuEtpOMQYxe
         S73w==
X-Gm-Message-State: AOJu0YyiMdJEZ7bhnIlACyiwv/g246/ZFJiELdXXzEWzCdD+YbxdihCG
	tRhBUrq8XD6gphwhLLF44z2+O+6mC38ZgfVIYVoRUlpzA2sYBeej1XGJ+LExzTPNj8kt7kNQyuj
	CNAllM0U=
X-Gm-Gg: AR+sD12lUz2Us64O7NvhQT+tmii2pzorFMvPLBFosTctrEdm7/lO4aEToAEHKJFldYy
	stcVnQxXFiOqoaHRSPGjYorNB1TSqQoF8Qz7dU/W4MQhFVaA0trcstJ9xfKVXr0JVTQHjWcwfaQ
	lem1KAPtv/YwxPTCcDOMWiqafnbCiyJmMj103J/jdtelafu9alhcgCkL1LS3AdIiItBtRTtSAp2
	zvu5ohEO5+zn8rPqWrSpLC9CAjyy4y2XXuXi58d7V5zOGpszKX2dnkfWB36ZKbJRecdRM1BvIRP
	VvVCsE2fNV2ATO3iDr55DSbOusn80OTrpWf6A3QX7xomvq53u8jkuHDQt25C7zjzXQNbWGAIVlM
	nBsh3VF2KOzHziJiRTtvPafQ2M77zOU4Qx8VnelwEPU81KClUNaKmEq61hgia6jvVuoOvnguFCe
	B7VPhNbIcGSAdymgPTIbJ7/F68RBzh0134YwMWLGRvU+L4ZQH0M5EKKPriwcij7A==
X-Received: by 2002:a05:600c:4e01:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-499aa1d0747mr205316275e9.11.1787217387528;
        Thu, 20 Aug 2026 02:16:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17fc80sm141914565e9.14.2026.08.20.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:16:27 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:16:25 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-doc@vger.kernel.org, feng.tang@linux.alibaba.com,
	include@grrlz.net, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, andriy.shevchenko@linux.intel.com,
	kees@kernel.org, tony.luck@intel.com, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, kernel@gpiccoli.net
Subject: Re: [PATCH V2] docs: panic: Disclaimer about console verbosity when
 using panic_print with pstore
Message-ID: <aobF6f7u_AF7F67H@pathway.suse.cz>
References: <20260819183419.2203903-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819183419.2203903-1-gpiccoli@igalia.com>

On Wed 2026-08-19 15:31:30, Guilherme G. Piccoli wrote:
> Users of panic_print / panic_sys_info are usually aware of the potentially
> huge amount of information displayed with such options - their goal by
> using them is indeed to dump more information during panic!
> 
> What might come unnoticed at first is the impact that the console_verbose()
> call on panic path has, specially in cases that users rely on pstore as
> a means to collect the panic logs. Recent experience shows that dumping
> all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute
> delay on panic time due to writing such information to console. But in
> that case, pstore was used, so there was no need for console printing,
> and suppressing that reduced the full time to less than 0.5 second.
> 
> The option "printk.console_no_auto_verbose" aims exactly at this use
> case: avoid automatically increasing the loglevel during panic path.
> So, let's officially document this to avoid users wasting their time
> either on long panic printing or debugging the panic delays.
> 
> While at it, improve the readability of the panic_print text, by
> adding some line breaks.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Bradley Morgan <include@grrlz.net>
> Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am not sure if the doc team would want to take it.

I am going to wait a week or so. Then I would take it via
the printk tree if anyone else did not take it in the meantime.

Best Regards,
Petr
