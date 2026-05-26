Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2C22DECBA
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796817; cv=pass; b=d2cxbVlFxeliIFLf1isWlh6Pzabex5daMOAB42DF1H6uEhYjanYaX3/YdLo9Lc0tGHQP11Z2BhIV9HEuDA4V9uIfKZqNlXfXrmuV/rbpkBe3fXjOAfG1doBo7f405MIEqhP223H5BT6GhQHdR1EjbIblWlcAH4eUSRGD0rCNsoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796817; c=relaxed/simple;
	bh=++rX8GA/6dLiVp5wot1X1q4t4NIATV95cr8PVbXQrxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ja39tevE0Eeude2VMBX3MQ1cAUmDsBxIHpsM2BCJAq0HK1IkEhLf2ZL5sLW/q2ItCf21PrvZ4LdN/Nc+yadJbpyBMH/YWxny46VOdQVYkASWTw4kM5DJuqHOgCuDeX2vuRcGVjgokCVq8oFBFEe8Ri3337SV/FLStDuQOqa4Kyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8Nwl6fq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CktBeHMK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8Nwl6fq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CktBeHMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779796811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPVI6FG+9wTp5VL8rvlsGJ2RfHITdLh7b6n9qoUv9X8=;
	b=E8Nwl6fq7TnqAiKFZAL5OONJdleqRjUsURVcDVdHfm+eCsSCZBHakYXVImiGp3rd8VM2xW
	4qyqQcMo2FNHewSvLnU8w6Oi7Eo6hmA4D3CRxmao5lgE9KdcWVFtftqUQ9TWD/qEb8YgtV
	OIon1qQDSDY2P/mDttnvc/y/ew5m9s0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212--FCxgSJUMjmy9NcVoImwew-1; Tue, 26 May 2026 08:00:08 -0400
X-MC-Unique: -FCxgSJUMjmy9NcVoImwew-1
X-Mimecast-MFC-AGG-ID: -FCxgSJUMjmy9NcVoImwew_1779796808
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-658c29291c7so16566902d50.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 05:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779796808; cv=none;
        d=google.com; s=arc-20240605;
        b=bZhUuVe41aMEeuGs2vlqIiIhFXRheR/zLd6uDqV4Yeba2PQdHgGWGKbUpXeBTKPA/R
         L6eYvMAKkRLhoPDXLkIsSxCROJDITGLimpqEQt2r9ZA/jYiHrpmKtSjuN4X052GcN/9q
         m7oN2ou3fnhyGGqMqmP3Fbn7KZK103/77r5VEnVwrtgz9/v3I9DyOP5eaGoo2jRYj8Mu
         mJUu7N23npNrPPso1Xmnk35MUxCvLt3gnPJDkmvvX9ATdkjIauJbDrTKGTBu1FagrRTa
         Q6959JMsVrkoO0oHuZ9iQjRHjv/Ws/Ox3w1HpxyE7kk4H3K2xgKKjuKVRF0SdQdHZ0yq
         2RRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPVI6FG+9wTp5VL8rvlsGJ2RfHITdLh7b6n9qoUv9X8=;
        fh=5VV92kMCz1ZJOMbqz+WfzrDpCVeeWd3gIFo5Q2A7lqI=;
        b=VcJUlB9nAaFk+7/x4QimvMz2x6S3h6MGUhwyF3qeUdS9THZ/StCjORha99xrVushed
         WOmCF+WDiRs+ZKY/GqjXx5xKI7s3UGBZqCWn1GHMHXRizx/JDie4g8sGp1+RTdFC4Uhl
         fn/i7/ezajd2PhH1iRyqVr6GtYzpn4qry1PK0M0GFA8yAnUA3F5faI2HRRt8qpyMwoiw
         gxyTC4U66zNK81/zl3vfDM72FsX6GY3jJaGCQZOzvGPpl6eLbBbwR1U0ngb+d2GGkF+n
         ZcSVFC4BkNtjAV5fdF8Fan8XYsa8rcMawpBGnp6Ozt4D6mbtIGP3X2dyQNGY7UEaxD5F
         TNlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779796808; x=1780401608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPVI6FG+9wTp5VL8rvlsGJ2RfHITdLh7b6n9qoUv9X8=;
        b=CktBeHMKSniHZD86Nwk6ztnntBsWXv1UvzmCUEvNPPCKV48Fn754D67Pj/iGOdUVTk
         6QSKGFVBTfwdaP6tn2yMLxt6+ogU4CzvBhPihilpTanCbopzBib/xxG+eZ2aTEtCzqsL
         BRpaOEGOjtMvQSaTzKAi0VBnUGwK9gfc4U/cM+qcIvF32NpyHVZIW8m5VoZ3F+Z0T24u
         SV0H9/Yyz9268ewM1qjdgwqVd5DDUq9dvzAsxxZkzLv7o2Nituh2/EbiWaUPTpK2RvH+
         dFZyCt1QlcfeEUYSJQ3klA4fi1SWxFZmFeBrkpX8t0eghKlihUseAjYWuytp4ealbREm
         DNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796808; x=1780401608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dPVI6FG+9wTp5VL8rvlsGJ2RfHITdLh7b6n9qoUv9X8=;
        b=FonISjKr7Vq/k7UJ3caQae2sE3V7REHs1Cwt2/0qi4QwYmA+plCkHh6BsalKtoZsYR
         feM29TeJ5V7XtoU0WyHe5Mw74g1lTXXdeoLDuKJdS/rtDt8bHJHylUgCjFVwYnDKHxNL
         EbvvQZHG1CscDnmekyQgKY8axUbuQXK7UqjjIajh0FVk14v60DVb+5Lsmo06vdOWakpN
         jxTGKMHMmVQcmLbIGrf5BDP+M/T4Nwj2QbTQtRN3lY2hYHrnjL1tFgLeE6s7c1AbTDxe
         bp7xh0z2m5vuQEQeKb/0HtYHOw0EHWgck1SvYw6e2yR1i/jKkzay40kVtySM8maXNOlB
         4ZfA==
