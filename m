Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E1CA52
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724475; cv=pass; b=MpptbEGyJp4R+iKjPgoOzoeiZ4lw6+Y/m7lvPIqbaiX+OEJeNC3CFanuVIK/IoIuup8x+hgObzVAyZu4uVMfw49hDR1s2t9yyfEkxw30Ot2l5XB6yKefxwm+DD6DM1OOkoDkpOnMr5JBgkcAzJb6TuGZcPIVSZl2CWea6JpjMpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724475; c=relaxed/simple;
	bh=TWe1Cg0XZd9aKCfBim6632tR82TsQqkTtOSHRxZ8GhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAgWwA668muvBF26g+J3fgvEVDn3W1oeTDYsnc+qAqMKrzK8fwPleg3XtCuRT3u/ub75wByyKVJWAm52fnuSplu5iza++jAmqU9A1GN8mOTGJmxb88U0tAdViIzTcDsYacmkNMKLooecOeFR+ku6ZJqJl8zEvldgpjcGiL0c1/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brRId3TP; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brRId3TP"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15f020a223so1626730066b.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 05:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784724472; cv=none;
        d=google.com; s=arc-20260327;
        b=RvlJMCQnCM87UpA93h2O2dEdCLbxM5EfaRvQAnWjSY8WFr4MDGFmYj7tWQYd95QSTx
         jcMnfKw+fX8yBn0Qs0lVX8SsSNFwhOMjw424XORvmhvZwYRlR8cW49VF/tbmnudhRyEv
         Wpej3Dh5L3syLwYdHiDykVs7w6st9jWtE5jf74Zwk5oh3LcVz6qXI+XJI+KHAcPJc2wN
         cKYP4H7579mjA4YH3SZSi+BDFwHLFHzCqHPIVYbMMrKQ7C7CS75vy/1+8eRJzJe67eJM
         OyRmVRB1kbJwmYOx6d10kSC0CCPwoWIKsAJdVqGtH+QzNv+VBumXeL0tLGAI81eTob2X
         YVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        fh=DTiG7+V3bVTyTFBKTElAc+jRYKj/ML/uDuhubC83YE0=;
        b=NqWHUF9bwQboKpPAvj96b/2/YIm+id8s9ZzGJL9mU3MN/s7iqfg9qIoHrJDL3dlILW
         GX3rCiLS2X5Mcl38GZMVtFhSMGR7QtNRH9McRuHlU3T8nqP7mLFz7J745VpTQdUyHLXD
         OJT7GXHXmemm07/2kkaVD6Kczz+bC7N8/HRNehk+Vq42MF6dfJknX4ANd89e0lzkJw11
         0KyZ50rV2XUd/1qmY63TQqvGkhfUYJbAggbY6cPt5RCPizQofZTigWZSt5lDh+6pfupY
         Nocf2UeJOYvs/U2CpwJS+Im6t3rxUhICCslbLmZ/R3oEOpCkygNCxOeLvBvxTvB7r03m
         OaIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784724472; x=1785329272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        b=brRId3TPWt1m/r+PuXSWAwdfqAY4dtCCP5M63A4yYVkmjXM/Vtfgc8136k4/ty3Y1n
         QVuQ5GkIubXX/JyQKYOCLeMH5i4EM91ZUTrkyqEuOZfnL/n5XD4kbUllgiFLnuUinUaR
         zF0Y/Nqzn0XDu98ZhtEmLfq/r3+B2pcsxe/CZtBqdSWfqUR5+8OvOaCqDp2mqiniPmi6
         lxdYD3LUGRCdCEcD6tc0Qb7xZlxx7ULPjXehFIOjT9JV0JNQxMGJYbXsILsDpmrqndST
         UNjgAwCkJj4dbYw7keH9EuHoKdlcpjXuufHpdn+oUNyfkKQtFChYO/oNIGmqUUBtwhr5
         Hdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724472; x=1785329272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYV9hkuF2d5ODBMLR+pFWv3rbaq2dbZuJ+4IyfPmr+A=;
        b=YHk/uZHJtW7OXvrgmDWIGyavMY4NA7tgSIW+rDnBQH6JIx2WIHw2FXSdTdXBRoc2lx
         dxHDZasFYilj11g62ZhXt4mRs5Cc/k91DwxaTXr68bExcJk1Ql4xTM5FuVgyFQQGt55L
         p/7pj7/KfkCx1zeXzud+lChE7mWoNSVOaLsh/nQtBx9mkJIOqngASHoKBE1N58hHu5c3
         MFTrzyLhv0ftyOM8Kn47WKL7WHI1LTCV32CPiclCzge4FMNDLZ3RoofZrBe21tKJ69Dg
         3fWP2AHzZCA2wppKdLZyzW7UITfkkLY7mBjKP4zfIl9oxoKoKuqsNA+ZIYKSHRGRJdr+
         tFIg==
