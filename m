Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6FB1DED5B
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 18:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967542; cv=pass; b=ORc6KrtgUSmeg9yB7OhKpdu+i4JzOsI8ZLJLngPErSISqo61s/Uh0nwsYO7rfGtukm3ot6VVbBQOmHMdpDFn6sxPL7zF8pHIWmM7+JK2nES9hXTYSibtExFIHLSENg1JUuxcum6n3/GWQ7vVek8duTZMOWkmxOJlIY220x44KbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967542; c=relaxed/simple;
	bh=GHToyrLrWrYATGAHH0V5pNWEOv1lrXAutKna2GkhueQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGiWKQ2pJVZx+rJLe7hNu5TnLgbIshJzf6ny0CDRjCZr/xtMqfSdYh6F2l8b72vK/utRDcWIYO7W67kELck2bM97Jd6QuwT1seZOM/Oy4/PUz8S5lsTvDQ85J4O2Vz42eyIJPGBdqB3KhggsyD+Pj7rsgw2guQA8LZFR9RP+68I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3Ysttss; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3Ysttss"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e622cc874so206727285a.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 11:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783967540; cv=none;
        d=google.com; s=arc-20260327;
        b=r6Wlnwt2m3Et1//6WtTytMFIENBfUlp+3GwLh1oa0rva6oh2yoR7+Cz3y+Q9heKFcE
         gEixBA32ndFYztXvLxz4NxocQlRTmLxog7I1WOH53MX11vf+8VHGIPPwFPswu6ii1laM
         WYvgUYNGC068rLGMaMjkUG9Klsrna4FSpjT++AoGuzpa6NgUD2i/mTH/7H/TAoi+JEos
         UXcDsbp/n25VyjAdpYQJhK87JRkUSg2wwgj+0pzx+UiM37s0RXvXFfBVhL4pwC7QMWHD
         Sn1soXsP0ydHyxVhJY3vsn4Fy/k6t6WhmpoUo7ZBDFZ9JKZLsjZNdW31E5cqI2uSozGr
         a1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GHToyrLrWrYATGAHH0V5pNWEOv1lrXAutKna2GkhueQ=;
        fh=9e0NksiDee0472/3ouQiJ1hrZjrPXFmJO7+/keseRrY=;
        b=qC1ExUcIn0B2xD7Q5JYtcWruTOOvDQXquNW6pquykCY7M2PUQEsWINfRTbM/xU1vp2
         uQh3nCApKcvLh4pgDTjruqwiwPI5pFPJvKxU7rU5L7Tk+VL0aND1a8iw12KHZTEnLZUA
         r+5izqcX1yOe7mq+RIydUaCjTJ/l9FHEUrSKX6M8ubNRvfBB7F9XM1uCyluNaosPvi4s
         bjnHEvKQ+7X7anSpb0GXC+NCmsDDsuwS9rs0onZq5bnN4EUg6Bd5p8eI/0Pya8aoYtyx
         6faCcCh8wiNSEvyzSxhw8jxx+qQ5aDEYxaClY6o8JxLDDNPcE9CggpGLrb/3R4Wi0VaT
         WsvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783967540; x=1784572340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GHToyrLrWrYATGAHH0V5pNWEOv1lrXAutKna2GkhueQ=;
        b=b3YsttssFHJ2eCoBO6kaVMQ6jRXcPgTqU6i4Ha9JyVKuPPKDUiWveLCUiJ/EAu9ArL
         H3JEv3GNpVdIlRY2itBCpv1+cyq0DnFfJou9SwY2NNLyy2116MPFfy0bWkEuNlKxlTbI
         ycTGLBLZD6UFT532p6+z+yNXvnn0ijDqXJtj2Ul5W8Yiy9X3nBSsY1IxNmTudG0GXx3J
         Zg1WqQAEYagznZXzgL85f4tXToa7sMGbS0hMJ0wNywFEnMpnAXUoatkpoCyeIEWiCn3p
         vFGRM3zxkXChvWj3Hy4N8ShhVbChx5b/NJloiv/HHiF7RsLHhxxeGvLnHL+6MqvO6P2f
         VpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783967540; x=1784572340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHToyrLrWrYATGAHH0V5pNWEOv1lrXAutKna2GkhueQ=;
        b=sLbavSWvxG+GpbW3sU9iWl4regEFa4opTzVTm4vCyhe0uduikyFs1eL9GPsgwI8nVo
         ipzITrFaK2SKTAHns48t9A9KsMNuncp9fUvvlFgzA5SVB3fDfL8ZNd70VrQH9r0h7wxe
         GEmXJPHYtBf56RHkqSZ1ZFC5SlLj+KgJ0+mmgW51iL8nduk7SjXXRgEFDMb+CI6lc4UX
         bL1WD/y015YmkvfwLbZ4SwQygZXgPTLzNmC8fvd/0B7Fm4SqfJ98TltBlb4Ha7sjYe7u
         t3c+tyIjmveldsUJTYr7SpA5dtI7ZCooIY3uv2dd0v9aIjjrGQpzdUvcbQeL1yzbZAEQ
         caTQ==
