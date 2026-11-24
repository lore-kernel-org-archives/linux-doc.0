Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505470;
	b=zDIQ1WMEdmTL43i4HVjCxGDFQ9WnPPnFz+vrpzyBO16kfKQ2ZiyFjeY6zhax9FhZAO8U
	 cXAM20Ilzg4Vp1ZtQVsCxhecA1PqTmY2O77TlXys4KRsAB2DX2ywUS+eQgbIm8izQ2WIe
	 MzcRbg6btthwJu6kZedlJ53GCzdzdcJ2lD9iJTyqBB+zQwCNBXZzOaOkYeRyN2Y/f5/VW
	 Y7fZk2n0Ty78wGcIgVWAdJuBU67K3lZd2tN/TE09M88CYb97qir5SDhkTbwwrUnwjoih2
	 0KCgQT2MCjGgf6nJAdRPLD09UXOZahoD5lHGRRQRi9lo7OLWJDmLAYgfCpgVJfGld8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505470;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ICKsbXWih1ldCpzpgsQ/uVr8XB4yjrWqfudWCRA9yjQ=;
	b=VBTI9kZ/0iWhDXWQik4G9oHipR9/HA/o6Jf9hmgyDARDP1xBJWUqVVkcZ53iEzSBzWlT
	 NGchNklrUzowjJWVXfx5fSpkbO/jqLEuKXQRRcj55FFuz30A3oEblwUXjldF1QdgDmnY+
	 9S83elgB4Jnwu7gynGfjbJaeb71ZCyNOFhURzX3qkKDUMHZkLW0Ku6qdXEJCG2SN3NGCQ
	 X8hgxPmAM5UzuYgOrfGCwLOUojYudb8cwNEtcxHKFEDaA1oonYLS5jnqE+uJOyLfeLZZ/
	 M/tODMxXvm+GFziPVwYoreS/1x+Lmx7kr5HpbS17CJ3ryx/a5YKoX+vpeYJHV+UjrTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Z/AdjHSg";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fl4STBlE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05BD606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E05BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z/AdjHSg;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fl4STBlE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795505468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICKsbXWih1ldCpzpgsQ/uVr8XB4yjrWqfudWCRA9yjQ=;
	b=Z/AdjHSgHvfDvxphuEcLsxoRKpOE3vLHooe05bN/zj+hpsPg5Ek8COXBprMuUV+ZZIpiyi
	5zL6PjO+twonYpHlVKijk75pdMojaijZ4W6n8fCBFgWbDeEqx4Oa8ngUdST1sJADfDjZFs
	eTs1tCfrPIYhEinYfNfCANFlCP4KLWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-IwEtjeRCNTehMaZ2t5uKSg-1; Tue, 24 Nov 2026 07:30:56 +0000
X-MC-Unique: IwEtjeRCNTehMaZ2t5uKSg-1
X-Mimecast-MFC-AGG-ID: IwEtjeRCNTehMaZ2t5uKSg_1795505455
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so29373645e9.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795505455; x=1796110255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ICKsbXWih1ldCpzpgsQ/uVr8XB4yjrWqfudWCRA9yjQ=;
        b=fl4STBlE9F1zbALKvAgq9KByunB0yybbrYxsmospRkTMqV1a417MCXou9JDE2M9xEd
         bl/aBFHlfsuvG0pYnM6Xzz7qDWt4z0as4zGyq+sC6BUN5xNac79BmxBvaRqOpW1910ja
         rdXBmH0ELa3SHD8SJZS2QrRU8ZZJVbUTboFBEDWaW0gdvZLUG1N3mrs2ChdXrchmPO6x
         C3yTWAsgmxIIANk1+K6MCK8b/Rnl/LjGyYl27kVyGP3AW780DdCATtGAsSeaturDjF0P
         +jBn1SJQHZpjuGCxRcc0Ccmv1eLN/6+ULnb5xxF1JlTzP06kPfaEFvuiwMNAjRui/bhG
         UFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505455; x=1796110255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICKsbXWih1ldCpzpgsQ/uVr8XB4yjrWqfudWCRA9yjQ=;
        b=h0mwzu0DXJ5KDGSN+7YDVeIVCgIEJOMSBlj8Tn5natowXHkUbZz6gMSY30c8j6LBjV
         T1V55pmTMdTlzMTRfZK5JvNv2aMnUuWAErcavfWx784e/4WLdXJf4pJDzgLiD1zGVOTX
         jkeH8G5HDQYJJ8gXeFhFmvBU2rbeZUrroJObJscrH6Oji5kHX2Se1UxBm/E38hf8TGIe
         nHLe4BixzRF9usUkzhKsbHWHIfAvbduqEDx0ge3TIJNdj05Zku3wxkiFa123GNOC/VqY
         NJLVbh3TfjWjEsVrKDForxRrwnFvpkhO/MXE1FuSTg35AaEQOM9mNx/SG2c0mtPtl+Cb
         gp+Q==
