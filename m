Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAFB25F798
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755613502; cv=none; b=m/isq1fHPVpKEkqKHH0Z5V9SKYpf5DiiHvmrBM5wWref2uOC4CLlxQhYEHWCZ89irGsZwb2su3EmP1OdYHBKhY5LL35mNZN9a4rhDf6xxaL5hMdx8AWQGWECEFDjqtA+/QRfwXWVfAo1Hur7iepVCLN5ppe5XZWbSSg3P1noYaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755613502; c=relaxed/simple;
	bh=0ewSci4kwM8psxpmJDgOyj1lMoJLg+oHg22M0eYrYNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RC2224GgQ/zvyx/EkckY6/TgC9q41FP3TNaz55wjFuXRViZkwz+Cx2LPh6bZPcsA+O4HIE411Mx6UQ2DUZ7/K/d/O7dvzjGCBbifMQCsr12bBcDLx/3dIidlBqLF/smtjsIxJC5e2GNlh8lzIDgBvLh6KGbS5cEhe5f2Tv82QvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqixbGlZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqixbGlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755613498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f+6rtgrIobcRQVsNX25xQXMRbcgLTca8mFUg3pNO2o0=;
	b=dqixbGlZgtfQQorYjYTum1Ufm1qhhZppRZ+SZvvZZLXGYK8ypctx7ej+agWpXYiJF+Yrez
	mxtQTXppvEVD0bGB9dQknbBLnOHKrUXeRtdooIRqBebb9rFdCn9DPmxyUT0DcyL1mpghE3
	TTe72CWJgUPVrlsorf/KHjP2tYgyfQQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-cwL0xH6FPeGUDSeEkg5IKQ-1; Tue, 19 Aug 2025 10:24:56 -0400
X-MC-Unique: cwL0xH6FPeGUDSeEkg5IKQ-1
X-Mimecast-MFC-AGG-ID: cwL0xH6FPeGUDSeEkg5IKQ_1755613495
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-71d60163d68so74683607b3.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 07:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755613495; x=1756218295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+6rtgrIobcRQVsNX25xQXMRbcgLTca8mFUg3pNO2o0=;
        b=qmMrgGl5InuJfmt2xegsX+yL6AVuZiWYMr2GqLorqVUtgLfuRrPdvMRF2wgazqmFlU
         zA/oh6xFhYHIHg51kXJyWBIhQUls75mHMPXkd3TQsM7Q9nszh4SlX4qEJNxnWo+OgY5T
         k7Ju/JrZ5Oz0zbezYr/NN3yc1i3yx7HL/iOCVt7D8ZlQ0Sj+jKN8ImYmMSXHo+su1rWj
         Ge2Dvpa9Gp7NmJo1NjGqt0UX3wj+dsfutWjyRY/AnK32dqdDqtQdGOHQRVYRhSCXW3HC
         +lApTaj8/PUDZ9pV71piTXQBRHFZLG8023j4XqJQUh6/cL4b4HjY05TIb02MexR1vdgg
         ufIA==
X-Forwarded-Encrypted: i=1; AJvYcCVV13i4aOdzljxIdAxdSL+e5nYBo9/1+57Y6HwQYFCSRfQX4MxUKx1p9zIwIGHWQzSVPdNJXb8oGFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmq5xAV6WWoNp9MwkaVArSPn3kG3XCFsHekW8Ns0jo4oXGPzGa
	4cevkOOuEFugVWddWapt1TRil5pLT0QSyFQnxubhkZiYnDZE3q5l8CnK7mE2Tf+t5jTvVD03WWY
	lGnjUMh2jj5r+JA9KmJ0Ms7ow7kQP/HDtBYye8VhrkN1B+9I3dL2nZqQ9AcfcORS7wIISAJD3ja
	2jBlBQy6J4SqcdxY/Ts4rpWJ1YlagIGOhPD7zUmmM7BKmkRlMhdw==
