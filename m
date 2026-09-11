Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922C3EC699
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 08:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116656; cv=pass; b=ft6ju2ehJRq2ufWGexysJmr0yww5oQVLJT50xvTStARvkv9uhfKlEoOIyfcqWlNSJDW7Egpzg0n2N+cMFnFywXQUL/e+xQq4nsc4BgunpKAcMMqomdkJ84PioWtbUoN7FMnxrZvaNSI7Bj12zt8WFy6swDu0GGhgIcPC+nCkXd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116656; c=relaxed/simple;
	bh=5Co0mc8pqJAcw7pBhUadOF2tFVCeKbvaCt6CgmDXcj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdoneoKVCwJPTi0zGJ3cn8ZayO/k1nqj8oCMpgfbQGXpr5prChi53R7bVfzpLdnhuSiwv+BJy9B/WpOy/8lcKgTna2mczI+js0mtnVb40kW8mthYScM2QlHgRqI0oUthHUdTQFrMSpw+An7TtahxyYM72MwVb2UEZgxh50PxUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oR0GoeBI; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oR0GoeBI"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b31bf4so109396e87.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 01:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789116652; cv=none;
        d=google.com; s=arc-20260327;
        b=UZ/c+QEUHR2QB9mwrSQMJ935JQkVkO81Bvi6sID6hIO6ePN7woBPXslZWWdYX5dlcQ
         sX/SEjaZCcU8XfL3PncmCLE1sYPHMg+lTG9MiM9xTU6mkfAFpMLzuhYuz+/hbT/w/nMD
         Zdl+lS47miKErYDPpsa0WsgCalG2oAXevdEmmhKuazHsBAj/0kcTlqzwX6Nd8Act4uV8
         1SILUhwenuSJpUWS2WSEia664KT0tNZVbzGcYB32cl0iyTdusCHGgphksvp58ACTI2uR
         WRZSHWvRHRfKmN3UT4YnWM7O+Nbej9bIYnr77vO1tbswgL6pBPHK8eDbzt4Yq7YzeKSs
         /acA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        fh=mvmjMAuP1FhU4tIUYtFRDW21jujos17BWqLsIdNSj1Y=;
        b=EzR1iA2yvp0nlcbtsO/fhmC+eLKCnChsZW0iyJTzbImPEE2Lddd80j0ivcZqfe/EED
         g4XB+LL8ojdS78FbJvOhsTErsD4WpS3NFKU8U7SYr/Z3LMpwqeQGXtvgfkKYK5E31tFl
         S9vt3EdLMvmMrtt9K57grCSOBu7jZiB3DpJYOMHokX4tSibcd2aQIF48JNLNAEOQi8Uj
         YhDvxzC/qxMWjw+XZslz/cC1lh7BKwQD6/RoTwgfaITJenDji/u/XvGhighkQaI0phrM
         UmjFV1m4O8g7XOy7S291yEMeybVSScJdgmCRVvF/glKVPSviE64nlr0LbGGDeBNsMkdz
         25bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116652; x=1789721452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        b=oR0GoeBILBiusB9vNTYiihi8YSp6hlheuaai2T5x1HV4VjrHkLvvHvuUD9M9dw//Zf
         JGzAtWvGQXDjqmFrDmQ5vbgNueYjqApC62nGQOhydOEfm8/gJYxp+FsvJp4fhV09mkT4
         oljgkm27WVJbqccJs/GThoQ38i/QJcVgp6Z7b9BVVrqnMtZHp7gFRZ7NTn2aLsPliqkT
         hUnwCoEas+RWt5Q9SMLjKCSEfzeONWXjQ5CJeP6kefk2IKzo6DregWpP5lnUqbZYxX5D
         AGiyokQiNIcfJ06C/JJ9AFAKYr7WK1EE9WScFFEiqVTm4rXtRW4upaKBuh0dm0g0y1c1
         6uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116652; x=1789721452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEKCzgm8D5thJIL5vXau62YnV8Oh/fBHGK8+Drqv/OY=;
        b=ReTj6OhFH5Zhu3+rZkZaLJVpyV6kzXqgnRPF3/8N7MLS4+xT9xsMMM/biPEqq1V09r
         gN5wy/HHj6pOHPWuVC0sZMWLqJQLiRmmoWZlY+1NMhtwBs8tnIrqfbzF4PF2Gb5spxf7
         p6BJ/qlaUxwkwVIsmv3aClPlz/kCxMyE/LGHAkXSNo/Jm9m8h1gvWYVRKTwNhBZzhbWg
         jSJYs77XZbTxTLLxUxznuv0/nh8To55FEDIhm692Tho5UllCqq+ZG0Meyi1m5Nrd6iQH
         RMMokn1snUxiYNYzXvppFuUohij6Jl52Y+nWVmCHZ4oYR0TNTCQOMRkRQTw62a4PCFLq
         xkPA==
