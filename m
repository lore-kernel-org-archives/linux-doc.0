Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354130;
	b=NBR7o97csFKt4Rlsq8vajIi9Y0kUv4GTY2tyuSPkvAGHgTc/kAObxkbZnZWuUPH0ByvM
	 bXlpJ753BuPFdV6HaoOUT7VrNXxpW5Nlh9EGjeLkbyK+epZeKY4vpxosdlbDCy1TwMvCr
	 UHGUHoc4l3Rq5F0vvnI8FKviu2Mqef6Jr1dlF4bmDg/s4YwIj02/prvgE2UkPP7bMaNyq
	 fd7lAs/FExshQj/FxpaO9zw7/MIdxjKiZ1Iulbczft3ev8kASicUBqW/6KJfX3snyNMrq
	 +ikf5oiMq6pDKCvf7NsXJG9hFonrfBtQoXauiOo/Uz8WNUj4TNyCJNJOznkGzyr9XlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9Cay3KEP7XHN8EzwcObp4xK8oCi4QlMR1+2UtNe1oEo=;
	b=l9rqrAGCqF9lwdd75usDf4/JMVgGQ4wQOVveWg8moclPqABhRjW4+rtdxTvW4MyrI7CA
	 p5qsMH0HbJy2w0WIw/Gw1RZPWIf9qWvRxp5dv60qdy7cVVgbbBOZM11JRTsQjdGVfZCEe
	 HOVvIh8+wfe+lDaynjNJO3u8H+gHOYidhwToFXtOmN5m1rbTOplwZfLUM0h+ZGvIBVFF3
	 Ce4lq6Ns90T9g/0InkVO4nAxG+uJXY1n/pdf9Of/PLVzoa1tDo1rgdDtNFDWq81+0yUl5
	 kblkonyjxET3mE3Zn9qjMzZNJUepxjbk0tNrxCiF96lfhXtY5niT2fyW1Kt9doAcf7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdUhw9zW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F6606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZdUhw9zW
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-92104b67a9aso26527156d6.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 05:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795354128; cv=none;
        d=google.com; s=arc-20260327;
        b=ghW4UpCpUtbGhaoAWL5XnLssbJhqIc8IUNAWHk3cOB0umsipVQxQSpBMNA4LVNfJNZ
         xRRYE+UtfCjx06t7C44RMVy1TL+1mZj3wG4CdVx8w4qKia+jUwRj2ISu7R3q5VqlgmAn
         YV2QL+jJCpGb42NNb7tiDsCs48tdkzxeTuDWnN9xblNc7qTyNlTFA/ADxDG+AComvKG4
         Lprt3pUFA2SzyJ4P9aBsAO2tKG7DHmrbiiEBKGdch12S6/eRlzQXm5a7oyABmSAoTrQs
         FkpKUAafmcRKlXX5rvvRoL6ldLAOwA2kgcmMesXLvBPofTlJ/eGBffN2yXVEOMa1+dgj
         LdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Cay3KEP7XHN8EzwcObp4xK8oCi4QlMR1+2UtNe1oEo=;
        fh=6h6XAaPhgFcEt2pQ5j/8TjgyXJ21nCHxTQFout8cbcU=;
        b=ROlcYjzVLAxzPm8opXS5UZFT8gZflLxC8/fYCtZBwpG0ZtipVWIqHvK3wX6M35DEqM
         M79HLMF2SoaRFw38dhTg2z78Gj7UxaUWOTN5e4PogZNhL4lmcnuZlpph3bP5hCmnxaHZ
         JyTSS8IC4uiSGmRKPgTTFLZyswhp1FCueiAOTmjncriqrXfpHNKTse61NY05NGSM8H/a
         uBbVlQ1RJ7G0liafDNoPTZ+z5oSe6Wa8z8F3VQFtIFW0oKwOwUIbTZowlJvVIicCZds4
         p2NUnAp9Ed8mmxmfcxO23TR2vLYZhUnRS+KuibJkPkl6WwUYdrPHnmZ4+UmQ73vfRS5i
         Ivvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795354128; x=1795958928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Cay3KEP7XHN8EzwcObp4xK8oCi4QlMR1+2UtNe1oEo=;
        b=ZdUhw9zWXuk+EQ488BeC1lFWjGAVz3VcplpM8OjIleCbKfR/pguOTh7Ufe04Zd9BZY
         +Ym6jWDSKWqwu3ctXzL2wgXwvcnVWCyufGajjGG9H4kkmduN/5pKccUCrh8/OY72UOM5
         TLNFzms3YUFh+Uw39Q/L94jh2hKuD8sZMSUf9BeZhd3QF0BOCYJNGMb2IIpU5O1kcUOL
         18pYut0L2/2f5Nd9n/bBGXTpYfRiEbK7ie00/dlV15FK/JqVFGHdOiNaD3YzMtipTFll
         cddB8b1S5r+DrN/QCeWTnf+tSKML+8ny+nY0OZ1qOURjDPQr7FWrNkkGFEo82fQi/H0S
         cXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354128; x=1795958928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Cay3KEP7XHN8EzwcObp4xK8oCi4QlMR1+2UtNe1oEo=;
        b=uhsqgJb9xxCZmDvNEQCAXwPjAqkzteKAIAhfzfuz4ov9sRzbBPGal7NQY7pX1C5JTj
         63P/R9xOxAmSaeszbHLh8QZuQ2soO3keM5KJ/jZTQym5pd2nBTmj/03EXsEPP21N7BG5
         efBhtk7boyPPbaEPgNliz2sGdDWKT5btQfCQyuMazq8xsbQ/cYcsE0+bMlD+a70SpTe5
         5CZ1CCkBmt+WLSEzZDOwOiKZarRcym0U78uthb10hs4SKsOCIxln6VzyDKmb1ljah4UK
         BhC0pdWNNFkbDy6jV3Z3Ax/L/s0ab/1LDJ5HdkMiJHpMavFFqBQ7aKeoDBk6Zl/bqlyC
         Z/+w==
