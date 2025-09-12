Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB852673B7
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757649428; cv=none; b=VNlUJ7Nl76eMERVnjXL9VqdS/4hp79shmc6BAKFdAIxawwL7+ffbH6yQQwMNaLCNFqGnKQ32qKB6oH1FSxRsPPtH6JXnCw8xCXLrNFL4JNddi+/r/38W3jKH7ONgfZR7/Ah3A45sRJVy05lDf08pnUaeyELLWdiHZf0DPfsIGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757649428; c=relaxed/simple;
	bh=MVvH18f2ghJbNDRGu8PwBbtTHwoNHVL0Ovnz2sSdSEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvbGwdaTUIHiNSzc/HzcAit86ftqMhW7utB8tbg+kFvRf3l3RGZ+Psu8bVqEUivlEWXNyfKsdu652B8Z102Uy/QucH3Hr1n6IF5jN5c+W7HDKQnCPNfSn/v4CNolGA55FqsX2A258pudxiSXo6BbHmlF2ZSiihrqTRccdaGAS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdbozWJj; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdbozWJj"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b5e4fc9b4fso12805061cf.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 20:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757649426; x=1758254226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAJiXDF/fD3hc8sf7Mu6vNZd4wuxUuBCwcjlJtaQVfs=;
        b=JdbozWJj/cnFb6HLj2Rt+bIcDNJ6PDHGzsmx58oLwPSeMCIcotpjxu6gXmdvTka3tQ
         wLaV0yZbo0ZMQHTN+6r7X0+Qf3B4BlsP+dIOsFhMFW9lWZSR9VpNRDhp7/kMgVEHcwBY
         YvHdEDNDbLUxOngWGcUGjpL3YRUjSFXCNDy7IVKFVz7PW19KZMwR76H7HlDJinI4te00
         p6TPhy9rVwFhwuY4U11AF2IQfV2muZwjBbiMd4qUS951xnPNRdlWLNzkJ6m7G0SdPsfi
         ZPFxlcD+Mpml0YP7XRojLv7u7vbyJeitvwzJMINa1t/ADOcGljMpin08ppkwcoIKSVji
         3Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757649426; x=1758254226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAJiXDF/fD3hc8sf7Mu6vNZd4wuxUuBCwcjlJtaQVfs=;
        b=IeHOE5ZfFPVurEIqtpDZlW4SLk9L3hA1ERH++zPqKHOJgJaTjs+iEDPBANc0SfW1Pi
         igdM8K8dYErbvfwNRaYVwM6udUpLl8b/ayGrktp3DZDikD3RiRFado8p4MooNV6Fzf66
         yRjMTXhCsu6TKzSKwQqejntDjmRD1x/G3+9+a9xjwqKlbqvOE/rrO5mixM1Eh0E4XHam
         Cn7Dix/iozI4E2uyZRCympy2M+RbH0DkVn5efbh1uznAWwXn9mlRSKEhzoWqv35EEspM
         li5Kqcob974WBGCuzNPDs2gzqfi7PWT+SxKyNWYh971cmKPox7VvVRC9VAtXKBI44p3h
         HFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwmO+gK2mKgZHsbT9bJ2aumrEczvZMxpFrBcxGbbI8mPCkexto7JKMo32mCNzluqNiE+Sq5Mq0nKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSpjMWNxKIwZkCJukhv3rS+gTMsoOZ3mX5cCF3sKlo9CsjV/J
	v/DKWXYzioXS2gc8U7U/E1CO9QJ7On9nseNxUgyr71RsfJZImXLh/d7tE6+eT7Lis+2gjDBwWvO
	FaGYte1oTZwWeHSybQpGsCcS3TOFPJuo=