X-Forwarded-Encrypted: i=1; AHgh+RqpHSI8okCri/apCRLjbW0tbxPSn/61l6YmdsMArV5hmNUyEUyyxAJ6ml3+x9xVUMwtSjp4zJoYKaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuZ10RDMf/EGhBBMFL0EJm54lPehP9ahL+gc0yfTN/o+npuEry
	ayggEBI1n4gsRfmWwUOJembzp7MHcrAI7mChOmivqk00q3b72MhiyeBmyFvobLMb5MsWaGvUkvr
	0pm8ZjqUALd8ZHduQV9a/wOhgrw78Lig=
X-Gm-Gg: AR+sD12gftlFs3qIY84m8kAkLXQmP1rvISSrQIriojVj0CFrkWPrA1FRF+tyM4H+6tI
	2wweTikio7o+zyZCQcF2kv2kFIOZ0LOD+NxQhX7JE/d3VESRX35FB4ww9iYCAfG/vaDOxyLcg6Y
	iGJfUa/5m4pC+fcoFYuZjl7Oh0iq6GNEDzCAEU3+/Ous4zLHTdsR0431skuFnR6Yo8R4t/MqOJa
	ibiZhCVOS0qgSC+tcZo+r5wxCeYmxonBWLck5MFKlK2KletjzVVQk11YxjPuAs=
X-Received: by 2002:a17:907:972a:b0:c16:46b1:e0c2 with SMTP id
 a640c23a62f3a-c16b48a8b9dmr984425966b.62.1784724471369; Wed, 22 Jul 2026
 05:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com> <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
In-Reply-To: <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Jul 2026 14:47:37 +0200
X-Gm-Features: AUfX_my2cSFlhFYxiKgO1hiNmZM0_RgRfBeCPM6_N17W9wq10tY2PdKKMNctT2o
Message-ID: <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: John Groves <john@jagalactic.com>, John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 12:47=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Mon, 20 Jul 2026 at 12:07, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > It's not about this ioctl, it's about infrastructure reuse.
> > It's about the fact that there is NOTHING special about dax_devlist;
> > and no reason not to manage it via backing_files_map.
> >
> > The reason you stated was that you want userspace to determine the
> > daxdev_index/backing_id - fine, no problem - this is why I asked that
> > you pass it the desired backing_id in the ioctl.
> > In fact I think that all fuse backing_ids would be better assigned by u=
ser space
> > so the extension of padding =3D> backing_id is not unique to famfs.
>
> Right, so I suggest to just reuse FUSE_DEV_IOC_BACKING_OPEN and add
> two flags: one to enable user supplied backing ID and the other to
> indicate that fd refers to DAX device.  The changes to do compared to
> the current patchset are quite minimal.
>
> > And the best part is that this request requires no changes to your user=
space.
> > You already bite the bullet and maintain the new/old uapi but changing =
the
> > kernel implementation does not require this burden from you, so to be h=
onest
> > I really don't understand why you did not follow Miklos' suggestion.
>
> Code reuse is also important, but I understand John's position to want
> to separate famfs from existing codebase as much as possible.  And
> because this is an implementation detail I don't want to make this a
> show stopper.  We can easily fix it later.
>
> > > - Lose the famfs interleaved extent format. I have complied with this=
 request.
> > >   It makes some things worse, but we'll discuss that later.
> > >
> >
> > I am really not aware of a request to lose the interleaved extent forma=
t.
> > How can this patch [2] from Miklos which reimplements this format as a =
generic
> > uapi be mistaken for a request to lose this format?
>
> Let's not care.  We can easily add this later if famfs (or any other
> use case) decides to want this after all.
>
> Making the initial patchset smaller is win in any case.
>
> > Let me recap the former review requests as I understand them:
> >
> > 1. Use ioctl instead of GET_DAXDEV
>
> This is done, just need to reuse the existing ioctl instead of add a
> new one with the same semantics (okay not true because of the fixed
> backing ID extension...)
>
> > 2. Use backing files infra for daxdev table
>
> Leave this later.
>
> > 3. Use ioctl instead of GET_FMAP
>
> Not sure we agreed to use an ioctl for extent mapping.   What we did
> agree on was to use a generic interface that doesn't have anything
> famfs specific in it.

My bad. I thought that FUSE_DEV_IOC_STRIPE_OPEN was an
example of how GET_FMAP should be made into a generic interface.

Sorry for the misunderstanding John.

Thanks,
Amir.
