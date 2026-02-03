Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F21C84A2
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 18:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142582; cv=none; b=FueEKfGuQ+VKtSa+xt4G+iQ4QClh3U51ikZSye2bGFmKmVoORTBkxwK/WNdBtI6n5U/uT5l9tcAC3xkzNF6NKUjk78+Nj73pZ8nlFm4UzAg3CeJknIDrmB6lFWUZ2fhO1wicdX1bFH2szPLZEDL0MGeMvRBK4FpPKgWpvSu8pAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142582; c=relaxed/simple;
	bh=Qt7o89VltFIBegDzasIbqnP3PJ+WPuTLLON/GuX+fRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeGjnKwaXhxlxzIEe+xU/tSWvI/Dm6Ympv/nCAuTUaiPyrf6NzMU6E58YMZB545JzUmy52L3dP3h6UgDERfUbGRsnvcc/beMsuev4m/hGJsynEz/+XI1E1itCV4d4cDeZgEOvZALbtO+5mE9guGl8vUqWnic8iI3qFf8+GxYIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Mniz/5oy; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Mniz/5oy"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8947e6ffd30so70835086d6.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770142580; x=1770747380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mu1la4UZlbEX7cvXzj/Z/hgnRFrqjHU+qKtYtW0dmkY=;
        b=Mniz/5oynk/qOI64zPIe8E+PNEyixk4fEB611FX5soFdbulK6R9KmPQtOu4aEAXjcB
         efjpn/kLP3vsSPGaHohVu6/Rt0K9qXP7QtNggw4Y7iGiQ+lb7Btklx97aDYTLAlUztFI
         h5yvBEF6xvd6QNj3f/5Rq9dS5pMAQ/wKBPWuMCDaLEXtmpFbJnXArLI2UIvYnmp155Zy
         0b+yLcNYyG0uUnOruupOuHumm/8Fat9UIruRUI37sLCEsgtmT6QSkgWJF1h0NEiROxuz
         1abL4IMKxz9NUHd0G1V4nEtr6+1cDHCJ7YB1uyGxhcm0aubd+Dk72keMw16xEPt7BDo4
         yQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142580; x=1770747380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mu1la4UZlbEX7cvXzj/Z/hgnRFrqjHU+qKtYtW0dmkY=;
        b=MeFcUjHQeGQj+28qq0P/+83gKStzPtz9orc7oLhZ6fy35eOJQFzHQZIU/ZzxHvdo+5
         C/4i4M5mGsZ3dBgPQ2te+Xk3phXVG4uxwMkRHF7qiB9usMDc2THN2iYTRq7xpjk/eajv
         crfw37TiRTkmfSMZ6ekCkBivNGY3MVBrQkoiw/P0YLx2zdnnFZ3osesFJcGycp+n/ELk
         fbE3JzHyGOfRX3N28SdgHEaEu1aanqPX0J/XlCkgsuJrbAoKoJGBdann+C4QMzFTUOt8
         1CnIDaqlgnDHClB9J75wbEgmsVQdtplTH669hshImgSC0rFMxjJYS29h4IPTKLAEfKkk
         O6aw==
X-Forwarded-Encrypted: i=1; AJvYcCWCV9bk++kTK9wUbHPUXSOIcC0vGB6rw4aeA7Fd2+kcJqdWTNiIcb88zNGvWSznvfN8xrkld1+CiGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCwGK67InA/u0+f1DEsB7C/2lYYnd6xEHA3zVGr0INsQ4zD1n
	kbz+EtsBo+BmfZTwnTZ4Bz9bKip7iTJJalerj5HMn+uJ5Fz8tABhYMbnGgcv9NqNBGk=
X-Gm-Gg: AZuq6aKAgbeUq+wjeEnfsxeIUZdVwtm3QFWgKtkmsD6F2k8oD+jR6oLc4IfpGBFJw9b
	XPx+DCdlomwT3ptCRkS3xUSf7EHoBXANij7acHHBPHyGoSybpOZ1qhfxB/CGqRjIbArRy4VaWjT
	8PwK/dITi8zUuOly4u7HKzUmiJ93EkUTZwMlop+HKol+ROSlwbmnbMc7o/j3oeZ4uInuzJyW2kh
	saEM9oUfQyWhQ5aK51aJ7rgcs7QChikcqThzFXbmg+PCRvGXshqFv0WE1a3QOvO3jW9om/pXRaw
	mvXY6ajET81QSam1+O28gnb9/kjnOkMybRSwnPhglDSqy6DBC7Of3q0RqpFW582n8zMf8xk5hPA
	oLdMf/z/5PFK9gIk5ihF53YOo+zl+A7cJvifkWiC2Rio47Vagt3D+9EO8n+stONkZ15n5Javgb5
	d7UmiKMzmmXm7DsB83l7aEgKJGEwpaHfHTVmhIoFJFe545pusLHHB0yFlmByro2E1g7Xc=
