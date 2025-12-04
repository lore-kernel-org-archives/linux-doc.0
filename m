Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB40F27E077
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764872939; cv=none; b=i+10sF4rcyUeNIYrIa+GTOnNT5K57s4CedYsW7UynmrLDJa2ee7HBlIJv9aDUgS7a7s631MrDjIk0ZYa580cdzvvH6kfcDE7JC+FGVeryMKcQzZNsyw1ARc3ifhOFLQaWkPF9lZQX9Lj46dv9w6Fjx17JjgcgsvJ9ybqsqmp0dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764872939; c=relaxed/simple;
	bh=5GqhyZT6Rt3PfQ/6GKSyzDj33c7nIyXN6+SMU3m/DgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc5Ohl3GEBVSiN/z6lFQYFo6DJAgL15GjXwFLRcUI8mC5G0aipP2fpGwC/HCgIw80xW35PQjT21eoDcuxhYHMt8W/RiDte6Zqb8n8gcikZZbdRQbjXZmD5FB5ir5LV1lL0fq48529lJXyeMtVwppsjzIaz1lSnLt0w/vHrWb4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=lxeQUoo0; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="lxeQUoo0"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so14084251cf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 10:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1764872935; x=1765477735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbYKo00Iv7GRqeuEurZ+VNuUOvRrRabNx4MSyyDcnsw=;
        b=lxeQUoo0LyPiKrmh97mRwEgczR4+misUTNkh0pxOPHRfbrK/EHBeZnNl0I6yN4X+47
         uJMn9LxJgIg22LlikYUugDNSvD9TjiboVdGeHZDTs++B7vx70ndQM4gSlQ5RIlpGaYI7
         T6Kc+AydSZF6QKn7kVcM1eEdgYukQp6THfVvCpq6Rs4zsqXzwa1t3LVhLAu7AunT3S+r
         m+gmiqnkAwSSmSc14eYRd2/pgcM0HlZ7QJV833wI1raGmVnCc2Z05q9aBcRJjDoL7OyY
         R/IDiZ0gO80Iq5TFfBo1oaU74bJPGnBfFY1vehLQTLCaCSGk6CxXW3fdvkrKyNVO/rn7
         noeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872935; x=1765477735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbYKo00Iv7GRqeuEurZ+VNuUOvRrRabNx4MSyyDcnsw=;
        b=DZ8tGWIIAZDacMOGtnjP8PvMBV210bw4qeTvKD0QJUtm60ZS0094tMqj2YPjXzjaJB
         0/SPNTEC7VRgLPs/ZXrE2miBdEVLWiTd21zxw9RhESlo2TrYD1weWLizi8MsNlxjUGTl
         Y+jpawVSezHQarMvaRBQCLHOW/Kfq3ES2QEnfFCeKZpdvwNvol5g4XDNNoqADNFvOXc8
         9Wy30cmQJwE5ixNolCjIcceCcwrm+g/dLDqe1dT5F9IfKfNno7c3oPRmkoB925xsEVuR
         9OikVRlUQr6n9iTl2Y0vtdazbjZ0s/tYFYkwuDZKp0otqBPSqHYJIxAwqG7e4VMtQ3pr
         1tOA==
X-Forwarded-Encrypted: i=1; AJvYcCWWWj9nE6oXMvghNrrCHCaEogI1iZEgvXb16+Lq/Lz9LhimKaxC+9gSbVRxHkejErpqpzfm14nvNZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeaOvlFCZ9owMczGPQH3Pi2tOloEjL8dIPHYGhK/f14BcYW+mG
	55+D70V/yq2bdT+BbqTWc39HR5FuZsVXstJq/5aebUwUvDVGvoH/z20KP+HilAx5QRE=
