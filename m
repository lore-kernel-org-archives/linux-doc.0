Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8603191A5
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778640243; cv=pass; b=pGU8pfhmm1UAJAjQ3Yjl+h8o0YXsQAy0O+SpR/R1Zw8BBTesZ94efmjkd7gSjGKQYoZNNpOQb2hYTKiKGj6G469yryKRp0mt9xe3iZikvvKClYUZe2nbUBIkfPCAXaDyDfJLaUAfbc+VfD6Va5OfZGBvJxcSOU/LrYIT62IrOpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778640243; c=relaxed/simple;
	bh=fwmzkwTR65le1oWpZKenLp57NZAftj8wUZBjcBgmHHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj44wcGnPtB4tpWTKepPGNT8rhYTHYheWWOqG83y8O9yvxaxNdlZPbzS6hv10vuD3jWMDM8L292feUI7PggmMKV/l0Z/j4jXqoEP5Mf9oeqmUtWR70tUhuJvHYM93XZs+L+1aqrG3DVh/j+01cTJexQzbZPcugxIiSaoBBdcLgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=F0nlF6Ft; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="F0nlF6Ft"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso12319658a12.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 19:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778640239; cv=none;
        d=google.com; s=arc-20240605;
        b=Bt1dlcVFftw+K7SlFT1WGjlFplgXWdlRsT7iP78OGnRnKaWJUvm1B8KEC0WEZ4H1XZ
         jfi+K0dJjB+lg/wO/NVrLWV+U0ZWYOLZvn6XVw3XVa/mcTqAZ2LT1TGaWQqN5SU9oPKB
         bHxs+QjN9jV22uzSngboFHRA4Bo/OKYLNcqBVxyEyEeoV4DNcHCun8Vd1AAlDqtebLR4
         8X4iTXn/eyevD/u6LgayohO1Gg/HPYFMS9flbx8Awn2QBPBZdgyraEJJMrkHYchf8Tf2
         TjIvl5FsrVscPvDtW1alWcnQI31JBZ+sNaN8euqnPS9EC9RYZKQzLwrZ2VyxM0UhJ2U6
         QPgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwmzkwTR65le1oWpZKenLp57NZAftj8wUZBjcBgmHHY=;
        fh=fLHE7pahJUAyKIPGPIuneQ3ReQkrGDVBFYcHTse94WE=;
        b=ktNuYpnShBMaQ3Ucm8Cq7M6dFH9tHE4OsuM+FSoQPw6D/ojaE63Tc8ZhfCiW5tvncz
         Jj7RBIv89jEb3N3qW1KSYcNGoRy/iDRwFSbqqQMW5Xo5ai4ZHnkEFrfXzQlBpFrxTLRb
         2ub6MOFubEKFvbSvVX33vrmDZeJnOpBEvjFxUX7v7huXh5/3impeGi8U+2SBtcaCmpub
         bz9YREAHNECk+Fp60cjyJ9PBKEVJPKZfLNorKj2ylaHYUTbbekgY+2bN5eAzIGRr3EVk
         F1BW21oG8kG2D0QtBLg0utf7k47uOnwudxzsulClYM3j2UtEERpGufV3n/yfHcTLxh/A
         pdJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1778640239; x=1779245039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fwmzkwTR65le1oWpZKenLp57NZAftj8wUZBjcBgmHHY=;
        b=F0nlF6Ft8AEpK1AGl37zc3bqGf6cTAo+7bwL9FKBZQ8b2tKrJfQx0CovJEvN+Rvbna
         JzDQlLkrS12WZI3rRkjwEDiPUHHjE5448j765QfJvA5Pr1gnKuAw0IRXnd4VilmMQWB7
         UPs2Z1tt9R4nntGoYY8B6BFzjaYlC2aNF2HxBX1jnjC9OUupJOoFV9dQPW4MUL7supdi
         sS7ancMZLAS691jCD2tUxN+sfklAV59bCiJzF3FzkPoA1ituB8snn/Lt77WL3B5cq/i+
         TN3Jxjt8QMR8tJ+IK17HcoowIW36YbBic3GFZRCmp3Fl83dqNx1NDcH+zAkTzzUtLGN0
         wq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778640239; x=1779245039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwmzkwTR65le1oWpZKenLp57NZAftj8wUZBjcBgmHHY=;
        b=WTVfjsnbvTnZ3uYMaM3zB/qllIN+QGj1JyoAYvPbImZedRwo99B7spZXyVNQOtCQ+L
         X/kjnu2BlMEsElZiMXJ4Uoka8sSXoSkPvfQEUjnBwp8adeyRIRG2G5bgHbY+KNNy/dqW
         wPN3ZQGimvI0R4MYSHinOKOKG7+ebHn/gWVP99mPEma2j8Q+LXExvWtA87as9yXE4cTk
         xom6ik3YI3Yz3vcZsTw9BCSBOfrkWoaKagEV3/g+cFH/yxrmMQu700gCxPP8l+/32qZu
         hOq170WqdYXGWwkf/oMlEAV5c6a0vc9mVQ24vUIZykcTps1BTX2IwbvCzDFjFgXS1rvj
         +i3g==
