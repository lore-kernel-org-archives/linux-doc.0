Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255313B584
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 04:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776660758; cv=pass; b=bmakL0c702k5ZrQe311CbRUtb2bbWDPUhY5RI+jx0gB9cQBzLxl3/IKDMHVIsliX2VErQP32CfE67tMnR6WCd7i7BavAbT3hAxVoxshHjk9iMT723WBxxCDvmaOOGk4wHokeyu0KPeH5snpTSWzDLRFpJSXpad/cffoGIPN87yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776660758; c=relaxed/simple;
	bh=5GcZyOTwFG2YfXD/hzXxggS63CFdN4+bqq5LgarFcwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slrDbo3F70FSXeNqE4YuqhphjrHMG/d5eeL+rwbGSCI7C0svan/zY1F8MYPECkJhcGaYsgNIu5kXqxFvjHJ+pzVKZInG8J5RZv+O6VTnIQlMVVHtUSzZPuXKerIOpSFUlIVHjFxXNm8I0Dna6u4RZOMApurcpuulTpRJUiK2kU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB775Eqc; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB775Eqc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1427797f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 21:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776660756; cv=none;
        d=google.com; s=arc-20240605;
        b=aQ7BFpPsPDqQ5ruVNCcsjB8n57OI6Z2fAAc9pLC7gMw7Dq8qszHwyBVLJkquRL3oPC
         GpsEQ7pNgIQ+vf6W51YtIE8pTVsm/npxAriNcOc05Ar6z8KfLAxKs+raUBOjwFgcmwLJ
         x/wAxANqUERDcT+uh6cW2PwdRXmccxs3WxenBP5iAMu78At/WngFX6L6EdkiO/HkgfcH
         uiIHlqHA/dzgOQOEat+YxZBj5GWFvqtP1jVuIqT+65uelA68UuW1XVuF3HmibnZKtPRo
         FFncqtOs4Z/z7ZSMiZdvEOwNttnDQlGmF26f30048bH5IwEplL2YVNi8/ZCjdBidLvDv
         lDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTkXYM3+vM/fkB3bQ583so5PgFgZAXqx93KFOXQCWO0=;
        fh=6cHgLo/umlijSIGcxJlBojs3pwsbi+D63uynGOr7haQ=;
        b=U30WtcLR1c1FizNcUaT+8sK+6SThOM5ZlBkN6gmgDRm4rdU63e9ODDm/6/p+iHKszL
         Q1gRg4v654pUdVyIM2ipc55XWkEV/aNPMmmFgXG245UVZzzMtb9+GayZhm1bIj8k/fuA
         c2MUWG59Dg3XJVVOECSxSHCYa6HavIq8KeW2U/H81y0aJTQQplIZdQQ5XmBpApHG2Wxw
         owN/5edXH7ZnJ6cNJUU0XXUk/CCUi2UwUoqP428Tfx0NDAZ+iGao5X8aMf6l7jO5TJSo
         z70jhKCYgYvA1QQVaKPIEQOyciokx2grxQiirFmJfio7FSSd4A8UcVDr1rt9GCSjnA83
         1woQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776660756; x=1777265556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTkXYM3+vM/fkB3bQ583so5PgFgZAXqx93KFOXQCWO0=;
        b=CB775EqcDV45+OCLYltEDN04q/awu211DbVCdnecHIwI/Lt63sCXGi19FwtY12oVnq
         JVKDtZLY29CVfGTgNoxm+++fFfF99WTCpkmxTHuZoqaiDuuXImwFVoGxKH2PZvD+1PJL
         hY1tBfhAVHqS5rGApnuPOmpjlUJYgBl06P722Jx0TqnWYGebU0ag+D5qhlMT6/HwSD3u
         RE22orHokY+pkmchqICD9rjXZv92SqJnzQ1FZZYmaZ7PeSvSKkyM+USzn59juP79sW1O
         uUuBhh1g4pnYlzjEFMF/968L7jjJRE1QcLbdkVrVHgLK2h9u6coMc0WvGcdSlTsbHji/
         zKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776660756; x=1777265556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TTkXYM3+vM/fkB3bQ583so5PgFgZAXqx93KFOXQCWO0=;
        b=pHtsZj2wSNBVUb9YN9Pfa+G/AcSTJqxY3qoDBOId9stDHtLwAx9smYrMemDdOGJUUs
         7Q1onVFheGaTzSG+lOIMZxBgIjfl5h/YKhrgCznke95nF6xJZvCViCsitAU5URsOBgJO
         Rx8GKjytBL0rTleBJCr1mK41tMJCQy/JzRk8e03lrZaA5gdpajCRYks8TjDwui6YIiqW
         hLdM/XNxRqgts4gUpFkwxLeIR8faNJVGL4v7asMk+oZw1qsy+P7jf6GeGBNMNmKnTObz
         PKwZTWB03TNZCxr5CDFvEw5YXfmrTxkKz9v3AWPFgPMQB9gR4S0k39W2j8jeAoKKDkih
         Ei7g==
X-Forwarded-Encrypted: i=1; AFNElJ9z5IiyJ2eu7wifQCuKQow1EW60raUgPuzW+skF6FwpFBp/bhSC79M7dsZHuI/dfCn6bCH4TulYFAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKH63k6syTwlauah1l6OywCl4yKg7EsOGlsKAHJRPwJm4KEYw
	9znVq2cgUhchcAfKJZzwolgWVHBbxLyMO3SshEHosh0nzIS2cHKch73/+jEkAY+vEsBpn7T5NDd
	bcKVxVutpAH01jpp0xTa0Gu5278/biAs=