X-Forwarded-Encrypted: i=1; AL+hErEKmdFBhIztOz1aNGpeW1FgQRh2DFpMt2rkirDogilrVYaxDkkt0Fc0XSCwhZW2aMJx58kWM5MJ5d4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R4ZFSnK6NkMUDVmxZgzaogTWaEjcz/o2ad2XXKxxSsDLIupNf
	yiOyAlB5Iy1cPv9IwOtNVLOrZtsj3sPI/NutHOYstx6Uvv6EVEr715yILZDE+Kw/PcjqBVppkyI
	Xb5Aob6vG/dudywrUZVfUrgmpvopsZCNcVrbRNBXIAE3u
X-Gm-Gg: AZFdTZeOqeGvilZL6AYiw0VfnC1FG3H/BOrSwcQ7qrRXBCYju5fYJ26Gt4Y67iy7HIG
	D6yBraHS9GvGBNufsgCUgfL1oIUK4/f5iaQZKLzpFkiBMqW0d+zciY2jXq6t+Em12o+2lLKMGW+
	Sap24dQVwwghmcu9hB/v3LLsRAejqzyHvhqes0S7XQSxCVbh8MXZkA0hV4BAMKFiURX1b0G8EeT
	FId4Xi+L1ytPuqZzmdZwBUEjlFQUaeoKgX1m+gAfFLmWfWadjGjYb3VUx4dNP6MNTdjiNs5yBvp
	iVNNwgD1ozxlE7YcF9WLUX6iUrtAecjYzAnlnHlGSDMWNjE9XnIiLkwAdFqx5qaAkraVoosX3+V
	a3NBU+zpbxflsNTbE/OM/7vwvXI87rAwLwCrn99mrnno92svZetx0dWVO+jocbpp1dXJviXgdlb
	rxtwQos/7eI28NsG5MAq4WCHpK4S3c3S+yin3saxVqxP5A7hAir8K0TW8IknHuEXqqARRMPpcMz
	D/qvexZU8hdNGNDMi8pEpA1SPB/POwXK+LDCaiJHRq2xhaedHtk8A==
X-Received: by 2002:ad4:5941:0:b0:921:550b:bf70 with SMTP id
 6a1803df08f44-921550bbfb5mr10276566d6.26.1795354128553; Sun, 22 Nov 2026
 05:28:48 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
 <CAMAsx6dNK3NjZvF-3wd9RH3dy3V7TiUoJJxnoLi0FPVn4eVJSQ@mail.gmail.com> <awLeAd_x7yCNRafK@wyuan.org>
In-Reply-To: <awLeAd_x7yCNRafK@wyuan.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 22 Nov 2026 10:28:37 -0300
X-Gm-Features: Aa3M54oynUK2yWC1AbCMBrIvDFKqfDEgop5d6-QKjzq0RMOu3wRW7mZs3-MngkQ
Message-ID: <CAMAsx6e5mQa-_E_nxWgY3+FiN=QJ5umtc0MrG4w5CQO6oS+t5A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: submitting-patches: update LKML role as last resort
To: Weijie Yuan <kernel@wyuan.org>
Cc: dreduardocruz@gmail.com, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 22 de nov. de 2026 =C3=A0s 09:20, Weijie Yuan <kernel@wyuan.org> e=
screveu:
>
> On Sat, Nov 21, 2026 at 11:06:49PM -0300, Daniel Pereira wrote:
> > Em qui., 19 de nov. de 2026 =C3=A0s 09:22, Eduardo Pereira Cruz via B4
> > Relay <devnull+dreduardocruz.gmail.com@kernel.org> escreveu:
> > >
> > > From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> > >
> > > Update the Brazilian Portuguese translation of submitting-patches.rst=
 to reflect commit 3a198413bb71 ("docs: submitting-patches: make LKML a lis=
t of last resort again"), advising contributors to send patches to a subsys=
tem-specific mailing list first and use linux-kernel@vger.kernel.org only a=
s a list of last resort.
> > >
> > > Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> > > Cc: Daniel Pereira <danielmaraboo@gmail.com>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: Shuah Khan <skhan@linuxfoundation.org>
> > > Cc: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: linux-doc@vger.kernel.org
>
> Hi all,
>
> It seems that the commit message is not wrapped to ~72 columns..
>
> Thanks.
>

Hi Eduardo, Weijie,

Thanks for catching this, Weijie. My Reviewed-by was for the content
of the translation, which matches Konstantin's change to the English
text. The commit message formatting is a separate point and I should
have flagged it too.

Eduardo, could you send a v2 that:

 - wraps the commit message at 75 columns;
 - uses the sentence the translators guide asks for, so that
   checktransupdate.py can track it:
   "Update the translation through commit <12-char hash> ("<subject>")";
 - mentions that "lista de e-mails" is now "lista de discuss=C3=A3o", or
   splits that into a separate patch.

My Reviewed-by still applies to v2 if only those things change.

Thanks,
Daniel