X-Received: by 2002:a05:6214:20ab:b0:87c:22f9:dac4 with SMTP id 6a1803df08f44-8952210b4a5mr5192876d6.15.1770142579616;
        Tue, 03 Feb 2026 10:16:19 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89521c00173sm2728446d6.12.2026.02.03.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:16:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vnKwk-0000000Gah4-0kfw;
	Tue, 03 Feb 2026 14:16:18 -0400
Date: Tue, 3 Feb 2026 14:16:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Alexey Kardashevskiy <aik@amd.com>, cgroups@vger.kernel.org,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de,
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org,
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com,
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com,
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com,
	hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com,
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com,
	jack@suse.cz, james.morse@arm.com, jarkko@kernel.org,
	jgowans@amazon.com, jhubbard@nvidia.com, jroedel@suse.de,
	jthoughton@google.com, jun.miao@intel.com, kai.huang@intel.com,
	keirf@google.com, kent.overstreet@linux.dev,
	liam.merwick@oracle.com, maciej.wieczor-retman@intel.com,
	mail@maciej.szmigiero.name, maobibo@loongson.cn,
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org,
	mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com,
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au,
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es,
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com,
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com,
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz,
	qperret@google.com, richard.weiyang@gmail.com,
	rick.p.edgecombe@intel.com, rientjes@google.com,
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org,
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com,
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com,
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com,
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org,
	wyihan@google.com, xiaoyao.li@intel.com, yan.y.zhao@intel.com,
	yilun.xu@intel.com, yuzenghui@huawei.com, zhiquan1.li@intel.com
Subject: Re: [RFC PATCH v1 05/37] KVM: guest_memfd: Wire up
 kvm_get_memory_attributes() to per-gmem attributes
Message-ID: <20260203181618.GY2328995@ziepe.ca>
References: <cover.1760731772.git.ackerleytng@google.com>
 <071a3c6603809186e914fe5fed939edee4e11988.1760731772.git.ackerleytng@google.com>
 <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
 <CAEvNRgEuez=JbArRf2SApLAL0usv5-Q6q=nBPOFMHrHGaKAtMw@mail.gmail.com>
 <20260129003753.GZ1641016@ziepe.ca>
 <aXqx3_eE0rNh6nP0@google.com>
 <aYHGVQTF6RUs7r3g@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYHGVQTF6RUs7r3g@yilunxu-OptiPlex-7050>

On Tue, Feb 03, 2026 at 05:56:37PM +0800, Xu Yilun wrote:
> > +1.  For guest_memfd, we initially defined per-VM memory attributes to track
> > private vs. shared.  But as Ackerley noted, we are in the process of deprecating
> > that support, e.g. by making it incompatible with various guest_memfd features,
> > in favor of having each guest_memfd instance track the state of a given page.
> > 
> > The original guest_memfd design was that it would _only_ hold private pages, and
> > so tracking private vs. shared in guest_memfd didn't make any sense.  As we've
> > pivoted to in-place conversion, tracking private vs. shared in the guest_memfd
> > has basically become mandatory.  We could maaaaaybe make it work with per-VM
> > attributes, but it would be insanely complex.
> > 
> > For a dmabuf fd, the story is the same as guest_memfd.  Unless private vs. shared
> > is all or nothing, and can never change, then the only entity that can track that
> > info is the owner of the dmabuf.  And even if the private vs. shared attributes
> > are constant, tracking it external to KVM makes sense, because then the provider
> > can simply hardcode %true/%false.  
> 
> For CoCo-VM and Tee-IO, I'm wondering if host or KVM has to maintain
> the private/shared attribute for "assigned MMIO". I'm not naming them
> "host MMIO" cause unlike RAM host never needs to access them, either in
> private manner or shared manner.
> 
> Traditionally, host maps these MMIOs only because KVM needs HVA->HPA
> mapping to find pfn and setup KVM MMU.

This is not actually completely true, the host mapping still ends up
being used by KVM if it happens to trap and emulate a MMIO touching
instruction.

It really shouldn't do this, but there is a whole set of complex
machinery in KVM and qemu to handle this case.

For example if the MSI-X window is not properly aligned then you have
some MMIO that is trapped and must be reflected to real HW.

So the sharable parts of the BAR should still end up being mmaped into
userspace, I think.

Which means we need VFIO to know what they are, and hopefully it is
just static based on the TDISP reports..

Jason