X-Forwarded-Encrypted: i=1; AKwUvBxUaOj5UgwoRiDG3FlaMdI7F6QAKvvYX3W96taQtg/xVyAPtR30L/MSci48Tn17VaSByN0Pe1319DE=@vger.kernel.org
X-Gm-Message-State: AFuF++lWbsZzcmQNJ3PsK17D8TYiWN6jfY5w40uNZIY49so0brXcAY1v
	xobK8rI880oX65FNHiLrz11ySHXfnJ43lXtIZc3yNdP7JCTpxbtCoPoMe/8MBYRDzXbb0vqX/jJ
	KO09WAdgTDWRqIBn7G8FuzZhW01dRGTdu+ZkhET0=
X-Gm-Gg: AYBFou0dZgisgvPEmqBwwWCe23mTPl73jJFvGmwd/nzs4zIW0t2HaaKkd8xQZdJ8M/2
	5KQZNIsCDZRO9Hfqy2YO2AFOwn9zmdfQchf891YXMK1763bZox/7iW429iTO+i6jL0oh5aUcDOd
	3Cu4c0ZrzXRNNrf1L4Fzow+rXfAk8Swx8PkKZQjQainhJAUfDkUX3dh5cD6k0KlFdxWsVVqqQSq
	J2BlOpJVeRzt5c30IGGbqYjHYXlEGbbW7BD4MZyEkxsk2QkalF9i1uivLteTggEGXxG1zUgWqhy
	WNMLkAB4FfORlI21DkW4UZnNgHmDLRkNOggyUD40UwZZm3iXtz3OpmbB7h5Xx7vJmBl8h1tpLgB
	lHBnIK3zRXp1KzoHrEC7GZpjCe+9I37gY5rqDZw==
X-Received: by 2002:a05:651c:552:b0:3a1:89cb:22ee with SMTP id
 38308e7fff4ca-3a5a4c36f4amr3528721fa.0.1789116651880; Fri, 11 Sep 2026
 01:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
 <20260817-apply-patches-tw-v1-1-c182c1c425ba@wyuan.org> <CAKspUh+bMqOYuV=uTRr35wt-xWd97YR=dfDQGoAvF5MjujOZEg@mail.gmail.com>
 <aqKgJh6MfOTS0KtQ@wyuan.org>
In-Reply-To: <aqKgJh6MfOTS0KtQ@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 11 Sep 2026 16:50:39 +0800
X-Gm-Features: AcwNN1Vkxcbq7lUgv-VJzlAv8KCmsqo3_Sq2rhSFwAIXadU0HmlcpXd3LRQ2dNE
Message-ID: <CAKspUhK+60mzSnh+_u_+8_P99LG7LkDp1xp1_feSgd0_ax5s1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_TW: add process/applying-patches Traditional
 Chinese translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 08:18:46PM +0800, Weijie Yuan wrote:
> > 5. Missing .. _tw_applying_patches: label
>
> This kind of top-level label is not recommended/allowed right now ;-)

You are right, and I checked: doc-guide/sphinx.rst says cross-references
between documents need no special syntax, just the path. Withdrawn --
sorry for sending you the wrong way.

Reading that section also makes my point 6 land differently. The same
text says:

  For most use cases, the former is preferred, as it is cleaner and more
  suited for people reading the source files.  If you come across a
  :doc: usage that isn't adding any value, please feel free to convert
  it to just the document path.

So the two files in 2/2 should converge on README.rst's bare-path form
rather than howto.rst's :doc:, which is the opposite of what I suggested.

