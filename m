Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D38332614
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974399; cv=none; b=O4Gemr5FeVGSku2i0yUCYnVtYZM7BxZr3y7Yvcq0pXRt1RTxi0ca0NIy6jO60zsalfx3VOmNeQ29ikQXcOXN2MNfiuBQrjSgxKZz63S6sp61R5m+WNylywXGsvCkTX9IvCjZSzNq42+Exnhox3BZtqwmEdlrpJdlUujG7nJ/HCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974399; c=relaxed/simple;
	bh=Z0gb6PYt93u0VY6izJ56KhmshtzSyI7O+7Ihrl0lCmU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5nj5TgIhz6Kd/CllpNHhm++mFDPcyiTVdP0oG/xMAW+GfFqLCP2Wf05n6LsutxJ+lntX6E1K3P3uSC+5tJsPL8mVAMQqUBXRhs3vLGA60viJsc+fNL64SuHZgXNeVSEidn5Qg/r32K+OkAeU4O2cACufhtr6XSAVuWu7pZQPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STgRybsR; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STgRybsR"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8565d77c277so83999987b3.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 10:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974397; x=1789579197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PRZsX/KYek6emU5v5tZYtdcbcg2qPIIdPrtfdDH6As=;
        b=STgRybsRtARGtsuhO+1QN9o3hXIkfNhWO6PIp70FROV2pAL7A+a6j+nBax0a2aZbIv
         tEEvWFlghRPEaTtTcIJQy3yoUjLobKH8iwmyOLQmBhfF17/ydjgg+rRSC0DynLnhKisS
         tvKY/jBEAX2tzHe3/N1P6wELMSCFbr8K8vwJrnSYLyhtck8yEvVXzgmzRp/lrxqDbMTb
         kv5ZRwQ+YYcmqnDK8gGHplIxn16eoQYMaKfNtCbO+lhiOTPLcsio/ZDnfziv736zEvkQ
         29Tiuorelh4DuO4jJGvZveTryZ2x4C11Vl5yjnoi/6v64nzOKo08VTup5tZZaoY9QKH2
         /umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974397; x=1789579197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PRZsX/KYek6emU5v5tZYtdcbcg2qPIIdPrtfdDH6As=;
        b=rzGL/INYl80JVnNaLkHiqK+4gUWhON5bZoJGYu9mQFFcD1bRdlSz3N8VPT4Cis9J4p
         5tGa6tDnWLfBTeNPCR9hDV4h90Qvrw3ZP+iX5rYD4vRehaCJj6n0n2bNDrBWIzvrkIvn
         YyLELwUOi3IhJ8QN44BYS1AKJCnAENX2upYKfzL7BDlCxN2++LXYwC3uKE3gFBxmTGy5
         j3v8ZZrOVMJa5z4V6SoUXgzz5tu2ft819SXwrsTI7oPpbTeYvJzP65l9bXNP3ceUObOU
         HGIH7uQ271W/ZQwM/V/FsHObhBim2cRylL2847jq51NC9MJ9WZfK3pmdXji3YDy745nW
         wK+w==
X-Forwarded-Encrypted: i=1; AKwUvBzyGielqe/18OSMuxrhHa2m+/iHHuj3ELqA7jO1NkqidzDEIIc5NNqqGU+9lwUQ7xJ3t6/yyxsCKHY=@vger.kernel.org
X-Gm-Message-State: AFuF++kcA7RD2yd4b6HyzJzFrot1MUhRGe/Cn0lFgWiw70c/xAcUX78V
	76ofwD8iI00AHQM+SvLCRwuR+Po94nctDeXE5G/DGe4MZMPg8uV09qoO
