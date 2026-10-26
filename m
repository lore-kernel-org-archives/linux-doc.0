Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029063;
	b=H3jWARZ50vlbHt3MqjPpBTUHMOvGnn6IW5KMcu+9PG0jesP2KObRSoVUUjtMQd+HV+Ak
	 tz9XHtNSXkABLsUuhJ488uCpEzP4KktrK4AB69SmNkhMiEY0wbMdNlqCEqq1N5LqAqw8Q
	 r2AJWuG4dkE/hscWnfOS3Gkq1gwhv6fc38TW7S+c0LYphN4xQHn+HMNMBOv4J+5MAk1oy
	 pZTn4g+ryM1BWmXtkHuxk2vzskoBgTWsGL4KoWJQWBx6kv1maiaDiSjcxsPTTTFcTGam2
	 9GXfln3ns7/jln6mXxaFQ0ik8QhxFEZE8MovbG3uRazszPcqjMyUvffNT9hQbx5O1kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029063;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
	b=1gOI5Bt/Z9ZmBgqe4vDt5oO655SdCV+e8PY/GQnmMXIoBBwbFV2VWkd2ptAt8BiUYveL
	 JorFn+iQQNuD9tFfo1EWqt5L10uJDAjChjGMSoGQ6wSu3Ja3KyEnblSwwk4MHvlAokjGA
	 XdFGfwBQH4nskmPie42WQKf0VQNvEk8bhJOiu/tKzxvRnS3K3LozQHbl7LlL8F8au18YS
	 PSUBBmqn+wqqskm8bGuSjDLAq5iJtzRu8MrfTTCZD39TAq73tjuIzimzA/HZ7jbyNb/Ck
	 GZY4nNOGBFbVOLjAIZ/LqTSqhiPM7whLMjOLYHhFZqsFrHHMm8E3ID1K6Q0Jc91EjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF63606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF63606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1153429e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029062; x=1793633862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
        b=momftWnkauAJLYToOgbcOTInA02g41ht+OWwEV6xdTjNSddo72LcljUmYKFpbHmY8g
         OH2zPtL46ife4YGsQJPHlSTY7AirJzpZW0C9M094DU8ZIiu23n9RARKOOh1URQfb2Xmj
         4/8tXQtI8sZ5m8uLEVf2uU2KwQ7A0LP3hbleAJcer37vUPFrc6yEDNoKSikbZI5jAdx2
         +dbTPFYFmcJ4pYYLuwBuGQf1qyaBeQ5/obn/tqQtNrbDsx+htrqYXvFqvCqdyXkK3+vQ
         tMaRl9UbCWwluGZBLbsS1hrggse7VQWJb/k0Y0rlA96n+CZXYXDwWPj0iwviVckjHbAd
         SdvA==
X-Forwarded-Encrypted: i=1; AKwUvBykJMnp2pQQHNXIM0aZSEuKHkqboymrxYgYCHaUch3d+jcf+x1SKxja2iEcR8ic8pmBQ4OaYQKCt6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9qLN1g17k/MlOK6rG/t1oFIn6JWuePNXt7Wu+nFJ0/OK9ftU/
	6MJPJfyX+YYgN4y6IQOfTmK2hg/OQcRPaMyacCn+evp2LLpjBKuY5Y+n2ggcYicErrQ=