X-Gm-Message-State: AOJu0YwIJADmn04FRvc/Gwbnl+NtFBgXgIAEINu6GqgkP01fKfA5LWu5
	PumlD+6aMdsPj2f8S1El14iqGpzRN5Tw/baxgENuz+C1rmp+vp2hfSGVeRUceP7ff1vA8KiVbgM
	XkKmmxQpfTMyuTnBQr53Hl+0haaZbK+k=
X-Gm-Gg: AfdE7clQssTzzGgaaMr8/UFojHSzO1XF7IzbjT6ZGSyOZ2JYO3sJfXkRpGQt+I8q01u
	LGcLOM6DKNmhWNSJVFKqrFrA5RtaiRIkktYciwDRS+II0obXgLZe9ZcRZGMb2/iOF3al7Xxt2zC
	+nGHNtCllVO21EBkt9qHZ/i8Z2+BA8cIAykWoaBkHvTnAE7nPhFfPOW1KFV3/L0exgjObWiLvcX
	wLn+a9aRSApnfaxImyd7MQjMGFcsklwd0s4ZcUBv/gPY/q/cmLApM/8ARHbSBDotJFXXmbLJAqF
	zrYeNj17Os6ws7rQsOMK/RTy92tRmykn+FsIVl89yD3KvJIBDjalROG4Kf/Vd3kP0imXWnrplhd
	8akuL+ai9rw==
X-Received: by 2002:a05:620a:4095:b0:92e:7a17:c938 with SMTP id
 af79cd13be357-93083c73530mr32360285a.30.1783967540226; Mon, 13 Jul 2026
 11:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708130558.12604-1-igorgphotoarte@gmail.com> <20260709222953.9900-1-igorgphotoarte@gmail.com>
In-Reply-To: <20260709222953.9900-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 13 Jul 2026 15:32:08 -0300
X-Gm-Features: AUfX_mwWrBfId-y0BDc2d9v-mE5LHnCWeR7QHO4fYqq24v7yVG9C1WgaL2YxWHY
Message-ID: <CAMAsx6dWejx26b0md69y4wbbt2285nB_EyvE-tedpzcCrJ+q6g@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate the kernel driver statement
To: Igor Giamoniano <igorgphotoarte@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 9 de jul. de 2026 =C3=A0s 19:29, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> Translate Documentation/process/kernel-driver-statement.rst into Brazilia=
n
> Portuguese, keeping the reStructuredText formatting and the list of
> signatories unchanged.
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>

Hi Igor,

Sorry for the delay in responding. For some reason, the v2 email got
bundled within the v1 thread in my email provider, so I had some
trouble locating it.
I have reviewed the changes, and everything looks correct. The grammar
is good, and the logic is sound.

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,

Daniel
