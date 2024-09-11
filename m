Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72322C190
	for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041104; cv=none; b=WK7Gj//Rl4vxsVcZ1DQS17r6avsIhQ9JgO5YNXeDeQxJoJ79ebRETHJpvdILuOr27t5pTgxczNWSxjDtlDf9GsynMrTy+44LUxHhwx2GCqdNRS0coL6BAc/3zyiw9ITEjEqLpiPgoR17IGbcuE/fDUX1QbW+aTDYQ6rZdrv25Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041104; c=relaxed/simple;
	bh=NKir++yKg6qIFt5diuBLaxpcrvVxtXH7i+aodtCpXo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhOWK4eivInRX1FE63tYcY6SG8HO7l0TDjOl4j9Al4yqSE/z/nPBQomfIZ1QxGQIdR7LSE7pkgQ9W20dLW59mtRfCTdIm3YzpFtltn5ZbWvoRmmlMRlI9qWmxYVlER6hKJ+hQAl1hIH5va9VFhGZnFFNrSn/MaX/loG4FEZgiKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=LBazfXtA; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="LBazfXtA"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso102996466b.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1726041101; x=1726645901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqhOEnN7I1NfnKs5yoj/51R0usVuimIfU3tAa/E8LUE=;
        b=LBazfXtAk6QnKbefeuXr1ONUvktLdgW+HEExtCgob22xaO2TaRt42YRzgN+MSYjhps
         Wng8VugBo7S8sohwOCO9IJzhLjVnvDwE0/X6rJlVXvGy0KiSVdDZG0RvbVj0n4kX52xA
         fSfkIKuiY+S/Cg7nhBxQLYOGgZ1VPT3lE7wac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726041101; x=1726645901;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqhOEnN7I1NfnKs5yoj/51R0usVuimIfU3tAa/E8LUE=;
        b=bT2xx6reDvRZMMZ8Hy+e/aRtJcrTjEKmmRLH8KwtPsTtcvtt/zISNhDD0uxU17IWGx
         xe8N5/w9bH0p1aLL+bRntCGZzzL2KEYACMms3NXxma3Vpgid7qbPbkuBIX1rWCrIZ1de
         vvalMiobWbPxgAtDIcYtltswjeH2vU3jbaL/KzKPRMbBLPxgK0onpKAy4kjMDYgqYJeh
         kNF7tFtk6o97juK7prWI9emcMnRY4umFMnLSK6Whkc0MUDvg/smvnfh3Hap508k0WdXL
         BUhGNKPW4RDd4uk4h+7g3vNUYpNz8P5IRtCqwYZLOKLGSzrgim4/hDKz/a4YaGEIsJXu
         gfdA==
X-Forwarded-Encrypted: i=1; AJvYcCUVWRvE7xqhI7VFsF5qyLn7yTiqe3/6y5HIu13QaomxuLSqny55Q6xnt66oEiUDL6274EPOevq06Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDdijmN5DAt8Ojc68ydMUpnsZ1Mw1Q1nVU6AY2f63vuEXhrTb
	icLLuR6PBwH0JIWhGJYo2YppFFY1eniwYxUWSsiWKbKvNN3PLgDNlE0FnG9sVJo=
X-Google-Smtp-Source: AGHT+IHfl4wUSekHQff7+1uJioix71uW7NP/VwOhy8UsjvFLMD59myAjxRkXduY2WsfEVdSUA5M/Sw==
X-Received: by 2002:a17:906:7310:b0:a86:c372:14c3 with SMTP id a640c23a62f3a-a8ffadf0438mr308127066b.48.1726041100563;
        Wed, 11 Sep 2024 00:51:40 -0700 (PDT)
