Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0F3DC871
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933408; cv=pass; b=QAOWiFuIiCG5xM8oFYzpruHO8WBYEeiEmy4X066/zvQubXCY1pdnTi3r+HMAUR/vIicYDM3nPwXEQzvnf4BuxAsTu6BoigvrDeUkI1A8eYVqD7aoRctcgxfwrjGQGJawFtQJUgasZwxjLKnInz2iMZt+HfYzfoDpPxAoni0ezy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933408; c=relaxed/simple;
	bh=HkkiURfNnIpTqbnEHqelCe7LpKMrp8wbJa8JkOVeCOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWa3NySr8JBLcWBu52DpQ+WegUIUYCGnb1DlcTLv7vaTS+eKchzkBaFBeF/lNSRbPq6GGbPiDaGL6ruG08rzjly+6EMJwIbCqw1yWIxYi+2V7rLoHW0QH6R4pEouTij5Jj3M8ldKHs+r6ob9coARLuurGT7DkpXANjefY25cNhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izMRfUTQ; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izMRfUTQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso361925e87.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 02:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783933405; cv=none;
        d=google.com; s=arc-20260327;
        b=ocbMs3tZqyLAW1ODAfW7BDLuKt4+kq96xKS3uEL0Ogpj4FzlqzjOF21rEdTA7y682v
         2xuz9rH19ZkYLzsazouGMT/jq0nZUIz3YbxBDBevwcenqT6AXB5CQ11kW0t1mcb30xZj
         qKbc0Tcn+45+o6aiHRmmQAvV/thf1YBb/niZZ7yybbyViyp4Z1QpnVJY2yCelWcyJKeH
         xNoxDoidCMBHrbJpa81fiUQNNDArbAHPltRS8edId/PEra+zffL1gbP2+byU+QrS3EDt
         eEjuvNxltSex8obEAmUUU/OFkRaUPwoBLHn59yfGPGsFTllHRC7XpnDnW8iFPdhHtHw6
         p1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+u5qiteQ/Ek+qbnSNw5opnC9ZpEZd0h6fYUONPqht0Y=;
        fh=Kx93oR1/e7gOP6aNZtKqg+oxfkyEiBvI/710Do6UCNQ=;
        b=CFgT9e79tGRnotCTWknHE+WfLlooLxqrakCWC35VsD3hLT8rVsDyTTf48xoL6+dJPp
         HOuFbspFK0gUsplM+HgqIpc3/9h6Dynn6SYzJjYZ/iEBiIc4KNIKEHwIdwGCNHGd0B/i
         0KxKyYHutPaSC4lckETLm9oR65DXV6UqFfNjoWFg/AmbfQuokGDrZGqYLoqoarMznh2I
         eT0VReNzr9wcSr0UTtKKlxTjPaJS9E3LNu2H2eZVnt8KYVqH0SOcEI02MaBDI4Wg4NiF
         wHpki3rEVNcbNFfeaIeIXn21p2+zu8TAoo6TafaHduIMTWLYydFqoppkaqD7DLXrTDtx
         pWCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783933405; x=1784538205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+u5qiteQ/Ek+qbnSNw5opnC9ZpEZd0h6fYUONPqht0Y=;
        b=izMRfUTQ0qvAOmmz6LlRhKs0a6HTfVMUogPYSqwwUo0Kn812GgptUFLqMpd0ENKYP4
         UoxxKOtTODFYRaWU1YT5sntv7QKzJWWhEONvmk34mAowVcQvhErd2Bn0OaUrEamOHYcS
         /gGzFo8qmTbCaft6mpkUBmeyppl6C0BwJfC1ki45DPVkmCxpAreglsS0iuBUXA2aYS34
         rtWVCQDzzfZphYfHDTMaHhrn8iQUL/YqGEm/92OBul2m3QVzo462RVSDVhn9UEnPiL0h
         ljRPcPABUvh+cO65PdAxRSIH3374jUp6e7ofKz2Q7mMnmQ4ZzB34sKG8pjdz+D34lJJQ
         MF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933405; x=1784538205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+u5qiteQ/Ek+qbnSNw5opnC9ZpEZd0h6fYUONPqht0Y=;
        b=IpAmn43pci61U0RG8/W0vP54ABIYrWMo3ttqMoByl/JrIJyHpyt9XJkjciRBSWhxWI
         yOUkctcCvM8ohZGRHroLQLpn8YGiQbjFoqvVQA7lC31RM2800UUFXckbddg1isrNGDsD
         JgkM3b18JUrQGkhour1tkX6mP81CFIchwjBkDVh/lXgNelwOO2BfHK6chvLJyZxopqYY
         jRVwPUXG8aa7vxNjdQLhWnd0j04hLCGAwg5veqC+zZjcrq4O1mVYh4yuQFhHdx7ETZho
         4ZNvZnS8xxTuUByGEeTqZRtjaUCE/IAbA/+KDKykZQrXw5S8carCs6eV+livhuUj3S84
         Adzw==