> It's kind of weird that this series cannot be applied cleanly with
> Linus' current master tip commit 50d05c7c76c9
>
> Did I did something stupid? Confused..

Nothing stupid -- I hit the same thing trying to apply your series for
review. Your base includes my process/ series, which Alex picked up on
18 August but which has not reached Linus yet, so process/index.rst
differs between the two trees. It applies on Alex's docs-next.

> However, since adding new translations is not our current main goal, I
> will put this series on the to-do list for now.

Makes sense -- it will apply cleanly once Alex's pull request lands, so
there is little to do until then.

> > Would you send that glossary change yourself once v3 lands?
>
> I'd like to do that. If you have time, you can do it in person as well.
> ;-)

If possible, please make the changes while you're at it; I need to
prepare the subsequent patch series.

Thanks,
Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=A5=E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Aug 21, 2026 at 11:54:02PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > Thanks for taking this on -- and for picking a document that actually
> > matters rather than an easy one. A few things below; the first three
> > produce real breakage, the rest are suggestions.
> >
> > ## Must fix
> >
> > 1. Section levels are flattened (applying-patches.rst:12)
> >
> > The English original uses ++++ for the document title (level 1) and
> > =3D=3D=3D=3D for each section (level 2). The translation uses =3D=3D=3D=
=3D for both, so
> > the file ends up with eleven parallel h1 headings and no document title=
.
> > zh_TW/process/code-of-conduct.rst:12 keeps the ++++ form; the same here
> > would fix it.
> >
> > 2. The bold marker at :233 will not render
> >
> >     **=E4=B8=8D=E8=83=BD**=E5=A5=97=E7=94=A8
> >
> > docutils requires the closing strong marker to be followed by
> > whitespace or punctuation; a CJK character does not count. As written
> > this emits "Inline strong start-string without end-string" and prints
> > the asterisks literally. The existing practice in the tree is to escape
> > with a backslash -- see zh_CN/doc-guide/parse-headers.rst.
> >
> > I checked the other **...**, ``...`` and *...* in the file; this is the
> > only instance that trips the rule (=EF=BC=88**fuzz**=EF=BC=89 and [**y*=
*]es are both
> > fine).
> >
> > 3. index.rst: wrong section, and the TODO entry is still there
> >
> > The entry was added to =E3=80=8C=E5=85=B6=E4=BB=96=E6=9D=90=E6=96=99=E3=
=80=8D at :123, but the English original
> > lists applying-patches under tools and technical guides
> > (Documentation/process/index.rst:46, after email-clients). More
> > importantly, the =E3=80=8C* applying-patches=E3=80=8D TODOList item at =
:55 is still
> > present, so the document is listed as both translated and not
> > translated.
> >
> > Moving it into the toctree at :46-49 after email-clients and dropping
> > :55 fixes both.
> >
> > 4. Please drop the :=E8=AD=AF=E8=80=85: block
> >
> >     +:=E8=AD=AF=E8=80=85:
> >     +
> >     + Weijie Yuan <wy@wyuan.org>
> >
> > We are in the middle of removing exactly these blocks from the zh_TW
> > tree [1] -- adding a new one now would just mean removing it again.
> >
> > [1] https://lore.kernel.org/linux-doc/20260819145808.291567-1-chenyou91=
0331@gmail.com/
>
> Sure!
>
> Points above copied. My negligence. Will check again.
>
> > ## Suggestions
> >
> > 5. Missing .. _tw_applying_patches: label
> >
> > Every other .rst under zh_TW/process/ carries a .. _tw_*: label, and
> > the English original has .. _applying_patches:. Adding it would let
> > 2/2 use :ref: in howto.rst, matching the eight neighbouring entries in
> > that list instead of standing out as a :doc:.
>
> This kind of top-level label is not recommended/allowed right now ;-)
>
> >
> > 6. Comment alignment at :340
> >
> > One tab puts the comment at column 40; the surrounding lines are at 48,
> > and the English original uses two tabs.
>
> Got it.
>
> > ## Terminology
> >
> > The significant decision here is patch -> =E4=BF=AE=E8=A3=9C=E7=A8=8B=
=E5=BC=8F, used 98 times. I
> > think the direction is right -- =E4=BF=AE=E8=A3=9C=E7=A8=8B=E5=BC=8F is=
 the standard Taiwanese
