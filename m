Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43594350A0F
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878189; cv=pass; b=idxHuW11F6G+w+DH/brd6pf07H8zesZnFaQOJMRNluji/jQOCagE3BC6zKU+2xbjT5ak0nZMfclL76S0zNglUd1ZobsT5HQ2XQdDFCRQOIwSrnl8D7isfjK4HidtYBlDsldveBkQ/3Q3luL60SOR1C0ZG80z4BZ0ishWf8PLw+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878189; c=relaxed/simple;
	bh=AA68aMrswykmX+faf9hL7AMVgYZ0rqnpXfsUi4nLrBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjnER5RMmUFKrgfF0T38CX+nm3+t6U34RSzID86FAr6+1lJvAL49dIZIP5NN5RneMcCWp8An3NYpHzOzqjc0ne4rkaEMy5tf2DQzn5BRNIFVhigD5bb6vLNRD5Evoknyxzy5Fx0ff64uV+33+huJcYsdMJ8JIkQR1m6q0UXgejI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/dl1CPN; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/dl1CPN"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6185so12038165ad.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 21:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789878188; cv=none;
        d=google.com; s=arc-20260327;
        b=sGiWAZ+ItmiEnWR2QJz6NoRqzjaH8bAmIA+SorFXsrWIEWce2Z5fQ4tZE/RdcdwK8i
         b1ulJuQQ0sLsm6UFh4ojPttE3OBGkg7PpvrW/V5ltCTL8SRDseVduSM3DATzypqW1rzZ
         8WEaqCd/r48bS+l7CBgHEjJVgR4EU/4gKFcD7RewkW+NyxZj6O0BMaSqH80N0SW0sdM9
         BR1aSI2WWbeV40szSJNpyG1sHP8LUOiz+auJYHN7ofiLfSNEuXY69pLpqFAnNaIlbHCI
         cbid0VxfaWsSk6KopqmWSEa6hMRDTJm2FcASpHuLluhEZJt1/Vz4MoOI2dubXZt0E0We
         rgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        fh=G1u+Q+WcbG3KGtgslrdzJAZohSxexbEKAjIz0HlW9wQ=;
        b=VKThl/VnhrBsTrJmwT/U7ywEiD24ndKbe/wjAzXjszHd7kysBw/k8PUiNKXqf20gLN
         kPXLd1O7YVzwIReu18Sgl/t7oBbGR7H2NRuQVikL3gXKWRqQBEtkHMbBK8s9EajSk2N+
         NMxVDtwD0xxpEFQ2Ls0+rgXv1NYiVVsEo3CfmXQHndMJdquiAOUz4Fa1GXYA56LASAXw
         G0RUf+LvPrEI31cNKUfNaP+wariSYs1G/KeV2hpYCOU+uNR6V9Fsg2yITmf2P6Jy9DUd
         OWSpj8nUtY/EmmD8YYzvH8PWSZ4aH2FxuOQ3TyjsyhAuv27WJMgqrRvOXmT6JssJu/pd
         GZPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789878188; x=1790482988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=W/dl1CPNEowRGf3nXAA45lGXiL+KQ2ugCE38ruHDEMLcYVVQPpQzXcuqDFD8LwpYqx
         L7TJKTCvDRnzusRUkblgZHoeNDscG1CNN+4ijSWJ40OrId1h9TLKeSiUaeqYYHaXDiw8
         u7mlSY14AH4OoiLQJBnDOTFbVQdHhBHsplvfA77JVicBXc6JJj9vClQ2yExMSjRMBGcN
         FTcSmii9uep5OxF9os7/m4eCF7ADQ9QHBNTEoJ6gVCr3srDQuooKYyEl1KkzT6Q0ZFSj
         IfJnDmZnJa4qkS8kfB936vR/JVVUyf1KZPBFy5ZW54JA3H+kEInMT1pEHhuQTQqXnL9U
         CmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789878188; x=1790482988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=BfT0U/rra1ejoePidHTBbgy10vgQr4BZ7MkM+/1B7ZlYZIETVuqVDe15iCTDQa04eb
         P0po2MkkSNBWVMs85ZQZPIgE47oHhzm8LIDOZbWTpTP0ystwUyEZdxoRXGkntTs3m0gG
         5kFAIQi1owaKE8q8XsOE7cWphMvzsGoDnUdsPQx9kX721REMbfegdLRmyoOcz3m8xWdE
         FHkzKhrHEttTgZpsC0s9/7SXw2w5J/4ZvfTw9i3BfRGkwjDgtJZEBAHOLTZTrCuanTE7
         MeP37QAS952/whaDiH55Z+L20/g5XhvId1oG88PoBgOfcVKjBuFGSEGO7WVxOhO0+BTe
         HV0A==