X-Forwarded-Encrypted: i=1; AHgh+RpGyX7ljCxNaf/mtl6wfNp6WRopbeX0vVfce6XDBtynhNrDg5Fvte2GZGbE7DTr/4r9Ho07QEnalec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSaxwpws8/kMfV1maaZFzGeXiDsahtyIWoJlArdA/4W8MM2Ih
	Og3IJrNFKb1ueUM4YxwPgdCV7MKJWp2K+rBUbVIeBSeoXuMfj4ceszPJp10c0GsDVqg0rEsKOpB
	8r+a+X1UWdh95qEqV7HgdyJF/OKCW8/E=
X-Gm-Gg: AfdE7ckRjsuQk220+pa2grPldhJSaiuihLgkfJhkNI06MJTybEUfKf8Ch53Xq8E8q8z
	EceCcNRykr95WPWvcxWAxVIjCHsgFSBbXCA5dzNgyc4LHzQJbzU8BXHOgbbjSrTOGdXc3p8e8kp
	lZHgx62Apx2BERS9yduApFxBe/hDLO6EQpjjMWuhFAUOzWIQbosn0wCXcwwGKflyc6u6c6sp55A
	kGNIP1U/VP0KvIzF2loZHKWGQ8aYeo85us2XcucmR7pxd02+FAULkCrwIn7uJbm0Ekm1SQAeiA4
	MKmaMWLujcsOpVt4neqqVmrZlW1eVLqMrlho8BYybKKPZJqwco+LM3s=
X-Received: by 2002:a05:651c:b26:b0:396:8c78:3d53 with SMTP id
 38308e7fff4ca-39caa88fa80mr8986231fa.8.1783933404339; Mon, 13 Jul 2026
 02:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
 <alR4jP1-qlcQNma1@wyuan.org> <CAKspUhLGq_Hz-EM+Jc9ga=ih_0Ui7WzHZt+uKxMvuERsYB93Bg@mail.gmail.com>
In-Reply-To: <CAKspUhLGq_Hz-EM+Jc9ga=ih_0Ui7WzHZt+uKxMvuERsYB93Bg@mail.gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 17:03:12 +0800
X-Gm-Features: AVVi8CfVD19v3n_RsxQHZhlsBpxJIJA5TwkL9uCKdVk4v6ykm2jp4BFVH7eTyIk
Message-ID: <CAKspUhLaCuBOHy9L5DMYBUq4kk_8hgFXfGHzhGXjvS_9iqNFUg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <seakeel@gmail.com>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuchen Tian <cat@malon.dev>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is the inventory I promised, from checktransupdate.py on mainline:

  zh_TW:  51 translated files, all out of date
          221 distinct English commits to catch up with

    process/      14 files
    admin-guide/  15
    arch/         12
    dev-tools/     5
    filesystems/   3
    cpu-freq/      1
    index.rst      1

For calibration I ran the same tool on zh_CN: 178 translated files,
also all out of date, 639 distinct commits behind. So in terms of
drift from the English originals, zh_TW is not in a categorically
different state from zh_CN -- the real gap is coverage (51 vs 178
files), not decay. That makes me more optimistic than the "two years
of stagnation" framing suggests: many zh_TW files are only behind by
a typo fix or two.

(The ~3300 documents with no Chinese translation at all are out of
scope for both locales, so I do not think that is the problem to
solve first.)

