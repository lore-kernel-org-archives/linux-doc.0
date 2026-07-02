Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3D385D7D
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783026786; cv=pass; b=EGetyHQwLcWBYtv4nDQbfiPjhgjtXq7rl+bM46bMle6jpRjPBmpU6AkWJr2ta9uvyRQqFKi0J+yyVjZboTo1a87t37s/AHnb5A7Fl/M+b0u8vKbg7nlUzIx+49zTqq6+CUqv/9zTRYeaKn1LNAPaPj05LA7v2g+aVF8AfPxDtSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783026786; c=relaxed/simple;
	bh=6cZbDjgOL37MD41a4mUgO48Jw/rtoj/VLkwNf4EshIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmE3FsSVWI7vkvHmE9oRkaOOQAqGluHD9RNGWf2t+X7VneCDDDLFZVBjP1/+mVebvAfqFLqPjgXAMMQjCzfG+CSa9ssrVaYYyU5Wh6ouIdE/FHqrvgVYL+/4+puwNU0azRL5LVGFITgMb4t13sQyg03o4AjOZnmsbXnmP7Bsskw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Ck61Fc5T; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Ck61Fc5T"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so17462435ad.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 14:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783026784; cv=none;
        d=google.com; s=arc-20260327;
        b=AeNLrHGbjb6PkV8rDy9q0qY4Sy5DKrZv8hplivRIU1EvX8cxfVOGMO7SKrI+VBNbxR
         9nTCqJwsMHEh+8oOfs6MSoYS3FCP1yNMNo0OkO9oyYTZvRVCwvzEOeUbBb2L6n3X8Qam
         JGfBudoeAa23iBWlcs6Wg+eow1D1GNA/8XEzkcFL6RoD3AmT5kHfX1dMQ068ht8v4Q3h
         zi8IPvQkTqYqkA/fDw82DTlRdTL66cy9medxCl1DOfGzuUF1LWhqKOdGbcuxF5ZXW00I
         SBovEm4nyqsGSHdNkk0KOG05zTsMyujYyeaTQiVITv0+Fgg1bdvk2I0eGWeKdlpwVXAn
         BgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        fh=0swqiWcByUxWULuSw4jLYjsjbX7q+/bVsB4PzqYuquI=;
        b=NMAlEElLh/EG+k2c+nqV7UBfsS5Rxfq8oO8jFW0q5lftks40fANMxaV2Qrm28VGPFn
         NcVldDG1lG1ZqT8fFUToIy+i22frj3GGLs4avRroM5wDAtexIq1eQhJQUBASy+jNaBHY
         u+J1C75tQvxnj9clcmtL8mnhi43C5sDPPp/lajz5hoAs89l22sxLAsnImSFmCHev5zrV
         48lqPQeDaOzAoYo43jGyHKmumK9m5+WQHwkKD5JYdLCpvYueFckWWWMqR3U2JR06mg64
         crpaMlr50nnPTNnR5/Z+P5PMOp9RkC/C2YrmnZ70+my2h1TatjJbWR/ZpWjMfDWX/hrJ
         dofA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783026784; x=1783631584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        b=Ck61Fc5TJzIU09+axx+e6RLYwDfGVqprsoe1m2tRj4enLqm0IA8/WvBxd04tQAaBIB
         9lQUsZEYbaCGOpP8E4rC242gtPQnirRjBU+EOLWNY36xMxvff1qytC3d15QIMGCFTVRf
         n4mfpzQmQkbbOaEdaNFIzkkh3I6RmvoL09K4bkE2wlrV0k6U4oBom/XqLGIalWKessfp
         AG43lp7KJrk47m3/UJeuw13uKE7hVwwvGDiW7VmPyJF7aoC3JiTALcaHuF6uQf4i3jKt
         6ko+xoobjCKjtpAymZl/QgRORh21J4ihVvZXnWIaR5iRpxt+vFRhM2mg1MBaFMTzsO1e
         b8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026784; x=1783631584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AyIW9b1L4RTcWNQ05u8o4YPVZ1U+N1SMUlgeq725Esc=;
        b=X6oPfBuPzfKtDhq+9eoEkm92tLyd5CuxK6Ee2YhQdNe0Zq6ZCkHB8O8upUWdLzRj+S
         ESR9Z08KdaroCdTNMdEk7p/ovKUZzywlc1v74dS3Sr0TfQKC6xOWPNv5z8N//NMfkKqt
         ZzlUGXiYTNAPJhpl1aThQ3H7p5dOCj+ktxv9xzqmhRzhyTry3p13yvlz5iObD/uPfP9N
         Q0b1po9qY4Tq23QFvSMUTjYoXfORUynCKP5wbQz5wP/Nbn9SNpRP6AALej1ba1BTv3iq
         SOtcSg14QrMsebbZ0wzij/vUaj4uLjn34sD/66VzDMMiTLT1sj+osZrOA4UdeMUl6rVJ
         fOhA==
