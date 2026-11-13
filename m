Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581323;
	b=FxpYbNWuEhoMC1YZLhkqhyHVLjr7TUPjybq1vzs/5/hr0kzsGPPzM1m4kOA7ZFm3XoZ6
	 FD764RJqd7uhljVdqjnhJtKQErsn7c9Kd3Pwe8nsCzlKznZ5uyf6N6yip3dmdvpTSxLzF
	 wteGHqTCA99L+QBs5IvJb2wY9LbiH90w2imHcW6zG9HHwxcNdHlAXjK4AWxGqRN9fm02X
	 HY+sUUig8DcrvbNB21YRMpXWo27UQM0G6OR6GZwhu5XOlJ6CjbBK8PUIfebAgvOj7XeQV
	 8/p325m69twjJ+8xHYDEfcH2FtlGlDRgXecJ2tQ/yjtFQYnMiBbxc7QA/N5HNMGkyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581323;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=s980VbGVtwRk1EKpuniB7EiZ4GXO+PQXntiwlHmVNms=;
	b=5REeg2d9SuJjY6noTBVHJTzUHd83ON/V8khBS43kgADHIiKEHOPmbWA8P7xTVn4lJNNE
	 d0ypBROCFWQoAdU3snuGiNVjYlAcWzXS680s4AGvIs1PNtMKLzcecJLMMb4Wc50IBPqwk
	 lozov0yS2X8esB01iN1k3MuZKEg8Jb9xvI2ZEd/Kq4ljdFTvz6eyT6RhDHmmN5z370FnT
	 tkfuNCo5t09WAyCZrr4xw1DDbkbIpbyvvxPUWuBsxgZHmkpQ2Z1JZ5n/VVt73DpgvPn6i
	 GF9emLKpKSKlSakdMvb3M6k6QYHS2RRA/OjXTU+Cty39/oLgXT4SyZ37X01LLjizxEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLtYNW2;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IJ4ZjB+M;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8014606A333
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8014606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLtYNW2;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=IJ4ZjB+M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794581321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s980VbGVtwRk1EKpuniB7EiZ4GXO+PQXntiwlHmVNms=;
	b=EpLtYNW2Z/kcoTN2bpHJv99TNpPOEcmIAYs5DFNY/Z6vCHVuwMPZcQdPt/Yj6K6us4+9x0
	nurPIp9pRlWAk3eD0Ej0jDaJ76Mz/b3WhLHfh2lVp2wreFiByW7Q+yAniV4IMBoHu/j4HB
	0VRnnzrLM2j/BTvY4L3TE/ozsbalSqg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-GEfOir6MOXG9n0tLdG3WCA-1; Fri, 13 Nov 2026 09:48:39 -0500
X-MC-Unique: GEfOir6MOXG9n0tLdG3WCA-1
X-Mimecast-MFC-AGG-ID: GEfOir6MOXG9n0tLdG3WCA_1794581318
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so7618545e9.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794581318; x=1795186118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s980VbGVtwRk1EKpuniB7EiZ4GXO+PQXntiwlHmVNms=;
        b=IJ4ZjB+M1HW0wkGSApBE2giAtVaZbWxA1nVfjBs6Bzk5fo/RrxHNXO8iCacUoQImlR
         xAk0swVd4GT54XXNNzv0EvDuERIyISQokx1hLiQtpUeJghvCBthK/v0doYK2jTOG0xcg
         tfxiQu1USplgJgH8L6GWLuqi4pxZpyVyabMuv1mwnUKhOo+GHwQu+Jir/W8W0SEMLEu+
         7RNh4qatJgwXEBz+h6jQv/WVtDxZdaV2ZEq44bjfuoc0pRgN8U78wcETu6B5S7qIrPGf
         UaWBHnGdexyOdgp2xV/AC1TXlPv7HPBpL/M77tG0PXnCoLFjdKSyMjoyXKAZs9hPyfQl
         kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581318; x=1795186118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s980VbGVtwRk1EKpuniB7EiZ4GXO+PQXntiwlHmVNms=;
        b=m/I37NwjIcNGayuQoMgDSxZ2cqZGQ8qgnYvAYv5eZS4etVPNtuFfg4PvsI1xsbehWN
         l8EzSrJrUH+EkCt05cP+D7oCl/hmJEbO/w7iLw6QpM+r03M8fUfwVrBVLNKPypM2HzD5
         uqjVO/0W8vyxJuuu/7ePmLtnZYkZc9Xhg0yWLvjyTmnqfp9cm0UTMnNz1uSX0D0z1tZX
         QQhOZzrxPB9Q3o10ws/CwlK/8oHFJZqCWMDtDiEk5xlpWWu9ZAaDbbe31oLn87AVuzPz
         x7sHBo2BBcZkcXfBJGgAD4t1BuxqUPnGSI7cnKWee6+S2pS+PoyXuVe3lxHHAELuUvXD
         KCuA==
