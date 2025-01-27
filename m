Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD10B1DC98C
	for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 22:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018041; cv=none; b=Gl94xYIeVbyTeYgomYp3Mp8mqlsmC26V7ct31WSOZ718QC9DkZj/UO1UV1FcaKdVA/HE9WDYO7+2z4Crb2NqPx2ifiVDrTNsx2BzweSZsxvmc51RfVyjZTbfyMMnQ58PWob9cNvN2r4i1iz02ogmIlKl+b3SJQHoG4nnOZcT4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018041; c=relaxed/simple;
	bh=t3bA5F2W65JXGhyTRu140mCuHtb5LN716DCfVuOfs+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJNGX3lQ5fYXVOahdJsNo/qbtmKs0PdLOiw92wR7Xg3qfeNG0Ql+yZ28hubNOVqVgHT/UaZCvx8n4KDHwKGUB1n8iz/rWR59FapwUckEwWu8WLty46nOzVg+/waff+He4qlKskcWEv5ul0+K2JQu/ZAnin38WXVwu8yvsU81HoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aKMR5aKH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aKMR5aKH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215740b7fb8so51115ad.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2025 14:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738018039; x=1738622839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3ggzQ8ffa5aEYPb9vk8ap4m5/pZIAlh688tUvZLlmg=;
        b=aKMR5aKHhe1HNtNLW1UB2Q1LI3YtIwdyL8lU5u0D0Kwl8oFOPPOffbzrfoMbOYqCYz
         W6rbyakJ9Zm7jnFRXfrY+/hPvZ9evbpZ1Oznog2fqFOWAjv7YqsTgffHTSSEKdnG4p+y
         lXhocSxA+jmiU5TQB9UqvClnO4swy2QdilbXCokyCVMfy6lStMff1PBS15yQYfnuOuyO
         6SpFltlljJLLNSCzb5c9yNlu/dAIJ/U2NLCrPbRd6iApA9oj7t1R7hW+xNU0cpA7+d05
         9pTYIoHACOPg1J/LszIFowOujHLjd4jjV3siGqjKzihh34A673X9uStlj4ISdNga231q
         PePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738018039; x=1738622839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3ggzQ8ffa5aEYPb9vk8ap4m5/pZIAlh688tUvZLlmg=;
        b=ffPthXd79u3NtQBsHmc0PMCbPE2QtLIP/hO4+1LubjbRNRiBaTRHNSYldI1aQtUgsY
         CWpozW2RpVAFhZx0zrBCP7FlIVhBIlIukcsn3ku8DNV2ncLGYngZtUcz8BCMKthidNdH
         FGw4/xbUFNjKH+YD5UkmpLUnojGArcKDHo1t1x++3/AaUn+gxKKhGP67qs/adA3d/CEG
         o9Ixc8qRQwsVr+vSmi42dw/t4dFva6SxSHbjAkQSKZ+bTBGCWvnMTr0F+SNlPAKlERXz
         RVBC9ySvG65bUDzdQiWVTqnL2NnJWxsR7NVvu7/Rh6JqOX66hWl5jn7i/r4gIVtVN0d0
         8qqw==
X-Forwarded-Encrypted: i=1; AJvYcCV3cg8ksyn7MgJpaUuS7XlOqOStdlF/lyp4m35potWDGXE1GxLJAYm4sd3gkAfxtFMDThrPAkWNdns=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+imcxOyLKUuZr9JMIA4zR7hB6nOASfEKsaLrumuhC1IRyKmv
	G4F7ojWTbf0JmWxoKytpL+mVE4+pM3nQgD96q4PA3tXA5HDyJFRocCYJb2nLBTv4IAo4/TGOM1L
	Va7mDexqCk4VL7V957DgpbLz01w2H+i+0gX2l
X-Gm-Gg: ASbGnctulcu4nChdcrv2mbE4q0gRv3pBeZWSq6O0Zq6FD/MCmPInlW6Qt4wSslvTo1A
	SaXomCb5zEv0Pjbfkwll7SPUsbzOBvdCFo4kAMX0HvbjrAR02br9SO8CozcKzFBxutOqlYxUxTD
	YrisVGOntdifTNG9or
