Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DF37E2E0
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599346; cv=pass; b=L8CJnFPPipoJtbk4wHXRza7+nzzCcXCb1pLp3oseHQhRcE0bYX/SsO8N33DE7NE96I8vfBdLJ1CTGnsusQLedV1t7ONYFU08p9yQ1PW+LhR0DSaJT33FtUh5buyCkMFIcb7uEou+FSxrzooflQga8iYDt/KS+JG23LgCdKRYzPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599346; c=relaxed/simple;
	bh=GMqAJJvoKZAxTYL3ppmWAG2jFmXFtUvCYSYB89m0cuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1iTt7vB0yFs2Y3XDS7ak/l2sjiVKYMU2gaUMlurqX/BlUKdoF/XJ3od/ThWQOUHOjTrI+iVLklQfZhjtfy6AiYbRVAXxqFtquO/pp05TD0HVoLCofzTITb4esBoOShgaqr2PCJ6hlF4lHaax6unrorA55gPmY7gUX3wm89pgHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwUVAJn6; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwUVAJn6"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-393925cb1baso58255081fa.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 08:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599343; cv=none;
        d=google.com; s=arc-20240605;
        b=GT+94TKL86XkeH1SYa1184rFhkHKwHrpSLxhWZ0zP0+LSWDCjwWO+XbMx4qPBKt76b
         YXaYK3UnBOSmvZtkL4Hdrq9FbvA0MUyR9BvmW5YhRqdTtqeHKchBR1Z3EDJ3Voz84Da8
         5lwdgalhXWTXDdDTxpX/W4k6IMShlVj+OU//n6OmG8SvayDOPAgBOeFr7zyJOzZGKrTJ
         dHM8tzLxpV40vVU5dHKI4+4B2UYvhgVSgHtTXswywBoG3FQwu7SPldMkJrm7Bpy4+6yW
         CttMfdqp9vPda8JR1EKcOkC9CwuCDfUuwWWq8a7czm7wr827iVU6c34H8ORp10BKeMyL
         DTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        fh=nf7YusJmlxFyWFFJV/3/fFQRnfFTeZenygYeaLg3BrU=;
        b=auiAI4kBDWgbeafU9aR1B6kkmrj0xQH+r+CsYo68HbRYk0zm/qQhos7R6xjdpP7R6f
         SWbRCRq2HCCs7vys9AJiwX8ahz57OpKs9gbSQb/Ul+3wJ2oWvVyjiXzxcfz++hqU9Qpy
         S0hTF++RuRwn4VovAAjqFsJGJ7MX+BdgWhcLj+JNL+RVYJIKFbGy6PruwVBHLSM/ZiUE
         ZEhHByhb9pLTEHCvK7wMGko4iORZ8DgECbkIb6gRJPpfuuxTQKIZqb30cibXsWI/NL6j
         1u8ggF7SLnvZzJf5DFcyEf3dfyuRZDZpz09rU2fcosilfo8A8xAp22izAMtMRg6mih4x
         HLBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778599343; x=1779204143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        b=WwUVAJn6TU0n1lhjNkg83Am9aNZjarCevbakj6oeB+Tvu+0J8GiUdLRXdietxAtfKx
         3H0tZWr8Cz99iH0jZQQEXB7v+238cE0JFtUoNGTsVKwgkjm8CHmQ5a85uhpG4boU1uCZ
         e4kt9wJQt8coalk9svMaCv1RvBwF/u0ngiooU0aTm4CYFdChG7rn9irw55njL90FtPBM
         L6R44fcVtWsEn8t6oOSV6qKUzNy2DrpdSTjQYUDYekV48KuTasWB5/Onr0pNoPGBpuxg
         ulk5WO4E6JWsGI5JCb2lDRhzFIRn5VdvYWMfQIVD1gH+9mM55eSQNqjYG1mVHfiFilUr
         HqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599343; x=1779204143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsL/9p+qUWLijfBeysWK9OThhTiEfsjo8MZi7vGSKvg=;
        b=OdPGYKgtpt0XixdhYrLxcLgEP+bbbEmYzyWIrmk4ojdn7yViSXkwi/qw0/Hz5bFruJ
         Z/NBW9qpPtN2PNwppVmSEttf41fgCxzZ9Ene/SbQBzMu1PMnUG+pYgZNQ/3vVlOGSLyJ
         NDc1RozDZAROh+ukfus6B/Afov9jWeKpJfKGsgS5ajjd7yJ88kXh5TrG3yMz4TE+ZCqP
         2sEr4Bv5gUnmGiq3NUPp0KEHdwkgLLiewBXhMOpCWGy2MLsUFWi5SHkcLvJ6aJTFDOIV
         Ckrr1pLwKaCpg+U+KZ5H9xp0QyZnRtBf1ol6oli0pmq3FnkEFTPLFyEVYkrz+9meUGLh
         3+NA==