X-Gm-Gg: ASbGnctxOz0RdAEsXobja1t/b46IBOV5I4HcaQixXe3kHepJu2q6ZOw0XYE0//FOLT5
	Z0XZwZOIZ9yErPHGydp88X9pggE/Cis9gQfX7tX/PwYqSbRkqWBdAXWwTU4PO/d+Ci//6xEICnj
	9mMsR9Ryt838PyXm62bWUezB+W2PC3ZX08iEwHTQrAEu0M/6vGG7v+eN4w+Fsr9XFd7M3qnO2wA
	Hz8xvxShmbwiJXZssPDMWMfRtlyWZDMuNYePXFb8p0qtFLMhUsX4QWOsHVkKhPtMFpfwytBuXmh
	/GjKPdfd7QDpjPa1ClI868HYL7IMQTqJi3LRcVTXwOCxL4EXoa8x0qLCKhupML0yfDbV/mKDhD3
	pNO2LfsYOXAEPpXG5KwksT9xMeeCmnuTu1X3fuSXo7sGCeZ/jfBZUpk0AjW/ZvHwmKkryi+dke3
	va9cl+HI0FDlyyidxU/nhh
X-Google-Smtp-Source: AGHT+IGZlFZPSAeM4UXQLHs00EEi+GdYO84wd6mPsj8XuMELP7WRFAZg4UDdzJCd4HZJh7eQnkG5Jg==
X-Received: by 2002:ac8:59cf:0:b0:4ed:e5c1:798 with SMTP id d75a77b69052e-4f023a08b64mr52873691cf.35.1764872935525;
        Thu, 04 Dec 2025 10:28:55 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f49e51sm15291736d6.15.2025.12.04.10.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:28:54 -0800 (PST)
Date: Thu, 4 Dec 2025 13:28:50 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, yuzhao@google.com,
	zhengqi.arch@bytedance.com, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, lujialin4@huawei.com,
	chenridong@huawei.com
Subject: Re: [RFC PATCH -next 1/2] mm/mglru: use mem_cgroup_iter for global
 reclaim
Message-ID: <20251204182850.GA481418@cmpxchg.org>
References: <20251204123124.1822965-1-chenridong@huaweicloud.com>
 <20251204123124.1822965-2-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204123124.1822965-2-chenridong@huaweicloud.com>

On Thu, Dec 04, 2025 at 12:31:23PM +0000, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> The memcg LRU was originally introduced for global reclaim to enhance
> scalability. However, its implementation complexity has led to performance
> regressions when dealing with a large number of memory cgroups [1].
> 
> As suggested by Johannes [1], this patch adopts mem_cgroup_iter with
> cookie-based iteration for global reclaim, aligning with the approach
> already used in shrink_node_memcgs. This simplification removes the
> dedicated memcg LRU tracking while maintaining the core functionality.
> 
> It performed a stress test based on Zhao Yu's methodology [2] on a
> 1 TB, 4-node NUMA system. The results are summarized below:
> 
> 					memcg LRU    memcg iter
> stddev(pgsteal) / mean(pgsteal)            91.2%         75.7%
> sum(pgsteal) / sum(requested)             216.4%        230.5%
> 
> The new implementation demonstrates a significant improvement in
> fairness, reducing the standard deviation relative to the mean by
> 15.5 percentage points. While the reclaim accuracy shows a slight
> increase in overscan (from 85086871 to 90633890, 6.5%).
> 
> The primary benefits of this change are:
> 1. Simplified codebase by removing custom memcg LRU infrastructure
> 2. Improved fairness in memory reclaim across multiple cgroups
> 3. Better performance when creating many memory cgroups
> 
> [1] https://lore.kernel.org/r/20251126171513.GC135004@cmpxchg.org
> [2] https://lore.kernel.org/r/20221222041905.2431096-7-yuzhao@google.com
> Signed-off-by: Chen Ridong <chenridong@huawei.com>

Acked-by: Johannes Weiner <hannes@cmxpchg.org>

The diff and the test results look good to me. Comparing the resulting
shrink_many() with shrink_node_memcgs(), this also looks like a great
step towards maintainability and unification.

Thanks!

