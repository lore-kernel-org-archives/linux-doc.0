Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42C23218B3
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459936; cv=none; b=RgrivpwPvDqTqIGoy8CCG3YqTMC+MUxzxswp2yMrEsCE53wA6lkCR00CtN5lMjWTwzegn5iSNryA4ox6weyvoCobNDfsSkR+v9nurBsoN8a8bboYjZGv2bXJTmvEnZJ3IBL6iTmKju+r6rKN9zRl3ADsu0fNzLMEEgvx4/XcjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459936; c=relaxed/simple;
	bh=Vup7WS03UeljBKAxRmSAsILBwKizCecVYLzL7awCpkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMaKz4+832yHedk/pzBFHsuj0lq16o/g+0zKH8WdyfircbOLtAAicfY0WMClpg9RXtHH/CCDpMt18XDk6timVI8wY1qMFzZNa91TIWX3RHzF0fkn60rYgLcZiEJptw9GOnOHUsufOdnH+bH8/cs07lsPOpoB4JBtUqmWYcG7358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bk7vU4uG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXyCYiJu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bk7vU4uG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MXyCYiJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772459933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CeiEMsIq1M19XQRSyjWmM83RqV4mUxb0zPC+IH30st0=;
	b=Bk7vU4uG9RVlh1iV/9kJ9jVsv0KqeAswW+c7lIoJQIaW5nXnksm4fW/lyF7VmEsQSnUeZg
	c2l6FuQMo6WFC+//K1U62rhiCj+mIpcy8Hki2p6lX1yLYZpi2ACTyQ+Hcxtb/o5Ej5ltiN
	1cGoAEmZ/YDLMcSzZfI1EGWqaCbkM4s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-sAGNhSEzMqmoY5MkvZlYNg-1; Mon, 02 Mar 2026 08:58:52 -0500
X-MC-Unique: sAGNhSEzMqmoY5MkvZlYNg-1
X-Mimecast-MFC-AGG-ID: sAGNhSEzMqmoY5MkvZlYNg_1772459931
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48071615686so35550075e9.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 05:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772459931; x=1773064731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeiEMsIq1M19XQRSyjWmM83RqV4mUxb0zPC+IH30st0=;
        b=MXyCYiJuisC0xm0wWSBdSxiNqio3QlV3ikuoGDtUoDqzmJSlRGmeDC5nrljnccLDR1
         OCwS/iyKX93qfIHMCM5ev1GJXd7YJ/nH9XtVwghsY/uFyyxwQkUp/moqI0n6GMjDrZZo
         t1gnxmFv6hxzAlmzkkAR2M9Wi8n5WsjNze7ZAF3/CYWDgsRMN2e84/Raw7jj/xiE7XVy
         hkN8qcsYb8lg99PtF2uwGljwdiTkhHk8W48UIt/h/fXWLVVMmwse+yNEQGzuvbZwvGH4
         hgC5A6W+V0TocVAq8xWDBlLOJBfkdcBPqyOxMtLco7hIHGi1dSytV3+WLXtCO7ehZiXh
         mXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459931; x=1773064731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeiEMsIq1M19XQRSyjWmM83RqV4mUxb0zPC+IH30st0=;
        b=amkFufPQcDdSjra6sbooZq9U57E/repIwxau94rnHxcZozZD52ppv7Ni6ITz/WGzVK
         SFk7bSgtX1PWjtmzjgJy1m07p4YpmqURXxWQ8uHDL7nYEt860xUj3lA6SDl3mJ1PBdat
         q+nv6XPsFlf7C+WMMCOkFBNsavs0VXaepY9f9KXxGbgOfwo7U6/VpzrrGlKZYA0jMOFf
         dzb0Z8R6rMzpNI5d3YqO7j9CrYY9L1aY+OLDaWJ8sMm6onYIwI83SE96nVxCXe5cwutU
         MY60rxfUAo9AsGTkTXZAifFeMhIYZXo4pb5wOiFbQOL9yF5CIJvxIqfSMKaPhXONIX/e
         uoIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd9LWiqn5I8cBD+ue7RpR5RCO9TxxkYTSILRCr7bNuPkgysF2KKyMUrhj5GbjkI6dFYsjDM3hpnSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgG+TnwzIiU2UUbM6AHK9Cn1aaEtmRPB/EI51Pl9KqcekkzNc
	GFXsDHlG021EvrZypedC24RqsIs5Iua7TYI0d5/D1Dp1EluUr/yh0EWurB5kAc35I7OIMx4++SG
	2gnRPgnkBhBghaxOscVyBg51mJMWlptKEPjlXm+yXC2sK+EGjjPyJd1LLG4uhBA==
