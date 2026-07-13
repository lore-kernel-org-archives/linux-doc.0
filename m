Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369A380FF5
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924537; cv=pass; b=V/FwOYwCLtzxCkxzHhBO2lpd2z0qgUoZwCJ+cij7E24Kp5Vx+7Fvzvpux9cdHLmnHxkhyYKZLZOtcVOFJbDCngcqRXeHMGpXhvsl2PDTwtuhRraeL1MUIc9NwuyGRxjuUeguL5dpDJgpgCyW1kA33oKlH+bFbDhNT34FPsdYrHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924537; c=relaxed/simple;
	bh=fHzZlLQ9n4LYx8lPgZ/4hbxCoowAOTMBA2xPOySCZPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQgyFsnybn2GwRWcXatZ3NWKFdlkIhdS6areq1OXXMhpx4ApZZLVVEFZXwiQmOa76vMuiKFgudkoqw9FHHZg9gnFpGDcF2hjkHu9WFFKgNPsLyoKoWD1hOYPU2s77JJ+T6i6IYHriBOqzroibkWKlXQkfl5yro7JbZRyrr4o5dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9zSR5iU; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9zSR5iU"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso339522e87.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 23:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924534; cv=none;
        d=google.com; s=arc-20260327;
        b=WJ2RqXNTPW5RetrF12Uh21jlhQDj80JucSI5JM0Es//jGsBghqIL9pxxSfcgksQ3Dw
         5ObuV0zO6LmJLgzJs7TTg+yh+IJjNsvcRcWn1PJ2n7OU3WhXO1NUMqehaPdWgblsHkBw
         3kB2CRgxwFsw+bVRjHFB+AyOBdqb679mPsdfjkidN+Iss/PBZE+KBr2OFGowOPDND7JP
         s5HFX/eFvF7k6j25tKdyV2pNSIC2FwH5hMyozTGw64WLS3dgcQF9HnmcxniJ3F5kSq/N
         NWvuRmQvpv9OKGibmqsgN3z1DhPKn+RGO1ijM8nUT+FKL4ZfPgqZl2s/1N4iqDQoM7Nd
         Al8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v9vA1gmeVdsFtcdXmXDDaJ7WtAHjsVCPbymrNsz2Fcc=;
        fh=cfNAKgufMslG7v+JwyfdqlcOWOwb4Nw5GEl9Qh5MmOs=;
        b=bY9W/QXMcUWf7GNGqdMj4ljj4zIK+GSFeUDkgcKT1b14MkdIUywUfLQrjbjTKMC0dh
         2SWclI7E37jOSoj6speHdU9GYA7Pw53s4Grpk3iMt0dVhko9v9x4GaF2GCq4q6oeySvA
         g5ZYoB3FwF0y2SLJ/zdRLZ1nDjSNKFRWn2i6c7jOuJuMNgTaXUa2IlZJQ/+j65S/CxSl
         wzIE0Quk3fmY7iIt01dTneCCTLCiSSWJZT7m6UwpaZ6vvygILD2RZksKY0lhvOa77JWp
         VAACu0CRXvYu/3Ou7Cwh0EKFvsqmhK/fGDdtxJICqLTn8ObkH0SNxrPp8bIi9S59QjrT
         uNfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783924534; x=1784529334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v9vA1gmeVdsFtcdXmXDDaJ7WtAHjsVCPbymrNsz2Fcc=;
        b=a9zSR5iULMZ5l35HBo9M5JCGL1Onpn2jcwTOC5qDCXRbCHEKbzOL1D4WKAgx+xfeYz
         6XZcZfKUhU/bR/qODTRPWa8SHyZIdMqpuaPiQ+C2QJXOafT8oQueioUJy06aa1I1rUb8
         9pTDXVmb6ub50upe6+dpYPF8ODkpA7n79sbqgp5Subpar2eWFQJZwL9fHmV7spakbjRR
         DzXK3E8zXPEkPyLD71/xVtqCCCBhA9cyjD4GqALXmdaa38fsL8T0s8Ijk3F5vgigVaK8
         y3NCcyJXZOrMvbVp9fyZSdgHuVXSpscfUajTx8yvlHG2sPU1bjfH1In7SA1JJGWuvoVM
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924534; x=1784529334;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9vA1gmeVdsFtcdXmXDDaJ7WtAHjsVCPbymrNsz2Fcc=;
        b=n3KsjFsUoNuvKHYpqk77M/crJSBzNvqTupMRwn6qplOPXswrUS8mXZw6X8MuR5RNj0
         J7vJAfZMmE3QNX5KXlH/qR0IdtE0VqIxKxalLEzxcZzz0bAfqV8RFXXN+awaimZeqgFu
         6FHD0dfmjd0c2UVSgV4WxgoP7ymf3wMXQA3FOdKy3l1a8GKVYuNR9dS/X15MtMyDdTUF
         +qyYdZMP7Xi4JP2V/XSnAD9v0cFJNINTkn6GSrFdaPwy5FkXObJni/iDYXr+ErkRwc6F
         cOyF88a2MiUUE09b6SVJwSw9BkPu8Xm+4oB4Os6Bf1YyxmeRkHXdBapdMgvmj5pE5xAG
         +w6w==
