Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB33B26CE32
	for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217882; cv=pass; b=UdbxDU20WRn5hqD408WJ14XzSt3W3smP3DLf1rB3+Pgt0PkRZi/0EuuVzfKag1+QMfufuNAbKfcrN6Se564sonZDIKX6y708vcwo9KZhd7J7W1VG9aOtnix+K58En49Z8Bvda69Wad9Hi9OdkuwdhhfswSDrnPFQsq59Z0qsXWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217882; c=relaxed/simple;
	bh=w0y8VXrXD7IJTAsab3AkuemdIvyB9Itb1rE1TwYbRjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZJJjQFc0beEtJvRMTWDc1S6X+Zn8Y/RJgF3Q/gRWaC8W9XQyT2H54+OViOhQ8P8EzOsV7XJskrVwrpNTGhmR3tQHiZEc/yTT4UBvi4Xp6sHenKoJHzluTYJ4jItOfJzq+qFFdUVCNrcfqimQ/WhOVLaTIIq6kpOG3D5ztGoEi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLbGW7ji; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLbGW7ji"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ab0140ecb2so18041a12.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2026 09:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791217879; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9wocuY0Ne9BEUa+cGEJhKAnQgsg7bZPajA4WkaMZn55eqA6yPGCGkseX7izpNBg7H
         1AA6OvmcqePoGemIJCRpABQDyOROhhnzDlaZVzoj5t1iPv4t7G97/WsPRJqr8KR/NTd6
         DoKdLoLF4UkLSum0BKmyvcEiKwGA2v1bTW+e73YoLoVxYt3uqKmP7aSQSk2og6/46N5K
         c/lnFIL3RZy5Xr6gE4URwi7W3+T/VsaoM6jqz1mffbCweJ+B1UTG31sWAMTSdQBjUmEE
         fASDS9coIr69fSi3lMahi/fPCK38ONkjzxlqDRkAqSWCXgmPZhArBz5q4cIiCL5de+me
         7oGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        fh=pErez+QEMfunttsuRbyyfJUdfWISBrwHfvSmwu8LDBk=;
        b=XtKSbHtTJVHAaWEINu7w/35YRLQdUgxb6J7T57uh46/EjCNd9yIkSMQmBgzXOEKC1K
         mr1SA0jaUfIJeqoQneJsog93jwW9qyGELBhZRLy4IAccBELA3FK+87XGVkFOVl/dvj2P
         y+3+SSW3KUbF+h8J711caBU5MMjBvqDqbxfPC/n/DFlnqOlFYTR5Y8qcC80fLxiRMCK4
         mGzbV1ZfM+rks1BlymBciGI7XBmqPJJxMKvvTZAtooOutZ3/wbZ9cRn7F1agR5sdaD2P
         +RSBuYyMWXa+h9wM7zhPiXpvQkfSnzxxAyRniDSeN5wOETAhSGhnIxqK2uYgSWL7srAN
         xGVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791217879; x=1791822679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        b=LLbGW7jikzNcfCwkTqjA+A6nJmSakdLiq/eu5NtIXLV/twkTLcxJzzasXTSYe5G3jx
         Rs0LKmvpYELC7xWJFQUNiw/lTuS6hD7QQhzR4ajoIoHqIqd9Ft7f7rQ3wnFydAAZ1maQ
         R2uXGQC8xJ8xP6aAcN7BNyt04MkUh7KAvgzdLc1taidxSKHgrpWWaeux2aYCK1SrlXCN
         46GZyNzP8P33T+oHq3OsFiBakspvLXrni5nJHGGp76m15UWXh5mQ3ykLTWlQMbHt13lA
         aG9FUhdBIOBG8UqvNAyzP28Quelc/t2U5Kra+krRft3JosZLVq+p99pINuO7aRAG9cok
         DHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217879; x=1791822679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85HkyTIaYpIyM4CMkxLDWOSkPWoXIpUm6C4+YzQKOh4=;
        b=bEiGsyGgO8vDMhZL1lzIJ31cu56Zp0Al7Gt5UaTokE20xxC6ZBsj46CIjHQDqL7Lfd
         pJI9sKxl1WGVwTp4VI9IP70nO6WGgL8WThrpe8VSoOpKDCFdo9cL+O1JAEBFbZrQe1/m
         6L8uIdkJCCZp8dahIe0s+DgXj1nMfuOW3ZDr09Bjw3CtHbxIwR+jU191R2vON7YGi7ck
         5CXwZZgRYSKE9ot4GDSNqgHvrVcHw0dCG212aM7jU2lh2GRraUD5VwjXZ2T6H2GREnUM
         LXLK8WDTTsciXGfAT8v3nPdux5jU7e6qUta4+8g2qLjRnlRwMHQgaeRi2UsImj7xaby8
         kvJA==
