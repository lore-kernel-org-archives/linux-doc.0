Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94D38E5C4
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295944; cv=pass; b=Zm2wT5gVyC5cEwOgdpILcg53vZOHWI4+NaLTc9NlFeP59N7TGOv8Dd10bQ0ehPFfuYXpn2XBMmTNKTAsg1YcPBL0OT2909RQ7brj+emPJvqlUwaP4zQUGriYoQjUZONckxMKfMwWhdKHme0q4luUBljprnGI/09UuBoNNthjhYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295944; c=relaxed/simple;
	bh=7zu+XtOrDTbH5wBx/iANx3nML5Ud5rMRqrzlj7sh86A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msNJ7aBiOVTGlMFIdtkIk63F5J+uUtVXMMaAl28ubOxPVL40RlMX28Wo1JBa17BDf4FkaiPX9Xmc+x464gujjkAy65WQB2coeg8ZQG2OZbCvpkjB8DDVztveSEil6pph7CPlUlv7P20mU+KSHK4ElIHkNQ/17c9KtNYbzlnmVf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ETrru+; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ETrru+"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so91294e87.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 00:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787295939; cv=none;
        d=google.com; s=arc-20260327;
        b=GpDs86f442SYE7KnXYgSdqw2/XpfFpj/JqGQFqPg/ZJBkcASt1NBJkdG8qHNyVi3av
         frQHjCltR6JpmDbfSuW8j/ShFFLAI/ImEu4EiZo+bbtqLHssmbkgSaiRjDUoGskGzEmC
         A6OkhV3lgE97MYQQQThEF1kFE7VHIulUVf0Dxnqg89/BQM+D+qA5WlMSNh+NaDrtzuX/
         x9VBjg/fSJhfvh2jkcPuo09xKEhbe73JqgXQ/XGWYN/Bye5eLTtQnQm49CLByByGmvcD
         eq/ypN1G22HF0sHA9+b1/C3II+z0LQMEjwlL/eaekTaI7ZNRu/9MXd9EoKQSs7sDQ6Sa
         1N5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0xF4RyUYKCaYhQDI4XV4P3mzISQdflsTFDHAbFYmANw=;
        fh=OaTbC7m5YzoGZV9xcIxVSx8HUls5+7kNDJaWTbVlVcY=;
        b=FxKka2TpGWWGLJj4gyopOGoOBbTb4bYQ/gAo+H12BunPCy5s23Z3t78+f4UrWxPIpf
         7WHSI+WV6tLyicsRZ3jDuop5RTt4H90YlwiAb6h+mKFyPw/OU9o7p9cTQnOCxnVJOzMU
         UrLgd/eVVJkeDD8iezSdTBmFGXR+Qki8pWY4Y4aR9Tq/WBig/UVtTNG1sAQ3bGaLzPUh
         9sH6YiRJR0kPogDK43aYVha6D7BGkTfC4WQ7gMTqU74P6YmaUr0nvY3VSFr1xx+8nfIn
         kBgWKGJZ0Rcvc7QaG6r5yASfHbwXLcP/oU24fa3/dZO/aIZlmYBvTAUaCneik2RWIDk7
         5prw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787295939; x=1787900739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0xF4RyUYKCaYhQDI4XV4P3mzISQdflsTFDHAbFYmANw=;
        b=p5ETrru+/4iGSl3mfrLJ8M89huRQmS57GmLJ/hT2i7JKruFmHrYSO8PSXCXFm/WYjR
         4YsNlsLKg/TatIX/3m/1+YEbsFB7Ma2JUknemuvMlhjsIZVVjpoTQ4I3SsIE27/M1/fg
         xPcEEpffXIkBIy0JCcfYD3oW+1dITV+HqQhPt6FKDDF2oRx/p8VPSFx5FARwwwCKAmFq
         5ROwd0AdR26vsN1Zzo+5uxW1j0kOhO8F02yIQaWo+88C9nJZtlKIG0a1VHkWAp9SCQN3
         K8SxqkjWe9E4lX7nzw4j7S5J83phqmeWhDBkFqrpE75I6rh6/2yb6eF8aEzLSM6ftb+t
         u7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787295939; x=1787900739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xF4RyUYKCaYhQDI4XV4P3mzISQdflsTFDHAbFYmANw=;
        b=I5tF1O4HROF/9V8Q9AiEltkpMumkBO8PGzzVoVEr7Wbka/cgEJMrWoNk1ZBsYuf9/d
         UHUqtOYdf8xCgT04Zb9sOWb7e+HC8RZYZU3aHAjmfPVHn1lzW//hvsD+qDViTuovaG4K
         O7PW/GybTXVT3CKVVQI/qgaqFOuLl2l0nhKd1bI+SQtbZNLEJtiEbnkYFzmReldDwXU1
         yPu+2JnMWczrRwBZ1HP2D/4AKU/jeOAIdguBiQoz2BI6wa+E/OlzvR6QbTw+iib4yzuJ
         oc6asicZZBxD5rPnaLrc2qzuktUnUxmMW7YwmArw0vZwW9Hso/HrYJN3iL1nfcfrRf0T
         yv7w==