X-Forwarded-Encrypted: i=1; AFNElJ8WDYM9jdlSjv6/8rJrKwGONqaSNpjAnkca2U6S7V4mJx14qU61IAUfPVYw+Yy3Edn/MMBg2eJAkZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80lAia/PyUnYUqgvTr6CXtEVTK6D3W0QDw1eewu1BuTWKB+3Q
	lrAEKrZ0kdYT4SAcVx0q9oFZFALICckwE+tqtNEm8XaZ61JLlU2Hsg3Wt3ohqve67AZUHdyXF9d
	w3uA6POyp4Oj/8cwobiHA34i8iPFYr3UlM8ImX+9vEw==
X-Gm-Gg: Acq92OFTF9EyXFQ/yo/qSFHJ6CFau8uGeUBOHnfvFdg9QVUb9byuZOHZk40q4nO/ghV
	2+OqfzQD5iJmVVXdwRxHn/dsT/IQtFQyo4tIQ9Txfs29qVZIBAl892lUA3A7rYqkeWu85xsdLWl
	KUzPZdep4dfZ+s/hffNy3/MT6lShKTh2PJOjYxYAw2oXCuIjyATvbqXNGIiCTEcAmOLJpyl2gMJ
	9xmWmzcuGmVQgulZhI9gScsKklVcbUVEpwalSM9PxC81ln4Kn1iYjjSCg+at1N1PHX41J2D9pMS
	VYM8hbvuvMo1/Z+sUeKRTCMtdK23jwdjS1IkSxAft4HcEbINc7cmSDHgJx5xqM0/ZXU7hJLBrEx
	vNxBmqb6oE9RJIV80Aw==
X-Received: by 2002:a17:907:94d6:b0:bce:1ad6:65bd with SMTP id
 a640c23a62f3a-bd3e2114e21mr49348266b.24.1778640239178; Tue, 12 May 2026
 19:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513004616.2877-1-me@runxiyu.org>
In-Reply-To: <20260513004616.2877-1-me@runxiyu.org>
From: Runxi Yu <runxiyu@umich.edu>
Date: Wed, 13 May 2026 02:43:47 +0000
X-Gm-Features: AVHnY4JFEyrezQNzggVRiTtUkNxHees2vEqFLOyaB_9H0Ggpdr3CUxqb7Tp3Z2Q
Message-ID: <CALLBc2PeCABO3QwoCraK+Ras7r_z7CkJBYrStGuCuu786i-hBg@mail.gmail.com>
Subject: Re: [PATCH linux] README: Don't organize the README by arbitrary "roles"
To: Runxi Yu <me@runxiyu.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

After doing a bit more research on the archives, I found that
https://lore.kernel.org/all/20251121180009.2634393-1-sashal@kernel.org/
and previous threads did not really address the structure of the README
during review. It focused almost entirely on whether to include the AI
coding assistants section (which has since been split out and merged
seaparately). So the "Who Are You?" and what do do as these different
personas stuff did not receive substantive review, which is, well, what
my patch is trying to address on the merits.

I'm not particularly into the discussion on whether the README should
be prompting LLMs and whatnot, so I'm leaving that as-is.

Thanks!
