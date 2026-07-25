Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFB3101BF
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784940309; cv=pass; b=RUybUBKWRHhuCX8mmLJB5q1eXwF0iBmTer9ENZaMVh2ne5xuPucpKy0D+Dt8kb1SHxeVCLvKcuHAHPy/KmM5KCj/sqwAwyDpXBu9ku4cNdByxWw4hxVtGcHO1W4vda7f9R7gTNhE+slYYT/IcYEUov6clucOXsVM5VzI/yLvCdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784940309; c=relaxed/simple;
	bh=hVZxyUrOtPUDWCkdUZousYkH4m0blLOETT+0mMe9CHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3Fu+1iNRqD9ZZ7hUJ9FmpsmB326A04dMm9+tII9yhdDh+eodfLObTS0RXOctoeGhQSPdRQlzkLeUeF9pvXZ2ddlZdWaLQoK8PheSAT1hzB3tLhExSIrObTrYRwDfMsMWTw6bUppKlEQTVOKbU8FrdY0sCn0fomJIzmimR0m/5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM48/arn; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM48/arn"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeafa51b5cso126175e87.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 17:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784940306; cv=none;
        d=google.com; s=arc-20260327;
        b=muAOx5YOaLDszklcx5x2WhpU4DeoNeg76PpKK977vglpw3vlVETnDfNdL+Riw0hSBQ
         DZfI599GXC2nmdNdjEyTNLBfNyoKvfHZeIQOgSymMRj+JBPJE2Yt+lRXZ8cg0JXQVZnS
         F0KQmfFZQqVt4GBxhn7FWx4I6vhJtxLeVCBE/9vJwLitmtP0CjhAPtb3/ioE/KmdlKER
         4RYmYRm95oHvEEPlj3E+KAdffWmueBOs3ygnQ3t1XCWYF9A2oXA6vQ5b8tYRSNJhqBq7
         MKimLREnpB/EVkScSKbj+UdgLmPQH2UOhAoa1dWHnojKZJ3MekPiUTXPwi6xjS6x1xa7
         qZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIUX9VMkZp9I9gsV6cBr565TfzyBh/67/m8dZ0VNpis=;
        fh=gZHzcFh3HU+a8CP3xjDniKeaCTmxD/fBVFWz7BJl0RA=;
        b=HquE3n02pO/3l22KH0nS53q/cY3pBhHo6NZu+PbNu9n5GsYy4B8STw7wLZxWwwaA4o
         v/bmUB/Z0pvI2jc0lVhYo3LSR5CUVhN5hSbatsjX0vKLzZ4XaE85Pd/Qo7bJBzsFoFVV
         YGc7jZjHMKQvID3J3KgcE4CD9pNABYaG/y4WZnfVx/CKQzua1ucqDKNUZ3gQuW820TGk
         I7Rn8U6HOl9+5vpB8KTrskISCy9oPKe78XFwlgeaCt5ToPkyey4Ihh7ueKrG79h8xJaD
         HSLy+AezjA8jgiSzy6JWAFlmdNsZKKmPicDJoaUIp8Wl22U4QCQrYj/YRQMrKf8DIZ2t
         xbWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784940306; x=1785545106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIUX9VMkZp9I9gsV6cBr565TfzyBh/67/m8dZ0VNpis=;
        b=nM48/arn6U7nD7a80HCeQV3BjbEHyYHZybD8Dmz7YcbjOKLTglhmQVnPwhKTIH0UcT
         ZIUGeIVIspA3Gw+e2gEI8DTIlVHv1DHua/Y3jPJPf0XbGR5/IoofOaYPDCWAWVkQcGCM
         U3YIV8+usVzABSjZZbHQTXi3XnzoFEzs4CMqb2tXdULItMzH6IWka7q3kOE9BA3izkOZ
         IJEy5HfV+Q7D0xuWGlkxiFhPIufoVwy6ZdfobB7dMlyTJFaKTDCOSnRTZl0u9cYZ0AfT
         /ekhV5wvl11lxOpcyYr/YhQXqNtreGBI1da45C1etLQ6zI7Kheb2706dks9Qr3bDG56b
         OPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784940306; x=1785545106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIUX9VMkZp9I9gsV6cBr565TfzyBh/67/m8dZ0VNpis=;
        b=Wn4lHNfIyLszZBNYAWegvzvAE2mf/tjZK0DTx3xpaFxNPxbUnwZN4AWvZnS60DtTqA
         TnnaADV5QiFysCL7aSDLkobm3LQBn3XXxLmrVcECOJmhpFpWnVHNfbFsMowXp4iAD6sk
         6NT6fwCFFxGrinMcKXsdcdPBx3hqAKnwstspl5necQ1k7XzdkL1aQSaZQibq+WU4CPAk
         wEWv3NYlcazj1WKtz7F+k6kEc2iCO8Rlxysix6JZ0eujIzx5rkMXl/qpYtaeXrSJzRnt
         gYLpKemc2d3L2xwJMkmNRyXZbs3bJ5WQgmNgrygnaJWT2A743KGhOSp5WW9r6VDX1M2S
         3SMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqo1V9OkyRq2+NAbWkmD1Xfk2SR30EynDKsELBRnQcjNcppfrsviZMlCoSgHvhVB675W79NvxsphM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKQO7GyvhG0YnoSotmswv/net4XewjJybWL+U9xH0iMYyt6JO1
	LmDH/hpt+oqStgPdImQe2sLXeyYV2y3uCRdxIKHEdgXzY63epQDvJoNpeCZqIfvwpxsrSfydjzT
	a0j8U7Sc6yJ9bBMEvHGJkTw8kgz5thlI=
