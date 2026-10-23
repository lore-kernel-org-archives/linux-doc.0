Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764742;
	b=D534/30HNxiQG1MSOW5MeNO6OxQjI/k+f4mISa+moLovi1oaPGN3+gPF1JI9W0nnIFU/
	 sDs41KbMfBO8bMzR1G1K4mOgkkrodVM7bywRLG39SDu5sn09r2zhpes981P2dM40R+0j4
	 tuOeOOYwJtG4tXoazEjkUgT/cGdHb0HUse/xsHywPhuTS5x3YQ81D1kN1K0Jo5/uk/20E
	 lUACSQeFzbQrRALufYe3LrHs9IjwnLFvDLleUGBxlkUA1PowdQYO327YFkeG4EoETAE1F
	 98f02BK+v0EJIubdOIJwqvFtUA0FkAq66erPU2TDaIgSkTTrh86UxjD2s7333WZgeCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
	b=AwpcpSiLKDfnlL/7Y4KyWcXmLTLmqbOxHU4yAbGbx6qOfSBmjUKK5fjauOXiWxYyoHa6
	 KSuZtUyElxeIDgfmoy048K5OD1I5TJQdeZrit2ZfVQWFxzp5LtFXq8agpJeNsFwG/KG+5
	 9szzgpvSv6YeKnCX9wDBj7Z2N2h9HIcXOULx6qZb4QCn77QUGTe1LwmLYYlrnkuiAP8Fo
	 cFnzrxaMxKkzLipo/NaJaCR5j8Ac9BrK/DbBzi76NdLBRB8Dh7fS0rSHSsPaKKrkeDPhi
	 odavQgpoZF3SASu4IoktdNSKT4E8Ld8MOXRVLmuCGDREiAg+JB2ZpfgMrmiqyXdpy5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJJ6FvlZ;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15846606A31F
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 14:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15846606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XJJ6FvlZ
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e503815adso98283285a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 07:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792764741; x=1793369541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
        b=XJJ6FvlZqxo85XzvMv3kvaZAtfiHwhOx8sBMHh97IiPVXdiYFm54L4CeUcxoOzzNvt
         gW+kVZ5P6SiTD6i3qbbWqaK7N3DN+3iChx5c+N5ynHcYMSMfW3HvhvT9ZIl7yY4FD0Ix
         OcxHouZP40lKVsKApA5S3figCXfZVQ5fGlQRJfyQnR1vO9veiYbbk+xedFHTt6HtsYeG
         7tA0YHNoXFR4ZshrmdNr6q3G2SLk9NVJZ09vuF5/ocFe5M8xR/jCGR3A7lq5V/cGI/X3
         1M54/n3yKnC/wLHUP/du9/EMWrxSUFPTjcDMvQYzNxQaB0/Cg4NMgodVwBAx3xXhzQjm
         XA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764741; x=1793369541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJA2TtslEJ+KdyUtrabQXqX04jIwVEOHlYhkzmtq54M=;
        b=qMx6w+3ZjjjDWNOYI5akjtXtLOnpCvHr/rNdut1ywsi5eRlQPbBgcONDQsDx1F3FSW
         7VpUYha3OAEcgC0JpwXUzfS6YfVmbAKOGAuFkhjzNNP/FZE9dtVW4GAdcFohI8wvgwmY
         Ut2AVuzVmlk6aTWIGWpmq4Aqaijrlc6eTP6Sep1ioHceX0jIQW6Zmq/KFbh00kknnXu3
         QU1a6UAriHuXWYMoA4kXczPROuUfJTuSZ34vGKjcTRzORL+aT7Cq7c3GglPVW2xILeTl
         lBJEtMlbLGTAX/zeNRyKcDnbmawjtfCLPTUH98+YoF1UtvO9M0mBIVFQIFNMgHukUaac
         DI0w==
X-Forwarded-Encrypted: i=1; AKwUvBxSJiiSOtrhjELSvVy1dKZ3RjtZLHdS5KHg7uD2K+ACiF3UocTctNKen+V/KlzX8J2BPqkHddHFSl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhfBJ0UX/l2HR9bswGifzmTcAYyOmZJRchz1Q//5xrIVNRYc93
	JuLSfuGdCHWcsCa3jCee6E3kaHiGLDTB2KKBJ9USycVXK1RfRh4IXvDdkVR82L7F8X8=
