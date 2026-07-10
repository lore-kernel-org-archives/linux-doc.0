Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4611D8834
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706522; cv=pass; b=po7vLxd/xsnnBC57r2pV2WG+tDcA7ipdyxdGZvbhU7GlajsRbpeeXpgirmXDJw2pGhDt9jM7IMZJfJlJ8BkadhPr6HzhgSx+BqkQ9Rh+rxJ3IrHOcT7x3DAav0cL8+OpNmzxarAVkN9IZxonmfm3syLR6rS+OUxM1TREDhTO1WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706522; c=relaxed/simple;
	bh=h8/FG3AD0C5tKGc/UZC4CslCzsrcK87ZuwQ/lC5wsDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4LA3V5BtdNe5vds3JFP1dvS6Nb10AbK7JMW0soApoSrsvADzSmt37POABOWVi0QGBCsEZLwc2MDOrYWFtpSOn6r5InrrDPoF7pehff8vw+8Oh97JAugUxtSFTyRcOCocOf1rDw/4SF2a4uzS5knJP/d5TcSrqtRB0NGC1gPvPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC2iUFcb; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC2iUFcb"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c6e2d2563so835431fa.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 11:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783706518; cv=none;
        d=google.com; s=arc-20260327;
        b=a5NmNlO4L+t6WQCz6xnf4B3XZg0Otwhi38VIfyX0ZxqUzghjdtRzFWwRHk4vZXVpp6
         bsp6uqZlxLsMseMD5WoBDK9x1xjgCs9yuGYoh9wRCHiDFjN3ktbv1aWTnq/GgvEusZ7h
         lrGGgAwNtnBWD9WINIh1kocN9d6GfA3jrgb2USfzGYvmY9MqkOynC6M3jcYRyqLY0J5K
         CtFpeqQN/eVNeiGNUHJ83JM4M9upPC8h8a4ELqnATvXDOXFFjqzjNtPxOusyDHgzpKgO
         3RUVu47i/h2fwRjGKk4BqVc2VZ6V4GaNJ336K4Yeiqpdn3+SlSOHjFQ7U/BiCmFLOsAI
         CG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45z2mO979ew2s5MbKTJhZ0ctKGUNPJiivlO2IVqMVtw=;
        fh=M7MHnI9uW2bJt77kkuozEcFRLXdLpKV3myyMAG8zoag=;
        b=aogLVOSn3X7w7o19L40UYw/UlFSXWriNWpw7AX12eFUCTXA4x7PnlMV67ACk4aNER1
         FKnSYa+rB8km32Sx/Kyt/0EOV0DU/LoZW4JWyy8L2LTTSNskUDIksW9P/DL089rOH3S5
         9rfyOEW3pmoGAty5CukjMDCz+BbHqwlKUCdIUsumG1i6o6LkDFsmeTKeAhdf5WaQmqT8
         S7Arjzz0ofvJ1o83crWnW4l7dChfl2fEKl1YRnGmt9Jbf4FLoiS3bdDGTRVq5tjgMYX1
         2tauZwfw4HvJHgxeI/64iyM/8lbcBvxEWkNs/2HL5sSqTyDHMA526SE56aCxBhSExWR3
         ZBtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783706518; x=1784311318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45z2mO979ew2s5MbKTJhZ0ctKGUNPJiivlO2IVqMVtw=;
        b=DC2iUFcbEn5CmPYJM/HGy0Cn3RnyqYa1C33xFfV8kM3b4xzQaiM9RWU/wpj4PdOC7w
         0Z7xAsuJqI5DDSBHLGdMuvxie+m64gjMWvSLKGR9R1ZiDPGC1QDTXdjevYbmPUR9dcSn
         W89HytIQZdfi0/B9RYu0y6eukD4sU6d2Tt37RAD1IlTX7ov/mpcH4J3snvPSKKZ9gW8w
         OX5MNcRvEGwjKjwGX9FjpQnToKmGoqa1ZqgO5s8srkTfCGQZQ9nDNrWtCmsyYTsF2PcZ
         UsFOnGgu26uUwf9uABX1ksw7BpjOLb4PWMU/8n4pHxWOMQiOgXNthiFA8vWFQUZIE5HK
         5S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706518; x=1784311318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45z2mO979ew2s5MbKTJhZ0ctKGUNPJiivlO2IVqMVtw=;
        b=f5jE4Sxh5LW0lpwkIfIY6EYc/kbdLTZ5h3pAs64Kq0IB5QqIf0XgClrWY83lDA5AHA
         KXNFzB8thzBnx5PFlU3cVPQxn2go8wFqMPw2b33uUiZInSNaBAcqOBuoPy1V5kX8Jx1w
         zkF49DTiZYlE5mtCaHzAVodKOyiZ/aNyrjmklOIHWR3YAOXctxKvwExzULx3OtQfo3N9
         9vA2yGZl1nc6fK7VIwBrgqlpoRaz4xBX3CCUrG1omazuhJbN3acCtaTEbB2Lb9gDB2SA
         Kk9hRxSVjxxytDcGpDZc73dz53s1omIUGV4wIfUtkvtvdvAqmP26h/qWdxsqvmN4+x4a
         1xwg==
