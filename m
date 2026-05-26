Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79783B893B
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806655; cv=none; b=izcU4r/gdStVU7iUA4MNRgF1IhHaRCXaUwmBD9O0iaQwgnQnpTvgIe1BHcqdIB6qfmAvEGy6waccegU3dlCDOdXaW2AVSLAE7tcXEpMbzlAcHkepEy6hvCSGZQmIoDOJsxOCrs6A7fhpDotl8pv2O5epkfw2f2J5zwzlSyG3tCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806655; c=relaxed/simple;
	bh=JFmKYhFVUqa8WfnUp75RmKOuDTuMviRCS7alhYVIP/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dapo8G2ohp2HMkhTKQwlkKPpJ2FMIKgQV0ZTZYilO5ussW3yODlef/FxcEaropRHcR7m5LftoLD/K05QIkGR2SS8HS81B4HeRbuKYsI1gANmWsoLquY2u6dy7ypOV+ze79jSAFSzBwLj800hN8hrd/wOVbrxCAPaA9kDSFljI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVD/VRpE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kWp3CECG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVD/VRpE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kWp3CECG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779806652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HyIIbjBTqwfbMVlKvJKq+a7b1lcX+MkWTKq5+X2mHLA=;
	b=QVD/VRpEwLuLULIzqoemLyqpJivYrdKheTzd1M4EzKMvVHnkV9J9npysU4zdnwqdveIypT
	T5XeGcR38fbiUf7neDgO80CA1C4H+uRjOMvA71YWY+7aZt1lQD1/OSmMkX+1oz/wkhCmmE
	YOsi1eXgEEKPFj5NUoMOCC8mQ5qz6z4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-qQPHBs6ONqmlSQzSgahh6g-1; Tue, 26 May 2026 10:44:11 -0400
X-MC-Unique: qQPHBs6ONqmlSQzSgahh6g-1
X-Mimecast-MFC-AGG-ID: qQPHBs6ONqmlSQzSgahh6g_1779806650
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48fe40b61a3so69642585e9.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779806650; x=1780411450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyIIbjBTqwfbMVlKvJKq+a7b1lcX+MkWTKq5+X2mHLA=;
        b=kWp3CECGRdwFY8iXoAuuFmx1pI7U2aRt6mTXdCz43ZFmSZNDz7gMr7SucpDtdh6BbI
         HvpXU6Yu0fPjqTuEbWb/zr2DgVNHz0+N1hHVqEhtDtrLu4QS+6h7+sGmpGuAjAoQFVZg
         xfHrRuHIRsrLO6ofFsYogZfu4HpoNZGbU+Y07fcn01gY+gZgv9rlT1fyz71qUWrRVloX
         +LuuvUboiUZ6JAe6ZBwvJ1xPTCRSO1sXrgOKt5Hl0wK0YyOdOT8uqIxxtoQxWo/E+j1U
         yRH4spRW0/JP+4ZxjmXfHkLYqLS2+oIiAcsl5NXSJQj2FNZrRYdKNT74IBsyrD4gUbf3
         JP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806650; x=1780411450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyIIbjBTqwfbMVlKvJKq+a7b1lcX+MkWTKq5+X2mHLA=;
        b=ZLvU7CEe0ZZpn3JQXg2R1l9cWpz/eebIGtvgcnNn1RPqxZ2wgCAyhuFh6c79pWxjIe
         j1Fj2tVQON8hwz1Y360df26nlByUg0aZjujwcj+/71PmZs0kXbc97kdKjh2VxwZIBKK1
         CkzgluAloXuThsAw3pe4FLl+Kt+T9NE/jKMAuylwzyMoeB0aKSfrvgxKrvaToC2VMEyZ
         /0p9bI3vpqQfa43fB94phJMiHY/q+nj0nZeD6p7R9JWF3nGP7mf94GHUrBc4RoRULjsO
         bKs9n8AFP0mbM/0utU3FOGNYVtBuh3EjBb8qkbjDKlNhIS6t1N/sOvJ2EvH6cN+Bzowi
         dvVA==
X-Gm-Message-State: AOJu0YznQ4lzjXREdDKJ2z6FAn5T3o7N785mQN2ea12Y+gt2EAqzn8lG
	/EVxXquilFrmt85MiGBJAO9iWA8un9ou0PzZG0rVwfy86vHFxTNMMJba+kRbdCZ0qfcKN453ntl
	CdGCrnIU5zJSK5DqHiGqXD2RoEbEdP7zWmb6bY4ZT8kBG78fhcwUdM5cBZjBKe0PxrCK0COKhLA
	lWTFa/yt6Bjcsr8OxDdyDXVe5+ntrk6VnLIiQmSQTxLLiWlQ==
