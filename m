Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E853043BA
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310123; cv=none; b=YRwlWx1W6siTVDdSi7azdTQMr2P4FRR+0iB4PgJ+67hJzwpGRUetTZ4CCLJxqhYxcgnfkvO2ne4MBo7PYVJOgRwYfT1nkrvfJ+CEYYwpvc7woZtr1HeAEl1LRqnCZBEYmwPF1/1VbQ1i0uKpCSgdfi/4EwpfyvUK9gvJphcnuJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310123; c=relaxed/simple;
	bh=0eGrB3f7xFqga3zVUes14rwFnowv3DUJ5vt7vr9GRdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wuk+mhlxmtOV/tma8iIwpRGqOnPdlJY6VXcP+fGvYNnAN8CeXPk6PULPqmtDQGrgzTtB1gysKPAl+iOR6pj4Gkm/P4VSROiymNz99UZAOW2EFOCw461vGmP7fUBh0VHnIHWnfdWEybocDfOlWI4zZY1Bv4XBnS13r8myICWqpFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrfirogA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrfirogA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5942f46ad87so1632e87.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 11:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765310120; x=1765914920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+RBf8HywqFOs8is8n1gYXR3AwZl2+4K5ckOabIP0pI=;
        b=zrfirogA8aazMPJ6++jdL/wIMZZKiMVvdMrp29NQQAz2kLR8zvLLUJ9hjXwsGY8vzK
         g8pABgqE3N0Q99FvMNHZGBHG5TkORREOHehUZLmM+A4zr8K425RRHe8c8dCQJmJlZbum
         OetkMVCBBEE87PR8Kck4iwDRrzjbzaiAcsPUU+SD6mic/mo9XEBuqWJZiK4mOvWdQZVz
         /yFOtTSb+kXfTKQe02OHNSCin2gdSQJCXuxQSyx1y2BBpHMzfMWMIMPJHoaMZLRoWLsW
         k+jHFfwqdo0c5tr4p4VHwuDuz5XKfQCLJKmyUot9QtNkn7wJ7Du2VBhPANEaShRRL9hH
         nazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310120; x=1765914920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+RBf8HywqFOs8is8n1gYXR3AwZl2+4K5ckOabIP0pI=;
        b=BwChz2byGt/OL7Pa7PMmp/R1PsmR90LAV+lYT+fO+SAKorUL4BRULuzfPjPrPjaBE1
         QDHEFHOJfvkHjXDqHisiuhCl9Z/GrSSQNZRt0OBqOgE/oHknpCOOZ7dEUFtLZlIbRzHn
         AwTl53K7RQugf7Yin16nFQdYpi6Znap7jAf3qXMo++K2RBjndejzgGm8BFCOY+ApkEwH
         eW1YYixHCdzygcQ22Djk2njOozB8F8Q6gVK9Q0VMJWS3aIIbLoSjSiFoH8TWR8Ga94SK
         WIVK0sCg2U9FC+SnRS3e89MU8YnyRQngcoOD+PTOpql6lUAe3Iveb19eBEESwuPNRahu
         lpoA==
X-Forwarded-Encrypted: i=1; AJvYcCUgCBNwGGStE84K5C/owkl3unyMoND9JVlM6ij9Y2rAqNMAv2eW0M5lv73hR6GDEWGSsMosrGu3API=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpX6/v3KvLVuzs1PLIi0S+7HJH/Vmfv0N1L3firSFlJdd0i6fv
	07Fk64LuHh3O6mS2mNcFfLZC4C6dKbIod8bWccYuYvrqBwlKDIECYhL20nExHsegiXM1aZ4d1EH
	RpkhU7wdAYLQ2Yd/3tdGOWbrJf3GKBVKY+xbjNq6N
X-Gm-Gg: ASbGncvug9HhZpwpdQcFQzsG0kiFyXtAtATv2kUmG9rYcIIdhQhVI82ymKdpjg6XfvV
	cztbiPjL1YfCcXzahyZMzMYIH7A9bJT+uRJl1eZ06wFJlUH5G6oTbpf595JNS9K5VozmOy/Re4B
	+PLIiqJskCjUKqCqytw1PwBYXd489B5e1YH1CYuYgJ0tDUeoEauLEcSUrqBN6rhjvszABuJ/YiV
	QiiGANFjpo53IzrzB9T2A72WB8dM90WHHQFjFpjSd3wmKgwXoMuU7c5BxWOOiwt4KA+9CH2OEUM
	rrOGSdoQBXe43XXcKIHEPiq6z9yJd6J4ghLW
X-Google-Smtp-Source: AGHT+IGuhy2c1WoNaDo9yFzzcMM4wWUTw3FFxFrVQBL+cYcgewzWi0uZXQ3wZXqyYkHB8UE1Pe90fyZ3dkNBjdEdl1s=
X-Received: by 2002:a05:6512:154f:20b0:595:9b2f:1dd4 with SMTP id
 2adb3069b0e04-598ee30927fmr562e87.6.1765310119583; Tue, 09 Dec 2025 11:55:19
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-scratch-bobbyeshleman-devmem-tcp-token-upstream-v7-0-1abc8467354c@meta.com>
 <aTh9/waV23uRZc9E@devvm11784.nha0.facebook.com>
In-Reply-To: <aTh9/waV23uRZc9E@devvm11784.nha0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 9 Dec 2025 11:55:07 -0800
X-Gm-Features: AQt7F2otnRUBenjt4JJtgI3V8rfSk5ICp-r1g2bzqOO9K4G5rKMrxzIjxam7SUE
Message-ID: <CAHS8izPm22VoGCv93q=_nGhqOUR3R0JzVpYW6u0EJVxJJB-5Ag@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/5] net: devmem: improve cpu cost of RX token management
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 11:52=E2=80=AFAM Bobby Eshleman <bobbyeshleman@gmail=
.com> wrote:
>
> On Wed, Nov 19, 2025 at 07:37:07PM -0800, Bobby Eshleman wrote:
> > This series improves the CPU cost of RX token management by adding an
> > attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> > binding to avoid the xarray allocator and instead use a per-binding nio=
v
> > array and a uref field in niov.
> >
> > Improvement is ~13% cpu util per RX user thread.
> >
> > Using kperf, the following results were observed:
> >
> > Before:
> >       Average RX worker idle %: 13.13, flows 4, test runs 11
> > After:
> >       Average RX worker idle %: 26.32, flows 4, test runs 11
> >
> > Two other approaches were tested, but with no improvement. Namely, 1)
> > using a hashmap for tokens and 2) keeping an xarray of atomic counters
> > but using RCU so that the hotpath could be mostly lockless. Neither of
> > these approaches proved better than the simple array in terms of CPU.
> >
> > The attribute NETDEV_A_DMABUF_AUTORELEASE is added to toggle the
> > optimization. It is an optional attribute and defaults to 0 (i.e.,
> > optimization on).
> >
>
> [...]
> >
> > Changes in v7:
> > - use netlink instead of sockopt (Stan)
> > - restrict system to only one mode, dmabuf bindings can not co-exist
> >   with different modes (Stan)
> > - use static branching to enforce single system-wide mode (Stan)
> > - Link to v6: https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-=
devmem-tcp-token-upstream-v6-0-ea98cf4d40b3@meta.com
> >
>
> Mina, I was wondering if you had any feedback on this approach?
>

Sorry for the delay, I'll take a look shortly.


--=20
Thanks,
Mina