X-Forwarded-Encrypted: i=1; AKwUvByqocaCdoc6zm042VbDuWA42aoTTfZyoESxg7b2fcX6oGHGlz3vQIRCTENBzfEPzPp2LL72UN2FF9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjLhIDzhlljxMeyMsYc6goi3u9hc7dBKuEBS9iVGxVKzxASyUx
	94F4DFk3a8wN5ZWPl/4w9cDU/Ry+01Xp1u1n1woC6gLcMHW+mACsoV5z9nTnZY9lfG/SAiCbLwR
	ocuknosbUWLYj6lJIFmcR3yTFBUxTPSmUJZivIf+c
X-Gm-Gg: AYBFou1utKrYl/Innqiaj3lDdsZkOyxdHxgW/DdohW0nUul+TkNvluiQn8qogDRnIfI
	ftajUl3I3edsAnwQCHiN40gOUZqyAxVl2G+phfj1uUCJD9mUR/Pax3Me0ZMOkjtEmyUizec+8a1
	IEUGpGZAP0esT4IjYZhrHb3HwuzxJYCiJ/dBs/pGKeMTrAjNECPAeWxmNWKr+lX1XfREfjPTxmw
	BVMbXHYmoPVwAFmXO49kP9KG+c/FBrkT2USsIqybuGq8d14wgQjzLD43uQdsuRdNbZrbibS+pk1
	iKRzknwalR19/k+A2kyc6qXBCImBzUFACQysZIS8BdCtoedZLbE=
X-Received: by 2002:a05:6402:208d:20b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6afae09778bmr80868a12.2.1791217878514; Mon, 05 Oct 2026
 09:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005004958.3603059-1-almasrymina@google.com>
 <20261005004958.3603059-3-almasrymina@google.com> <asPNJ2V8Tv2Z05n-@devvm7509.cco0.facebook.com>
In-Reply-To: <asPNJ2V8Tv2Z05n-@devvm7509.cco0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 5 Oct 2026 09:31:06 -0700
X-Gm-Features: AclHuK8ZfaPvJinAR7i7H0zzzlU7HIPd4xr22-_5YOjFpgcmtCAc2d6PPSqyr34
Message-ID: <CAHS8izOvea3eas4i09pMds2zzqbCtf8VL0Zdvo3fBT_+AM1TBg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/2] docs: netmem: document netmem and memory
 provider design principles
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Luigi Rizzo <lrizzo@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 9:19=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 10/05, Mina Almasry wrote:
> > Add a Design Principles section to Documentation/networking/netmem.rst
> > covering the netmem_ref abstraction, the prohibition on direct
> > downcasting in callers, decoupling memory providers from net_iov,
> > decoupling net_iov from unreadability, delegating provider/type logic t=
o
> > memory_provider_ops and netmem helpers, and the homogeneous skb fragmen=
t
> > memory type invariant.
> >
> > Cc: Luigi Rizzo <lrizzo@google.com>
> > Cc: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > Cc: Stanislav Fomichev <sdf@fomichev.me>
> > Cc: Pavel Begunkov <asml.silence@gmail.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  Documentation/networking/netmem.rst | 46 +++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/networking/netmem.rst b/Documentation/networ=
king/netmem.rst
> > index 217869d1108dd..57e52a947663d 100644
> > --- a/Documentation/networking/netmem.rst
> > +++ b/Documentation/networking/netmem.rst
> > @@ -19,6 +19,52 @@ Benefits of Netmem :
> >  * Simplified Development: Drivers interact with a consistent API,
> >    regardless of the underlying memory implementation.
> >
> > +Design Principles
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Memory providers (or the default ``page_pool`` allocator) allocate und=
erlying
> > +memory (``struct net_iov`` or ``struct page``), cast it to ``netmem_re=
f``, and
> > +supply it to ``page_pool``. The ``page_pool``, drivers, and networking=
 stack
