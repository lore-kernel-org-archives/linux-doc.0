Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8B2853F3
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587740; cv=pass; b=V4CP9AbtZvQZPOCTtvNTpUx8ofkG08PM9rKJjcqvJH+D5TSqsnA1+icKQX50/bavuQSDzCJ/qkwTSM0e+VjonYOujjsUqn7+n4n0jazx4nz6DMeYn69kbN/MRd7xGD4d2fu9h33FJlM7eKOQtuypoF43KlR1qCDOu9DkIXCGhAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587740; c=relaxed/simple;
	bh=SLByKNE+iyqFj/f2/XSBS1vO5wCST7NUp64XyeqzhTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1RbW5SRaVFBGjWl5yXVeZ7hjRwgf97aMJ9xBIXPt8GB1+k08qnpUrrB9yvmd+zABfjQxEQ4nQ0uwEsXB2jd4KwgVuDQkygoYO9AHoc7zAZj4AnIugnm1N3fZhAB04Avp0Rl56TMNQqSYEQ5QgWo6BkbIDtkynut7b7VC/wHkr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8piObZU; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8piObZU"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so6302604a12.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 09:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787587737; cv=none;
        d=google.com; s=arc-20260327;
        b=T5JtfQeQwazzNAVygd+VGa5mE/cJWIa9fkgDZIbmcVw7PJIU/9Jc1Pv6rWBhCJtVTU
         4m2wBxKPGnuJtxvIHoisA640mTB4QEazWsfl1CoAiTFemEisn9ggXa0b0g/BWIIb5cXo
         bLwAoHviOItG7Mf+x24gRpLZy0FXn8z46xHLPoGsRkkdP+u/SkHmuWar/PvM46bbSjfx
         4hlap5oStAo0lMbtaHxHNuQjUXN1k22hWb6fqVIAAOl/oVV0NYyKQoQ/1KGEjp5Jgyl9
         ZUWtXoPq4G9KgX9HtGiImQIgPQWnwPDSmNMYsnM2vCLIfssFr7ecN9zw04yp17B+gEf0
         H9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0W5q9JFccKIuoTxyIlvb1CNjf7arEqYMbmUndz72Edg=;
        fh=97HwkE56NsY2EFCUbVsYbJUlRtV9LJNDcnpFe2d8UCs=;
        b=Tymx1iPYz1WQ8pIah9wqd2jE0+7CjqEJxJGxpQR5DLDpD33Tk79rrFqi9E8VlQGH67
         94nqLUVEPyfyLxI6YR+9PtjnTHVIgO9rCexxzm8A4iu+YOk8K0iBNBw8JDqOdQ9JLAyS
         ixc8za2Z4HavBlXfc34DdnT24YcqizxytD5wgXkPStNe1vwN2iobNCA5g6H0aD25X4vW
         OdmeM1bKHVw0fnRo+MB1/m8ZO2CPfptI/7e7EYORw28R67mDnmixe4BzBmzNR/ymNjqT
         ICtL27FqigWYxfYXAYL/BdE5ack/AXxJVVC23V+fIEfSb2Pg1/RYLSprrPArIBiOYn0m
         e+Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787587737; x=1788192537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0W5q9JFccKIuoTxyIlvb1CNjf7arEqYMbmUndz72Edg=;
        b=S8piObZUqPCWeWNzZM63rQVa8NJAv+3R3bPgEo9ebVCLzNn38RtiEmXFD99OzeUs6q
         urMix47R46kNQ+Lx4zHolSthBLcoF8wboqc/X47UTB1TP0XV2L+WkwSgiKb30eOof7ts
         T9qBZC5O/DnvInyBbluRKNnQe4CiqGqt1cw+OzVcDIHBfnP4j9ONK9QkuNk0mIzN9h4q
         UuPuTYTda4GfbtigD69jh3FIaMneNnB2qR5nR9hizUgwo16EEN02q15w2XMacEVp/YTp
         Ftv++80mnI7tVfVjRWxX1rEeaFy2dI9YMIBqxpsCIXUZoD+RPWZOS7MwNHnpa0kvOyrZ
         d3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787587737; x=1788192537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0W5q9JFccKIuoTxyIlvb1CNjf7arEqYMbmUndz72Edg=;
        b=rXVzeKAZ1suOJ5qrlVKNmol4d9lUxPRNFrgQgO9fSCT4ITfXJ3Fx8rS2bx/vL0Ycge
         5RjheL7Hbk/sWcOXaKthhDSxsFZBrNqWyzh4SDkqxGPFcF/wPCGOHg05Ysj5PUoY2d1T
         dMY0JOVV7UztH0RKGTVaWQTXhezcxwR5k1vlgTI5TiZl/0Gym2yKMxXLU+lbcYuCkcgM
         uhFSg9AZIe84xXfqxuc/LH3uKNIczDuSXteX5XoG+Sg36AzfoR36iACoSLsox0K6XXad
         CIAkIEk5lJ7xXjjbWWuCOSaejH+dAPcZOhoO2tEE03pTCQ/vS25iHpWujMFYeySKRvah
         szBw==
