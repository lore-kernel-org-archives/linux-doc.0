Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972F18BC3D
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768271555; cv=none; b=h1oBvTB8B4XBHFztUO2uNQew/l1X0aKiy+uLpxN6uSqZLUwP8vyxMTgETPAsw75ONCROkYifenHK3s8vzmVHRwntrwwfQmUVik02defEUmJmGmcWB1JP9zcDZjaWkKipncVTYUEOwMB+Ab1G4EjpNeqAHEGRGoTk2veQ1s23uXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768271555; c=relaxed/simple;
	bh=reJSPIcf3VJhdBpzJOWgVi/b3OKXqSv146QSdumjWQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YF1LMZiJq1HjSe67MJYFxjrRNphMls2/cpTnUA/2VtuOwoOEWk10PD+4Ho8rShFjNmCu1YsE1FP40Op1lVmOjYVCHcjuupOBXdhEL6+s6WrDt1PJ+hnn20gZtdciPZXGUqizkmVKIbw7y6Mgrtby/24zS14uZ27pDjeb2LDqpoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSjOPmFC; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSjOPmFC"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8907f0b447aso79417366d6.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 18:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768271553; x=1768876353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL5UIQdYHAvUqifUqb+1JK8qs8epjcxYDnFQdApHorg=;
        b=KSjOPmFCOHxGXpevvfIGksDc0Q6tDWu8fiYw3pgNRmZKHArlya4OHbZDd28kM/+tme
         dWeUi5zo35udR3xORgMPoKmHnFyCMyDrzxphhA2mT89Q2ORxNaIxVyXQsG09k576bBD6
         vzYYj4rWeEp0A6yPqE4+aVV05erMjrb+9dnMP6opqJnUG7u3A3Qe8ssYXr0+I9necZF9
         /6YbfTxhPWEVHHAl+M3pE8OwQyjdYErCf/4uykmlk6wX76o5Qkd4Oh+80pHK6AHZKvrx
         Xlfw/085xEaee3beALoJ8U9pCRvZdNIxTmzh3An0/uD6meN6QA/L+aX2wA+noUHyypuN
         zyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768271553; x=1768876353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uL5UIQdYHAvUqifUqb+1JK8qs8epjcxYDnFQdApHorg=;
        b=ahD41KnmOJoHU7liBnpurbrVxwUT1fmLpcSBs6Q+wKos6lYym4rra4erqq74K+na7c
         lacs9Zvh1OMwkX9tUfB7SjaH7WaZQz5zXnCf1d+yRLLK2IQf7QfJaIGBKzmWo0O6ihss
         NzaNMkr92wyqCg5+nMNZ1lrtgpUBqzr9tXaDkoYpcRNjukcV1zIQ3JdgRifvuYUz+qDf
         EglFYkv48v4jGA7Y3HYaAu+reKM5vgwYM9+PV1lvfHF++LHOB86ddA4k87u+mB9ysTw5
         tVGkaHACqf+tipXTz6vsDLiHL/wA81G1pUBPsYvcbucroArNnVdKpKgsDgHes7jcIcws
         EUJQ==
X-Gm-Message-State: AOJu0YzizI74CGgxO5KmB1mcKO1Z+FMf3gAw0ZaPiOCe9GjjOWD/i/C6
	SQO3HZTUCEb5kJ9X1LcaJIPHxiTGvx4YBpyuLtS17UMuqP/lbzfbeW1OOF8JixeDYkFUWUksT2W
	RH6hSaYL6oU0fSnI3bRMDB5W4G1chGsQ=
X-Gm-Gg: AY/fxX75WYP6ajOJYZUFyZrIdXyMifclrt4TQPDNh3y1clX0lF1GNE2nJvyEWR0L1tf
	e+YcTbP5kq61yj2BgR3cXXxwpadZIPjCWqfPqmKskbz+aTKB3MHXRiyV0abMfwbkY/F/3ps2cdy
	LaY3h9+uGfq6tupc7k4cGLA65N5TxvLbpQf3APZSUB2w9cxMCYyuixDPzI9U6lzLtxpm5kwznDR
	OG4UnMaP2x9n5TBn7AfTH2ZdT+X7mnA6ke3S+wMMoaNjR5EQgEtjTk/fYgb+RseRUolc0w=
X-Google-Smtp-Source: AGHT+IFErJbWT2v99x38wXyW600TbX7IdysWWDCZ53wC2zdYSav7OLE3mOGQHUIh7sjmDW/wYxcKw3r1lQ4B4c2I2bA=
X-Received: by 2002:a05:6214:4984:b0:88a:4ab2:5f52 with SMTP id
 6a1803df08f44-890842aa11fmr291919646d6.51.1768271552882; Mon, 12 Jan 2026
 18:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107080411.59483-1-diego.viola@gmail.com> <87qzru23sr.fsf@trenco.lwn.net>
In-Reply-To: <87qzru23sr.fsf@trenco.lwn.net>
From: Diego Viola <diego.viola@gmail.com>
Date: Mon, 12 Jan 2026 23:32:22 -0300
X-Gm-Features: AZwV_Qh187xhvXYebk1lIOy5zAzS0BzQAIIcq3B7GzluDKZWIDgOJGBTZseTjdA
Message-ID: <CA+ToGPEOeMomkPEHLo3D06dKo_bHd_S6XiK4wzQjp_+eCnDsaQ@mail.gmail.com>
Subject: Re: [PATCH TRIVIAL] CREDITS: add whitespace before opening parentheses
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 1:28=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Diego Viola <diego.viola@gmail.com> writes:
>
> > in order to maintain consistent formatting across the file.
> >
> > Signed-off-by: Diego Viola <diego.viola@gmail.com>
> > ---
> >  CREDITS | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Applied, thanks.
>
> jon

Thanks!

Andrew also applied it here:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=3Dmm-=
nonmm-unstable&id=3D6ee856e323000246d04ce2e8fc35a4ca507e4239

I forgot to mention that (my bad), the reason I ended up resending the
patch was because I wasn't sure who to send it to.

I hope it doesn't give you any extra work.

Regards,
Diego
