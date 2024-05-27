Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346C381C2
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 07:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795299; cv=none; b=XKbLFyPPgXgF/WTJWakdosLJDSYXkLT5qcpUR0E3fo8bJen2s82mzryenvdT2ScePFjBiUJ9mJpK70wlQ9JFe9SJEvzoyzQ6Q3OgnjIva744a8LtG5+bZJw52tpFqoSOCQX31V6+jPPHBy/YwdfdNnkE5bTZjqCCTsjPgB9o8BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795299; c=relaxed/simple;
	bh=vgdlxkawZpV0xZ2eaHgO28wqSVxgzaGKRc/AlVdwfhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yupsyptp58Au/kSNRWtKNVw/MgpYxKGi8O4FwKtoHXfpCdiMKyiffAhZKsa2/X3JlWtz5xWzTnkIx8pcW5DHagWWs/veB6B8eS279WlN4ggq5Cx0ewpJyGIXmuTEQvtyQY+LSTAxpbpY2gAg8sEtZ69SD95PXcIQRvqs23aFqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ib6OBuR3; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ib6OBuR3"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e964acff1aso28061091fa.0
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716795295; x=1717400095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgdlxkawZpV0xZ2eaHgO28wqSVxgzaGKRc/AlVdwfhk=;
        b=Ib6OBuR3bsAh7pgbX94POgpIQ0woJzY/D5VkxGDqfjixqijmaColvi9oHgyD5UbAnO
         bWzuiz1ooU6YIvHLTWzPVEoMpijyFcEUwo6RgHl0GEggCmzkK6l0gtlLaj9nOfiMc9eK
         KpR8yAsp3hiMkKTDuNGsb9FjNA49P8m4THwoVctjNokP+MI76rEBRLM/qjhiYOpLX+X5
         t9FYT45dDeUy3Fikuwui2SOAe1Frg+Vh4lwMwMAHvfUAZM3R+KpcrbMGbxYnHNjp0wOh
         swmwsh0+mseowLpVH9BgbN1dNWybLoqw416zIvULrRsJYKSMEwiEdf2kc6203CDTT20r
         mgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795295; x=1717400095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgdlxkawZpV0xZ2eaHgO28wqSVxgzaGKRc/AlVdwfhk=;
        b=EzA8BOpNDRJsqKKMt5/nAS9+ZCsZkphSkRuiVPbQB7F6ugE9zZUk0ifqkxmoBAaaca
         iZr5Bcu7I4okRsLRiQ6AAOWXqMeUzQ0ODBgJeUfj8c6a1pQiePfqRoXfUkMoMOwL7uvm
         xHLNzPLQHsQqKCAsEJOCcoGGpDpRjc4d9ZJkBgMOnlMHpH03TY1hO2GYonEM6aeCcHbQ
         2mfoujMYHZJY5Bs63K0796P7kcPk0RuJ9Er2wYc5rRXHYfb9zWNftiIUOQAC6KAplGUD
         KA3YT+wJkg7mcqmbldXnKHKL/GF0VpwGWrP06mZdo8L6gssIVcZ8ilMz9DiTQ9b+z0lT
         FtHA==
X-Forwarded-Encrypted: i=1; AJvYcCX/L0RQC3WqjMzF7ddN81dmuk+3uJ2bHcfnoUu8qwV6g1QCvQj+S0bNywKS3FyAJzvnw+0ikFvnoKZnEO2mWJlcIDlJsef1I0BA
X-Gm-Message-State: AOJu0Yzu5caugBd4Ct00bZKAGvAg4ZZaskmIBRbIkXq4hAD3FqwUuH1u
	kN8JtsdxOi1UkBvkP3gvFqEuuMKQpfeoZOghjo3Ep+hvqnYiYs0C6aoTZWF/EsqO6tDfoiOSaw0
	fyfzIptgkYTfEW8RvW/lLwc5DoIBwR5yhJhNXgZD8SOgcHUvM
X-Google-Smtp-Source: AGHT+IGLXoh7sz0bCxzSkFCiS6AWpWUwvuYxn8fKZ1rYD+46hFS/m6HJPD33W3kGiCGR4jBo6gaC7Qv/4okEav6ckg4=
X-Received: by 2002:a2e:9101:0:b0:2e8:10ca:2437 with SMTP id
 38308e7fff4ca-2e95b2db206mr49603801fa.50.1716795295202; Mon, 27 May 2024
 00:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514041223.800811-1-foxhoundsk.tw@gmail.com> <CAFbkdV175LdW_r04DhhG7pkE4xs9W5305Unk6RK06SiudvnzFQ@mail.gmail.com>
In-Reply-To: <CAFbkdV175LdW_r04DhhG7pkE4xs9W5305Unk6RK06SiudvnzFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 09:34:43 +0200
Message-ID: <CAMRc=Md2NZhUG+HmPR4Zd_+ho3PraB13m+=ByG44+Nv138N1hw@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 9:05=E2=80=AFAM Huichun Feng <foxhoundsk.tw@gmail.c=
om> wrote:
>
> Kindly ping.
>
> Sorry that the last ping wasn't sent in plain text.
>
>

Please don't ping me on the morning of the day after the merge window
closes. I don't pick up patches for the next release during the merge
window (like most maintainers) and I need some time to catch up on my
queue during rc1.

Bart
