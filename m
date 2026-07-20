Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBA43C5546
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559574; cv=pass; b=GMk4kXeGpELyAZbOKRiVv/ju06uLwAdETIWc87Iu7dMesYIhK8LH5yixAHOoeMv8u07okaK5egCMiHvYL7QET5PDyDt5uOj5aahBDWqMq2WcezaeYn47s+rjZpxJGRLRCCf4Mx+wXo3AxdGK9AFQ8GQL5qYbaxGO89y6pgEyG34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559574; c=relaxed/simple;
	bh=13b2KLhyKKVXh3fNdbiwFzXmnR8SR+ll44DcW3Ni0CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pzl3/Zcz8gyOy0PtrskgEh8UWovmOLi0w3+dzJ629+evD2dVmfwb1O9je030Cv313mSObUHne5n6n+hQOszf/B5am+aQT2xhIX4mckOMX1LnRRI0SXlc3JlCZkXje2EnvFNe6Ykmv2gklp9Yyzo4/PETpoc4uh/9KHJJNf8dsuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR+Ba/ZN; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR+Ba/ZN"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso98833166d6.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 07:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784559572; cv=none;
        d=google.com; s=arc-20260327;
        b=e2mAVKbAlcT8KkRZkOYEz4LuwShQvcMC/hmuEleSV4brXy/ZaHdIshUp1nX+1mLFsg
         GkqnB8kO7/W+DrHxfLdm7fwfSquR6OZxq0aQ1QYaxJc/4+FYh2tnxhIfoIngR6DubE1w
         0JEpuooT9E3IG+59LPJJrgDRdy2GIQ46xc5DEMCDKTvrKhVToNko+KM3X/X8pCo1WvT5
         noeRgYmP1t4mqru3ZKOf1jMLSRTmAZXlhMZrhueCfYe5aQnrgJMv+W3aKe6YwXdDbdFP
         2Qt4EcMV+uPfSh1feqX41rVLRiaGMePLeyULJArfoyh3h4hVkXZFMTW8p5jiqR42RmrP
         NF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eSKzU+GtopN10+nb98knYPoeCifXhgk+W6iQPjPXl5M=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=phf7g3+PD5ftobukh3HgkUj13thKfVlhMq+NPoMQ5aRGT4Mh+WkyqySLcN5n55mNGI
         qgL8zdnDIQKJCFGwG+zx/sCw0rlIa2GErIfDezdx5P2kPH9Y05/Xl87W0XXDW59vZAjz
         8eQrbpE4XPZ/vFKpAbxpDATrO8c6Z1XKRtKYSVqhMpXrHYsaXfcREA6GF8sFQ3W8ENLm
         8SSCkQpWNqeZ8nfxksdIzMdETD9Fz1aNvVhTyUb2qKzb6xCBBY8Wl/J4eo0MTs9j5dlX
         zYzJsDInSbOFF31J+xqDt78EMc9iyvdhWhp5FR1pUOko+gR5GXXJoy/0OASEnUV3x9p6
         Ghpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784559572; x=1785164372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eSKzU+GtopN10+nb98knYPoeCifXhgk+W6iQPjPXl5M=;
        b=pR+Ba/ZNlWfKT/huDvBBiKKn7+o9BqY1ynwB0L1DkBl0kw+zEuhExB4eBzFAulNcWh
         kPINy5Zjd5ShHUt57h05k5SVpYFiVa5UtAMMtJXAtyYWMKdm8uVi/CE7i8VVKRY/3UmO
         w8AyQFjTYTNOwS2J9FTzumnW792vX6sACh/+PC0/j633/TdfcfmBj8rvofXUdu4LAXVh
         RHv+ND1fJ5tdbP3A0MdzNQefzHRqsJCr6L5pqYptJ9wZbSeLCqL0z4Z5y2f/ciK5qHFp
         3RVHCv/ZPJRcwr3skKkGo2lmWIMtsCbMM8pCIu1+G+V7FRITuPE5Ew7m6fsVu87X8D6f
         NbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559572; x=1785164372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eSKzU+GtopN10+nb98knYPoeCifXhgk+W6iQPjPXl5M=;
        b=YtdRoIndj5w+BHlbXa0LonIveLk4esgybQmbtvb0O40Y1n/pwWFZmbjRYC5smm352c
         nDNW+TCBky4SgSdaS3ubJ5lmu8Xfmd0OpHptqY1VLiuzcTNZIhhlrBXOKfZJo2ZjRv+8
         b+8psxH+EFqG0zyfgJZXQmHq/SMuA0q6Z4KcWzjQVPsfqkLa0fKkglsMD7iXnQBScWp/
         HKb/muOBezVuzXEo3vpWDTYwbYWP+CPbeW4e5n28ApSiCmDpArFc2bc+aFCWwxXEzRYZ
         zmF5y7hD7Ci1LhprbZaYxvzDti3sHPnxuj8IyupyQhOEyFhpUeddQkMvSqhfSsLed1TZ
         dZUw==
