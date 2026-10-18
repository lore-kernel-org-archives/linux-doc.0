Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882D41D133
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316830; cv=pass; b=AIMnx5q3xkPjxMbgaSvPjnpNbjm4MyyRC3fLQ2VkQWvySI8YE8cglmJJR1EArfEfXMlJJNs9ig7F/oZBE1uyU/1E6kJM7f4XxNTWY/HA+ZxQdMq+GL2Z2UoxzuLjRj5pp3livw0Zfta/HO5aYMyzNxXgN3KtQdKs++CwaTWAq1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316830; c=relaxed/simple;
	bh=UN4K3bSJ71N5QveRWSG/7Yxfwh7QELJyj6YausPDmkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubip/EHDmM3xvXMJTwT0yBmPZfKd5mN2/hyPp39QVAq3pgkkEP8aMrExrgFLdaQ81eEeG517qKMWo5o41HSI6XVCLCI1eN6UXE6BDA7h3YQJZ4Y4kbMWkDUX/o+BtuZpPaGm8CLQ97pyj5tcWmvGvklebVBb1lhZ++1IzMnyLXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B45DobkT; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B45DobkT"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo2447855eec.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792316828; cv=none;
        d=google.com; s=arc-20260327;
        b=b2ENu3+OutevADUS/Nluawz0RPe0tH+72gAGpzcBcV3r80RoCSx+MI9aIyEeY/qKVu
         0PLrkDoMTkwFcOUkRFD/XkOos0rxt206kYYWK2OlgrO8wP15UKj3nFJztK26SbVaZz1u
         eYCJGKg5W8+yJXMkdaFXUoCBOclzT9LquKoXhvqCQ06v7l/qvy5MhMeJEZdk1chCigQg
         4UlnSbl0Ql2IU2foQ734gdq+6xPkvDMT5gVGId0+q7pBxygqCkgUkO6j5HiaRqXV4Z//
         99fN8Cm8cqpcOhrnFvruqIqDftZxI0azxTidrXF+VUMR4R7ZdqW5Zpp6BDbUkyJ1ji8C
         SbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        fh=EYkdHwZhc7uyLabuOmKF2xzWqW2D3QnhU4t8JVPHiXo=;
        b=QdBh1q0YM1HUAEVvXxoXhm5BLcHKn7PdjwTp6+ThY1JpstEoK/uSHWLsdclgiDkcCf
         sy/t/wHJUeU8Jh1749XK8YHjzxqhOTJzxX8UjEC0MQ1IEGlfig54ipSKEumLUVc3GkKe
         jknxF/KUmpr3PtW/Q7DIB8ESdTf9IhPJVt22qQOFBRlsQ52CA1nr1MJxR5B3vSyeqRHz
         1DnaATNPB1F7Bq679jERmT+zLqoDPJA7AY+LTqwnOIPHCqGyKNDbmqjWQAyhIIstr/8m
         azHlcu/6mZACOh1Bi+8yBWRQZMzyj8HJhZCwE+LmC0nyEfNg/I6IJDyWTgPWYbSa9wy/
         d5sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792316828; x=1792921628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        b=B45DobkT2Ehurn+wtKbSROEhuInigesGjK50GxYZku1+PBqB5fylY7jC9xORlvFePQ
         dRwE7DnZ/o28SyItZRe0H+UbBo+p7cS4g4doqPxKk/Cuy9pqjO7PwrYEyj8sor8oIbzJ
         uGij4+rij8X3O1x8POiF5pE63p5+gdAM8C69OuWytWp0ojfd1b4DaOqZDdw+9PAbrYX6
         zmbb/LT7VI81119Qikf9qcUjcJiSiKwWOoLJ+BalB2Eje7UmEqS+6/9IWsy6VeODwNvG
         yFe4UfCw2lL1jLaVp4AabvYnkZG+iBbUoxewyKipeoF4WBw+XphHGqxJy99PFKauSHHw
         HFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792316828; x=1792921628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqVM+Dir6IA0H5/+vTX3FKWkOia/C6P0aBNw671rlPo=;
        b=MgCLdM2xPIpuzmzMitiJqt0ZqtKy6H16y3SmvfueER/1aN2dlRYx5tCmyp1KO66P/2
         RXsdnQt8rsLFHlhxRRSu7v7mjweRclNg+fUmTq13NQC6cPz9dxyHphEtnJXX2l7Sjif9
         ASjtxki+p3xIz3RcuACwMe1CniYpDut4JF2z+XC1W/3degX2zVrwOoEwQlLH8VxfCYyV
         rOrlC7LdGnMepp4tImSDukupL6iKgHhuFHh5WjFz6MRVCyZhqpJcEyff7VxtAb22m5sz
         FQaH3F+cZeEJpmZge8ud3HKjJCmdMw6MbMTp0/Y9sSsm7eLpwoqw2OKvF0xIN8ZGPjgW
         A3ew==