> > rendering -- but it needs to be handled explicitly, because the
> > existing zh_TW tree has 630 instances of =E8=A3=9C=E4=B8=81, including =
in the two
> > files 2/2 touches. Right now the two terms would sit on either side of
> > the same cross-reference.
> >
> > Could you:
> >
> >   - add patch -> =E4=BF=AE=E8=A3=9C=E7=A8=8B=E5=BC=8F / =E8=A1=A5=E4=B8=
=81 to glossary.rst, and
> >   - say in the commit message that this is a deliberate localisation
>
> Yes, makes sense. I'll do both.
>
> > Migrating the existing 630 instances is a separate question and I do
> > not think it should ride along with this series; I would rather discuss
> > it on its own once this lands.
> >
> > A few smaller ones, measured against what the tree already uses:
> >
> >   :192  =E6=8C=87=E4=BB=A4=E7=A8=BF      -> =E8=85=B3=E6=9C=AC      (17=
 files use =E8=85=B3=E6=9C=AC; =E6=8C=87=E4=BB=A4=E7=A8=BF is not
> >                                   used in Taiwan)
>
> Hem, I don't know and use =E6=8C=87=E4=BB=A4=E7=A8=BF either. So will che=
ck later.
>
> >   :165  =E9=83=B5=E4=BB=B6=E7=94=A8=E6=88=B6=E7=AB=AF  -> =E9=83=B5=E4=
=BB=B6=E5=AE=A2=E6=88=B6=E7=AB=AF (8 files, including email-clients.rst)
> >   :228  =E5=9B=9E=E6=AD=B8        -> =E8=BF=B4=E6=AD=B8      (regressio=
n; 10 files use =E8=BF=B4=E6=AD=B8, 4 use
> >   :259                            =E5=9B=9E=E6=AD=B8 -- =E8=BF=B4=E6=AD=
=B8=E6=B8=AC=E8=A9=A6 is the usual form)
>
> Copied.
>
> >   :365
> >
> > On the other side: =E4=B8=AD=E7=B9=BC=E8=B3=87=E6=96=99, =E6=97=97=E6=
=A8=99, =E6=A8=A1=E7=B3=8A=E6=AF=94=E5=B0=8D, =E7=99=BC=E8=A1=8C=E5=80=99=
=E9=81=B8=E7=89=88, =E7=95=B6=E6=A9=9F,
> > =E6=AD=A3=E8=A6=8F=E8=A1=A8=E7=A4=BA=E5=BC=8F are all good Taiwanese re=
nderings. Would you mind adding
> > those to the glossary too while you are there? It would save the next
> > translation from having to guess.
>
> Yes!
>
> > ## On the CJK/ASCII spacing
> >
> > This file puts a space between CJK and Latin throughout, which is the
> > opposite of what the v3 glossary currently says. That is on me: I wrote
> > that entry before you raised the question, and we never actually
> > settled it.
> >
> > Since we both prefer spaces, changing the glossary is the right fix
> > rather than asking you to strip 218 of them. Please leave this file as
> > it is.
> >
> > Would you send that glossary change yourself once v3 lands? You are the
>
>
> > one who spotted the problem, and you are a maintainer here, so it seems
> > more natural coming from you than from me correcting my own entry. What
> > I had in mind:
> >
> >   - new translations: a space between CJK and Latin/digits
> >   - existing files: left alone, no tree-wide normalisation
>
> I'd like to do that. If you have time, you can do it in person as well.
> ;-)
>
> > The second half matters -- normalising the 2581 existing instances
> > would be exactly the kind of churn Jon objected to in the MAINTAINERS
> > thread.
>
> Yes.
>
>
> It's kind of weird that this series cannot be applied cleanly with
> Linus' current master tip commit 50d05c7c76c9 (Merge tag
> 'landlock-7.3-rc3' of
> git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux)
>
> Did I did something stupid? Confused.. But I'll figure it out.
>
> However, since adding new translations is not our current main goal, I
> will put this series on the to-do list for now.
>
> Thanks for your careful review!
