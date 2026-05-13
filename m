Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3224BC03B
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687576; cv=pass; b=KT0ioko19sc+yJqmpxG4AwLiRuqjokkag5OuforCgZuEt0wW4zY6MdT7MAbAhlX/NJkER/p8fBpnne+dr7XBQd11YFU8+dEdG+sUpkF2kycAaVXam/fZn+0DCWkTMQtpKVEsGU6cb4eI9aRq7ujPcURim8ReFlXDrAT5xxyUFLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687576; c=relaxed/simple;
	bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZAv8EYuF8vCcwDZwyIyQ05mjV8iD9Qags8edRc+TpfJfeTUt58G1lL675asulx3yec3+VkNNFNL+1RAiaSX83yC0paJDwwTt72WM0MJZa4nWClhgqv6GdsLrgX1CXUt/8WBEzsHk7CeHLgG4fqPpgnaHRP/QjEPh59d5Tvqzkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3YYctmR; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3YYctmR"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f5879d63ffso373761eec.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 08:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778687574; cv=none;
        d=google.com; s=arc-20240605;
        b=ahmnuRoY1r33fGn2zPfRZpsDXd7Jy+IrSwQPd0RDZgyDBMeR+HQGwPbCDEYlvEtVjg
         Ii0vbjAm6uyanFFoYXJTEgBRHsWSKZP4dX0LSJ2csIW/sPvCZfnl3l4cex/Q7GqEJyZw
         RGWTtKQyPOIF7mcOhuJkAClj3EYGJtiRrNRDrkCuBZD6kgvQrZnLM4/wZtA0m681RCHY
         OFNHwBRPrVB4CNgGcPH1e8pkC8TlStlzsqFf3ogglp+MDpS6PaLVloxUWZS7NXS+2z/Z
         9d1XZttOBicWH43pjCz3+O0DVCI022/mfkwiQRB55jNz6BdtpL0Z44uICJ9EjE/j42Wk
         xGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        fh=PDi8cq8MC2TfQlfolE/DD6KCQbpszKyHu/SMZtPofDg=;
        b=LYNGl6h7T/UBmKSx/89RznMrZ1KnCL3so95wG+0S9fuP1qyHkpQ4B6MPblF1Ne2eZk
         ejPAZQRzw1iNd9qfSbQPpTsNudHpr2bNM8rypk/LBgD/L4ocdnmuLrfq5Tn6MPMZd+j8
         Fb9VNyo9qMn+y7eBNpJ5hRySBVdxCuYen/Zn3mbLSU4jWjpj4SaelM1P/jIY5mz/85r6
         tH42C9Qj8umWBYwPbO8Ol0gYijMUfEzDXGnToNl7vjYCSgAnLzdy5xPRwsCT7CAcilMe
         i3eCvxAquJvcLIF1uplKwmlS+q7+7ve9glaB/bfGmLshsPgup7NfaknTWsOO9yD9AiIq
         3iSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778687574; x=1779292374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=b3YYctmRjLeTnMhENHoZ7fJ4dEn2jjGSn4fB4hht63P3d4CDJEkwNIp2lCXZlEZBxx
         hygo2jTJqN8ZItU6TNXU21Ov5UZpt/swvWHiSN07zj9M2rZPmNJl4/j9Jx9YC0CQhhug
         14VHOnW/6SH0q03ju94DHq1C6OPWoPbFBWD0/1ELz3/ysT8yjevxgx2HZsnrXEtHs0Rr
         zye7NpEL7nAJ+ZtadsBRzkWDFclDnozWcFUiLxR1lTwvjdLjH1YhzZRIfCbjbUnDvBb4
         dI1wJbz4SMiDmmN6/bOKg52yrSM8Bj2B/ZUKVw5sx0f6ti1dQuHNT4sNiOEQqHzdlMLG
         7dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687574; x=1779292374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zASBe7ByZeLu0hE+izBfltpFmuYzTuAbAv8KqHgRt6g=;
        b=B3hdfIH0UQsBX4jGWnsShzVzU0Dqn1l0p4VIjlWiLpxiWnsVhXmWGt1AaEOCxEJK3t
         Jj5WSFUsGMgE+DJjBsKsLVCAdCtukJ+K56eyf0sNwtAwpjxBBOVsRHzlLwkL7QxutUOj
         aaImHZBS0fWJvx38ANs0RGFsddMZ6WwVwL4Cst9sOYHw8T12vnHhEzWP1sU+2uqnIR8o
         MB2Sdh+LGb1y4Zh1SJyAxjcfWpdF7qscQRrtE9z/jNQxTM3N8VuEz8GdYaP5+0zfL0+L
         d2+EX7jNxGdwHZQ2hfERODdxOApOy26qm0iBNJH+vsA3319Z5+lE42R7avo8Fpt53hWy
         HTRA==
X-Forwarded-Encrypted: i=1; AFNElJ8h/BJSe8VGlllpKywj/csvqXLfaB8M8rkZW8gm0zCeVkDg5DtYACIutwny5wllJu5LAOTH4V/3aX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF07btgH158IF08t6cwegSB/YYP89emID1sbon0mIYjHy7DUQs
	0zRFZ0lPFglAmw3uDCaFBZzbcRpmwuXC45jM4DUfzRN1p3R85kIkqpPNAWpywTNeGGoBdAsSojp
	F8VID0hcLaQTNQcEgAoFMK7B8p28lvKI=
X-Gm-Gg: Acq92OFScyDdi4P36PBrBY5QuVOcrhsxtgyKqcawmFMy5E995Kzvk9DH1vv82HDmo5A
	kKclxXWDeBLNl3gLcYUBKpWfj4HQ6t+Bj3c7S4JlUQXO08ZlYZT6atVdx3OM1it/xR7rYyB8gOK
	qVNEuPStTzC9LIEVgtIxwRlD1pFtyzflnnpqmDp58/t2J1uidWzeRLobtRZRuRKL5VbkAdy0y6G
	fYFrj5m+t0YaQNauF1UzrmluOSL+pw1lbsIJIQoE03hqByuxzHHyOpelwRD3Ei5aNCTYX/iD+JE
	bnOTtozUGNDhzT0x9E8sC6biD/71140fv5gFUrrFJz2KXr63yvPJNeFPFiLbcDloEUBornIBQIc
	fO9i2xNAOMzsXj7CxgHIfuHc=
X-Received: by 2002:a05:7301:290d:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-30117085553mr1095439eec.1.1778687574140; Wed, 13 May 2026
 08:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr> <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
 <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
In-Reply-To: <5220poq2-qq9p-27p0-3sq9-50q1845n76n0@vanv.qr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 17:52:41 +0200
X-Gm-Features: AVHnY4IGMOl_bQlWYRPsiusXrrcSAS_I2ISamEAFUJAQs39YxFfM6FwhNGHVvT8
Message-ID: <CANiq72=QahBNGuwx8H9kA9HYijMi+H3RmZ6B8YS_UrFy6xW7Vg@mail.gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Jan Engelhardt <ej@inai.de>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:28=E2=80=AFAM Jan Engelhardt <ej@inai.de> wrote:
>
> Linux, and many other projects, have run on a "The system version is
> king" model for a long time. If libelf, binutils, gcc, libx11, or
> whatever the dependency in question may be, the project trying to use
> a dependency would add a few-liner patch to broaden the accepted
> range, rather than trying to re-provide the dependency as a whole.

Definitely! It is why I mentioned "even better", i.e. if it can be
done using system packages across a reasonable amount of
distributions, then that should be the approach. However, sometimes
that may not be as easy as it is with very well established (and
stable) C libraries/APIs.

Cheers,
Miguel
