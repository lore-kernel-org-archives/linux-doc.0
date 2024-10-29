Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4FC202F8D
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234935; cv=none; b=OmjxROgvJraN0qOtRXz53kYyj5jHISlWCZf8ni9YOgq1ukrQQYWpfpI4L59JAui4yAJ8uMfQDeOhDq2uec307qCj00vKY2Lc5QTBUWch5GS3v1CvYp5C2w1w6BJ7QLXhiqAQ6SRf5okKm5vtdWBs3vjfCyk5FDHubPJjXkP0t0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234935; c=relaxed/simple;
	bh=BsnzNvPCJXHZyKoa716Hd+vcE18PfG6O4lqHQBxHDyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/iLcvmwLKEJAV1/2iX6nCWMExRKpezko9DVQHgXvFJXHjXii0iEg6yUl0fM+EbOQIa7OORBJgPaOXOrJyK4IO0d4SWzGVeGlMjjVHVwuAVMaxtduT9wiMY/recDw0h1aqEDouWeEhEXIwgBuEC5d3gtI2tWBSj3KpPXDMDAz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=JpW/WYPy; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="JpW/WYPy"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ebbfcab9f4so3146798eaf.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 13:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730234931; x=1730839731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz+fam73nTglMEn1ntwtV0+tn+WJ+jMNoRjEuTQ5sUc=;
        b=JpW/WYPy6wJLgClCi1hsss5sdpLWWV1z0tB4ossXXca+1z6nf33/UdNSCHtGPKctCY
         sP75PeoF+pCUKic8PDotOzUst7vmCM5zHWenrd0iq9aK0mjA8a89Hyllft1HyrUzHSq0
         3hxRWuGFipq29JoZYVpNU5XRS1L0jL+NBZhVneWV8RWmHnC62gGqrwNJ3XXa2FRlWaI3
         jEFAPw0vWh6kXmxmzmqSPIMELREhEMa2Pa6IbRGM9L01sXZjLTASMS1SpYI2/PaL3Fs+
         9NPqZYpgtS969mT2X7iuFPExASjvAcnZZleOWrQx8JbbBr27GJDI+dSki+CrY3zaT0Vs
         K3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730234931; x=1730839731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz+fam73nTglMEn1ntwtV0+tn+WJ+jMNoRjEuTQ5sUc=;
        b=xNN/VyMUY3aZrpc4iGddhwviAEIKRHsVnXuJZqBjx2lGbNOC//7fklsUaE2UBw/hIH
         SAmCVsRpGOlEqrVR1fgPl/FfIK/6FLjeeep5Rtv6f91m9qeNjJoCwV2Y/SWXAGVdWgW2
         loxPurmkK0NtCUrRWSvDgw//B/Rd9hmyb1V2+v60gr75iowBur+v+NT+RbIeRQnyrIti
         /fcZzpF6rlKzdhTezi5SLIfn4i2vfYj1R3pasW/b3HdfUxHbrTSazfydJv+g2l2GuDg3
         f5A6ZUbj/SOUduWCXOXsHuCqp7l48O8etYFHb3Z7ct81BmPxQWppVGcLFyEbf/oTjSlY
         XG4g==
X-Forwarded-Encrypted: i=1; AJvYcCWyqrwGzmk8AbhNX9tkD1Os6Ystem8SQrRb9HV5hcqSynV8+feRiGbEay/sRdGCVxtSiRExauREx3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YylWIAWI5YD78ivGfKPfUmGbTxWm29SEHVuDlVY1zZfmTb1XIN7
	86SwBgZISrZcYR8eI2DavZt+JtsZxmLFU8TJG6pHnEe32UAS0TKbQ3D9o8xMJP8=
X-Google-Smtp-Source: AGHT+IEk+xZmWM8WKpt5tWtQhDCJGSjpzhCeDTFcsgf8Se6KNsxb5wHR97kIMZ66xEGKYHUW/E2EDQ==
X-Received: by 2002:a05:6358:6f17:b0:1c3:7b8e:c35b with SMTP id e5c5f4694b2df-1c3f9f5be1cmr617877555d.19.1730234931163;
        Tue, 29 Oct 2024 13:48:51 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2ce60sm45153996d6.108.2024.10.29.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:48:50 -0700 (PDT)
Date: Tue, 29 Oct 2024 16:48:46 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: nphamcs@gmail.com, shakeel.butt@linux.dev, mhocko@kernel.org,
	roman.gushchin@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	lizefan.x@bytedance.com, mkoutny@suse.com, corbet@lwn.net,
	lnyng@meta.com, akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <20241029204846.GB636494@cmpxchg.org>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>

On Mon, Oct 28, 2024 at 02:05:05PM -0700, Joshua Hahn wrote:
> This patch introduces a new counter to memory.stat that tracks hugeTLB
> usage, only if hugeTLB accounting is done to memory.current. This
> feature is enabled the same way hugeTLB accounting is enabled, via
> the memory_hugetlb_accounting mount flag for cgroupsv2.
> 
> 1. Why is this patch necessary?
> Currently, memcg hugeTLB accounting is an opt-in feature [1] that adds
> hugeTLB usage to memory.current. However, the metric is not reported in
> memory.stat. Given that users often interpret memory.stat as a breakdown
> of the value reported in memory.current, the disparity between the two
> reports can be confusing. This patch solves this problem by including
> the metric in memory.stat as well, but only if it is also reported in
> memory.current (it would also be confusing if the value was reported in
> memory.stat, but not in memory.current)
> 
> Aside from the consistency between the two files, we also see benefits
> in observability. Userspace might be interested in the hugeTLB footprint
> of cgroups for many reasons. For instance, system admins might want to
> verify that hugeTLB usage is distributed as expected across tasks: i.e.
> memory-intensive tasks are using more hugeTLB pages than tasks that
> don't consume a lot of memory, or are seen to fault frequently. Note that
> this is separate from wanting to inspect the distribution for limiting
> purposes (in which case, hugeTLB controller makes more sense).
> 
> 2. We already have a hugeTLB controller. Why not use that?
> It is true that hugeTLB tracks the exact value that we want. In fact, by
> enabling the hugeTLB controller, we get all of the observability
> benefits that I mentioned above, and users can check the total hugeTLB
> usage, verify if it is distributed as expected, etc.
> 
> With this said, there are 2 problems:
> (a) They are still not reported in memory.stat, which means the
>     disparity between the memcg reports are still there.
> (b) We cannot reasonably expect users to enable the hugeTLB controller
>     just for the sake of hugeTLB usage reporting, especially since
>     they don't have any use for hugeTLB usage enforcing [2].
> 
> [1] https://lore.kernel.org/all/20231006184629.155543-1-nphamcs@gmail.com/
> [2] Of course, we can't make a new patch for every feature that can be
>     duplicated. However, since the existing solution of enabling the
>     hugeTLB controller is an imperfect solution that still leaves a
>     discrepancy between memory.stat and memory.curent, I think that it
>     is reasonable to isolate the feature in this case.
>  
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