X-Gm-Message-State: AOJu0YyTwVhmd0lNqrT+prCsWOhxmbQNzn2KGvA6YuJi5SEfJnlns8Pn
	x5DJWjzY2N7EVwGTBbGaL75QbrPf8OSY5lNtujdosg8BMGqFXVJbHrimlbG6gidpyhFCaEUycUL
	/N0vMLrr20DHKHCWDc5YkLXSJQVf3DJc=
X-Gm-Gg: AR+sD106ffw+u3o40O9F30Z30Pe4d9yni2BtHye1qxRfB5u4bYEXMb9aYXa1uIfiQL/
	aE+Su6zzgdB7IdNlbDVZgGAcNbECWEYAx1BS36CpNEvjqmPt/coXuD66/EK/oNsqfBG/MRbCAhB
	Pi+UySLkPLNLb213coYW3Fbi5pxUr3DrizfgxYXJfTgRb8nbWWvZRTtCpydzdP9Kh55sRDZZBa7
	9idefbi8Y1r0xLtNvaCWR+QtFMKrhPhjHGO6lUGi8j15rSWQk0JNt0lMe0r+X5pff3vDTuVMlV+
	+nI3V5PnWHpaT5plNlO67Al2xMAhHqmtPk1V5d2bvVM4Yq8nLt3QR0zuB/K95A2ttghQFsskK+U
	=
X-Received: by 2002:a05:6214:4285:b0:901:7300:c82 with SMTP id
 6a1803df08f44-90778386eb6mr161955646d6.25.1784559572265; Mon, 20 Jul 2026
 07:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716021013.48025-1-danielmaraboo@gmail.com>
 <87ldba5z1u.fsf@trenco.lwn.net> <CAMAsx6cO588DcqAT9c=-7aXWLwzAbjrAp=jJ9Ya9dC7draaPZA@mail.gmail.com>
 <87h5lx69wl.fsf@trenco.lwn.net>
In-Reply-To: <87h5lx69wl.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 20 Jul 2026 11:59:21 -0300
X-Gm-Features: AUfX_mxQr1J5YaY80zbJcIZ1_TuipU1EoabaGkm2FLC0UdRYg3Cal32LDPJEArE
Message-ID: <CAMAsx6e11Vsc5K0s--bzqr1fd=mr-2BFYsLUNs5Frz--TBiUTQ@mail.gmail.com>
Subject: Re:
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 17 de jul. de 2026 =C3=A0s 10:08, Jonathan Corbet <corbet@lwn.net>=
 escreveu:
>
> I think that if you organize the index.rst files as I suggested
> (i.e. roughly along the lines of the English versions) most of the
> conflicts will go away, and the result will better generally.  That's
> the best place to start, I think.
>
> Thanks,
>
> jon

Hi Jon,

I=E2=80=99ve noticed a large volume of new contributions for the pt_BR
translations recently.

To avoid conflicts during this integration period, could I keep the
index.rst as it is until these recent patches are applied? Once
everything is processed, I will make the adjustments to the structure
to follow the organization of the English documentation as you
suggested.

Thanks,

Daniel
