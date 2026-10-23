Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792792912;
	b=C6uXKJXoA+VGd50rj/tcEwiixD+QBO2H4NeD0MmVo+bKzih6ElznfLLoGxj4UV/t9dSw
	 Np1Z6yBYJb3EB5eXXKLRvFEiKLb2POUWANukotH51t5zGDiSHdpyXXweUPMHAk7HvneH9
	 nx4X8DYWVSWr5+tNR87YABvIBZWwdNtzjWA4SvfDw+VgSSh/Q14LoHjJnSi+PzmQnmdIi
	 5HTvPKzG3cK2LEJTtPc7cFM3hfF+yIuCYzMp+dxiNepWsaMEDBb/+F0eeD16J5H4EOupM
	 VJn99iZRoqaWimlf+cuD7in/LJ57oabQjksPn4lweEdIOiDLK0WXyz6e/RzVCwxhuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792792912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
	b=y+Hxq8ieZ66pyjGUcTYtiKQavHhS0WTiQ1S1JwnaBOtkVRL2S+5eegopFXTJsfusSqAs
	 dX8Ki0GIicPpLyvgbpfW89Y1/aJ4od2WaXpyTz/2/9OTcKZOqukSHayEatlM7otWcrEDc
	 SvyVyB7vmFP2DjD1UEn4AVCY7InuXPoElSJYR3w4M14Fy9iw0ui+4oNiTOZehZvsbFc5N
	 eKqwhDCaufD828F4DxUdHqeg/Eh52lJuvW1Qxx1F3E0ita2fC2kq5yPJdyvWmX2+vw0a+
	 4Rad6lH5WmQC1IUvBdPcaMkHtEmYFXQ3IgoS+J/tMFCZ+Co0hHD017ou3EZSrVw/EBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA401606A31E
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 22:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA401606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H2Nk80SC
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e4c00d71aso123549585a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792792911; x=1793397711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=H2Nk80SC0IE0suPURnYr9e6hZbC4LBCNbP2UbticIu/vM5Zx8lZxl1WF9oIVeOGweJ
         W19x63RIXk3jCkb/8AZ9w0/6q6ZaY29bsZqX8VJh3ACjKIAi6gixXOH39qqPhJV0UGZD
         h9hrX7AQMBlOV6X6RgQiCpuKPLs0LqoIe0SH9hdfWiIr6eNHUZFFbT0I/kCisS92xxMY
         Ucn1ZlEpvxoCWlvTmp2e0dWk4YFXYfROdABgbIgP0F4SF8jcDI2aMT5TzMY19oaj7RhQ
         ktu/3+o+78VzxnRBhNe+IMPeqMjRjTTMOSsOLuA26L6BAOJT0HaC4+T4MRB1PHDXmGMo
         Ignw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792792911; x=1793397711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bRloCtYRc/1CN8Q7Hs9aasGSanwrF1DkhN4CIO4rT0=;
        b=OovSKsh9d9suw7znbk/Qia4vSrFODggIytsaM+Y4CIK0QnnDWbmLTAZr8CebA7fQ6s
         TyWtaBQFB1fb79PfyLe13H5N7NHEHIxmuWRCSRZDSKKiVBlIpKEESZua6Nq/OUNsUG1A
         UuQFdEtk3su4UNt+7OncAEzUPygIHNfXh6suE8v80DMvBxmCz7YmD1cn3lgb+f2RM9xa
         vm6PKCCmo4eD/S/3MIsYUKAyFe1AKBq8ZuIXnI6h/4DU0HhF8WHbu5l7Him5srf/GDDh
         q2S/flJgmAM1YWyj1r93Ai1yg5h8JVdbbPRU9RazgCRbl/9abMVOn2RD5abCBh4otM/s
         skwQ==
