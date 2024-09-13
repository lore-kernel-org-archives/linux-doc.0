Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4B3032A
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726253737; cv=none; b=eXZixTvpEWxggCyN4nqP/xV+kWH53EpynqiuT/LwfNij+ijCUE7vIK+5+GsGTCVSZF7rEv5B3ykQN41xgtGdxkZ/SS5EAof1roUF8NqcbhcGoeIzL/5fITN1YzmqefTWhp1HV7KINPB/cjsan3dDfVWw1dXV2sWzemDnB0EVEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726253737; c=relaxed/simple;
	bh=V+VmYPTZRE3hzK62YCRKPBn1g2RyukAfOJtc1OgpEBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwQbNrlNNsAcOQ8JB1jUvw2hELXjS7b0oBOYmoCOXv+MbGs8XvK0jWUFv//UWzrT66Fit3wPwO9Bl6nl4i5nShEC9ZuFWK/tRRvTGQFE7cb7vbU8mj10yqw2Zvmos4BvaVrb8KZctfMZL1eMwJCPWs0KGbA36o2fKFzhRaRCgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=nJ8l+26h; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="nJ8l+26h"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so652615466b.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1726253732; x=1726858532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SDYQ7lzcTR7t7MivDajHBL9N4FwFQeM0m9Pk7CbHHE=;
        b=nJ8l+26hEJhxdnD+J5xpJKSaXOgr1fwaCJFlBl8x438jI8WpiYraJD9V8NsQn5UsgC
         tZ3GyGhb/Rc1T0ZpSUJFqQmmKc45QLeetKr75fe9msLMfWhWHYYDfutJcYVzUwdm4H+7
         MQk8QnTYU3L/Yne1jRwcyQLSA51lapkYmgl6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726253732; x=1726858532;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SDYQ7lzcTR7t7MivDajHBL9N4FwFQeM0m9Pk7CbHHE=;
        b=CIUS/MCOBdzKDjGCEWeQfXIbmjdjOyrxW9p5LqEn5D6ZU/DN6SJquNcQ9Xr3BrfjMY
         iau1iOJwGke5WDkJH0DsNKi/9VTsMcRC8cxT7FbVUz34uMTyP+lAlpVgf5Fq1OsYj2pO
         bOisD7aufU61bpGPp2JE4pFxn5uSjS9pQs/ad7aYo37ml9EGZdrThbClqxhIjKLkV4HN
         WegSPeCEKuWjTakSM8XsqseuD0WoVxjhKkGfWHT8OKW2XXSRHK3Swl+9tJBAFVc4DQq2
         B9Z+Tat7hTP6BAG2ZXHsh7lQFUetekLtJDKNRIColpcyDj4atv3II1ATDBGStH+xcgMi
         XjYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhcqUyEvCt8jSUwfv/jazlghkriZWPJzA8qY+/yaqnc5SS603E0XO24exAgQZfuyEiNDJDJBzpiz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhE0o0G5SgbswSy/pSBvRW4Hsek1o+KzGyB8jT6wDSgrE5pdb
	TpUM7uPN/uC69em35MRCAMktK1zCnE0K5cI4gmnJoiKd3cLMdsI5d5zmIqs8Zpw=
X-Google-Smtp-Source: AGHT+IHnCvCp+xq1tGI3ArJ6ViTY+PYeT7JnNVeEAe4ZbrJxfhBSFEIBXJggCl2+kXNhZMsIaMn+kQ==
X-Received: by 2002:a17:907:9721:b0:a80:c0ed:2145 with SMTP id a640c23a62f3a-a902a3d105cmr839070866b.2.1726253731882;
        Fri, 13 Sep 2024 11:55:31 -0700 (PDT)
Received: from LQ3V64L9R2.homenet.telecomitalia.it (host-79-23-194-51.retail.telecomitalia.it. [79.23.194.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d63bebsm898006366b.207.2024.09.13.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 11:55:31 -0700 (PDT)
Date: Fri, 13 Sep 2024 20:55:29 +0200
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
Message-ID: <ZuSKofgZbfn_n8tb@LQ3V64L9R2.homenet.telecomitalia.it>
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

Thanks for taking a look.

Sure, that seems reasonable. I can add that for the rfcv4.

I'll probably hold off on posting the rfcv4 until either after LPC
and/or after I have some time to debug the mlx5/page_pool thing.
