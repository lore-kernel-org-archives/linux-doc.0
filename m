Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688954;
	b=LKT7bO430bwjfZtr/rzkN4Hd3hSZr2YxegGnd+D64ytXEQt3p7/Ns4lDOoYsMIgdPY5X
	 qc+9RVwI2KDusBcel/3DeH8w1rLY8Lzm5Kif5qED57AADMg1WCbNiJTxJDKjteCA6WXt5
	 QhH3MJHZmK4afjQefUqfnwKXpNAwhpe8gvTfbSD6PX3Xv/e8EVgfXKieWfo8Jc/QeJlPr
	 DRmGI08cmWgHIEi5pvCjtWNVS/S2fqwg9yftJiX/n7o20f723rNMgwF9UIGBkHgEjDCai
	 aGN8BGvkbyHFtPcO1z5ZLy2zV3+VcIlOuynvYPGUtZGMr2aRzAlaiaMvIZFmU2hX6Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
	b=vPkblwqw+ps3dp73bHawQGCYLNiv7yxpRGBpA8DRhAzWQyJL1SSkYKL8QRc5KF6vIrrd
	 92dHH6ABPxa2SxaslRXvAzH1AKhgP9BThITM6xXunPOEiV1t3jSMVYBgGdAlPQcy4KtWh
	 VKKnqNxJ1wPdiimooQrAGYAekI0gmLyIU7p/h3AALljQsq423v35mPvcVia8nV/DMRawE
	 7420HhTEoF3+4Fi1VSEDI4i0DqtLxioxtODwbwmKzllij9Dm/JXqSkhn4Z07NWe3yLoYz
	 Npa3aFtSX/l3p6+QfC6bq7t88dSd8TMuQ17y/DWnI13glQ1aG4a03T20xswWRbCW/3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWu9tbxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A991606A323
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A991606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWu9tbxW
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5365b48238dso17642611cf.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 10:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688953; cv=none;
        d=google.com; s=arc-20260327;
        b=MEwPr/mYuV7nfFgiNf0HCUrcvKMkhIukypEGEhn8L0fAdQ51yYwUECEFdl/Gs512i/
         jY2prPRZbrxpeMCv6hPA2xSUd7fO/k/DYBk0do91WBiWmCzfjOwfsjoV+AYUC1ewGTr4
         3hsRsKl39RDrht9F4M4gxKMyL93pRH6tIxzDrkfLSJwUTA0EwKeqPUrmXIjLlxqBMUFG
         QQ1ENpB3ngSSsDhzO4DrMOf1y1M5uJZ4aRnqitwlnaVLTyYJ//PH+TrgkF6Sw/sQv+wf
         ODVyrk45EE6FKlIAukbO0XcUhMB+R2toy1uyMR8y6IjstZo2LK1a9QzatxjNMQLm4God
         yL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        fh=JjlrkJvW1TJuorTU/Gc6fkopP955ttSItVLPHhRFBOw=;
        b=W0qFpGwDM6k4KgcYwLfCzhWc+l7Q3TuanQx5yLjqdNcVSNtpVE5yd/MJWKhqN3TOY8
         H0pFfGdZ68cPqq4de3vLJeKNCJIBUsLwR1EmFN+eHEFpGgRJ9S/t+lpSkKJIDxCpRL8V
         UM1nwxHdZ5XRN0B2m7IymCd74TE+jotIB9dSr6HTUzDGBETHVa424BgwBx/bzUWSYwOW
         V0Dc9UsC79L0VgTmEn+canAFOPDQtYf2LQLsypxT2X7w71wPz+pN6P+5n9LabS4BosC1
         wsAvZRPKUOGJ9Lbn5f5OkFyUB0WJ11pVZZwgL58np2TpxCQ1d/JgCPV8DQfxvLW7C7h+
         gsKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688953; x=1793293753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        b=CWu9tbxWxgTFBB5ptc29m/qvoMkf2DmuRsTTZ6ZYhcSwdT1Zi7sV8MibkjICc4cUuV
         8OM0KuXCyDL1FgPP4jP0YxFTtwKL55k61thmSwnkBhMqElm4k/pw5wGX2C9HwhOw10wd
         zx4qNdrCzd8dvHbTvscSojLpOWCO6rII2fAHEYWnhojkujlVTZ+n69BwHCdDqIlexu0i
         qXnfR2MJwf++ki8hijM7YAZE+m4Ki7K/6hTmj+kHUlSPGPyn+Dt4bFK7Prqn5ZE9uaXH
         H7h2ihbAHvk+HNhz51oA4nxYVx9OT1QMyJFX2u+bcgIHVvMYslBWpNQpdu7f2GrxVCER
         +NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688953; x=1793293753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfwVNjBinLhECyFto+p6qJ9Qf/67yX4e3W2C93lJd7A=;
        b=OsYu3lgyk4ybyOC8X7DyF0qboGmNbTSvXJDI9VqLgJB+KOiCF27/Ns8cssWcIAj96u
         ZaHtOfZuLguLxlk3tiw/QLf5mJ26FjttQLVsij7YI7AvLFl+50EG/jyWXcL9sZTJaj0k
         L3KuPQ6MCejSorhHQzWf4h0OhO5caTQsVM9L3Th7YSr3cR7L1Z5JLQSJaqeFAZIJjPlq
         0Onv6I5MVvDAgKvBMwrpmsnZtAhqOIYsUpxiXj+w+zcNCtxfTLmwBl1+wJJGw0gOvqio
         Hq2DwrSyxDQViFsOd8/MgvkVbyQNQYCsk5TmUOz345ezrzzpErKzOt2Sm5fo2ATYtp9i
         xUBg==
