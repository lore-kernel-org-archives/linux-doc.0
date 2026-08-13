Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D502E43F09F
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615662; cv=pass; b=Hl/2lqc79xItOtL3QgEY7dK3bCfF4S45OdJjoaCgh0I88gMVflz4ScOHu+GeA91fl6sw52sdlsD+AyFac907DSf++/ev44Kbp20YUktuJybwGIawIV0XpTDtX+aMnU2gIEnf0pB2kJ4G4U2dar3f7T0MQxiSTmArMwIig6AXHLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615662; c=relaxed/simple;
	bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dj5bL1XBbz5v0PezlW+mI4J9BMryw/z2x21qMR28i/vyZCVhokiQix3DqtWcVBbMNLnhOkZmViexhHzPzNQnPkcRlB0gayNtwTEXPO+22BhjBxf1BkmNjRTvTnZ5wZB0CqN2HilupH+819xP3rwpodspewKImROuBs+3B2R/AEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=dg7UjSgB; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="dg7UjSgB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c167aa9500dso257535466b.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 03:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615657; cv=none;
        d=google.com; s=arc-20260327;
        b=HZhQxtJBpqb69SMPSvEMgkC7hI2ihmtKfiKoBLmcCujNVUVfm5DbxsSHwB/RiRxTiG
         Ky0GnhcQLU0ErYLck/YqoOoSwz7t7XZc2fR6LP22+sw8NwjV6vwHlPiScGe2KHavCf1m
         jxmdsBLzfLXPuOx5b1brXl/Yh/UYayl3mNmFCR1tlLBkt0KDvh62sL2T7IK0fbkZIULP
         X2Ri/WBlye7XhRkGAwp/TEXn8GG/TrqOmUTZsUyXUPQfMgc8wX+4LRy0WHU87YS3b5Mm
         9Esf29/RUI+eT/OxBOtjkG6+SCJ7fYYQd1N/QAzsiDDJiHiLRAUx9retoS3Hyf+d0lR4
         X8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        fh=cjcL3UsUl19umL0rVmzb29zbGkh5WeTaRPCXlsnqV2Q=;
        b=lbNM5CYivxcdEQwOJwwmlsYa7qSaAg0hVbN6PtwDwzcC2h8LDbb3ykDALclVCMUPB2
         D/fPKlbe6xLyGtDQwbSO/X6/Q8QL0RXMwFD6FVw0ASixgSz58Vw98Q/SMBzxEXugAco/
         OgSy7Xki5B3AAtgFluK7iEsyXHOCkH1sr+yCdY6h5A/PDKhLD6x669gcMor3faxYyVYi
         XyEE3rfbz4rkGJDKFzBXAsKB5zXDhWqDSRecNOjvzSbt1/chU/F9745tkIm0dSe3g3pY
         KFm2vrqDjSxUZu3Cy7IEUxTipwXaopNHL1x1BS2HAIg1tIm9MfNbYdRlS67w24ojdfMl
         dpeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786615657; x=1787220457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        b=dg7UjSgBBtyP/sLkfevk8rImllduwyDXtg5rZdculjAl/ferBbzZbCeVE7MfpEu1j0
         zLDoBHtrVit2Zor5wIyYrJ1sYMv0CUnb8HowQj8khqGr62shpBRe9AZntwNE5wFDTdnj
         X6ZEHqvb2dzAejvGnvu+7oNHkj8Zp32AN7K6mzuvfiEu1x8N1WzbSUpB2Qsn7V77bQsY
         hRauv+FVmyWXgS/t49CGX7lx0Htlq9Itil3raNVYk14xAARS/4JJ/zcY7x+4S9ZpKeLw
         c5SjwEdgbXTBLGMAIOZnC5ImDsmiCQTn66MZAp6x2Ixy14XQgkShyz7dkjIuSy4Qg4SP
         CBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615657; x=1787220457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaiz5TR4HdEahKrYQMGYlDOIajjr6oJqXrb2lIn88Gg=;
        b=kurJLxruqNkC9Sa0Ng7cg6UkzRkYB4W1Y2RPqCFSanAhd7ar4FqELziJHGHkVMz/7l
         6lKsT01C8jBvNfK8aQRE2gYSg3ZyrQ8efYr9+7E+YtWbEjlNr0jSnM5oovPBefw+tRI5
         gM08fKaHnPqvJB2ahVQf3ALk6tq3kgiJjU5l8rXmjTRqQLLg/RnMHgJyVXrYvvvDi9MJ
         wJFQc2ut5Pa5yhwV33fjV3pwmy0NCAc160JrR5pDOZAVjjEqiG9o6uPVKOCbdUhlubZh
         bAfW0f1Ltl981MorJrKKUHvG98GVSfYdBoTlabXCnhuzO/vJE0am8VDT5g7WfKoR4aH9
         1uCA==
