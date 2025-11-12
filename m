Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAE1917FB
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 23:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762988689; cv=none; b=NxbUakgLr/yczmqlKNXq3Kdve8M2RuqA31HEc1ygOtB+FdvSEGD1GmzRx38MEPPWC8KVYo17rgA06+40cIOHV6GqqoGdwTceNtBqftgEqAJhW+TxbHC8uSv2xYo4RdJz1YjsvvuTlY9j8ZfuyKosj50FTG9Sjr74DGY7t2l+FHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762988689; c=relaxed/simple;
	bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOFPnIsYbO/dhfMXMmQiRqxy2uBatwyU07NXGQWNVLoGE18YXSqp7+jjTLNCJzggxVUbNtot1+znghJ3uFe4gzT52UZ+THXaydI5g7fL6rGscyNnTsSCuVkqHk4iEjsE/J17PLDpsb22NkBSS724MNzArPZcjRMwsCHebOitXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9ORUKvw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9ORUKvw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f7e50da2so330586e87.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762988685; x=1763593485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
        b=B9ORUKvwM0h6Q5eY7ZLeYgVlH+1oepsf9GzLbU1GRjIM/a966d0L2zTwlPVBr7eU0g
         PkufAHA9XDHhJtT05u3RDSjIXpNTJKQX/yX7nC93kMbUZHQ0xOV1/OSNeAC+Xl3MogaR
         ouPfy08qo5NtKk6hFXksnGaOSBWy1I7U4Ph8R30OyxjfBTUIyNJa/XF6yG/UtPs1nKOp
         H32veD+OVwj3vcXjQfHgQPii0C7SjkXnf6a+O1z48mxu5l8xo4d3dsqlzlSSTq/CoPcU
         GGGDONzBiERkbLPOKkdg6O+RWa5vs6BxFTGRKY9wthALdqYe5woGVxRg2lcTkDvusLE+
         HIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762988685; x=1763593485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ePb3+WnqfOOCNnILjGCw4smH5j4z81BDW0dbUUEnCu4=;
        b=uAt23IHFHN8WLJP/Wujp+dpawgkIzNQcR07SvMu3ctrmP2G8lBBg4mFwv45IYrU1cz
         ZUqYTPNOKLNSnwHXT3uV/oebNv4o7OPY+PX0duaHVTLlIRqlLvXbiDKo4SW3ujuJ/mdb
         sptMOK9KOx/9hKp2XFC3SjNwqM3mYEY1d35ebFTa1Hz8BHkSeH6tzRwcVpcAafXSd+WM
         cpcB/M6HQk78hNXe5NlJE9EWCGwkqbd/uXmUHFJvV8Xf89F39WEisGehksOfMJ77unAL
         WA11ifJHf8WSUDU9cNuxAmacDNHwIQjRXZr/oJUTLFeEPQRUNm8zu97LjY/mTiDGgvhF
         fsCw==
X-Forwarded-Encrypted: i=1; AJvYcCX0JBLoQQ35ExWbaWrgoTLWtpdw8FPSXtEBXbGuHAI8vd4M3dVHyO28A0Bd+q7aBlk+4ci5XHisuzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhUqBibLGr2GRLw7Ik+oJ9zO/cM3vsLcF44EMXP2SX+zOMB5A
	wBBVAXSDaHtpvgPL48uiN03/G/WnyDPnHpeU0ZdI87AD3lNo785Tt6rMRcF0LJxcg4Rkzx5dVdo
	jOcc34ACBae293vbqfVmLOun4+jPVv2bOwa9jabIe1g==
X-Gm-Gg: ASbGncvP0dhsYOVdzSjDFe8T+DMdxh8eZ5R2NC/6wJzL5TY0iAWE/VF3j2G+PT6VIUs
	rqxEfgh53WaC6CzwpY3n6snhVnojiaCMh3U6/FhiFq8gHJWTKe3h1ubcGrYBdHa+Ps+stLIro2Q
	M0dxfJYrI6RiD63mkal7FleT9RamVYftL0u3/cChGmRHktLV5btIIMz1mLg4ZNJmRddthfHUFRB
	Fm78hrqw42vk+NH1xVUISEjy4BUtvRK+OTGEcrQ89BN2KfwHK6eCBSVTDZXv6xBlKNzT08=
X-Google-Smtp-Source: AGHT+IE1BF4Vv10l/Sjj6kBtQfn8UzqdYZU/iJmxP7Ig3hG1/jtYcI0ag1MxBYaDfkNDF6y/ADJNCl19evcJlZ4su28=
X-Received: by 2002:a05:6512:b8a:b0:591:c8ef:f838 with SMTP id
 2adb3069b0e04-5957ecc2749mr332999e87.17.1762988685375; Wed, 12 Nov 2025
 15:04:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Nov 2025 00:04:33 +0100
X-Gm-Features: AWmQ_bmnNGj_Wxq99lzqQymduEdozG5iRqVkyE6m_DF6KCgBqogfvoiry7COaZQ
Message-ID: <CACRpkdbv1wZmLRu+r4PoxqACBa3TGzqnhAq9LvxqF_w7Q+rXwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> From: Levente R=C3=A9v=C3=A9sz <levente.revesz@eilabs.com>
>
> I went through all the datasheets and created this note listing
> chip functions and register layouts.
>
> Signed-off-by: Levente R=C3=A9v=C3=A9sz <levente.revesz@eilabs.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Impressive.
Just taking the time and adding some docs for this very popular
GPIO expander is worth an applause because of the general
friendliness for developers.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
