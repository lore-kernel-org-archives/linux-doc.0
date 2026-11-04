Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791834;
	b=C0DtwQ5MSmkOajv8BVJ/GS5Pz+RWV9jWu/5ALmBROMV0hxMiJvyMyEyCHRLmAoRdFlLu
	 Nyyx6uyrPzx2ytjvsA4EDG2CG2ynkjng2begSzguKBfC7n3zLwYavUdMMH12x//wwb2EI
	 swsYWyCQ3TbTiU1fcBC8LK46PhIsvTqGzek0Si82qxTV6lHFv0OOK18d/dAhjW5aVoHke
	 5DpGJxB5SnLvSh2C3YRXbUAPblb5wQc/LbzRybq/CtYuaWHpRvuig8lDDUxaNOmjNQy+N
	 GX30Ky5xzOXFijsXimsFP8ZWJX+kgYG47T4fb5vur9Vn9tLXVeTpqvC5aU6ujCGGzXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=12Z4lOF0jQfTB4x6+mhkZ27w3B4gOwwYBosLZfWaVjk=;
	b=uWlTcW2goiLJZxLxC+0h4vajKIZkZ7g0gQmGwlZ2ZfiEODOzmkPiJ44V3l+PublGw32S
	 eInDsNnJdVFLdMQzfPCVO7gg+DvAhxnNxOETxTkzwJI47aXpsUAONq3TCvHEvNcLPm/Af
	 YskbWqhMefJE2KnMIdtHGsjWeN1C2+NaX8atZ5vuB0CCyjxGp5YSG2bLQ6wh/G7kIQ0tB
	 Jb+I8yiSedqGAIr4O6i7mwqig0kScA7+Cu3BbDNRnEoH3nUB6IP1/t8fwp3+wexIGG7IY
	 6EbCybOrawVwYqyKWYdxYrI2jHiJnNNvkGwk6e236zEb56lVK5AUKYn37nPA14wGFtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OxFwYHpZ;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D4A606A32F
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 11:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OxFwYHpZ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c42f98f354fso102810466b.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793791832; x=1794396632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=12Z4lOF0jQfTB4x6+mhkZ27w3B4gOwwYBosLZfWaVjk=;
        b=OxFwYHpZryXJb9enpLN87kRHPhZ5WBZA/67/YXzaPEYjTTLlymCutEI1uecBPE/BvN
         huqf7toSWyGVex91ZAogh6DgqKGuOt0mMBn6kABO9B6FhqYW8AjjUa4VQ+ayHjfaXA/R
         wVlA1/oiUvTChrgsjjjL1YCgMQUeI38CqG2EEPykNUfu1ppbl/V8SEu51MEg8KAcQzwy
         phahP5oTOjD8rnSCmk6+y6VkWQadghfC1gEExWqEMbyPplT2lqJDDTPGTuZpBEv3iy6d
         FfsAnJqioiB+zVM0HXxdHfTfpaK/euZmoaLFFdj+oIPkYpGlH4YM41240bEq7B4gWTTM
         E3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791832; x=1794396632;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12Z4lOF0jQfTB4x6+mhkZ27w3B4gOwwYBosLZfWaVjk=;
        b=PbXZKlTutP3xRZCZjey6onRj0UW3J0xXco8RAWsd7PUOgzZTuxKMirJ8HdrPeMvY3Z
         xMr4cdjQINqi0eruPumW28ThgvVT/neua40Nnw4X1An5n+xCME2AHQsfbccNtd4ASPh6
         BtfR4JL84yp8GOf/D6fUKdVYggEBkZaOUBmuH2IGnutM8pNEtqgYAFiSLb2D6abGlY+H
         ztEMaY4TpepeuvSyJMduhjAuM/RRaM5idAef8G8UNfXKWAvSj7ot0GA7Ot18lM9LBQ7B
         fzIN3rfun+a6ijfGJ2jPHNAaRUI0qn7L4Vg9+hea4vzSffN8RQQc7EC8ObroKFJLLrku
         hpBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcLRKjsByaL5yFLex3yfEu7HHEbwjLmsQsotE5eX6msE0OlG5O8hPb91HAtfgeTLdAo6edtYZMHEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DxOAG46+GWyoaK/JgEHhEvpMR1BPzuTYE6Wefk67k/5erp0Au
	0axrfNScnQPtSkvvMNmW0lEa+e8+k5iyJhX4F7tPsCFGTL3PLcYKJnt4Xfit0nR1mnQ8SOay3A=
	=
X-Received: from ejbgw4.prod.google.com ([2002:a17:906:f144:b0:c3f:7129:4c10])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:18c3:b0:c26:22ae:b66b
 with SMTP id a640c23a62f3a-c4ca7aee966mr1382566266b.15.1793791831732; Wed, 04
 Nov 2026 03:30:31 -0800 (PST)
