Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9434EE87F
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563910; cv=pass; b=c9m8zjKVhGEIDEkLSc/NvZGD2SHZsfo+9odKO93gc+FJznbZ/Tct9SU6VlsjWczm49il30dMHsadLSlpwxu4NzMMQrRVSYHMfHe/hMRxldFNuJaY2thSStxVEQDvk0yXiCTkgm6Ek5PlY+OFH7woYmdJu3jA/ZJhFSxC0JXMjAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563910; c=relaxed/simple;
	bh=iYZp+2EOPR6xYrhUi7S5Opi5Gj5X/xJCc14droc+2sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQdCmenKMr4Hn0E5Nd16hnY4VPqDnDSHk8einmOU7wgJxetBTojNOxlrZmlnTDyAI1YXjzZoPz6G4TmDSRYaoaqJSmSEd7B8UJyPigpmvDIE8GXH/xLf9u4NwLXv5l2AMElE6HYUqJcRXreog3+GWt0oCV+f0DbXROCgEXG9vHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0F7J301; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0F7J301"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5311edbc154so7500931cf.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 06:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789563908; cv=none;
        d=google.com; s=arc-20260327;
        b=VJyzg8EqhoS2ZnU2yUtJ+fyLwZVLos52DyQ1eO4ax198f/5+f2ateGuqVBE0K0CwBT
         n6kd66T/xkbSxwlMN52RMyUWBTtJdhB19kGpT1gnGE2Qhi4fopI5rSOuW5jS9n4xRCPn
         mFhUNQj7q1Yw47qdRqR3ygewDrHaYhcs1sprihcFonScrr+bATs/yUM+1vyj90FmIVoj
         Mii6/6gcjll/JS9rTY/jRC62e/C6gXB+LCSJv3Wf4I5SzbQ3vb3jdsxTIj5vX4r3fbV0
         Pw+uMu31z0VgcvWRd/CXEdwjjiz4zHUNR4gTi/ESl91nTe98eekO8ee6BnnwgtTX4NgM
         GeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dry8bhwqPHF9c/3kEywPPzz8leWn/yC9bc4KI2gEyYU=;
        fh=hgOFCOXc04ylDFLDgH1YOOhREqx+irXmgYpm7fvQEuM=;
        b=ooOITrBV67jZh8ng4hIARKxzz++IwyS9g3EHK8EsmKH7OR8yjp4Ibe02EkHzThU5zA
         ETSWHmilBXO0AR0oXOXrmQBDX91OKXZrNESPHXZqUn0FeA6/uqHSatDTR2nuzpzqXasM
         WYfs8QOW+F/ea5tCveYiCWt0WDCkm+w0BSSFOKgcytTWFMG1a7v+J5q5uRStSN7atMLx
         eGkXoZRsUXU5I5efvOpvdWnukT1vRf/02wJydQi2Y/9VIRY05tE16svgfgmLzzJlYUuo
         Hpy1kysH7azIL4KbXgjnEGtj7MNLQDB5qUcz2H2tOuvO6Hlp1f5gaJt7yb+tmhDyWkbh
         szqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563908; x=1790168708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dry8bhwqPHF9c/3kEywPPzz8leWn/yC9bc4KI2gEyYU=;
        b=i0F7J301ZrJkqX/5Trcfka4B/C95e7N4sA349l0rwQ8Pz0+P2cVnWnwwcP6gbPZ8gt
         a+KMvLVk/l8WyIUlEhbljqU4wWePgcgF2lTYhPgkklsBo3M9ykk4jbRNW3Bw1to+oMy6
         B5ccxCchzv08LJbB+nCHdNbp72PE7RQglOJNpRj3qeIuNOVF9WdPU0PVoAlwx/x5p3nk
         mcBXq8hfnh589Ud2B3jKnf2/kWmZsAQ5dqB+xwroRVK0nf585UtW92oNeBQ4O+Yhn//m
         xe9SY9xBtWqRDbvh/b/xjsN60PnbmRsZE8GAhOdpMl0OXdQ0nsIMsMvIHrqRPU1fv0UU
         DfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563908; x=1790168708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dry8bhwqPHF9c/3kEywPPzz8leWn/yC9bc4KI2gEyYU=;
        b=ym13ezT7Mn+731+yoqghcv81i1UwD1O2fC5lDk/ovOdsUtSikIxZGmZxPHQeB0gL/1
         1hD/x6DWvBGcOYQpN48rrFhm/vIyz4jV9OHcS6Z+BaxxKCRRYQXWkB+nSrKXjpYOIjYP
         c1g5cCOEUTcsm6WfPxn/S+nSn90LPLs1mJOhvdwz4clG5C16a3ZScTJqkNUnbTd07Brg
         QvodUPtMJNfS4k/LZpPH+6en8cDzSTMO/YOhsVHcvuzE2hH36vtU5OPde6HOJJyE5ygj
         bhPyyPJCi4UUhnNiDkso77EuJV8LalvWrLPVEvn2R22aK0OenkihzcYyKIh3isZVq8QJ
         /DXw==
