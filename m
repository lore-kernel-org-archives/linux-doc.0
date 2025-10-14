Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0A270552
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760425281; cv=none; b=KRcAV49z+/aOsTSUu41P8QHHtFfasxZbItES94J4zRZXvI6DwtFwe0OSBHElAQHBh5+lBZWo9Qk7p+X+RdLvBOAC7laG/6qGwhjFwiPU3VbYkrOLwaZZe8Isu8766FrRv0mNe+ahl3UB4cjHC8FvtOWwXJklDUvtPa3ejQ1YAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760425281; c=relaxed/simple;
	bh=Wbwb1dO1WLDgacw7LIxGfSzHAltEaTQcEfo+u2xdiR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umUbjlGU3FlXtbdMC0EAFbGcPB1IKSiZu8v6YqMBvJx13i9agf3CCMN7/maXeg5UiC6EYJiJiTHyNHgDFMFkyEnzmJOKl5XC+QaoJiRCjGRbV6T4g3hQDfRwTm0ESP9keT+J8MwNMIGTG9qm2KhiAGoi2uXKt5b/FVjieyT/6aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0sIc7ovI; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0sIc7ovI"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-87bf3d1e7faso12923326d6.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760425279; x=1761030079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsQ1m/aFutWkld5ryO0dQSkVhTvtxn9NWV5ydHxepQA=;
        b=0sIc7ovItMrk1SHyQCqtJaecI9B6M/fPQD2dqAWlweqGfnCV0W25jnvh62vHahej52
         o4pbavcfvPG2YWbMcDMXAkA5q0yG6fdQjD1nXUWF1sfYpzwXfyggV4hjOMZbrO0+sbZQ
         IwV5l05rpg9qucMBJ/jHK/LCg3pd2fn7D/suhl75R49OuqQlZ19/jirWnFMPglzorO0F
         x8KndrjQLfiSwa4ACT62AydDvd8RRV6wnQHphd4aJSq/iwS0dktmcwPi0jKAmismuJ+z
         Afbw/GcSwH8cWUWbsqVcKRw9xszxKgUdYeiGhA3Go6k+8lMiz0+/uCcLNsDh0agjG/Ay
         kmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760425279; x=1761030079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsQ1m/aFutWkld5ryO0dQSkVhTvtxn9NWV5ydHxepQA=;
        b=V620+Qrw0RqTYJUDEmOq2jqJzY6dbpsORlljneYs43rn9qWIxwAmsJQ7vMkEYOer2i
         HjsAn2l0pMR58Yy1FT62YmcxwpAldagfPP+Tbczw10nv6/40tYmHOKTLxSpzmC8lAVP9
         loJun/8gtdMnmgMmiG5jAbtbTj8Duwn2W9qU8afPxv+OYiTCEK6acxI9laWqSc4mhoxj
         9NpxUBgpoaR3x0vbpg0ELpEVHXnITFnKEDdUVrWzCBVYP5P5Y/asbWtvaDgXN/AxWkPh
         X4kWLC80ok+Mg2XMnm+7vdJJKMI5AYTV6kPW3aHIHkwZaQkmY8A1Dd/1jFW+dwcgJ3Fd
         5Z3g==
X-Forwarded-Encrypted: i=1; AJvYcCUjZMTtLDZT0Et5HtudICH2TJRgc1B7m8Spk6+jr8jlO4MopxlHnBQKLvgjm0pSOqHUmIpy8flt15s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo1oV50oMqoJzbon3eZ3WRgVp2Iwmfyk9cOv8/szJFKxLvB32u
	c0t9PbtuA3cN3PvBpIFUtItsKIWS6tblB28kvqcLBulxL7pnpf3GrTWcpA2yRM/IEipxSLphI7C
	4s74kV5604IXx4TxfEkLGevurgOCPIHDNrzalcBMd
X-Gm-Gg: ASbGncsnnQzlNnaLtl0moH9/3/nhM7yxwaicNvMh+Bc7mzx8fJrjfy5o6dbs2WzgKl2
	C+FQcyXJWJI8iwGGgDvSizFath3A4Y9TLSASz3xJFdBo8dzrTBBGY6ARhq7OBfFHwEzL8c+XQ9A
	dxHeK6u9OEP3hPvSEwISSuw+rxz+4SvWFckPD3lJRdsdY4F/NlfsIBrNrH+9AiScMTiByazorZz
	g85d5GkwWQLY1U4ad5SClRFYdmb776PLfUsxTz8xsw=
X-Google-Smtp-Source: AGHT+IHR7KeqfX1q4j3neFi7CD60ffHHvOgtSgSkxcg1JbCbIReg3SIb3TKWDF50WzB6YocPrnOGpWynAn63FWdOqTE=
X-Received: by 2002:a05:6214:2622:b0:820:a83:ead3 with SMTP id
 6a1803df08f44-87b21032994mr371828316d6.23.1760425278145; Tue, 14 Oct 2025
 00:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
 <20251014035846.1519-1-21cnbao@gmail.com> <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
 <CAGsJ_4ySSn6B+x+4zE0Ld1+AM4q-WnS0LfxzWw22oXr7n5NZ=g@mail.gmail.com>
In-Reply-To: <CAGsJ_4ySSn6B+x+4zE0Ld1+AM4q-WnS0LfxzWw22oXr7n5NZ=g@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 14 Oct 2025 00:01:07 -0700
X-Gm-Features: AS18NWD5ciaHerlqKb1LSkLizTAcEH7y8M_BZABcYRSz9LQQyJTFiKiNPr9pVjc
Message-ID: <CANn89i+j_CZM9Q=xTkSq-7cjeRkt29JikD3WqvmPihDrUHBQEQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, hannes@cmpxchg.org, horms@kernel.org, 
	jackmanb@google.com, kuba@kernel.org, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linyunsheng@huawei.com, mhocko@suse.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz, 
	willemb@google.com, zhouhuacai@oppo.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 11:43=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> > >
> > > A problem with the existing sysctl is that it only covers the TX path=
;
> > > for the RX path, we also observe that kswapd consumes significant pow=
er.
> > > I could add the patch below to make it support the RX path, but it fe=
els
> > > like a bit of a layer violation, since the RX path code resides in mm
> > > and is intended to serve generic users rather than networking, even
> > > though the current callers are primarily network-related.
> >
> > You might have a buggy driver.
>
> We are observing the RX path as follows:
>
> do_softirq
>     taskset_hi_action
>        kalPacketAlloc
>            __netdev_alloc_skb
>                page_frag_alloc_align
>                    __page_frag_cache_refill
>
> This appears to be a fairly common stack.
>
> So it is a buggy driver?

No idea, kalPacketAlloc is not in upstream trees.

It apparently needs high order allocations. It will fail at some point.

>
> >
> > High performance drivers use order-0 allocations only.
> >
>
> Do you have an example of high-performance drivers that use only order-0 =
memory?

About all drivers using XDP, and/or using napi_get_frags()

XDP has been using order-0 pages from the very beginning.
