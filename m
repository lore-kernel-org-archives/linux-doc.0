Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F4433A0
	for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2024 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726406484; cv=none; b=Cqo3v/EXnS20P+zfk7LjkkEgGti9CvzfixSzKHYVl12sS7Hy4AUzPBzMYp9vnES7cAaBr4aZjLnifg2a/3obYoZ4SU3A+eAYeuHMl6nRkFx8fkY22KG+AOLd5EFLgPTiHyaZ2x/kCC1ud3iN8RoFKptC74fTOPrzsgIuBoJceHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726406484; c=relaxed/simple;
	bh=GfO/oz2A9b6SDmugsKsJ70i9S+s3DyK2oJV2MQst5Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMKsi83XON6jXQwAADTFj0Srs3aMj2J2Hr8QiQS6nrT03rkQhk0On33FzlVyFWqJxIQHprica6aNQO8aSyHbGTchiF6z3C3jetMTRzJFx6BNoHlhHfFN+JHTX/GfH3A8C8x9bSGoiSTxcdK40sQhryW1UnKt0dfKQu0l7uZUOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbdNlDTb; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbdNlDTb"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-277e4327c99so1305686fac.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2024 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726406482; x=1727011282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gN1S+vh//nH7X7/JOGxn+rOg0S8OhrMdQsADI0GagM=;
        b=MbdNlDTb3TdCSrx5uvDQLRGS6wAaoI9bUKDwoijHVPr7CHk5XyKRHJHnynLyrNI0W6
         WOJFj+Fr2g6hb32s5BzTO3CUzV3Cs5vyLpYjR02540shKpWWBbOhHe/qKOQ+n5yW0DMU
         qbfpXOSKtfQTtNbAd6Ms/rJptRCJi5KWCWFBiuDev/0eMXSr0iVUuFP9dt6znx+5tGU5
         ovrHbyllmo2gX+P5XWqcJB6Kew9UDw3v+fsk8nQ0Kb3rQv6Nt2CLDvlpxZT6l4BGUpME
         M7uypKYx7ksYobWosQ/0sgA4nX3rqWv5jGw5Q1KBQofPfD2DVFsoul0hETkL4aVS09s0
         9g3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726406482; x=1727011282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gN1S+vh//nH7X7/JOGxn+rOg0S8OhrMdQsADI0GagM=;
        b=JK9S++ByAC9zIZvAgmkMGPM6psqlskOP78w84bKhi5gFlYzzpLw0o5qK/abd+4l58N
         gzUostCo0HKQRgT3D+T+XQ9YNP7SauPjsBcmYydVLvYQgkcVijAoVwxwxOW/mAPF2IrH
         ARgRpa9VDnVxJbeIFqMcd9X8HvClhptnSih6q7T3uAtUaz3gX+cPK0lXRunVza/itb0p
         5g6ziSX3rcJo++jsrT0iVsGbpif9V7YBej43FPIjMcfEj3yOiIAr/qt1XSeGubXshYZr
         bjongvsd1852ocYrq9cWhxUC8okRwOgfnaEEjQ3wfwmXjsXu0wj5Xrn/eBNSsiN6m9bv
         vFmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhkTktsVRh802LVrF23mozKGF4aOsuN3Y11mxaLMpXop2hze8A6hhx/ZKzqlJZEUoLr3xSsFGs+FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjpS6p42YCleyR7xz2P6wh5An0ev/gOZBR1dYLm9mDLVXSiUQ
	KUUQcIRS3dxnKpXG90Dt9LEi2QgsXRP7OoaQLg9W14NrsyI+sK+DqmrmAtlZlEYsgUdD+BdzjUs
	G+X9lxEFeGt3jV6mEJaZRm5sZkTQ=
X-Google-Smtp-Source: AGHT+IEU9Z4YrGFLUbg8iN0zxnmwns97KqROvYQWlPyj7oMOlMn+t4bVyk8DmJWing5pKNuhBr40c+eOO1uIaHHtJmE=
X-Received: by 2002:a05:6870:7187:b0:270:1295:af54 with SMTP id
 586e51a60fabf-27c68a262b2mr4995491fac.28.1726406481914; Sun, 15 Sep 2024
 06:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
 <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com>
 <c8eeba2b-99cf-4b4d-a8ab-145b7266cef4@gmail.com> <CAD-N9QW1cdpmcXEb9bWj-ezvH3Mi52KGcAyq_6iqqTjr8tVjDw@mail.gmail.com>
 <bc5e5979-7c8e-41e0-9c94-9877fde9caa6@gmail.com>
In-Reply-To: <bc5e5979-7c8e-41e0-9c94-9877fde9caa6@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sun, 15 Sep 2024 21:20:55 +0800
Message-ID: <CAD-N9QX1iE0kvf2sApyQ__PBY0PeeCbyCfvT-g+Ktz0BaY-4hg@mail.gmail.com>
Subject: Re: original file finding
To: Alex Shi <seakeel@gmail.com>
Cc: Cheng Ziqiu <chengziqiu@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 6:38=E2=80=AFPM Alex Shi <seakeel@gmail.com> wrote:
>
>
> On 9/14/24 9:25 AM, Dongliang Mu wrote:
> > On Thu, Sep 12, 2024 at 9:22=E2=80=AFAM Alex Shi <seakeel@gmail.com> wr=
ote:
> >>
> >>
> >> On 9/11/24 9:29 PM, Dongliang Mu wrote:
> >>> On Wed, Sep 11, 2024 at 6:11=E2=80=AFPM Alex Shi <seakeel@gmail.com> =
wrote:
> >>>> Hi Dongliang:
> >>>>
> >>>> In scripts/checktransupdate.py,
> >>>> def get_origin_path(file_path):
> >>>>     paths =3D file_path.split("/")
> >>>>     tidx =3D paths.index("translations")
> >>>>     opaths =3D paths[:tidx]
> >>>>     opaths +=3D paths[tidx + 2 :]
> >>>>     return "/".join(opaths)
> >>> cc +ziqiu
> >>>
> >>> Could you take a look at this function?
> >>>
> >>>> It use a different way instead of the ':Original:' line to find out =
the origin file.
> >>>> That may cause file finding failed if we have a different dir map fo=
r translation.
> >>> Yes, this is more reasonable. BTW, is this enforced in the Chinese or
> >>> other language translation?
> >> It should be used in all language.
> > Hi Alex,
> >
> > Why can't I find this thread in the LKML? We have cc-ed the linux-doc
> > mailing list.
> >
> > Jon has different ideas about this origin file finding.
>
> Hi Dongliang,
>
> I just copy to linux-doc, not lkml. but Jon could see the thread in linux=
-doc too. He reply there may just because more people in LKML. :)
>
> As to his and others' comments want to do further check, to confirm if th=
e Original file exists. That further checking make sense too, and could be =
easy to add, isn't it?

+1

@Cheng Ziqiu , can you take care the v2 patch which checks the
existing of original file instead of using original tag?

>
>
> Thanks
>
> Alex
>
> >
> >>>> Yes, we have no worry since all of them are same. But could we take =
the ':Original:' usage for a possible dir map changes?
> >>> Yeah, at least we can take the current method as backup for original
> >>> file location.
> >> good idea!
> >>
> >>>> Anyway, just a quick idea.
> >>>>
> >>>> Thanks
> >>>> Alex
> >>>>