X-Gm-Gg: AYBFou3bc6MubZpt9SFRqLhDrvuylaBIxQNMMFQgZYssqDi8Lk8A0xEw5KWrSgTdZnr
	F7rzS8DZfIi4S06NKCaSdKApVNS8eB6fPvXj9/RVZnz9j8s/R+Ln6tnJrUOybL4OEUCtCQexVmA
	jguLLCVlbLZJ5YM6eo2pjh81c1Qt9gO/GISWeAOnG0Wp9RCWXbmuUZ+Bi+Bwl9uqAKdPn/BJP5L
	JciqcxeB4lhD9Ycne+Ty6Wd5+7602JW9oPTXCnp6bI5HsAjKQjfjzboPybFO3J7K85Bef3h6wfY
	vhKyHz0UA0sQWLxx71NX7vIAQnfeHrixJh9wWQ8Fi42al0GvgXjpQY4Z2Ij398QuGsw1BDEOjVK
	SPTO6IrpXbLDH/pJ/JefxxnuO1oAWDc+YP7hdtsBOQlyxakTqnhI8l0Vy56grlBno27ud4eSUxr
	WT4gRnJ0w6/WnbGG9gOVnzLIkGXf8yjfKwEscM26D0wFuOMZSDapgOzOGLt1RcHJHXKm226pNIG
	/JSYpk7KxR3RsGsMyBmhtxzoiPzOLG7CjNcQ2JRz8fGhQO7uOXa2nR+WX5/mk5dxr4m9kuwTeeQ
	hWGpYecUo28jPGAD1LtquLRzqCOWVIZ5XpGxhA==
X-Received: by 2002:a05:620a:280d:b0:93f:53d1:54c7 with SMTP id af79cd13be357-93f6f8249ddmr448815485a.70.1792764740975;
        Fri, 23 Oct 2026 07:12:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94047b32ed6sm25764985a.34.2026.10.23.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:12:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKG0I-0000000Gigv-2y8C;
	Fri, 23 Oct 2026 11:12:18 -0300
Date: Fri, 23 Oct 2026 11:12:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"Fang, Peter" <peter.fang@intel.com>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261023141218.GD3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
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
In-Reply-To: <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>

On Thu, Oct 22, 2026 at 10:07:28PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-10-15 at 16:50 +0200, Jiri Pirko wrote:
> > Connect the attestation family to the native TDX service. Expose
> > TDREPORT, Quote, MRTD and RTMR operations while preserving the existing
> > native interfaces.
> 
> Along the lines of some of the other commenters I'm not clear on the benefits of
> the unified TD/VM attestation part of this.
> 
> Especially when you talk about a TD report, it is pretty specific to TDX. So
> calling user code is going to need to know about TDX anyway. In fact the report
> won't have all the details of the TD either. Going forward it's main function is
> to serve as a nonce transport blob and it only has TD details because of legacy
> constraints about SGX based attestation. So just a quirky TDX specific part of
> the flow on the way to get a quote.

I think in the way this stuff ended up being used the userspace isn't
actually aware. It just wants the VM's ROT to sign a challenge and
forward the resulting blobs to a remote verifier. The verifier needs
to be aware of the format, but the collection agent should not need
special knowledge.

ie from the perspective of systemd-report it doesn't make alot of
sense to have it know every single special configfs path and protocol
for each CC vendor just to get a 'sign my challenge' operation.

That's the general north star here. We'd like all the vendors to be
able to do collection without having to change systemd for every new
innovation. Again I'm looking at 5-10 ROTs in our platforms, it is not
desirable to go and teach systemd about each of them.

So broadly, this requires a challenge to go in, a signed blob to come
out, possibly some suppelmentary blob[s] (like certificates), and then
labels for what is inside each.

Userspace would collect all the blobs and the labels then ship them to
the verifier which has to understand how the data described by the
label is organized.

I don't know what "nonce transport blob" means in the future, nonce
without signature sounds like a strange thing.

> One idea... Not sure on it. We are currently working on support for DICE based
> attestation for TDX. This is an industry standard and AFAIU other vendors will
> (want to?) support it too. Perhaps if we could have a single way to ask for for
> DICE based quote, it could make a cross vendor interface more useful? Callers
> could just call and get some standard format they can understand. It might take
> some work on the TDX side to ensure the DICE format quote.

Yes other people have asked about DICE interfaces for other ROT
devices. AFAICT DICE is more about having a standard data format, and
you are right about everything..

Like SPDM I imagine a set of interfaces defined by the DICE specs, but
we'd probably still want to have the basic 'sign a nonce' interface
for opaque transport.

So from a TDX perspective, what would you want to have as labeled
blobs for this kind of operation, now and later and maybe someday with
DICE?

Jason
