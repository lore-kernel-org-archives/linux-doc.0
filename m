Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69EE420E6C
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948552; cv=pass; b=jgpMBJjWdL02z1nIzAt7nq4RO8tH0RMXCeVYD+Kv15X37ioxMHS+kV767VG2JSo41HN/CczOpjTNjmeXxoasSa7GowRO9T86pCCZUE2wHLW4Ihzm/fds3qBXqxD8FPbRNdTcpFNt2Ua4zAQZUzUYaxeZMqfirK8agB22qFHFIp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948552; c=relaxed/simple;
	bh=YESDyH24wdvqAd/4G+nIH2HEAldicjQ9mz614tlmHfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DT9QY/K1olwrzo3KTkyufT2+tNYdazzEYwtHTp2cN7SFIX39Bed9OGNrJz6xI7T4Ip79ocor1UiKeU9B3A2K9AF0p3rtNNTF/0Uc13ecrLETsW+IQm9gNFya+IiRkB/Wxc43frgmwrBaKw5/fhwPRt+A9PIi7D3lfUd7cXuCc2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OoAL2REg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ldCYrE0Y; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OoAL2REg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ldCYrE0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783948550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnmFCuY1t1UxRGiQVGfBHxtWK/VRToY+kN9LC8vwOiY=;
	b=OoAL2REgqd4YE6tRGccjcjdMrxPLM3Uoy5VXY3QWud4Vu2KEIsrBf+HolJRlCy2y8ZXksS
	VukwR6x76+7/7ZW58FE92rEgDzKQTlf4e9xCkIefXQQe6RBo0mrV7ZiUb98X80I9NpNGnJ
	WMiKTGRMPKnYv9rhdQhLntdBD6r3Rkw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-1Z8e3uCEMba-ZDSYwXMpKA-1; Mon, 13 Jul 2026 09:15:47 -0400
X-MC-Unique: 1Z8e3uCEMba-ZDSYwXMpKA-1
X-Mimecast-MFC-AGG-ID: 1Z8e3uCEMba-ZDSYwXMpKA_1783948546
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3997407a7b9so28285991fa.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783948546; cv=none;
        d=google.com; s=arc-20260327;
        b=Zs/OtWt9PRZp7eLvz/UAgD5WdHTELtFJraxNgSPpHHB+YP+tRKp/f9zuYFf19sOJeQ
         Vk5+Vh7ABE9irOrQds9SxdXAu4jQy8xtkjGQAvo70NMrHfnJ2rLKP8jS943pItHHNosR
         yYFiZl2lA9PwN1SZ2gkW38dcWZN1MV6sei9CYRBqU33C/pRGM61hxhr4Trf9FmsnMIWb
         e49SbGlv2PrYZsKf0viQtVQD7wHzJXyfaCJJ21d9a5PhzUqeZyHUoZMF5y0wh8KalCb8
         xKF6B6dWjaKUI9OqLO1sjeSbBl0F/FUFRr5T07e+oq1XFejm9wHB4Zf6qsy+ozf7Tito
         Uesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VnmFCuY1t1UxRGiQVGfBHxtWK/VRToY+kN9LC8vwOiY=;
        fh=/sfdQ4tctgJI9ge/75sQ+t/oGeTjcxHtOQ5Z5MqsOqA=;
        b=hQ+FsH69c2fLQBu3dyUk/9pWvu7cJHZ5Ggc13Y/XLZgCLak9KGH+8bPcWQ7D258BUv
         2HdLJ9De5nrGENe1qKSUiif7d0TanJw9PhJt0NfdZ59de0WcOkxJT0G9NIBfaeve71It
         omiLlCJCQx6OXuSJ4h20TjZqb/fTYjjvaxrybeG6EdKLR/fSujUhcb1VBESCNxBHQnHG
         5fRSCnDIK5b5UjbNUjhIrSiI+FXS0Xv20d7tz2OL3xk5xlUx3UwI8dgtPeQgOO9hiNa8
         KG1bc7N848StbikNtRmRtIXiqLYZsTqACvhaKNU9TWcmvktTQzqjkfjE3ToNLMbmUJq4
         YY0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783948546; x=1784553346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnmFCuY1t1UxRGiQVGfBHxtWK/VRToY+kN9LC8vwOiY=;
        b=ldCYrE0Y/IK1egSb9xwc4tHMIB6ifHSZ/NXnLlHvIceLfjsvtRB2vCgTOkB0aBPvkI
         Ls908ODhGgwVa8h+YmEaUDO8YVG/hkB/UI1C8GQkLjqXCq6lbq+k/zDexA4/N+7Lo3L4
         cF1bO6qH0u+dOZkJ1kv7pvArQLkUdWVsvH+1KRxNCFyi/EKdR4vLSfeyGSWcJq8cAaNb
         +2Vuxkt/lE7t73pbrqIIdHRiNig8cmpL3eZ9aLEFskAaiQdD7wX4fVbEDFEuBtqL5MsA
         glnPhloBoh1tbtICyyKQjZwK8zi+eP34LLiCbhGFwlNFek5blaR6ho1PZdvfhuc317lc
         w6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948546; x=1784553346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnmFCuY1t1UxRGiQVGfBHxtWK/VRToY+kN9LC8vwOiY=;
        b=CrhfXZEQhOjYetMMnpOXY2w4M+lex1CPORxDTwBJR1MajnwiOfg9YWkHqLKEJueWwt
         Coqwcj7MK1i60g8Rqv9QPSjSF7na08pzLjFOOBS8I6LlEUnagjd1Bo5H8nQp04dr+z/z
         KeV7mAJ7h1Ts1jRdenST7oTq+s/7FKgAI+pqwo6gJWde/iEFQxd+U+zu/Tye8hvBD/u1
         9hM+f7qlI2Jrh9EN6w2ZptmNGiQz/mvJ83onvmw2Ua4RhvvvL7vUc7MF9byXzfk/GpSn
         1v27ynEJywjqPAmGpwdjrJKO5d6vWdcrK8h5xJ+GcJjtQuov5138vxpkkuUAmvZmLASt
         2AWQ==