X-Forwarded-Encrypted: i=1; AL+hErHwHL6D1C+gms4momLexdoaldsG4/5cA9HNyuHXZ0ldXAjsQe0H2/ANdgNjk9G/9fytpQc7NhUy8T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+yB49zY+vZMvuKSgkkEOYv25vALuK7GEk3h6y+VLl4eY47xvZ
	XRj0uDkbzabhGWMzZDP5w2wZ7d2BuCvVUMyDb8OeiwgD5IiVGeWgdEiIvv1s9/qQvrPDPSKcCiT
	yzdUIBpWJtoQe4b3J+JzTC4FMxKK9+BBHqjIExR3xxXQAF63/qQI5KxTwsk8OMw==
X-Gm-Gg: AYBFou1lhmVbefemkTnN/ZWK5q7jExd+Z4kLRkzXG6I3g8DeJeYvSs0USPXV+RaCXto
	ncDaNon4kA0jRGPhIiI5aHQLBlalzb7foJvIi6nXM2T0UF3vXsza2C3pBytuNEMA6+qJkONVwxT
	4BabbaBTEFFv2a/f8hpUh2+Z1atQZGRJ+XJuPuC56mJ0A8JAG0JENYOL7V3jQmz/icmAykkp4vp
	3TCyB5xjarsddqnrvwrPbO7jlz4w1Kk/DdpaEHpj5Tt297SmBgjLI8SxelX5Vo7fl/GPcaHPgmd
	Iu0C7SrmyBCmL70PSXVOBedo8JqGWjfv80a2eRvhKFY5TjiijchwQITbzBS+vxeuh0qyVQhxCWt
	mnDqRI+zJKGv9DSg0PRDEduyMkrZsyO8hSbiiR+b08eofoEo2P5mwm4KrLCUumdboLHwledTxmq
	7zP5E=
X-Received: by 2002:a05:600c:3acf:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb55a70e39mr62402545e9.8.1794581318242;
        Fri, 13 Nov 2026 06:48:38 -0800 (PST)
X-Received: by 2002:a05:600c:3acf:b0:4ba:4395:560f with SMTP id 5b1f17b1804b1-4bb55a70e39mr62401905e9.8.1794581317838;
        Fri, 13 Nov 2026 06:48:37 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ace535sm68040475e9.6.2026.11.13.06.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:48:35 -0800 (PST)
Date: Fri, 13 Nov 2026 15:48:32 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	rcu@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	luca abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yurand2000@gmail.com>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH v3 1/8] sched/deadline: Reject debugfs dl_server writes
 for not-active CPUs.
Message-ID: <avcjQMlVELcauQld@jlelli-thinkpadt14gen4.remote.csb>
References: <20261113-sched_dl-v3-0-a76ffa1cdeee@linutronix.de>
 <20261113-sched_dl-v3-1-a76ffa1cdeee@linutronix.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-sched_dl-v3-1-a76ffa1cdeee@linutronix.de>

Hello,

On 13/11/26 11:50, Sebastian Andrzej Siewior wrote:
> sched_server_write_common() checks if the CPU is online before allowing
> fair_server updates. This is important because updating the fair_server
> runtime/ period will use dl_bw_cpus() will return only the number of
> CPUs which are also marked active.
> 
> The CPU is marked active as the last step during CPU-hotplug. If the CPU
> has been marked "online" but not yet "active" or is stuck between those
> two states then any update of period/ runtime will lead to a divide-by-0
> error.
> 
> Let sched_server_write_common() check of active CPUs instead of online.
> Additonaly, let dl_server_apply_params() return an error if dl_bw_cpus()
> return 0 CPUs to avoid the divide error.
> 
> Fixes: 4043f54984161 ("sched/deadline: Reject debugfs dl_server writes for offline CPUs")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  kernel/sched/deadline.c | 3 +++
>  kernel/sched/debug.c    | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index dfae08625342e..10beb54281881 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1920,6 +1920,9 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
>  	cpus = dl_bw_cpus(cpu);
>  	cap = dl_bw_capacity(cpu);
>  
> +	if (!cpus)
> +		return -EBUSY;
> +
>  	if (__dl_overflow(dl_b, cap, old_bw, new_bw))
>  		return -EBUSY;
>  
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index e6a3b516c703b..1545139e52443 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -410,7 +410,7 @@ static ssize_t sched_server_write_common(struct file *filp, const char __user *u
>  			return  -EINVAL;
>  		}
>  
> -		if (!cpu_online(cpu_of(rq)))
> +		if (!cpu_active(cpu_of(rq)))
>  			return -EBUSY;

Mathieu's approach [1] looks safer to me. sched_cpu_deactivate() calls
set_cpu_active(false) without rq->lock, so a write that passed the
cpu_active() check can still be in flight until sched_set_rq_offline()
(which the !cpus check then has to cover). On the online side,
set_cpu_active(true) runs before the domains rebuild, so the check lets
the write through against the def rd's accounting. rq->online is only
changed under the rq->lock this write already holds.

Thanks,
Juri

1 - 20261108185406.1549770-6-mathieu.desnoyers@efficios.com

