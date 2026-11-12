Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495677;
	b=IFkUJawl38w1DSF9Ce6JzHLI3S3edBbRW7glzPmbsaX+kJwxSkR/g2v3Vkn1ApbuwdN1
	 lmHekRClCMsbvxh20ZOef+fUn6KdoWAyA2GXBzQZvoq5iojovJY2YEmrCxtCgN6AxqFV3
	 cdiHt/+isxip/Mtbv5XHbhyCbJjiNzA8WhBR+saSc4mujWr6Z/R1sOpOAOQFaQixhVxlG
	 jLfmbwnaa5pkODRzv+IugSLgma8koshZIosmz4ETcQA7MOa3+twnJ0QJrdmgDkEjfUA+l
	 voI+vC54Pk0j7rhmcGMzZxHNHHqvxtV3S+2AJDFho6QfIsRXXhF0olQM16ZnTWcefwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495677;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
	b=WH+33JeY91v/v1bmo8x1Oi131qe4uNsZv+hpIhI8LKsTEymQWX7wHnbWkS7lASsCAAfl
	 AvvAU59Vj5/12GaLixa+5oCk+8PMIcu+f5aX6N1LRxeaVxo5ilYSpE2y21v3xzLb69iyf
	 VFz9G1GZyqcT9F/XgBLlHoAA9MZUrkipEqNzdgwiSssyXEC4VVKxYyrgmjpUQZjQGA9/t
	 gmlbiQkHnv7UBccn9VEkiZHaGpMMoj5vuIiN6PWFcqAj8TUxaIyZ3JZYoRlYHzwdZklq1
	 OIWmCoj+AjSxez4PKj43ZnC+LuHSYyA+kvwNZ6DEsY+Jb3tIRZEhkMHuqRWdibR04pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BOHPyxJv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTr+R4Yb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B1606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A3B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BOHPyxJv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTr+R4Yb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794495676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
	b=BOHPyxJvB4pTnMxOWavNyCbLPRZTghQpNlsDAFrV0ori2SZKOtEkL2YNEhVazgiO8OIlBc
	MUtIUOnFac1Wcn1wLC/BuQ+rNkwS000qAglAgJWNmzJbFfDNLAcC2OO+wkK14e2gfzVl44
	AvAQNbyZ4BfhRy2NskT8SCO8TBzTUsI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-feXZCTpmMYyyLoK6yC6fHA-1; Thu, 12 Nov 2026 10:01:12 -0500
X-MC-Unique: feXZCTpmMYyyLoK6yC6fHA-1
X-Mimecast-MFC-AGG-ID: feXZCTpmMYyyLoK6yC6fHA_1794495671
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so35770655e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 07:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794495671; x=1795100471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
        b=RTr+R4YbUtPb0bJdv9nKHbt5s927vcuRHj8Qc+OgK1pDd+OkXz/XRTdRh+Lp+nae6T
         l8lJ53T4GUVn9XOVe0bCKpyjw3CnwmmmXHp08IWNvpnkN1WmIOQnOrXGswdpYoBnfqCQ
         y9gE7rnEsVVfnKIv64XUWDMmG6izvPpfn4bFNPpiC+7qjOELvlLNSzLS3gpb9Lq/um6S
         O9f8JkDe7Wxx0Wh+ahSYpy3z8bupNQZI4JCTSBKci4+I5ulr0MP7RAQiXvnYM2O3UolY
         85zasF1WCLyu6xoC8IR+3v+DI32L7sVan4s8dZ2r1WSI33icXbBNVYFWTfbbmw6GYvmh
         pkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495671; x=1795100471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
        b=VLn8OXtziOkf/VnUqOwqWHwjkfTdoXxb8H8ERJtaBt0icxXqjTwdzzFsz4GIjSIh+P
         I/nY6JEiduS1tNlA1WwScBQTjt54ZpBdsFtfaklLbup5NtnSJKHBpLLhbeOoUKJiPPGp
         rwzzU4Pd/rNqs+ZpRcUizJFZLLyAnfo+spuH4gc0azO1B4KoCQPxxvlnpE051jKkcDMc
         aet8ZxzCAMYHJw+H0BpIGzy1ED9/Ct9uXJU6EUGHY/LpIff8VGN4roFU9wxkXocqwt4T
         +4ADKTqQUx5sAmXg7MEgQNcBwfyFW34PunXRVowfODdBpKWQouHaFuHli6zivNBxgUIq
         zw8A==
