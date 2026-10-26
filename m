Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023367;
	b=T+5RlsaKlaaIYzzWbbBVkpx+RzhG+MfYuyjGGYzX3Qv59AqsxSpqK9iSAeFEMGO/ZF+g
	 KVSlS06WknAHZItaI9gFE9wEKpVX8bg8vt8Htpvm+m2UpgBRKwCynmXVTwAt2c5wCl+5F
	 Fv6ns8aoHp7/7joS6niUm2vMoroYqBACLLe+Z2kAAkyuk4p4AeeP+zMzNJUUqpkTRL6cN
	 d0yU+E/3heUK5OnKdRBaI49VuZlUTxS2TyDeSHTDkmhg3vYWExqL/W8hz8rbyMl1MvA7A
	 o73GKpKKaSrFaAjBiQBuUOmvR+sY8TSsRL32Nm3f3K397k95428ygskBQF9t6xL9DLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
	b=esZZfb8qbEmHW7FyBNI1vixxTQzE1yW3NODaFIyRaKRAs3nb2OO8yBj9T/N76eswgkso
	 O4Bx1UWNctV+YWwgtgarLmwLhbwT5y1ToKRNN0cAaBpAM/Jn87e+3h+O2ZaCxmRDyg73H
	 S3WuKXeGnd9FhaZtpA5uxZKjjTU87Qj4hIIDFR0rne82cGkiOR0rOFgHIld5YMGANX3Hg
	 fbF7pKSafR1gKWyKHw8r62I9+aqdKPPNTQgcSkF2z4dlgdK9CmGPdtPcmtGy8U2ovhmo5
	 Q/j+GDwQqXbN+s7jERcGzKehrPoP0S8cHd14Oq4WlZTBpamkSrLUPuaWjPKuJic/qXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A2606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0A2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso4273010a12.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 07:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023365; x=1793628165;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
        b=P/V6zh9AqWvYxb22A9O1CqPPaELG4W1O/MxwaEHPKGze4QUD+NNiYxGk0Cj8mV9GFZ
         G/RqJ7bm6JmpjGSoUD9BA7jvw1jztcCbTP83WenryhxLJ/AOz8DK9XPwvBV14bhUqygE
         v7/18WSX1KswsFv+a5MGbruGjaKyQZLVuoxfptbzTp6a0dFs97q4XauECOtQxsaXvria
         u8N5LZi30slhuy+yBpOH+Ydfafx7QbSE+imBT3JI8RV8+2jVE2DD0TEhM8atmJWsRSBH
         aJhoCtl4SwPySX0+uh2jio082k44CV1YM7Kn3fkeNBCltxcgyR8/nsPSqOZA8rnDdkrZ
         wbTQ==
X-Forwarded-Encrypted: i=1; AKwUvByOljKjYv67qIulZ+yW9ni+tZxrQHgZ3gjmW1g3YIwOoOYTBZC87Yw4pB49iHGCEqTAfLNcU9pcp0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsRO3byerNdMOE5ckemMvc3zX7AhW3zwWsj3wAp0rqQJzga4Pm
	g2fOtVmR1VfMw81qtQVnY/C49fq5XWrHPEp9mnU/MKGHrrkn5Y2Hn55IJ9UhURJPRF8=
X-Gm-Gg: AYBFou0LAEkW3j2t0KgTcVNK/uZm6HdZrGWXIggFxD4bAO2q4/2hvdl1TgCVSiBYsku
	iVqCnpA7TE156UVZyTJivkN7JiKSTE8r4n4JMHGNDnUMhSXlmUBYJU/UzoX8weIhe4i88SPZwAA
	HgYoMIb4nEF42L3YH32IPJT+mDgLofep0rNjgHpjA52HJV2ZQ8CPypDFxsOK3GSTrIL1+/UWVYU
	FcQFFQB38+6sGgGWV8Dzw7VSH5A/+dx60f65F16EfW3OLjxwDWuYOg8S76ivGw162R2lwoC/JOr
	Ed7Qos5CCRJOMOM4iq56Qa7VR5ljlbUi8vhIEUPLT1Ca5a7R085pVNSlULUJjaM5PuFQpuwj5u+
	kzaudsQ1Tpp7QjXhjk+FRhGGABcGrelFFDJ2Dfs/Z+Vti6fqOMMNh4cImkGIhj8+6MqtyluYRLt
	y0bKP9CcaAOAgkFvyKAEZ5LBqnc1Z9VEKH/G2Yp99v7ewwNDP+ICGPnt3hXNK2QB02mABSUfE0J
	u0SzVfurjSIvzJt1cO8kh2igOdwD28uSD67CfZaa5iRigrrQ5eBaHKnp1MxN3qTnSyChTtR6rVF
	lvwsTuN++BP+x6SkaA==
X-Received: by 2002:a17:907:9619:b0:c26:1649:47ad with SMTP id a640c23a62f3a-c46bde828afmr744915666b.35.1793023365041;
        Mon, 26 Oct 2026 07:02:45 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a53bdcdcsm6411466b.53.2026.10.26.07.02.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:02:42 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c498fa2f365so127177966b.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 07:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1Z2y4KOLdJ6nfw4zJQ1h+ylvAiY3MPhpW8RadTu5ZWYzcAMA4ICne3dGyejLb8ZLf5/0Z9+S8SAQ=@vger.kernel.org
X-Received: by 2002:a17:907:6ea5:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c46bde6b2f6mr794454566b.31.1793023362379; Mon, 26 Oct 2026
 07:02:42 -0700 (PDT)
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
 <20261026104056.GH15441@killaraus.ideasonboard.com>
In-Reply-To: <20261026104056.GH15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 15:02:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
X-Gm-Features: AclHuK_QORKnSpnPhJrLo9VkZNodz3Epw-au-jT1DhXUiuoeiO-TMI6o_74xEFM
Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > >>
> > >>> there's no base-commit?  Including any historical patch (from
> > >>> months/years ago), patches with dependencies, etc.
> > >>
> > >> Dependency is something else, but for every other patch:
> > >> 1. For testing/CI: you apply on top of next
> > >> 2. Every other case the maintainer knows where to apply it, because it
> > >> is his HEAD of next-branch.
> > >>
> > >> I am repeating myself, but I really had no single problem of lack of
> > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > >> subsystem, thus maybe I do not understand the actual problem you are
> > >> experiencing.
> > >
> > > When I review patches, I often need to apply them to a tree, mainly to
> > > see the context, but sometimes also to test them. I have encountered
> > > many cases where the patch wouldn't apply on the current for-next branch
> > > of the relevant subsystem. That's often because the patch had
> > > dependencies. When I'm lucky they are listed manually in the cover
> > > letter with a link to a branch, but that's far from being the common
> > > case. I then have to ask the submitter to provide a branch, or enough
> > > information to recreate a branch. Having base information (base-commit,
> > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > time.
> > >
> > > I understand your concern about maintainers cherry-picking and sometimes
> > > introducing issues as a result. In that case I also prefer asking the
> > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > base information for, in my case it helps with the review process.
> >
> > That's valid and for 95% (guessing the number...) of cases will be
> > solved by having linux-next as a base, thus requiring the base
> > information is redundant. It's just linux-next.
> >
> > When patchset does NOT apply on linux-next or maintainer tree is
> > non-obvious, the base should be provided, but that is only "if ->
> > should". I think the proposal here is a bit different.
>
> What's the downside though ? As git can easily provide the base
> information once configured to do so, what's the downside of asking
> contributors to include it ?

My base is usually not in your or anyone else's tree...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
