Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9AE336886
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401647; cv=pass; b=UMhTM1uOVx/Veh9qopxb4ome4Yd+6YVe9nNO90GDmlydRSMGWpt9gXPXSZOd3wUWivCnz7Sf2sxbZMGIZ4ib32OgN/xoLquwhjYLIxcjrxDc6GSrfIOcZJe/TJV61NhVYSK4NygacchHIjzUYaqKnC/ZI9R6LVeb9S6gB5CV7MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401647; c=relaxed/simple;
	bh=AUHhF/E2fQxhW/g6jyemlRTJNX6eDQwBBKIp7y9MRJ0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxIJVgt1XIn2FPt6TzoAR1C6ZThVcI9MmIjJ3SJ3xn6YeS7Ri6TAoQVH/hbLScCvgkhtj0G+PLf3Cjcdn5l4oZHqsib90DaYFZsD3kvG5GLbupbOjlV78HG1bXqsGErXMD4AgcqUMUgfsMNthy/+WgResz22Wa1fUxxEUQJJdw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dIHey0xC; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dIHey0xC"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-857ff9fef54so26479607b3.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401645; cv=none;
        d=google.com; s=arc-20260327;
        b=Xd73vxWusndHBOivHyNlZd0n3/kqEpWlFI1ZeV2jqnSJXLaelqqCKpwQwG6tju1Omv
         OP3aChfKSMPPNY8c8MRa5n2aiU6ebdQU5c5MsPPvpZ2c/mbMWRqbzuOHm0GinTo35HOQ
         /yo00vNg7QzoApE+o4QoXNECQ9n8PXSLh+B1V9+w0rLW6RICvldFEGwe5Sr+sUvZSKU6
         LSkTcCMCekDjmCX7raavip/+xgW1N2wCNzAvpyDpPSyfm09Xc+5M4ogXiA/e9WbEhMQS
         sztIUUcOFXDSZmanDd1Ui305cMFdkSCCOINahAR+df6WkCvsIPzv7DWV+rdLl9yaIL5q
         W7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        fh=WLt6Js18BUAoAxz0Ta7O7L15oVCG0YbwdO/9C9mxtMQ=;
        b=l0P5uNqlH3s0Vf7NHExI44DNDZrdMji72yFlQcRVzR3mQxuW15mEZTUO30sZY3omYr
         XNsbBbvK3wtutPZ4gzbpsyDlZxV0MRhTFGoAzKj5XbmFhpm77nvyqkRMSywwgjxdoBu0
         9VvXmQiRaAHevl6AwvCeSxcUyf2SIZpFWgzwb0/I+jDTYvzGKW/SIu++Pyj4sOW9GWiu
         PkrMI7yPx4Fl+1hfh9Cvjh2t79M0gZW9G80BIlxs3mamOEF3QyIqfgx6gUZ7f/etX97M
         I2UN4BU8wQhb21KQ5RBX1YqwkkdK56soZQOnT2PSebFY6OS5XbCgjXkzHMlCnzAx58lu
         ru7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401645; x=1790006445; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        b=dIHey0xCG9zCD3Fud294ousPBx1CBm69N2UfmH9aQOT5X1fUX1LBLCMZVv9eBNwv9T
         f3PR33NmX3XkjmSK2xtWfsjSn7eKCTbJYZ70h3v+N4hVGauDZ27t39w5h2QfPOjK8Z6l
         WzFIbyH6iVBUJACXdL5RcTI4TplrDEIoS4JIaXKB9+uHdJUGqUxjzLaE8PfqL3543jXg
         EJEatK+38VLzpY5yGUmGH7+yVmJff9/WnIpm6K1mmD2h7YsusMq2j6umCEnJFAoA0v/j
         4hHVt/LQhf9yHXc1FyPsDUCZ2CY5ktNxRsUOP8TjvO/X0C+vV7jHDLSMW2Hz8spEY+lR
         AHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401645; x=1790006445;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnhKlSBSQOh8ZFl8Jf+/YlwJHlkv+MXRYwatR7ezOHY=;
        b=K7C2V+AZt0oolXi6hizdeYOhbFXBw2qGGSfJZ8Gtm1NPH57AXeX2NBbp+gHwkme/HT
         ijQazGJ0hlCnMnLvsbeNiTHnooy7KC9NwNYQ6urAk/foUTzd6DvgVbFt8yruYllOksjI
         DyQAr7DgNudkHficTXqBvbs1+mO3KFwuSTHDjqPLJmDw3tEMtFQJPStfLJMxPJ9yxhC2
         VWrngQqVytqThOxR7kwAtywhlzE7CncekWOEVFh4dgtn6dxUFJguVs4r/TH1lvN8bbyp
         g671x2jFUw9fDf1HKxfSpzl5OFpNZJCRgYBVMdJV8xVeZxyWovjn49VMOic88YoJV1Jk
         58gA==