X-Gm-Gg: Acq92OHZSoP9UoCrJO2lv/MRI9FVsda9tBznjLXs7Wso5sFW2hNeIbwIABI9yMSK+LO
	95WYSCW3grmv6oxutBq4bb9ExcurfniugcWksrxEUIbA0TiDRdi3J68M6XIiZEbKIRyFyIun4bg
	TvjM4x5b1s/2L3Z1TNe3Ks1JuAE5DoMHKJ8LvKMNuM9ESQHwtoP5+tDKMlEFKvzOouhBI71r0Z0
	74eQ/aS0V6I6RcixQS2V/foOoxDGo4jhGNeC0osRjT+KvL84+cql98VUbpgjQm/tqRx3PuxpaGW
	Eu+ZS490sPZkjR0GUwPsMXCwASsdmG3e2wh1sVGnJdpZMzNzCDHZrPMixJ/H+QunsH4nAVVmSrE
	UZzRD4qRWY6JMd9RX63gOSQE=
X-Received: by 2002:a05:600c:4583:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-49042252732mr314246275e9.0.1779806649894;
        Tue, 26 May 2026 07:44:09 -0700 (PDT)
X-Received: by 2002:a05:600c:4583:b0:489:1b10:d896 with SMTP id 5b1f17b1804b1-49042252732mr314244805e9.0.1779806649077;
        Tue, 26 May 2026 07:44:09 -0700 (PDT)
