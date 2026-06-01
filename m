Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4236B061
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315379; cv=pass; b=U21Qx7rDpJzO5XfrmekP0ucbgM6BwQbIVFg68M2wlje56h5u93s3kcPwK5HwKAJG4SgoAwjGH5xy2AJqiL+4iThmxdb1OMospMp11LNB49oihIZ64MVY+O2WUHsJXcn5pMbQ/wfvRGexIxl4ExhH42ykeabcawYB43uiMjyiSBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315379; c=relaxed/simple;
	bh=CFgxzmbbqYlWGxzxM7D+ZILeu3gEzT4iSuq27d1AdFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuodtEVJna5AAehPiKqnZFvjwYij1zUpvUvpyXR+Y4tD9r3M22DiVY7cguA7W37Ye82rH0rsghuIwAwoC8Ctn5nrf2ISinj9zWiKvghgejm53/atospKXypZIzk2u2Gv3vyyLg6dA7VQJcYcN7vGKh2jnE5EgMXP9b3DvhYKbOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dbtgNDks; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tTHWf6AF; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dbtgNDks";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tTHWf6AF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780315377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/Dmnjx8evCUVN9l8RKJhflaCWiIEgpPUvqXkCQtCRk=;
	b=dbtgNDksv/mQVK1DYePrIay6+6Qg7cXoaM/Y/n7/JrjP5iRAGt+DiWECV5QajGHqSPjIbV
	E3JqbdLEKRDOXQrIL7P1O4VnEKFljAaxwcFKzuyZdxFkPsRqDthOd5p/j9unndMes+kdJ8
	Mac9B59jrKIzjtv2/h5QrgC8BfD1Cxc=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-IFZIOmhuO1GcXf_C91jbAw-1; Mon, 01 Jun 2026 08:02:56 -0400
X-MC-Unique: IFZIOmhuO1GcXf_C91jbAw-1
X-Mimecast-MFC-AGG-ID: IFZIOmhuO1GcXf_C91jbAw_1780315376
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6605694a059so3520437d50.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780315376; cv=none;
        d=google.com; s=arc-20240605;
        b=E0mJ2FVMYo8/PJhkieACidsQiDaUI2UdwUXRm/1JMZdIQorAR1E0OBM4Wxa3+x3a7K
         o0O0Nvhn1slaXoXOxZ0ZG9ctSh6fLY7/J3l1MITRvDWSZA54TTq3AV8mJu/Pg45oe9pa
         D/Jll0X8QSMLJ9/hbwg6z+313DsTgJa4x36IFvOOe1Vv+Wb1wOT0zltHUW+9oQtlYM22
         DYWVDm8JrlDfFl4O/z7HTli2neYYfS/V9IeWl4RixnBpz3j7Wdr0rJYqcs9lXUTFleC7
         jOVHZcQT4BdIaQ4ftx7oZgMlGWtH3Uyn57mwDjpKppAh9q+90ELc1Pkr7tlXyLKCD8MK
         K9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/Dmnjx8evCUVN9l8RKJhflaCWiIEgpPUvqXkCQtCRk=;
        fh=iRmbNBvmTVOaaG15gglLhUK1mnHiint5PALrclwTl7c=;
        b=GJJiOHFjnwA0Py7KcuJjR5DceCeiR2tM3lBjurtJqMnr8hgO8BbrJ5PIGWXXKVDGjk
         WgGBLx3bbJff3uYZPJmn2kLTYwfHneT7NfUxckRtOi8mVTo3QgefBrNtr69ZoPEfR5Ys
         1U3alQUckx/5xRXJcp2Uq3SsGkAj+dvV8TyQPv1sTyB3H+xyMmh0vCjPtlaFMQnPdDz2
         y9YBjajrGOCMuEP+Lq81KJwjf86hV/hZoGV+mxciom+H3LsSpilkq3wooTpGgT6eQWzB
         iStN+r/uAm32NQ1jH/2qn3wu/DPPrIylz0i6ZgldZNL7qJNcpkLlG45Z8NwhWlNixTWt
         R5ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780315376; x=1780920176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Dmnjx8evCUVN9l8RKJhflaCWiIEgpPUvqXkCQtCRk=;
        b=tTHWf6AFiwquLS9UX7DPK65yysReUc68p/jnwptUuRGE29aJoHUsN6CzzWmCeBdU+5
         YmOOLCoT2ufuKL5V3RbmEYiHtCqc8qR5EnQm+LKgMUSdEkjz0WzpOSHlzdi+ini32vKv
         iip6nQKX5SrbvCb/LVWOQIuocLaFCccaj+7s6AdZUdzScFoRqeF3Am0RLPMLnVkPlCeU
         yX7YENqe3Y1Il1d89wU4+dATpYPwXRzMQQqE1mkCW33pyshp0eZ52DoG3YSWelz+79j2
         yp0QHFIQr2EuA/ARsiUjmAd7CEHMAq1RtyG5h6M6x9UIPj4TqihfSSUiewienWITTf8o
         x4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315376; x=1780920176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/Dmnjx8evCUVN9l8RKJhflaCWiIEgpPUvqXkCQtCRk=;
        b=TseYcIaOYuC3VcjYJjiRLXkXxGehbHIYoqvTo1ASQGUPaP9PJmr7Y03lxyBtpwH1a/
         O/zInhwDGtz7Q8EEuA/lCujY2LKFnDg4rCMuE7tE0CQkNKE6QehW/r51LJHMGCjPMm13
         TfSRYuXAQBNwjjN7KwzWVawWBEDCg1uf9lKogUKDu5RVjtb/dPlvcfrbSCIEqJzDm5QL
         Y9lbf/mnUi2IPhsTmCYIFqtX+HcsGA+ZS2TCy21RzdMJvjb/LBEkKb9uRppdDqAK1LLi
         9BddSRgUVDG7mcGO4WT13tG+09SWGdjXFRD90S6ounPbojrX8bucynaqByGhSSitNvkX
         +euQ==
