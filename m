Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A1377553
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302472; cv=pass; b=RtVmPlpAhOoiODf1h6C/QgBudfHxEw2/VQWEQGoX49JhTiN4AvBdQlfPMEG3Q5f/wE9+FY1CR0VQv8JDsWHedGysaCMxibbHhoGgbgt+EP0YUWZVovom6DN5wnZYaJDCwIbTNcYP5KZap1bdyYnorw8xCAhWuuoHfTijBXah95I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302472; c=relaxed/simple;
	bh=sNK8NM97eLMP1ibM9fo8f0xAuJMJ5TVzkzwDEhIv5Y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMea/dSHthQeJrUxw5CAzDMTS9VUHdfU+ZAYR1ZTrUXxuwDnSKRtSAsQblbpg8NngzF9AGw3kqMQAZ4xOoEULlCS5//Di21EzWcg/wh4dcqBSdYT3uN783LOaTpbZAqqbbmO5XbqlNopMfbOJbynd3nxMWOpOU/c7LvBIVxvyEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sI+J0Sf2; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sI+J0Sf2"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c0cea8883so9516681cf.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 12:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786302467; cv=none;
        d=google.com; s=arc-20260327;
        b=U6gl86LMVEst0IHldz4nm05QtiaoAL/dUtMq0p6TqtIpUVrSC/IvU70lmMvik9zDWN
         +MXM0OoIc9wRnQqu5iibbMByIX9CyYUbuql9a26CGlFJrmvRJHboxVnt91sKr6AkFKBk
         S+Xp2aTkA69RXed028JtpwPX3Rvmu9l0V60hp5LKo1Ea3V3SgRLYUaN52wbtTwIXP0Ka
         1q1xul/lG+5PJZnuskYYe3EbJ4MPcJxEMhwma7kbdg9PQ4mg7GxA2Qtg1QrC33uM+ITx
         sNOBrRHo/6fBZjEAw/8FpQNJSPQpgU4pNWoe976ZqprWsLFCbZMzv++GOS5vvZOdcejT
         /B+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tX06I2KFZqzhTQ4Pr01WcpE75S+a3QAeSD85NJL3cpo=;
        fh=rVwQfHFgayQGmrOJalXnK7uqs6YSEp/eFdQwadSM8k0=;
        b=sloielwR8F+LdFogkjoVYjvXMW3/TT1S0SMjK2dQmGVSW73qLEEL49E4gLMgfAlWPV
         obkpUdyp7V5rL3XijjKCzGUlKU9p5/c05/HvDE+AL4CAS5GtWbZqXoviDkrhSisJNXk+
         a1Y1k/FOCEKVJo9Tqk7oNZauiEOZAZR2D2wBMejHrJ4muHhHHnSt+zTsAlFG9f3MF8Kg
         U4aKyMix3uupd/eezEtKxZTQ7vlqsoKxtbvW6/sg8D7v9X+4NEkJbEK33FtcowKQpIL3
         /x5Rn12y+owy4M/+4G67u1kIZaF447MhabJiCvepMYBbtI2Ktn25FeLVlyvZt09vxcmg
         qNww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786302467; x=1786907267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tX06I2KFZqzhTQ4Pr01WcpE75S+a3QAeSD85NJL3cpo=;
        b=sI+J0Sf2eoVx2IWWGVgvbh9Hkss6ZCvSVa6LXIMv3mDUk9rHCS8RJW6SRkd4Gy6APC
         ZgW/NsMMRij1ldcwstXpicTjzdaEJ0iU1OffwguFFxwQiz4WlAzPyqWu0K386v5GaZhw
         nqWNrPl+tJUZJp04MGsoVI1d3Zd7422Vkr6VWyigz0DkTrKVHf46uWhNPTT7ypYqUw4Y
         VXo0SKQDBh4s65nxzxMK506Tf8nRaN3rxGpbYjmC9BsXNa1r4NVxpeqpVVobfR1swcWb
         dqg/bdhJ3eU/dDLmSJcWVBByQ+Rr/wVhvEfhEnVYCSlCMgybi62GX1j8GEttB8EPCscd
         0kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302467; x=1786907267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tX06I2KFZqzhTQ4Pr01WcpE75S+a3QAeSD85NJL3cpo=;
        b=BZvdRKxZtxeQZYkhHX/ibmOVDE6txd5M43SIBAX+pLwa8XyJb2aXjApFjAlKDNDFa1
         eGSCVvLDEOTZMDRDex8Ud1lHMB+RlhsmuNh2atJ3dAwLNale0Pywl/siKoqs22ZfMtqb
         FiQu8B6WGpVdw9X9RJ5wvusvn0iSYmRnuoyFf5cg96U9+HEGnWsg3vA3AnTGecOijVl2
         BGbedegfcZRGOQ30SW7wBSDJG2dN6R0snCNyYazkxzW6NuJ41L1pDzLfl6U/IlYCwqVg
         L4nAdBzs5U3XY/z9e0GYN6PlEH6dcMOHybFdEzpRrca47ZvDjPmlukU1rSV7/1i2DDRD
         PV6g==