X-Gm-Gg: AYBFou2vHqNsj4e7OxO1rq81AIJ/UICLTPBEhWHz/SHR37eB3YUj96bsaHg6C+gQKjF
	Ro/loFQhqi0aMMf6fDKCmUK5KfSQl+FOw0r86Fq0hd12waFGBbmXfdAog4aSF+4FV8nQ+oKnUci
	RTQVHOwd71J8Q6agSUJ8Zm04+JQf2v5nSSqqzAEuoI65DKC7EPMNqgiMd4QjeLp5s/HmnBSQFop
	wU2Cx2t7CPuEb0KXpCwN1Fd3XKl7EwsM1+zdQ/LQdl7+wkRcGcLq1b9rjvq6UsSBt4aUzm4ugYG
	w9eTqaeyEhE1UryRxHaUyGxusTGsKOeCsEbz0bXuW/YsZLRLC4BjDDOKZyOR7NB6hQgjoHH7c/F
	XeDm4HVTUTE+EPW/a9foBX9ioG9E30ECU+d2H5Nx61ukyNs2hIW5trjU0QGYGQtWeVF1y0DvWA3
	0AcpR1qH3xS4ieQzCGiphVZAoJ98Gy9hGU3G0wnvWiFhQk4B7cs/Ekw+4CZoCKYlkwAQGTcsQoM
	qt8F2MB0qmvHLcpqQuc0YoIynztDv/2VORwZhQ=
X-Received: by 2002:a05:690c:620f:b0:841:773e:8d86 with SMTP id 00721157ae682-871232363dfmr149350847b3.15.1788974396825;
        Wed, 09 Sep 2026 10:19:56 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b62bc77sm114405657b3.39.2026.09.09.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:19:56 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 9 Sep 2026 13:19:55 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org, jgross@suse.com,
	virtualization@lists.linux.dev, sunlightlinux@gmail.com
Subject: Re: [PATCH v13 07/13] sched/fair: Load balance only among preferred
 CPUs
Message-ID: <aqGVMR2m_NF76tv3@yury>
References: <20260909135617.871006-1-sshegde@linux.ibm.com>
 <20260909135617.871006-8-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909135617.871006-8-sshegde@linux.ibm.com>

On Wed, Sep 09, 2026 at 07:26:11PM +0530, Shrikanth Hegde wrote:
> When a CPU is marked as non-preferred, any load pulled towards it is
> pointless since the task will be pushed out again in the next tick.
> So, consider only preferred CPUs for load balancing.
> 
> This ensures load balancing does not fight against the push task mechanism
> which happens at the tick. Also, this stops active balancing from happening
> on a non-preferred CPU pulling the load.
> 
> This also means there is no load balancing if a task is pinned only to
> non-preferred CPUs. They will continue to run where they were previously
> running before the CPUs were marked as non-preferred.
> 
> Bail out early for NEWIDLE balancing, as load balancing is done only on
> preferred CPUs. Note that idle balancing is allowed to go through, since
> that naturally updates nohz.next_balance when all the idle CPUs are
> non-preferred.
> 
> Also, optimization in find_new_ilb() is skipped. The steal governor driver,
> which is introduced in later patches, updates the preferred CPUs state in
> descending order. find_new_ilb() checks for idle CPUs in ascending order.
> Hence, in most common scenarios, the idle CPU found by find_new_ilb() will
> already be a preferred CPU. When all idle CPUs are non-preferred, the first
> idle CPU has to be chosen anyway. All of this is naturally handled in
> find_new_ilb() currently. Adding additional complexity to it for rare
> edge cases is not necessary.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
>  kernel/sched/fair.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b..4ef1167b8c73 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13473,7 +13473,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  	};
>  	bool need_unlock = false;
>  
> -	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
> +	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
>  
>  	schedstat_inc(sd->lb_count[idle]);
>  
> @@ -14588,10 +14588,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>  	 */
>  	this_rq->idle_stamp = rq_clock(this_rq);
>  
> -	/*
> -	 * Do not pull tasks towards !active CPUs...
> -	 */
> -	if (!cpu_active(this_cpu))
> +	/* Do not pull tasks towards !preferred CPUs */
> +	if (!cpu_preferred(this_cpu))
>  		return 0;
>  
>  	/*
> -- 
> 2.52.0