X-Forwarded-Encrypted: i=1; AKwUvBxXDAqSOAG4z4cjfdbrA1AR3tYcnSBy6hUK4MEWZcL19LaGGeQOqcIodt0LmSeK7RNuM7MRFAl/RPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwtMcGX7VmMrTCKVhVzj5A6JvkvO7YetfE3o/8X31jCK6PRzVg
	pgsXHtMpMtfdCMCuECyGGuzK1+7tY8MaH0YCH7GCXx9F3musqUDapBealDz+axc5u3WWSaHWAZ5
	Ug7WUcHgyJkp7nWl7VMYiBvmTUUfKlB8=
X-Gm-Gg: AYBFou1AiT8ZmblyxN/PQMvCVCpJ96v3KHFvQiO0SRldnqMS3LsTV6yHdml13AyqLQl
	EWr7Bn1ywhFhx6ME+P3bejLmkHOqca0xoHvl1jy2bxcMMc1eT+ocCmXhWsWSziuD7k7VFl86GZ5
	ty1lEyjamTw0WhWOQewoSR2IdTHtt5BAV08qaBtZoRCcdNRC2tJzSRGZyn50RbyIpJcvamnug37
	bJ1LsJqIUH54M6TLejWQVAv+WvToO5zuTm2nOWlDSkMDsGOIVPFKVBvFSlpUIraZix02GP8/qjz
	zBdI55BPX+YBJcHVihjiBRCadAKqyPubcvpEtEa21GfLb3DJiaeiJFqyqtEmIjoVH0UAwr7Kpi5
	j1j0vysspIrIzUuiTzVJ3Ray5Pon222odVD7SCwi2MqtReRwquoUlO3FlA81+a4JjORVrjAWF0f
	JXoqRjjBqA5XuTnw/fUF+71juIbfv2pxVat3lDgdQOMU30Brgq
X-Received: by 2002:a05:622a:13c6:b0:535:127c:da40 with SMTP id
 d75a77b69052e-5369b43ac98mr94537041cf.4.1792688952819; Thu, 22 Oct 2026
 10:09:12 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org> <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
In-Reply-To: <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:09:00 -0300
X-Gm-Features: AclHuK8MKhFqv1-o86xCTgtpKNiTMbzIKd3UQBTkUEoNRn9kUQJAvh3qiLz1k7Y
Message-ID: <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: dzm91@hust.edu.cn
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:37 +0800, Dongliang Mu wrote:
> So my suggestion is that, after confirming all the translated
> docuementation follows this style, we can delete this field and write
> this relocation style in the translation guidance.

Hi Weijie, Dongliang, Alex, Jani,

I checked docs-next. it_IT, pt_BR, ja_JP and ko_KR already mirror the
original path for every file. There are 14 files in sp_SP, zh_CN and
zh_TW that do not, for two reasons:

- the original has moved and the translation was not moved with it:
magic-number (now in staging/), gdb-kernel-debugging (now in
process/debugging/), security-bugs (now in process/), xfrm_proc
(now in networking/xfrm/), memory-barriers (now in
core-api/wrappers/), and the three gfs2 documents in zh_CN;
- the document exists only in the translation: glossary.rst in zh_CN
and zh_TW, and how-to.rst in zh_CN.

So I agree with Dongliang's order. For v3 of the guide I propose:

- state the path mirroring as a rule, since the language switcher and
checktransupdate.py both depend on it;
- describe ":Original:" as optional and not needed when the path
mirrors the original, instead of showing it in the header example.

Moving the files above and removing the existing ":Original:" fields
can then be done per language, as separate series, by people who know
each translation. I can send the moves for the files whose originals
were relocated, if the maintainers of those translations agree.

Thanks,
Daniel


Em seg., 19 de out. de 2026 =C3=A0s 01:37, =E6=85=95=E5=86=AC=E4=BA=AE <dzm=
91@hust.edu.cn> escreveu:
>
>
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: "Weijie Yuan" <wy@wyuan.org>
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2026-10-18 11:40:09 (=E6=98=9F=E6=
=9C=9F=E6=97=A5)
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: "Daniel Pereira" <danielmaraboo@gmail.com>
> > =E6=8A=84=E9=80=81: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <s=
khan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>, "Alex Sh=
i" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" =
<dzm91@hust.edu.cn>, "Chen-Yu Yeh" <chenyou910331@gmail.com>, "Federico Vag=
a" <federico.vaga@vaga.pv.it>, "Akira Yokosawa" <akiyks@gmail.com>, "Carlos=
 Bilbao" <carlos.bilbao@kernel.org>, "Avadhut Naik" <avadhut.naik@amd.com>,=
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Jani Nikula" <ja=
ni.nikula@linux.intel.com>
> > =E4=B8=BB=E9=A2=98: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for=
 translators