One thing I noticed while reading the script: checktransupdate.py
tracks the base commit accurately only when the translation commit
message contains "update to commit HASH" (or "Update the translation
through commit HASH"); otherwise it falls back to guessing from author
dates. Adopting that convention for zh_TW commits from now on would
make the tool's numbers reliable, and it costs nothing. Perhaps that
could be part of the "more reasonable workflow" Weijie mentioned.

My suggestion for the first step is process/ (14 files): it is where
new contributors land first, it is small enough to finish as one
series, and it is where the terminology differences are most visible.
I would fold the pending 8.Conclusion patch into that series and build
the glossary from it.

=E8=91=89=E5=AE=B8=E4=BD=91 <chenyou910331@gmail.com> =E6=96=BC 2026=E5=B9=
=B47=E6=9C=8813=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:35=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Hi Dongliang, Weijie,
>
> Thank you both -- this is more support than I expected, and I am glad
> to do this together.
>
> > Chen-Yu, I would like to serve as co-maintainers to help maintain zh_TW=
.
> > [...]
> > As discussed with Alex before, maybe zh_TW patches can first go to
> > Alex's kernel tree and then push to Jon's tree. I am not sure if you ar=
e
> > familar with the maintainer workflow. If not, this solution may be
> > better for you to learn maintainer workflow.
>
> To be honest: no, I am not familiar with the maintainer workflow yet --
> so far I have only been on the contributor side. So routing zh_TW
> patches through Alex's tree first sounds like the right arrangement to
> me, both for reliability and so that I can learn the workflow properly
> before taking on more. Alex, if you are fine with this, thank you in
> advance.
>
> > I suggest that we could try out the provisional plan for about one or
> > two months (depends), and then make a formal change.
>
> Agreed. A trial period before touching MAINTAINERS is fair -- it lets
> the work speak first. I will send the MAINTAINERS patch when you both
> feel the arrangement has proven itself.
>
> >   * Considering that English documents are changing so rapidly, and eve=
n
> >     simplified Chinese cannot keep up with them immediately. I suggest
> >     we start working on catching up with simplified Chinese right now,
> >     which seems like a good place to begin.
>
> This matches what I had in mind, and it also answers Alex's concern:
> zh_TW should track zh_CN in structure and coverage, and differ only in
> terminology. I will start by running checktransupdate.py over zh_TW to
> get a concrete inventory of what is stale and how far behind we are,
> and share the result here so we can prioritize together.
>
> > re-translation may be more efficient.
>
> Agreed for the badly outdated files -- patching a two-year-old
> translation line by line is likely more work than translating the
> current text afresh. The inventory should tell us which files fall
> into which category.
>
> > https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%A=
E%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
> >
> > Is it comprehensive? I don't know. Perhaps we could add some specific
> > reference tables related to the Linux Kernel on top of it.
>
> As a native speaker: it is a reasonable general reference, but it is
> not kernel-specific, and some entries are dated or not what people
> actually write in Taiwan today. I would rather build the glossary
> bottom-up from the terms that actually appear in the kernel docs
> (=E8=BB=9F=E9=AB=94/=E8=BB=9F=E4=BB=B6, =E4=BB=8B=E9=9D=A2/=E6=8E=A5=E5=
=8F=A3, =E8=A8=98=E6=86=B6=E9=AB=94, =E8=A1=8C=E7=A8=8B, =E6=A0=B8=E5=BF=83=
, =E4=BD=87=E5=88=97, ...), and use the
> wikibooks table only as a cross-check. I will include the glossary as
> part of the first terminology series so it can be reviewed like any
> other patch.
>
> > Perhaps I can handle most of the operation and maintenance tasks of
> > chore, giving Chen-yu more time and concentration to focus on the actua=
l
> > translation work.
>
> That would help a lot, thank you. It also sounds like a natural split:
> you on process and monitoring, me on the translation and the zh_TW
> terminology judgement.
>
> One last thing about the patch that started all this: rather than
> keeping the v2 for 8.Conclusion pending, I would suggest dropping it
> and folding its changes into the terminology series, so the fixes
> land in one consistent batch. Any objection?
>
> Thanks,
> Chen-Yu
>
> Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8813=E6=97=A5=
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:33=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Mon, Jul 13, 2026 at 10:44:12AM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 w=
rote:
> > > Hi Weijie,
> > >
> > > > I suspect that some contributors would run the get_maintainers.pl s=
cript
> > > > or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't kn=
ow
> > > > the current situation. Because I noticed that for both two versions=
,
> > > > Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-y=
u? ;-)
> > >
> > > Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
> > > lists Hu Haowen and the mailing lists for zh_TW files, so Alex and th=
e
> > > zh_CN team were never on cc.
> >
> > Right, let's note this situation down. We'll deal with it after we come
> > up with the final solution.
> >
> > >
> > > > Given that this document has not been maintained for ~2 years and t=
hese
> > > > patches to the terminology actually don't have much significance, i=
t
> > > > might be more appropriate to directly declare the status of Traditi=
onal
> > > > Chinese as "Orphan" provisionally for now, and remove it directly i=
n the
> > > > near future, until Hao Wen's return and opinion. Or maybe, waiting =
for a
> > > > new good soul to take over, which is unpredictable.
> > >
> > > Before it comes to that: I would like to step up and help carry zh_TW
> > > forward. I am a native zh_TW speaker from Taiwan, and I understand
> > > this means staying with it, not a one-off effort.
> >
> > Nice and thanks. Frankly speaking, At the very beginning, I did conside=
r
> > saying that I also wanted to take over, and I wished I could. However,
> > considering that I was certainly not familiar with the traditional
> > Chinese terms used in Taiwan (although I knew some, that was all), I
> > finally chose to be speak more conservatively.
> >
> > > Dongliang, since you kindly offered to help review zh_TW patches:
> > > would you be open to doing this together -- either as co-maintainers,
> > > or with me listed as a reviewer (R:) first if that is a more
> > > reasonable starting point for a newcomer?
> >
> > Since I was the one who shamelessly initiated this discussion, I
> > definitely have the obligation to do something. See below...
> >
> > > > > To avoid scattering our efforts, I suggest we minimize fragmentat=
ion
> > > > > as much as possible. When it comes to technical documentation
> > > > > translation, not literary translation, a straightforward, unadorn=
ed,
> > > > > and free from misunderstandings is the best translation and easy =
to
> > > > > maintain. Let's keep thing simple, unless sth is really necessary=
.
> > >
> > > Alex, I think this concern is fair, and I have no intention of
> > > forking the translation effort. The scope I have in mind is
> > > deliberately narrow: keep zh_TW aligned with zh_CN in structure and
> > > coverage, and localize only where terminology genuinely differs
> > > (e.g. =E8=BB=9F=E9=AB=94 vs =E8=BD=AF=E4=BB=B6, =E4=BB=8B=E9=9D=A2 vs=
 =E6=8E=A5=E5=8F=A3) -- exactly the kind of differences
