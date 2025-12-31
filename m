Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734830F542
	for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 22:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767220156; cv=none; b=aYlijVt8B4Y0toQ4abxXMEQM6Y7LkNHlyn8l6LTNB/rCiZpxUBWylsDr6LiGBwg+aWsH+mo1lKd1S8uZG/TNXvAQYysXjgdvR2pS5U71K1VVCLM/rdSyfzMgrNbEax8syAhOglgm0AQpG5D8O5OkN5R3yRk2HrZH+hGcZaxIVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767220156; c=relaxed/simple;
	bh=6iFdMKZkJ6hGjkxBe2dINSuN4PGRXw1sktK3VGLhTqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9JQ+BzbpizjZii+duYXmcGG0dibX1lJXQmncZ1eEUorRSdibhfRIoVEvY4mP5tBrXPvH2+SojtXD8cU9f374rhLm+gZAaYG0EDmqwaxMjax08znVDkaRwQliEG0/mW9jfdcT2TN0arJ6UIiEoUCw9YG5i1q3tn0CpQr6OE8Lh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUTuCNB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUTuCNB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B02C2BC86
	for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 22:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767220155;
	bh=6iFdMKZkJ6hGjkxBe2dINSuN4PGRXw1sktK3VGLhTqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uUTuCNB2O++1hjQmuYdQbo+c4fX7oUagTIlKeIVOXRxJYZeQ/DloReDOoPJpGm9JD
	 Mj78Y+lO/yodsGpj6KPy/aOI7//+e39DkkvARs1DhEVE+a9iKmxMXxV3KihRjwUAJS
	 iNrqLDNqhCiidHV8wCLA7vfcY5oGVZbtbPl2NpZGnAffWFdvdsRnj4Y+2PTSQmcPxL
	 Rl8FSVQpK/ViJP4JPfHUGwCi90JxvFo5k/RuApe59HQxrMQrajW5qiyndmUafAL+kF
	 njYflr0NDrYqw9h7gyvIqPj+ZmqvgOtG39tjCw1jCkzbCDZyE9TEWPJgbmySR/FZGD
	 +hU/QuV1HMJ0w==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78a712cfbc0so101726317b3.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 14:29:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlZCXdKAecCAFaVXQUQYrmtE+C2ME+4oTO1zsB3uPUJ0Trs9BuhnzEIg8UI6hompXqOS8ZXinpsUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZuLPsD3drZMjFb5xRjDthTjv+h9Slg+xtjJBZ33n7bS2WcGu
	Cs/mbwnUsUJY0akF9hZqOBOWYq8bSe0+KF7kYs8BXADJUnAs3ux75tiBcnmAXBwK3kwmjmvQzKA
	9tDRrjEteJUZWgxH5c4xUMz9aYC0uTiw=
X-Google-Smtp-Source: AGHT+IG1+n/ex2NEoCUCMCBnC9WyiECa7Zs7Ak8DBsCyu7qqQn8dF+w1bby0paeUKzmRb80pm4ur6VI9kprHt+wRVcY=
X-Received: by 2002:a05:690c:c522:b0:78f:8666:4bb8 with SMTP id
 00721157ae682-78fb4067fbdmr306968037b3.55.1767220155178; Wed, 31 Dec 2025
 14:29:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de> <20251212-wip-jremmet-tcal6416rtw-v1-2-e5db1b66d4cc@phytec.de>
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-2-e5db1b66d4cc@phytec.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 23:29:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLnpia9uAxXBggBHsq-4aOonPWc0BMM-tScNhw4bZMwXGA@mail.gmail.com>
X-Gm-Features: AQt7F2pa_qGQ8UWKBWoTq6TW2pqjjQEMlUn4YtEc638rbnmQPMyR4tK5hOumyoU
Message-ID: <CAD++jLnpia9uAxXBggBHsq-4aOonPWc0BMM-tScNhw4bZMwXGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: gpio: add TCAL6408 and TCAL6416
To: Jan Remmet <j.remmet@phytec.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 2:03=E2=80=AFPM Jan Remmet <j.remmet@phytec.de> wro=
te:

> Checked datasheets, the offsets are identical to pcal6408 and pcal6416.
>
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