> > +operate on ``netmem_ref`` as the abstract type. Existing ``page_pool``=
 APIs
> > +that allocate or free ``struct page`` are legacy compatibility wrapper=
s for
> > +drivers that do not yet support ``netmem_ref``. Code that is not yet
> > +``netmem``-aware should be converted to ``netmem_ref`` unless it will =
never
> > +need to support ``netmem``.
> > +
> > +1. **Operate on netmem_ref, do not downcast**: ``page_pool``, drivers,=
 and the
> > +   core networking stack should deal with ``netmem_ref`` rather than
> > +   ``struct net_iov`` or ``struct page``. Downcasting ``netmem_ref`` t=
o
> > +   ``struct net_iov`` or ``struct page`` is not allowed unless a code =
path
> > +   strictly cannot function without knowing the underlying memory type=
 (for
> > +   example, ``kmap_local_page()``). In those cases, to keep call sites=
 simple,
> > +   add a ``netmem`` helper that performs the operation on behalf of th=
e caller,
> > +   cleanly handles all ``net_iov`` and ``page`` cases, and returns an =
error if
> > +   the ``netmem`` type cannot support the requested operation.
>
> [..]
>
> > +2. **Decouple memory providers from net_iov**: Memory providers are no=
t limited
> > +   to ``struct net_iov``. A memory provider that returns ``struct page=
``-backed
> > +   ``netmem_ref``\ s to upper layers is allowed. Code must not assume =
that using
> > +   a memory provider implies ``net_iov`` memory.
> > +
> > +3. **Decouple net_iov from unreadability**: ``struct net_iov`` is flex=
ible and
> > +   has no inherent restrictions. While current ``net_iov`` implementat=
ions are
> > +   unreadable by the CPU, future readable ``net_iov`` implementations =
are
> > +   allowed. Code must not assume ``net_iov`` is unreadable; check read=
ability
> > +   via ``netmem_address()`` or ``skb_frags_readable()`` instead.
>
> For these, idk, I do agree in principle, but it is not true right now? An=
d
> there needs to be a bunch of work to generalize?
>

I may have misunderstood, but I think Bjorn is creating readable
net_iovs for his work (patch 5). And I think that's great work and I
plan to support the series. So this will become true very soon.

https://lore.kernel.org/netdev/20261002190018.696925-1-bjorn@kernel.org/

> Should we document where we are right now (mp return niov, niov =3D=3D un=
readable)
> and where we wanna be (mp can return whatever, niov can imply readable or
> unreadable). And when Bjorn's xsk work lands, he can update the mp sectio=
n.
> And sometime later maybe we'll lift niov =3D=3D unreadable.

I think that's a good idea with 1 addendum. I'll say something like,
"This is where we are right now, but new code should, as much as
possible, update existing limitations to generalize and match the
design principles.""I basically don't want LLMs lazily reward hacking
and say "I'll just write code matching where we are right now and
ignore the design principles." WDYT?

--=20
Thanks,
Mina
