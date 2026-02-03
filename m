Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB08C318121
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141569; cv=pass; b=GYwkhu4OrLtTTYzNJ4qG+BnZOlF7wS4W7x+4f8Ezs/gQi3M+aUw5/uMJHD5mOXbyGzMHHlDaAUYxSuil84Aa7UccokwmqKUAO56zAGBHTP77KiLzzN7HhFeczHHZaEhiFVUVbJpP0Z8MHSCrQh+FDXQENK+OGVFx/LgXd+1HC3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141569; c=relaxed/simple;
	bh=9fabEn3BR0RwuTFhSpl1L/jn+/EXTCHI9kU6QFmbrCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=g1Cr5yqzHRnd9DdrnnjJZPzkzHsvGqEYTXkymKD3c8XHyvmF0rZwLhPWlIba7O8E5h/klwxf3aop0+mqXgSt15x9+jPbeXPdEE+fGQt6gx7a+PvRU0DkqkgXY6tUvWAmmqGI9GSYvsPOBppQ1yNA/4QERGoQ4+MTtITAfc5cr2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5gqIhwL; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5gqIhwL"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d18dd2adf7so3493563a34.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 09:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770141567; cv=none;
        d=google.com; s=arc-20240605;
        b=PFBdGwoMhdTEuQrG3DPAlzgk9aWEu3fj2kNturV5zDOGvkOQtUwYgbivrmF2gh2mt6
         JUhLQ82w+qyUAlCMqgxtlNB1i5WOeecexMvJw1i7YcMr03VyMHaGONbfYoHxRuu9e9Te
         3sAzyOISbnhr3RkCRMZruvio5oMEz0QqJUa+e8US4Sn/2SjBPIxyW+eUKjHPT+3mkf00
         tDFUGn1AHhZJUEn2o4xShERoh7cUx5J3FWAnif+3xqgsouzNrGmqfAP50WbqS878+ykE
         mdZNHPVSsbnjLfp2vm6RhAW84EZwFcNXrAQb1Ht7tuT8rRrDLrmQCO24LKGsyVhWxmkS
         0kHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qFxkwXHD6jJaWT3Ofn6INAyI5KHtoTIXCgqynoVoNtQ=;
        fh=EiJZbcvvZMhoGdp2mSJeumXAjE90xVMLAXbfg5UhJS0=;
        b=kzA8AMgaHXUvc+/134nuPjZOLWJq10BSn2uYePp1PZQuNpEDmSGL71jQ8qooPInQKG
         JWhkIzwbPWO8ZnkYajujAlmTkZeoQvaC4xPlHGGgYZGJl3FnWGxoBCMRox54GcGYHUAV
         pw7sWlUq2U3Er5Qu47T7vyvl93Odk16Getxfr9uMyCWn3AnacSHYkn7PhE86BxAsrwnb
         X/NbtVGJ/utKLCF+szgtop7jH3ekrFo3x9wsIEZBeeb5huRChV5qzvPdz7lhqyf1TV7D
         vKpZJAA60D7g7mGGqMmMfNlQWWWwImOMdYf0ZQVX4Qo1IKhG0ViDe2iK4zET+VsuBolx
         YJcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770141567; x=1770746367; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFxkwXHD6jJaWT3Ofn6INAyI5KHtoTIXCgqynoVoNtQ=;
        b=V5gqIhwL72JkWgbPCHNEpsmYRHJg3P6CA0WVVXhK8Dju1wmI0MXL3toihN26Cc1UmN
         uPk+4C4pDp91YckpqVOPqovp2U2ZY0Cpmn6MY9E03ODBfduQuWvUiTYgy2LMg39e2Vh4
         j+MpCRxhfgJuBTwIVBM1NaFVYmJXwNj8Q8NW1tpjieyB99wd5hZdpwg/2VKkj3PhMo9e
         3jX9pJdTT6zaLgJBxpA0vDBhMLuDnFsNfEiW6jKnqzE08cw7KlKB6bLjk9HW/6Hs4kNy
         uG6n4/bTOUxoxEGq3EUHSSB0qdVtahob6e08OgsWDzBny/eWEmrniXJeiVnjKOG1Qdey
         84JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141567; x=1770746367;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFxkwXHD6jJaWT3Ofn6INAyI5KHtoTIXCgqynoVoNtQ=;
        b=Tjqau433hIYihWOnlVI0iNFt8hWIlnln2FWR9nEsmnTfrN/kahzKCBINmYla13PCtX
         elB4CzyyckMBs01+ftSkvyiVCoIBTlyUyUGe4va+r5iOgtPnXf5MKGx55cZ5qpS8X7Y7
         bZN1V0ePeXZfHR1Bbm7RVAh1lhH5ojh2Q6cPEhL4ensfOucT8v2uL/dA4kG4Pl0puLGL
         uW6+ANNwI9NYg0KB0Q9fsdIzB52GYaj1CrYtIQYzOrXoRobrhzH6KJIpu3qSuXAFIyXY
         h7DQs0jYDzrHjakFwW0huYIT3k3AJCO/L9OjkymrALJwUcYIqxPr0AEcF0t7JtL7n89a
         qVhw==
