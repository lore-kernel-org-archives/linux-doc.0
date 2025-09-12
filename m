Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6FC27146D
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757658124; cv=none; b=We/G8CQ/StfOCyTn38YCa/I0Is3ykpV9nmobG5Bzh+iRn/G4mRCOS9TMie6SJoKvXgTRWoPNTe9T36qavnRchhDd+0PWx0rXjdUDd9NyF+JZuZ9gsKKhe1eRT/dJWI5RQPGI3QmlUo1TwItekdQO17rhwdI+QlKUk2cqGUAVY2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757658124; c=relaxed/simple;
	bh=iFA1PL117TE7pLK94s5Ck1gK2qPMScvoT+lQyzR5I2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CrKvLFBjdNPpKeRwFraxpIuEIyS8tzwyDzjKgiB+uSuapjIhuO4katww3hejeeP6TDEPMuY97Ven0pQJrNgFhhLBVLlID8rRRlGu3BkRBKd4CBKqIBQIt5fuwb2qtYfp3GF3LKqE0p5Ql0r0e77UwMJ41Vb6EuEmv0E/kBgRnq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVAgIj2K; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVAgIj2K"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7221ce7e814so12424296d6.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757658122; x=1758262922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13UhwBOCgZAJG+PHaCo5zun9R1eUs+koRa2xLgL1H/E=;
        b=mVAgIj2Knf9vAcwbFSQOrGq3Fp5aAUNiuQDwgzNtk4vs2Uqrod6ZB90QNOOc1khGsr
         /AND5Rfa+Ivr6ViFNgi6oLW6RyPsYVfizNuhsGr9/rxtSbxGJVtxXnNTNyQHxdtIUn9d
         yQSXH1wKa8yf0+5/X/gCw0Cccywmquxh+K6RVX8Tuc5+9gzYSRxb8CBkDX3rzcgvGQBE
         FyB6BgDgTCAsL7x/k9B6Ew5HxhtXiW8yFsqdoBY757ORoJ+IIF8Q2Z9R65CCKFPred7r
         hpxADpkDjMrfPrKnVdM/eK+HrvlprjedkqoVpao+GEo2GAixqcJ7nAnsfU8gsXfFXjAU
         LraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757658122; x=1758262922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13UhwBOCgZAJG+PHaCo5zun9R1eUs+koRa2xLgL1H/E=;
        b=qACZPXF4mLwPwRa6WJbkV5nrrCHqkVU0BM6ESmUhGGjOchj6Ame4ev3SJexgE6kndf
         ZswIiOftO5k8MmqtwBVNRkoESt2dxUTbzweeLthZZgXWzgYY6APvK9P5iPseF7YTrA6q
         2HfBQWn42Vi6rybf0mHE7CZlJTtBET8Hw61msvUWayWbj9BIo3u3I351nGOolZJuEN9v
         HaIcBanpcKnZLR7snE7QSb22+H980jGKbZQxcAel7XduheimFEwL/A/8LcQhFfA1QHn6
         UQG/rxkrn70v/gavGhKgsdZIo7F5xMxIOf5SKcnwY5eoskoaGw4HJcKa9fzrJeYjPBHE
         /7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWp8uC3Jo1ftqFeFGkn1u52Anxu569gnd+kORq7rWHb8v/m1gTM7zFy32B0EN5NZCrX0GW2R+mhAR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQ85ZmyA+HxW7IKRwzmjFCYkKtjhDmgFPETotsklctNaYT5Lo
	sQyGg8stqpu5LUJ+d6TPaLq7raCV7bVKrkjyGEU5nPUqeXzM9ZvE5jpv4sbql+9EQFEDVYG/ECN
	WUx1NP9sQrnWuspYJ1G7X+4B3u2QnNBM=
X-Gm-Gg: ASbGncvvHpnJDR9gWRzVUUS6hZH+v4FNQb2HfwSBCjRdIfKWvuoEBQICCpGLQ1/K9rW
	WOfnSonnxFIr1tPiG92J8UYSEBuxZPSYSbWNNjAmp5nkhCYBzwAE4dJtg4SfuxGG6DmVth1a1li
	UsZRvOCJ9RQn+Op9DKM0Xhq6EV8NwuJsePgkrdcgvMeZwg4uTTxx3mtmUzO+G61K8wvhJNVInw5
	CN72PDK6awqADJ08dIywuFWOe4O6XwyGbHYjsrejZr53ujyUGo=
