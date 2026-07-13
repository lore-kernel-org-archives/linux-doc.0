Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BE2D46B3
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972090; cv=pass; b=fa7x+Ab0F21NgXmBCRMU+vUo6dlA/eQETC/N77ugea5bqpC6s9VLCpohf8Smy1C/qCyOj4cEKXjVqWuGek82n5oFTNfs5YGhpvnIel2MhLbGbVd7oJkx2NIjts2RzabkuzKnhe/f4/jlUJINdHRpMcBNJrnZ6QyxG+jLaNBuhVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972090; c=relaxed/simple;
	bh=TYKOjOSQnzXnfJuJYS0TjXS1YlxMwppXHC7YgGwRgXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEDwk7ZtuVXDxcz8792bAjavVW1tTk/ATm3xhX0FsR7z8mLw6+NIDNb1OY5vZNDgQ1ewqvUdVq7hwA2uSjfhuqfO8TxBRIjwO7pS/zq4uL7edOD2AdB9fUSMu6uxORoL2M8TsDT7AYW3Bgal4mWoC+2PhQDLMNsQgWEEPPMBXgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGdPHYg3; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGdPHYg3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aebe49b227so813301e87.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 12:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783972087; cv=none;
        d=google.com; s=arc-20260327;
        b=O5GXu82NmyLyZfm26ogwY0gVcoLo2O8eJ0caF/LvqdDp56RR8AggPtVjS4r/iIonBo
         Rg5egTeZSRJJA+UsngIp3zffsa97tY/P99T+aeh403ww8SI/NhjxgmlFRhsMflHS15Zc
         bU0nwgvkc/PDNbjaPWlMjEQCRTjQvMRW989qWS/4Gv/Gc5Ne86gTHrjS5ZkuoSJcF9wK
         CYy9JxY0RrIQXwMTQqq4xCYk1XH9Trw1Kd6ASKsMlnbQgPyS4M6OOhFp/AwC5kZKIUvI
         D2N/W/1Y6lbFpJIHbHMvONaFDO2O4fSYasifCj9HM0fpvTJ6XyS1UQbmm7JApi1p82ZK
         CTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LjbhRtdUUlClLxdBqpvJ5+qUfyxFQE2xBKcQKGWszm4=;
        fh=5TmB9LgN5RKGajTsfhM1kPfGNbVCj4CAWaI7/7OWMeM=;
        b=SG/Jlnohans5LL4q8qgzoKkv2fE4abPx8ySTji0LQkYaxUfL/eY1qBLIjih9YcVd7b
         kkSKZE1SL3ncztLnGf2qepz/NjVn6mCr5F+jUMvjtA02qH/Xgf5WgqTkc+qudqZdkpno
         2gMIVphkTDelpSXL0qCg1bo4KI+iLGKgMjG+s8afq22nlHTTZSI88VjjarNsZs4QSfOS
         H7jHBH7TP2Q92IgpQveiKQMkRQe7IP8Gr2OV3R7OtBcY40jTMeGP69sQPgt+kQERuCCZ
         kSTyQYhkVDwV39J8IDMstD87yYBY+LvD49ifh7n29FbgQZTQna79XrdpUIB5Q2wJBgVm
         aB2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783972087; x=1784576887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjbhRtdUUlClLxdBqpvJ5+qUfyxFQE2xBKcQKGWszm4=;
        b=SGdPHYg3G+4vWCVi7x4qeZvMJPZgsIRb9xxBRdAeSyCCr3okqJDsc7gtSj7dAxS5my
         bTor/Tt2WP/6stXil49DXrGU52JFs5VVTYxwCR5OFuw2qt6maxZv0/8seRhatmhP8d1F
         mNoqw0zTmFKSZimobiPS+ef7mmC3CynK/509s88gB1GdOLyKjq3l8isT2Y+ZgshfBN8U
         +KVd4UTvsIH1ffQo6cF1ZRE2F6jfub5HIQSq6QuTgfvb4Q+UNDgqJaQoolN0XP2m0T56
         XD3xYrPwG9GCOdv6ZEYBPI6QbfeZNM1pRHSgvOmddBLInhBLUg2UT4QI/FzcOECmOj+x
         ObzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783972087; x=1784576887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjbhRtdUUlClLxdBqpvJ5+qUfyxFQE2xBKcQKGWszm4=;
        b=rmWZ6XnxpMBomGcNFF2nEf41mBpNSIXIzO6OKMwV7IIgQtfDbj3LD5BE1vBFsfQK8j
         cQN6PWGZlLnCH/zia7CTt2fvNekglz+yE/1k6fL1E3RwxE7P4mW4HUrY+gTFBdOhjl8w
         Ea/KXIFQuZnyXe+sKHs4kWSRHdhtzdIOFVYuVb9fzL+9cZwYOs5TqDuh7zKe27P6ackO
         KkzfMeL6AV9dns1Q1kVuV7VtStIXTE0rLLd/BFb4tTyAdQeA+n7oKCjIjilaBA3UKnhW
         sHpw+VsMFFIHs8emmcnoLCqYmBCQJSyZiAxmy7GPfcQt2tzOJwkz1S0URMbEF536YP4D
         4AwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl4d0q9InvngvTxRFKLPR/ZXq9pBoGREKFkAHrVdeS0ZMVUtDsiUt+xaYafm8GTesxgEEiZdF37po=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCNfJU2w6oio7ooSY/L0lP9n/0r109h0pgHWNQiPIfyb9RZ429
	yzIvVkcwUIcfCTSKI8NV31OOPjC4sCWfpiAlixYhkcIg7d5D8Vl7nvr8l5SLD3OwCIKW5v1LmF9
	ZhQRQ20vi47EptpfUzzSFGuJPZfHexjs=