X-Gm-Gg: AeBDievGSAYIZecejCPZVoGLQoia1oArr0IOWkp79wsXIhXAePO8P1gu8CI/RJVYD5X
	mZLtqUcWm+0CjfseG+eSF2bDCneWnNu4/HrqGbnuPG5AToAxZPSk0qfehHLQnorKc3ERuw2QyEd
	Prc+/Nmhnvy1vkOkZJYD2/OTVVQw1g9g90WHjQOmEx2ddcPxZIVgtF/pj+EX87KzSQdEv/nGph+
	96TkzhBT2pRCqt1EYTC98XL7uCGgkZHEhWgdB8OO88A9aruoFeQJGsR3urFD+WqFqSLuWNUjp+U
	HpBiLuwAt4iteOek1jme9bsMiiXb2lEnY/TQgi42bIKNkFUltcU=
X-Received: by 2002:a05:6000:1785:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-43fe3dbf4e7mr17847813f8f.20.1776660755454; Sun, 19 Apr 2026
 21:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeNGbNyPxJssnkbO@lucifer>
 <aeOuCH8ydw_yzdXZ@casper.infradead.org> <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
 <aeTTw4gziJigaNbU@lucifer>
In-Reply-To: <aeTTw4gziJigaNbU@lucifer>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 20 Apr 2026 12:52:25 +0800
X-Gm-Features: AQROBzDtqw0sj7vxacea9IIB6u61yKmS3jNiRESpvNHOCSzoOOtvbaVRitY5ACc
Message-ID: <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lorenzo Stoakes <ljs@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=889:17=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sun, Apr 19, 2026 at 10:35:44AM +0200, David Hildenbrand (Arm) wrote:
> > On 4/18/26 18:15, Matthew Wilcox wrote:
> > > On Sat, Apr 18, 2026 at 10:07:22AM +0100, Lorenzo Stoakes wrote:
> > >> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > >>> - Add "Overview" section explaining the slab allocator's role and p=
urpose
> > >>> - Document the three main slab allocator implementations (SLAB, SLU=
B, SLOB)
> > >>
> > >> The fact you're insanely wrong about the current state of slab only =
makes this
> > >> worse.
> > >
> > > This is actually a new low.  We've always had to contend with people
> > > putting up outdated or just wrong information on web pages, and there=
's
> > > little we can do about it.  Witness all the outdated information abou=
t
> > > THP that's based on code that's been deleted for over a decade.
> > >
> > > But now we've got AI trained on all this wrong/ out of date informati=
on,
> > > and, er, "enthusiasts" who are trying to change the correct informati=
on
> > > in the kernel to match what the deluded AI "thinks" should be true.
> > >
> > > Let that sink in.
>
> Ugh ye gawds. My attitude is nip this in the bud early.
>
> I'm very harsh in response to these things for a reason - firstly, it's r=
ude,
> obnoxious + disrespectful, so a negative response is wholly appropriate.
>
> But more importantly, I want to SET A PRECEDENT that if you send this cra=
p
> you'll get a VERY negative response.
>
> Clueless but good faith or bad faith - it's straight up plagiarism and th=
at's
> totally unacceptable.
>
> > >
> >
> > I think we should make it very clear that we don't want doc updates fro=
m someone
> > that is not a renowned expert in that area or wants to become an expert=
 in that
> > area (and already discussed working on the docs with maintainers/expert=
s).
> >
> > Otherwise we'll have this same discussion over and over again.
> >
> > diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
> > index 7aa2a88869083..8c5721001c8bb 100644
> > --- a/Documentation/mm/index.rst
> > +++ b/Documentation/mm/index.rst
> > @@ -7,6 +7,11 @@ of Linux.  If you are looking for advice on simply all=
ocating
> > memory,
> >   see the :ref:`memory_allocation`.  For controlling and tuning guides,
> >   see the :doc:`admin guide <../admin-guide/mm/index>`.
> >
> > +A lot of documentation in this guide is still incomplete. If you are n=
ot
> > +a renowned expert in the specific area, but you want to contribute big=
ger
> > +chunks of documentation, talk to the respective MM experts first. LLM
> > +generated slop from non-experts will be rejected without further comme=
nts.
> > +
> >   .. toctree::
> >      :maxdepth: 1
> >
> >
> >
> > LLMs are just the tip of the iceberg. It will all be developmend-by rev=
iew with
> > inexperienced contributors. And we are only willing to put in the effor=
t to
> > teach contributors if the contributors are not actually worth our time:=
 i.e.,
> > LLM kiddies that will actually stick around and help the subsystem in t=
he long run.
> >
> >
> > The whole doc update stuff is similar to people just grepping for TODOs=
 in the
> > kernel and then using an LLM to produce code they have no idea about.
> >
> > It's the evolution of typo fixes: review load without any benefit.
>
> Agree with all of that!
>
> Let's do that, happy to give tags on a patch for the above :)
>
> >
> > --
> > Cheers,
> >
> > David
> >
>
> Cheers, Lorenzo
Hi Lorenzo Stoakes


I am really sorry for causing trouble for everyone. I would like to
ask which aspect of mine was disrespectful, so that I can be more
careful next time.

If I want to make this kind of change, should I send an [RFC patch] to
ask for everyone's opinion?

Sorry, I really am not very clear about the process.
--=20
Regards,
Nick Huang