X-Forwarded-Encrypted: i=1; AJvYcCVngsalgOJP5NS789MDomARJRTdoDjE29pPruGIdC/8J+EeMafIOvQVZvJUl3Ct7JeoQPpTDgN1TiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6AdlfZDE/X7OHR3VkCrTJR9n/52i9xQMwhsls3m+rbciyTjM
	W4RZXoDworPfN/XRbv3Z67pf8crUoCb9Sbty5N5r6uzVChOA2QsRK+OHOh4uDSjXZXl5dnOtSyh
	tUo9Utf1nK05boW5bWT3EZ0KxnjZD4LU=
X-Gm-Gg: AZuq6aIuvD9UjHMx9b9NPKZHLJ4Nod2s+DKHSpHv5iXFlVPs73EYJ5tNeUS2YVV/Cre
	gvOJuUmrlhWVNElN5BKl93LtguL98UBWAmK7/lJqfJj2AiOjMzaFE3rzekQ6tYzHj4XCG4VVMVo
	6gzs+DLAPO6i3p6Rb0+ZDWAMiNdZmEVafJ7t5fUheGlCgzn8I6W9u9OEFbVGaGpiGMQy4/tVQjS
	BDMUrGPd/Aa2BKJvMXc226kAoxO5iEXVckmbw6hQSuQmsSO+5verR47jEoHDOYRO2nomWhpoEgZ
	9n1sUdOdiovIP/cjxu/sZhob77NE9+l61VfA/A==
X-Received: by 2002:a05:6820:62a:b0:668:d715:109a with SMTP id
 006d021491bc7-66a22f4a7eamr212876eaf.60.1770141566597; Tue, 03 Feb 2026
 09:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203120859.65735-1-danielmaraboo@gmail.com>
 <87h5rxrhk2.fsf@trenco.lwn.net> <CAMAsx6f0VC+BxWWuezRK18=2+X6dNwLDccr_vf8-ONOpBQ1WAQ@mail.gmail.com>
 <87qzr1pwx4.fsf@trenco.lwn.net>
In-Reply-To: <87qzr1pwx4.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Feb 2026 14:59:15 -0300
X-Gm-Features: AZwV_QjUthcfYFNMsf06pJhd4xSM-C6v6Psblws-0gF5qfqeRL_CBUvMplTBTZc
Message-ID: <CAMAsx6dcHF_q5ALYr93=tFMYhjTmjPn7ytsARkU3XmEEz9r+0Q@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: add initial Portuguese translation
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 3, 2026 at 2:19 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> One other point of order: never remove the list CCs.  We do our
> development in the open.
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > I have addressed all the technical points you raised. Additionally,
> > I discovered that pt_BR was missing in Documentation/translations.py
> > and I have now added it to ensure full build support.
> >
> > Regarding the role of a maintainer for a new language: is there a specific
> > vetting process or "test" one must undergo to assume this responsibility?
>
> Not really.  The main responsibility at this point will be to review
> translation patches; I will generally hold off on applying translations
> until I see a review from somebody who can understand them properly.
>
> > I am a Systems Engineer at a data center in Brazil (HostDime) and a
> > Linux instructor at events such as DevOps Days and Debian Day. My goal
> > is to coordinate a larger translation effort with my students and the
> > local community to provide high-quality documentation in Portuguese
> > across the entire country.
>
> This is find.  What I would recommend is to go through a review process
> internally with your students, then have them post the patches publicly
> once they appear to be in good shape.
>
> Thanks,
>
> jon

Hi Jon,

Thank you for the confidence in my effort to make the kernel easier for
Brazilians. It is an honor to contribute.

I fully understand the point about the CCs and will ensure the list is
always included. In a few minutes, I will submit version 4 of the patch.

Thank you, and I am at your disposal for whatever is needed.

Best regards,

Daniel