X-Gm-Message-State: AOJu0Yw27gpAINLZ1Ss3z52S3weR+RiiapfBMECrS1R6LCYKHeY9LkpK
	LmQf5qHBZpQylUZkRNBGLXhNrahDRyntYQJ3aeipciVmG0DDpgnKMoETwXfpwYZZqei2getCxB9
	o7aUG0Rg3uROkEmpngslaV8Jrb06clC+K1FJZKgwff7xLsXEoJRue6Q8vcCNH7Nt6AJ4N6nY6HY
	6DJGioeJ3HDanF9eTObdXUJFogIa+oKVvVRWTp
X-Gm-Gg: Acq92OFcPi+cEzSwJv1V8z0u/A5H7Dc8cHcucbHtrfGkhno0jlJQmFtWm4evJZ+dv3I
	7FeHf8bofCuyDgjscaUNaHfS/U0kE8xJZ+Y+Zv+d1/biuPp9pGqfWJA3CgALui7J6zYK2N0uf+m
	TLB45HDDj67Jn8lg4ojezdu1FnSk9kLqqXxslj017fsPCHOMor/CGH3rhGLSSPdyqh4Jyowmp4F
	L1m0vyQpdIrv1Tz+A==
X-Received: by 2002:a05:690e:1916:b0:660:4886:922c with SMTP id 956f58d0204a3-6605ef3d9ddmr8301955d50.17.1780315305999;
        Mon, 01 Jun 2026 05:01:45 -0700 (PDT)
X-Received: by 2002:a05:690e:1916:b0:660:4886:922c with SMTP id
 956f58d0204a3-6605ef3d9ddmr8297124d50.17.1780315266993; Mon, 01 Jun 2026
 05:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-12-npache@redhat.com> <20260531071845.10875-1-lance.yang@linux.dev>
 <6a9f062c-8376-4f83-90a9-8b167f925dc6@linux.dev>
In-Reply-To: <6a9f062c-8376-4f83-90a9-8b167f925dc6@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 1 Jun 2026 06:01:46 -0600
X-Gm-Features: AVHnY4Ifoce-ym9rt4H7XGBtAQemIZHZ2nK_-zOeAzqon_03N1y6C3UXAt3eth4
Message-ID: <CAA1CXcCfww9X-f2Vb=ipz8tY2nMNnMx5_58Ozz63tvZTz_wpOw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com, 
	gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, 
	jackmanb@google.com, jannh@google.com, jglisse@google.com, 
	joshua.hahnjy@gmail.com, kas@kernel.org, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 2:48=E2=80=AFAM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2026/5/31 15:18, Lance Yang wrote:
> >
> > On Fri, May 22, 2026 at 09:00:06AM -0600, Nico Pache wrote:
> > [...]
> >> @@ -1587,10 +1749,11 @@ static enum scan_result collapse_scan_pmd(stru=
ct mm_struct *mm,
> >>      if (result =3D=3D SCAN_SUCCEED) {
> >>              /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> >>              mmap_read_unlock(mm);
> >> -            result =3D collapse_huge_page(mm, start_addr, referenced,
> >> -                                        unmapped, cc, HPAGE_PMD_ORDER=
);
> >> -            /* collapse_huge_page will return with the mmap_lock rele=
ased */
> >> +            nr_collapsed =3D mthp_collapse(mm, vma, start_addr, refer=
enced,
> >> +                                         unmapped, cc, enabled_orders=
);
> >> +            /* mmap_lock was released above, set lock_dropped */
> >>              *lock_dropped =3D true;
> >> +            result =3D nr_collapsed ? SCAN_SUCCEED : SCAN_FAIL;
> >
> > Hmm ... don't we lose the allocation-failure result here?
> >
> > Previously collapse_scan_pmd() propagated SCAN_ALLOC_HUGE_PAGE_FAIL fro=
m
> > collapse_huge_page(), so khugepaged would call khugepaged_alloc_sleep()
> > in khugepaged_do_scan().
> >
> > Now if allocation fails and nr_collapsed stays 0, we just return
> > SCAN_FAIL. So we won't back off via khugepaged_alloc_sleep() anymore?
>
> Looks like this is a more general issue with mthp_collapse() only
> returning nr_collapsed.
>
> For example, SCAN_PMD_MAPPED used to be propagated too, and
> madvise_collapse() treats that as success. With the new code, if
> nothing was collapsed by this call, that can also become SCAN_FAIL ...
>
> So I think we should keep both.

Yeah I thought about this before, but more regarding the "incorrect"
propagation of errors; I didn't consider that those results were
actually being considered.

I actually had a patch to track the last_failure (with some
prioritization on certain results). I think that would solve this
issue.

Thanks for reminding me to improve this.

Depending on how the rest of the reviews go, I can either send up a
follow up series to do some more cleanups and improvements of the
current approach or we can send out a v19.

Cheers,
-- Nico

>
> Cheers, Lance
>

