Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD0712F588
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726256396; cv=none; b=tVaEZ4L0ZVbfw7dJFHgAEu6+Iha2DZJOoPVfibNvpMfInvu9dvU3bOBpof/qJ0ACZHvlQCfAUpXZgyxm72SUb432C6MWwq4dAGCJWcIGr+LGAom2NlGUwkcsqhi+CL6CO3TFU6C8Y2z98NPzi/ZSNCOBa4wLsBqfaUahrYT27a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726256396; c=relaxed/simple;
	bh=CMo7HkkIhI1I7aI8ilt0+qYkkVtrZmJ4OottzfDvO6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sq1zUveRqsp5NUE/NcGlRArSZW8U2caOFThC5LDOaq14KeyfS4ku1CBXuYCXpV3hqnK89KTmZXD1cSr/JVd3oNQlh7yWB/Il20Gd40fhPeJNVXKxkBmjarwlR5ixDqN7AWQN/j7NBeiC6I8bMz36EL6gcwgu7MRrexAocKjj8KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=hfMEeYIq; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="hfMEeYIq"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a8d56155f51so300660266b.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1726256392; x=1726861192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5CQI17h6VCYt4zGN52zL9wyqg2yBHJSk6YPjhxtg2Q=;
        b=hfMEeYIq0E7XiIOnaENE+m0ZAYe1nK9r3tnTUpseNJtY3+K3k+bLqL3PEIvbwDccXS
         QTC+u5r7eHYDPObbV9f1PUZ2DTmJV2H+oL/VTzLpXLJuGSQjIVUisAVgPNfggWcstxhJ
         lIyon8B3eG+wTroLMMw2bJK6eR7mbJtH9kfeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726256392; x=1726861192;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5CQI17h6VCYt4zGN52zL9wyqg2yBHJSk6YPjhxtg2Q=;
        b=G9GBPRuyS01VlxNRFzvecfPkcegQIlYUnSidQSX0rDe8sC1wVTvdWTbkAlPLy67LqZ
         hGZ0k/sRdcg3TkFHfcOzUsf3IqkLTWtkhUhLVb4EWzMtUs97abDxw+7gO+9sPj/xjx+z
         +QeT3GclpiOOyWvZcqaxNfRraas21XXehNLpPkMEc3ZSZZstmOIIeaS7kHgImBNCwnIn
         wb8Tt4uCYKtrCfhOvZu9bVIVsoqC1D3QTEsYUm+olIzl1yvIRjfJeTo45tu/TKFuOSiY
         5zp+MyoC35QdYJuLf2SEPNvJIgjEyr7yR0CfuJXLR9P4OQnOkVIrIsUgLb9LotQEBIBE
         YM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwTxTBpAs1uu8AQci3PMB2752RzxBzC+AqfyjQAdxCaLDvdjr0D5p4bi8t0f/v4M5pvvP7I3izmf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqkTK+Ejgti0kPxkpoFoQ0BH799yD6j2KPfJf3s/RC2SRMZLO
	QvlDOoTzvzeka34TzUPN7YxhARkwwLRt/scKGZaOHQVswcHsrjttEBlqtTL0PRU=
X-Google-Smtp-Source: AGHT+IGt1aG8kG/1Hgn/PR9xu8QfYT2lfl93SU7pfYjcITtFlHzQXzZGxUHxJ1HFhi5SShCzMCXnTQ==
X-Received: by 2002:a17:907:e8d:b0:a86:80ef:4fe5 with SMTP id a640c23a62f3a-a9029617930mr702246266b.47.1726256392054;
        Fri, 13 Sep 2024 12:39:52 -0700 (PDT)
Received: from LQ3V64L9R2.homenet.telecomitalia.it (host-79-23-194-51.retail.telecomitalia.it. [79.23.194.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258354ecsm899909866b.8.2024.09.13.12.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 12:39:51 -0700 (PDT)
Date: Fri, 13 Sep 2024 21:39:49 +0200
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, kuba@kernel.org,
	skhawaja@google.com, sdf@fomichev.me, bjorn@rivosinc.com,
	amritha.nambiar@intel.com, sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v3 5/9] net: napi: Add napi_config
Message-ID: <ZuSVBfgrN5wigT90@LQ3V64L9R2.homenet.telecomitalia.it>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, kuba@kernel.org, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240912100738.16567-1-jdamato@fastly.com>
 <20240912100738.16567-6-jdamato@fastly.com>
 <ZuR5jU3BGbsut-q6@mini-arch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuR5jU3BGbsut-q6@mini-arch>

On Fri, Sep 13, 2024 at 10:42:37AM -0700, Stanislav Fomichev wrote:
> On 09/12, Joe Damato wrote:

[...]

> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -6493,6 +6493,18 @@ EXPORT_SYMBOL(napi_busy_loop);
> >  
> >  #endif /* CONFIG_NET_RX_BUSY_POLL */
> >  
> > +static void napi_hash_add_with_id(struct napi_struct *napi, unsigned int napi_id)
> > +{
> > +	spin_lock(&napi_hash_lock);
> > +
> > +	napi->napi_id = napi_id;
> > +
> > +	hlist_add_head_rcu(&napi->napi_hash_node,
> > +			   &napi_hash[napi->napi_id % HASH_SIZE(napi_hash)]);
> > +
> > +	spin_unlock(&napi_hash_lock);
> > +}
> > +
> >  static void napi_hash_add(struct napi_struct *napi)
> >  {
> >  	if (test_bit(NAPI_STATE_NO_BUSY_POLL, &napi->state))
> > @@ -6505,12 +6517,13 @@ static void napi_hash_add(struct napi_struct *napi)
> >  		if (unlikely(++napi_gen_id < MIN_NAPI_ID))
> >  			napi_gen_id = MIN_NAPI_ID;
> >  	} while (napi_by_id(napi_gen_id));
> 
> [..]
> 
> > -	napi->napi_id = napi_gen_id;
> > -
> > -	hlist_add_head_rcu(&napi->napi_hash_node,
> > -			   &napi_hash[napi->napi_id % HASH_SIZE(napi_hash)]);
> >  
> >  	spin_unlock(&napi_hash_lock);
> > +
> > +	napi_hash_add_with_id(napi, napi_gen_id);
> 
> nit: it is very unlikely that napi_gen_id is gonna wrap around after the
> spin_unlock above, but maybe it's safer to have the following?
> 
> static void __napi_hash_add_with_id(struct napi_struct *napi, unsigned int napi_id)
> {
> 	napi->napi_id = napi_id;
> 	hlist_add_head_rcu(&napi->napi_hash_node,
> 			   &napi_hash[napi->napi_id % HASH_SIZE(napi_hash)]);
> }
> 
> static void napi_hash_add_with_id(struct napi_struct *napi, unsigned int napi_id)
> {
> 	spin_lock(&napi_hash_lock);
> 	__napi_hash_add_with_id(...);
> 	spin_unlock(&napi_hash_lock);
> }
> 
> And use __napi_hash_add_with_id here before spin_unlock?

After making this change and re-testing on a couple reboots, I haven't
been able to reproduce the page pool issue I mentioned in the other
email [1].

Not sure if I've just been... "getting lucky" or if this fixed
something that I won't fully grasp until I read the mlx5 source
again.

Will test it a few more times, though.

[1]: https://lore.kernel.org/netdev/ZuMC2fYPPtWggB2w@LQ3V64L9R2.homenet.telecomitalia.it/
