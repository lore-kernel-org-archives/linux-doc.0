Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515097;
	b=iKIo+OYY6NEfR3BM/CVcdpdIF3BtFcUnaOU0dCtcELyCf2ZxkFpOwPbeB6f7m600oFji
	 4U6JFV5XXrXfsSIo5pTYYxhFzkm9qmzDvVp+Mmv/Y7fVZtGMIZEDCqKxO5jlXgWvyjzLO
	 KKp/GL6H1H28Bl362yv4qvmI+ue1RwyAqsUcejD7+P4myDV3PJKw8K46QfvgpWhY4WYyY
	 2W+onIKGZdtF485Ir+Bgv7tiSWobcBGHvBP5i5Npx2wfgLoWcbh5eW9JwLSJdefATn1H6
	 EVAI41gonaX+J4YIvT8KMhgNu1XGNVpSmjIlXwDez0xo30zQF9xKIAAijxrruC8f23g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515097;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
	b=CjpZSBjGCjkUzMJJXn/EIY5SZviw/1Ed83X25oBwdr99Jvj0DIT3hW4+xUtS7bcOA6zx
	 h9rDFyZWETHlNKJrO4a3/pKEAQYm8Rj4ckg4iY6KG1ito72f/aHG3+SVZBEyfUpnxZcDy
	 wbW6rRp+zrXg4FsGqPi6cIW15562CXBclrCZ82aklkdkxDccvtohvBVXmDAogLS/0F5c2
	 6FSTYQwSeOjTZ+yp4jwolwrLjqaa0bYTcRtb+gSK7l9LE1r9Fnb30/boiSojlv/L5Sgl5
	 Lv7ba4zNomWu9J5VntvNr5boGI3dJyNFh4vU8YOXjmlotieFwzQlDv+XcAFXh0SAQLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Qa/Y8Xrc";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h7gEJN8O;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC81606A321
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 10:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC81606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qa/Y8Xrc;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=h7gEJN8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795515095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
	b=Qa/Y8XrcwT8WUAv2GuNiOcaeaxuzHHoqMuR/T2uTsLnHD7a2apBcOaZ0bEFkDniPhjEdHl
	CmJogIBJkAuwsLvsJNNBJkpqWOQKnkNlF8gDKfoQjZxJexoXqWSxATzgidPXq/eE9lpiBB
	vAGKtT6WbszcPLRp5X2VPwBC8+YqHB8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-aW9hMaupOMqVwz23CVcoVg-1; Tue, 24 Nov 2026 10:11:33 +0000
X-MC-Unique: aW9hMaupOMqVwz23CVcoVg-1
X-Mimecast-MFC-AGG-ID: aW9hMaupOMqVwz23CVcoVg_1795515093
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a4654add56so29713035e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 02:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795515092; x=1796119892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
        b=h7gEJN8OBgFNUHMdvcvxCov1aoor2h//nVUcZ4O1IeANH5Uw9lTCw81D8dSFXQYQuI
         TlFGbh5jsTUr3qC9NYY48D7BnE563i6L1gwsCg9YhdYf7Jzd+TpwNdve2e1UufSUTfva
         A+0M1ayAJ70R1B6OGnMQLNUYZoBrNcfGhTH/xQIH0rdcBiY7+0fYEGzzya8Jye5F4nvW
         d7MaqcsOAhuqmC9y24fkr9lszPYSwZMLlqWAPxhCCwAMAnWUvD0guVB9/JsSNKWHwz36
         L2y4QQIiLlJu1kz76Rvpo2bVQIZrTT3QQhZ2FwhtkjVFMM0Dn+cGWemtLuAYiZjR7SZB
         FeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515092; x=1796119892;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAjHpOoHzD/5/0Qvp1Ofl3iGJdTZMSnNgw4bsE73GGg=;
        b=W87OcwmJcslhNjIUXBCjd4O5R+y6uB8KpwLmJWkVHFX8qzS18viL1XqEvYkGkHyzU8
         PiIL+qyiHVTm5hMczUVYz+XRB6E4QyqS7rNY3tu5fIJpvBTQFU519r8kkMixRQU0VvOD
         zkHDfYXDBTFWeUAVw+WNMCc/K40mBqw/aadcMuODWEny0TXK+7q4dpWn+HOSn9Iwyg1H
         P//oMcre3JRG1N9z5JGrtRXZjU/7i9byuDxo8yEcE47OvdC9c2JQZkEBaebDnHj3gvbr
         loA0RxYJuLpR/mLlUEz02c2VfpNxBPgZlIpnHgwE5dC2ydsWqhdJZHHmPvx5ieFJI7MO
         MMFw==
