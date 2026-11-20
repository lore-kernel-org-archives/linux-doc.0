Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201965;
	b=WxdzGCvbVdR47OCuSoPq5mEi3+OPK0ubpOlfGB3RFDEXs58Li6kLofLbkKvwdAKdBxBu
	 4MqVmU7m2WGSiZX/JEI+iq8SJT42uqIEjw/Ce3ZHrZ3CnaS0M52UrkKJ1lksPOR/o8wb3
	 pCPbpD5jB4byB8B48gO3rIOgUGl5ayRhdZcmqXgzIv2g54Kc0ss5BL6cY6UKj33pfNhj0
	 vODWay9GMwMhdKybsracmqqG6NJHark/jt2b3WDeWi1QF5p2mqF0rh8/m98jxENw5GuKm
	 MmQ2J/B1RXVFwHYMDJJoCmVd11g4npRxuV9dGwcUdoEL3Vn81WKX+0r3iX/eZs4cQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
	b=EuuqJpa1AiQ1S7k5I5FDioVYpjyGo2QHqvm0qsMQIx807IQyByE5ZDl0WW7amFcyQCLS
	 4n1eu9GQghpY89SyHY+fWFotXEpYE9BkRVrXOH9mPYU/R+DrBoRWxcMrZ5L1vW1OhHEqE
	 nchPdnjyNQIRM2Vh5sebjGtMDLthEwG9m5JzK5W90agOJ+lRGRTEJ0U9BpD4Mgfkduv3F
	 IeFLLMkq+YQlRnFG1OnZ20B+Diz5fbNp8r10012+dT5v5KE2LNldsjflfdzUzkpoG5c2m
	 KNDSjo24HZNIOz0sVgf0b7Irf5UrMg+TZZaSQFSSU1QZIykk3h8kIu5fLdPeY/l3BQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LK+t711n;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F260A2630
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 717F260A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LK+t711n
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536717a4d83so10207701cf.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795201963; x=1795806763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
        b=LK+t711n+DSL9VuH/eBv9gZzpPFvxG0ySi0PS8xdVK8Njz0x8D+6unhDfaJkdPY9XK
         vh83xQYbYXNMCn7fzKdD/N4zl9lvgzq073r+45Qe2oX17wr1yCznvmrdvWJ7bP+weHO4
         m87IAj+msmMXOrfRUlEuYN7hTBlAjeBbOTfk8G6sI1nvjyLVby4oubGlkMSogGQxAg4W
         7cnUmvN0dOhgU68pr8xyuvP4f4CLtcsFJjfmQInl4CGb/uStxOzwWJiuX/tJxkaJJdj7
         OcliXwp83KiFJnYu3uI72zunacdurHet/2ZIfy97kncqN8jGTjsZ27Mc26+6OESRD8g0
         Mzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201963; x=1795806763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9RQqwSYuKH6BmFXT3u1NJ8tFtpyybE8Xg+Th6P/DFk=;
        b=RyAgOY9c5SdOz5vmSiBSCcWy47noCnxDMPHJeGkRJQppV+0PWygklv317oUvrKC968
         +j/WQDgb4xgtqP5tXT7hmsS+uY3HADfpBVH6tAol2lesSrJHZNzdGK1J/jmb4i4jiftG
         +GNkmfBj9pWRfzxYpkQobCDKluhnwyGdcsg3CTJNmqSIYZu4rPBXZvOrRIaD/RoIfIdA
         FdDV6Ra/4ODcsWqhp7VaazrS/6NxakKP9KkzeXV/Gs07oZBXxUCatXwUmDzUv8aDjJOC
         kIVbj3D8vr/Zncs+stBLl07VoOrOKewqzCoGuhGsM2b9pRfuWSn3+ng1ESG9uMohEZcm
         v3DQ==
