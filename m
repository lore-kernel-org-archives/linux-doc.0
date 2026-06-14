Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D5191F98
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781478261; cv=pass; b=kznRu3/o7dZq79UMRYo/FQuYuM7UgJJJJMO530Cn6q6q49OGdzbvrDV+ZJFIq43ke9F9YRlwm+5main+xFImhQdqPcJoKJSlaPoCiitKpJrDXG+ParWCIIlLO3yLACPl4c0zXz0WrHhOgS7D4kSOJ6f03DFLCyhkS1k1DATQqj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781478261; c=relaxed/simple;
	bh=rzW3LaS9K4mSg6IJCxAjz00Q7mrH4V7agp6NPZUYSYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ob0IsHT4A+91ZgjK7G0A5gbXwMDHktrSNg+Mt5qf9oRRmFKBZcoKFkhYmoPu+DGqpF4sk5byBOFreAE1eN7iWDqFH7b+mNKXRQWvOtJoD6Pv1Kgj2+Ap2qc09DAfPYabVGnXXJcdsgVVrRXQTDTm5C9Ieqb6FD1IBwbROBe1asg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtdnv3HF; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtdnv3HF"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1363fe80fe8so3828014c88.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781478260; cv=none;
        d=google.com; s=arc-20240605;
        b=Iy2dpWmUwZ1bJ5Op66wRbAXIQ3L1ZFMcNed9fnBgdpNVCNdi4awDhJfkKnAw3W7/E2
         Kmidda8bhi8ay3Iu2zrqcIXHrvht3kQ6kTLNcXQBQVu0qBeG3mYfaSZQE3A+hf8EVdCJ
         BETvHm1wa41QHSKY8cxXJXLbOUpNtZ7FlfYgTyC+H5izZTZgwfJw16UL41jmraR16Qfx
         d0g1UcYGw3of1IQqkc+Z7Ee89rjqHyzQdAv9OZBvep5dVNYaVfBhv5CoFAS1nUtBgjkD
         afiDi/Y2PxLf8xSS+n99JXC8TOli+ans8r0mSyuOOOZLhjK+uNgAwz2oyVgRFsIG2xuA
         dhtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQFoZgJYV1TW//O4GE6lS9bPSVNoPKLwy+jMEzoPsoY=;
        fh=d+CRItW1IQSg/vzwG/K1DG2jbsgGDKXuxszZCJf7o3E=;
        b=iKSglVd8Kc/m2no81CG60OBo7XcBtSORm68UGy3ReFk0C1cWzvFvKRmgnIhzgyDgJI
         JHlK2L8v2LhB70RN7QRJf5JnDu23WUVDdCcjhdKDbpkMW7//NCXXkfliF92Es3Slxk8Z
         pxfeD6GUFSsD7zZKlq4qZZ0b6pO+GygxiRGa6W+O/yhEUKjwfbDwJPoAkAuh3lKFcqz7
         67QS7uvFNX6EHEb+ydFgUakUqvPLHsA+JGtNPOF0x9+/pUxegBHi9sf1rUl5wgynG0Mu
         1TeCRlWqtxXOZovv73gPktZiB+bAJixZmMWup/BThQfXJaTpJRoY6djidi/2Ftsa8JNB
         FObg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781478260; x=1782083060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQFoZgJYV1TW//O4GE6lS9bPSVNoPKLwy+jMEzoPsoY=;
        b=Wtdnv3HF1dOWaenZWZJsMUv06Wmjm5VfuKIBs7NEzsxdSUnOnLCZiMxgStk3LSOLSe
         aU6UdoF2yPTVtwydTwAcFj8yDEnenmbw7uVJEw2HOll8/2l5ck8rQVfPBR9cjhLNBAyk
         +sFYHDY3n8Y0UilqOjS8LgC4Cua0DEeL/llKDCF7tWJmC1+/nRJEEJU3ilbIMeG0SjG3
         WKna0bONp5JmUHzPMtriIkmDUfegxe+17NLZ952zaAYkksTTIUH2WSxIxbRZMRj7zuAs
         EeOlJshiQUbEAtUfB3CegGJfqtbrCWOsj6YQgh6KHqCa0dgOh+Z9soKpEbvbMbPBTsBx
         pKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781478260; x=1782083060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQFoZgJYV1TW//O4GE6lS9bPSVNoPKLwy+jMEzoPsoY=;
        b=CXbubYOeVO4ageLLfZ2B8Fx8zoz1ISsELn53EHhsUGL45SVyumNl40k870Zx4JcSdk
         9bDSWM9wRozJ8Y8OoZEre4p4Rr8CMudZD7m+/rr05bI7Mgjle+LXbb78KOxX06l+j8za
         ZSRsLwebZMhjmjywMTEfjeBamJaYpM9y5trS0wlVUfH3Ue9FWUNd0CSJT0LtMUHt9xfS
         M+dEAYxq5qh+IwFfaIkszygLQcm3S5kF01ZkkH0VS1soVDaI5/rG9bV86OL6Uyi1kx3t
         c1H1LuQwn2zVG8diOvTZQ8Up3Edwk4/osp7HFqdgI1kkN1Z1F7JUuH6ZnXdQcywljsko
         KlPg==