X-Forwarded-Encrypted: i=1; AHgh+RoNT5c7Yji9MaXTk8k9kJRoNw+76ZwgN3ZSArDmZGArBaT8KItEcE8/2wB37kWIgK1ugd9Hr3UL4dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuCdfpeLoBhOS9toynv4VLpRom+1x+8wW5GY4+21Wi6a7+Lf6x
	2TM4G99KH47NWn70htmCRoqJupXbo+AGCbD//mxsSmxMJVeIpDn4RBf8hjGP6A96kDnPMsW/fmb
	cFK8eiDGgHT+Jso4X1u4pLjRsizR2vvo=
X-Gm-Gg: AfdE7clXS62NZn2C/Y3uF2kvvoTD9K8VV2gICpGs04dsePdINZnhQ7BWWEeXnfq1reY
	YijiD7tYnHJI+U3ZyFuMYiXkMhViALCpmibegfPZE2E+V8xi6zBJqppYlmNSaZSvpoy6lrkW1mi
	2nc+ImMch0HFwUBuVje0iaP6IhbTbAYFPIQjyo8AnZhllDGy4KaIpA4L77FkoOrryumtj46j9vu
	gureIIkF52ZZl8KCVEDgeVaSYmCd+b8tNh4q9d/bQF8xTdBUCs+jsgSaGZkhY2mcsDFOR5EvaDd
	N0YjwN+XiGUUhk7+1SzyZ0bJdqKERekGjqJn6MO0bqa30sU1n9/6rOw=
X-Received: by 2002:a05:651c:2212:b0:38d:fae9:9aa2 with SMTP id
 38308e7fff4ca-39caa136eedmr10911491fa.1.1783924533817; Sun, 12 Jul 2026
 23:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
 <alR4jP1-qlcQNma1@wyuan.org>
In-Reply-To: <alR4jP1-qlcQNma1@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Mon, 13 Jul 2026 14:35:22 +0800
X-Gm-Features: AVVi8CfbxRhwTCdQlYf9k-Z107D6fD9cUoepGTdr-l0ICmHIr_KIz1aEVhogUWc
Message-ID: <CAKspUhLGq_Hz-EM+Jc9ga=ih_0Ui7WzHZt+uKxMvuERsYB93Bg@mail.gmail.com>
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

Hi Dongliang, Weijie,

Thank you both -- this is more support than I expected, and I am glad
to do this together.

> Chen-Yu, I would like to serve as co-maintainers to help maintain zh_TW.
> [...]
> As discussed with Alex before, maybe zh_TW patches can first go to
> Alex's kernel tree and then push to Jon's tree. I am not sure if you are
> familar with the maintainer workflow. If not, this solution may be
> better for you to learn maintainer workflow.

To be honest: no, I am not familiar with the maintainer workflow yet --
so far I have only been on the contributor side. So routing zh_TW
patches through Alex's tree first sounds like the right arrangement to
me, both for reliability and so that I can learn the workflow properly
before taking on more. Alex, if you are fine with this, thank you in
advance.

> I suggest that we could try out the provisional plan for about one or
> two months (depends), and then make a formal change.

Agreed. A trial period before touching MAINTAINERS is fair -- it lets
the work speak first. I will send the MAINTAINERS patch when you both
feel the arrangement has proven itself.

>   * Considering that English documents are changing so rapidly, and even
>     simplified Chinese cannot keep up with them immediately. I suggest
>     we start working on catching up with simplified Chinese right now,
>     which seems like a good place to begin.

This matches what I had in mind, and it also answers Alex's concern:
zh_TW should track zh_CN in structure and coverage, and differ only in
terminology. I will start by running checktransupdate.py over zh_TW to
get a concrete inventory of what is stale and how far behind we are,
and share the result here so we can prioritize together.

> re-translation may be more efficient.

Agreed for the badly outdated files -- patching a two-year-old
translation line by line is likely more work than translating the
current text afresh. The inventory should tell us which files fall
into which category.

> https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%=
A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
>
> Is it comprehensive? I don't know. Perhaps we could add some specific
> reference tables related to the Linux Kernel on top of it.

As a native speaker: it is a reasonable general reference, but it is
not kernel-specific, and some entries are dated or not what people
actually write in Taiwan today. I would rather build the glossary
bottom-up from the terms that actually appear in the kernel docs
(=E8=BB=9F=E9=AB=94/=E8=BB=9F=E4=BB=B6, =E4=BB=8B=E9=9D=A2/=E6=8E=A5=E5=8F=
=A3, =E8=A8=98=E6=86=B6=E9=AB=94, =E8=A1=8C=E7=A8=8B, =E6=A0=B8=E5=BF=83, =
=E4=BD=87=E5=88=97, ...), and use the
wikibooks table only as a cross-check. I will include the glossary as
part of the first terminology series so it can be reviewed like any
other patch.

> Perhaps I can handle most of the operation and maintenance tasks of
> chore, giving Chen-yu more time and concentration to focus on the actual
> translation work.