X-Forwarded-Encrypted: i=1; AHgh+RrgSytl05JlSzgmxFHz7isB/fW/rL80LI0x+FN1KoAKwTsCn1X2CCBPS888ICLcDHoXTsWuYi5p6NM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1l7Y+WJ3azyGGMt4nTlPyw5HhwCC0/J6lobROLFugNrRvaAxF
	/FvzvPdTJLwNGRdJCc9McsJOOm7pkTFmQR3chQ8lbV3XC00MOzxJSJfVAh4taO74EK8cOVCaQ0V
	Zq9M4XF+B31julfPQgwUeDqgYNT5KbAnsWMVM6k8tDQ==
X-Gm-Gg: AR+sD12+99xIlzvRe3hs0D/QLabB5ZH7aCyxhlAxvgv/xfRyEi9wUKiy2aBqbE4RJ9y
	Tl7NAGcVb17RhaHE6xm+RETgvUDXZD29CfKua++p6wOfliLW0iGqnnsdTDZtK5dxDuBmrYrLumd
	QIqzZyXn0b+IUQIQmsOkTBA0IKBZBIxIOt45TDTWYFH3ljZcI9MzaNXpCBJ1MAZ9fRFrwMLlJ1h
	/YgPLnaAXmnmRaGfp6ZyGi0H7Bocfa24BeOlxB71DU8Gj/EixrPkzQE5H2xS3re68ySr5Eq2H8a
	2Y3QobSw8TdB+6Yk0JqPYJeK42pf9rVPrQ+Z7A3CkLzm1Q==
X-Received: by 2002:a17:907:1c81:b0:c12:8b1c:454f with SMTP id
 a640c23a62f3a-c2108f0b8a8mr240524166b.2.1786615657312; Thu, 13 Aug 2026
 03:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812103532.395049-1-renari@arimil.com> <20260812103532.395049-2-renari@arimil.com>
 <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
In-Reply-To: <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Thu, 13 Aug 2026 06:07:25 -0400
X-Gm-Features: AUfX_mxMU_wVh1-h-zTN8bKl9ZVV_nru6asIQE7WEpjjetqODMgrCarL5WYOyGw
Message-ID: <CADBHdQ2up=rcwC=GgVBO382H41uxep-Z7XD6gtnTpZBi-KcpJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Will Smith <github@notthatwillsmith.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:57=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> This is introduced by this patch and thus irrelevant for the commit
> message.
>

Do you want me to make a v4 to fix this?

> We are too close for me to accept this series without independent
> Tested-by: and/or Reviewed-by: feedback. I plan to apply it after
> the next commit window closes.
>
> I won't mandate that the issues reported by Sashiko are getting fixed,
> but I wuold strongly suggest for the users of this driver to have a look
> and consider fixing them. The issues look very real to me.
>

I have already started looking into fixing them but since this is my first =
ever
kernel contribution I was avoiding expanding the scope of this series
unless you explicitly asked for them to be resolved.
