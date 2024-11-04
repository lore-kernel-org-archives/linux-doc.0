Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA91C4A3C
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746275; cv=none; b=XQWiVJjF18qYq+041IFjkAspDRPtPjswKuLGpgm6aQgPATRbjIEJ0PHm4GZv50M3eSZvFQFGqENbr2x8HNS0OR2nxpEf3hMV7RXYcjwfkqsltW8947w8/8WCeiU8jV9QZtrJa6amjyHgo/stnA8qzV5m6c+DccrUMSE8KEbpvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746275; c=relaxed/simple;
	bh=i+JUo1WbG9fBZEzMBxei4ZEoysCHsSLRrRJGVjEMQvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwqUIt3kBUTTG3nnuutt56u4xstuCB1s5BYExDyveWlAkPbK+7qla8tig0sZ0Ds6R7TVBRRkxqjr1x3r42dmxEA+bBHode3tqv98LtLW+q1Oc+FgxJ1VHlda8Rl4H2JSdSDsa5kKEV29dq4O+3earl6dvxl+NLBKYWJSphaZh2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=pRrGCkFq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="pRrGCkFq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso3498346a91.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 10:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1730746273; x=1731351073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWJfwtCH7EJrpJfmQrqLh3OrqN5mIv7D0ga+Lf0aVEw=;
        b=pRrGCkFqAdHpzg8NHknffTNpV2qViVALW5mBF4+6xzYj6yapNvbo8XsJMkp8F5R8Zr
         3cnNpWu77qX+lElwFvfChOMITdq/tjtzWFqDk5jZGT8OhraXJ6ha2XeAfJLyX5TMMs0j
         jAOtjK30OCmBaLD1BGsQOLvmss/C60dPMvfeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746273; x=1731351073;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWJfwtCH7EJrpJfmQrqLh3OrqN5mIv7D0ga+Lf0aVEw=;
        b=AuIDdKt++f7jjEGxSDW6ouEY1bG8YcRsZ+fkpGMosxrDV0n3V2XNMTJ4/n+FwCjdxm
         mvx8zGmjXlsc5kRaU1fKwskLs2CDuVhaXGz48QrE2Bz/tB+ql+EFCbmXt2/tgrB2rj5r
         5QhZglYdRXSfMsfxgcOXuaN0IWoYHGpp6VYVQFwHWbhIfstAiI+RE/b02KMY3I/0+6WS
         lqdrD/LSPvuZJbOMq2b6xfJym7MiasXfZzB9Hvz50u/xgd0OHoroXAKkENyKNOpECK01
         VMEpGB4RZnnLm/vFNHfldVxQq9JfAwaAO1Q6qPTgqORp8ccuWMWDMdpbTu4a5KmY2sfl
         /B0g==
X-Forwarded-Encrypted: i=1; AJvYcCWg23acNQOiH3e5ANWnxD827MLWUtPDFn+Z0/SALzv35VZThkqEg6CGATdWsNeQ3R3xMTmmorX5gys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlms8mlITCDwyWkdABYFmBWn+Eo08z165X0WC6BFckBQdJJzK
	exJIFkh9I9DGMbd/SNAUKZHY5X0SNOLMjh6bybmRkfYfrJT98NCFauEAmTMZkDM=
X-Google-Smtp-Source: AGHT+IHWOygf8u1N20udthJq/ON31qkCTfTapdoM6eneR+DaWGQ7PM5fmjk8Rm84lqYDYvD8FX9TbA==
X-Received: by 2002:a17:90b:3d87:b0:2e2:af6c:79b2 with SMTP id 98e67ed59e1d1-2e94c51c61bmr19532397a91.29.1730746273096;
        Mon, 04 Nov 2024 10:51:13 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0eda6sm10277879a91.4.2024.11.04.10.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:51:11 -0800 (PST)
Date: Mon, 4 Nov 2024 10:51:08 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org,
	hdanton@sina.com, pabeni@redhat.com, namangulati@google.com,
	edumazet@google.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, sdf@fomichev.me, peter@typeblog.net,
	m2shafiei@uwaterloo.ca, bjorn@rivosinc.com, hch@infradead.org,
	willy@infradead.org, willemdebruijn.kernel@gmail.com,
	skhawaja@google.com, kuba@kernel.org,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux BPF <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v5 7/7] docs: networking: Describe irq suspension
Message-ID: <ZykXnG8M7qXsQcYq@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>, netdev@vger.kernel.org,
	hdanton@sina.com, pabeni@redhat.com, namangulati@google.com,
	edumazet@google.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, sdf@fomichev.me, peter@typeblog.net,
	m2shafiei@uwaterloo.ca, bjorn@rivosinc.com, hch@infradead.org,
	willy@infradead.org, willemdebruijn.kernel@gmail.com,
	skhawaja@google.com, kuba@kernel.org,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux BPF <bpf@vger.kernel.org>
References: <20241103052421.518856-1-jdamato@fastly.com>
 <20241103052421.518856-8-jdamato@fastly.com>
 <ZyinhIlMIrK58ABF@archie.me>
 <ZykRdK6WgfR_4p5X@LQ3V64L9R2>
 <87v7x296wq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7x296wq.fsf@trenco.lwn.net>

On Mon, Nov 04, 2024 at 11:43:17AM -0700, Jonathan Corbet wrote:
> Joe Damato <jdamato@fastly.com> writes:
> 
> > On Mon, Nov 04, 2024 at 05:52:52PM +0700, Bagas Sanjaya wrote:
> >> On Sun, Nov 03, 2024 at 05:24:09AM +0000, Joe Damato wrote:
> >> > +It is important to note that choosing a large value for ``gro_flush_timeout``
> >> > +will defer IRQs to allow for better batch processing, but will induce latency
> >> > +when the system is not fully loaded. Choosing a small value for
> >> > +``gro_flush_timeout`` can cause interference of the user application which is
> >> > +attempting to busy poll by device IRQs and softirq processing. This value
> >> > +should be chosen carefully with these tradeoffs in mind. epoll-based busy
> >> > +polling applications may be able to mitigate how much user processing happens
> >> > +by choosing an appropriate value for ``maxevents``.
> >> > +
> >> > +Users may want to consider an alternate approach, IRQ suspension, to help deal
> >>                                                                      to help dealing
> >> > +with these tradeoffs.
> >> > +
> >
> > Thanks for the careful review. I read this sentence a few times and
> > perhaps my English grammar isn't great, but I think it should be
> > one of:
> >
> > Users may want to consider an alternate approach, IRQ suspension, to
> > help deal with these tradeoffs.  (the original)
> 
> The original is just fine here.  Bagas, *please* do not bother our
> contributors with this kind of stuff, it does not help.

Thanks for the feedback. I had been preparing a v6 based on Bagas'
comments below where you snipped about in the documentation, etc.

Should I continue to prepare a v6? It would only contain
documentation changes in this patch; I can't really tell if a v6 is
necessary or not.