That would help a lot, thank you. It also sounds like a natural split:
you on process and monitoring, me on the translation and the zh_TW
terminology judgement.

One last thing about the patch that started all this: rather than
keeping the v2 for 8.Conclusion pending, I would suggest dropping it
and folding its changes into the terminology series, so the fixes
land in one consistent batch. Any objection?

Thanks,
Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 13, 2026 at 10:44:12AM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > Hi Weijie,
> >
> > > I suspect that some contributors would run the get_maintainers.pl scr=
ipt
> > > or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
> > > the current situation. Because I noticed that for both two versions,
> > > Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu?=
 ;-)
> >
> > Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
> > lists Hu Haowen and the mailing lists for zh_TW files, so Alex and the
> > zh_CN team were never on cc.
>
> Right, let's note this situation down. We'll deal with it after we come
> up with the final solution.
>
> >
> > > Given that this document has not been maintained for ~2 years and the=
se
> > > patches to the terminology actually don't have much significance, it
> > > might be more appropriate to directly declare the status of Tradition=
al
> > > Chinese as "Orphan" provisionally for now, and remove it directly in =
the
> > > near future, until Hao Wen's return and opinion. Or maybe, waiting fo=
r a
> > > new good soul to take over, which is unpredictable.
> >
> > Before it comes to that: I would like to step up and help carry zh_TW
> > forward. I am a native zh_TW speaker from Taiwan, and I understand
> > this means staying with it, not a one-off effort.
>
> Nice and thanks. Frankly speaking, At the very beginning, I did consider
> saying that I also wanted to take over, and I wished I could. However,
> considering that I was certainly not familiar with the traditional
> Chinese terms used in Taiwan (although I knew some, that was all), I
> finally chose to be speak more conservatively.
>
> > Dongliang, since you kindly offered to help review zh_TW patches:
> > would you be open to doing this together -- either as co-maintainers,
> > or with me listed as a reviewer (R:) first if that is a more
> > reasonable starting point for a newcomer?
>
> Since I was the one who shamelessly initiated this discussion, I
> definitely have the obligation to do something. See below...
>
> > > > To avoid scattering our efforts, I suggest we minimize fragmentatio=
n
> > > > as much as possible. When it comes to technical documentation
> > > > translation, not literary translation, a straightforward, unadorned=
,
> > > > and free from misunderstandings is the best translation and easy to
> > > > maintain. Let's keep thing simple, unless sth is really necessary.
> >
> > Alex, I think this concern is fair, and I have no intention of
> > forking the translation effort. The scope I have in mind is
> > deliberately narrow: keep zh_TW aligned with zh_CN in structure and
> > coverage, and localize only where terminology genuinely differs
> > (e.g. =E8=BB=9F=E9=AB=94 vs =E8=BD=AF=E4=BB=B6, =E4=BB=8B=E9=9D=A2 vs =
=E6=8E=A5=E5=8F=A3) -- exactly the kind of differences
> > you mentioned. Plain, accurate technical translation, no literary
> > rewriting.
>
> Exactly, before sending my first email here, I had already thought about
> the following approach, what do you think?
>
>   * Considering that English documents are changing so rapidly, and even
>     simplified Chinese cannot keep up with them immediately. I suggest
>     we start working on catching up with simplified Chinese right now,
>     which seems like a good place to begin. (ok... seems exactly what you=
 said ;-)
>
> > Weijie, as a first concrete step I will prepare a terminology series
> > (rather than one-word-at-a-time patches, as you suggested) covering
> > the existing process/ documents, and use it to build a small glossary
> > that future patches and reviews can follow.
>
> I used to read this:
>
> https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8%AE%=
A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
>
> Is it comprehensive? I don't know. Perhaps we could add some specific
> reference tables related to the Linux Kernel on top of it.
>
> On Mon, Jul 13, 2026 at 11:49:07AM +0800, Dongliang Mu wrote:
> > Chen-Yu,I would like to serve as co-maintainers to help maintain zh_TW.=
 The
> > script - tools/docs/checktransupdate.py can seamlessly work on zh_TW. T=
his
> > can help track the missing changes.
>
> I would also like to take a job ;-) while my current contributions are
> not sufficient. And wish soon.
>
> > As discussed with Alex before, maybe zh_TW patches can first go to Alex=
's
> > kernel tree and then push to Jon's tree. I am not sure if you are famil=
ar
> > with the maintainer workflow. If not, this solution may be better for y=
ou to
> > learn maintainer workflow.
>
> I suggest that we could try out the provisional plan for about one or
> two months (depends), and then make a formal change.
>
> Before we make a formal change, I will monitor the list (CN & TW), If
> there is any situation like this patch which is not sent correctly, I
> will handle it promptly.
>
> OK, I consider myself quite familiar with the development process and
> the maintenance process, mainly from Git (seems more complicated).
> Perhaps I can handle most of the operation and maintenance tasks of
> chore, giving Chen-yu more time and concentration to focus on the actual
> translation work. But this can be further discussed.
>
> Thanks,
> Weijie