X-Gm-Message-State: AOJu0Yz1l0RtEHiq8S+CGmbl3AbqVyU5f5TAoU0jSmh85N540aM5W3UU
	9496pCbrR6fVYN22I4XdV6zscLIykFtr11h3yJZz7AgoldRZnNQGVBBpWVzFsEyMdVCJsYkAwhy
	BoKVIK1KqpN8h2gaF8K6/vGzPz8RUOyoRclY9rVMRLiReaK3TQYoLO5qFJIpenD3xG2+fMc6Ug5
	bMPROjAdbdVEYAxAaRBzZNXf8zGOOwgnN8+PiTcpeRUsEj7B4=
X-Gm-Gg: AfdE7cnCIcpkQOhV8FIc0FeEhzPy9OaPlAgH+z/yNA+Q2CPrBO4IUbFFCr1c2NY/01C
	K6WHuxpBiv14vUr87rQtC4rYS7H2x/f7jRCiTY1BX9RG1QKQtu/sS4P+bTx/N5arqY7ISneJTYv
	939R3Ks/bcMFHkUv1C+QwdHSqW2ksqzb3pGuIDvMU4b8BjEN173BzWSr25To/Wj+gH
X-Received: by 2002:a05:651c:1117:10b0:39c:63cb:4cfa with SMTP id 38308e7fff4ca-39caa8274d4mr14817341fa.25.1783948546066;
        Mon, 13 Jul 2026 06:15:46 -0700 (PDT)
X-Received: by 2002:a05:651c:1117:10b0:39c:63cb:4cfa with SMTP id
 38308e7fff4ca-39caa8274d4mr14817191fa.25.1783948545693; Mon, 13 Jul 2026
 06:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706154500.39178-7-npache@redhat.com> <20260706193407.825323-1-usama.arif@linux.dev>
In-Reply-To: <20260706193407.825323-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 13 Jul 2026 07:17:04 -0600
X-Gm-Features: AUfX_mxx7QT9lhwhb3W8hp1dCR3IcTqgRNNujbxaL6_l0Pb_nFPiIRehImer4vY
Message-ID: <CAA1CXcCbtxnSEpf3P_VYg1RdR+4-yfFO8fEUw0UN-kWaQmZfNQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] mm/khugepaged: unmap pte before releasing vma write lock
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:34=E2=80=AFPM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> On Mon,  6 Jul 2026 09:44:53 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > We are currently dropping the anon_vma write lock before unmapping the
> > PTE. Although this is safe, due to us still holding the mmap_write_lock=
,
> > its safer and less confusing to switch the order of these two operation=
s.
> >
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Would it not be better to add a comment here why its safe to do so, inste=
ad
> of extending lock hold period?

As per Documentation/mm/process_addrs.rst

->anon_vma.lock
     ->page_table_lock or pte_lock (anon_vma_prepare and various)

We must release the PTE first. This patch ensures we follow the proper
convention.

>
> I think its more confusing to hold a lock for longer than we should.

Its basically a no-op on modern systems, and due to the mmap_write
lock being held also would provide no real benefit to release it just
a few nanoseconds faster.

Cheers,
-- Nico

>
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index c4ea2dc1591b..3c6f1254deca 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1548,10 +1548,10 @@ static enum scan_result collapse_huge_page(stru=
ct mm_struct *mm, unsigned long s
> >
> >       result =3D SCAN_SUCCEED;
> >  out_up_write:
> > -     if (anon_vma_locked)
> > -             anon_vma_unlock_write(vma->anon_vma);
> >       if (pte)
> >               pte_unmap(pte);
> > +     if (anon_vma_locked)
> > +             anon_vma_unlock_write(vma->anon_vma);
> >       mmap_write_unlock(mm);
> >  out_nolock:
> >       if (folio)
> > --
> > 2.54.0
> >
> >
>

