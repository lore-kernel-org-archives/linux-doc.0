Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CA32E719C
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311980; cv=none; b=uiNJeFFZkI4YKzYCwS2uk4PqYtAKVMLXyFrlnfxRjqofDnOx3B26K2vcyob8NpyklV405quQ7MrOVLpivlyrWdEyeKMcpKC9+Mf6UYTEojimG329AcKUa+xBIP8x1w4LAbRW3cSYKG6jxxymTjneaR/DSRJxI09U1OK9Sfzxihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311980; c=relaxed/simple;
	bh=ZQDNGSUawC08jjcvn/R3TGfNGjmLvryin4H5VAlkPy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5++ypd3MttZUVapuBdxV1+QaXjuGIyP4druheHgCtHfqQvLvNzZuUBCH3YpK9sVHOBAUg4Zx49PdR8NZ8l3AXx0U5yfoLopyitwrRvmYjEXzFxs6CAM1IyepGW3Nl4nYrFMDE5fR/kjkmaJwRAu0toQPazZc+rVlxLXGyiFf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TM1Kmj81; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kHdygqtj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TM1Kmj81";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kHdygqtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773311978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O8I9IWEr5vJlFRSOr22xQTP0bqXnTuN0yOqYjNPkcXw=;
	b=TM1Kmj81eJPPNz8g/bdhNfrLycpN51FttV/EPjfDKZ8g+6U2KPBOXBM2D0SE7SGeqwuHiw
	5mc2W8Z/Y5834Am/68TX9jpNVvo0EdWjWCGJSZbJN6wM7LQ9IzP5220U6mBFwpiFhuTKs/
	nzpE773V4g/cH8uDTZ7VB8mIWPMxisQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-S6MS9EWoOVq6WIdWgpvnCg-1; Thu, 12 Mar 2026 06:39:37 -0400
X-MC-Unique: S6MS9EWoOVq6WIdWgpvnCg-1
X-Mimecast-MFC-AGG-ID: S6MS9EWoOVq6WIdWgpvnCg_1773311976
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439c5cce2deso692607f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773311976; x=1773916776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8I9IWEr5vJlFRSOr22xQTP0bqXnTuN0yOqYjNPkcXw=;
        b=kHdygqtjol1UMxScHcfNqMNmU0/nqQVkE+SJi65+vVFlEIQAyv6y8KmBwVmIwHydTw
         +WbcifnJnxL2c7T20D3I8ibHH0INIR5iG7DzUIlpsyT0wNx33sYuK784c39UIPSX+CH2
         vC39FeW2PMt3R50CF8IlN61L9nekz1blE7A61o1eb19Nwg9ojsR82HsQXC+CcBso+43C
         JV+3DOpdO3Qa2bYev18nj2TKzorH5f6bR/Hz+zv6NnpKt9Yb2rkM87MVZ/wV3Pyurj1r
         kVD06zlcLZ8xnDB+MR8zhC4mm22QlBU6RwR3I3c5NoKUqzXhpWDxVSDBz8w+WVyYa5Gw
         VEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773311976; x=1773916776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8I9IWEr5vJlFRSOr22xQTP0bqXnTuN0yOqYjNPkcXw=;
        b=iQv3nJ3hB0Hf98huoREzjD6t7jhoewUn6tlQByZrAPy81Y/jokCZhPBddTYwEsbNjy
         Ko7ar/pkYpAV1h26ww/1FvKJ04Hcdl3fTGjHLy9DdW2e2syLG1gfS59074lfYkoGSSm/
         sKQYA4kRf0x6hCCFVRGSV4ZkHmShcS1z/oiJhtFSj5ZdKePgBCX4rhZBgMiq5/hqXj4a
         9kVIdHGzsmKhpjfe2aARH6ZLYlzAKHqxzawiqypkQyV06HTKJyQONxB8mPyBrKncsnFh
         cS0SfzQGiO2l2SojVyZ+74nW4RoYfUdYHpyzimuwsXbPf7msUgtuPD5MVhi6D6W2o8iq
         3koQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu1TfhO0gYK7XEl28ySoL+4S+Va6sjJ7JhUA0Jglz8ZQ62RQT1UzG6RX5WWxbrvLgQeh0Ek/aYy9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq27alpthne9IYZa5lriwgA5ckGaH01fkQomTMsHnDFMk9j1cl
	MHc4OUCqbPFQ84Hko3qPNmI6Yn0HCB4Y97ZEciuX6v5bAzTYJWH6Ctq54pHscc7aYvJ+ozfWgo0
	92TQ3crGRQsxFoLQR6+GO45rRJhAu0qYIgDvnBLAZgGM8ELfiIjSfxwzt0wq4LQ==