X-Gm-Gg: AR+sD12COCMq2uYNCgEEx3Sq+FjvSDCXpoOh5PXrSL4Hw5drf2BH3WUP0BD1Cbs6SVq
	hyX9oXEdIk4JdBoMS9RsCEW3D2ZPJ/2o90Msu+VK+OzPbMWPWURvatxnzdho+i97dY04DP0UYAE
	+R0Nvv3+PvFcFCXsbAjtxpSLrCqrYt9YpeZrJiKh+nWL2AM+r14nfBtyXqL6a5n5s+rtsYnsZRB
	zWgV8bLa1Z1qW1DhBxMcarCjHb8hv6zebt7aarLUeMTk7C6a8H94MLA/Xt1vpPZKrsQgSi4g7iT
	FoLWad4iarpQZCyN1uS1A5GhH755HX0Z+P3Kc2polxeF
X-Received: by 2002:a05:6512:3d90:b0:5ae:c5b2:9cbd with SMTP id
 2adb3069b0e04-5b2c1b26fd1mr41222e87.4.1784940306063; Fri, 24 Jul 2026
 17:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-16-chenyou910331@gmail.com> <amNaOvJKwrQb3HN3@wyuan.org>
In-Reply-To: <amNaOvJKwrQb3HN3@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 25 Jul 2026 08:44:54 +0800
X-Gm-Features: AUfX_mynnK_MLnflMCb2XhiyfkyFy_fN71ZCGJBkRc0m4atZ5wwF4R5vy96sAgU
Message-ID: <CAKspUhJ5yZ-torrUt3eNJt_sBTQgCGXSWuRMWBdwGjjOf7AKmA@mail.gmail.com>
Subject: Re: [PATCH 15/16] docs/zh_TW: process: localize terminology in index.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 08:27:38PM +0800, Weijie Yuan wrote:
> Wrap, then:
> Acked-by: Weijie Yuan <wy@wyuan.org>
> (Can I ack? ;-)

Will wrap it in v2, and yes, I would say so :-) Anyone who has done
the work can give a Reviewed-by, and for a translation index you are
about as close to a stakeholder as this file has. I will carry the tag
over.

Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=E6=97=A5=E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jul 22, 2026 at 05:55:41AM +0800, Chen-Yu Yeh wrote:
> > Localize mainland terms to Taiwanese Mandarin (=E5=85=A7=E6=A0=B8=E2=86=
=92=E6=A0=B8=E5=BF=83, =E7=A4=BE=E5=8D=80=E2=86=92=E7=A4=BE=E7=BE=A4,
> > =E6=96=87=E6=AA=94=E2=86=92=E6=96=87=E4=BB=B6, ...) and sync with the r=
eworked English process index:
> > mirror the new section layout (introduction, tools and technical
> > guides, policy guides, dealing with bugs, maintainer information,
> > other material), keep only existing zh_TW translations in the
> > toctrees, and track the still-untranslated documents in TODO lists
> > following the zh_CN convention.
> >
> > update to commit a03ef333fbd6 ("Documentation: security-bugs: explain w=
hat is and is not a security bug")
>
> Wrap, then:
>
> Acked-by: Weijie Yuan <wy@wyuan.org>
>
> (Can I ack? ;-)
>
> >
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> > ---
> >  .../translations/zh_TW/process/index.rst      | 99 ++++++++++++++++---
> >  1 file changed, 83 insertions(+), 16 deletions(-)