X-Forwarded-Encrypted: i=1; AFNElJ/BaJuYboXqqFpUymhJVG1RvRPlR4hU/EgSC44pA1hFaDeuDerQqh7sC3O4ibah/HbvOMdw8I701AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUpePRHtsPgqW9AaMQBSv9CllQ3xTTeBeAiVIAouLDGUBrkIye
	gOb863Jem/uWq7Y7EtDAdjDOjZfLTyvCMEtbOx3IcEAvKRR3pjkdlpzSFLHRR0bPJB60VW4IJb8
	OpQ9qduytE3HKquUCetMuaFGOuEbDy9E=
X-Gm-Gg: Acq92OEVMMFnmwZTfv/ShiwETuw4igobo1JqGshTO44JRsjBIX0SZQdZny4H2yYv7gV
	sqaBswb627cyLk9t20cZ+11Yrgy66OjXl5ak9UoPThjByzyt7PPYzxbyN9MnlVDJ1YDHP0r7Mp/
	u72p2ADNIYKdLawYChyFiQHHArjYhOcNXfAUu9ZGenaUlg3ixhvYy2C19mWfJqVI9GVgvynzqsC
	+i0O1fqBJ2UPDe4/9V0c6jtXZ9IdT0pNTJSd0HGhBVnWbrP2Af54bKnAPk1L7VWwK69dPXFsd7Y
	Nz+OvlPwrkErdh8ostvmfvkYBvinAfCToyDkTRb0VV1tO4c5xw76E8hHH2fafGBdEglX7s4snM7
	iOJQz64yL1clP3DUN8g==
X-Received: by 2002:a05:6512:3b97:b0:5a8:837b:3d62 with SMTP id
 2adb3069b0e04-5a887ae201amr8896955e87.9.1778599342529; Tue, 12 May 2026
 08:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <20260512123953.40d80bc9@jic23-huawei> <agMnWzMjW1LwCSyT@ashevche-desk.local>
 <sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
 <agMvlS3-0wvGmBwh@ashevche-desk.local> <dxjg2sdyxb7ieb4abmeyyye7qok6cczrxabpsjyjhcbehwoec3@sbbqoo4wmzre>
 <agM8pWrM6j_XksvN@ashevche-desk.local> <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
In-Reply-To: <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:21:44 +0300
X-Gm-Features: AVHnY4IJuef2B-0A9_3FnyNbZ_uaS-SA2cTNaTffveNp5l_4SxlZqwsSXVNYeR4
Message-ID: <CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and kstrtodec64()
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Laight <david.laight.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 6:11=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 26/05/12 05:43PM, Andy Shevchenko wrote:
> > On Tue, May 12, 2026 at 03:12:24PM +0100, Rodrigo Alencar wrote:
> > > On 26/05/12 04:48PM, Andy Shevchenko wrote:
> > > > On Tue, May 12, 2026 at 02:21:14PM +0100, Rodrigo Alencar wrote:
> > > > > On 26/05/12 04:12PM, Andy Shevchenko wrote:
> > > > > > On Tue, May 12, 2026 at 12:39:53PM +0100, Jonathan Cameron wrot=
e:
> > > > > > > On Sun, 10 May 2026 13:42:20 +0100
> > > > > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.=
com@kernel.org> wrote:
> > > > > > >
> > > > > > > > Add helpers that parses decimal numbers into 64-bit number,=
 i.e., decimal
