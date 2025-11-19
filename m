Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFF235772F
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556543; cv=none; b=apQSE/r95LtOa7DAH+nmD6V/qqAPJXgWSFskGo3fdgWp+d7zqwsKYQ3QG/GCNB2YGipBZO4lafL69RITB/dBC6TvLlkNw5m7kjT28XkcFsJ7fVUD4Wpz8mIB9x9J/AR2ncbR2tGLImnWoJYN/o9C2I1EqmwzA4FDRN8tCx7Y7fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556543; c=relaxed/simple;
	bh=UZNBewuvwkPWj+bu4O3n8vX8SbsHsZYXgD064ZW+wME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWj9lf9qcXSt0cE1xfvh+wN+hC4r1bTLp+o0imjCg/LsKFgBkW9q/AaaGTPSxfnridlpmaF7E4MiJxQa1InEiwsQpEydOF5FkUZ2OBASQ0DkEJDSZpuXVvxyUUokwkvGBK84unH/ubdpHG6nRRyfpBZSLjqQAzxd83drZ8azqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyBNZwEk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7C/e5Ox; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyBNZwEk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7C/e5Ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763556540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=efzFAXa6AqvKlr68xmTUgqr7OrHhr6l1HfrVAauk7zk=;
	b=XyBNZwEk4nm5xu8Yv7jWIJ/bNwmTNI3iLJ5GtfGLmr3CQ1uu36W5hfNm/vUytmf2Rj/3RQ
	/F8MMMGYrS6Tr4PtgsIqo8fc1QpsNBJSNeEt8Mu+TZ/6nAyxarHPA7tY+KK8e489BYw+by
	vEvuO8js/hzEO7r8ZtWVWo3kNUEwheU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-XW8bXk9LNmqkkpoC6T4Q7g-1; Wed, 19 Nov 2025 07:48:59 -0500
X-MC-Unique: XW8bXk9LNmqkkpoC6T4Q7g-1
X-Mimecast-MFC-AGG-ID: XW8bXk9LNmqkkpoC6T4Q7g_1763556538
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso40958515e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763556538; x=1764161338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=efzFAXa6AqvKlr68xmTUgqr7OrHhr6l1HfrVAauk7zk=;
        b=C7C/e5OxFboNzS8m1t5dKea5dZs0Nqemx5VNAyS4V2udOfYctUTj2De0vzprMRklfA
         n3w1Mgd3TzD+NnHKap47yfCXshuADswNZhBjdS5qSODybS5FAOpg6k9f31+v9Mog2g9A
         YHqc3dmZuEZ0SSZocHliCffdTUluxvJ+/3rHUi6olkh/k4BhILq29ruCCEphYB4ChMtz
         ftlIA1IXwMgRJoIWAWH8U6pK8wcgkcZGxdr2uZfmWFIs/zfWGAWckGcvF5U1dYqmLryG
         UQoarNVJZbwkOtckDW5yHCMhPJXb9OCo1yUfjTj3TvrtncLybSNM9tNlI4NdGpBUnSjD
         +OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556538; x=1764161338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efzFAXa6AqvKlr68xmTUgqr7OrHhr6l1HfrVAauk7zk=;
        b=ndfvIWSjDvYUj2nCouA6nB7ywrBrIMUwyVJb1C7746nZoPHQlrHHtk4DZ6caI/F/xq
         9jQGtRNjFbhdzM82eNRdS+LEdcUlmDmvuNB0x/6D4JLzvk1VEjpoujw7kn01vJFoV2+b
         xldVG0Zy7cnrrHozA4MEkAzeXjDWm3ulDnliuwiVwz1n/+cA1gMqp7ORqx2vJWtUn614
         LDMcOHk6bpBldSySAEnt+Q8WeuZINtWz1M1oGY2cF+KwlqMZzgVDSLKJLucFglLFfIj+
         ge2wpZiOLifokDF8eBPy9GnJ5qtg+Rh6Pkfov2wX6txeXbK/RTa5xT6iJbtl+knUFpoR
         1c+A==
X-Forwarded-Encrypted: i=1; AJvYcCWf0btcWChVtLsAIZypg3Gafha1wzRK1qKOKIyt1WE958dm8PWSFvA4P0ndqnpd7X8U3dgRhzlt0I4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbfg3tS6cpTYEU/pQSvqGVpsibg274vNrJgfKF+CBlT2K7KzRA
	P70mpxHLH9ZHyV83rHwtsDH+POzoVLU8zKGde/3bE4IWGHJGYHSEv9l7HBmnyQchw1+8j7p/3Lf
	895lihKcNzhYoc0l4eFvMqqV6MeEQzfQGocpaP4yybRsn+vbdjdz5+X+qNgqXNQ==
