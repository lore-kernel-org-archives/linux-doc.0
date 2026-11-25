Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608355;
	b=v6AhqWNKePWVzebE0P/UAKlCiX+ONDQ3UrlSFjsvSSRotZbvt2JL+Dd3nnP6nnrzswjy
	 Bg5ANMDeRSLT9hODr21tUhWvUCK2uoFqI/QTTSUv4ySGrO1bur63TLRCIaGuUSjv6ok/X
	 fvdxJxozWBgbukEXM8TdEauaK7v9t/V9j4SIwY6wxjX8OumU/qMiBOSTxDfR/zHXpGJj3
	 0osJ6p6uzJI5f6Hwyo7jWKes+JGW0krwweC0Wnc/StOtDUlKEBvP0RYtDFbl09a6eU32W
	 3xQ8KLXC5OHc0Ja2P/GLflOK8enpv5UYwzHQM1QradhFxDdllGrKNWpg4xhrb59MvMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
	b=4WKJtA7Dno+qBLZ5g7rNLdyWDkUhkoeP3PPLTqrYAzBw6V27eBh0+1aRn16TTJ6d8uSa
	 H+IHdL8SYaGOyAMOVGpcZ07/V0Es+QYGdU+JXzPu2olNy4JR+TVaUYyBiiwF1poZ8Tuef
	 3GiuTtvX3yMl6c56+iME4fMUotnfMNAtF5KiWIjitmxtP7ysCD3idL8CnP6YUaHK+XtY3
	 V1xxOGpqR2vQbT/993KOQL4XK2nv5q0MDKpk7F4mAuBCtjia0dQkV9+h2FO+TGqLUw4xb
	 wjPRUybcsxZdlybUAcreVn9XysKD/Ad7PEttN+q7GbxTtQtfvQ387NK12B6puQtjy+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614F606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 12:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3614F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3329604f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608353; cv=none;
        d=google.com; s=arc-20260327;
        b=WtZbLva5q15E0U9mAs+BBCPGts4EgMAt575kEWNC0J1bAs6i0zUWd/oV2/36mSB50z
         C2cSHnO0+5LWlJH4YqpetUzbp5t3hRUVykNitI1Y2HMrfPk9jQh0JWEFjsK7umpiq4Qv
         ljaR+8VoGhlxp0n+ZdK5Oa1osP5p2xnnjvjWnmpxiaqSJIgIRe5t0zbeny/8E0OAlqMY
         7s7fkBxrqXXiCSy7BCYGyFc0Xt3AnLdTv3kKLTjzTv7/Kwlvyoq+ftZmV6aX6lD7mTMl
         Ts2ycVpEBBaxTbRhKMR7FnGuMoe/3T7UOQ92eLeAGK1cQXvJ6cdEKcT15F5C03zibuOj
         b2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        fh=aN9or/UR7ek100ySbucfQFNdXZgdBP3XX3qua6M/db0=;
        b=k4k8KZ2gawkCeZ74uGjYyk+fpSGJ/6JAnXWMdaPhIhtTl3eJqOHD6cM8lzGB8yQPL0
         ZPGN2rgBS5ZuFZIaXs73I3E87dTWIrxbXgbke426z7DOPGYCDwzBRzTn5ISK7u8XSQMR
         IcqEghf1pSpwdx9zAX3OopOhwIYPRMgXkhCoMQSsPVTXxz/Zp+eev37jkd7k7wyXrWkw
         vPJFMBj0B8KAOGizfMbutj4f2yVpWQ8aR/sK+CK+FK13G7Zux/Z4gF7rwSsCwfI5/PuT
         2hJ3BqQ15IuhoCZLLSIp6MRrhvtqi/6/dpXNPPAtF+5Fkgo7HaJ0yV7aDXGnMJBEJEpr
         bPbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795608353; x=1796213153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=pjX6QKXG1IYWPuNjl0k+8QjE5ymS8vtEytzSOtJkfs1RHFY0DcWjq5Ki3RkEBzUwjr
         fET2ZoGdpDQVz76KNEMLQ3W3K4BGMAqGag+pH2GQDU8ylUe9pUwzC9r10veWdEZhjwFf
         RVfga+T1900YQda9M99rTh3z82hVG8MYmNK5nq6POAKh1DSNZmbD4OeZl4P7IG/ruDyt
         e1TOEFMvwZsON5XeNlcDp70bR/0lYIKov3PlwK+VAn9QLLQo52NE0o17/I7r1j3n+Sl6
         cxWNQuMvE0tun2uMMH4uMbUmrTM5cOVIjjaDXz8yjG8O7Vv5XfB7f3KvBmtBwISInZOY
         dL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608353; x=1796213153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=U5BUyPTqi+TmsC0rZ5mDGrjAJk42XtWZYaZcxG5TGpc7HdJhUWW1itlm18jhIVdW4Q
         io16bcjXUSbdU+94KXDmrgWo429osJTRVfie7UmfWCd7YW3ugi9kBqlMeE+Ni/8SmSlz
         3lHBCwBm4HuuH+QcTiFMm+boE05+A9UY/GaSzhy7nT652XkNpzEXAWRHjlJuH6VzE5or
         vwCYFpWGfdNCuciYcxizusM+pg6w8LZvEv0FQeL4XUI/9cnG0zlH591DLUm/qSb56U1e
         WPlhz4u9l14kwgeygkRkB9SnwsRdANKtLhya6FGFtKwKdq5YSRWPGhf2ydj0zKG4FiDL
         fdmw==