X-Forwarded-Encrypted: i=1; AHgh+RpiHWc6rx8iPf6ul0hNLY4DD5skFzMSaibB9YyQN9pYdBcr4dCEYdGHLHVXmBJqvCbv7q2+0RqdUew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4WiSgyNFeeP1hZAZEW7HMmkwM6jgYvlgxqfAzEE5t28eRP50
	XgnZasgkvItcEDpBGL0fCxBru2xKvh9hB1HDgcvahOqm9hllmU7pBZX5kQ/3sRYx3ikszefSvYQ
	pcdouU+ZV7sj+z0h+MVJ04jOuSvsZKlY=
X-Gm-Gg: AfdE7clcH6Xa4QafamMiv4JTkYCnmOXkDofZusKqS4LV7lzVCTmjvsHa4TNiTjmPtra
	F+NB8S8fdUqsO2U45qEO8tGtTTbtOyX57Rj1DK8XmOpNA7X0k4MXxjWfx0ExItCrn6eEzgHuJuf
	MNOwbcP53Tl6y0w4W3QZv3EV6FV9kYCviZ2N9SYcD0Z2lDHG0n1vtdPdtxfXzmVYYT2u0fRmWH6
	HUgcoyh+ezO7iYtcSNmInUu2qPy7/TQH/sl3CPH4CDW2SWtP2vmiG94gyYw2Wi4LjFwfCq/dr2H
	VTK107pq4qRC+sw+UtpFp9X3iX34oZRZgDen7VfA1umsHUSdq9p8I7s=
X-Received: by 2002:a2e:be0b:0:b0:39a:fc1d:4706 with SMTP id
 38308e7fff4ca-39c82a26a11mr11003641fa.5.1783706518181; Fri, 10 Jul 2026
 11:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org> <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
In-Reply-To: <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 11 Jul 2026 02:01:46 +0800
X-Gm-Features: AVVi8CfiXYruXm3ZI1rLVvctp_BXzh-R04K9HgbdUhN-VR16D-A4MZrLpX0OiS0
Message-ID: <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Weijie,

> I think currently having Alex apply your patch is a temporary measure,
> because the maintainer of traditional Chinese seems unlikely to be
> available in the near future.

Thanks for taking the time to explain the bigger picture in such detail.
Details. I understand the concern: accepting individual fixes doesn=E2=80=
=99t=E2=80=A6
Solve the underlying problem that zh_TW documents have been facing.
Stagnant for a long time.
> So if we are doing zh_TW instead of a direct simplified and
> traditional Chinese conversion, I don't think we can handle this
> properly without the help of Taiwanese friends.