X-Forwarded-Encrypted: i=1; AHgh+RrU2dHtK/j8uWK75wsdWy7G6yB72sa3XK92uYitGmgJ6v1YwAPOuFiNQcRCkPe2YmShLbRDL3EUko4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5E4X+9v5YNP7cdDF4Rkwoi+sAGRW6tJzNHfURdeaSL3gO7TdY
	DVpd8G8HmfqTbjJqZQvE+NIFPRklenA/I+p7R/zakNZJSTMTyhQUfgvhlkGmzPuIYcQPVdBYx3F
	cLgNvfufxjKOG61JhJW8Lo9V9elpeSo26m9zm4vIq
X-Gm-Gg: AfdE7ckytDR/Yoq1wNsntExeOXHq+JJFoV9048NOXuGmN7bgA5v5MW7nkJi1VBayf9w
	qmrjzDkW3U5nC2UHjllVIyTW4IPHl24caeEx/D4aOoBBMWwECDocdq4FekarFx2rWyZc2Mmyjl4
	l3S7k/DaM/FDKRrl3CniSbyZw5/77aRoY7tL55cipnG2jyf22r/7WZ/h7T9YxAeW4lFwGkBFzZD
	V4gpsJte0QzuyMzs64TWkibUzuTQNYR0bDHgWIG/u0AS3sAfOmS0ybbZfi1lwuyJPegDGT6
X-Received: by 2002:a17:902:f710:b0:2c9:854b:d53c with SMTP id
 d9443c01a7336-2ca911f9311mr68892545ad.36.1783026784472; Thu, 02 Jul 2026
 14:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-remove-task-euid-v4-0-07cbdf3af980@google.com>
 <CAHC9VhR5Ca+WyP2OiNGtL1SqHn0SwLe=M9SB8D2bxtdS52quhg@mail.gmail.com>
 <ah51DY5yfaNZejBd@google.com> <CAHC9VhQyNzxJgdMkmEsOeAQ7Wt2L+eW6aNLjeoYmnCQLmcYRnw@mail.gmail.com>
 <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
In-Reply-To: <CAH5fLghJaFXheAZqKyM9Cdo6iqTw1W=haA79POhmZWEfuKujRA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 2 Jul 2026 17:12:52 -0400
X-Gm-Features: AVVi8Cc226agFjsV3IzoL0ZtqLK8mwQAJ-H8dg4RuGGydr2Hd_jseubNHLDGNTk
Message-ID: <CAHC9VhTfOnOgOzGk9==wJYKx5gAi3Zf3oTwbj183o0_xxrfKag@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Delete task_euid()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 1:05=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
> On Wed, Jun 3, 2026 at 6:05=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > On Tue, Jun 2, 2026 at 2:15=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> > > On Mon, Jun 01, 2026 at 07:13:37PM -0400, Paul Moore wrote:
> > > > On Fri, May 29, 2026 at 5:33=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > >
> > > > > The task_euid() method is a very weird method, and Binder was the=
 only
> > > > > user. As of commit 65b672152289 ("binder: use current_euid() for
> > > > > transaction sender identity") Binder doesn't use task_euid() anym=
ore,
> > > > > so we can delete this method.
> > > >
> > > > Given the problems from last time, it seems like it might be pruden=
t
> > > > to let the commit have some time to "breathe" in a proper release, =
I'd
> > > > suggest merging this not for the upcoming v7.2 merge window but
> > > > instead waiting for v7.3.
> > >
> > > Sure, that makes sense. I'll resend after the merge window.
> >
> > No need to resend if there are no changes (see below), it's in
> > patchwork and I'm tracking it so you're all set.  I'll send another
> > notice when I merge it.
> >
> > > > > My suggestion would be to merge this through the LSM tree.
> > > >
> > > > That's fine with me.  I'd also suggest updating the commit descript=
ion
> > > > in patch 1/2 to indicate that binder is no longer using task_euid()=
;
> > > > it currently reads like it is still being used.
> > >
> > > I guess this occurred because when patch 1 was written, it really *wa=
s*
> > > still being used.
> >
> > Yeah, I understand the world has changed since patch 1/2 was written,
> > which is okay, we just need to update the commit description ... which
> > should be a trivial task.
> >
> > > Perhaps we could pick up only patch 1 now since even
> > > if we run into problems and Binder has to go back to using task_euid(=
),
> > > clarifying the docs is still useful.
> >
> > I assumed that was one of the reasons for splitting the changes across
> > two patches (reverting patch 2/2 leaves patch 1/2 intact).
> > Regardless, we're at -rc6 and with patch 1/2 being purely a comment
> > update I don't see an urgent rush on this, especially considering that
> > if I did pick it up now, it would be for the v7.2 merge window and the
> > binder/current_euid() change will ship in v7.1.
> >
> > Let's update the commit description - you've got a couple of weeks to
> > do that - and then we'll merge everything once the v7.2 merge window
> > closes.
>
> Sounds good, thanks!

Just wanted to check in and see if this is still on your todo list?
No rush, we are only at -rc1, but I was reminded of this while merging
other patches and just wanted to check ;)

--=20
paul-moore.com