X-Forwarded-Encrypted: i=1; AKwUvBzu0+G4GKuILGcu/k23qg691feNKsySz8f00lNFl9WEoHmk7i1Uz6kZdCM03Srqb8z9/itsPQhZguI=@vger.kernel.org
X-Gm-Message-State: AFuF++lw2Ls2TuqjEiHjYlD5nH5U26YxeAOAM1tj2/Uy50dCoxcVspeV
	j1s+IT4QGl/8n6F20e9Nh8aY5zFBwndO4BPcl2aFKI4LTEC+KC9/GUEhYwLFp2ScV5TVWMgfYCZ
	RKaEhs9g+7KYkGxowiBXibKegD9cPElA=
X-Gm-Gg: AYBFou1HfQfKmf/nXpVJbwX2/NHJ+65KkyOOBiHlux418js/S9yligG/JZkxwHwbSBK
	xZlDnq2xnm1aqWnkt3iVUaqDoUNSMsXJI0a7+IwjDrv6kP0MDTQAGjY9lmfTFjxHo0xLJfBclzv
	lzeDsIEUk7cWmGtnZplqwnty3dMjaD2vMyDgp9cxutA2ubrAUc/vyPui7TRJSHzF/gyOd46n4GS
	ixyxwk8UgxJyeFfmM3cxdqA+HfTTZvB7Gi8EL2W3ylv+cJVEotc7qnJmDPdJK3xDBpro2dcvEWB
	drI7V1SRG+ySX0VLqtqwpdRbCjXd1XYNNe5mqiK90GkZiUv+6jI9BuiObOrPyR18TkI8uf0tjUt
	0Q1tEYVP1qu+SsXEc6GGotrsxWv6GYXWgL6a+lOOP
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id
 d9443c01a7336-2ddc10044e2mr49362715ad.50.1789878187454; Sat, 19 Sep 2026
 21:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <20260920030512.50f4f988@jic23-hlaptop>
In-Reply-To: <20260920030512.50f4f988@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:22:58 +0900
X-Gm-Features: AcwNN1VuWoGeMmwFK8SO3q72J6yDJn0kccWHOWzv4mbLn2uAKQlLLK8lfaxPlsY
Message-ID: <CALMSewJ4ATy9eZ_GrHs-+Q+9yosiwhu3rtQUfxAbzOmR4R9cNQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/8] iio: add Open Sensor Fusion UART support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.

Yes, I agree that adding an Open Sensor Fusion entry at the IIO top
level is not ideal.

My hesitation with putting it under imu/ is that Open Sensor Fusion is
not intended to be an IMU. The current Linux profile exposes
accelerometer, gyroscope, magnetometer and temperature data, but the
hardware/firmware architecture is a general sensor hub and fusion
device. Other OSF hardware variants can aggregate sources such as
pressure sensors, GNSS/RTK-GNSS, motor encoders and LiDAR in addition
to inertial sensors.

Would drivers/iio/common/opensensorfusion/ be a better fit?

There are already sensor-hub/common implementations such as the
ChromeOS EC sensors and Samsung SSP sensor hub under
drivers/iio/common/.

That would avoid growing the IIO top-level menu without classifying
the device itself as an IMU.

