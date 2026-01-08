Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35948328B6C
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 22:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767912490; cv=pass; b=S6uPvVCSO3DDGF47K5RvwIUphYwnOIz96FH8C7GobNJLO8Uh8gQ1XUZ/ebccLVhDLvCJDVxH/bWvwexZ5vPsbhOKCS4OXWH28C4rwQoUNQKL5XothgB2FnEW0lZB/1qzwbXZiWLAIyAg/YChUryeXUoDa3YrnyLVlfkw2z59Weo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767912490; c=relaxed/simple;
	bh=WV9pPdU0/t3bo7zpdI6NRHH4RIbqWrXSjDNktz3inOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoK4Esa9bU+n4XByPV0u506dW18KAXTuGPwevDP3uK9HSKnEAwY4LYxHYSYDQOLm1X7LT4j9DrTqD1BoQbczkOC/XVKlwkjfVKsYHH+xlj5A2ub5L3wVCgBZtIIbyG8hI0Fdi8EbutWRO2doT1ycRQYBgjvyuIfz6GrVLuF/i9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KP4G76vN; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KP4G76vN"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4edb8d6e98aso180921cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 14:48:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767912488; cv=none;
        d=google.com; s=arc-20240605;
        b=eSiedClF2o0P6NLOz2u2HrgfmW3tGpvowQvOf/Oa59ZrzM8BKtV3bzi2GIM9KfaOgm
         C+MuLLdDgo/dEaKjlVzXsf2vZSofCkBtyETRH/4uhf+cOzh2hzi59r/qX3HCce+1PDdM
         GBUCd07TX1evQYTs37fqdXbQuhF/wT4JYG2DqQ039KmA8J1oNf9v3GL8fhOqoCQVYWCd
         q9N8FdxFkhZsWgzDrgPn3vagjfxDclU9X8629ajPlJL18NvpJg8SjvLaO/I3+JOHEL8Y
         JXL0qNhcR69pztnboJHema5xepis6Sg8c22UHn1ZtD/OgZ3QLWgMlod6LowijbFCsNxd
         N0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WV9pPdU0/t3bo7zpdI6NRHH4RIbqWrXSjDNktz3inOI=;
        fh=NVxFuguRKlLMBxPr2ZLTI0ahTnLehewFWrriqh4+RPw=;
        b=jsOc1ldLhgoIOxcs+xx75O4YRkqaFH/MaxuwM0xan+qEJy4SxHY69XREI8Cil3vfZC
         XLBlQFcqGXstEusB20Joz306C3XV1HLMyKLKT5pxEeOkd6NLvrsvlnPK64nPrmOCmOJR
         aQZz9WEvJjgrpVRk8Fklov1jfXrxBmKs+roHPHdRjd57zQornt7dpkdN8fK5vjlpru3a
         TrHmcNWqEp8U9+eZBRWJK2kX7QfPcM2hv/+3+nEBtC0D/4/+MNu1PvVq0zwLkE6gtXyN
         DjkajuA1idAQk5aeP0InL46ZqBifPdOvxBQNiaqexPAEfVCLuxuJa66X86ZRIbyiKDaE
         yiMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767912488; x=1768517288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV9pPdU0/t3bo7zpdI6NRHH4RIbqWrXSjDNktz3inOI=;
        b=KP4G76vNV8G2QJOzBZ3cs5ZC6bKRcr8+OPMKDkbNwQDkQxb+3lMTpACN3HVSNG9/Dv
         FLkKWfMtfH2Ic+yEEMP8peZE8gI3EGYV7ESz4VWTYr9Qd5/ANShPi8YR1NnIvlGecadL
         bSLz+SPPPu7zrn0o9Yg4WtX5DAxMce8uycGg32Vx6GMCx3ixgYBYzaZzYe2v1oRxVqZa
         9muz9upsFMIDXxg40v9qkD6BeUUGgYCwvvkvJcRi4iMsIB1AAdggE29ylmJVaiZ3/Khe
         87oC/F4AT3Qf4i4f6Pm945K4cbyH9cZo22WZNfrz8OMHRZ76yH+357zeIQHzuKABVaH4
         VK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767912488; x=1768517288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WV9pPdU0/t3bo7zpdI6NRHH4RIbqWrXSjDNktz3inOI=;
        b=RUgZShUhFvG/uyQT5+J8R51HZPKelbPDeDYtIih2XIJa4JeDchP3C47xoPXmmoOhUx
         IrGpjqNG07AyET2s7fFnymgkvxS58tGTzSLzZstfTXtfnOqrJRmx//IJ68Lp4bhOxJDp
         JjZvno0ZNUw/WOkDVkfcM4i7ecUn3s4fyoAencp/2XmZxIArwlQn0XyKXTLUjtt2AXtz
         MeqMApcxF0KeMv6UsuQfzhI8ZUejeSnSUElhNEfVoDzVWfUbuDfeBGj+AnYL4CJHSLGZ
         D0S9Yojh8kcBDEAlkJGXI6UuLHiAQlpBGiJLVmVAZF0mpntnOg189AfGpCDJUU/0A4mQ
         bLqg==
