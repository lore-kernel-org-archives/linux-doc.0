Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6BFE555
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 05:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760418282; cv=none; b=aMiQaABnZQC3r7oLmw8WiNSjTen53eAicLkwO5yOhQ7urf9YpTRxE7L+0vSttmQM9Keo3VYql3U2g3MyxGlQnPLZQJoVIh6o5kIONZt9UrGo16rYZrLjGA2eEVFJv7+Rr6RdoEtszuxG4oFqMM4LNGFpfjsKqK1JLS+501bDV1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760418282; c=relaxed/simple;
	bh=S4XKHgeq43nkiwFR0wRXnBxbDhoQpqFTDLiyK1HwUwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNMskaYiRfCsOak+8wZgzoN3WE87CpmM86GmqZ4ApCJAX96DmyDhbDu76yiQIj6g7IGnWuwsPKJDNAz8QB8TfJ5DkDuQnCoHFxxbE1ZRDTHne14H5ylmOcHWh+pFBoy0SpJefjqGxrn+8PgJegenQtsM6foM2XMKOQgVgCHu3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lb61Ez9F; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lb61Ez9F"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-79ad9aa2d95so86067786d6.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 22:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760418279; x=1761023079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irzV2QUfJJ8dqUzMZqecWufn5bUU0255l1546dL2h1g=;
        b=lb61Ez9Fs5sxnrcKvIeT3FLxQE0N7q/D0DjKhA2s6J5HH2edZ30PpR3USJD8bhfd8w
         B32RRli6FrsI53Cr08MK+24yHPOu1Y9/FIVAjWjpIxZTuNrnDNuf0qHTKcENqjjUQRHj
         SChtzLfITv3IEHOKul2hgGhHbWmsruY4Hr8F2kDZ8ri250oVCOWZNQ15/CpnhkWqu+Bp
         JICCa4i0rdQbD2UOd3yEcUCmu9+UVlxZ5Hu713Z85qXNUokq4QIN8z3PvFw0KjswjLt8
         gGnBtBaYw2CBagUg8wU/ADQax/0+xeTbBR4cwS8oI0mM/kdxnNK8fQHYbWntgb+F4Lv2
         +gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760418279; x=1761023079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irzV2QUfJJ8dqUzMZqecWufn5bUU0255l1546dL2h1g=;
        b=kkbETJEw2z5V587hOECwDDTPdoMeGWWhCzMfqCreSIX/B/FSaRSb+xvqrMlGVw/OAl
         rObjOQcCS140k2n3rp/hR2l2WVLxbarXS7VuEPS918v8XQwAyLzQyxzliG1BFnyMCCVC
         LZBT6W1YhN0kEtYRZ9gVJv3TGv6w7YtobDBQkT2Papf8I5NobexmIXi+ay/KdlHy3Ljx
         y+O9JM6rCuPb/iFDBVZizVLZ2NgNev8PQ9iTv/7IP9HabD2CKQJBKx9Qe4PjhwKa7rd/
         FpPFVJ73QWqsX/OjT6+hZuDn7E54sCZoDjmHbHz1MFOf/dyWfwQO+8HMBWNVvnG2o68b
         Bvog==
X-Forwarded-Encrypted: i=1; AJvYcCXJopEw31BCMBVHpHTHe5DldTChDD6Eg/vCMWKBcPWqaOIJjsfHkdMOmeG228QGdrViSrQW6XKFeww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYcYxDBZRHmQOIExYzqp1InVYXlC/caOYQUB3ZN9KaEBAFFq2
	S2CcnMgRpxGbPWR3GsoGlP7stjBGuFd2Um0U6dJsx5j/nlq79/ftJlOOh9dEN0K7iPD3T5NB8rK
	Pa5ghOLjq8N0FKvkUScWLcRxqbYgtlmE+BGvh8DFK
X-Gm-Gg: ASbGncsvFCE+xQwfIKZNQurt4AWt3/oIZcmyyk85WML0+CEwwms0nwcKaoWB0VnRtdj
	LYV7ItFZVDe/XyZ9Wg9oIfC4zPkiAltBQArEdCQ7L5UxQFc/6/opkPEGCcBC38X4bJgKFenZd+S
	Dp9mjcZslNmIwGy+n5ZIrohKSyrB3gnMQ4bQtzA6rWHIhHsyDXnynB1yvk6mrwN4svZrDwpzMRu
	2t7ZxHvKiwksL95KXTgFM1kVvVoBZZNYAoo8hHK+g8=
X-Google-Smtp-Source: AGHT+IHZgIxpjg/6kkvcMW/J7xD1PN1qAsKtx/7STdfwV4yzIcWv1dUE7oPcxZBo21d0/mZd0RfXxsWJndcH5nudxHU=
X-Received: by 2002:ac8:5755:0:b0:4e7:2b6a:643a with SMTP id
 d75a77b69052e-4e72b6a671cmr56529361cf.12.1760418279258; Mon, 13 Oct 2025
 22:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com> <aO11jqD6jgNs5h8K@casper.infradead.org>
 <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
In-Reply-To: <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 Oct 2025 22:04:28 -0700
X-Gm-Features: AS18NWArWNcPKS90Zk5Pwo5Ct2LOmBIBPcz-hhg5UK9PsI9_HIhdsDtGvM5VF4s
Message-ID: <CANn89iJpNqZJwA0qKMNB41gKDrWBCaS+CashB9=v1omhJncGBw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barry Song <v-songbaohua@oppo.com>, Jonathan Corbet <corbet@lwn.net>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:09=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Tue, Oct 14, 2025 at 5:56=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Mon, Oct 13, 2025 at 06:16:36PM +0800, Barry Song wrote:
> > > On phones, we have observed significant phone heating when running ap=
ps
> > > with high network bandwidth. This is caused by the network stack freq=
uently
> > > waking kswapd for order-3 allocations. As a result, memory reclamatio=
n becomes
> > > constantly active, even though plenty of memory is still available fo=
r network
> > > allocations which can fall back to order-0.
> >
> > I think we need to understand what's going on here a whole lot more tha=
n
> > this!
> >
> > So, we try to do an order-3 allocation.  kswapd runs and ... succeeds i=
n
> > creating order-3 pages?  Or fails to?
> >
>
> Our team observed that most of the time we successfully obtain order-3
> memory, but the cost is excessive memory reclamation, since we end up
> over-reclaiming order-0 pages that could have remained in memory.
>
> > If it fails, that's something we need to sort out.
> >
> > If it succeeds, now we have several order-3 pages, great.  But where do
> > they all go that we need to run kswapd again?
>
> The network app keeps running and continues to issue new order-3 allocati=
on
> requests, so those few order-3 pages won=E2=80=99t be enough to satisfy t=
he
> continuous demand.

These pages are freed as order-3 pages, and should replenish the buddy
as if nothing happened.

I think you are missing something to control how much memory  can be
pushed on each TCP socket ?

What is tcp_wmem on your phones ? What about tcp_mem ?

Have you looked at /proc/sys/net/ipv4/tcp_notsent_lowat