X-Forwarded-Encrypted: i=1; AHgh+RpXAnNV1zhEthcl4cIkpgKeNPa4XjJGVZMbp0+R9ZjwQQMtKFtfPGPWh+vsstvjuvf1iymBs3XdntY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hclMjhsZzIMrBlV7AKnmgf56Jad0FcEEaF8dri4QN/3uNw4e
	IGCl9JVKpM129AeLlEZ0uCNkEATO4nYhjsRMEvEFZa0/0mRC06TRF94HxI0NaHbNohOJaVJ5biH
	oPCH8QiD/CkidMHOmLAUIXb/cjb+h4M8=
X-Gm-Gg: AR+sD131qIl+GWV/H7vVh7wKaHwZKHbxArG0c/QhJzPNZFED7gV44C1S7KKUwpZCgf+
	k9aY+YWIuYdoheEYRLfCob+8qihyq+HFKBfCWpcK0Emm+p4thwAH54xDtvGxzvwTIXi6LcTCM+L
	KVhUc+ltrWuAU1N41TaZ0dMdglFQM7dZcbtEGS/LE/F0b/F03Ut0mROED0ePuYXD4rZU8xl6T36
	4WNIuikJz655Zxv0zx2vu4cJqsWlPKzqZ/ybHBqvlijPvHg1Hf7umpAcEAMlx1Q4L80Yjg5gOib
	aq116Fu3eVgkOJkiu0Fo4OUSi1V5ca+75l11sEdWqY9RI+w=
X-Received: by 2002:a05:622a:511:b0:528:ce0:e9f8 with SMTP id
 d75a77b69052e-52d2363e75emr127435451cf.3.1786302466538; Sun, 09 Aug 2026
 12:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809101923.13176-1-chenmiao.ku@gmail.com> <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org> <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
 <aniKpkE5iCCU835q@wyuan.org>
In-Reply-To: <aniKpkE5iCCU835q@wyuan.org>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Mon, 10 Aug 2026 03:07:10 +0800
X-Gm-Features: AUfX_mxoX3PEa2VZJDaS0FLSLGhLnAYd-5WPww3fjtTsyOhIdWfmjEbxK3vTaE4
Message-ID: <CAKxVwgdjNjDLWpR2WPOdsXKhusobwq_52ioB5J15gdD2C=obvQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew support
To: Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, corbet@lwn.net, alexs@kernel.org, 
	si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Weijie Yuan <wy@wyuan.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=889=E6=97=A5=E5=91=
=A8=E6=97=A5 22:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Aug 09, 2026 at 09:21:45PM +0800, Dongliang Mu wrote:
> >
> > On 8/9/26 9:02 PM, Weijie Yuan wrote:
> > > Hi Miao,
> > >
> > > On Sun, Aug 09, 2026 at 06:19:20PM +0800, Chen Miao wrote:
> > > > The dependency checker currently reports an unknown distribution on=
 macOS
