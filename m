Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC474E50D5
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982603; cv=none; b=a2mVmhUZU/MFX7ZFRzvApAw7Isk9aT/wGpLk5p/O5ekXI7HcU6p5xJUzfFRtHTlbColeBqCXnFqkTxdNXlHfPDzlh9lCCJ8ByUxgubIX2tpI4Rjfk5g65BRnCZosXtuXkyjGpmQ6OSzHRbOrJxec48q37LZzRHNwWNqIjBzfsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982603; c=relaxed/simple;
	bh=hKbNvtCuW20zPS24qwqeFSP88QzdSVSwhIRmtaAANe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2V0Q6pvMUz/D2jhJLUHRZbUgwSc2Hm28gvFcUblC/kW/WGCRld7irL7gbO+1mxlkgjRB2DUNvtLUrCGIL18oL1pBuWWoxXoj0R/V9SWInLaADo+E/8QUVVWFZguRIpdOF9LaOhUT9+zioA+S6BqSaMrH4Qs5pTDFe9CBoomkc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nrhIH3Yr; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nrhIH3Yr"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b834592afso30031476d6.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791982590; x=1792587390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CfEQYJS10SzxUn0KjnMduakisOWn0z9unME6AqbuJxQ=;
        b=nrhIH3YrpoPYrxA0hknohVQNqtPAowRSYtuHaucDK9DJWW8FmFkPw6CCV/gdbdpx9k
         tli6QsZafTuJkp2SMM96dN9A80WcfhGAeOEPKHDC4RbecU0skkDyMs8aFyIprAhe3U9r
         uacspo0DPGtyFaMV3FANabv/uEmICPAtkIhJ+EQXgdhlwGV7PVq6ErV8TlyfgVRaPEdP
         EO7DyBW1+xI/u1Hy9LWFwh7dcyJ8IeDJEgT1ihDv2PZKqvS+W8dMsH+c5SyugFw4fsQ1
         GFxRYl1i3QwyrtsUfOLioAlcYIQ+wUgA6q6jzNkOQhCG9ilsL35HTTtcI/BJAmFq3TQh
         ANag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982591; x=1792587391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CfEQYJS10SzxUn0KjnMduakisOWn0z9unME6AqbuJxQ=;
        b=SwYmW+Lk2nYUIvz7kmwrsHRroj4boaqpn+pWiljlTv2/VaV8UKHVTZvzTZODlSCkZx
         VqeWHtnQXALYNPn6G3hSADdg7tCb3OprCnna/gNSnuF15rTmj6MdK08bphPvTT20oLQm
         sZ8ykTqOQLCQ/5DEX6weyIIcOoKukaIJiItKiy/6obVZHXDs4f5rOENTH5BSLgY0dYwd
         y/1DkAjGtn0gJ32jYUCuzTu345HNIQBP4Gr/YKoHHTA6r84S4Q+dn7tMcrr4dIKHH1fS
         MXiv6afNJeR81oFkTyAxiRRyYjA/ijWaH7Zrx3HzQ4G9Pz218AjMoXjrOlFtuwtWRVUH
         /q9A==
X-Forwarded-Encrypted: i=1; AKwUvBwb+2yvcMwtJJAJXnVfb+pKZG9PnJRxXEnUy4v9orayYr3rTE9QmGpk79VQ9xnNxIua/3N6jVUPsIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaix12BBB6mMj+Zk3uy1dUPQLALp5sAhVKfPnBg/QxnU+tPLhP
	BeOlWZBH2km70WddDvuaxOmwxbcONwqGTOTVmvErRn/il5RQAbKEL1cN6zw7pIugp6o=
X-Gm-Gg: AYBFou27ztAJ5/jMj2hpy5vtYYkRoEGsZ12KJGD6f+dyhk0vbL9BnMt2a887jtIUwoG
	q3ARhk28EHssXEb41n4do/QM/lY8dbTvYNzzh6VAkDTOb55DV+PQS5S1VlAueMYxhTZbh1prJEU
	OiWmBzonZaUOIaiAdzdlgzpN4o6RWHo0UlDredIJHCQeSdoAPBeNbHyauU3NaRmSqwps9PFksQ4
	y8N/wdvLvpEaV8K9QANkZhGNiCiRwVPeNVglIJVNOlHBV2vfQc0a1JVgelJKkiXTpR74ydLqZan
	skKH35O2PN4dTw3qRzwqzZmW6xu/EMl+ZLeHNbXF99QbTJgbaTV7I3fgkMH1T/lCZwCkR4WTn5n
	mubXrfBu1cIoOZ7ffKeVCBGa2OhCOf2QC6pvw/y7DZdnN5LCzG7/11iWO6iLkj9wz3f93rl/H8x
	odRgAcmmfx8BFsgfX1TWZckAqruVdqVmtn4K8ccsPaFjYkBgiJdEw14t6JmEn6potP8EyJ7kZEN
	s8wPjknSBa63AGV+hwqD17KMYCAwxpI/dGMXMsrqxnXQ/iqkZCnsEw=
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2616142685a.23.1791982590639;
        Wed, 14 Oct 2026 05:56:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50080b7sm483166685a.8.2026.10.14.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:56:30 -0700 (PDT)
Date: Wed, 14 Oct 2026 08:56:28 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/6] sched/numa: fix scan-period ratio denominator checks
Message-ID: <as97rD5uxYva4ayg@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-3-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-3-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:43PM +0800, Li Zhe wrote:
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 1053437933ee..76532b8202dc 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3698,6 +3698,8 @@ static void update_task_scan_period(struct task_struct *p,
>  
>  	unsigned long remote = p->numa_faults_locality[0];
>  	unsigned long local = p->numa_faults_locality[1];
> +	unsigned long locality_faults = local + remote;
> +	unsigned long type_faults = private + shared;
>  
>  	/*
>  	 * If there were no record hinting faults then either the task is
> @@ -3706,7 +3708,7 @@ static void update_task_scan_period(struct task_struct *p,
>  	 * migration then it implies we are migrating too quickly or the local
>  	 * node is overloaded. In either case, scan slower
>  	 */
> -	if (local + shared == 0 || p->numa_faults_locality[2]) {
> +	if (!locality_faults || !type_faults || p->numa_faults_locality[2]) {
>  		p->numa_scan_period = min(p->numa_scan_period_max,
>  			p->numa_scan_period << 1);
> 

This does more than just change the div/o below, it changes the behavior
of the function overall.  It's not clear to me this change is correct.

> @@ -3723,8 +3725,8 @@ static void update_task_scan_period(struct task_struct *p,
>  	 *	 >= NUMA_PERIOD_THRESHOLD scan period increases (scan slower)
>  	 */
>  	period_slot = DIV_ROUND_UP(p->numa_scan_period, NUMA_PERIOD_SLOTS);
> -	lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
> -	ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);
> +	lr_ratio = (local * NUMA_PERIOD_SLOTS) / locality_faults;
> +	ps_ratio = (private * NUMA_PERIOD_SLOTS) / type_faults;
>  

This otherwise looks fine.

~Gregory