X-Forwarded-Encrypted: i=1; AKwUvBwLuf0bsahtIMQSyLIRpzYCZjpd2JJOlR9FRx407fTRuiTaGs/qrlWyaCgjPuW0o1M3bPCQ9D4mP18=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPEdHoQo+W8QhwcTuHw/P9Vo9WWoW/Hr6guvKhh4IFxA8BbVA/
	PGynAfxQVOF7sovX9OjS6+MKgCvjcixy0FhWze0v3chVES/jVwHWfFbKih3nTVSjPJkkDseDlDs
	GQT28jVEd2QNcAKwIjFdcAeo7GrIStUE=
X-Gm-Gg: AYBFou0pZSCCvoTBciduD6j/97sKv0X8i4NV7fvwSWJ+YvVqKTtlB1v0JNrOKN5IjLc
	YmtP0uj6FLGuKueKHYXKmckmGMHxIQ3bCLMBhz+Jb+P9yRZQxFYGi2j3cCm9dV1bi8yLoplK66E
	KMY3FBGkyfJAh6h8TNIy8JWj9mjSJ/sY2Npl5iklY7FxphL7fH1+lhhWwK6eaQu3pBqJ/xD7MKV
	DqVtI7mom6Q3GB9Q7rmK1e4XMEZVDi2cyaAtZxRP6kXw/42tfuMFoxeqLGifIJF+5qq7uCY+9b7
	rTgjilG5+2mE9qGSJxRnNa6sHHjC2obZv/g5iyC81VfH4kiZrQrogj8NJ6ZMr2Bo02wy8GMURVh
	zPQqacj3gLL1vp42iomsdPXPyWPd5uBZ6WNsw/axBKzRSAEDh5V4=
X-Received: by 2002:a05:693c:860a:10b0:351:727d:b9c2 with SMTP id
 5a478bee46e88-361a18634bcmr7945595eec.17.1792316828034; Sun, 18 Oct 2026
 02:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011231340.42885-1-kimjinseob88@gmail.com> <20261018010201.4b427c3c@jic23-hlaptop>
In-Reply-To: <20261018010201.4b427c3c@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 18 Oct 2026 18:46:56 +0900
X-Gm-Features: AclHuK9u8xRFkOblgjIxx2Du_9jPdrJ4Qhw268FvpslDoMIezVpcmynAFFby9aY
Message-ID: <CALMSewJZbDbEe28v9VJ7sfTTNVJfvfcryS=0gpARAvc7g3MP8w@mail.gmail.com>
Subject: Re: [PATCH v11 0/8] iio: add Open Sensor Fusion UART support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, andersson@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

I investigated the review comments on the two pending OSF KUnit patches.

The revised Kconfig allows the tests to run when OSF is built as a
module, using the existing composite driver without exporting internal
symbols.

I validated the following configurations:

OSF=3Dy, KUNIT=3Dy

OSF=3Dm, KUNIT=3Dy

OSF=3Dm, KUNIT=3Dm

All configurations used the enabled KUnit test selector. The existing
16 core and 2 IIO tests passed, including actual module load/unload
testing.

I also added deferred mutex cleanup for the pending-session, receive
and IIO test fixtures, and strengthened the producer/configuration
synchronization. The relevant cleanup paths were validated, including
assertion-abort cases.

The unregister concurrency test depends on mainline commit
84bb0fc46ccf, which is not yet in jic23/testing. I therefore ran that
test on a separate integration tree containing the fix.

I have prepared and validated an updated, signed two-patch KUnit-only
series based on the already applied OSF driver patches.

Since you mentioned wanting to review the KUnit tests further, would
you prefer that I send the updated two-patch series now, or wait until
you have completed your review?

Thanks,

Jinseob


