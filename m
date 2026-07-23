Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7572C38F25F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 16:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825597; cv=none; b=k2YgCcPV4wV/p0hKYfh/z8OdpSi05DPcuO7MumI9zPuEVWFckyf9oLDKkUniX/prMQzil7RUerX0PDGGSpiYn8zTzAuWHQhotiYnB7yEC1Q/TMatQyvOwNs9+pMY6MOsPGko0GPE+Bj3eySQwAQDzQ8olfYk4DM3PdnYZWELz/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825597; c=relaxed/simple;
	bh=z+HoEvmWYKtMfBygtPBl68CeMD6wWsLW69JzvhhpR/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szr22C+mTF2zaE8XrM/jjZYICPBqKbYWftgWjS2qg6df1eVTwvpWYVKIlszBGaOajZkSOfUqRf6NeW1tCRLLpJDO3UIpZGSbvpJmIil1yNZdKLDgGHyv2TZl4C0n9WAcjPBFi0r7YjqMFVP05rjvtH59Mv9LGIxJg4Z2jQCr92o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Gk6jW8du; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Gk6jW8du"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93108a3c326so59245185a.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784825593; x=1785430393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bqVE/c/eX9E/Cy6wFBhLLV7HBSbIhrEkmRJZ6Osn4Tc=;
        b=Gk6jW8duMorFxZCKOTImKK/cthkQTePo/7XXo0yOSe8t/4ZafB2e38eaAzmr6WeMVE
         EUihxK/INqSSpq0j/FYQG3btxjT4+3qwY9q9QVjDr3h3KhUX0Sm6ty0CUZU4HhzHfM5A
         KT4fWPdgBq718p0P0aWwUR2I9rNE5zu3guFZOhTjdlFGmNGcrLapR1HxQahETeYLGwiO
         nOL+GnNGC1gOuxE8VjXSq6vIYbcYfq+JmU4geK+aeg6Mxms1DsVn7HVD6K4nJXOp0dM1
         GlFRjxDBTSyJltmU9fOYCpkQu6/iK0v99poJz+5FONYUVksgFUwse+RD/2/BXvoh0feM
         zZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825593; x=1785430393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bqVE/c/eX9E/Cy6wFBhLLV7HBSbIhrEkmRJZ6Osn4Tc=;
        b=pmy64M+BH1JMS3JZd0/cHeBfQUYcFth8gX+LvmA5MIQ7FLJcn7+Nj6OVvruIeXCLid
         /GlLfzhGe7KmtB9VC4PMdjYOo17T9czJSxq72nj28Gm/vV2q+qMjpsMmaljraxDGuWe4
         fKpT7LyBvqBb1gXyVW5JaWFlEJ8AaGLfG2xQdM8y6DHft3k09OPyJC/E8TETFYOLpPO5
         3RsARU8w1GACIyJr1XeWLTvazXafyXJ9g0MzRVXWiyMA0EReSw5g8zCbqGcvAccVm741
         ta63k/lYjkYj/wpHThS+6Fu5s/MAayAZOhexErQhEzWHSdjY/vjorqPUUWCKCOqJQe/v
         /Bkw==
X-Forwarded-Encrypted: i=1; AHgh+RqCuqaL6eOc9mUShnqLGWLyxDWTPKsln1npDE0K/8ut/+ipYzM55J115qBedVQibUPx86k8y6cy8WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBzWdeI16rcBgQHMeB9/evYDZ2B3FMZoWvFDeCqXD2tihl0TRz
	jWzeO7cL5wk+pEhoQLwStWZcdLN5MxqMRBTgnRS+JLTxmw60Aj32y06qJR4uoRZ53iQ=
X-Gm-Gg: AR+sD12RWoKn6nZqNTYL1haF2uBUV8dph9zH88CC+NmQgS6uVxzUVz+I3MoxCFkptoU
	GO8YL+8MjTOHbgStwh4VxwS3nmgg1yAarDtuGDODGXzmbdDyUInZ1erdka/sOmSkaamAwdyGEiF
	7MBCKzQqrDyXuhzavRU9/A3ScF+aiWMQLrXQDSu8+bbY9Hyy+KLCHop3U6XvADb9ZsmonEjzRpA
	bNkcpQmllPBFUIqnmPcWbNjLoAYKWX2MSa2I6J9rw8814J5mPtQdMFHaWq0o2H5I6NoMfe2L20D
	6FMdqnoEpRipm7tIzoWth9rFJzg04K+padbBW1quSm6yXaEYvzi/C24HyNtpZGcCKyEt7YFObFy
	/JWhnSuHTdVfylriUD4Da9ojhBdAHjyXsnbWremk9slUf9YdMXoTXUZsnIaGv4IXjQwXwlFx97e
	Q1VjBwXTKH8RUMpVQRP7+MSjlEDIkdK6oFz6h4ljDytpc4HDRz/cF+ppGR6Q==
X-Received: by 2002:a05:620a:1729:b0:930:9533:5e32 with SMTP id af79cd13be357-9310468af9emr366578785a.7.1784825593202;
        Thu, 23 Jul 2026 09:53:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e18d4sm48785446d6.23.2026.07.23.09.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:53:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:53:06 -0400
From: Gregory Price <gourry@gourry.net>
To: Arun George/Arun George <arun.george@samsung.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, balbirs@nvidia.com, 
	brendan.jackman@linux.dev, yuzenghui@huawei.com, apopple@nvidia.com, alucerop@amd.com, 
	matthew.brost@intel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, 
	vishal.l.verma@intel.com, dave.jiang@intel.com, alison.schofield@intel.com, 
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, 
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, usama.arif@linux.dev, 
	xu.xin16@zte.com.cn, chengming.zhou@linux.dev, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com, cpgs@samsung.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <amJGUuBZ2857QjDB@gourry-fedora-PF4VCD3F>
References: <CGME20260720193443epcas5p167fa7d8490edfb4d8c0aa6a259db058f@epcas5p1.samsung.com>
 <20260720193431.3841992-1-gourry@gourry.net>
 <963815509.21784796303385.JavaMail.epsvc@epcpadp1new>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <963815509.21784796303385.JavaMail.epsvc@epcpadp1new>

On Thu, Jul 23, 2026 at 02:08:31PM +0530, Arun George/Arun George wrote:
> On 21-07-2026 01:03 am, Gregory Price wrote:
> > Changes Since V4
> > ================
> >   - dropped compressed ram example from series
> >       - will submit separately if this moves forward
> 
> We intend to test this series on a compression capable CXL expander 
> hardware. Since compressed ram example (cram) is not part of this 
> series, how do you suggest to do that? Do you have a version of cram 
> module compatible with this series?
> 
> ~Arun

Hi Arun,

I dropped it from the base series because i want to try to move forward
with this without RFC.  The compressed service itself will be a separate
submission after I get decent signal on whether this will be accepted.

I plan to RFC the new setup for compressed ram this a bit later, but I
will share my working branch with you for testing.

~Gregory