X-Gm-Gg: AfdE7cm+Qn9abdt1kpLTvTw0qhYmgcdQAPFQpc1bcCT1SzQ32S85bzQzRDL+m//Sm3s
	pBuyD8MXerWoyVd2uXOOdu0hAAdSJ5g+FhhFHq6LNP26I+7h5lJI+9uxduFP4+SMWMdrJOW0AvD
	7mJcyijNDGC7exiNTXqC2mLezKNxFL4MOE2OhhHDid4E9WT82LS5Jp3UYav1vLjw3jjR/n2BMIy
	UiEjFEvCsF2NdthRj5p3k7S4kzU/65vygqXuPJyiSly/eQvZKi2VzAXrC5Sfhnji6UbntgEv7i0
	Jhu3UR/N9TlE5NzvSFHzA+Ptwbp3Om5YLwdW1IxRgvphINFN3XwBA/HlWV6Maizwr42x4w1eG2b
	Z
X-Received: by 2002:a05:651c:19ab:b0:397:e391:c0bc with SMTP id
 38308e7fff4ca-39caa863ccfmr14144221fa.4.1783972086916; Mon, 13 Jul 2026
 12:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn> <alS8lLglyMqJEYZ4@wyuan.org>
In-Reply-To: <alS8lLglyMqJEYZ4@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Tue, 14 Jul 2026 03:47:58 +0800
X-Gm-Features: AVVi8CfgKJErklMEZVr4019m6dBI068ZfHrAo-JJI_ZRTskuJV_ASufkn6Z_kiE
Message-ID: <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
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

> For many files, the missing commits might not be needed as they might
> not affect the translation (such as typos in English).

Right -- which means the real workload is smaller than the raw numbers
suggest. For files where the pending commits turn out to be
English-only fixes, the update can be a trivial baseline bump
(an "update to commit HASH" commit with little or no content change),
so the tool's numbers stay meaningful without inventing work.

> Because this new commit style is developed recently by Yanteng and me,
> many translated documenation does not tranform to the corresponding style=
s.

Good to know the convention is recent -- zh_TW can simply adopt it
from the first series onward.

> For the todo list, you can check Jon's advice for new languages, e.g.,
> Spanish. Search it from LKML

Will do, thanks for the pointer.

> Yes, and that's documented in here,
>
> https://docs.kernel.org/translations/zh_CN/how-to.html
>
> so later zh_TW could consider making one.

Weijie: agreed, a zh_TW how-to (mirroring the zh_CN one, with the
glossary referenced) looks like the natural follow-up once the first
series settles the terminology. Adding it to the list.

So, to keep everything in one place, my understanding of the plan:

- Chen-Yu: terminology series for process/ (14 files), folding in the
  pending 8.Conclusion changes, glossary included; adopt the
  "update to commit HASH" convention from now on
- Chen-Yu: read Jon's advice for new-language efforts (Spanish thread)
- later: a zh_TW how-to document
- Weijie: investigate which documents may not need translation;
  monitor the CN/TW lists during the trial period