> >
> > +cc Jani Nikula
> >
> > On 2026-10-15 09:56:42 -0300, Daniel Pereira <danielmaraboo@gmail.com> =
wrote:
> >
> > > The documentation has seven translations, but nothing in the English
> > > documentation explains how to contribute to them.  The only guide tha=
t
> > > exists, Documentation/translations/zh_CN/how-to.rst, is written in
> > > Chinese and covers the zh_CN translation only.
> > >
> > > As a result, the same problems come up over and over in the review of
> > > translation patches: labels and citations copied from the original,
> > > which are global in Sphinx and collide with the English ones; partial
> > > builds with SPHINXDIRS that hide those collisions; lines over 80
> > > columns; translations not added to any toctree; missing commit
> > > descriptions, tags separated by blank lines, HTML email rejected by t=
he
> > > lists, and the documentation maintainer left out of the recipients.
> > >
> > > Add Documentation/doc-guide/translations.rst, a guide that covers the
> > > whole workflow of a translation: choosing what to translate, the layo=
ut
> > > of a translated document (path, header, labels, citations,
> > > cross-references, what must not be translated), translation quality a=
nd
> > > terminology, adding the document to the build, checking it with a ful=
l
> > > htmldocs build, checkpatch and checktransupdate.py, preparing and
> > > sending the patch, the review process, keeping translations up to dat=
e
> > > and starting a new translation.  The commit message format it suggest=
s
> > > is the one already recognized by tools/docs/checktransupdate.py.
> > >
> > > Link the guide from the doc-guide index and from the translations
> > > index.
> > >
> > > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Drop the Assisted-by references from the AI tools section, the tags
> > >   example and the checklist (Weijie Yuan).
> > > - Use a plain path in the ":Original:" example and drop ":Translator:=
"
> > >   from it (Weijie Yuan).
> > >
> > > v1: https://lore.kernel.org/linux-doc/20261013003702.5824-2-danielmar=
aboo@gmail.com/
> > >
> > >  Documentation/doc-guide/index.rst        |   1 +
> > >  Documentation/doc-guide/translations.rst | 694 +++++++++++++++++++++=
++
> > >  Documentation/translations/index.rst     |   3 +
> > >  3 files changed, 698 insertions(+)
> > >  create mode 100644 Documentation/doc-guide/translations.rst
> >
> > [...]
> >
> > > +Anatomy of a translated document
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Location and file name
> > > +----------------------
> > > +
> > > +A translation mirrors the path of its original under the language
> > > +directory, and keeps the same file name::
> > > +
> > > +  Documentation/process/howto.rst
> > > +  Documentation/translations/<lang>/process/howto.rst
> > > +
> > > +Do not translate file or directory names.  The documentation build u=
ses
> > > +this mapping to add, at the top of every page, links to the same pag=
e in
> > > +the other languages; it only works if the paths match.
> > > +
> > > +The file header
> > > +---------------
> > > +
> > > +Start the file with the same SPDX license identifier as the original=
.
> > > +Most translations then indicate, in some form, which document was
> > > +translated and include the language's disclaimer.  For example, the
> > > +Italian translation uses::
> > > +
> > > +  .. include:: ../disclaimer-ita.rst
> > > +
> > > +  :Original: Documentation/core-api/symbol-namespaces.rst
> > > +
> > > +A plain path is enough in the ``:Original:`` field: the documentatio=
n
> > > +build turns ``Documentation/...`` paths into links automatically.
> >
> > Oh, btw. There's a comment about ":Original:" from Jani [1]:
> >
> > | I'm wondering, are these :Original: fields useful anymore since the
> > | translations extension adds the button to switch between languages?
> > |
> > | The pretty much hard-coded expectation is that the English version at
> > | path/to/foo.rst is the original, and its translations are at
> > | translations/xx_YY/path/to/foo.rst.
> > |
> > | I.e. neither the HTML nor the RST benefit from it, and it's just
> > | repetition.
> >
> > Perhaps we could have a bit of discussion here?
>
> Hi Jani and Weijie,
>
> if all the translation documentation follows the relocation style -
>
> Documentation/XXX/XXX.rst to Documentation/translations/XXX/XXX.rst,
>
> the ":Original:" has no meaning, but actually this convention does not wo=
rk sometimes.
>
> BTW, tools/docs/checktransupdate.py uses this relocation style in the zh_=
CN translation. When I try to test this script in other translations, this =
issue occurs.
>
> So my suggestion is that, after confirming all the translated docuementat=
ion follows this style, we can delete this field and write this relocation =
style in the translation guidance.
>
> Dongliang Mu
>
> >
> > Thanks.
> >
> > [1] https://lore.kernel.org/linux-doc/c719c6756f345c6c39db483654578ef09=
de1948f@intel.com/
>
>
> ------------------------------
> Best regards,
> Dongliang Mu