X-Gm-Gg: AYBFou3acAmQpRIhgv+P4DCGBuw+69tS5oWCuBeBSsmWyXYy5QmgqftNWgd9KGV0rbJ
	6gVti7OOQxCeKqPisEPcLYqroj5boiO9ro1g/7wamqHv9FEZRbSonFS9XNW7mPvf/NeGRpiaSTr
	tDpellckE8gYJEilwjpTmM5pRAKzQPNJ1zTWTAzY4uO0HSoRBeG+gFAHTrDCEh47B/TJDul4FOI
	vHbXzfL9PFAiBN1cELUCNtG9chqZuVzhEKnYDGd2kgq5bk3Wv5OCFXF8pCrHIHHu49R0xZTLwyS
	4yseH49ewYvWJn73vAeybKRvljbuYFi5QRiG/izdgnZd3iy/g3ViBjiyMngxYEZf/TZm5y7hVfr
	SEff95M0Lsl1fDC4aS94uqs1ch9AKqekvqe+6vG/2giup6Rfpa5L6I3wQ5cPuo3oC0ykfin+589
	l1jdrirt6HOEch6WShq4ZrsyryK5HiqTPVmkEc0WT1V22zL5cmz66of/K/LqGG5WYXG6oKgRtVq
	HHCRBR3S8PCwO5NIeW3P1NbLE1uzD7otZ6Kt3z89GGen2e7oJJaWnsebGGhcVmrC13HxgXaklkS
	gAq1VZ78/lm2J4mhxQ==
X-Received: by 2002:a05:6102:83cb:b0:7c1:6de4:9f67 with SMTP id ada2fe7eead31-7ce5ca62390mr1691635137.2.1793029061405;
        Mon, 26 Oct 2026 08:37:41 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e23b13csm8031337137.8.2026.10.26.08.37.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:37:41 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9905e692905so274652241.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgeCfUCFstN/Ktp5fRga/DS//Epw0UAVjkoWGiSZZnGEKaUp7qT6Kz2i9lcWJ60Pl1K/YvzPQPJWI=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7ce5ce24986mr1893457137.30.1793029060367; Mon, 26 Oct 2026
 08:37:40 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol> <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol> <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com> <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com> <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261026145343.GC1001933@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 16:37:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
X-Gm-Features: AclHuK9NkUp6rJz4jccHSR8LbKSfbJD7mhN8jXTqeuqbOAgqsCvTqyecvNO-blg
Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:02:27PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart wrote:
> > > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > > > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > > > >>> there's no base-commit?  Including any historical patch (from
> > > > >>> months/years ago), patches with dependencies, etc.
> > > > >>
> > > > >> Dependency is something else, but for every other patch:
> > > > >> 1. For testing/CI: you apply on top of next
> > > > >> 2. Every other case the maintainer knows where to apply it, because it
> > > > >> is his HEAD of next-branch.
> > > > >>
> > > > >> I am repeating myself, but I really had no single problem of lack of
> > > > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > > > >> subsystem, thus maybe I do not understand the actual problem you are
> > > > >> experiencing.
> > > > >
> > > > > When I review patches, I often need to apply them to a tree, mainly to
> > > > > see the context, but sometimes also to test them. I have encountered
> > > > > many cases where the patch wouldn't apply on the current for-next branch
> > > > > of the relevant subsystem. That's often because the patch had
> > > > > dependencies. When I'm lucky they are listed manually in the cover
> > > > > letter with a link to a branch, but that's far from being the common
> > > > > case. I then have to ask the submitter to provide a branch, or enough
> > > > > information to recreate a branch. Having base information (base-commit,
> > > > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > > > time.
> > > > >
> > > > > I understand your concern about maintainers cherry-picking and sometimes
> > > > > introducing issues as a result. In that case I also prefer asking the
> > > > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > > > base information for, in my case it helps with the review process.
> > > >
> > > > That's valid and for 95% (guessing the number...) of cases will be
> > > > solved by having linux-next as a base, thus requiring the base
> > > > information is redundant. It's just linux-next.
> > > >
> > > > When patchset does NOT apply on linux-next or maintainer tree is
> > > > non-obvious, the base should be provided, but that is only "if ->
> > > > should". I think the proposal here is a bit different.
> > >
> > > What's the downside though ? As git can easily provide the base
> > > information once configured to do so, what's the downside of asking
> > > contributors to include it ?
> >
> > My base is usually not in your or anyone else's tree...
>
> Hence the prerequisite-patch-id and base tree information. Or do you
> mean your base is not public at all, neither in the form of a branch
> pushed to a public tree, nor as prerequisite patches sent to a public
> list ?

Correct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
