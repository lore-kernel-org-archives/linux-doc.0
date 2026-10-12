Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178583E3DA6
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 23:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848882; cv=pass; b=oVYTKqFbIc33nwDZuIEAFvor26daf+xqC3opPn/mSrovH/1P3S/9MB9tuYz8AQ39qYXfJIEw2JvVDh1orqmrlvgf4rwaw9NXnkYLE87gzH0LvpjE0I6e+zs2d7UQE1bAzJtWLywEuMYPAnESQmOnG0zj8tB9o7hE8Hs4tPeA214=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848882; c=relaxed/simple;
	bh=1/oXddWJh5YQpjdK2pxyrTq7t64Nul7KUiKyrI2EofI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAsWr9hK/INqEYRP3rV7s7ydUE1Pawnc76K/YUeoO12I9qPrT18ZYbVBw0CKrQNbQ/EF85OaceLnZ59KQNG7cuH4IrqUxopifQ1T37dKq0NBqsq2AahCdLn787tjKP1zsNsWvoHtePmh5+jpJwmZN9USa3SkRNyFEgIkAwtcg64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+KI8qSr; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+KI8qSr"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-917a20e9efeso35383886d6.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 16:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791848880; cv=none;
        d=google.com; s=arc-20260327;
        b=AnQEr0U85U4CIW6qmIWhMKvoKhn09lyN7R1wIaXEYjN7HSO82m2e4AIRAxMG1EXikS
         S7HsMI/xp28bc5Ye9i/SAvCFQwFqeH7k7jXFyYCmwo6Iy/v67BiXIFTL5Jm2nEYoEhyA
         mUyNgjthYuXdzPWfMzsP/jf2ZBzlh8EtjLbUs/mM9Lw8KQ8HxejknL7EHE6bNlpM40IO
         I5FAp7RyqYFDZYXBPefOkggho7JjPXfy1zEL1cKMi6Idjt1s8/C+mBqTYlT5uD31KixK
         Iw37KmyzIMrdQLQ6zXik1CYo0RdVVnNWYklaYR7GciA4TVjbtoolTImDeLRPQspNIRyk
         xGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYWl59UBPIqwigIy9TJ+mZKGkOCUKXmaRFvbFPdecAg=;
        fh=ovlPeL7oWWj76B9UzK74tyq4s7WjjhZCITVyaduwH6c=;
        b=HtNXCp6hetAFZJ90+eEQOtA4K/dFr82SL2KCvuQakAHm7XX248HO2eYZ/YfZebAygk
         Xq1C8CmEYgjXRICKHucXKzlmU2oBU6Egx8P6sYs4t0y/hxo5yiG8tZmyyXAlqrVQGT0T
         y6w/dnbOzg0gVWHkWCcQGnGLOiFolEBqjJC0//6WBX2DZLi05Ob4NeKyzrcixpChSXMm
         o5pr6ChjdOvF4TLUwogYjjvwr/fZ5nEY/zfDZg1fKrLRrxPdCtZ9nOipij2hIS5j557r
         bHg0yKWZLVBhpvP5Y5spkm7p3Su1lGnRk/NJ1enSQzakfhRvaRCEq29t1hCl8sixbMSr
         n9Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791848880; x=1792453680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYWl59UBPIqwigIy9TJ+mZKGkOCUKXmaRFvbFPdecAg=;
        b=g+KI8qSr4Lkir7JtFEvoFyiC1RnmrrarWI1uNWw3rHT5O2hQzfYvT2aJ0Gst7kbW2Y
         vqOgXttPKF1g7dGcWaRiXPsBy1d5gG+9PDa4XENMPZ0i5dIFoyqq/L34tFNvTk+D0lWK
         iT9NaxfLgCndOAHnX/6JzBwlKj13d27KnhJF+dcseZj77GQnlJvc+EhKighVSbDy8hJV
         G5XzPVRhJKGLu1z2XqYGoVLV5fpaEyxX/gRWKpseFZIchdZfeP8QQ5nNynBGItMvDrIu
         iXyRHXx8L0K3cx+Cl3etwlx5xjEGr7+hjaE3+dzYqHy8u114jQLlTLLS/hRihyImi/n2
         OWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791848880; x=1792453680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYWl59UBPIqwigIy9TJ+mZKGkOCUKXmaRFvbFPdecAg=;
        b=JZLlRpsmPidGHg9IgEp6+wCwbuKSB+fQPbZxNYeMKLpTRpTOSNUwB1p2g82Xsx9b6a
         ezyTVdgwenTS3kg02FAidCEr9rNNeQkgigMvEifWQLu9aCWfWnCX/0ayvKhSoOSQNun3
         kIO0jLdXNGQuVTMblclxH1Swmoi0ifgt8y7aAQkcKY3mm9OXWAAyyidsfGhZuK8lf14l
         ziHiM7yTFnCVYOnJkpHVT12n1C3gWoJvcNNkHpOzuKvn3kIMwhZpQYqw7lllRNRnVIbx
         b5GmjprUmSWD0EZF7dm9/wjGm+iwfgxrv6S4fMo8sQNYJi/vpfLj9gKEravbHK6UQEw8
         7Emg==