X-Forwarded-Encrypted: i=1; AKwUvBwTzQnJ+/5dH0nvTf1nUffad+3xVxLg+RgbFmcnOPb/MjnPBZnUJdT9a4xEbVJ81BixNXRoCPYK3is=@vger.kernel.org
X-Gm-Message-State: AFuF++kkgk54vA/mLd+uc9rAdE08ZoYusBZR9JJ2xnztKt2YsNpiVXaJ
	byMpdDTotU8Z5sZqYJazfq/iCChstirOF2NeeVPgYJ82AToJynzFryQR8PNqna6bJAoWKMYNfBd
	dnycHUuiJFYWQgEt4BNDrrlvzQx6dSKY=
X-Gm-Gg: AYBFou3s0IQ/yTSQ7J2KkSKnEOj7cytBXFY0BALzIcCU2AugpoRFWp9sCRuSxZoaN8q
	z+1VDrwODJ1uNW31dmdHbWDmiaKQM3hg/qEBjiV3BqGruF+Zu+wavVlzuWbgSRloS6nvC/h40G/
	DYHDuEPuCYLDiINGOEXaF3mCz/EzRRcF5wW9hSXDkFWdv8pLM2QSUrDmYD0+k4+tN2Z05MM2Qby
	L9uTq9uP7Dl3wXPg3Y0tn02F4HhZ7lRaOFX96FiDpnoifCye5vLoQesaM9JYWyrAsjxVWq5Khdz
	vMPBq859VBhTy5mthY7kT3Js+q/GzXWFfzYtjtebOUdcfQQy2wCqZUShf6ImQvpRkGRAQUBSOK/
	uHbBVjKNf63zPe3ToHDHH9XcTwyVaYD7EgAglFD/+FZznJbiINaqAKWF3XTOpClczeFlnlUB3fN
	/DRh8=
X-Received: by 2002:a05:622a:610f:b0:531:982:c87b with SMTP id
 d75a77b69052e-5327f19474fmr42546541cf.50.1789563908099; Wed, 16 Sep 2026
 06:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910195109.1712-1-silvapfabio@gmail.com>
In-Reply-To: <20260910195109.1712-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 10:04:56 -0300
X-Gm-Features: AcwNN1Vgo7woxAlPPGYf7kSKx158JFKLEvbCyGBoKF21iT3eHYssFNKEozCOKcI
Message-ID: <CAMAsx6caGiA60Lp-W1HzUW+pD=54jz=ptpC5aEGZDGoWF4hk+w@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate researcher-guidelines.rst
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 10 de set. de 2026 =C3=A0s 16:51, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate researcher-guidelines.rst into Brazilian Portuguese and add it
> to the pt_BR process documentation index.
>
> +produzido pela comunidade do kernel Linux s=C3=A3o bem-vindas, embora pe=
squisas
> +sobre desenvolvedores devam ser explicitamente opcionais.

Hi Fabio, "Opt-in" is stronger than "opcional": it means developers are out=
 by
default and have to actively agree to take part, which is what the next
paragraph then spells out ("the explicit agreement of, and full
disclosure to, the individual developers involved"). Something like
"devem exigir ades=C3=A3o expl=C3=ADcita (opt-in) dos desenvolvedores" woul=
d keep
that meaning.

> +Pesquisas
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D

The original is "Surveys" here, but "pesquisa" is what the document uses
throughout for "research", so this title reads as "Research". In the
body you already render "survey" as "question=C3=A1rio" four times (lines 5=
0,
52, 55 and 61) -- the opening sentence has both words side by side:
"pesquisas assumem a forma de question=C3=A1rios enviados a mantenedores".
The zh_CN translation keeps the two apart as well, with =E8=B0=83=E6=9F=A5 =
for the six
"survey" occurrences and =E7=A0=94=E7=A9=B6 for "research".

Could you use "Question=C3=A1rios" in the title too, with the underline gro=
wn
to 13 characters? Line 69 has the same case, "uma pesquisa por e-mail"
for "an email survey".

> +  `Fixes:`, conforme descrito na documenta=C3=A7=C3=A3o.
> +* Quem mais revisou este patch? Isso deve constar nas tags `Reviewed-by:=
`

The original has plain quotes here, "Fixes:" and "Reviewed-by:", with no
markup at all. Single backticks are the title_reference role in RST, so
these end up rendered in italics instead. Keeping the quotes as in the
original avoids that. Line 162 has the same case, `Reviewed-by`.

Thanks,