X-Gm-Gg: ASbGncvFy8IEOzjzW9/QITKRQ6iKvbHDM5/o+wL69+sTIYDgpwHZnF4bj4nDZK8fbiM
	UGlNjLO0BAVobkJrdLFawrRzNJWYRuPhagpEo36qC+ReAWCgb0GdzP8n6vYFD+p8j+yMY0YTRdI
	hZ4eJPsaiRQHEhDuSXe7NRte5jRR4kYF8/NUbqwj0pjS9Ca4MmHVyE60lhfhFIfLnaR8Nn5r8m6
	46Gn21KrpcMEB+l4Bz6oUF8srV8Lgnl6Nnu6Wmu
X-Google-Smtp-Source: AGHT+IHjvfYmECVMZR5SzxU0Levi0VduXfCB5tWYUm/iHSaSOi3R3RcGti/TTz0eaSI1wFcV4Xxuj4aaOCrBqd77PEU=
X-Received: by 2002:ac8:7f07:0:b0:4b5:ee8d:e9df with SMTP id
 d75a77b69052e-4b77d0ae713mr18117271cf.36.1757649426113; Thu, 11 Sep 2025
 20:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-7-laoar.shao@gmail.com>
 <mi5gf7wvm3hjnfm3gkrye5mpzcxlmfkzy55oqhaqdbsnnwxjfc@teia7omm3ujl> <aabd3a2c-0527-490c-a562-95a293a849ae@lucifer.local>
In-Reply-To: <aabd3a2c-0527-490c-a562-95a293a849ae@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 11:56:30 +0800
X-Gm-Features: AS18NWAHiiqURNXXotwEWaVOm5Wrj0edZ_0g8FxXtJ6rh8zmwA2Mzl9_JGR--30
Message-ID: <CALOAHbDuSEMKpg=xnk9n6WxvwU=qiQkBFTQw9hhu6B1O0KCt8w@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 06/10] bpf: mark vma->vm_mm as __safe_trusted_or_null
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, david@redhat.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org, 
	usamaarif642@gmail.com, gutierrez.asier@huawei-partners.com, 
	willy@infradead.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	ameryhung@gmail.com, rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 1:44=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Sep 11, 2025 at 01:30:52PM -0400, Liam R. Howlett wrote:
> > * Yafang Shao <laoar.shao@gmail.com> [250909 22:46]:
> > > The vma->vm_mm might be NULL and it can be accessed outside of RCU. T=
hus,
> > > we can mark it as trusted_or_null. With this change, BPF helpers can =
safely
> > > access vma->vm_mm to retrieve the associated mm_struct from the VMA.
> > > Then we can make policy decision from the VMA.
> >
> > I don't agree with any of that statement.
> >
> > How are you getting a vma outside an rcu lock safely?
>
> I'm guessing he means that kernel code might access it outside of RCU?
>
> vma->vm_mm can be NULL for 'special' mappings, no not that special, not t=
he
> other special, the VDSO special, yeah that one.
>
> get_vma_name() in fs/proc/task_mmu.c does:
>
>         if (!vma->vm_mm) {
>                 *name =3D "[vdso]";
>                 return;
>         }
>
> Not sure you'd ever find a way to bump into that in THP code paths though=
 ofc.
>
> I was reassured in the last version of the series that the MM is definite=
ly safe
> to access safe to access
>
> E.g. https://lore.kernel.org/linux-mm/299e12dc-259b-45c2-8662-2f386347993=
9@lucifer.local/
> https://lore.kernel.org/linux-mm/5fb8bd8d-cdd9-42e0-b62d-eb5a517a35c2@luc=
ifer.local/
>
> And it _seems_ BPF can already access VMA's.
>
> I think everything's under RCU, and there's automatically an RCU lock app=
lied
> for anything BPF-ish.

This is true for non-sleepable BPF programs. However, for sleepable
BPF programs, only SRCU protection is held.

>
> So my A-b was all baed on this kind of hand waving...
>
> >
> > vmas are RCU type safe so I don't think you can make the statement of
> > null or trusted.  You can get a vma that has moved to another mm if you
> > are not careful.
> >
> > What am I missing?  Surely there is more context to add to this commit
> > message.
>
> Suspect it's the BPF-magic that's the confusing bit...

Absolutely. BPF has a lot of magic under the hood ;-)

--=20
Regards
Yafang