X-Google-Smtp-Source: AGHT+IFqML9+QvHHoFqJC9LKtRpfjaasVH9e6us8A8yTyrwAjKPnQICiAUxsKn/ru/d9mYtnRK877NZXyv5QlITTnzU=
X-Received: by 2002:a17:902:f789:b0:215:367f:2967 with SMTP id
 d9443c01a7336-21dcce26186mr833575ad.2.1738018038858; Mon, 27 Jan 2025
 14:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221004236.2629280-1-almasrymina@google.com>
 <20241221004236.2629280-4-almasrymina@google.com> <Z22pVRcr-B624UcG@mini-arch>
In-Reply-To: <Z22pVRcr-B624UcG@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 27 Jan 2025 14:47:06 -0800
X-Gm-Features: AWEUYZmde949ve7En1vqYfCo-7RhN5LjsRnsvkGge4Hf0Xqf5fGcYM_37rushQI
Message-ID: <CAHS8izMXKYBiTX_jCNcmN+4unBHXT9jF0CkNWBvjia9eP=Z3zA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v1 3/5] net: add get_netmem/put_netmem support
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Pavel Begunkov <asml.silence@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <jdamato@fastly.com>, dw@davidwei.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:07=E2=80=AFAM Stanislav Fomichev
<stfomichev@gmail.com> wrote:
>
> On 12/21, Mina Almasry wrote:
> > Currently net_iovs support only pp ref counts, and do not support a
> > page ref equivalent.
> >
> > This is fine for the RX path as net_iovs are used exclusively with the
> > pp and only pp refcounting is needed there. The TX path however does no=
t
> > use pp ref counts, thus, support for get_page/put_page equivalent is
> > needed for netmem.
> >
> > Support get_netmem/put_netmem. Check the type of the netmem before
> > passing it to page or net_iov specific code to obtain a page ref
> > equivalent.
> >
> > For dmabuf net_iovs, we obtain a ref on the underlying binding. This
> > ensures the entire binding doesn't disappear until all the net_iovs hav=
e
> > been put_netmem'ed. We do not need to track the refcount of individual
> > dmabuf net_iovs as we don't allocate/free them from a pool similar to
> > what the buddy allocator does for pages.
> >
> > This code is written to be extensible by other net_iov implementers.
> > get_netmem/put_netmem will check the type of the netmem and route it to
> > the correct helper:
> >
> > pages -> [get|put]_page()
> > dmabuf net_iovs -> net_devmem_[get|put]_net_iov()
> > new net_iovs ->       new helpers
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >  include/linux/skbuff_ref.h |  4 ++--
> >  include/net/netmem.h       |  3 +++
> >  net/core/devmem.c          | 10 ++++++++++
> >  net/core/devmem.h          | 11 +++++++++++
> >  net/core/skbuff.c          | 30 ++++++++++++++++++++++++++++++
> >  5 files changed, 56 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
> > index 0f3c58007488..9e49372ef1a0 100644
> > --- a/include/linux/skbuff_ref.h
> > +++ b/include/linux/skbuff_ref.h
> > @@ -17,7 +17,7 @@
> >   */
> >  static inline void __skb_frag_ref(skb_frag_t *frag)
> >  {
> > -     get_page(skb_frag_page(frag));
> > +     get_netmem(skb_frag_netmem(frag));
> >  }
> >
> >  /**
> > @@ -40,7 +40,7 @@ static inline void skb_page_unref(netmem_ref netmem, =
bool recycle)
> >       if (recycle && napi_pp_put_page(netmem))
> >               return;
> >  #endif
>
> [..]
>
> > -     put_page(netmem_to_page(netmem));
> > +     put_netmem(netmem);
>
> I moved the release operation onto a workqueue in my series [1] to avoid
> calling dmabuf detach (which can sleep) from the socket close path
> (which is called with bh disabled). You should probably do something simi=
lar,
> see the trace attached below.
>
> 1: https://github.com/fomichev/linux/commit/3b3ad4f36771a376c204727e5a167=
c4993d4c65a#diff-3c58b866674b2f9beb5ac7349f81566e4df595c25c647710203549589d=
450f2dR436
>
> (the condition to trigger that is to have an skb in the write queue
> and call close from the userspace)
>

Thanks for catching this indeed. I've also changed the unbinding to
scheduled_work, although I arrived at a slightly different
implementation that is simpler to my eye. I'll upload what I have for
review shortly as RFC.

--=20
Thanks,
Mina