X-Forwarded-Encrypted: i=1; AKwUvBydTjaSlI0Xv8KSgIsOUGPZbnt8uB2TQj96xqSIFdSMg61yENgG/kz8GqPsbr4YG/aRo8b8riJ6p7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEjUeHkBSWMqpvrs8oQXk6TE08ENt/s8+7VWh2U3Gqa4Wwvvi0
	RKdvdWEREIkQQHcs/9xS0+3g17FQ7oJpndGuweM9H8ou1obse25PlrhkKAzum4rfUdE=
X-Gm-Gg: AYBFou3OOwbAd9T0g9hQqtAD0jdcD0barp4x8lhQjsKdXVrRALjVk620UWV0aA+wMxE
	FkRX+3j/ppBDLUbHrb3s0/zGkPCG8CLfVwkuZOSZP0FWwhBxrO7R6n65cl/GKodgkQQhmxNl6uk
	tx5c8Zx4korbcxstK6Xrr3WYEiquBiuHyveV2vDpL4rjLgG+c8emTeFukw7pr5bwqvZpn5yfNm5
	QCsd1Pv1XA5VB96h+Ay/NFbFph7LxnDVzvRIVfXlWijXyjvxN3Yz7Iw01361+uKUDd2wrn7JPZt
	9dhKG0OrQ8DO8JqpJ4GPVXZYHE6MP0l8m+E0/zT2Meuz1VKjpEE6ux1pVdiZxDZqS49oESQOa6t
	9xFZI5NGYW6l52htJvaNAWMHkYrPqLbszlNQZHWdNO6xsp6WV0V6zHWgQ236DlyPNLX9XSrzO4d
	DQh+dxs0R6dtWPf18KDMxqUbwd+b7jnYjs6qqM5lwe3p1HKRUPhYOrOb/biyJ9o9GGG2T2CsX3h
	wKsEoYi5tVxN8tVh78V3KvPYXcq9DrmaeKRI6B1PdQz4K1lTh7tB3LHXgNH47pJnS9YMHmZ9HEN
	Jq33zMZLTju/fb+wtuH2Hx/T2H4syo4tHyNZYg==
X-Received: by 2002:a05:620a:4441:b0:93e:c12c:f137 with SMTP id af79cd13be357-940ef9c87e0mr54142985a.82.1792792910841;
        Fri, 23 Oct 2026 15:01:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f078a762sm18520585a.30.2026.10.23.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:01:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKNKe-0000000H7Vk-3jIV;
	Fri, 23 Oct 2026 19:01:48 -0300
Date: Fri, 23 Oct 2026 19:01:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023220148.GN3977851@ziepe.ca>
References: <20261023190036.GL3977851@ziepe.ca>
 <20261023201531.GA2805244@bhelgaas>
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
In-Reply-To: <20261023201531.GA2805244@bhelgaas>

On Fri, Oct 23, 2026 at 03:15:31PM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 23, 2026 at 04:00:36PM -0300, Jason Gunthorpe wrote:
> > On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:
> > 
> > > > Yes, the ACS combination is selected to avoid ordering issues
> > > 
> > > Does a user have any way to know whether the configuration is safe?
> > 
> > No, unfortunately in PCIe so much is really difficult when it comes to
> > deployment :(
> > 
> > > I'm wondering whether users might use "pci=config_acs=" to configure
> > > ACS so things appear to work as they prefer but may not provide the
> > > ordering guarantees drivers depend on.
> > 
> > I imagine that could happen, but on most practical systems the root
> > complex will blow up if you do asymmetric routing so there is an early
> > indication.
> > 
> > I know this because I've help debug such configurations at
> > customers. Some servers helpfully MCE if you do this. Lovely.
> 
> I'm still confused about this because earlier in this thread, I
> thought Leon said you do asymmetric routing:
> 
>   Bjorn> And I guess asymmetric fabrics must mean fabrics where
>   Bjorn> Request Redirect and Completion Redirect are not set the same
>   Bjorn> way?
> 
>   Leon> Yes, in some of our systems, deviceA to deviceB is going
>   Leon> through different route than deviceB to deviceA.

Yeah, that's what I clarifed, it isn't quite accurate. The asymetric
routing is between Strict Order and Relaxed Order TLPs, not
request/response.

Jason