X-Forwarded-Encrypted: i=1; AKwUvBzThgoflo3gpKWmDZiU0TSWTOrDji+Ymk64VM9m7VSRdavdhJkLNfiatY4+7gpXdmU4BGmqd8vSA4w=@vger.kernel.org
X-Gm-Message-State: AFuF++laNwTXI2v2Kl8EcjQ/DfOrI/DN1DkHs/mN/4ClmNe2eDL7V7iP
	vqraJaCkNkGYXFLtV5ERahtQ7GZ7Mgerw6FoNrKW6HlZxxx8iA5+0VUd5yAoaat/xJqcxE5yhfX
	UunA2b83sIaFZADq0GekXrTYk3WQ7jYLeBdF/lEY1
X-Gm-Gg: AYBFou0Xc1nlaTsqqgIKoPLGWXfZlWqLavTP6wEUZ+xKGd39QS+grwsGzmK6lTttoUp
	CiKg5b+uPcprEagLiO5zuhTeCK6+dOW5Ml4R7ymRga/uBmXylQaNudN/Ijux9GTDouVfbEVQfqk
	JVN1ovN/Fuc5qvAatm3iFArerl3r7XCUvrsIAOMgte/28LZgLEIE06t5Yufcdk3buZevtlw4oUs
	O8SgqBgT0FuU5dR/SP56qdi3dYMkuEfdc5W0h7HUXUHLDylwjC4+sl4mOdXtTC8k9KRr2P+3kbF
	zHBhv0g1HXVp68+G39BGa0YGMVCWNInIrzpvNvjFjsyMpY5OIghR6dnCJivhkx6+4ubiG5BNSs+
	FXxLAkzBEFH2h7I3MU1qc
X-Received: by 2002:a05:690c:7483:b0:85b:946f:129e with SMTP id
 00721157ae682-88d21832f4cmr13001707b3.33.1789401644112; Mon, 14 Sep 2026
 09:00:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:00:43 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:00:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911143726.3689114-1-joshua.hahnjy@gmail.com>
References: <20260911143726.3689114-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:00:43 -0700
X-Gm-Features: AcwNN1VDnqeI0nANt9JGLFAAqZR4p_p34VigeOi4yaGir0FMb_J4_8lM3yPMIDM
Message-ID: <CAEvNRgHsJKS5gszvJRpoJ2YHn3A3n_V4F_zgpFQMPdVcRvKffQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: hugetlb: Fix out_put_pages subpool reserve calculation
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

>
> [...snip...]
>
>> @@ -6821,26 +6823,21 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	}
>>  	return chg;
>>
>> -out_put_pages:
>> -	spool_resv = chg - gbl_reserve;
>> -	if (spool_resv) {
>> -		/* put sub pool's reservation back, chg - gbl_reserve */
>> -		gbl_resv = hugepage_subpool_put_pages(spool, spool_resv);
>> -		/*
>> -		 * subpool's reserved pages can not be put back due to race,
>> -		 * return to hstate.
>> -		 */
>> -		hugetlb_acct_memory(h, -gbl_resv);
>> -	}
>> -	/* Restore used_hpages for pages that failed global reservation */
>> -	if (gbl_reserve && spool) {
>> -		unsigned long flags;
>> + out_put_pages:
>
> I'm not sure if this section warrants these two comment blocks anymore.
> The logic is quite straightforward now that we don't have to worry about
> managing the global / subpool reservations separately and rather just
> simply do the subtraction to account the memory.
>
>> +	/*
>> +	 * Return all that was requested from the subpool, let subpool
>> +	 * tell us the new number of reservations that need to be
>> +	 * returned to the global pool.
>> +	 */

I think this could be removed if you think it's obvious enough.

>> +	gbl_resv_put = hugepage_subpool_put_pages(spool, chg);
>> +	/*
>> +	 * There may be a difference between the number of
>> +	 * reservations to consume and the number to restore now if
>> +	 * there are multiple threads interacting with the subpool -
>> +	 * restore the difference.
>> +	 */

However, this other thing about threads racing needs to be emphasized
imo. Both subpool and hstate tracking are global. I believe pretty much
anything that updates global state based on local variables only in 1
thread is going to mess up the global state.

>> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>>
>> -		spin_lock_irqsave(&spool->lock, flags);
>> -		if (spool->max_hpages != -1)
>> -			spool->used_hpages -= gbl_reserve;
>> -		unlock_or_release_subpool(spool, flags);
>> -	}
>>  out_uncharge_cgroup:
>>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>>  					    chg * pages_per_huge_page(h), h_cg);
>>
>> --
>> 2.55.0.1007.g17ff1f9808-goog
