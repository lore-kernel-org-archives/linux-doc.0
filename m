Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAC53DDDD7
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784391331; cv=none; b=M0VAAvp4HOQNvsHu42RQGqLsPnboZk5cGRars5WvZjXhlFoQVijaZ8wKHB5DanNHi00Spsdb7oyKhIw5QWepc0Wn0kQLi8Ob35RmxB6yh+JV0+ZjK235eywDxUPNlALfwObbFjIBghRWfEZZbrgUkHuBzleKTnPZhLss6mDKjGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784391331; c=relaxed/simple;
	bh=UVRl6+45JEPsmFa5LrFWXxbefAQpR6qa1hYB+g7yumM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoGLmYSO8OUyt4nZAUVVAklnq9oocZm3HuF8870AyvmkWhE3HfMYfClx2UXSwY+19M29QuQ8x3xKPVY0xvakNWxAOfuQxix59OjZ3YhQVgXbNXVcKikfjMFbsHgJyBQ4p6kiUrdd7j1xpIMvTUeuqnB7yrmOOK/PCqtasDL+gac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=IJC/UW9V; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="IJC/UW9V"
Date: Sun, 19 Jul 2026 00:14:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784391322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/xNegEL4PT84TO9lU4Abib9nuHUBZ4N5o+if3P1qvT8=;
	b=IJC/UW9V+aBZ3h1nZeoiXlIWBHlglCjZCA6JSo59qFM6T0eu/ssX9NDw52P7PyxajyJb41
	mu+usYnD0jSjrl0oKuToFuFFbxMOY0aIKHJEXGjvPmwLep/N6oFuuHtO22GElz1N7eyFkR
	JRloVkDzdN+nR07bF8ZY5pz4ja1796mvXmTWYKWHAn2TfAy53A6ULdQAYSnFHG48TopT55
	C9EmXhQJ0RSZM1S07AadJBSC8PC6IOcaGBheQLnxpRf6iotq3bVzIJ3g+9T7WEDrLKm26f
	gfEvfbfa62L9R7xu4OUE/nyfh8qQDgrLQN7Xq//x0KgtBOONFY1IiRR+ZpL4Kw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] Documentation: admin-guide: fix trailing whitespace
 in cgroup-v2.rst
Message-ID: <alumXzlDApA_iMbY@wyuan.org>
References: <20260718151913.1892547-1-yahya@yahyatoubali.me>
 <20260718151913.1892547-2-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718151913.1892547-2-yahya@yahyatoubali.me>
X-Migadu-Flow: FLOW_OUT

On Sat, Jul 18, 2026 at 04:19:08PM +0100, Yahya Toubali wrote:
> Remove trailing spaces on lines 1335 and 2197.
> 
> Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>

Hmmm, for a file that might be modified, I wonder if it makes sense to
include fixed line numbers in the commit message. i.e. When the line
number changes, your commit message will become meaningless.

I'd love to hear others' comments.

Thanks.

> ---
>  Documentation/admin-guide/cgroup-v2.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 14b8c571c0d1..f15a613fed6a 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1,4 +1,5 @@
>  .. _cgroup-v2:
> +.. SPDX-License-Identifier: GPL-2.0
>  
>  ================
>  Control Group v2
> @@ -1332,7 +1333,7 @@ PAGE_SIZE multiple when read back.
>  	cgroup is within its effective low boundary, the cgroup's
>  	memory won't be reclaimed unless there is no reclaimable
>  	memory available in unprotected cgroups.
> -	Above the effective low	boundary (or 
> +	Above the effective low	boundary (or
>  	effective min boundary if it is higher), pages are reclaimed
>  	proportionally to the overage, reducing reclaim pressure for
>  	smaller overages.
> @@ -2194,7 +2195,7 @@ of the two is enforced.
>  
>  cgroup writeback requires explicit support from the underlying
>  filesystem.  Currently, cgroup writeback is implemented on ext2, ext4,
> -btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are 
> +btrfs, f2fs, and xfs.  On other filesystems, all writeback IOs are
>  attributed to the root cgroup.
>  
>  There are inherent differences in memory and writeback management
