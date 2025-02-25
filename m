Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20611A2389
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509695; cv=none; b=PnsQ6MFmARf645U10tUQ9VO+N8Sw8dLtZiFLhnaj9d+Yl+Cqf7hLBtW+irjJIrD6UO1A16eret5S+OaNSiJ9qvX8hls4Tj1SKUNSNo8/tiFquwFly6J8E7hODdtfTMAaJsfyNBK0XcTmgLqJMML1aoMbRwcXO3N3kHSoADHAjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509695; c=relaxed/simple;
	bh=5o8pizoxvzVoSdZd/O+cZXmZb2Ptzgx/7TJMpQErk40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEES79zgAcqLQvFA4ZftnC5QOeDINV6hY18atfAaWYnG0zesWiB0tE2TfcZA1qW0qVOed8RmkxU2bmqE3iAFiNUlFcHA6Zu3pyAKMK/w03449R7G+MjAh+LIClsAnQzMAC4rzEpTnWL2D5uNd5I6AGqg4o/J105vihvYoa8w1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0v4riTqf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0v4riTqf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22117c396baso16055ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740509692; x=1741114492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMCXizc35EGrmaC85T0NiBuwZkt8Yhq5EnmRBkHr9ig=;
        b=0v4riTqfdOu+E/qSOFlzOFSI+fZoE+Xr20a/9HR6AlLOgJrqI9/Yj28Xmqh7U+femg
         29yrlKtZ4y0rWIMnB6Abm36KOyag4BWd0cM2d22YObAB7BpQZI1wFWV4UYJYAsCzW1qd
         FciBaASfMNqrYqtwLYpxGCf6h1H7pLim6ogclP5gfWp3Z9dX02lyYdO3VrBS5dQxyCmf
         5NBOZCnMWsCRe9U8P1//nz2p8lSAdf2lRxZ5OBdkXLA8zs1E21hyJ3cYi5fZzSHKBS7W
         FivyAfSRlS4iQS9fG+gUrHJjrLSwVkYA/LjgK8bh+pykNnyxMuHMNAyBMLNizTxJf1Ps
         Jabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509692; x=1741114492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMCXizc35EGrmaC85T0NiBuwZkt8Yhq5EnmRBkHr9ig=;
        b=q3xbO/guaa82d6/pnHsH2UM3aFsnb3SLG7arGAwOJYpERDxnSTs8AeRISmz6/2n3Ht
         yDX4t4Ug/MbWzuKTlCyRviiR9Cr5xXybm0tddbE1Ry/8aqHO892uD4wfwGNjfRQ0JlMm
         vRO1zoPzcqbFF5vYZjaZwh6ksOwYqqyg3FJ0JpfsMsHpjOPr2VUL1mn0aWinyQhkXvGT
         MkJ46B/WH6JpWlksAM8rIb3VuBAWztqRJXsPy7uKk1fzhp+80rZqYVl2jxxWZ3EjMJs7
         FhlIhcoVTBq2LW3gBcIgtSAtsTwxmstPFXJRn4OxNy8pGw1i5BGwD2daqSZ21vUipqFE
         iTqw==
X-Forwarded-Encrypted: i=1; AJvYcCXUOCcp5mARcux0jMPpG+D9dbk+96WjNqREOTkT/nNiqhATw3cVinmYLY3Oj5w031//3csjAqQGXmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhDQwVJmJnMmIYoSmbZ4CmUQ7j82i0x9Jbx1wEWqhlJGQj+8G
	9toCC6H29zLmMt+oubChMREt9g08cUUabydTBOzgJzZeWjO0iyy6hjfSDJa2EhWIrhsi/+yZdzu
	wmyDQMbnrjitD9WThOqhiSG8CjknC46/+7C49
X-Gm-Gg: ASbGncs0YZraqrNKSUXnmhjfpsOYNPN4ZIwok1KdD7HHHQBzaSzLeWHoB92Ukpk7GYj
	tpWP008eVpt+pYJ21PCJOhJvm492gvfZT3BQNtzoDyRpL+vYz0V5X02T4BNdIJLZxUG18qbVDZe
	f8sN2xwJbHDZBJa35jLCDsk9zohI0DXLmxS1SD
X-Google-Smtp-Source: AGHT+IHKtkzfqoDq/aFKOFQr1ERgcAbcEK4IFsBn5K00z2a2QK3glh0MNqMaWd3X+U0cJKGz5XG2Nx9VjUfKKSOn5L8=
X-Received: by 2002:a17:903:32c8:b0:21f:3f5c:d24c with SMTP id
 d9443c01a7336-22307990990mr4177415ad.0.1740509691634; Tue, 25 Feb 2025
 10:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222191517.743530-1-almasrymina@google.com>
 <20250222191517.743530-4-almasrymina@google.com> <a814c41a-40f9-4632-a5bb-ad3da5911fb6@redhat.com>
 <CAHS8izNfNJLrMtdR0je3DsXDAvP2Hs8HfKf5Jq7_kQJsVUbrzg@mail.gmail.com> <a003b144-0abf-4274-abff-a6e391a3e20b@kernel.org>
In-Reply-To: <a003b144-0abf-4274-abff-a6e391a3e20b@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 25 Feb 2025 10:54:39 -0800
X-Gm-Features: AWEUYZm9ddJufTmC5t011zUcER-Yc8Z8hhKJRb2CSFMpmWrFXAHePyW-LPIzaHw
Message-ID: <CAHS8izMc0NCMPvCGg-uAOeWaf+K-_EfHnK7+4i205dPUy9JBFA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/9] net: devmem: Implement TX path
To: David Ahern <dsahern@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:03=E2=80=AFAM David Ahern <dsahern@kernel.org> w=
rote:
>
> On 2/25/25 10:41 AM, Mina Almasry wrote:
> > On Tue, Feb 25, 2025 at 5:04=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> On 2/22/25 8:15 PM, Mina Almasry wrote:
> >> [...]
> >>> @@ -119,6 +122,13 @@ void net_devmem_unbind_dmabuf(struct net_devmem_=
dmabuf_binding *binding)
> >>>       unsigned long xa_idx;
> >>>       unsigned int rxq_idx;
> >>>
> >>> +     xa_erase(&net_devmem_dmabuf_bindings, binding->id);
> >>> +
> >>> +     /* Ensure no tx net_devmem_lookup_dmabuf() are in flight after =
the
> >>> +      * erase.
> >>> +      */
> >>> +     synchronize_net();
> >>
> >> Is the above statement always true? can the dmabuf being stuck in some
> >> qdisc? or even some local socket due to redirect?
> >>
> >
> > Yes, we could have have netmems in the TX path in the qdisc or waiting
> > for retransmits that still have references to the dmabuf, and that's
> > fine here I think.
>
> skbs with references to netmem from a dmabuf can get stuck in retransmit
> queues for a long time. The comment should at least acknowledge that.
>

Will do, although I think maybe I'll add that comment above the
refcount_t definition in net_devmem_dmabuf_binding, if that's OK with
you. That was meant to explain how the refcounting on the binding
works.

Maybe worthy of note, this is not that new, in fact something similar
is happening in the RX path. In the RX path each skb waiting in the
receive queue to be recvmsg()'d will hold a reference on the
underlying page_pool, which in-turn holds a reference on the
underlying dmabuf. It's just that a similar thing is happening in the
TX path.

--=20
Thanks,
Mina
