Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB9042B733;
	Fri, 17 Jul 2026 16:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306718; cv=none; b=og558Knqe3IfNxrFCp0nkdBgLVIJVqGK+zD399CCDdrrD4wBeUv1DD9laDq0JmvAtlysv3PO74ulzBilJKjglC2I01Nmlnsf1gYebASbzk5ZbsVj+HsdgouevZ7w2VYTOpCY9z8c1r4TEQAp0tgK9MrMtIpUhJ2bD3ncBNGLSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306718; c=relaxed/simple;
	bh=emB5DMp0SG+FK37IIQGl54VN8oIxpCVp4E98E+Y6zy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuJIV7jDrns6a01NQQ5AIBVvfDBUQBO4TE5agQuTRrMgEk23JdTxNR3uPbHyRpVMkvOxQ9BA16N5uIQxI65a6OEYNvY2GKw+wC4trfgmK8S06QTFbxqh1+qPSPMU1LmWjUq7kONiRwvt0y3MEz/kvMCh4WmZghD9pqnuSaCDGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drhYBjEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drhYBjEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A341F000E9;
	Fri, 17 Jul 2026 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784306716;
	bh=JEgz/CuntGYOStSpXI8ppA6RRWGY8vrtqmOKGB5rJN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=drhYBjEdbIEtNEffOHoK7lQvDmXwU7AqVV16o0gLOjipONy1TPiIEs93jVorFdvNO
	 IAvhXSdVYUIuNpYru36/4waLFeEH8fE5vluUdjmRPsxnUcFvW2/DDiouGo10o3BPyq
	 NTQl7Vhwcfef2QymsWh2eC41M9Fz6mprklcptBCeysB77HbmEcb9uENHzN8tHJkKYc
	 zxKPS6RSVI5qHbNWGxMT5TdcbGCRcw5eg1GrSFwkZFyGjen31Y3LaDDlpUrEd1dmOe
	 Y0tEeEiwV6KSxksr7nW1W/IP3rs/CwBdBU37Jj1z2aPK08/UM646W353D3Ods1ZO9z
	 j7rxK2OEiJgsw==
Date: Fri, 17 Jul 2026 16:45:15 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <alpcFCuIFqP2FCOB@google.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085151.22822-3-jiahao.kernel@gmail.com>

On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> From: Hao Jia <jiahao1@lixiang.com>
> 
> Currently, shrink_memcg() writes back at most one entry per-node during
> its traversal. This makes shrink_worker() inefficient, as it must
> repeatedly re-enter shrink_memcg() to make any substantial progress.
> Under high memory pressure, this can cause the writeback speed to be
> too slow to keep up with refaults, leading to zswap store failures and
> forcing pages to skip zswap and go directly to disk, which results in
> an LRU inversion.
> 
> To address this, extend shrink_memcg() and rewrite its LRU iteration logic
> to support batch writeback. Introduce the nr_to_scan parameter to bound how
> many pages are scanned per call. This enables batch writeback in the
> shrink_worker() path, while maintaining a low scan budget in the
> zswap_store() path.
> 
> Test Setup:
> - Total memory: 32 GB.
> - zswap settings: max_pool_percent=1, accept_threshold_percent=50,
>   shrinker_enabled=N.
> 
> Test Case 1:
> Allocate 512MB of anonymous pages and fill them with random data (to avoid
> compression), then use cgroup memory.reclaim to force a large amount of
> anonymous pages into zswap. At an interval of 2ms, allocate a 4K anonymous
> page where the first 4 bytes are random numbers and the rest are zeros, and
> then trigger a reclamation of this 4K anonymous page through cgroup
> memory.reclaim. When the pool threshold is reached, shrink_memcg() will
> be triggered.
> The test data after running for 120s is as follows:
>                                 Baseline       Patched
> shrink_worker wakeups              5,363            85
> shrink_memcg calls            11,373,201       180,928
> written_back pages                40,212        40,236
> zswap_store calls                161,190       168,741
>    store succeeded (ret=1)       102,743       127,644
>    store rejected (ret=0)         58,447        41,097
>    store reject rate                ~36%          ~24%
> pool_limit_hit delta              55,826        14,062
> pswpout                           98,659        81,333
> pswpin                                 2             1
> 
> Test Case 2:
> To consistently force zswap store failures and trigger shrink_worker(),
> the following stress-ng command was run for 120 seconds within a cgroup
> limited to a memory.max of 1G:
>    bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>    exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t \
> 120s -q'
> The test data after running for 120s is as follows:
>                                 Baseline       Patched
> shrink_worker wakeups              5,640           987
> shrink_memcg calls             8,481,500     2,504,818
> written_back pages                   260       768,576
> zswap_store calls              2,742,756     2,301,414
>    store succeeded (ret=1)       934,640     1,308,686
>    store rejected (ret=0)      1,808,116       992,728
>    store reject rate                ~66%          ~43%
> pool_limit_hit delta           1,181,310       101,593
> pswpout                        1,808,376     1,761,304
> pswpin                         4,288,497     3,902,658
> 
> Under identical workloads and runtimes, batching the zswap shrinker
> exhibits a significant reduction in both shrink_worker wakeups and
> shrink_memcg calls. Furthermore, the sharp drop in both pool_limit_hit
> and zswap_store rejections demonstrates that batching the zswap shrinker
> effectively mitigates zswap_store failures caused by hitting the pool
> limit. This significantly prevents pages from bypassing zswap and falling
> back directly to disk, thereby reducing LRU inversion.
> 
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>

Acked-by: Yosry Ahmed <yosry@kernel.org>