Received: from [192.168.1.144] ([88.147.84.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454b7d57sm327015375e9.15.2026.05.26.07.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 07:44:08 -0700 (PDT)
Message-ID: <b457f6e9-ae12-4e1f-8484-f3043ca62276@redhat.com>
Date: Tue, 26 May 2026 08:45:03 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v18 14/14] Documentation: mm: update the admin
 guide for mTHP collapse
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 akpm@linux-foundation.org
Cc: aarcange@redhat.com, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
 gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz,
 jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev,
 liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com,
 matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com,
 peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com,
 rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com,
 rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com,
 shivankg@amd.com, sunnanyong@huawei.com, surenb@google.com,
 thomas.hellstrom@linux.intel.com, tiwai@suse.de, usamaarif642@gmail.com,
 vbabka@suse.cz, vishal.moola@gmail.com, wangkefeng.wang@huawei.com,
 will@kernel.org, willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260522150009.121603-1-npache@redhat.com>
 <20260522150009.121603-15-npache@redhat.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260522150009.121603-15-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/26 9:00 AM, Nico Pache wrote:
> Now that we can collapse to mTHPs lets update the admin guide to
> reflect these changes and provide proper guidance on how to utilize it.
> 
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---

Hi Andrew,

Can you please append the following fixup to this commit. 

The changes are simply undoing a deleted note i added and reworking it slightly to reflect the new khugepaged behavior.

Cheers!
--Nico

commit d81806992231ef920c731e62468a3a1b2ef6b869
Author: Nico Pache <npache@redhat.com>
Date:   Tue May 26 07:47:42 2026 -0600

    fixup: add back note and edit doc about khugepaged limits
    
    Signed-off-by: Nico Pache <npache@redhat.com>

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 644869d3adfd..ebec1e6b0e6b 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -265,6 +265,11 @@ support the following arguments::
 Khugepaged controls
 -------------------
 
+.. note::
+   khugepaged currently only searches for opportunities to collapse file/shmem
+   to PMD-sized THP. Only anonymous memory will attempt to collapse to other THP
+   sizes.
+
 khugepaged runs usually at low frequency so while one may not want to
 invoke defrag algorithms synchronously during the page faults, it
 should be worth invoking defrag at least in khugepaged. However it's


>  Documentation/admin-guide/mm/transhuge.rst | 50 +++++++++++++---------
>  1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> index 80a4d0bed70b..644869d3adfd 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -63,7 +63,8 @@ often.
>  THP can be enabled system wide or restricted to certain tasks or even
>  memory ranges inside task's address space. Unless THP is completely
>  disabled, there is ``khugepaged`` daemon that scans memory and
> -collapses sequences of basic pages into PMD-sized huge pages.
> +collapses sequences of basic pages into huge pages of either PMD size
> +or mTHP sizes, if the system is configured to do so.
>  
>  The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
>  interface and using madvise(2) and prctl(2) system calls.
> @@ -219,10 +220,10 @@ this behaviour by writing 0 to shrink_underused, and enable it by writing
>  	echo 0 > /sys/kernel/mm/transparent_hugepage/shrink_underused
>  	echo 1 > /sys/kernel/mm/transparent_hugepage/shrink_underused
>  
> -khugepaged will be automatically started when PMD-sized THP is enabled
> +khugepaged will be automatically started when any THP size is enabled
>  (either of the per-size anon control or the top-level control are set
>  to "always" or "madvise"), and it'll be automatically shutdown when
> -PMD-sized THP is disabled (when both the per-size anon control and the
> +all THP sizes are disabled (when both the per-size anon control and the
>  top-level control are "never")
>  
>  process THP controls
> @@ -264,11 +265,6 @@ support the following arguments::
>  Khugepaged controls
>  -------------------
>  
> -.. note::
> -   khugepaged currently only searches for opportunities to collapse to
> -   PMD-sized THP and no attempt is made to collapse to other THP
> -   sizes.
> -
>  khugepaged runs usually at low frequency so while one may not want to
>  invoke defrag algorithms synchronously during the page faults, it
>  should be worth invoking defrag at least in khugepaged. However it's
> @@ -296,11 +292,11 @@ allocation failure to throttle the next allocation attempt::
>  The khugepaged progress can be seen in the number of pages collapsed (note
>  that this counter may not be an exact count of the number of pages
>  collapsed, since "collapsed" could mean multiple things: (1) A PTE mapping
> -being replaced by a PMD mapping, or (2) All 4K physical pages replaced by
> -one 2M hugepage. Each may happen independently, or together, depending on
> -the type of memory and the failures that occur. As such, this value should
> -be interpreted roughly as a sign of progress, and counters in /proc/vmstat
> -consulted for more accurate accounting)::
> +being replaced by a PMD mapping, or (2) physical pages replaced by one
> +hugepage of various sizes (PMD-sized or mTHP). Each may happen independently,
> +or together, depending on the type of memory and the failures that occur.
> +As such, this value should be interpreted roughly as a sign of progress,
> +and counters in /proc/vmstat consulted for more accurate accounting)::
>  
>  	/sys/kernel/mm/transparent_hugepage/khugepaged/pages_collapsed
>  
> @@ -308,16 +304,21 @@ for each pass::
>  
>  	/sys/kernel/mm/transparent_hugepage/khugepaged/full_scans
>  
> -``max_ptes_none`` specifies how many extra small pages (that are
> -not already mapped) can be allocated when collapsing a group
> -of small pages into one large page::
> +``max_ptes_none`` specifies how many empty (none/zero) pages are allowed
> +when collapsing a group of small pages into one large page::
>  
>  	/sys/kernel/mm/transparent_hugepage/khugepaged/max_ptes_none
>  
> -A higher value leads to use additional memory for programs.
> -A lower value leads to gain less thp performance. Value of
> -max_ptes_none can waste cpu time very little, you can
> -ignore it.
> +For PMD-sized THP collapse, this directly limits the number of empty pages
> +allowed in the 2MB region.
> +
> +For mTHP collapse, only 0 or (HPAGE_PMD_NR - 1) are supported. At
> +HPAGE_PMD_NR - 1, we collapse to the highest possible order. Any intermediate
> +value will emit a warning and mTHP collapse will default to max_ptes_none=0.
> +
> +A higher value allows more empty pages, potentially leading to more memory
> +usage but better THP performance. A lower value is more conservative and
> +may result in fewer THP collapses.
>  
>  ``max_ptes_swap`` specifies how many pages can be brought in from
>  swap when collapsing a group of pages into a transparent huge page::
> @@ -337,6 +338,15 @@ that THP is shared. Exceeding the number would block the collapse::
>  
>  A higher value may increase memory footprint for some workloads.
>  
> +.. note::
> +   For mTHP collapse, khugepaged does not support collapsing regions that
> +   contain shared or swapped out pages, as this could lead to continuous
> +   promotion to higher orders. The collapse will fail if any shared or
> +   swapped PTEs are encountered during the scan.
> +
> +   Currently, madvise_collapse only supports collapsing to PMD-sized THPs
> +   and does not attempt mTHP collapses.
> +
>  Boot parameters
>  ===============
>  