X-Forwarded-Encrypted: i=1; AL+hErElOLJLDxChcMAJSdbP+yJEJhtVAENuVsu+tEJaAdPXHzBViBysW6b2IQ47nlak3EcLrmIWn2tYems=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8OdF5BgwNeBEssYlwsNqNdr265Vo4EFDgcZOLgy+ZYlBnyOq+
	D3sTpWKZICh9n1mK2kJWUYTzl3m9V7nETlq/4yFEGnEGAk4P0dfcvNvHxxO7kOhwVAXNaQUca2x
	FGSHtU99j4RnO2Lmt1RmhXYWmHvGNgeQ8KYk6/T9Sy4d1J4RIv9NjaRNLtsgeVQ==
X-Gm-Gg: AYBFou2tHqWvfk3bnn9mYHUQwBLqYNyxbolmdITEqizCCyJJHv46vA8WbpFs+9b723K
	hAN8kltLcVjnM3/HR4B0Q8xro2SymKWf5W5wkZhzyLGMw1oXUVA8GnWDl3cYzLBVfS8mcPCyvHM
	9tIrrEx4P40qzIchR9g48NOaEGNoKyNuISjmVR/Zsf98kFD7yEnXGRBzNzpSydpX1vscj83P6L+
	4dHQQHtRheDrPT5z4QTUNgGVoIHgLDiCJE+AQSIzlwr0xLNViNjgG2O38fJpfMiYO0TP3jdgavl
	lkyyqfgVpv/jjtRvrckt/1c4gQIUR10tybnO3hfnGe47g5DOjAk7R11r2fhiizX6iOt6J+kVWpC
	e1RSo+AAHzoTR/n8EkXL5Bi7Uj/LywJD4/1EZUQUvrX3zFCCNBXpErnPl/3q1T84U
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0935f880mr100717645e9.13.1794495670949;
        Thu, 12 Nov 2026 07:01:10 -0800 (PST)
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0935f880mr100717275e9.13.1794495670509;
        Thu, 12 Nov 2026 07:01:10 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm110908625e9.0.2026.11.12.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:01:09 -0800 (PST)
Date: Thu, 12 Nov 2026 16:01:06 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	rcu@vger.kernel.org, linux-doc@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
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
	Qais Yousef <qyousef@layalina.io>
Subject: Re: [PATCH v2 0/7] sched: RT throttling cleanup and a bit of
 documentation
Message-ID: <avXUstjABxdTZaxM@jlelli-thinkpadt14gen4.remote.csb>
References: <20261110-sched_dl-v2-0-cc9399f7aeb1@linutronix.de>
 <c2bf89ce-b9de-43cf-839b-395d28b2275c@paulmck-laptop>
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
In-Reply-To: <c2bf89ce-b9de-43cf-839b-395d28b2275c@paulmck-laptop>

Hello,

On 10/11/26 11:56, Paul E. McKenney wrote:
> On Tue, Nov 10, 2026 at 06:34:42PM +0100, Sebastian Andrzej Siewior wrote:
> > People used to disable the RT throttling mechanism by writing -1 to
> > /proc/sys/kernel/sched_rt_runtime_us. Since v6.12 they can still do this
> > but they don't disable RT throttling anymore. Instead this throttling
> > mechanism has been taken over by the fair_server which can be configured
> > via debugfs.
> > This is not really documented by a hint appeared a few cycles later in
> > Documentation/scheduler/sched-rt-group.rst. This can be found once you
> > know what you are looking for because this document describes the RT
> > group scheduling (CONFIG_RT_GROUP_SCHED). The fair_server is used even
> > without it.
> > The then there is global DL resource control which also shares this
> > file proc file (which is stuck if CONFIG_RT_GROUP_SCHED is enabled).
> 
> Nice, thank you!
> 
> Unfortunately but unsurprisingly, this gets the same divide-by-zero
> issue reported (belatedly) on the earlier series:
> 
> https://lore.kernel.org/all/e58e48c3-ac62-40cd-b5d3-2de87db12496@paulmck-laptop/
> 

I wonder if this fixes is

https://lore.kernel.org/lkml/20261108185406.1549770-6-mathieu.desnoyers@efficios.com/

Thanks,
Juri