X-Forwarded-Encrypted: i=1; AHgh+Rrt3suMVfpbGTJwyReQ1pZJBdFOPrCTU2nMZQB6iik22lS8bKQNYgyIC08rE/TmAAB1YWVsvNQIpVE=@vger.kernel.org
X-Gm-Message-State: AFuF++nC2gbPFsG4Bew3B20Txlxpapj2d88W5cWnfVc5r6dMtC4tOeT3
	zJED/iHf3AuO36Wt/UjRWJBwe7NqE8tGW+KCsBQioZpjy3Hu77dPfmB6Ix+IB2VW8a8EdFZm3Qt
	aoaoqd78i+FtgaWLedo1rhakJXjS6quE=
X-Gm-Gg: AR+sD124dcHUok80YDfDaeBgVifnJReZhk91NJRkJYTZFdOvvm51fwaS/JsymJ1vmgK
	NK1+pbCsNrlSQXXsxriLZjrfrBib/YLXa3S9zH1bqX3UjZmRwjp1xKmUxvWUftBpxHNqmD1+xoh
	HK/B9aIxRghCPrAQHNWpQ0A1FDD/RuY/8pgKsulC4zq/8NYELj7z7hO9/MRiGx1q3u1dO1T9v1d
	+N6hR9T5JPYnN+bwwggy31Jz2LbDDW/7ZUdnK6nrHO4DYwJ+9UKyXiHqXE3/qAuxjMbhf0KMgef
	28txlkCz8W1FkZXS+PI6caCqY5rk3nH56No0oE0ddm8lxo3+1AExETKCoP8p7L+xAu/WWXOolof
	7p9XUFsXxpNqscBE+HEkNTxUak8A=
X-Received: by 2002:a05:6512:3985:b0:5ae:cfd3:4753 with SMTP id
 2adb3069b0e04-5b48427ccf1mr658181e87.3.1787295938983; Fri, 21 Aug 2026
 00:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-8-chenyou910331@gmail.com> <87cxve80yy.fsf@trenco.lwn.net>
In-Reply-To: <87cxve80yy.fsf@trenco.lwn.net>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 21 Aug 2026 15:05:27 +0800
X-Gm-Features: AcwNN1VJmKUOBi3v8hEfLpVXS085YJQni23oSkcNclNkVxAVL_iErTAaPJKF-uU
Message-ID: <CAKspUhK+V=x+KmSqk-9U1XXguyxayfES+zEA3-FWDZQcCq7UEA@mail.gmail.com>
Subject: Re: [PATCH 7/7] docs/zh_TW: remove the last maintainer contact references
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederman@xmission.com>, 
	theandy.deng@gmail.com, bailu.lin@vivo.com, bernard@vivo.com, 
	bryan.wu@analog.com, luochucheng@vivo.com, hidave.darkstar@gmail.com, 
	dongshneg.song@gmail.com, eugeneteo@kernel.sg, tekkamanninja@gmail.com, 
	wefu@redhat.com, liu.hailong6@zte.com.cn, harryxiyou@gmail.com, 
	chenhuacai@kernel.org, huang.junhua@zte.com.cn, e12051@motorola.com, 
	zangleigang@hisilicon.com, leoyang.li@nxp.com, lizf@cn.fujitsu.com, 
	chenqi@beyondsoft.com, Yizhou Tang <tangyeechou@gmail.com>, xxx.phy@gmail.com, 
	wanjiabing@vivo.com, wangchen@cn.fujitsu.com, xiyou.wangcong@gmail.com, 
	wenhu.wang@vivo.com, bobwxc@email.cn, wangxiaochen0@gmail.com, 
	xudong.guan@gmail.com, synmyth@gmail.com, r0bertz@gentoo.org, 
	gaochao49@huawei.com, kernel.zeng@gmail.com, xu.xin16@zte.com.cn, 
	yaxinsn@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:38:29AM -0600, Jonathan Corbet wrote:
> While I approve of removing all of these extraneous lines, I wonder if
> it wouldn't be better to do it as part of updating the material in
> general? (A question, not a demand!)

My preference is to keep the two separate, if that is acceptable.

This series does one mechanical thing that can be checked by
inspection. What to do about the stale translations is a different
question and a much larger one: IRQ.txt and io_ordering.txt translate
English files that no longer exist, and several of the arch/ and
filesystems/ documents are years behind. Some of those probably want
removing rather than updating, and that is a judgement call per
document rather than something to fold into a cleanup.

I would rather bring that as its own discussion, and I intend to --
Weijie has been surveying which zh_TW documents are worth keeping, and
it makes sense to settle the contact-block churn first so that
discussion is about content only.

If you would rather hold this series until the wider question is
settled, that is fine too; the addresses have been stale for two years
and a few more weeks will not hurt.

> Meanwhile, as a matter of general politeness, if you're removing
> somebody's name/email from a file, it is best to copy them; I have
> added Eric here.

Thank you for adding Eric, and sorry for the omission -- I copied the
zh_TW maintainer and did not think past that.

I have gone through the diff and added everyone whose address this
series touches. It is a longer list than I expected: the zh_TW tree was
character-converted from zh_CN, so the contact blocks carry the names
of the original zh_CN translators as well. Apologies to those now
receiving a thread about files they may not remember working on.

Chen-Yu

Jonathan Corbet <corbet@lwn.net> =E6=96=BC 2026=E5=B9=B48=E6=9C=8820=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Chen-Yu Yeh <chenyou910331@gmail.com> writes:
>
> > disclaimer-zh_TW.rst is included by every zh_TW document and told
> > readers to mail the listed maintainer directly; index.rst asked
> > would-be contributors to send patches to the same address.  Point both
> > at MAINTAINERS instead, so the contact information lives in one place,
> > and drop the remaining contact blocks in the top-level files.
> >
> > This mirrors disclaimer-zh_CN.rst, which names no address and refers to
> > the Chinese documentation maintainers and reviewers instead.
> >
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  Documentation/translations/zh_TW/IRQ.txt              | 8 --------
> >  Documentation/translations/zh_TW/disclaimer-zh_TW.rst | 7 ++++---
> >  Documentation/translations/zh_TW/index.rst            | 2 +-
> >  Documentation/translations/zh_TW/io_ordering.txt      | 6 ------
> >  4 files changed, 5 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/t=
ranslations/zh_TW/IRQ.txt
> > index 8115a7618307..b9a3e18495d2 100644
> > --- a/Documentation/translations/zh_TW/IRQ.txt
> > +++ b/Documentation/translations/zh_TW/IRQ.txt
> > @@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese m=
aintainer for
> >  help.  Contact the Chinese maintainer if this translation is outdated
> >  or if there is a problem with the translation.
> >
> > -Maintainer: Eric W. Biederman <ebiederman@xmission.com>
> > -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn=
>
>
> As noted elsewhere, this file is long gone, suggesting that this
> translation is ancient indeed.  While I approve of removing all of these
> extraneous lines, I wonder if it wouldn't be better to do it as part of
> updating the material in general?  (A question, not a demand!)
>
> Meanwhile, as a matter of general politeness, if you're removing
> somebody's name/email from a file, it is best to copy them; I have added
> Eric here.
>
> Thanks,
>
> jon