X-Gm-Message-State: AOJu0YzIO5pJf8j+jX2g9aVdzTh8PM+9D6gbdXnYPKlmAxlAHid+dTzZ
	Hj4Pfw6ZEb+c2Bx2bQ65G5tgYyd2m6eAHUPA1SlRJxMuaNFSfRJDR6mlXLHgcOeAIhWkTwSaxzB
	JpB5USvKEfywnLw2RkDCXUu0oVzyEfZ6owKNNk14U9UQQewKMgRZZuLC6r9vcgNbrehJJtpg1qp
	WtBXymtExjdjLaLHu42NkU2Bx68E0iKUUXyHs8
X-Gm-Gg: Acq92OGMjZ/lkiBPnTJVcJarCIpykhekHsxFzOavG1tQnP4KdciUzsVEqAX50KgBFLz
	ciDzfopHxkpbtPERR8rj9rWNdTrpwhEAvc7KgUq4vZNpDTw566HrmTR2MKwNOa/RrKaAOQOooln
	zsAwgj2Ig5btgx0+VCHyDlhWSDq72Wb9v3X5YxUjXTD1WU4fBmJwK6ptPtKK+5mbXJ+FiEnLLXI
	X7rOg==
X-Received: by 2002:a05:690e:4186:b0:65c:febd:c0b7 with SMTP id 956f58d0204a3-65ec9772e80mr14934510d50.20.1779796807853;
        Tue, 26 May 2026 05:00:07 -0700 (PDT)
X-Received: by 2002:a05:690e:4186:b0:65c:febd:c0b7 with SMTP id
 956f58d0204a3-65ec9772e80mr14934471d50.20.1779796807277; Tue, 26 May 2026
 05:00:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-15-npache@redhat.com>
 <94f759f8-e2ed-4f22-b9e7-4693ad005509@kernel.org>
In-Reply-To: <94f759f8-e2ed-4f22-b9e7-4693ad005509@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 26 May 2026 06:00:39 -0600
X-Gm-Features: AVHnY4I2kJlfEdj79rgn-OjWXsjv0gbtFCil3AHTWp4P9-K4HDgNbrjoGJeC5zg
Message-ID: <CAA1CXcD0w3CJKzwTvv6gaA80XBYwTTbZGnNGJjbirYMZnBmyHg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 14/14] Documentation: mm: update the admin
 guide for mTHP collapse
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 3:59=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
>
> >
> >  process THP controls
> > @@ -264,11 +265,6 @@ support the following arguments::
> >  Khugepaged controls
> >  -------------------
> >
> > -.. note::
> > -   khugepaged currently only searches for opportunities to collapse to
> > -   PMD-sized THP and no attempt is made to collapse to other THP
> > -   sizes.
>
> Should we maybe leave this here and clarify that for file/shmem, it will =
still
> only collapse to PMD-sized THPs?

Ah yes that would be a good idea. Ill send a fixup!

Thank you :)

>
> --
> Cheers,
>
> David
>