X-Forwarded-Encrypted: i=1; AHgh+RqsUk0NgIXn31c5UmzDmUK6RafM/4JOxtMWFM4uv5Lk/wVIn0KskY3Zs4o8jK0jRsBgQQV9MCMuBXA=@vger.kernel.org
X-Gm-Message-State: AFuF++lTA9PolVRQSLtXDLwaM7OXRbfGER3zAT9jHnpuGlaZuoY7Ayc8
	l3Z72g3fa+saY4vEfq7bTYnqg59Lun5w/qa+i3jqwn2/PPsEJYkEoqGVRO/RmTYsTYq+qu5q7FY
	QMqry09GqwEriR8+ENh8UKj+0p9efCic=
X-Gm-Gg: AR+sD11c+SObjo6CEUKar7DVdxu4VWaM7zvmeSMPhU5fOFb3tupgXB2JHv60gW26Qkh
	pOaPRz9ySTIlTjm6kTpI5Me8X2Gnw0nyP/+3Gd8k3Uk30/niz8W7MsO0PfBOAZsHNn9tPG2u9Xj
	OKcTN1bjPxUXnjQvWsh5JPTKHVcrzgKTOxDOUFdCmhuWCz20UIT3dWzGcEYlEe5QxLdx6p7YXkx
	U5iZztrFlDS6fLhsRlCBfTgotB2GeB46XrBqqrTqyP6WzRw5K+8vdRmcSOGObrNZpaoihvTTUvI
	RGnFqlLkM+Y5PmK0l2OVEbiSQPndXuC9a0lDmKRXjDLOjQ==
X-Received: by 2002:a05:6402:e93:b0:6a0:584f:454c with SMTP id
 4fb4d7f45d1cf-6a42f28ebaemr31545775a12.16.1787587736646; Mon, 24 Aug 2026
 09:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-3-nphamcs@gmail.com> <20260820041940.443214-1-kunwu.chan@linux.dev>
 <CAKEwX=Mj7QVArjKVvKOKnuQoTmN1Wu=vXe4jkLshnzKoYF4XkA@mail.gmail.com>
In-Reply-To: <CAKEwX=Mj7QVArjKVvKOKnuQoTmN1Wu=vXe4jkLshnzKoYF4XkA@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 25 Aug 2026 00:08:44 +0800
X-Gm-Features: AcwNN1UwGPQAC4xmpw6qspF5xlvAI6xHm0KWte_rbifou6WEZwEBSX5eypRKXJ4
Message-ID: <CAN_Opa_o6y7LnRNF0Ow66E99QKkvdo1iV3fbgk5YCqtcoFa66Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] mm, swap: support zswap and zeroswap as vswap backends
To: Nhat Pham <nphamcs@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, yosry@kernel.org, 
	david@kernel.org, muchun.song@linux.dev, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, qi.zheng@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	riel@surriel.com, gourry@gourry.net, haowenchao22@gmail.com, corbet@lwn.net, 
	kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 22, 2026 at 1:09=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, Aug 19, 2026 at 9:21=E2=80=AFPM Kunwu Chan <kunwu.chan@gmail.com>=
 wrote:
> >
> > On Thu,  6 Aug 2026 11:42:45 -0700 Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > Hi Nhat,
> > [...]
> > syzbot reported a NULL dereference in the v3 series:
> >
> >   __vtable_get()
> >     vswap_to_phys()
> >       swap_entry_backend_has_flag()
> >
> > Seems like the underlying issue is introduced by this patch's
> > `virtual_table` lifetime management.
> >
> > This patch adds:
> >
> > > @@ -70,6 +70,7 @@ struct swap_cluster_info_dynamic {
> > >       struct swap_cluster_info ci;
> > >       unsigned int index;             /* for cluster_index() */
> > >       struct rcu_head rcu;
> > > +     atomic_long_t *virtual_table;   /* Backing pointers for vswap s=
lots */
> > >  };
> >
> > [...]
> >
> > while the read side does:
> >
> > > +static inline unsigned long __vtable_get(struct swap_cluster_info_dy=
namic *ci_dyn,
> > > +                                      unsigned int off)
> > > +{
> > > +     VM_WARN_ON_ONCE(off >=3D SWAPFILE_CLUSTER);
> > > +     return atomic_long_read(&ci_dyn->virtual_table[off]);
> > > +}
> > > +
> >
> > `atomic_long_read()` only makes the access atomic; it does not protect
> > the lifetime of the allocation being accessed.
> >
> > [...]
> >
> > > +static inline void vswap_cluster_free_vtable(struct swap_cluster_inf=
o *ci)
> > > +{
> > > +     struct swap_cluster_info_dynamic *ci_dyn;
> > > +
> >
> > and frees it synchronously:
> >
> > > +     ci_dyn =3D container_of(ci, struct swap_cluster_info_dynamic, c=
i);
> > > +     kfree(ci_dyn->virtual_table);
> > > +     ci_dyn->virtual_table =3D NULL;
> > > +}
> > > +
> >
> > The existing `ci->table` already has an RCU-aware lifetime: readers use
> > the corresponding RCU access rules, and the storage is not freed until
> > after the appropriate grace period. `virtual_table` introduced here doe=
s
> > not have an equivalent lifetime rule.
> >
> > The syzbot crash shows that the current teardown/read-side synchronizat=
ion
> > is insufficient: `__vtable_get()` can observe a torn-down
> > `virtual_table` and dereference NULL.
> >
> > I don't think a NULL check in `__vtable_get()` alone would be the right
> > fix. The NULL dereference is a symptom of the missing lifetime guarante=
e.
> > `virtual_table` needs to remain valid for as long as a reader can reach
> > and access the corresponding dynamic cluster.
>
> Thanks for taking a look, Kunwu.
>
> Null-check by itself is not sufficient, correct. But I think a full
> dance of: rcu read section + spin_lock + checking for
> CLUSTER_FLAG_DEAD should suffice. As long as cluster is valid inside
> this rcu read section, we can get the lock. Once we have the lock, no
> one can free the cluster under us. and as long as the
> "CLUSTER_FLAG_DEAD" flag checks out under the lock, we can exit the
> rcu_read_section(), and proceed with reading the vtable. I already
> fixed this in (to-be-sent) v4.
>

Hi Nhat,
Thanks for the clarification. That makes sense.

I agree that the NULL check alone would only mask the underlying lifetime
issue. I see the lifetime dependency now: virtual_table is protected by the
lifetime of the containing cluster, rather than by an independent RCU lifet=
ime.

> Note that this is actually only required where we don't have any
> reference pin. One example is the one syzbot detected phys swap device
> backend flag check, because at do_swap_time() we don't actually have
> any reference pins. The PTE is not locked, so swap entry can gets
> released underneath us. But if we have a pin - for e.g if we own the
> swap cache folio, then we don't really need this dance.

I also understand the distinction between the unpinned path, such as
the syzbot-reported physical-swap backend flag check, and paths where
we already have a reference pin, such as owning the swap cache folio.

I'll take a closer look at the v4 implementation once it is posted,
particularly the lock/CLUSTER_FLAG_DEAD ordering and the teardown
path.

Thanks,
KunWu
