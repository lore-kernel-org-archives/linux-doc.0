Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635D1C32
	for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726277177; cv=none; b=dJ+9yRyZl2cfTX1xCQiTkouK4gL6gB+GYcoEY9F/btlRj1xSjDP3JMuMh9nFDYzsSOs1AtI5siSdDCqYJMP4TekYFCQcFWlm+NivTYaDcXmF5awM5BhHBITKUsmrWbkT6Gh3FzCQpAC1h52Bjmp/iFjRLJ0nFxGyUQWjCGfehyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726277177; c=relaxed/simple;
	bh=bGF0ZZkqjb9cy6ahRbU5l34hSRO90C3GGZ7Hm9PS9XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlYbgZBhKy+b9daPapszcwv0TzlNfCqx7ANxM5vnkDCJTTfI+/YVohJiywCiZgfq+oXvpIhCLVe2sboApuoquCevU41EPubo7I+3+mjPNt5uFek1Im4EAmZc0XPcV1HR+b7oSPHXjBBkgh5Pr0sTkATIuHMSmolCzvD9HchY8GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VODqzijB; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VODqzijB"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-27b7a1480bdso1237106fac.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 18:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726277175; x=1726881975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu4dx5V6e14gPWRXDPQTE2r/Ot0rZku1c0omrTWQ0is=;
        b=VODqzijB8OLm3DQ/Iqlu2yOy2WoY+TXSzfTccLXBItjzQ27OtiZh1scyWoris93pKt
         m7s5+vWbhbberTjP8l77Tl6zVbQi9/dvrp4SakqvVFeETljf8M7yDoVkV9KvX4Zs+88o
         6sVEDEt4gBoU66kECOYbqkhr8DyA8UyYFaSlV9BqMw0OPMfBAdj0+9syq+HrIvVFFmH1
         bpMT8e+8LLbtRzChVlsz6aKv+bXah3RKcjH5RqXSU3EFANmcdVuZWq7fFVFiRYiEDP0i
         X5dwuf86gPxdjc33M4iVYUsMrDXjiBvFFBAJdEdt5Qkf9V5Z2gnkd+kEI8v8AwElrHPx
         Gvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726277175; x=1726881975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu4dx5V6e14gPWRXDPQTE2r/Ot0rZku1c0omrTWQ0is=;
        b=l+ZBB8KoCVvRb0onYJtkq6Z6SDRZM9qEEzzkuQ5TnuI5NdqKec69on3wd7k8Ty6ivD
         WM2cFNZJt1qgZaW9lLpY8YBnSrH8AL9iInuIsaWsANe+9j039btHIPW3sJ7DB1zMYCfa
         bu+Lc5GfZrNwkqeMIU9iS9pyhQCFQ5vo/il9uIKQXcg2I9BXaXQx50DOnzEef1VzWb+E
         tYv/S8M2GEyPizIeDTnHMwHQijL/kQ+mxLutk4Y4t9GcvcWOBj8tMn2H0qGgUSTmM6TT
         deNX+WWhNH7uWimzAeAUgm88XKzCw+yK1IgZYsugrRILXMvw+EEuPfhpHXTVKy0HS2x/
         BZHA==
X-Forwarded-Encrypted: i=1; AJvYcCWWCLl3kg4Lf1XHLJBVcd1RS2owwaPaNep7X1W/BgEjgly1q3+fnjs19HqSaHXcC/cPh+QRfBkrtgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWt3aCs6jFmn8ACfp2BzoDWD8NkYzol+OH5UtrE7rjE4rkyHRy
	0twwrYW+MBwmspgBiykwN00fWLtZYkceZS72RPofUFX3/xNCqUBfM82FJkec1NPYIHq0lS/Ul+7
	avz68LbbpJ49NWVFwrf/XeH+xPcw=
X-Google-Smtp-Source: AGHT+IHrz72MVEVu95yBNThqpalJJX3gpbQTRFlwqk5jTPOU8Y4fAJdpQ/iyAmyfSN9SMLJZznck2+Z5bDeg8hVrwbY=
X-Received: by 2002:a05:6870:d181:b0:270:449:291e with SMTP id
 586e51a60fabf-27c3f66649cmr5279275fac.36.1726277174629; Fri, 13 Sep 2024
 18:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
 <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com> <c8eeba2b-99cf-4b4d-a8ab-145b7266cef4@gmail.com>
In-Reply-To: <c8eeba2b-99cf-4b4d-a8ab-145b7266cef4@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sat, 14 Sep 2024 09:25:48 +0800
Message-ID: <CAD-N9QW1cdpmcXEb9bWj-ezvH3Mi52KGcAyq_6iqqTjr8tVjDw@mail.gmail.com>
Subject: Re: original file finding
To: Alex Shi <seakeel@gmail.com>
Cc: Cheng Ziqiu <chengziqiu@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 9:22=E2=80=AFAM Alex Shi <seakeel@gmail.com> wrote:
>
>
>
> On 9/11/24 9:29 PM, Dongliang Mu wrote:
> > On Wed, Sep 11, 2024 at 6:11=E2=80=AFPM Alex Shi <seakeel@gmail.com> wr=
ote:
> >>
> >> Hi Dongliang:
> >>
> >> In scripts/checktransupdate.py,
> >> def get_origin_path(file_path):
> >>     paths =3D file_path.split("/")
> >>     tidx =3D paths.index("translations")
> >>     opaths =3D paths[:tidx]
> >>     opaths +=3D paths[tidx + 2 :]
> >>     return "/".join(opaths)
> >
> > cc +ziqiu
> >
> > Could you take a look at this function?
> >
> >>
> >> It use a different way instead of the ':Original:' line to find out th=
e origin file.
> >> That may cause file finding failed if we have a different dir map for =
translation.
> >
> > Yes, this is more reasonable. BTW, is this enforced in the Chinese or
> > other language translation?
>
> It should be used in all language.

Hi Alex,

Why can't I find this thread in the LKML? We have cc-ed the linux-doc
mailing list.

Jon has different ideas about this origin file finding.

>
> >
> >>
> >> Yes, we have no worry since all of them are same. But could we take th=
e ':Original:' usage for a possible dir map changes?
> >
> > Yeah, at least we can take the current method as backup for original
> > file location.
>
> good idea!
>
> >
> >>
> >> Anyway, just a quick idea.
> >>
> >> Thanks
> >> Alex
> >>