For what it's worth, I am from Taiwan and a native zh_TW speaker.
That is actually what motivated this patch: much of the current text
reads like converted zh_CN rather than natural Taiwanese Mandarin,
and 8.Conclusion was simply where I started. Within my ability as a
newcomer, I would be happy to help review zh_TW patches or keep
improving the process/ documents, if that is useful to the discussion
you are planning to start.

This is also my first kernel patch, so naturally I would be glad to
see it applied. That said, I fully respect whatever direction you and
the docs maintainers decide is best for zh_TW as a whole, and I am
happy to rebase or adjust it if the discussion lands somewhere that
requires changes.

> Sorry, I think you will prefer being called Chen-Yu instead :-)

No worries at all :-)

Hi Dongliang,

> I can help review patches in traditional Chinese. With the help of
> LLM, it is fine for me to handle local terminologies in zh_TW.

Thank you for offering to help with review, and thanks again for your
comments on v1.

Thanks,
Chen-Yu

Dongliang Mu <dzm91@hust.edu.cn> =E6=96=BC 2026=E5=B9=B47=E6=9C=8810=E6=97=
=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
> On 7/10/26 9:00 PM, Weijie Yuan wrote:
> > On Fri, Jul 10, 2026 at 04:49:30PM +0800, =E8=91=89=E5=AE=B8=E4=BD=91 w=
rote:
> >> Gentle ping.
> >>
> >> This v2 addressed the review comments from Alex and Dongliang.
> >> Is there anything else I should improve, or is it queued somewhere
> >> I might have missed?
> > Hi Chenyou,
> >
> > I think currently having Alex apply your patch is a temporary measure,
> > because the maintainer of traditional Chinese seems unlikely to be
> > available in the near future.
>
> I can help review patches in traditional Chinese. With the help of LLM,
> it is fine for me to handle local terminologies in zh_TW.
>
> Dongliang Mu
>
> >
> > Outside the patch itself, I noticed that Traditional Chinese is actuall=
y
> > in a state of stagnation, which makes me think that receiving such
> > patches is a temporary solution rather than a long-term fix.
> >
> > As Jonathan said, "...But there does come a point where a translation
> > is so obsolete that it does more harm than good and there are no
> > prospects of it being updated."
> >
> > So, after a period of about two years of stagnation, the Traditional
> > Chinese documents seem to have really reached an unreadable state. This
> > is something we don't want to see, but we must accept the reality and
> > then take action. Please note that I have no intention of offending
> > Haowen. On the contrary, I am definitely grateful for all that he has
> > done.
> >
> > I did some interactions with one of the L10n Taiwan team (who are
> > involved with Git L10n) [1] in their telegram channel a few days before=
,
> > but sadly they said the biggest problems are:
> >
> >    1. No one is willing to take over. (hey, I totally understand)
> >    2. There are different opinions on translation. (I don't know the
> >       deeper details)
> >
> > Besides, I'm also very curious about how exactly we define the position
> > of traditional Chinese or zh_TW. From my rough observation, the existin=
g
> > documents merely performed a simple conversion between simplified and
> > traditional Chinese, without taking into account the local expressions
> > specific to Taiwan. Therefore, that's why we are receiving the patch
> > here and commit aba18be23f14 ("docs/zh_TW: replace =E6=8E=A5=E5=8F=A3 w=
ith =E4=BB=8B=E9=9D=A2 in stable-api-nonsense.rst")
> > (Please correct me if I'm wrong, as I have not got into many
> > translated pages)
> >
> > So if we are doing zh_TW instead of a direct simplified and traditional
> > Chinese conversion, I don't think we can handle this properly without
> > the help of Taiwanese friends.
> >
> > Of course, I feel quite ashamed that I'm saying these above here withou=
t
> > having made any substantial contributions to this community, sorry.
> >
> > Could we discuss this matter in another thread? Very sorry Chenyou, wha=
t
> > I'm saying is completely unrelated to the patch itself.
> >
> > Finally, I would like to express my sincere gratitude to Haowen.
> >
> > Thanks,
> > Weijie
> >
> > [1] https://l10n.tw/
>