Date: Wed, 4 Nov 2026 11:30:31 +0000
In-Reply-To: <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <auM32mOlBLu6ZUlt@google.com> <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
Message-ID: <ausXFWLgHabezE7R@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 10:37:48AM -0800, Andy Lutomirski wrote:
> On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Hallgrimur H. Gunnarsson
> <halg@google.com> wrote:
> >
> > On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:
>=20
> > >
> > > Why should the task's cap masks affect this?  *Maybe* cap_bset makes
> > > sense, but I'm struggling a bit to see why cap_permitted and
> > > cap_effective should matter.
> >
> > Sorry, the phrasing here may have been misleading. Just to clarify:
> > none of the creating task's capability sets (cap_bset, cap_permitted
> > or cap_effective) are used to restrict the new user namespace.
> >
> > When I wrote "reusing the existing task cap_bset, cap_permitted and
> > cap_effective sets on namespace entry", I was contrasting this with
> > the prior series from 2024 [1], which proposed adding a 6th per-thread
> > capability set to struct cred.
> >
> > In this series, when a task creates or enters a user namespace, we
> > simply initialize its new cred->cap_{bset,permitted,effective} in
> > that namespace to user_ns->cap_bset instead of CAP_FULL_SET.
> >
>=20
> Okay, this makes *more* sense, but I think it's too weak.
>=20
> I have a sort-of goal of having the creation of unprivileged
> namespaces be allowed in most contexts by default, *even in Docker*
> (which would involve the Docker team changing their default seccomp
> rules, but that bridge can be crossed later).  (In furtherance of this
> goal, I fixed an ancient bug in newuidmap that gets us quite a bit
> closer a couple weeks ago.)
>=20
> But tying this mitigation to a parent userns means that it's
> completely unusable in the single-deep case.

To clarify, this mitigation isn't exclusively tied to the parent userns.
If a system administrator wants a host-wide policy, like trimming
CAP_NET_ADMIN for all unprivileged user namespaces, including
single-deep Docker containers, then the host-wide sysctl handles this
seamlessly. Any unprivileged process in init_user_ns calling CLONE_NEWUSER
is subjected to the sysctl ceiling, effectively stripping CAP_NET_ADMIN
upon creation.

Where the single-deep case falls short in this series is per-container
granularity. For flexible configuration on a per-container basis, this
patch series assumes that containers run in their own user namespace,
allowing the runtime to bound capabilities at creation time via clone3()
and have that bound persist down the namespace hierarchy across any nested
userns creation.

If a container runs in init_user_ns (as in standard Docker) and we want
to restrict userns capabilities for that specific container without
relying on a host-wide sysctl, then you are exactly right. We would need
some kind of cred-based mechanism to pre-configure a restriction for any
future CLONE_NEWUSER calls within that container.

> I do have a question about this whole scheme, though: are we talking
> *just* about CAP_NET_ADMIN?  That is, is there any other bit that has
> anywhere near enough security relevance to make this kind of thing
> worthwhile?  Because if it's really just a single bit control, maybe
> we can come up with a nicer scheme.

Yes, primarily CAP_NET_ADMIN, and to a lesser extent CAP_NET_RAW.

If we look at submissions to Google's kernelCTF VRP [1], 90% of the
exploit submissions in 2026 require CAP_NET_ADMIN (and about 70%
across all submissions since the program started in 2023).

Restricting these network capabilities when they are not strictly needed
(e.g. for sandboxing) is the primary motivation behind the series.
However, I wrote the userns capability bounding as a generic mask so it
could restrict arbitrary capabilities down the hierarchy, but if the
preference is to narrow the scope more specifically to trimming
CAP_NET_ADMIN and CAP_NET_RAW, that's completely fine by me.

If we go that route and want to support the single-deep Docker case, a
per-task inheritable securebit might be one way to do it, e.g.
SECBIT_NO_USERNS_NET and SECBIT_NO_USERNS_NET_LOCKED. Docker could then
set and lock that bit on a container in init_user_ns without needing a
parent userns.

On userns creation, create_user_ns() could record this restriction on
struct user_namespace. That could either feed into the userns capability
bounding set proposed in this series (clearing CAP_NET_ADMIN and
CAP_NET_RAW from user_ns->cap_bset when the bit is set on the creator),
or be stored as a single boolean in struct user_namespace if we want to
keep the mechanism minimal and drop the generic capability mask UAPI.
In the latter case, we would still need to replicate some of the
userns capability bounding functionality, e.g. strip CAP_NET_ADMIN and
CAP_NET_RAW in set_cred_user_ns() on namespace entry, and bound the
parent-owner check in cap_capable_helper().

[1] https://github.com/google/security-research/tree/master/pocs/linux/kern=
elctf