X-Gm-Gg: ASbGnctP88Z5VmjffmemE0t/ldASF+mU7UZquawlzRSHRbYg5/WtdqvzA5Td+ZxYv+q
	rnHpXEKPeDz+Lo19uJe5crSOsfzOMVbl12q3+ojumGy/TtXTMrexpbwpTlUMrKSMBVpbY0gXf+6
	y8VcUQiGzJ7oin2Kif0DIer1jrkCCk8MVm2sNbCPVcB6jYputGsALkXugX8WBzCbckUCxEObm2/
	l0GnDov8PE38N7kTS3d7dX3RthZ647ZfI5hQvf0J81R41Iks3yxrNq6iQlLJYq46gkIVlhHqDzH
	ggkSB3CatVEjZqU5QNTttS2YMHuf8K/Ra/06Nqno5CtDtXbH2jP6aqaDJJFxdds6urmihgE8Veb
	oyhU0yFDJahuVVQCvkp/CkKq8743daw==
X-Received: by 2002:a05:600c:45c4:b0:477:7658:572a with SMTP id 5b1f17b1804b1-4778fea84d9mr173008245e9.20.1763556537876;
        Wed, 19 Nov 2025 04:48:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3vS0uApFcgFVlL2gt/R9GTQH3kJDQoD3RSC3xgY4lk5mLnK8+RM+7y+ofmIidRok8jpEiHw==
X-Received: by 2002:a05:600c:45c4:b0:477:7658:572a with SMTP id 5b1f17b1804b1-4778fea84d9mr173007825e9.20.1763556537409;
        Wed, 19 Nov 2025 04:48:57 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9e19875sm38753245e9.16.2025.11.19.04.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:48:56 -0800 (PST)
Date: Wed, 19 Nov 2025 07:48:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v5 2/2] vhost: switch to arrays of feature bits
Message-ID: <20251119074746-mutt-send-email-mst@kernel.org>
References: <cover.1763535083.git.mst@redhat.com>
 <fbf51913a243558ddfee96d129d37d570fa23946.1763535083.git.mst@redhat.com>
 <4204ed4b-0da1-407f-84e0-e23e2ce65fc7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4204ed4b-0da1-407f-84e0-e23e2ce65fc7@redhat.com>

On Wed, Nov 19, 2025 at 12:04:12PM +0100, Paolo Abeni wrote:
> On 11/19/25 7:55 AM, Michael S. Tsirkin wrote:
> > @@ -1720,6 +1720,7 @@ static long vhost_net_set_owner(struct vhost_net *n)
> >  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >  			    unsigned long arg)
> >  {
> > +	const DEFINE_VHOST_FEATURES_ARRAY(features_array, vhost_net_features);
> 
> I'm sorry for the late feedback, I was drowning in other stuff.
> 
> I have just a couple of non blocking suggestions, feel free to ignore.


Oh this is really nice.
I did exactly this and the diff is smaller while the compiler
was smart enough to figure it out and the generated code is the same.

Thanks!


> I think that if you rename `vhost_net_features` as
> `vhost_net_features_bits` and `features_array` as `vhost_net_features`
> the diffstat could be smaller and possibly clearer.
> 
> >  	u64 all_features[VIRTIO_FEATURES_U64S];
> >  	struct vhost_net *n = f->private_data;
> >  	void __user *argp = (void __user *)arg;
> > @@ -1734,14 +1735,14 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
> >  			return -EFAULT;
> >  		return vhost_net_set_backend(n, backend.index, backend.fd);
> >  	case VHOST_GET_FEATURES:
> > -		features = vhost_net_features[0];
> > +		features = VHOST_FEATURES_U64(vhost_net_features, 0);
> 
> Here and below you could use directly:
> 
> 		features = features_array[0];
> 
> if you apply the rename mentioned above, this chunk and the following 3
> should not be needed.
> 
> [...]> diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
> > index 42c955a5b211..af727fccfe40 100644
> > --- a/drivers/vhost/test.c
> > +++ b/drivers/vhost/test.c
> > @@ -308,6 +308,12 @@ static long vhost_test_set_backend(struct vhost_test *n, unsigned index, int fd)
> >  	return r;
> >  }
> >  
> > +static const int vhost_test_features[] = {
> > +	VHOST_FEATURES
> > +};
> > +
> > +#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)
> 
> If you rename `VHOST_FEATURES` to `VHOST_FEATURES_BITS` and
> `VHOST_TEST_FEATURES` to `VHOST_FEATURES`, the following two chunks
> should not be needed.
> 
> Thanks,
> 
> Paolo

