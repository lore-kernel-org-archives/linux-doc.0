Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1459357A2B
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555708; cv=none; b=eVDtB9pEdKOQvFKw2G/bBMWhIEiIjtmvH3Rnc/ZxF2NT+eXtLFPjfEVUsTCOw7QnC6BMM98MfieexuKCZ/bj/hq7oRtm7Dt8/Lx889v5zlDwyWmOJ78uWN3XQB9oToisF/dyuPthhgJCsxusNXjWKRNOP8NBSMIThXUXOhD58Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555708; c=relaxed/simple;
	bh=EPmrUepgE1rgeLfHqD5slhvdiL6tMO9t2cr77eQyKts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYtvKDNpdQDU1NDWhLUun5dqRPJHIhQOPGqllTRcK6abUCDOY8f3/xVQiXiV7HHWq7G6CvuY1HXScGNq3Chs2hzs5YKQsrzV1wNgEkLKNl9fShM281eGwe9eaFOvBNHnp0y+JlhWo7xVzQOnljz87hHF6VRKFwN6kxX6iIAEtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PRs/DYzm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OpFj9bVR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PRs/DYzm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OpFj9bVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763555704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cX3V/Maq1P62aubbfEZMkx/73yOAMpSFaKpbQ5l618w=;
	b=PRs/DYzmakzqK5zZQGM+BoF0Zq69o69LYryDA5dH90NO7zTw7o4r1ernadGKJeIGZ5lH21
	OBboVYCbe8pq9PCDnwBBajjWJgH9SJHV6qlUtDkvJIDe5pdINlwsdc5RC1A1br3DeiHQGT
	YQoCjl9Ipt44e5eHTk8w7xnbwFuRmzA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-r87JA6azMnW4Tzrf8GIC2A-1; Wed, 19 Nov 2025 07:35:02 -0500
X-MC-Unique: r87JA6azMnW4Tzrf8GIC2A-1
X-Mimecast-MFC-AGG-ID: r87JA6azMnW4Tzrf8GIC2A_1763555702
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b2f79759bso4653555f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763555701; x=1764160501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX3V/Maq1P62aubbfEZMkx/73yOAMpSFaKpbQ5l618w=;
        b=OpFj9bVR2mnYp80kl8qp0X6YeSVRM2dAHTCcC1DsYOSQ2eyerDU+3vcQ5IjDq7wyup
         hUTOfNO8BCEusKNg5gqh4iopxldMu1KqiboKz89gT0luKEOfn6odTAMAjlXbhXqZS3RO
         pK0neFXyiZ/MUOhi0CPj5KMl+LZ10VfX4oayFir4/a3gOXd7eHB7QZlsRKhlPMcpGBXE
         UVMYUHIUZVH844kPNz+mZOXVk+ARphTnI+ISsnIQm4O7Jsdc8afWCElJWhLOhjBP3gPy
         NYko7Ezka0T/FTcjMqB+D+BRI50On2hFvn3quwTx/7rirQo2IoCzmJ+sekm+rm2GDaVB
         xiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555701; x=1764160501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX3V/Maq1P62aubbfEZMkx/73yOAMpSFaKpbQ5l618w=;
        b=TDI7fCLT34juour7wk+WkLxao+79LNYgmKkZZ8NO2B9nMzhxGJDQ/dyJaFAFwtUP7g
         h8B6ssJjz+kC0d2Q+hPsQYvMbYKiSZ3khw0FOLNQlyPwSAxhmjrAylPvqbZ57i6sFtsw
         X4mjtXD+vrKiLw18o+3xc+NVOd/8+8GrNLLJur3c3e193vMcX4NTM8ggfIm5rsWFSEH8
         HcFT4rckul3as9yucclcFax4UJRbwBU5P9e//ObfGKHs5aSjJ1pJvJZPNmCi3ajIZQq5
         RDH/ccQv+ITumR2eH3GziFNmw/zMd9NUCTrHSU+icnPm1/WUbZ3iDvG2GNXR2srflTYo
         L0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXxztouZcco93l6PoKekFlyphfTDQPlLsV+fSd+gLRPi9/w0v/M1VFHMtTMrzpOyASr66XcTkvOzrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRxgyPhaw/EI1m4yyFesTyu7WfKMFF4zY5jc6lmR4F6qMCwCn
	U2hmDwWlJL9qr0ZAzUiSpa7m/gu32cgMT0Jb8tQ5Tm04KFHErrTjLXptJ7GVgtKSJtEamu4Y79a
	GJEQrVMrvxuN2p9uR7B4YF4xpa9naaIbqqrdVG/NzSvObMeO8yM2jgi7xhxDZWA==
X-Gm-Gg: ASbGncuK6wKtHJ6KFnYAXdTxTzDl464XPJadAQp7+lX1faZGAceqxXEvWLSjM3cXDan
	A+GE44R4W4Sk5tnJHyoPwnoDpxcwn4rUMTLGRsbdNQ6/DMlHfLj43/x0Kt8Wd4bpvg7or/IF4IQ
	moYS0QMLszhKQGFhv0C60gL/Ax5uKgCX4FCaHuFsfgxm9df+2ny0XVe5RZAcf7t3EdLLTQUvpQc
	ODVu0+onXI7keYRElWWPidhKQ2VZ5tZZbwJhXxtby9lsffJ1MV8CXmwbTBmRe+cMgHUzXMOhB1i
	UpBJqI+23b8qShbUbBXHPkygY1/vTjjN/Y3dS5TmKNQg4j4fISSqvE/s5d+ybWXPSD2xsNxPdf7
	WUc1EkTeqYEHDFl0r7HFpS10DPcM1jQ==
X-Received: by 2002:a05:6000:2c05:b0:42b:4177:7135 with SMTP id ffacd0b85a97d-42b593721efmr18718645f8f.41.1763555701526;
        Wed, 19 Nov 2025 04:35:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZDtCaU9W4jbuIEbB8KCRjqHZi966/jHceca8fTLxnbGRC0wWJ1uQzXqWj/dl06f43gIEXkg==
X-Received: by 2002:a05:6000:2c05:b0:42b:4177:7135 with SMTP id ffacd0b85a97d-42b593721efmr18718600f8f.41.1763555701078;
        Wed, 19 Nov 2025 04:35:01 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f174afsm36933997f8f.33.2025.11.19.04.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:35:00 -0800 (PST)
Date: Wed, 19 Nov 2025 07:34:57 -0500
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
Message-ID: <20251119073155-mutt-send-email-mst@kernel.org>
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
> 
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


Ah. Good point.


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
> `VHOST_TEST_FEATURES` to `VHOST_FEATURES`,

This one I don't want to do, people tend to copy/paste code
and this is not what devices should be doing.

> the following two chunks
> should not be needed.
> 
> Thanks,
> 
> Paolo

