Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792537525;
	b=abTQWDX7ghD9ujuy3ymMo18F/idwcPCn5rnr5baFQsiGW6gKj9Fsj7Ybjw4OHAJ1gTCc
	 kAzWzptFZHL2CBESxgZZZ21a8pMhsaKf4XB+AUAkXx1XLmmJH/As5xW0cf4+5tPprOVhO
	 471YhaF00AqQM7oIvQ2P6jjYTrt8Ds8Dy4ljna8OFiXl/LxdB3GYLBzYv0sPl4SYmU/hm
	 04XwWGQNAiUtmyOMUzZnmZ20BX0cDCil/Bpv3+APRbjugozdKsdkUg9Kc/I9xWpmS/u6V
	 MBHFS1BqfWi02MoFdfRRRMDlQZFQZU72hNsyp5c4FWEcMIvHpj9+HhG2a3FwfFSCWCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792537525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JQ9TD9Qu+QGHMOnlJYIPPYw7mW4frIX5SWRPHWeJBJw=;
	b=cr0kN4BCSNpOYOFsc0xrHnI1H7qO2QmszamEbNVSjw/hq9ADdW3S/Dif7CHUmbF9jneU
	 JD2Xsj+1gswLPHeciQBH8PcezDQisU3kmCh1gM1nGwwxT9BG/ecPhve6TOheWLbccMhYk
	 8N95bMxaTOWasA7aV/d0fBaNorp8csrfpqiHXGJOgsWVtx/uNgreWKPAtWhPKTZztcXOg
	 N7R0VqAQ9oQ6PKmOBX3G5BhaiNUILDih7PnFgl6HdMAHkteq7UaxLRQlhyeV7s6ahVUHa
	 qXxzDRIAZDKlBP521gGYWc3f+lYOmz/OQmHFVlIS1RAp9OSZWrik/XJP0xbYlJ7foVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=E8xksGfv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC8606A319
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AC8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=E8xksGfv
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e7834687easo13901e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792537518; cv=none;
        d=google.com; s=arc-20260327;
        b=XF14QJt0pQsShmPvKk3uXd38DXmMq/cCEDN56BPB8xvnH/idm+g6nzbG6YTXV7boGt
         S6tbzkPXjqq3kT9yNLWfa6csaFi0eRPIXrIjd85ZQp9FmLqwpo1WDTbm6jsvtv+CSI88
         wtNH2lHMfYl+i3/COf4vpWoQkZWo8Ttwz0jMVD0Nm7gsGU8cy3fvfIxCPgcBnmjF996R
         T9zD8t+HQpQ/yZAnLQ6dVcI1GQNqhM7EfHfxe3kLIan0H8bYqKhFhVdbdQ2YBy5LPs2x
         TW0h6PADV8HU/eWfQ+bGnUkhfxdwBay7dCq5NsF/2qkTGmZEOc4BAaVJ3LzQd6oiIoY9
         1wHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQ9TD9Qu+QGHMOnlJYIPPYw7mW4frIX5SWRPHWeJBJw=;
        fh=PPT3QLEfMRzJ3Ae4woJrjJP9H7AQMrUAaVDrBj5Zr2E=;
        b=bbjUwmJPlQNO30Iz3Ks1cnx8xfNEunR6RHnmKLbcsyg0OH6CPjmMS0AHLWaeJ1+RPD
         vai1pjGWIBC9m12AHJtRWvHMdJlAjgrbkP+8FPslJAlYJ41W7j+LQdZDN0GteO8o1Jp0
         HVAi9Tvcaa5Gr+4WEUZsK6Pj3m1I6xphY7WnpSRnQjmSMTBbzS10DrWUiLyWDPFuxMqK
         DpOLYSkFobqH2WCSrJeR9/+xedOI8LmqmXLCrlqqt/CzOUBXgm3jg2I2W0znlHFNv8VN
         m/lslWPDMLKsYXYu4IzzAcDEf3D3x8yX296IuI+0iq71P2ZMMRRVbqc3/4DBpJnQ0dth
         Eybw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792537518; x=1793142318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQ9TD9Qu+QGHMOnlJYIPPYw7mW4frIX5SWRPHWeJBJw=;
        b=E8xksGfvKfvFTRye9elVYecKnDUpUjJAsu4chhAWoigdfkZhiKYBnU3KTE9yUj+3gt
         K2PaQpnLcbwveCc6jiJnsoAoWjQqlR9vEN1xEIYP+AmjIdOWbGGUM7yjXOvptk+C6yJd
         WEAe/Xh+Rms5H4D7wdwC9ogykuqLj8FI/gcFXAjcRDDBeFn3tF0JRpp6J/5UTbRFEEgF
         VE4BTBmDKtv+5nJRxsl1xkVrQiKcAxZSnFSUhfHWa8pMniJJNkUyRydaFKgEKrj6QX7A
         qgnk7XnjUeqCenaiAyMlnvYir978qQhVztY/yLRMwQdtIM3spB2n78PkFH14VyLYwzks
         WANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792537518; x=1793142318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ9TD9Qu+QGHMOnlJYIPPYw7mW4frIX5SWRPHWeJBJw=;
        b=vd/eCMhPsyFUWbeFWdtZA8RLOFT4fy0zVKe8+FRFABt5F9LG6pjqSeYz5OeWeAXSzF
         F5+jtPUDpN1g0smTuSh45Anqg+4Tsrkiw3oiwnfIYBvuWaLmNFhG2BENor3rs32ZHw4k
         aWXB0KzV70phRmSPTBH7jvlVBJpmgXxXQsvGprdkoQi7ImApZiqoM+iV0M9uY1dVUZLP
         wyfht0av5h+8FFZvG0D0I9FHqnjIyXx22D/MY3krOFHdEKoy6QjDR1blHfnX+4tgwvBk
         iSODym5oXXNn6bpKGk1Q8t0d6I1c6cEhslIiBg8Nu1S8MsPgBScXkFMwjkUhvh65k/oH
         Rp1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwt9WB9DOespfyq0c7mGZxQzvfGlfoijTuZCzc4EKgiwnc+/Kt5uOeqGpodLWm8lY27OlMnPsvXHIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgbVUg93xuLGkl31C/5ThfcuCjOM9J6AL3xDCNJmriJKY8VIdg
	fXotjQ0NikAEYW2FwYgZkDynLUWCMSxxKb/evAoyh1hpEGZooMEbExuYMZgbKCb3CfKuWq6jGa6
	ArxnYBFLe+j0GAs9im6G1ClYP+Cm9VaF6LS8jHFWJ1Q==
