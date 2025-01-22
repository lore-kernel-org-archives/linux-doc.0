Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22314A91
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511427; cv=none; b=YLlZTgHL8X9EDvonFxbaFU0xxYHtL6Nr6Pc5agda3pGo8Kid+zgm6QFAi9QgRIOSpVhJ5Yt7IKMzw/5lxu0pkmpECQ6muJcXrCJzVhxhZr3DXuqzcmFKBwpqgz6yR7PfYeCz/IN49AE1t0ub3K9Hn8hNF7xItVyuA3tzKhWTS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511427; c=relaxed/simple;
	bh=6PreRjNnX013fn/u59VZ7hEjJb1NTCUFe4j+v607J1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6raA7bLasizfaj5F2wOjpgAzRdULJ4M4CvdVlg9NogDhLvjIHr6wInYuLgLmW4EGg6fDSWZawkPsJ5mJ8WZDmSKfnWxmppQwJEKYShNUSqfzQ7x0Xk6Fd6n19BT86FP7lGHvukEiU9qb6CldOUKbXvGfoDfGgo76zJEq0TC5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ACK43tfJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ACK43tfJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so10276202a12.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 18:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737511424; x=1738116224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZUK9+0gr64wB88DZZHRsIfgEOg/D9VO51cwwiZh0XU=;
        b=ACK43tfJyHZfh57emP8q5QmmX+u9FwdBcMPjaIsbshJDlzJY/OpjT5Ki3sB16bDvwx
         wD5PCCY0x+ChX76D4kHSHDSa0KFe2Qbs6JSWu2e0uVZMDIxi2TeI1D7yqT3LeUDr+0lt
         xgjYiJRk62BW6KpvUpkB8KdEJAL8mDxbKbhCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737511424; x=1738116224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZUK9+0gr64wB88DZZHRsIfgEOg/D9VO51cwwiZh0XU=;
        b=w4VFdwZ2F/eil83AM4nj74AQfY146XUJSZ3U5mKFi0eAwplj/5JSUuoRjbu9GW/KAp
         MO5jxUu4BGcrz9lDdW0GTBvT4mb5SnnmZk7tGK3LZwTbBHEu/0q0afOZBF2JKuhAaCpm
         2mbSthFcnOOQeoWvMP88tjslmz9drmwhFl4Y/DyfyL/HpkWR5KACe1Vafm9KQlKJfo2P
         dIaANooVo+Fq9hxA2dspVcFraajZdNOPS/fiIrswXRi9Et4anL68+ISL6rmyY2BqTdPG
         E0dRr5076oqI6sK9/77PxA+JggEHhjEQGPJEY4Bp0woh2CoSGg2ZzqnfD5qB9H+LntFy
         uVFg==
X-Forwarded-Encrypted: i=1; AJvYcCUk8lZea2kzdM4D8whHYQZx6OBficHftRo3Uzso59bq4embg17E4xhPVD2SreZz1FBBprMvJZM9XnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdAah7LR1nRf3PoavvB012izop/zVS+9RCR7N2QGuTSuZpnNcN
	NsSm0jJuZIwfMeRDx9c9DxG4B0Sf1zJjmW5fEjMVwxLwhJSkvh9I7uMSnGqSds/VX/6nBeCQOS3
	ZKUg=
X-Gm-Gg: ASbGncvi0ZPsdT7KSlTcP2DuekRsHiv+CTF1vkvOPFQARAKRf7jW5KGtvXVMdRr0nAo
	EbrgU/IETAnTl29l2TssKgZmQaCBkvXa9YfyoAI4jN+9n0Hb3QeWQTNglWyIJXDUdwT11hF3jfS
	CzMEAI7Qhb37LmxpcoVrmfhVJx3KR3jyEBljE0cHMykxCNwp7DS7lfhAByUezDRU3YzJI3edEy9
	7N8OGgg4B/kRVRUFKSeFt82NlUOOFOnfDiG8JGdGJ1XICeb6gHp7SBg8ZFp7mbLPMn0v81JMRqe
	XzCv2pvK2CuixK+z9erjtbRguYXS5xsitkSUAAwW/7M=
X-Google-Smtp-Source: AGHT+IHhvdudM6o5Wi+pXlp0YI/2FYWKbXyD8F3cLQ0C722Hh11itpiZPnMqEXwmX1TwjiiOg9MRmQ==
X-Received: by 2002:a17:906:7314:b0:ab2:f5cb:c039 with SMTP id a640c23a62f3a-ab38b48ae9amr1802680266b.54.1737511423664;
        Tue, 21 Jan 2025 18:03:43 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c61e0bsm824218866b.29.2025.01.21.18.03.42
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 18:03:43 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1087575066b.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 18:03:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGgys9TMGYSAuBVEIlTjpNxJK21SsxyaSyScopdieO0oI7JFZ2cY7V87PWLedrAPAmMVRhZFYzOBU=@vger.kernel.org
X-Received: by 2002:a17:907:7fa8:b0:ab3:875f:a246 with SMTP id
 a640c23a62f3a-ab38b0b68c7mr2036947466b.7.1737511421957; Tue, 21 Jan 2025
 18:03:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87a5bltgf7.fsf@trenco.lwn.net>
In-Reply-To: <87a5bltgf7.fsf@trenco.lwn.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 21 Jan 2025 18:03:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEWhHYkj96zyxoBY81J_afP3tAq==F8+zjRix7hwgvQg@mail.gmail.com>
X-Gm-Features: AbW1kvZTt-TaMJn3a9G0sdjipY3Fx5CrEKpz-ksw2A-l_k717UfOZh_MYot0o6M
Message-ID: <CAHk-=whEWhHYkj96zyxoBY81J_afP3tAq==F8+zjRix7hwgvQg@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 6.14
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jan 2025 at 11:48, Jonathan Corbet <corbet@lwn.net> wrote:
>
> - Clarifying that Git commit IDs >12chars are OK

Wel,, I'm not sure that was an improvement.

I'd rather not see stupid extra random characters.

We'll see. Hopefully people realize that "at least 12" means 12. Not
some random other number.

             Linus