> > > you mentioned. Plain, accurate technical translation, no literary
> > > rewriting.
> >
> > Exactly, before sending my first email here, I had already thought abou=
t
> > the following approach, what do you think?
> >
> >   * Considering that English documents are changing so rapidly, and eve=
n
> >     simplified Chinese cannot keep up with them immediately. I suggest
> >     we start working on catching up with simplified Chinese right now,
> >     which seems like a good place to begin. (ok... seems exactly what y=
ou said ;-)
> >
> > > Weijie, as a first concrete step I will prepare a terminology series
> > > (rather than one-word-at-a-time patches, as you suggested) covering
> > > the existing process/ documents, and use it to build a small glossary
> > > that future patches and reviews can follow.
> >
> > I used to read this:
> >
> > https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%A=
E%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
> >
> > Is it comprehensive? I don't know. Perhaps we could add some specific
> > reference tables related to the Linux Kernel on top of it.
> >
> > On Mon, Jul 13, 2026 at 11:49:07AM +0800, Dongliang Mu wrote:
> > > Chen-Yu,I would like to serve as co-maintainers to help maintain zh_T=
W. The
> > > script - tools/docs/checktransupdate.py can seamlessly work on zh_TW.=
 This
> > > can help track the missing changes.
> >
> > I would also like to take a job ;-) while my current contributions are
> > not sufficient. And wish soon.
> >
> > > As discussed with Alex before, maybe zh_TW patches can first go to Al=
ex's
> > > kernel tree and then push to Jon's tree. I am not sure if you are fam=
ilar
> > > with the maintainer workflow. If not, this solution may be better for=
 you to
> > > learn maintainer workflow.
> >
> > I suggest that we could try out the provisional plan for about one or
> > two months (depends), and then make a formal change.
> >
> > Before we make a formal change, I will monitor the list (CN & TW), If
> > there is any situation like this patch which is not sent correctly, I
> > will handle it promptly.
> >
> > OK, I consider myself quite familiar with the development process and
> > the maintenance process, mainly from Git (seems more complicated).
> > Perhaps I can handle most of the operation and maintenance tasks of
> > chore, giving Chen-yu more time and concentration to focus on the actua=
l
> > translation work. But this can be further discussed.
> >
> > Thanks,
> > Weijie