X-Gm-Gg: AYBFou3HNhBh/85iYlnSS6d3oFx8Ht5sVOtanYXiQFvH7ZoSaSzqYRypyuOAHitjm8v
	XIZzZQ3VgpWjs6jQS+YTEGvTSxfnLfZeZso/pewj0u/opYPaWutM/CN3e9stBaWqUPe95BZJ7mt
	dYTH5giTA3/mo6GxTtlx4nE8TfnA2CkxlhVBa6taLY7gHrFFluKTZksGPj2Zd5o9jFSeLWOEgZw
	d5PDdP6ThLK2GGjG1we4s8GClr4tyOToieYIiYVHKs+tqk4Mf2NdbHcbYutUUgB8j+yGcrkabXX
	qY8wgYa5/OnUbkA+d/U0QJDJ5yVQhjv1Iig+GdNvtSYVz2Bjp7HppmZRl5//G0iMROiSy/7QusL
	C4F2z9ie/FWFjxn0SU/gdAsI+dm0xzGcV4Tz29UzHfEMjweb1B0TzG2GVWP2Q+SiGSSrGUzWsoA
	u0UAVppNwkwT5ZKDg+h/7jWU9Wb6ZX3URbZGhf3GpU
X-Received: by 2002:a05:6102:2c81:b0:7cc:26e4:1943 with SMTP id
 ada2fe7eead31-7cc92764345mr231039137.28.1792537517960; Tue, 20 Oct 2026
 16:05:17 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013202647.2206263-1-rjethwani@purestorage.com>
 <20261020133601.2081ab1f@kernel.org> <CAKaoeS2WHQ6QH5XJ+T0RLuxVDJAOtzdfVz0V6gSoZ7n5GJkFdA@mail.gmail.com>
 <20261020151924.41e22eac@kernel.org>
In-Reply-To: <20261020151924.41e22eac@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Tue, 20 Oct 2026 16:05:06 -0700
X-Gm-Features: AclHuK9A-chmt7AxQxaQlPmX1Htqw5B8m7SDR5AqQA1_FRtzNo_4_q-qDuJ3TEw
Message-ID: <CAKaoeS1ZYkdJn7ih=RnPYjfYV9MO3k1Lo43+uKrEuLMMN4U21Q@mail.gmail.com>
Subject: Re: [PATCH] tls: keep TX and RX hardware offload on the same device
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 14:01:23 -0700 Rishikesh Jethwani wrote:
> > On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Tue, 13 Oct 2026 14:26:47 -0600 Rishikesh Jethwani wrote:
> > > > +            rcu_dereference_protected(ctx->netdev,
> > > > +                                      lockdep_is_held(&device_offl=
oad_lock)) =3D=3D netdev;
> > >
> > > Too ugly, add temp variable, pls
> >
> > Thanks, I'll use a ctx_netdev temporary and send v2.
>
> Is that a name you've seen anywhere else in this file? :/

Yes, tls_device_down() already uses ctx_netdev for the same
rcu_dereference_protected(ctx->netdev, ...) lookup,
so the name is consistent with existing code.