X-Forwarded-Encrypted: i=1; AL+hErFG7mzlA3QpWoDrgSmWEc0FVUOHkef7NzYgYT6H7d+SkZQ1KxKQ3ha8Caj+YitpUgh2vs8i63gLAEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v6Vphc6E3lv+7iMnvRu27dCu4kqOhCobV3cm81nn4QwVnaQ7I
	IN7ZJSdimCwUEB5G5ihvDJdJ+Z/Ips0oaWBWMiCw7gO3JVS6GoamgnYOkzX1eHDFxgCotj7NVMx
	WPVyCGyUaOdLpGncmPxlaJ+0WkGQhaFNBlci2Y3+P
X-Gm-Gg: AZFdTZcotbmVxhbzjkMn1T+6f/o5da7lcDBR/O66nMmXrmaQI/i3pNEzmS7gamLmcWC
	DekdZb2vR85IKET22Gu45DbhEdQdP4OhiVBzPhuOBNYaLhi51S8kbNS4cDArgUfIEgRox6j1AAQ
	+tk5faspfxxbUWcCVWuHE541mApGiOlxOAkg/R4C8ZbiA/Gfyt3n/FpA/ayz1u23FKbTxBzTdWy
	ed9Gx9ZzcU8DI2jzTV1FJh284Ry4YHkmy+GLamNLFi3XQz3xizYsVoFxAcC8ULF/y2sM8SUj9j3
	EDsbxZDOruZ/1t5FG0zFxYUecV4dA6QAZZapJFLNl8YDEdKGoMvHtgSlwX7bzmmgQT1mOnrhoKM
	x4b/ZLoZQvsoD6ogpLM2TuGFFC2JsB7wZ00GoZclBLsAD/qvFbnmJWzL5/lHYIVCf0x3iEzDaK3
	6Zvh17tFgLlzGnpopus7pCS3rWkNeivBDYWPwPJTwVAom2
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id
 ffacd0b85a97d-4b780c1127cmr8568730f8f.35.1795608352904; Wed, 25 Nov 2026
 04:05:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
 <20261118-ordered-wq-cancel-v1-1-916e01f9affe@google.com> <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
In-Reply-To: <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Nov 2026 12:05:38 +0000
X-Gm-Features: Aa3M54oB_Bc5JJabfyDqaJiI78UWC2_tVPgPCR0cvXKqYj-o-7hWp3ZKJEhfypQ
Message-ID: <CAH5fLgh7b7vFj4y7Pi-s2-4KuwUQg1C1HD6VdDTTkd+xRWaURg@mail.gmail.com>
Subject: Re: [PATCH 1/2] workqueue: fix cancel_work_sync() on ordered workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:29=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 18, 2026 at 05:09:51PM +0000, Alice Ryhl wrote:
> > +             if (unlikely(pwq->wq->flags & __WQ_ORDERED)) {
> > +                     struct pool_workqueue *oldest_pwq =3D
> > +                             list_first_or_null_rcu(&pwq->wq->pwqs,
> > +                                                    struct pool_workqu=
eue,
> > +                                                    pwqs_node);
> > +
> > +                     if (oldest_pwq)
> > +                             offq_pool =3D oldest_pwq->pool;
> > +             }
>
> @pwq still has @work queued on it here, so it's linked on wq->pwqs and th=
e
> list can't be empty. Maybe drop the NULL check? e.g.
>
>   if (unlikely(pwq->wq->flags & __WQ_ORDERED))
>         offq_pool =3D list_entry_rcu(pwq->wq->pwqs.next, struct pool_work=
queue,
>                                    pwqs_node)->pool;
>
> Thanks.

Updated!

While I have you, is there any chance you could look at
https://lore.kernel.org/all/20261119-rust-workqueue-v4-0-707c68994940@googl=
e.com/
?

If possible, once folks from the Rust side have reviewed it, I'd like
to land it through drm-rust-next together with the things that depend
on it.

Alice