X-Gm-Gg: ATEYQzyfhBQ4wRhp8cQgS1goAr9DN0ZDexwypHAk4/8Ng5aAk5kbPmrC09yo4dP8ETD
	glB/cE3q/t0eaiaSEp5cO3iY5Oz9fhIZMUo12p+kMaaa2lCOhVC95/RiTGVZsBB/4wiH8aRPWyc
	yqu6/X1eZIOxjPBaDxHWIzGJFj1ny93pNTCFy5jRJIv8X/OCaI2+CiCTzwQYrra0toMNrQ60gsU
	/rZewoCz9UNJcZCatWq9MWAkVvrBX282qu586pcxF36K+S3MbdtGgfz5tcCYU/mUazwCKtvGNbA
	VIXROut5ZQCX4wEClQv2b4cSDCvKzlsXTUyu+wZwhBZ623fti8wamWIKDkRRV729V4J9YOsfLJ9
	iC+FcPDezMbXPwKUB+HYdTCjGafLLWKd4YQscU7vGvK3Y9kN6DIg=
X-Received: by 2002:a05:600c:4f11:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-483c9babeaamr234251745e9.10.1772459931334;
        Mon, 02 Mar 2026 05:58:51 -0800 (PST)
X-Received: by 2002:a05:600c:4f11:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-483c9babeaamr234251295e9.10.1772459930831;
        Mon, 02 Mar 2026 05:58:50 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.73.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm10784198f8f.12.2026.03.02.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:58:50 -0800 (PST)
Date: Mon, 2 Mar 2026 14:58:48 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v6 05/16] Documentation/rv: Add documentation about
 hybrid automata
Message-ID: <aaWXmBVIvTlVtiRp@jlelli-thinkpadt14gen4.remote.csb>
References: <20260225095122.80683-1-gmonaco@redhat.com>
 <20260225095122.80683-6-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225095122.80683-6-gmonaco@redhat.com>

Hello,

On 25/02/26 10:51, Gabriele Monaco wrote:
> Describe theory and implementation of hybrid automata in the dedicated
> page hybrid_automata.rst
> Include a section on how to integrate a hybrid automaton in
> monitor_synthesis.rst
> Also remove a hanging $ in deterministic_automata.rst
> 
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---

...

> diff --git a/Documentation/trace/rv/hybrid_automata.rst b/Documentation/trace/rv/hybrid_automata.rst
> new file mode 100644
> index 000000000000..39c037a71b89
> --- /dev/null
> +++ b/Documentation/trace/rv/hybrid_automata.rst
> @@ -0,0 +1,341 @@
> +Hybrid Automata
> +===============

...

> +Stall model with invariants (iteration 2)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The first iteration isn't exactly what was intended, we can change the model as:
> +
> +- *X* = { ``dequeued``, ``enqueued``, ``running``}
> +- *E* = { ``enqueue``, ``dequeue``, ``switch_in``}
> +- *V* = { ``clk`` }
> +- x\ :subscript:`0` = ``dequeue``
> +- X\ :subscript:`m` = {``dequeue``}
> +- *f* =
> +   - *f*\ (``enqueued``, ``switch_in``) = ``running``
> +   - *f*\ (``running``, ``dequeue``) = ``dequeued``
> +   - *f*\ (``dequeued``, ``enqueue``, ``reset(clk)``) = ``enqueued``
                              ^^^

> +- *i* =
> +   - *i*\ (``enqueued``) = ``clk < threshold``
> +
> +Graphically::
> +
> +    |
> +    |
> +    v
> +  #=========================#
> +  H        dequeued         H <+
> +  #=========================#  |
> +    |                          |
> +    | enqueue; reset(clk)      |
> +    v                          |
> +  +-------------------------+  |
> +  |        enqueued         |  |
> +  |    clk < threshold      |  | dequeue
> +  +-------------------------+  |
> +    |                          |
> +    | switch_in                |
> +    v                          |
> +  +-------------------------+  |
> +  |         running         | -+
> +  +-------------------------+

...

> +  static bool verify_constraint(enum states curr_state, enum events event,
> +                                enum states next_state)
> +  {
> +	bool res = true;
> +
> +	/* Validate guards as part of f */
> +	if (curr_state == enqueued && event == sched_switch_in)
> +		res = get_env(clk) < threshold;
> +	else if (curr_state == dequeued && event == sched_wakeup)
> +		reset_env(clk);

Considering the spec above, does the 'event' need to be 'enqueue'
instead of 'sched_wakeup' (or the other way around)? Or maybe it's
equivalent?

Thanks,
Juri