2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 9:02, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, 12 Oct 2026 08:13:32 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > This series adds a UART/serdev receiver for the project's fixed OSF
> > Device-to-Host 0.0 protocol. Complete capability snapshots create IIO
> > accelerometer, gyroscope, magnetometer and temperature devices with RAW=
,
> > descriptor-derived SCALE and initialized buffered scans.
> >
> > The receiver validates the fixed OSF0 envelope, CRC and exact known
> > message lengths. Equivalent capability reports are idempotent; changes
> > to a bound supported inventory fault the session until explicit rebind.
> > IIO samples use host timestamps.
> >
> Hi Jinseob,
>
> I'm going to do something a little unusual which is more about the time
> I have available today and desire to look more closely at your unit tests
> to learn from them.  So for now I'm just going to apply the driver (so
> patches 1-6) and leave the last two on list and in patchwork as still nee=
ding
> review.  Hopefully I will get time to circle back to them later this
> kernel cycle!  In general I'm keen to get broad testing into IIO so
> want to learn from what you have done there.
>
> Jonathan
>
> > Changes since v10:
> > - Move OSF under drivers/iio/sensorhubs/osf/ following review.
> > - Use the OSF GREEN compatible with the generic OSF fallback.
> > - Clarify complete capability-report snapshot semantics.
> > - Use designated decoded-frame initialization and drop decoded reserved
> >   fields while retaining reserved wire-byte tolerance.
> > - Reuse stream reset and simplify core/serdev locking and lifecycle.
> > - Use IIO buffer-mode claims instead of a private buffer lock.
> > - Simplify scan storage and channel declarations.
> > - Fix KUnit worker/device/mutex/resource/completion lifetimes.
> >   Generic IIO self-test extraction remains deferred.
> > - Synchronize KUnit fault observation and configuration completion with
> >   completions and thread joins instead of short polling/deadline window=
s.
> >
> > The IIO buffer teardown serialization issue found during the v10 review
> > was fixed separately and is now in mainline as commit 84bb0fc46ccf
> > ("iio: buffer: serialize buffer teardown with mode claims").
> >
> > This series is based on the IIO testing snapshot fetched for this submi=
ssion:
> > a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
> > Runtime validation used this testing base plus the eight OSF patches
> > and the exact mainline IIO core fix 84bb0fc46ccf6a545b8fdf57cda83770186=
ed8dd.
> > The core fix is not included in this series and must be present when
> > running the series on this testing base.
> >
> > Fresh validation of this source:
> > - GCC and Clang W=3D1 kernel builds; module builds.
> > - osf-core (16 tests) and osf-iio (2 tests), with KASAN, lockdep,
> >   DEBUG_MUTEXES, DEBUG_LOCK_ALLOC, DEBUG_OBJECTS and DEBUG_OBJECTS_FREE=
.
> > - 200 production module load/unload cycles and 200 test-enriched module
> >   load/unload cycles using identical driver/test C sources, exercising
> >   20,000 IIO buffer toggles, scan subsets, timestamps and unregister.
> > - DT binding/style/example/schema checks and IIO Sphinx build.
> > - Clean sequential application and relevant builds of all eight patches=
.
> > Physical board tests were not repeated for this revision.
> >
> > Canonical specification (fixed revision):
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md
> >
> > The fixed public specification is maintained and adopted by the OSF
> > project. This does not imply Linux maintainer approval of the
> > specification or driver.
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
> >  .../bindings/iio/opensensorfusion,osf.yaml    |   55 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
> >  Documentation/iio/index.rst                   |    1 +
> >  Documentation/iio/open-sensor-fusion.rst      |   81 ++
> >  MAINTAINERS                                   |    8 +
> >  drivers/iio/Kconfig                           |    1 +
> >  drivers/iio/Makefile                          |    1 +
> >  drivers/iio/sensorhubs/Kconfig                |    7 +
> >  drivers/iio/sensorhubs/Makefile               |    3 +
> >  drivers/iio/sensorhubs/osf/Kconfig            |   27 +
> >  drivers/iio/sensorhubs/osf/Makefile           |    7 +
> >  drivers/iio/sensorhubs/osf/osf_core.c         |  460 +++++++
> >  drivers/iio/sensorhubs/osf/osf_core.h         |   75 ++
> >  drivers/iio/sensorhubs/osf/osf_core_test.c    | 1056 +++++++++++++++++
> >  drivers/iio/sensorhubs/osf/osf_iio.c          |  288 +++++
> >  drivers/iio/sensorhubs/osf/osf_iio.h          |   22 +
> >  drivers/iio/sensorhubs/osf/osf_iio_test.c     |  386 ++++++
> >  drivers/iio/sensorhubs/osf/osf_protocol.c     |  215 ++++
> >  drivers/iio/sensorhubs/osf/osf_protocol.h     |   99 ++
> >  drivers/iio/sensorhubs/osf/osf_serdev.c       |  151 +++
> >  drivers/iio/sensorhubs/osf/osf_stream.c       |  230 ++++
> >  drivers/iio/sensorhubs/osf/osf_stream.h       |   53 +
> >  22 files changed, 3228 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfus=
ion,osf.yaml
> >  create mode 100644 Documentation/iio/open-sensor-fusion.rst
> >  create mode 100644 drivers/iio/sensorhubs/Kconfig
> >  create mode 100644 drivers/iio/sensorhubs/Makefile
> >  create mode 100644 drivers/iio/sensorhubs/osf/Kconfig
> >  create mode 100644 drivers/iio/sensorhubs/osf/Makefile
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_core_test.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_iio_test.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_protocol.h
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_serdev.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_stream.c
> >  create mode 100644 drivers/iio/sensorhubs/osf/osf_stream.h
> >
> >
> > base-commit: a22dc7ebb21a6bd4c8b63bc2c1dd46a24945aae7
> >
>