X-Forwarded-Encrypted: i=1; AKwUvBzl5xp76aIWzOQiHs8OJnGsLzPd1si9Zzf49SxTPL3eKPTxf3JpVbIR+4/h4gYpEM2XuQDGpyxdS9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJenFIbF0Cx1WFJKM6SZprfEozPyhNaaP7CWfoTHk76+NTda3S
	bp0y4bgcYZxXN3wH1dWmvtMyL/4tzTpl3jTnK95jsAmPg7zCq6druD0q5h1WEAayqcGA0Q3e2nw
	s8mNxBhfHX/TEKPz9gZunh0CwWZLJuI4=
X-Gm-Gg: AYBFou08yxwAaYjW4WyELXWlMAnqBgsJs769GqVLowjUHSv3qUXzN0nl47Q2jml0nYB
	AdhH0Xr9xeGnrm4IhgLqMPDPSf5b8pPTxQc3kFYdbSvthU8OnzWXrcqtFn04wyoqsr1gyKTc+oO
	u6X0OBlCy8y/Cvh53Q4f7/mR9IktmoflziLpE2q6lnAq5oeysDm7EJymWDHvyHD6TcW0nIn6g9S
	WCaA2qKoJzOKuoilm6l7biAx5dXlJ6CJNYtIEqatxQRRKDIBJE7f5VZFfkaE0wA29EsQN7xEDML
	hGuOxk368RioKClNh1+w8gsHiOLZUtWdDZ2oall9l6cjarVRFTPsXVoe3srVUB8Tn0312Ly1rAY
	dgyZAlBJIkzSgBA+SFGVbuoXMqfsZSbnThsZsBaMqVxltPPayXllhWdWyV+5nGWWIN2rF3g==
X-Received: by 2002:a05:6214:27e5:b0:91b:80ca:76d3 with SMTP id
 6a1803df08f44-91b80ca771cmr82873146d6.33.1791848879856; Mon, 12 Oct 2026
 16:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012234410.13880-1-igorgphotoarte@gmail.com>
In-Reply-To: <20261012234410.13880-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 20:47:48 -0300
X-Gm-Features: AclHuK_WHlC_pS2fNqklaR_eeoh-J2SIrsbaunMu8JW0xOLnwGzUgGgcarnROZU
Message-ID: <CAMAsx6cr_2h=fZArNZkRJWedbLRO13dj-VMQ2fuYJo=j_Vpt4g@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: translate userspace debugging guide
To: Igor Giamoniano <igorgphotoarte@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 12 de out. de 2026 =C3=A0s 20:44, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
> Changes in v3:
> - Point the "conselhos gerais" :doc: reference to the translated index
>   (relative <index>) instead of the English /process/debugging/index
>   (Daniel Pereira)

Hi Igor,

Thanks for addressing the feedback and sending v3!
The patch looks good to me.

    Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

 Thanks,
 Daniel
