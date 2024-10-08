Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20A21503B
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728426487; cv=none; b=TommDG+ItkhzKJzsM+t+vB2k1Flt+mkMQez84BD91RnIajg5ElTxKENjT0k0hsoAvFOVzYFQsqvDI8qeuQsT9mMOhKKzGpB3RacCFH+3/hIj7K3dSF/g12Rdicw1CRgbhJMvTaJR4JdLlJYVMjdsdVvwGUTfx095FzdHaKwepYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728426487; c=relaxed/simple;
	bh=PeQ+3ZqZao8FTskqbH9VfwLkZaZ1/LLm/N0vThJthsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xawjsgm+KREBLU8nGMjCE/OKyglTtxmLauqZcqcCjweaJ7y0pjC12AMRoy9hXtdOI49LyUR8n5+et3rpHRja2FIK6m5126n5I9pRxtxhJt23Yk/qX3w207jft92ofWXT2TnSgi/OUgwvx1qAQANdkblntEo+xmMVo8lCyV7o4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=G4vtp/9X; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="G4vtp/9X"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2976fca23so446769a91.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 15:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728426485; x=1729031285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GpPyK5gRQWrst+Fyr+Lsx8V+lp2jzKPbwoFf+V+Wos=;
        b=G4vtp/9XxuXOyk84EUhUcPlEV5RmXOskkza4Mx0E/x+ObEIANVfRH2EzsGCbQZpIt9
         Bub+bhikT1AvbLSWiGU8v3nE3iL8a7/DiDb1fyoBmSs6nPBVaIYKB4A/+NGaF8foZW6W
         MuSkcJTkpD5lYufFmFK8vMMSZkH8ZjDC+9GXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728426485; x=1729031285;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GpPyK5gRQWrst+Fyr+Lsx8V+lp2jzKPbwoFf+V+Wos=;
        b=IRT9RxIgO6QNgKMsfRj4RrNr7hJSvKEgeWjJXTGQLUFjygBsGtBBV86D/0WbtA+n0u
         mxoTL4PZ40bI16RED9GNMmChPr166bcC9Y1r2oomNQAbkKpaQ8Q9bhP/uz4/VUhHormL
         G45wBuRiw9wMDZ0UYujhBt761dyLPXr9WneUiwd9v3RKeBWlV85HFAWCHjiQ2ASlpmMR
         eFIivbqbMwPGWVsn1S7hMutvTRxA8Ttg48smkiJnO4fIq97zvu3q5fPt5HpXHgtzgYCs
         URWGvUF+FFsQ8AzDVOx+X5P4FW/zj2+k7f1XH0z4Nn9orSAhqyI3ALM8vxqwtmGUW765
         Jt1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoD6RNrx4VYf/UsyOQ+aLJ5pMDL/933umF/eZpY25iY6PSN5HlWtWwJzmRj0NZ91VHiJNYYyMGQgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ05qKSus5yqk0xUG2rC5PHwbJCsxktvM1Dq79LZLJVgHC0Xmz
	EvI5+cPZPs/XOUE+7J94zI1xDHhZyhRbedL3bUqEECpmsTUhMaW8TNO/4QPzxz4=
X-Google-Smtp-Source: AGHT+IE1tXuqOdJ2//PwSHKA9ssLoCKqnAz9+E7C6N37yGYWDeMO+zE60t4b/4luCg6NBXDD2oLj/g==
X-Received: by 2002:a17:90a:db07:b0:2d8:3fe8:a195 with SMTP id 98e67ed59e1d1-2e2a22e6e31mr558509a91.4.1728426485495;
        Tue, 08 Oct 2024 15:28:05 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c139a32e1sm59872155ad.296.2024.10.08.15.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:28:05 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:28:01 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v4 5/9] net: napi: Add napi_config
Message-ID: <ZwWx8V1kQBDLFT6i@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20241001235302.57609-1-jdamato@fastly.com>
 <20241001235302.57609-6-jdamato@fastly.com>
 <20241008151701.6f8bb389@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008151701.6f8bb389@kernel.org>

On Tue, Oct 08, 2024 at 03:17:01PM -0700, Jakub Kicinski wrote:
> On Tue,  1 Oct 2024 23:52:36 +0000 Joe Damato wrote:
> >  static inline void netdev_set_defer_hard_irqs(struct net_device *netdev,
> >  					      u32 defer)
> >  {
> > +	unsigned int count = max(netdev->num_rx_queues,
> > +				 netdev->num_tx_queues);
> >  	struct napi_struct *napi;
> > +	int i;
> >  
> >  	WRITE_ONCE(netdev->napi_defer_hard_irqs, defer);
> >  	list_for_each_entry(napi, &netdev->napi_list, dev_list)
> >  		napi_set_defer_hard_irqs(napi, defer);
> > +
> > +	if (netdev->napi_config)
> 
> Could this ever be NULL ?

Ah, good catch. I think this was an artifact from a previous
revision where it could have been. But, I'll double check.

In the current proposed implementation, however, I don't think it
can be NULL as it is always allocated.