> > > > > > > > point numbers with pre-defined scale are parsed into a 64-b=
it value (fixed
> > > > > > > > precision). After the decimal point, digits beyond the spec=
ified scale
> > > > > > > > are ignored.
> > > > > > >
> > > > > > > Whilst Rodrigo has already replied to say there will be anoth=
er version
> > > > > > > I'd like to request final feedback from those who were involv=
ed in the parser
> > > > > > > discussions.
> > > > > > >
> > > > > > > They got very involved and I'm far from an expert in the righ=
t way to do
> > > > > > > this stuff.
> > > > > > >
> > > > > > > I don't think David Laight was +CC so I've added that.
> > > > > > > David, Andy - I think you two were most involved in that disc=
ussion:
> > > > > > > Any objections to the end result?
> > > > > >
> > > > > > I already said a few times about the naming. I do not like the =
kstrto*()
> > > > > > be semantically different on how they treat the input. Second p=
oint is
> > > > > > to avoid code duplication, but this one is less of a concern si=
nce the
> > > > > > new code is in the library close to the other potentially dupli=
cate code
> > > > > > piece and hence can be addressed later.
> > > > >
> > > > > I suppose I reached into kstrtodec64() and kstrtoudec64() because=
 it aligns
> > > > > with your expectations for kstrto*() semantics, no? Those include=
:
> > > > >  - overflow check;
> > > > >  - extensive input validation;
> > > > >  - optional '\n' in the end;
> > > > >  - mandatory nul-termination.
> > > > >
> > > > > am I missing anything?
> > > >
> > > > When we add scale we basically make that not true. Moreover the cod=
e in this
> > > > patch makes scale =3D=3D number_of_characters which I think a bit f=
ragile, however
> > > > it's about the fractional part when the amount of digits is equal t=
o scale.
> > >
> > > That is not really the case. It is being set as a limit, so it does c=
heck for
> > > truncation and zero-padding.
> >
> > I do not see it happens in _parse_integer_limit(). It doesn't try to pa=
rse more
> > characters than it's requested in max_chars. It doesn't check if there =
are more
> > character nor their converted values.
> >
> > > > To make this work as expected we need to add an additional call lik=
e
> > > > kstrtoull() (and perhaps drop that \n and NUL-terminator checks) an=
d see
> > > > if that overflows or not. Since it's a fractional part it must have=
 less
> > > > than 20 (decimal) digits there, so we check the rv (or how many dig=
its
> > > > were parsed successfully) and compare to 20. If it's more, we got t=
oo many
> > > > decimal digits.
> > >
> > > For overflow it checks the KSTRTOX_OVERFLOW flag and leverages check_=
mul_overflow()
> > > and check_add_overflow() when combining fractional and integer parts.=
 The amount
> > > of characters is not really important there. The scale cannot be bigg=
er than 19 and
> > > that makes sure that int_pow() does not overflow. The code uses _pars=
e_integer_limit()
> > > due to the nature of input and to avoid 64-bit division, kstrtoull() =
at any point
> > > (parsing integer or fractional parts) does not make much sense.
> >
> > Under 'like kstrotoull()' I meant something that repeats needed functio=
nality.
> > I believe it's parse_integer() (without limit).
>
> I think we are going in circles here and we could look at the code instea=
d:
> - integer parsing with _parse_integer()
>         - overflow check and validation of the return value
> - fractional parsing with _parse_integer_limit()
>         - overflow check and validation of the return value

No, this is not fully true. That's what my whole point is about. The
max_chars parameter limits the input check, then it skips an arbitrary
number of digits and only *then* it checks for \n and \0. What will be
the result of the
0.00000000000000000000000000000000423 in your case? Whatever scale you
gave it will return 0 without checking on how many digits were
supplied. All the same for 0.9999999999999999999999999999999000423. My
point is that we should limit this by 19 digits.

On top of that, what about -0.9(19 times) ? the fraction should be u64
in this case and it's fine. The sign applies to the combined value.

>         - extra scaling and truncation happening outside if needed.

Right, but the given input may be way too long and still needs more validat=
ion.

> - check for input termination
> - combination of integer and fractional parts with check_mul_overflow() a=
nd check_add_overflow()
>
> > > > Maybe I'm missing these checks already performed?
> > > >
> > > > > > Having the test cases is a big benefit, and that part I like th=
e most.



--=20
With Best Regards,
Andy Shevchenko