X-Gm-Gg: ATEYQzz0Q1HH7t6n8ACJIpbVgm10IPIAaI26SDnRuLq9DEqClZMP7MfmafxJyt28o2g
	bj6ty7boy1BsL4i8Wjs3SYjzkMe9g9vEruaYSFQwDq+8EOhQFUV4JWuULhuC92JBmHOOTvIFCJk
	WpIyBLoZMyEWmQo1zO2FTcEk9CcJ82w0ukCKrVl594AFBC5sKFDpGyXD7MEN0wNJuQf25Mo3BtY
	oDL4GfCff4LYHfOtyhABHPD0RilVIkEgzEqy8zw0GdXl7B0OU65FqXuqrQ6lBYbayFk22k0rKDj
	+Hek2HfjPZ2fWeF1cDkfquuizXA9M3VUzHNKK47BAzQS86pIlRym+ALjKOvUnQMiB/HkaVlsUHH
	DB/Bnoyq3PP/a05ErNgGgmZV2I0zWtJnCvZe7dTNNbUaBgSfxYys=
X-Received: by 2002:a05:6000:420d:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-439f81c5a51mr12034994f8f.18.1773311975773;
        Thu, 12 Mar 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:a05:6000:420d:b0:439:abcd:b314 with SMTP id ffacd0b85a97d-439f81c5a51mr12034946f8f.18.1773311975308;
        Thu, 12 Mar 2026 03:39:35 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19acbbsm7497086f8f.2.2026.03.12.03.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:39:34 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:39:17 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v7 05/15] Documentation/rv: Add documentation about
 hybrid automata
Message-ID: <abKX1XO4vqY74uA7@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
 <20260310105627.332044-6-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310105627.332044-6-gmonaco@redhat.com>

Hello,

On 10/03/26 11:56, Gabriele Monaco wrote:

...

> diff --git a/Documentation/trace/rv/hybrid_automata.rst b/Documentation/trace/rv/hybrid_automata.rst
> new file mode 100644
> index 000000000000..60f6bccfba38
> --- /dev/null
> +++ b/Documentation/trace/rv/hybrid_automata.rst
> @@ -0,0 +1,341 @@
> +Hybrid Automata
> +===============
> +
> +Hybrid automata are an extension of deterministic automata, there are several
> +definitions of hybrid automata in the literature. The adaptation implemented
> +here is formally denoted by G and defined as a 7-tuple:
> +
> +        *G* = { *X*, *E*, *V*, *f*, x\ :subscript:`0`, X\ :subscript:`m`, *i* }
> +
> +- *X* is the set of states;
> +- *E* is the finite set of events;
> +- *V* is the finite set of environment variables;
> +- x\ :subscript:`0` is the initial state;
> +- X\ :subscript:`m` (subset of *X*) is the set of marked (or final) states.
> +- *f* : *X* x *E* x *C(V)* -> *X* is the transition function.
> +  It defines the state transition in the occurrence of an event from *E* in the
> +  state *X*. Unlike deterministic automata, the transition function also
> +  includes guards from the set of all possible constraints (defined as *C(V)*).
> +  Guards can be true or false with the valuation of *V* when the event occurs,
> +  and the transition is possible only when constraints are true. Similarly to
> +  deterministic automata, the occurrence of the event in *E* in a state in *X*
> +  has a deterministic next state from *X*, if the guard is true.
> +- *i* : *X* -> *C'(V)* is the invariant assignment function, this is a
> +  constraint assigned to each state in *X*, every state in *X* must be left
> +  before the invariant turns to false. We can omit the representation of
> +  invariants whose value is true regardless of the valuation of *V*.

Very minor nit, feel free to ignore, but ...

The formal 7-tuple definition includes 'i' (invariant function), but
unlike other elements, 'i' isn't stored in the automaton struct - it's
implemented as generated code in ha_verify_constraint(), IIUC. Worth a
brief note clarifying this design choice so readers don't expect to find
an invariants[] member in the struct? Here or below in the example C
code section.

In any case,

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

