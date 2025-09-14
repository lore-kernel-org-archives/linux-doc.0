Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E31FC3
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757816430; cv=none; b=tiXn+vljuM8s3lR1LuW4drp8fRc7VHtHnNEvWtGzQqNya7aYXxgadzGace88azAmNNHqexLDNZuqBTGvbI6SY06juHthfIA03fRN4zLoUzRczp3RIwbx561sID8hS4DzP2/eBCLVXZABp/YZoIqPOOrMsE6YALa+CholHZrHlao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757816430; c=relaxed/simple;
	bh=OwJEwqEt78Ndzrx3q0hEfkrL76rC49OFN8MA8xI+XWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxrXCWCJrq29AQB0hUSrMClVrkx+5WruM7hQ+1T2EhGTidygDDoeC2tanxfz5Qn9DoB0WC7ldk5auXs98PBm9Gb7NjJ3nLa+PksavR7rpKBEr10UZkVd7I4WfQ3ixCC9QgAKdpwIeg7fkzOq/ufjL/uUhLOS2OlHZoUlm1FYSX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ3w0joW; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ3w0joW"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-776aee67e8dso3298166d6.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 19:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757816428; x=1758421228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FLLFKulJIRo/+/A7W+JN2XhQBYj1VMkK/MLnr9PzSo=;
        b=IQ3w0joW1fkarS2hnpisnEy5L8RoJ6/nUn5mFMedPlOt2NiM0FVRLgw1ooXQJjHsS7
         0GpA73pdOnvELrpNctEek0ebmx9hXxE57Xs0DX/ctaxkST9tiijenwhAlKz98mHp9zEA
         eXrOp0CSDx8xEYZL4QVYua3Baaj4ETHPYmnjb9K5/Z8ToQdBF+dJ/0yRdxTq3ZzNwilC
         vSNnTzodQSz8L1WK56khVpMkDFI7E87OKP4BVZn1S/RZakO+QroasnLsha1Riia/VEer
         rlt65RJL30uBzDOztM8EaT/B69q06jn9ex0n/OxmYDNOzrm2Ua+qXYZNjo2hiE5+Njxz
         Ak+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757816428; x=1758421228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FLLFKulJIRo/+/A7W+JN2XhQBYj1VMkK/MLnr9PzSo=;
        b=hpfA5ZwDoOB4HvWRDd7Vww3W/H/+qjizKCQkIfuMDtJ1g80Xb6HB1CINlkr/8gi12Q
         pdRJKm3BfBLDKopG9ItUDp1pYORvRC8/SnAPFti5WaCRHnXa3nyGYrheg8n3qDcRpnAP
         tTR5MGNsosd+1CeG80YeHuymijct7gDKhMeE/mARZjSdFV3VUXyDlVWcXx/j3ZBZXGHV
         yykxT/o7arENRg7dwQlVVWNuxgke3D7bfc2wXIzodiA8gbL3Q5cSeQfEF0LX+L6WFJQP
         tVFs4EPG7YoyN2wRsW+7gINFVLJHEbUyOcSL3Qs8BUR/YRTs6YlTpcBOHa0tiu8ywk6p
         kd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSmkqRXGRA5Cqa3iU3IDV92h34cL4dMHQSvsUxmYdNFApgTSFuWeDkM6lpKFKE2ulpgH1d+RMJr6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YznKdIikO3iYeEiRTZabtIVQMVJME9CJsz/ICY4TBa3iLqXjKPI
	uMfTcVbvS2cQcFjdaK2ilcE5e1W6o6+DLo7cr/55oErPSK3oMcxP/KERX04+iggpqyTiu9D45a6
	F7B+3PJKTeD4R8TcNN8A/U9f3EvwQBtQ=
X-Gm-Gg: ASbGncvP6cABUwSOUWQb5rArxhjbmossRGAgvlhduDjDMQdd2HwWS4SB7Sc06qEnYlf
	jK+NFyyVRmbihDCrb3uTUEpmUImCSROnwEvmbQ4FSxrK5gBVg5yCnk36iY1mdyFfGQa73l6Vl7H
	mMHfAkfAwstUL2553v+EKf+d+BnNbZIkIZMo/LXfVB3NbP60/6fjoKZRAO2l1IZXpsdAW+ZaUeQ
	onGU1eVnONUhLAox0IjGviGwrsULIFvrcqJSk2n
X-Google-Smtp-Source: AGHT+IHq6u/4AIG+O1oq71Zy5dzM6cZoHuGdo1nSrFvwbC9QDSx6PwHNBUTam12RFvIzhBOryUKFBBcpe/eyu+MXbrU=
X-Received: by 2002:ad4:5ced:0:b0:77e:dd3e:a0c9 with SMTP id
 6a1803df08f44-77edd3ea3d1mr2130156d6.14.1757816427569; Sat, 13 Sep 2025
 19:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-5-laoar.shao@gmail.com>
 <a2c122f5-ab6a-4242-9db8-e5175d5b27b3@lucifer.local> <CALOAHbCSudQ9y1UdD4YjuUFGae5bRu8_0bgThJV4WgwLwtcwew@mail.gmail.com>
 <42226608-bbb1-4d58-9de7-dfbb3a38d064@lucifer.local>
