Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0521CC6A
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330800; cv=none; b=R3WVJToPz+aPMgnp+wywqq+WSAjA0+yrFIMNJdZHb9LmPxO5tcjNqWWekMS9bo/RspunY74r4tNqLNsep52Ny1RMNo4DL+D4dN3xB63O9D62aWZfHBnUETppYt0K6Igmh9wuLioFQSYI+37fwRQF+SRveN9CKjchJsAs4uIHHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330800; c=relaxed/simple;
	bh=iGlHjbSVKGGym3U23i7SdjhPDqTMOthBoaOervoF05M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQp6xuTTukjSs1ObxW0p4KplMmDRj5xZsW7ovwqRxeOmWjNG0G9wzKmD0U2NqVb41BZiuZy2GHYRZ4FliY3qNrX55eJdtAALNyNnQuA8W0atZQ2S2PUaDLoMiZkQ2X5HEyIaFLHWYOTrp0nLzydpIiQ49W4FpS0ws2i/LYuj9nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QNtqji7Z; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QNtqji7Z"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso845052066b.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 00:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762330797; x=1762935597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQrBXNgrEH7DGm+hsPHKmGk/jGaaI76D+GIvDvjNENU=;
        b=QNtqji7ZsJkeLhXsxMUghte8cMXJTYocdx8sM7jeqmU3PIDKrSxGpQevN7OC2PyRfP
         FWrOm4dOC1cbzw9JNDVICzngTKDKIgjbyWBzBEnUscNdxdGWW42Czx6HxS+EDD564HKK
         eZMz24NFtgeqUTDYYGlt2HcLkNxT/CetGp97pjCejsKsB5VA8G6FW8SU+M1Uj1nR/faG
         HTWAsXun2zEh6Dc7cawkVCeAQ7o2GKnEMDHLwf7P6pn581v2yecGwukPU+asFxeiiKvW
         YJ0I7ght3Dz3Pn7nEOSyxDpzZVOADjmVA7gJwB0O+bIwJ9fZeiA+wFXVJqgflhv4cfH9
         hqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762330797; x=1762935597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQrBXNgrEH7DGm+hsPHKmGk/jGaaI76D+GIvDvjNENU=;
        b=dwH/HuNTMWzuxMxZ+V/6AiLyAYBD0DmwYAVMhZVnSHu3X9PiRpBfYFaDwcYX8tL0k4
         Yo5EeXHF1VTE24BcfrabNmd3DtpI1dEmAwq4NnoL8yoxip/E6g8BXHftgsdT5IC1Ozuk
         8aOGNBP1YWyjWwQzTtNsTSk+lUb98zg/adNhAWjT1BKpst6moMjXpkoG1PKq0KQ6R1OI
         R4bbqa0FpMo0t596VJi6ljIoJfLc/wjbwUZ679uhnNQgnMDsq/fz1HYz4sfHVXzpbrop
         9RxRc897wj6lEfyIOaZsH0AjyePmxqRDfVS2vW349tGEIQ78irkjtq0K7LCp//+X7ejE
         wr4w==
X-Forwarded-Encrypted: i=1; AJvYcCUVkPxlaQUBF+7bOH4ZPHA0nv7xfqFKZ+YtruGG2BC0fjTvNmUi0T4E3u0N0lkwZHFzmqew6HXxJ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgBC2DY2Z7IdcsHYLeO7XcsAg27aBAOBsbpI+n4gi9BlbjLsk
	qpzWYeZmwc7LU76xSytdcl7F5L38lv/yEwMiswVrUiR4f9fCune/gONG9RrXd0u5hgQ=
X-Gm-Gg: ASbGnctI/S+cR6AP2TY3P2phmlLXMTNoLs5fDV5yWx5GK7u/Qds/hyigb0PrFdSlQAG
	tjf9kwKTjiNadcE8ITioua/XM6R5FDRVZW/QhSBEEJvtK0X8++05fl7RMFMiW8xoelbqO+D+G88
	2b8h1mJJNgjplXJb4FqpKPccaGvSk6MicX75BnXjWiN8ny/fk3l/jZz7s+Ct33BnbmSl+JMoUr0
	Yo0WceTlF1saZ+5jwDDIU7Ewbqf74Bfe1SoIC1oOorBHmieGYb3+nLUDQQLSyI4dTNrx+cPPcXF
	RPM7URkKk+P+BgbY9rYHSDhv8twrStT7I6cu9ICl7hIUNofBXXhMZcYl8A0VN27G70v7bUrbprM
	q5rH9f89HVr9L6v1b6v32qHfv6rvYkFIfmpDoTVlzI9HcZ0muE1kL/MFu+KPZndhbgCTUXrf00E
	3QGLdEa53AgdW9QQ==
X-Google-Smtp-Source: AGHT+IEXHVZLvJt37T+Or0zq36XdlBJ5vgi75Kr1QEZUdY14YccQtqD44O4+t6LmVKBw9ksebwzytg==
X-Received: by 2002:a17:907:6ea6:b0:b6d:8e29:8f67 with SMTP id a640c23a62f3a-b72653eac19mr201927966b.26.1762330797054;
        Wed, 05 Nov 2025 00:19:57 -0800 (PST)
Received: from localhost (109-81-31-109.rct.o2.cz. [109.81.31.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b725d86b9b1sm269126066b.25.2025.11.05.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:19:56 -0800 (PST)
Date: Wed, 5 Nov 2025 09:19:55 +0100
From: Michal Hocko <mhocko@suse.com>
To: Leon Huang Fu <leon.huangfu@shopee.com>
Cc: linux-mm@kvack.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	akpm@linux-foundation.org, joel.granados@kernel.org, jack@suse.cz,
	laoar.shao@gmail.com, mclapinski@google.com, kyle.meyer@hpe.com,
	corbet@lwn.net, lance.yang@linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH mm-new v2] mm/memcontrol: Flush stats when write stat file
Message-ID: <aQsIq_zQXMfNNo6G@tiehlicka>
References: <20251105074917.94531-1-leon.huangfu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105074917.94531-1-leon.huangfu@shopee.com>

On Wed 05-11-25 15:49:16, Leon Huang Fu wrote:
> diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
> index 6eed14bff742..8cab6b52424b 100644
> --- a/mm/memcontrol-v1.c
> +++ b/mm/memcontrol-v1.c
> @@ -2040,6 +2040,7 @@ struct cftype mem_cgroup_legacy_files[] = {
>  	{
>  		.name = "stat",
>  		.seq_show = memory_stat_show,
> +		.write_u64 = memory_stat_write,
>  	},
>  	{
>  		.name = "force_empty",
> @@ -2078,6 +2079,7 @@ struct cftype mem_cgroup_legacy_files[] = {
>  	{
>  		.name = "numa_stat",
>  		.seq_show = memcg_numa_stat_show,
> +		.write_u64 = memory_stat_write,
>  	},

Any reason you are not using .write like others? Also is there any
reason why a specific value is required. /proc/sys/vm/stat_refresh which does
something similar ignores the value. Also memcg.peak write handler which
resets the peak value ignores it. It is true that a specific value
allows for future extensions but I guess it would be better to be
consistent with others here.

One last thing to consider is whether this should follow
/proc/sys/vm/stat_refresh path and have a single file to flush them all
or have a per file flushing. I do not have a strong preference but
considering both are doing the same thing it makes sense to go
stat_refresh path.

In any case, thanks for considering the explicit flushing path which is
IMHO much better than flushing tunning which would become really hard
for admins to wrap their heads around. Especially when dealing with
large fleets of machines to maintain.
-- 
Michal Hocko
SUSE Labs