- Dongliang: review; patches routed through Alex's tree (pending
  Alex's confirmation)

If I got anything wrong, please correct me -- otherwise I will get
started on the series.

Thanks,
Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:23=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 13, 2026 at 02:35:22PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > Hi Dongliang, Weijie,
> >
> > Thank you both -- this is more support than I expected, and I am glad
> > to do this together.
> >
> > > Chen-Yu, I would like to serve as co-maintainers to help maintain zh_=
TW.
> > > [...]
> > > As discussed with Alex before, maybe zh_TW patches can first go to
> > > Alex's kernel tree and then push to Jon's tree. I am not sure if you =
are
> > > familar with the maintainer workflow. If not, this solution may be
> > > better for you to learn maintainer workflow.
> >
> > To be honest: no, I am not familiar with the maintainer workflow yet --
> > so far I have only been on the contributor side. So routing zh_TW
> > patches through Alex's tree first sounds like the right arrangement to
> > me, both for reliability and so that I can learn the workflow properly
> > before taking on more. Alex, if you are fine with this, thank you in
> > advance.
> >
> > > I suggest that we could try out the provisional plan for about one or
> > > two months (depends), and then make a formal change.
> >
> > Agreed. A trial period before touching MAINTAINERS is fair -- it lets
> > the work speak first. I will send the MAINTAINERS patch when you both
> > feel the arrangement has proven itself.
>
> Yeah, of course, this is not questioning your abilities at all. Winning
> the trust of the community step by step in a gradual manner is
> definitely better. This is something I have once again realized while
> going through the lore archives of how the Git localization was done. By
> reading their historical exchanges (between Junio C Hamano and Jiang
> Xin), we might be able to obtain some practical experience and
> precautions regarding the process. But this is not something that needs
> to be considered at present.
>
> > > https://zh.wikibooks.org/wiki/%E5%A4%A7%E9%99%86%E5%8F%B0%E6%B9%BE%E8=
%AE%A1%E7%AE%97%E6%9C%BA%E6%9C%AF%E8%AF%AD%E5%AF%B9%E7%85%A7%E8%A1%A8
> > >
> > > Is it comprehensive? I don't know. Perhaps we could add some specific
> > > reference tables related to the Linux Kernel on top of it.
> >
> > As a native speaker: it is a reasonable general reference, but it is
> > not kernel-specific, and some entries are dated or not what people
> > actually write in Taiwan today. I would rather build the glossary
> > bottom-up from the terms that actually appear in the kernel docs
> > (=E8=BB=9F=E9=AB=94/=E8=BB=9F=E4=BB=B6, =E4=BB=8B=E9=9D=A2/=E6=8E=A5=E5=
=8F=A3, =E8=A8=98=E6=86=B6=E9=AB=94, =E8=A1=8C=E7=A8=8B, =E6=A0=B8=E5=BF=83=
, =E4=BD=87=E5=88=97, ...), and use the
> > wikibooks table only as a cross-check.
>
> Ah got it, so this is why we need a local to guard a pass ;-)
>
> > I will include the glossary as part of the first terminology series so
> > it can be reviewed like any other patch.
>
> Very much appreciated.
>
> > > Perhaps I can handle most of the operation and maintenance tasks of
> > > chore, giving Chen-yu more time and concentration to focus on the act=
ual
> > > translation work.
> >
> > That would help a lot, thank you. It also sounds like a natural split:
> > you on process and monitoring, me on the translation and the zh_TW
> > terminology judgement.
> >
> > One last thing about the patch that started all this: rather than
> > keeping the v2 for 8.Conclusion pending, I would suggest dropping it
> > and folding its changes into the terminology series, so the fixes
> > land in one consistent batch. Any objection?
>
> I definitely agree. Batching them would be easier to review and
> retrospect, and it's better to track on the list.
>
>
> On Mon, Jul 13, 2026 at 05:03:12PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 wro=
te:
> > Here is the inventory I promised, from checktransupdate.py on mainline:
> >
> >   zh_TW:  51 translated files, all out of date
> >           221 distinct English commits to catch up with
> >
> >     process/      14 files
> >     admin-guide/  15
> >     arch/         12
> >     dev-tools/     5
> >     filesystems/   3
> >     cpu-freq/      1
> >     index.rst      1
> >
> > For calibration I ran the same tool on zh_CN: 178 translated files,
> > also all out of date, 639 distinct commits behind. So in terms of
> > drift from the English originals, zh_TW is not in a categorically
> > different state from zh_CN -- the real gap is coverage (51 vs 178
> > files), not decay.
>
> > That makes me more optimistic than the "two years of stagnation"
> > framing suggests: many zh_TW files are only behind by a typo fix or
> > two.
>
> Then I'm exaggerating, oops.
>
> > (The ~3300 documents with no Chinese translation at all are out of
> > scope for both locales, so I do not think that is the problem to
> > solve first.)
>
> Yes, and I suspect that some of the documents might not actually need to
> be translated? I will conduct some more investigations.
>
> > One thing I noticed while reading the script: checktransupdate.py
> > tracks the base commit accurately only when the translation commit
> > message contains "update to commit HASH" (or "Update the translation
> > through commit HASH"); otherwise it falls back to guessing from author
> > dates. Adopting that convention for zh_TW commits from now on would
> > make the tool's numbers reliable, and it costs nothing. Perhaps that
> > could be part of the "more reasonable workflow" Weijie mentioned.
>
> Yes, and that's documented in here,
>
> https://docs.kernel.org/translations/zh_CN/how-to.html
>
> so later zh_TW could consider making one.
>
> > My suggestion for the first step is process/ (14 files): it is where
> > new contributors land first, it is small enough to finish as one
> > series, and it is where the terminology differences are most visible.
> > I would fold the pending 8.Conclusion patch into that series and build
> > the glossary from it.
>
> Agreed. The significance of the initial stage for newcomers is
> self-evident. Of course, the English documents have undoubtedly been
> constantly revised over time. So for these two Chinese documents, this
> part is of crucial importance. After all, this is where almost everyone
> begins to read, including me. So when I found that there was a Chinese
> translation here, I was very happy ;-)
>
> -------------------------------------------------------------------------=
-
>
> On Mon, Jul 13, 2026 at 05:41:31PM +0800, Dongliang Mu wrote:
> >
> > On 7/13/26 5:03 PM, =E8=91=89=E5=AE=B8=E4=BD=91 wrote:
> > > Here is the inventory I promised, from checktransupdate.py on mainlin=
e:
> > >
> > >    zh_TW:  51 translated files, all out of date
> > >            221 distinct English commits to catch up with
> > >
> > >      process/      14 files
> > >      admin-guide/  15
> > >      arch/         12
> > >      dev-tools/     5
> > >      filesystems/   3
> > >      cpu-freq/      1
> > >      index.rst      1
> > >
> > > For calibration I ran the same tool on zh_CN: 178 translated files,
> > > also all out of date, 639 distinct commits behind. So in terms of
> >
> > For many files, the missing commits might not be needed as they might n=
ot
> > affect the translation (such as typos in English).
> >
> > Because this new commit style is developed recently by Yanteng and me, =
many
> > translated documenation does not tranform to the corresponding styles.
> >
> > > drift from the English originals, zh_TW is not in a categorically
> > > different state from zh_CN -- the real gap is coverage (51 vs 178
> > > files), not decay. That makes me more optimistic than the "two years
> > > of stagnation" framing suggests: many zh_TW files are only behind by
> > > a typo fix or two.
> > >
> > > (The ~3300 documents with no Chinese translation at all are out of
> > > scope for both locales, so I do not think that is the problem to
> > > solve first.)
> >
> > Yes, we need more volunteers to translate English documents. However,
> > translation is not attractive in the LLM era. :(
>
> OK, the AI thing has still inevitably come up ;-)
>
> I can spend an entire afternoon reading the discussion emails and
> articles about AI/LLM in the community ;-)
>
>   Sidenote:
>   I noticed that there seems to be renewed discussion in the English
>   document section about removing the "assisted-by" trailer. It would be
>   a good idea to make a note of this and see if we need to update any
>   relevant sections.
>
> However, personally speaking, I still prefer to read the official
> website's documents. It was written by the developers, and of course it
> is more authoritative than the content produced by AI/LLM. And sometimes
> the information provided by the AI/LLM is a bit behind the information
> on the official website kernel.org.
>
> > For the todo list, you can check Jon's advice for new languages, e.g.,
> > Spanish. Search it from LKML
>
> Thanks, I'll learn about it too.