Received: from LQ3V64L9R2.homenet.telecomitalia.it (host-79-23-194-51.retail.telecomitalia.it. [79.23.194.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d556e8sm580483466b.204.2024.09.11.00.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:51:40 -0700 (PDT)
Date: Wed, 11 Sep 2024 09:51:38 +0200
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v2 1/9] net: napi: Add napi_storage
Message-ID: <ZuFMClzrGwDDFm01@LQ3V64L9R2.homenet.telecomitalia.it>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240908160702.56618-1-jdamato@fastly.com>
 <20240908160702.56618-2-jdamato@fastly.com>
 <20240909164039.501dd626@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909164039.501dd626@kernel.org>

On Mon, Sep 09, 2024 at 04:40:39PM -0700, Jakub Kicinski wrote:
> On Sun,  8 Sep 2024 16:06:35 +0000 Joe Damato wrote:
> > Add a persistent NAPI storage area for NAPI configuration to the core.
> > Drivers opt-in to setting the storage for a NAPI by passing an index
> > when calling netif_napi_add_storage.
> > 
> > napi_storage is allocated in alloc_netdev_mqs, freed in free_netdev
> > (after the NAPIs are deleted), and set to 0 when napi_enable is called.
> 
> >  enum {
> > @@ -2009,6 +2019,9 @@ enum netdev_reg_state {
> >   *	@dpll_pin: Pointer to the SyncE source pin of a DPLL subsystem,
> >   *		   where the clock is recovered.
> >   *
> > + *	@napi_storage: An array of napi_storage structures containing per-NAPI
> > + *		       settings.
> 
> FWIW you can use inline kdoc, with the size of the struct it's easier
> to find it. Also this doesn't need to be accessed from fastpath so you
> can move it down.
> 
> > +/**
> > + * netif_napi_add_storage - initialize a NAPI context and set storage area
> > + * @dev: network device
> > + * @napi: NAPI context
> > + * @poll: polling function
> > + * @weight: the poll weight of this NAPI
> > + * @index: the NAPI index
> > + */
> > +static inline void
> > +netif_napi_add_storage(struct net_device *dev, struct napi_struct *napi,
> > +		       int (*poll)(struct napi_struct *, int), int weight,
> > +		       int index)
> > +{
> > +	napi->index = index;
> > +	napi->napi_storage = &dev->napi_storage[index];
> > +	netif_napi_add_weight(dev, napi, poll, weight);
> 
> You can drop the weight param, just pass NAPI_POLL_WEIGHT.
> 
> Then -- change netif_napi_add_weight() to prevent if from
> calling napi_hash_add() if it has index >= 0
> 
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 22c3f14d9287..ca90e8cab121 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -6719,6 +6719,9 @@ void napi_enable(struct napi_struct *n)
> >  		if (n->dev->threaded && n->thread)
> >  			new |= NAPIF_STATE_THREADED;
> >  	} while (!try_cmpxchg(&n->state, &val, new));
> > +
> > +	if (n->napi_storage)
> > +		memset(n->napi_storage, 0, sizeof(*n->napi_storage));
> 
> And here inherit the settings and the NAPI ID from storage, then call
> napi_hash_add(). napi_hash_add() will need a minor diff to use the
> existing ID if already assigned.
> 
> And the inverse of that has to happen in napi_disable() (unhash, save
> settings to storage), and __netif_napi_del() (don't unhash if it has
> index).
> 
> I think that should work?

I made the changes you suggested above yesterday and I had also
renamed the struct to napi_config because I also liked that better
than storage.

I'll update the code to put the values in the napi_struct and copy
them over as you suggested in your other message.

That said: the copying thing is more of an optimization, so the
changes I have should be almost (?) working and adding that copying
of the values into the napi_struct should only be a performance
thing and not a functionality/correctness thing.

I say that because there's still a bug I'm trying to work out with
mlx5 and it's almost certainly in the codepath Stanislav pointed out
in his messages [1] [2]. Haven't had much time to debug it just yet,
but I am hoping to be able to debug it and submit another RFC before
the end of this week.

FWIW: I too have fallen down this code path in mlx5 in the past for
other reasons. It appears it is time to fall down it again.

[1]: https://lore.kernel.org/netdev/Ztjv-dgNFwFBnXwd@mini-arch/
[2]: https://lore.kernel.org/netdev/Zt94tXG_lzGLWo1w@mini-arch/
