Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656BD46EF6A
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714040; cv=none; b=RBMKa4QaZjrnic8uFq5YWOKDgVeL/T7Y6vOMRJAuFwpMPcTVxYJY+6LRZsTAU08/qoa4CJc1F97oWen2DX368YxYVH5qyBpbHmyJ0ZlyAQBLtCZZ4xXNRoMpvA7yRCu+iEH4wl/kCwcjONGXEe6eWo2q2jukhzt+KL/d5flgvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714040; c=relaxed/simple;
	bh=CChEzwWKHqvAbDe82pqB+EpRVBOCxUp7FVLoHlKhGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSrO4lXU5pDOJt2946uaFyBE6h5FjYLaO6BHDZbQXoQTlq4x1jQzmnN7mI8a7RpmJ2Iw79c5Zdomz1rWTQBhai+Dk6PUqXq5rQqj6FAv7ocFM8/CoCusR1+MS7k1pyc6WZmlMW0agR4xlk3j4sTP6euNR4qZ4zQEkxTXA9qxaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TCpeiH/x; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TCpeiH/x"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66c71239c48so1366217d50.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786714037; x=1787318837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=TCpeiH/xCWeDcYJotQrUKR+96UF0MG/Njhh1rbUlHRGBrpdQAImKs6oRWI41Q8Eczj
         +mTDkleatlsNeXhOUaGWaFyd3U50OBJvlvu77XCYcYzSq7ARn4Or8iIhiP8w6JBZAK8W
         oAd1trrpj6Ef0CklV1H2zSfBzIviHXmk2sB71HcaujcqJrFDI2zHP23dmMR4YDojp+3v
         GBSdAv+vPbaIHQHbjNZQzTtWNO8h2nh2HWBKxy6PVDPoHfw/brhOp2p2xqx48wXcX9eT
         697sKEtDAhvD4AyqB7mtbV3UuRSbV7yerIPuq30uagL3Wo2jyOy2OULMcp8X/mprik3I
         2+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714037; x=1787318837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=ZlLMCh/WEQv6+nFVlCkSvgcU9gI6dpm4qrU4JqJjba+lQyuOYquCejM/0J43R9DHri
         RKHe/fpB65Mj3LrnE6YkRPulsZAMfQ6QY4WkD4QkizrkGBuT+swQRDw8t5JnmrJ3vZSW
         +3jqt38zLSvteXezyjnBpd0fwocEX5rr8FrM+CHwGa9TKFf/l4E7TwaV/enRQu4QTy4F
         QuvVoEwMabolQ0N1oo6vQ+FaLYIBqACqOG0MGO/iMY/b2UrOudWaudZkto2ujMfJTwiB
         Syo0zkeX5ijXyERufRK4Sl7x2eQ0531qnCs0PkMp1SpoXhN8L8YJPndcYE51ichXG85L
         Lv9g==
X-Forwarded-Encrypted: i=1; AHgh+RqTJkSuUwIUOIYG7VBal1rAURLvgxSnQe0/7kNJR3N9zW4sdhbQ8VBNbYUOQYThMEKZNlwxw2xOmA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2XbfyX9IvKkS5172PEnMDUxarzeqMJ+buc3XoYc8gREFnQveP
	5VWKK0+nnC+jc/mZ4aWigQQOVrOgmm32ZXv1BboVFIq4p0XXxXtc4j1h46pGnpGpsJU=
X-Gm-Gg: AR+sD11y5aoW5KRWvBEwcIWecjzt3BOHnPpaR79b5OjeoKZ0d7ora0sniFbSglF98H6
	k6wbTV0aJxDvnIMU8xluXH/v0NCWd3XtbYvfLWBCrH9XWSdKP6HBxeYrcF/5yA8HKttmDcEfmHL
	mKXC5+ZX3aL2bRAWwYOrtx1AdVw0/P2GHE+hNht98/N34emo1/09focMlJdrBzqD6XwNqlE3Vsc
	rrMdb0y1bB+NsBKML1lwE/qc63VgU8B2zfDWVuLwmK+PG5m+gARfSep1AwPuHrlikyTARKREnCQ
	fOO1VvKdBmTge24bFUhBAUYR+Q4TCnfYZGmZCw8nrfoPpNil9yC/7slrqSPSWVyxKzEWRzvL5iM
	i0uXSvmSOgfYMutIs7OEEapBw2x+Ok1OeUZPYLlfMwmDXQtMaR6KPpiuNRPznxClcERf0GPMbOz
	ozlV0cfHvo0oDxQXOCN/S9I7TOVDDdLipUBHI=
X-Received: by 2002:a53:c584:0:b0:66a:3662:409f with SMTP id 956f58d0204a3-66c72ba0d10mr1917799d50.10.1786714036424;
        Fri, 14 Aug 2026 06:27:16 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c75c9d90bsm1010793d50.8.2026.08.14.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:27:15 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:27:09 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com,
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an8Xrb5Phmvs0xE4@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
 <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 10:55:13AM +0200, Pankaj Gupta wrote:
> >
> > A device driver could very well just call memory-hotplug directly,
> > or its memory could be brought up as a private node via a boot
> > paremeter (which I have sculpted for v7).  The former is preferred,
> > but there's a bit of a chicken/egg scenario for bootstrapping.
> 
> I find this interesting as this appears to be evolving towards a vendor
> agnostic framework for hotplugging memory directly to private nodes.
> 

Agnostic would depend on a common standard for such devices.  Otherwise,
there is still a need for per-device drivers - but hopefully the
interaction itself can be generalized.

> How you see this working? In particular, How would the kernel know which
> memory ranges correspond to HBM or other device memory?
> 

Device marks the region reserved at boot, driver hotplugs.

or

Device marks the region normal, but boot param sets the node private.

> Please also CC me when you post v7: pankaj.gupta@amd.com
>

Sure

~Gregory