Thanks,
Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:05, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:38 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Specification status: OSF-D2H 0.0 spec-1 has completed project technica=
l
> > stability review, has been adopted by the project owner, and is publish=
ed
> > as a fixed specification.
> >
> > Canonical specification:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md
> >
> > Errata process:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/errata/README.md
> >
> > Current adoption/publication record:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/0cab=
ccf63ac01d0eb82dd9882739ff58eed4a76c/reviews/publication-record-20260918.md
> >
> > The specification was frozen before adoption/publication, so its embedd=
ed
> > status snapshot is intentionally historical. The dated publication reco=
rd
> > above establishes the current adopted/public state. This is project rev=
iew
> > and adoption, not an external maintainer approval.
> >
> > This series adds the Open Sensor Fusion UART receive path and IIO devic=
es
> > discovered from capability reports. It exposes accelerometer, gyroscope=
,
> > magnetometer and temperature data through RAW/SCALE and buffered scans.
> > Device Tree describes the sensor hub; its individual streams are discov=
ered
> > at runtime.
> >
> > The receiver validates supported descriptors and sample scales, keeps
> > discovery open after empty or unsupported initial inventories, and chec=
ks
> > repeated inventories before allowing new data to use registered metadat=
a.
> > A supported descriptor changing meaning faults the session until an
> > explicit teardown and rebind. Existing v9 cache, scan-layout and buffer
> > lifetime fixes are retained.
> >
> > Based on Jonathan Cameron's IIO testing branch:
> > 69fa76f0af3414cc189c3b0b807cb59e327ecc00
> >
> > Changes since v9:
> > - Publish and reference the reviewed/adopted OSF-D2H 0.0 specification,
> >   errata process and dated publication evidence.
> > - Tolerate reserved padding, validate descriptor/sample scales, keep
> >   discovery open after empty/unsupported reports, and compare repeated
> >   capability reports.
> > - Fail closed on changed descriptor meaning instead of publishing data
> >   with stale metadata.
> > - Add focused KUnit coverage for these lifecycle and validation cases.
> > - Use managed UART/IIO/power teardown and dev_warn_probe() for the
> >   controller baud-rate warning, addressing Andy's probe-path feedback.
> > - Split the former combined UART/core/IIO driver patch into transport/c=
ore,
> >   IIO registration, core KUnit, and IIO KUnit patches following review.
> > - Use validated/unvalidated terminology for framing/CRC results through=
out
> >   the stream/core/transport code, tests and diagnostics. CRC detects
> >   accidental corruption; it does not provide cryptographic authenticati=
on.
> >
> > Prior validation on the identical source tree:
> > identical source tree evidence reused; no builds rerun for DCO packagin=
g.
> > - All eight intermediate apply/config/relevant builds.
> > - Independent transport/core and IIO module link/MODPOST.
> > - GCC/Clang W=3D1 vmlinux and modules.
> > - GCC and Clang KUnit: core 16 + IIO 2, all 18 pass in each run.
> > - Core-only intermediate KUnit: all 16 pass.
> > - ARM64 Image, selected OSF module and Pi4 DTB.
> > - Targeted DT binding/style and IIO documentation.
> >
> > The terminology-only diff was verified mechanically. Wire semantics and
> > data-path behavior are unchanged; the receive diagnostic key is validat=
ed=3D.
> > Hardware testing was not repeated for this terminology revision or this
> > post-DCO packaging audit; previous hardware evidence remains historical=
.
> >
> > Human DCO is complete. No email has been sent.
> >
> > Jinseob Kim (8):
> >   dt-bindings: iio: add Open Sensor Fusion device
> >   Documentation: iio: add Open Sensor Fusion driver overview
> >   iio: osf: add protocol decoding
> >   iio: osf: add validated stream parser
> >   iio: osf: add UART transport and core receive path
> >   iio: osf: add IIO devices from capability reports
> >   iio: osf: add core KUnit tests
> >   iio: osf: add IIO KUnit tests
> >
> >  .../bindings/iio/opensensorfusion,osf.yaml    |   52 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
> >  Documentation/iio/index.rst                   |    1 +
> >  Documentation/iio/open-sensor-fusion.rst      |   77 ++
> >  MAINTAINERS                                   |    8 +
> >  drivers/iio/Kconfig                           |    1 +
> >  drivers/iio/Makefile                          |    1 +
> >  drivers/iio/opensensorfusion/Kconfig          |   27 +
> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.
>