X-Forwarded-Encrypted: i=1; AL+hErEgNN9gLlVnUa2u4jALRDRnyrCfyBRAlhyo+o4H9ov5HHiEqqCdjLFYIVadvfZPFV4AyjQHtLRRK44=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zbQZXa34iOg0/oAGN4Dyfjy0atWTgZNDCjlYCjuEf03FV/m54
	rgOrtoNUB4yOcQsgcdV2A/yHb/ZFf8fPpKpjNWmjEEXTQoAj2JbweSjoZTKfNIn+9Nk=
X-Gm-Gg: AYBFou00ya1yeKDaKn/4nOcWL4Rgq9oCyS8H0AZps9goZ2mme/Cw5sLC2E8tfSB3804
	HdPam1EhndBCfuwSf4gIDYde1vjraAYt5OopcHS2/PvM1cIIQxB0pae12pUMLTe7JGC3np67MnW
	74ylA4CSYlvr5Md9lQ2IoZkk9eVuRVTOIWmMvEYMTfDZvVxEurbpwDmVlBcqNP/WYTUwXnB04AB
	j0f+DUXbJX5Iege8hQAECKiSNhIEc3OL8zrhqN7KEL2dv82Psm0hJy69psCPGIwl2SkssUBYiu/
	zoZtld8gPw1dLVl5M3rXCvILP1zGHKva0GvBJS5y/Y+x0BJEYFLzAw5DkgeWi5WxlbOtMTvLE35
	9UdUH0FA/nV4xNjC0H9+O6SpEIfimalp5nZHKVHyVYWRgitRoCfYB4pKKdYe/3ol9M90g3L7QLx
	dUt0aq9V77L3LigR5zxoPI5ztujxEngd2MpPYGipzt85HD9m9Y6kFKyWiCmryi8szp6XlM1x+XX
	8GbFxcmhm118fIUTNqpU15IeecZ/0+K/Tl6Lh3K9Klhk+uzUi4PIkPUOejQV5SblFfWHzz6iFAI
	w2RYf/6oTih8tRdjwQy0u29U1Vc=
X-Received: by 2002:a05:622a:598d:b0:55d:3540:5da1 with SMTP id d75a77b69052e-55d76a2799fmr67233091cf.19.1795201963342;
        Fri, 20 Nov 2026 11:12:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788548a2sm29714901cf.19.2026.11.20.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:12:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUU2L-00000004oEv-3NN7;
	Fri, 20 Nov 2026 15:12:41 -0400
Date: Fri, 20 Nov 2026 15:12:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Graf (AWS), Alexander" <graf@amazon.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	"nh-open-source@amazon.com" <nh-open-source@amazon.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>
Subject: Re: [PATCH v2] dma-contiguous: support percentage sizes in
 cma_pernuma= and numa_cma=
Message-ID: <20261120191241.GD1133597@ziepe.ca>
References: <CGME20261114145340eucas1p2f7699b88eae34f7904cf68109dc3eb4f@eucas1p2.samsung.com>
 <20261114145328.1307-1-graf@amazon.com>
 <fa38a878-1735-4682-b208-5de1616f7e4f@samsung.com>
 <28a0f946-af4e-497f-a923-f11b79d94930@amazon.com>
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
In-Reply-To: <28a0f946-af4e-497f-a923-f11b79d94930@amazon.com>

On Thu, Nov 19, 2026 at 12:27:08PM +0000, Graf (AWS), Alexander wrote:

> Ideally all of this would be policy that only takes effect later at 
> boot, so that we don't require pre-boot logic or a reboot. For this to 
> work, we would need to have Linux restrict its memory allocations to a 
> small'ish region instead of spreading them, maybe to the KHO scratch 
> region, or maybe by favoring allocations in phys addr order. At least 
> until the boot is at a point where you could perform the allocation. And 
> then we would also have large physically contiguous blocks available to 
> allocate from and potentially change the tag to CMA.

That actually seems like a sort of reasonable idea...

What about the reverse, you boot with a huge CMA and then shrink it in
the initrd to what you really want? For this you'd just want some
command line indicating how much non-CMA memory to have, which should
be fairly predictable to get into the initrd?

Jason