X-Forwarded-Encrypted: i=1; AJvYcCU3o1SeyEb5HOuNZPIF2J/0LMw0kqMjrYbuJETK3PEGdMUNJcUt7jHYJn9lvrIHSBHdkoby5vLPFl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIeU3YsAKVS/AHhdLL/ra11K7UuvYDnp9zFpLrOrN1fKbWM+s6
	gzLxXy9VAYQDeyHkFH1P+Fy/45+6l5PVL1D7Fp28YJWmYYQcAll7COjNpM/4JHn9MbSrnCTtAGw
	xQFLhzrJVz1495YZgId7xQKdWK+k7AD5cVZ/jzADQ
X-Gm-Gg: AY/fxX7hiKT1pv9Z6qdAArEVAy3OqSrFScG3xfroaKCZ4GCvSCLvtTjVXJsMTkicvyH
	8dqMzHq8N/evg9pQV206a45nd9+0UG9Lp3iNO65yUeS8nPswUePjcV+TA9uqI2jbXIelNSt/4ni
	kWn5ejb1aZ2Z8BQtHdwVilOlMWioXekTnd9gEYgS85fipwkv1Qu7R3fCZDesfrHilWYYVPNbEch
	jvMNb9pTGmg0ve+Wmh5f8DDiLtySSbhOMG/GdOAACSIsy0hGzUigaxakqZFF2DBpf+dweroUYve
	HifdxzTdH8vMSNSenerfwzhD/iXiJkLstdHbqSj1JFqglxTHUtR8tWnd75A=
X-Received: by 2002:ac8:7dc8:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-4ffcb1703famr1912391cf.1.1767912487896; Thu, 08 Jan 2026
 14:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com>
 <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com> <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
In-Reply-To: <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Jan 2026 17:47:51 -0500
X-Gm-Features: AQt7F2rHIoIx_fDko3yxcFPFIn-ukKfEKFlHAg0ugBLMmvSi3Dr6twPz-fvm6JM
Message-ID: <CADVnQykyiM=qDoa_7zFhrZ4Q_D8FPN0_FhUn+k16cLHM9WBOCw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] selftests/net: Add packetdrill packetdrill cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, edumazet@google.com, parav@nvidia.com, 
	linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:46=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.co=
m> wrote:
> >
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > cover several scenarios: Connection teardown, different ACK conditions,
> > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > retransmission/reorder/loss, AccECN option drop/loss, different
> > handshake reflectors, data with marking, and different sysctl values.
> >
> > Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Co-developed-by: Neal Cardwell <ncardwell@google.com>
> > Signed-off-by: Neal Cardwell <ncardwell@google.com>
> > ---

A third note:

(3)