X-Forwarded-Encrypted: i=1; AL+hErEAie0kEYpfYh2A3DJEZyavYUa8kANZQLQE0FyX1zz400jfl44Mn5sDKACtdOm0Nz4kcSWXfVqFqBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q9uK7ke2lQVnQv90yY1pvQRSWoRg4Y18NCEE5fanuR0mQ4QTB
	c9IeUa/NFGXSwvyjqlOyoyhnahOt5XaZhmqeel53UNvKCIdaNAaywoKuj6CtnQJvnqqik5ilDJw
	uqp1fKMOBNxRuI4d29vsN1GmnbmW0WqZyZEBSoC+95th2BTm2j5A1tXVOkOo8jA==
X-Gm-Gg: AZFdTZed56oQrmntgrL0SM7NXAPxk4tzpvvKfybCYqnLZ/npClj1ABE/RlkP67+Vf3h
	j5bJUEi7NO1kgxNmZt8kV+mZGVtPBIh9HPYMQWBpoMTSmxPesGOiEBUSbG3tC/mUUeKkmgf/wYE
	Q0Av15nm1EbhWrvzCSehTrom0vLPVSH/+kBIxPpM8RuMQ/nBfC0CmvzX8ZqZzaI3QrxlbfRIyeV
	lQVX0rEig1Gaq8jKfAUPHqXOx1U/Fsbmf1XQ2gnNRNW3cIJb8ikOtXZFa1qbAKbDH1ZE0+3ikvP
	Hj48tFErfU/M+6HgiR+3xXeQWg498n+E+rJVtVoHpH2ueaMgLy/bglU2QUgz5xLxxTIdk17iYgE
	IYa8TAwv+Anhx3m7JiaVaqhNNAonVhbMT5fi2KcaDOhkbCIrMCMTfTCRIK9SctB++26HuOvJEH/
	/Wifw=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr308303955e9.12.1795505455003;
        Mon, 23 Nov 2026 23:30:55 -0800 (PST)
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr308303335e9.12.1795505454675;
        Mon, 23 Nov 2026 23:30:54 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm407760395e9.5.2026.11.23.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:30:54 -0800 (PST)
Date: Tue, 24 Nov 2026 08:30:50 +0100
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
Subject: Re: [PATCH v4 2/6] sched: Move DL's admission control to sysfs
Message-ID: <awU9KmFsbiyvbcOr@jlelli-thinkpadt14gen4.remote.csb>
References: <20261123-sched_dl-v4-0-d523e4d960d3@linutronix.de>
 <20261123-sched_dl-v4-2-d523e4d960d3@linutronix.de>
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
In-Reply-To: <20261123-sched_dl-v4-2-d523e4d960d3@linutronix.de>

Hello,

On 23/11/26 14:41, Sebastian Andrzej Siewior wrote:

...

> @@ -2882,26 +2881,18 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
>  		if (ret)
>  			goto undo;
>  
> -		ret = sched_dl_global_validate();
> +		ret = sched_dl_try_boundary(sysctl_sched_rt_runtime,
> +					    sysctl_sched_rt_period);
>  		if (ret)
>  			goto undo;
> -
> -		sched_dl_do_global();

Nothing updates sysctl_sched_rt_{period,runtime} when the sysfs files
are written, but this always passes both, so a procfs write of one knob
resets the other to its stale sysctl value? E.g. write 2000000 to
dl_period_us, then -1 to sched_rt_runtime_us: admission control is
disabled as expected, but sysctl_sched_rt_period is still 1000000 and
the period is back to 1s.

Thanks,
Juri