X-Forwarded-Encrypted: i=1; AFNElJ+N6Sg+3xnsrFt2z019W3vPGorjMl4xozHnrFfcyPtlklYgVj3KSAZOFm+VGlrjfdF9flOpNeMJbRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2dQZ2IWVoLx+Sp1DjwslAbUM9ye6pmAJDFNL2da1WNrB3Fgip
	1ktuoUMF8HCY74FuA5h3M+i2K2N4z8MDYDgc6uaKH5iAp0nmdS11nl1QHACzqtNldXJezHYRGEs
	BHcACSJ+Yg1IP4I/PA0+MpoFFSZr9QVs=
X-Gm-Gg: Acq92OExrBqe7FKdcd9JGy9BMrmPnFXU07Z081EwfsFDM0CeLEsK/WIb3rjKjeRtp0F
	cJ/1z2eBfffu0gQG/O6j4yVtwGr74VDdepcOSugrLS6CgB8ytEi5SNnoRjH1HfHNxwd4imoRhu3
	b2S+tq2XY+irDPq8tmWPpy9H+iH0urqb0+xftBd7L2PkT+DrS8TUt0BfVqj37pjCvoMtFkTxTr1
	MaxRxOl5MLSRLfcFMjLuNwjwmYUYK/uWzWh39HpKGJOndBso3E3QVIDR8OUH6USX0GauJpOqvj3
	Evf9qGbY1lJ+ve2krLSh15vq1yfYF7hqiHYBavBo7rFnyGf7iBmgpAmLg3LGrMJcJTRAOMQ=
X-Received: by 2002:a05:7301:1e8a:b0:304:3c33:7ae7 with SMTP id
 5a478bee46e88-3081ff40823mr6282361eec.7.1781478259594; Sun, 14 Jun 2026
 16:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
 <20260607234343.22109-2-kimjinseob88@gmail.com> <20260609-glacial-colossal-38b4937ec620@spud>
 <CALMSew+cL0_kG6W15RapxLtE+Fw2_DYdrYoRFSjENQktWw2H4Q@mail.gmail.com> <20260614185551.10ca9e0f@jic23-huawei>
In-Reply-To: <20260614185551.10ca9e0f@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Mon, 15 Jun 2026 08:04:08 +0900
X-Gm-Features: AVVi8Cc1I5qF5SI6k_QOccx57286vKkIyKY9ls4Qi2qkv9NyvMEQc1iX0U3ok0I
Message-ID: <CALMSew+y_S2LJ6bBiRWyZniEaD+V21kvOiXg_=Gr9dnppUZ3mw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 1/6] dt-bindings: iio: add Open Sensor Fusion device
To: Jonathan Cameron <jic23@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 6=EC=9B=94 15=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:55, J=
onathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, 10 Jun 2026 18:33:54 +0900
> Kim Jinseob <kimjinseob88@gmail.com> wrote:

> When a device needs power, the regulator is required, not optional from a=
 binding
> point of view.  If it is always one people can use a fixed regulator to r=
epresent it.
>
> Now from a driver point of view, the regulator framework in linux provide=
s stub regulators
> for missing ones - on assumption they are always on.  So we can just requ=
est the
> regulators in the driver.  Keep it simple for now and use a
> devm_regulator_get_enable() in probe so we have power on for all the time
> the driver is loaded. Can do fancy stuff later when you have a board wher=
e the
> power is controlled.

Understood, thanks.

I will make vcc-supply a required property in the binding and use
devm_regulator_get_enable() in probe in the next revision, keeping the
power handling simple for now.

Jinseob