In-Reply-To: <42226608-bbb1-4d58-9de7-dfbb3a38d064@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 14 Sep 2025 10:19:51 +0800
X-Gm-Features: AS18NWBsv--35q_kcFfQDULeKAOuuY0Oif44eGzcMAx_dTI7CPLBxPfXjMJKB3Q
Message-ID: <CALOAHbAx_Qpt50Knr765Gp63C_ad8m1+kaTFveWkuybhaN3uBw@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 04/10] mm: thp: enable THP allocation
 exclusively through khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 9:48=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Sep 12, 2025 at 02:17:01PM +0800, Yafang Shao wrote:
> > On Thu, Sep 11, 2025 at 11:58=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Wed, Sep 10, 2025 at 10:44:41AM +0800, Yafang Shao wrote:
> > > > Currently, THP allocation cannot be restricted to khugepaged alone =
while
> > > > being disabled in the page fault path. This limitation exists becau=
se
> > > > disabling THP allocation during page faults also prevents the execu=
tion of
> > > > khugepaged_enter_vma() in that path.
> > >
> > > This is quite confusing, I see what you mean - you want to be able to=
 disable
> > > page fault THP but not khugepaged THP _at the point of possibly fault=
ing in a
> > > THP aligned VMA_.
> > >
> > > It seems this patch makes khugepaged_enter_vma() unconditional for an=
 anonymous
> > > VMA, rather than depending on the return value specified by
> > > thp_vma_allowable_order().
> >
> > The functions thp_vma_allowable_order(TVA_PAGEFAULT) and
> > thp_vma_allowable_order(TVA_KHUGEPAGED) are functionally equivalent
> > within the page fault handler; they always yield the same result.
> > Consequently, their execution order is irrelevant.
>
> It seems hard to definitely demonstrate that by checking !in_pf vs not in=
 this
> situation :) but it seems broadly true afaict.
>
> So they differ only in that one starts khugepaged, the other tries to
> establish a THP on fault via create_huge_pmd().

right

>
> >
> > The change reorders these two calls and, in doing so, also moves the
> > call to vmf_anon_prepare(vmf). This alters the control flow:
> > - before this change:  The logic checked the return value of
> > vmf_anon_prepare() between the two thp_vma_allowable_order() calls.
> >
> >     thp_vma_allowable_order(TVA_PAGEFAULT);
> >     ret =3D vmf_anon_prepare(vmf);
> >     if (ret)
> >         return ret;
> >     thp_vma_allowable_order(TVA_KHUGEPAGED);
>
> I mean it's also _only if_ the TVA_PAGEFAULT invocation succeeds that the
> TVA_KHUGEPAGED one happens.
>
> >
> >  - after this change: The logic now executes both
> > thp_vma_allowable_order() calls first and does not check the return
> > value of vmf_anon_prepare().
> >
> >     thp_vma_allowable_order(TVA_KHUGEPAGED);
> >     thp_vma_allowable_order(TVA_PAGEFAULT);
> >     ret =3D vmf_anon_prepare(vmf); // Return value 'ret' is ignored.
>
> Hm this is confusing, your code does:
>
> +       if (pmd_none(*vmf.pmd)) {
> +               if (vma_is_anonymous(vma))
> +                       khugepaged_enter_vma(vma, vm_flags);
> +               if (thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT,=
 PMD_ORDER)) {
> +                       ret =3D create_huge_pmd(&vmf);
> +                       if (!(ret & VM_FAULT_FALLBACK))
> +                               return ret;
> +               }
>
> So the ret is absolutely not ignored, but whether it succeeds or not, we =
still
> invoke khugepaged_enter_vma().
>
> Previously we would not have one this had vmf_anon_prepare() failed in
> do_huge_pmd_anonymous_page().
>
> Which I guess is what you mean?
>
> >
> > This change is safe because the return value of vmf_anon_prepare() can
> > be safely ignored. This function checks for transient system-level
> > conditions (e.g., memory pressure, THP availability) that might
> > prevent an immediate THP allocation. It does not guarantee that a
> > subsequent allocation will succeed.
> >
> > This behavior is consistent with the policy in hugepage_madvise(),
> > where a VMA is queued for khugepaged before a definitive allocation
> > check. If the system is under pressure, khugepaged will simply retry
> > the allocation at a more opportune time.
>
> OK. I do note though that the khugepaged being kicked off is at mm_struct=
 level.

The unit of operation for khugepaged is the mm_struct itself. It
processes the entire mm even when only a single VMA within it is a
candidate for a THP.

>
> So us trying to invoke khugepaged on the mm again is about.. something ha=
ving
> changed that would previously have prevented us but now doesn't?
>
> That is, a product of thp_vma_allowable_order() right?
>
> So probably a sysfs change or similar?
>
> But I guess it makes sense to hook in BPF whenever this is the case becau=
se this
> _could_ be the point at which khugepaged enters the mm, and we want to se=
lect
> the allowable order at this time.
>
> So on basis of the two checks being effectively equivalent (on assumption=
 this
> is always the case) then the change is fairly reasonable.

Yes, that is exactly what I mean.

>
> Though I would put this information, that the checks are equivalent, in t=
he
> commit message so it's really clear.

will add it.

--=20
Regards
Yafang