X-Forwarded-Encrypted: i=1; AL+hErHPRpaIOG78f+fzT9KufcNxxCCLP5/yIo/ZETNU/awequr+gQgjk03sTl3ZPv3t/w7/CM+2XBd7feA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8elJ1wWhr2vI2hge1GxVU7cjCbVvGo9ltBnQEQEEQb2bqYV2vQ
	FDpGkYsKOWD5iR2wAwFQZ9yZv80AtN1iXGUUR6pRaNYr4NK3ETG6zUDjnnWyvRk8Z7u6ZbjVwL+
	QCFHK75/Ry4isk910ZcCwfKmE3O/Wu2FXn1wNjCnVOzvpO1q6rfazGvGDa2UwVg==
X-Gm-Gg: AZFdTZexy3wQPZuBmDFBq3qMoWES4p1usmeHc5iM8uhVF6Uk2t4GY+qP7WJ8YVbImjW
	kxrbCShAv2LxvJNRqmMawGdsDoP/xDOjNeftajW9LmVhAaYspsg+hdd6P/7L2cVWaVTqxjUvP+g
	7k1wtjAqK0TNPiaiVpqZdJprGw0QFyIZ9imSlwF3QXtiuxWdSfzrPX/ZyhOTOBvXYoZRuEriQmj
	6G6VzsJAE+ziw4F5NQYx2UUdWtBdCFIiQzFR8H2xvEtfO6qBHNR5nz8WSQnoKwrYj5tRxUTpGaB
	/H/S3dEk7ztqQ+XsorRLQ0JaIKhHs8AsUPUWsB6bn6KuoI2JZCfiK6l8aGUFE5iTd+rAYERGxu8
	DCQNx7UUHxjDzaS/iXFKGXiuO9kyZzoxvgKFttYhK2Ta4F9nXAy8OMTgkCZzWnwAfrMheAvjq1v
	jnfXA=
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr294991565e9.34.1795515092648;
        Tue, 24 Nov 2026 02:11:32 -0800 (PST)
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr294991115e9.34.1795515092291;
        Tue, 24 Nov 2026 02:11:32 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm28093795f8f.59.2026.11.24.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:11:31 -0800 (PST)
Date: Tue, 24 Nov 2026 11:11:29 +0100
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
Subject: Re: [PATCH v4 4/6] sched: Limit sysctl sched_rt_{period|runtime}_us
 to RT_GROUP_SCHED
Message-ID: <awVi0VQJCBNYc8u9@jlelli-thinkpadt14gen4.remote.csb>
References: <20261123-sched_dl-v4-0-d523e4d960d3@linutronix.de>
 <20261123-sched_dl-v4-4-d523e4d960d3@linutronix.de>
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
In-Reply-To: <20261123-sched_dl-v4-4-d523e4d960d3@linutronix.de>

Hello,

On 23/11/26 14:41, Sebastian Andrzej Siewior wrote:
> The admission control for SCHED_DL has been moved to sysfs and RT
> throttling has been moved (long ago) to the fair_server and its debugfs
> interface.
> 
> This file remains to have an impact only on RT_GROUP_SCHED. Keeping it
> for ABI/ compatibility reasons makes no sense because its original
> purpose (RT throttling) is no longer served. Anyone changing this file
> and hoping to change the throttling behaviour will be surprised.
> 
> Limit sysctl sched_rt_{period|runtime}_us to RT_GROUP_SCHED so everyone
> using this outdated file is aware.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---

It looks like subject and changelog still describe the previous version,
as we are not removing the interface anymore?

>  kernel/sched/rt.c    | 8 ++++++++
>  kernel/sched/sched.h | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index bd37dbf2bebbe..258b187459bb9 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2877,6 +2877,14 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
>  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>  
>  	if (!ret && write) {
> +		if (!IS_ENABLED(CONFIG_RT_GROUP_SCHED)) {
> +			const char *msg =
> +			"Please note that DL admission control (via sched_rt_period_us, sched_rt_runtime_us) moved to sysfs.\n"
> +			"This update will be mirrored. Controls for RT throttling moved to the fair_server.\n"
> +			"This will not be mirrored. The fair_server settings are under /sys/kernel/sched/cpuX/.\n";

I am not sure a user who hasn't followed this thread will understand
what "mirrored" means in this context. What about something like (names
depending on the unit discussion):

 sched_rt_{period,runtime}_us only control SCHED_DEADLINE admission control,
 now also available in /sys/kernel/sched/dl_{period,runtime}_us.
 RT throttling is done by the fair server, see /sys/kernel/sched/cpuX/fair_server_{period,runtime}.

Thanks,
Juri