X-Google-Smtp-Source: AGHT+IFjPHWXtmC2N2XMC4kkjOR+ZHCdE67Dx4ptP+o4Gr0YwDr6+Gpi3AO9G8ouJBTJcBcxrEKztnxzkezUahDPmaE=
X-Received: by 2002:ad4:5fc7:0:b0:72c:3676:cfde with SMTP id
 6a1803df08f44-767bb87f286mr22196826d6.9.1757658121862; Thu, 11 Sep 2025
 23:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-1-laoar.shao@gmail.com> <20250910024447.64788-5-laoar.shao@gmail.com>
 <CABzRoyZQMDodwBEJwNOoJNASJBP50xMhLdvo+kKENyDKWcRAfw@mail.gmail.com>
In-Reply-To: <CABzRoyZQMDodwBEJwNOoJNASJBP50xMhLdvo+kKENyDKWcRAfw@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 12 Sep 2025 14:21:25 +0800
X-Gm-Features: AS18NWDgNlviB90497XwhehyjdnC0mbss2uvTJ6B4snySt0rWu9vzBh6IpQFiW4
Message-ID: <CALOAHbDUYYunZObchkpr1L78dhfP-dmVNgKz3mBf3xAi+cDOCg@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 04/10] mm: thp: enable THP allocation
 exclusively through khugepaged
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, hannes@cmpxchg.org, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com, 
	rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 11:54=E2=80=AFPM Lance Yang <lance.yang@linux.dev> =
wrote:
>
> On Wed, Sep 10, 2025 at 11:00=E2=80=AFAM Yafang Shao <laoar.shao@gmail.co=
m> wrote:
> >
> > Currently, THP allocation cannot be restricted to khugepaged alone whil=
e
> > being disabled in the page fault path. This limitation exists because
> > disabling THP allocation during page faults also prevents the execution=
 of
> > khugepaged_enter_vma() in that path.
> >
> > With the introduction of BPF, we can now implement THP policies based o=
n
> > different TVA types. This patch adjusts the logic to support this new
> > capability.
> >
> > While we could also extend prtcl() to utilize this new policy, such a
> > change would require a uAPI modification.
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > ---
> >  mm/huge_memory.c |  1 -
> >  mm/memory.c      | 13 ++++++++-----
> >  2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 523153d21a41..1e9e7b32e2cf 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -1346,7 +1346,6 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_f=
ault *vmf)
> >         ret =3D vmf_anon_prepare(vmf);
> >         if (ret)
> >                 return ret;
> > -       khugepaged_enter_vma(vma, vma->vm_flags);
> >
> >         if (!(vmf->flags & FAULT_FLAG_WRITE) &&
> >                         !mm_forbids_zeropage(vma->vm_mm) &&
> > diff --git a/mm/memory.c b/mm/memory.c
> > index d8819cac7930..d0609dc1e371 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6289,11 +6289,14 @@ static vm_fault_t __handle_mm_fault(struct vm_a=
rea_struct *vma,
> >         if (pud_trans_unstable(vmf.pud))
> >                 goto retry_pud;
> >
> > -       if (pmd_none(*vmf.pmd) &&
> > -           thp_vma_allowable_order(vma, vm_flags, TVA_PAGEFAULT, PMD_O=
RDER)) {
> > -               ret =3D create_huge_pmd(&vmf);
> > -               if (!(ret & VM_FAULT_FALLBACK))
> > -                       return ret;
> > +       if (pmd_none(*vmf.pmd)) {
> > +               if (vma_is_anonymous(vma))
> > +                       khugepaged_enter_vma(vma, vm_flags);
>
> Hmm... I'm a bit confused about the different conditions for calling
> khugepaged_enter_vma(). It's sometimes called for anonymous VMAs, other
> times ONLY for non-anonymous, and sometimes unconditionally ;)

Right, it is really confusing.

>
> Anyway, this isn't a blocker, just something I noticed. I might try to
> simplify that down the road.

please do it when you have a moment.

>
> Acked-by: Lance Yang <lance.yang@linux.dev>

Thanks for the review.

--=20
Regards
Yafang
