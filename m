Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843731B830
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142406; cv=none; b=oTNXKZTv8+4tnfoy601bNxoR8Ci5jtXyjpuc7xUzoPSRUHTyOtw1MoOQRtHgfWCji0hAgU/PsAjiM3YQ8iB9ZhZVTFTbZoX+GUErvZuKt/LnVRBPuD5erCih3S8YOsY4Aw9Bh+SwWGjplXA6vgh3O2KZNKP7874//aTkreKtV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142406; c=relaxed/simple;
	bh=RgOdFHuomUx5cdPp0JGsemA2d5RVP7tNLyg3IMDaEeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJrMFKKTS+z6bqIe2mKiIxvLN7AujuTtmQqigEDqf7PZ0dpkLjxapB30OjgvU65PqPrD3V2zztbOT8aJ21zMUfdFGgXiqyVFlwNh44Irw3Chj3x27YrlIujaZMMwCK+gnGbF7UDXC7AhXKLXd9bUP0ccX+qr+31trgrzozKlRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Rk+l257Y; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Rk+l257Y"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029af2b4bcso32780641cf.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 10:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770142403; x=1770747203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6rLJUepMBePw2/6rYXVBVUlKVexPKPCi+MRpKxp95Xc=;
        b=Rk+l257YovzbL95b0JDd+4LMj5HOYKihyDBLvwfNoTQwh7NAISq7jhwnDhFLvGWlvi
         CpyMq4yMF+anTL/9SOnSdXRBNA0n/f4hZNcxZ5Ir9a6+99u5sOCxOswCkt6euq35RpL/
         wHZ067Xx2mzc4NML95y/mntvRxePEQg/1fDTyZADzxNUOm3d+QfvM0XgVUUOb7PrLQFM
         8IAln35SLF4Ap24/1RMI8joFPnxoH3YtApA31JVZmMZ4hxaTigXPbrc+nopp04QQJHlZ
         30H8pSaU2pZP8BXue4jWMlYsk4nepcXFViPK92zSj40H6RkBNcNnF3MxdovxMVc/KxSh
         BE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142403; x=1770747203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rLJUepMBePw2/6rYXVBVUlKVexPKPCi+MRpKxp95Xc=;
        b=Hhe1P02MGVDY5fiBXcRZyR4QAXx+UnZVlZAISk6Io2sxoDuJCcG7p2AYpRPeZj5BSL
         yuTqTOalzPPdQ3J5Ivs3lDJ7HsBqlPP3i66OYW08sE3cSszCxuHNr/rUOCWn8F7DQ9go
         aqj3Nz1NWi/EPdc8RR2zo6Ub4XojJLTKOCe5QKuvvRtMaxOPvkMz3SCkyGmFA9YVP+DR
         08Aqvxj82yZqisEf+yDDL+HPQxh1w+cGewwSlWJn8k62PNmThVM3HvIcPMxIUK6BoXFJ
         hBXQXpBxdXCw1Ki0kmW2ZjfUXyftmgyK3usTuNxAgktDAsJERBeJtE/VHAF7Mh73Vy22
         Z9vg==
X-Forwarded-Encrypted: i=1; AJvYcCW4O77YKsGKAz55I51oTUnTjoQj63G1vSp22JIVEW9PJJp9ngyT6WsfNmjyN8LKO6DCExW4z7MyIJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWQ3K3ZD6Yh1dnzP5tkZi7upwwov6FEAjsdx2KOdoQ4i/bu0k
	gciDuMc+cdPMLvGNvL/etp6vpS4HEiCKQry7+D0WRJobXAhETDJrcab40p6FXtrPI2k=
X-Gm-Gg: AZuq6aJFQhfyDWxibeFppDB/erYblH8fZkAHzQZAhlLekPd7iM9GlKSJ4/BTXICkBJ+
	sNShlPaMCtuYjJW4RRnDS1hXwBNEniE8Dq+c8CVghEm5fCTd/NhqUE16/9oMf/t7a5+7mHXE/Xw
	13lrwMzSqlBEvC7OiMz7MNyMDg1cWkTiOcmAPb3BAB0geq5qP+wZsbF3fQluoCib1kydkCbadgg
	QmtpFGQ/VtQRI9dccGB3LC9sQjnXJoznAvg1FUlC+DiE9tOsVDooinar4Ld/rzRjS3lOBgJiHMw
	STrOh/Fq4zxt8vl8XVHldPKZ7rEukiWzpxQIKvCEWzMZa5WZnEsNCoBJYFtjoj2g+95JuLm9dp1
	Fh3SHNnQBrFxBpbffSeDdDIx3cU1bxoD4V6Dq2NedCXabzeKgfdAW0Bp1+PvLZ0yCMn7rDmx+Jc
	MpXnLBfxBjZZrGpoJtgXd3bJ3e6GNkg8ojUO/7i27PUofxTJqgf43qTUXE13YSpfxK51Q=
X-Received: by 2002:ac8:1402:0:b0:4ee:42e6:a5 with SMTP id d75a77b69052e-5061c1ae28dmr1930741cf.57.1770142403217;
        Tue, 03 Feb 2026 10:13:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fa55983sm22226185a.10.2026.02.03.10.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:13:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vnKtt-0000000Gaft-0KdL;
	Tue, 03 Feb 2026 14:13:21 -0400
Date: Tue, 3 Feb 2026 14:13:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>, cgroups@vger.kernel.org,
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
Message-ID: <20260203181321.GX2328995@ziepe.ca>
References: <cover.1760731772.git.ackerleytng@google.com>
 <071a3c6603809186e914fe5fed939edee4e11988.1760731772.git.ackerleytng@google.com>
 <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
 <CAEvNRgEuez=JbArRf2SApLAL0usv5-Q6q=nBPOFMHrHGaKAtMw@mail.gmail.com>
 <20260129003753.GZ1641016@ziepe.ca>
 <aXqx3_eE0rNh6nP0@google.com>
 <20260129011618.GA2307128@ziepe.ca>
 <586121cf-eb31-468c-9300-e670671653e1@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <586121cf-eb31-468c-9300-e670671653e1@amd.com>

On Tue, Feb 03, 2026 at 12:07:46PM +1100, Alexey Kardashevskiy wrote:
> On 29/1/26 12:16, Jason Gunthorpe wrote:
> > On Wed, Jan 28, 2026 at 05:03:27PM -0800, Sean Christopherson wrote:
> > 
> > > For a dmabuf fd, the story is the same as guest_memfd.  Unless private vs. shared
> > > is all or nothing, and can never change, then the only entity that can track that
> > > info is the owner of the dmabuf.  And even if the private vs. shared attributes
> > > are constant, tracking it external to KVM makes sense, because then the provider
> > > can simply hardcode %true/%false.
> > 
> > Oh my I had not given that bit any thought. My remarks were just about
> > normal non-CC systems.
> > 
> > So MMIO starts out shared, and then converts to private when the guest
> > triggers it. It is not all or nothing, there are permanent shared
> > holes in the MMIO ranges too.
> > 
> > Beyond that I don't know what people are thinking.
> > 
> > Clearly VFIO has to revoke and disable the DMABUF once any of it
> > becomes private.
> 
> huh? Private MMIO still has to be mapped in the NPT (well, on
> AMD). It is the userspace mapping which we do not want^wneed and we
> do not by using dmabuf.

Well, we don't know what the DMABUF got imported into, so the non-KVM
importers using the shared mapping certainly have to drop it.

How exactly to make that happen is going to be interesting..

Jason
