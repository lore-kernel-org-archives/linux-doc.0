Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE432FA18;
	Wed, 12 Aug 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524070; cv=none; b=PLrl6M5Hq+tONJhnjdNERac/o2IHLuSg4KTTqkYlNcqf2DKLb5ULfwSAv4GGRoCluc0zMYqVSU68zC57tUI3UlYL34lmIQzXMGp+qBl0Kinx9/4Hmnk4xDSSelankm1O2kXyszs+eJK7edbu+CZtKD9DSmI+vWyWlakeuawPY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524070; c=relaxed/simple;
	bh=Pvu8AYtFfy0pRZo2tjlUh5AhK3srCQgZolmufTh4OyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4I7suXuu9GrsLnaVRTDJD7SJD8Dow6aA+50G6FzRjSUzmEE4mG+UdGm6v22kwDEJ2/NNdzfn7rvSkRMUXZS6AqNj5KZMuFdWBWL/s9yD1VwN0iiZdrA9YhVduZDDY9D2O9RhUzPa50hPr5hOy45KM9xePD121o3Z0XCyIlIQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lniMTV+6; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lniMTV+6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786524063; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=9x325DipK2ypH2fNGZ/mp/01KH+en2kf0GHRtk/+Iyo=;
	b=lniMTV+62DfgcC14sCxvhWjH2Rtdp+I/AUb3+a/yQqE3n+3caueTjdDOYqbSIissoi0QATrLzF8lZGBGyTNeB6ybbaLp3UUeHFxJr+Sdt7UvfvscCsm1XxidGfJqUHNd3apjKlIuQuYSNUMQMuZs3gJvj4q91qhdzr9Jy9PKWJ4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X8r1qkw_1786524061;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8r1qkw_1786524061 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 12 Aug 2026 16:41:02 +0800
Message-ID: <d49ced6c-5ea0-4458-8886-09308b606483@linux.alibaba.com>
Date: Wed, 12 Aug 2026 16:41:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Docs/mm: fix THP policy counts in transhuge
To: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, ziy@nvidia.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812080313.330413-1-husong@kylinos.cn>
 <20260812080313.330413-3-husong@kylinos.cn>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260812080313.330413-3-husong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/12/26 4:03 PM, Song Hu wrote:
> transhuge.rst claims seven policies for transparent_hugepage_shmem= and
> four for transparent_hugepage_tmpfs=.  Both boot parameters are parsed by
> shmem_parse_huge(), which accepts six: always, within_size, advise, never,
> deny and force.  The "four" applies only to the per-mount huge= option
> (shmem_param_enums_huge).  Fix both counts to six.
> 
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>   Documentation/admin-guide/mm/transhuge.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index b187d618452f..72e944f49da5 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -389,14 +389,14 @@ is not defined within a valid ``thp_anon``, its policy will default to
>   Similarly to ``transparent_hugepage``, you can control the hugepage
>   allocation policy for the internal shmem mount by using the kernel parameter
>   ``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
> -seven valid policies for shmem (``always``, ``within_size``, ``advise``,
> +six valid policies for shmem (``always``, ``within_size``, ``advise``,
>   ``never``, ``deny``, and ``force``).

Right.


>   Similarly to ``transparent_hugepage_shmem``, you can control the default
>   hugepage allocation policy for the tmpfs mount by using the kernel parameter
>   ``transparent_hugepage_tmpfs=<policy>``, where ``<policy>`` is one of the
> -four valid policies for tmpfs (``always``, ``within_size``, ``advise``,
> -``never``). The tmpfs mount default policy is ``never``.
> +six valid policies for tmpfs (``always``, ``within_size``, ``advise``,
> +``never``, ``deny``, and ``force``). The tmpfs mount default policy is ``never``.

But this is wrong. Original comments are correct.