X-Gm-Gg: ASbGncuEusLohoju0LZOmwC8N3vUWJT2D0fDqRBTw1Lu8TIS870UeHfbBtCA43g0L0O
	INhlLyt7wYZvzC1nG/PU1MMCV6nS1UvYD/qApOw7U3+fLlpwrcFPLUY95bYu/4pHG6/v9zk58L+
	8hqryQRiUkqeZFciYkGwQCMNo=
X-Received: by 2002:a05:6902:124d:b0:e90:6b79:23b5 with SMTP id 3f1490d57ef6-e94e6175edamr2941268276.11.1755613495469;
        Tue, 19 Aug 2025 07:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF0NyUe7/RofjcC4QixzaRFRmVdElcMtMYnzi+jpWMgZd139uXmHSJYXx/CbZFkRV3womoYTYYBMDs+rGHGVg=
X-Received: by 2002:a05:6902:124d:b0:e90:6b79:23b5 with SMTP id
 3f1490d57ef6-e94e6175edamr2941207276.11.1755613494924; Tue, 19 Aug 2025
 07:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819134824.623535-1-npache@redhat.com> <20250819134824.623535-2-npache@redhat.com>
In-Reply-To: <20250819134824.623535-2-npache@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Tue, 19 Aug 2025 08:24:28 -0600
X-Gm-Features: Ac12FXyGOl9R8GM6piGm3MATFXxEB46AmdLRhkeJHEPEb8_8zxs7ckcl8qzqEps
Message-ID: <CAA1CXcCBu290fywdxqCY=05ejSLL0P4z5KWRrMf2LRxz1VzYGg@mail.gmail.com>
Subject: Re: [PATCH v10 13/13] Documentation: mm: update the admin guide for
 mTHP collapse
To: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 7:49=E2=80=AFAM Nico Pache <npache@redhat.com> wrot=
e:
>
> Now that we can collapse to mTHPs lets update the admin guide to
> reflect these changes and provide proper guidence on how to utilize it.
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
I had git send email error and had to resend this patch (13), but i
forgot the in-reply-to
please ignore this one and reply to correct version

https://lore.kernel.org/lkml/20250819141742.626517-1-npache@redhat.com/
--in-reply-to=3D20250819141742.626517-1-npache@redhat.com



-- Nico
> ---
>  Documentation/admin-guide/mm/transhuge.rst | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/a=
dmin-guide/mm/transhuge.rst
> index b85547ac4fe9..1f9e6a32052c 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -63,7 +63,7 @@ often.
>  THP can be enabled system wide or restricted to certain tasks or even
>  memory ranges inside task's address space. Unless THP is completely
>  disabled, there is ``khugepaged`` daemon that scans memory and
> -collapses sequences of basic pages into PMD-sized huge pages.
> +collapses sequences of basic pages into huge pages.
>
>  The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
>  interface and using madvise(2) and prctl(2) system calls.
> @@ -149,6 +149,18 @@ hugepage sizes have enabled=3D"never". If enabling m=
ultiple hugepage
>  sizes, the kernel will select the most appropriate enabled size for a
>  given allocation.
>
> +khugepaged uses max_ptes_none scaled to the order of the enabled mTHP si=
ze
> +to determine collapses. When using mTHPs it's recommended to set
> +max_ptes_none low-- ideally less than HPAGE_PMD_NR / 2 (255 on 4k page
> +size). This will prevent undesired "creep" behavior that leads to
> +continuously collapsing to the largest mTHP size; when we collapse, we a=
re
> +bringing in new non-zero pages that will, on a subsequent scan, cause th=
e
> +max_ptes_none check of the +1 order to always be satisfied. By limiting
> +this to less than half the current order, we make sure we don't cause th=
is
> +feedback loop. max_ptes_shared and max_ptes_swap have no effect when
> +collapsing to a mTHP, and mTHP collapse will fail on shared or swapped o=
ut
> +pages.
> +
>  It's also possible to limit defrag efforts in the VM to generate
>  anonymous hugepages in case they're not immediately free to madvise
>  regions or to never try to defrag memory and simply fallback to regular
> @@ -264,11 +276,6 @@ support the following arguments::
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
> --
> 2.50.1
>