> > > > and cannot provide installation hints.
> > > >
> > > > Detect macOS and include its product version in the status output. =
Use
> > > > Homebrew for formula dependencies and install MacTeX as a cask with=
out
> > > > sudo. Keep PyYAML in the virtual environment requirements because
> > > > Homebrew does not provide a PyYAML formula.
> > > >
> > > > Document the macOS setup and the --no-pdf option.
> > > >
> > > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > > > ---
> > > >   Documentation/doc-guide/sphinx.rst            |  7 ++
> > > >   .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
> > > >   Documentation/translations/zh_CN/how-to.rst   |  6 ++
> > > >   tools/docs/sphinx-pre-install                 | 89 ++++++++++++++=
++++-
> > > >   4 files changed, 106 insertions(+), 1 deletion(-)
> > > [...]
> > > > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Document=
ation/translations/zh_CN/how-to.rst
> > > > index 9ec2384e1..e8c91d81a 100644
> > > > --- a/Documentation/translations/zh_CN/how-to.rst
> > > > +++ b/Documentation/translations/zh_CN/how-to.rst
> > > > @@ -102,6 +102,12 @@ Linux =E5=8F=91=E8=A1=8C=E7=89=88=E5=92=8C=E7=
=AE=80=E5=8D=95=E5=9C=B0=E4=BD=BF=E7=94=A8 Linux =E5=91=BD=E4=BB=A4=E8=A1=
=8C=EF=BC=8C=E9=82=A3=E4=B9=88=E5=8F=AF=E4=BB=A5=E8=BF=85=E9=80=9F=E5=BC=80=
=E5=A7=8B=E4=BA=86
> > > >   =E5=BC=80=E5=A4=B4=E7=9A=84=E5=91=BD=E4=BB=A4=E3=80=82**=E8=AF=B7=
=E6=B3=A8=E6=84=8F**=EF=BC=8C=E6=9C=80=E6=96=B0=E7=89=88=E6=9C=AC Sphinx =
=E7=9A=84=E6=96=87=E6=A1=A3=E7=BC=96=E8=AF=91=E9=80=9F=E5=BA=A6=E6=9C=89=E6=
=9E=81=E5=A4=A7=E6=8F=90=E5=8D=87=EF=BC=8C=E5=BC=BA=E7=83=88=E5=BB=BA=E8=AE=
=AE
> > > >   =E6=82=A8=E9=80=9A=E8=BF=87 pip/pypi =E5=AE=89=E8=A3=85=E6=9C=80=
=E6=96=B0=E7=89=88=E6=9C=AC Sphinx=E3=80=82
> > > > +=E5=A6=82=E6=9E=9C=E6=82=A8=E4=BD=BF=E7=94=A8 macOS=EF=BC=8C=E8=84=
=9A=E6=9C=AC=E4=BC=9A=E4=BD=BF=E7=94=A8 Homebrew =E8=BE=93=E5=87=BA=E5=AE=
=89=E8=A3=85=E5=91=BD=E4=BB=A4=EF=BC=8CHomebrew =E5=91=BD=E4=BB=A4=E4=B8=8D=
=E9=9C=80=E8=A6=81
> > > > +sudo=E3=80=82PDF =E6=9E=84=E5=BB=BA=E6=89=80=E9=9C=80=E7=9A=84 Mac=
TeX =E9=80=9A=E8=BF=87 Homebrew cask =E5=AE=89=E8=A3=85=EF=BC=9B=E5=A6=82=
=E6=9E=9C=E5=8F=AA=E6=9E=84=E5=BB=BA HTML =E6=96=87=E6=A1=A3=EF=BC=8C
> > > > +=E5=8F=AF=E4=BB=A5=E6=89=A7=E8=A1=8C ``./tools/docs/sphinx-pre-ins=
tall --no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=BF=
=E7=94=A8=E9=BB=98=E8=AE=A4
> > > > +=E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=
=9B=A0=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E ``Documentation/sphinx/requiremen=
ts.txt``
> > > > +=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=
=BF=87 Homebrew =E5=AE=89=E8=A3=85=E3=80=82
> > > My question is perhaps quite stupid. (I'm not familiar with this part=
)
> > >
> > > How can you make "git clone xxx/linux.git" done on your mac? I've tri=
ed
> > > this before, but it seems that there's some format issue? macOS's
> > > default APFS is case-insensitive.., so I guess you did some extra
> > > settings? (like 'git clone --sparse' or 'git clone --filter=3Dblob:no=
ne'?)
> > > But my intuition and experience tell me that it won't be convenient ;=
-)
> >
> > For Mac OSX, you need to first establish a Case-sensitive APFS Volume, =
and
> > in this volume you can execute thse commands.
>
> Yes. So what I mean is: for documentation that tries to keep the barrier
> to entry for new contributors as low as possible, if we are going to
> introduce macOS-specific instructions here, would it be worth mentioning
> this as well (i.e. the case-sensitivity issue)?
>
> That said, if someone is already doing this kind of work, they probably
> do not need much explanation about it anyway.
>
> > > If so, an additional description for macOS users might be more
> > > user-friendly, I guess? Since the how-to file aims to lower the
> > > threshold of the process of translation. (While I don't know how many
> > > macOS users are potential contributors.)
> >
> > I don't prefer to add many description about "how to start kernel
> > development on Mac OS X". Some key parts should be enough.
>
> Yes. Agreed.
>
Thanks for the clarification. I'll first check whether the kernel documenta=
tion
already has something like a "macOS kernel development guide." If not, I th=
ink
it might be worth documenting this.

In particular, macOS uses a case-insensitive APFS volume by default, which =
can
cause unexpected problems for newcomers working with the Linux kernel sourc=
e
tree. It would be unfortunate if there were no documentation covering the
things developers need to be aware of when doing kernel development on macO=
S.
That said, I suspect this would be better handled in a separate patch serie=
s.

Of course, if such documentation already exists, then that's even better, a=
nd
there would be no need to add another one.

My main concern is that, if there are currently no macOS-specific notes in =
the
kernel documentation, some important details may remain implicit knowledge
among experienced macOS users rather than being documented for newcomers.

Thanks,
Chen Miao
>
> > > And another thing is that zh_CN would prefer splitting zh_CN
> > > translations apart from the original English one in your patch. Becau=
se
> > > there's a script to monitor the translation status.
> > > (Better confirm this with zh_CN maintainers)
> >
> > This is a good suggestion. However, many minor changes of documentation
> > contains EN and zh_CN in the same patch :(
>
> Then I guess we'll just have to wait for the next patch adding a new
> translation to verify the statistics produced by the script.
>
> Thanks.
