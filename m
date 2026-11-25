Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795637305;
	b=tjra0JCghst/0vAD8vvMkhR4rrPWRFLVdnVrEzOVOrsLLzbmthg3+4bUw+Cm4jOIxZ1F
	 aAl7RJb8MTPpYGz3HwSmI9qVpaJON7wGRFOFLbd8vQIU69dMz5hhL/EsfC3YEPmMrALmW
	 eap/MlpLU7I8V2pUySsv9HVBrl26EveLLkY2DxDaS9vZrQ0WpYbbbDUUoL3bncQKYVbul
	 G3N+X+X+gdoMaoLHVj/JnZlTKC99lwacp7//+8H5NrnrMweaLpGvkXS7g/TSG3pygNMvL
	 aHxFvBoqvQOrDXTubCDmY52nYRd417FhrcRa6vpXWqSJ/C3GJLpVj8gwx/1o1Ef+yHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
	b=hZ9kh1l1nWVqcsiQgZF9pMFD37gg/8oTKQvkq0ICUt6Z0fHoR9HFgyDYJjFiYvlnmZzs
	 mn0ufUvdZJJqjAPl1VjDgbGBH3Drn5GqvlPy6mGOgxtTlEVEOGf09lzS27zn3NkdaYjuL
	 O2A+G5Go89rUi45z6Bjjbt9oMWbzijr1sDDd/ePHY4ffuhGsJIyAEsEvqq1kSEav4l1JU
	 y3Ot6JY3pSWCUmamUogUwsJNzOnRRJDuTwENvgo4CSBheNuAtJvbSDKkC/TKl/yCnrV1G
	 O2TXXwqqDg8pARnaiUHo/m8h1+pdzuQCK5uqj+Pq6iecsJTOYV5RfzQuvdnWfaG+aOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SzdBUQhC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE89606A32A
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 20:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE89606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SzdBUQhC
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b360828905so58027197b3.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 12:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795637304; cv=none;
        d=google.com; s=arc-20260327;
        b=gBuAJwuN4iw+F6m+qxNzVcdPdWPl1wuxGwwXRqohxRP31lFMRkqjZvU4ucELeoitvO
         90hBqh3gy04dWWGXajzSS35l6ue9VVTuBHXYleB77HRZv09uJI/LY4HQqZ/pleVpze/q
         NBbqV4Fw1YSiNyt/RByomE2/GGFRstrZqLPcooaLooRqaFTTUrJ6aFjH+WVwz7aYTAwp
         4seELkTRHGKtXR2TqHg9H3Rv++AV0kYQswrkTxXI4Mgv65jzttbUxszFFLgc2g53X+eB
         7f3TuZP2H+H95ojUpPloAoYzqbwOTo5D3iYlXofiTTSuoOqWWTcUbDp1ecBPbkZF+kuz
         3QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        fh=2TJ9NCLHD7hv5mMv2WerECh4jEKhMIuC5O8FsGfl1wM=;
        b=AmYC9V59yrSKnO/jGE9JoqaeZgpxTkqcEorv+dlMBSwefNb+plN+m7f9YI15j1bZ74
         LjSBtyIjH4UeUdOO7tBJ3txZUxuy04MKjHC4fPKJj7kjDK8YKvCZe6Z/4UfhTfSoOnVX
         8w2ix3szGRC1RvPqlfFXDpNa9mMDmjf9tjb0yJi7uiWjyfHteuN/C3HGV1u7V1l+D6Rv
         iCJdVAn0Z3C4kXMndMZoyF4bBzy1OACKDkWomjDjZyX90ecP+upw2wOJkkyr+jQkE4lf
         oNGdGQjxZSzpNXfLFydx3hIU0sCoCbm/WqxG45i7r8BK2M6R0k8hzd2yIOVSex3/8KY3
         EOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795637304; x=1796242104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        b=SzdBUQhCJqf2b1xmvJdwUTWJRZqYk8KZJTkab1RKCRDByJ/NCF6dGEABYYhrJyGV0u
         RMhn7tlV7TQ0o34p1ttPmZotWI9864QWO4eP7vDQVFFJleUA7H52mGQqkyeswywPh4Q+
         1d/rizLBhCX5iHzBOJxpBmKS9LxW4eNRG1gd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637304; x=1796242104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2sz6a7NAkW2VwlSH0qJO9zVczZnv9QOUY1IGuEHJjs=;
        b=hK3xA47neqNrQ3Z2/puR9QXQqjb0JcS/m0qN6QpxoedF/DkDkEYd2i5geCF04Yl3lr
         R8BNSv3azmJ8pdSPQ8cKrPYtc9z2rDmSfB9eZ9XRVgM+U6Fr59BQ8f+RhKGNHzbfp8PT
         ZFQMPq6XdiM2mjGpCfG2bWDIMQYKJEJmdjD6UVLZ0eSQPSm0qAhzyC+imGMfvaZIx5ZN
         9RGiZ02g4DRPYaWjNb4MBCjkP3rPGNcimfw5gPWayy0SF9nyR9U769skW2S9w4CgVmWc
         Of5oUu6BSMYfRX5y4tmfuiKhqNkc76CW7Lvo99Yt8re7kDFMkWai3amaHnlH2chST3o7
         YZ2w==
X-Forwarded-Encrypted: i=1; AL+hErHstKLi4h3pVU2fy2QNJCUiysddiXt1itwIhW8uR/kw7crL5KHz0V+sbtG7LjAiKLxpUALewRlZXQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B5PtWYAy4zAEQgpF1ZjXToiRdzqy7Pk/bMp/hkFVOwv7wPqbe
	meOk5TO3vBfgReG6BdbIqpOK1IqQj9j8hF9GWjrGFvhhsuhPproyJ/oxAZuvgjBappL9Znvm3SX
	ulVLRe1Fda/BwEJcIvYhz0cLE+tt6xqeiCi2DRJFS
X-Gm-Gg: AZFdTZcEqzJJ0vNu1LTf+/nm/A7GwlJd5t/7Ow0oCtAWampD0n3EJ+2hZmrPiUxdY8C
	FAdvN4lyp1OhacHuYq1EopBHuPEYYSEr1/DVIRTVhuJHPEJXLZCw62hZuKitIWIHcqAys/QvSnw
	phyF+fsZ2kpAbp66676K2iMMJUNu/n1Ulh2f5g4bl+uLfvbUg8EK/o6lsvm9JZgDr5E7UmPlVuP
	4fpn0qX0r/YyocIGFZQOTKH5QFNYU4aBzuD4Rr4tzEH9ZmaPUE3PsjMMHJ7+LssGGc5qf13jR16
	XUJPqw+r0GV3XSOS6jqhluP0m1/a1Drh6ah9w4GDsFn6Mj9ZnfmAdAH+7TpkpDTNnfmcE2KpLkW
	8njcnJWFZWG5wzbNxX28yaBnTLJwraMOwUYsumO5X4ZeStxQC722/A6duax3iTJzVbPs0
X-Received: by 2002:a05:690e:128f:b0:67d:c8a9:c607 with SMTP id
 956f58d0204a3-67df447fee9mr7204157d50.58.1795637303877; Wed, 25 Nov 2026
 12:08:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 25 Nov 2026 12:08:12 -0800
X-Gm-Features: Aa3M54oC0J4hEvF8nL8DG0lKyvPdcHpLfWm3L9Zu9MgNC1XuuWU_i9PXhdfqRu4
Message-ID: <CAEe3GZEWAApD0ZvQX4J5Uo8aajEtpVzg6JsGLqB8GKNv6ug06Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] Add spi-hid transport driver
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>, 
	Angela Czubak <acz@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, Benjamin,

Gentle ping on this series. The DT binding has been reviewed by Rob and
Conor, and I've replied to the outstanding bot review comments.

Please let me know if you have any further feedback, or if there's
anything I can do to help move this forward.

Thanks,
Jingyuan

On Fri, Oct 23, 2026 at 5:51=E2=80=AFPM Jingyuan Liang <jingyliang@chromium=
.org> wrote:
>
> This series picks up the spi-hid driver work originally started by
> Microsoft. The patch breakdown has been modified and the implementation
> has been refactored to address upstream feedback and testing issues. We
> are submitting this as a new series while keeping the original sign-off
> chain to reflect the history.
>
> Same as the original series, there is a change to HID documentation, some
> HID core changes to support a SPI device, the SPI HID transport driver,
> and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
> support, power management, panel follower, and quirks for Ilitek touch
> controllers.
>
> Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
>                   Dmitry Antipov <dmanti@microsoft.com>
> Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmai=
l.com
>
> Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> ---
> Changes in v7:
> - Drop the error counter sysfs attributes.
> - Print error codes in power up/down failure messages.
> - Reject an empty report descriptor.
> - Check the minimum input report body size instead of max_input_length.
> - Clear reset_attempts only after the report descriptor check succeeds.
> - Drop pending work flags when the error handler resets the device.
> - Don't schedule a reset when GET_FEATURE fails with -ENODEV.
> - dt-bindings: drop the address/opcode properties and the "hid-over-spi"
>   fallback; the compatible determines them.
> - dt-bindings: fix authorship to match the Signed-off-by chain.
> - dt-bindings: update maintainer email addresses.
> - dt-bindings: drop Rob's Reviewed-by because the binding changed.
> - of: use per-compatible match data; match only
>   "microsoft,g6-touch-digitizer".
> - pm: disable reset_work across suspend.
> - pm: check deassert_reset(); schedule recovery on reset timeout.
> - pm: skip hid_driver_reset_resume() when the device is not ready.
> - pm: log power_down() failure instead of rolling back suspend.
> - pm: use dev_err() instead of dev_WARN_ONCE() for a failed device
>   descriptor request.
> - panel follower: start with reset_work disabled.
> - Drop Dale's Tested-by from the OF, PM and panel follower patches
>   because they changed since v4.
> - Link to v6: https://lore.kernel.org/r/20261019-send-upstream-v6-0-cb9ba=
4b3d6fa@chromium.org
>
> Changes in v6:
> - Take output_lock while reallocating buffers in ll_start()
> - Don't drop input reports while a refreshed device probes
> - OF: drop mod_devicetable.h, use named initializers, fix alignment
> - Move the dt-bindings patch before the OF driver patch
> - Drop Tested-by from the documentation and DT binding patches
> - Link to v5: https://lore.kernel.org/r/20261009-send-upstream-v5-0-384af=
01da3ee@chromium.org
>
> Changes in v5:
> - Fix request/response races; match GET_FEATURE responses by report ID
> - Reset the device on response timeout; wait uninterruptibly
> - Validate device descriptor and report lengths; fix buffer sizing
> - Honor rtype in raw_request(); fix GET_REPORT off-by-one
> - Use hid_safe_input_report(); forward input reports only while open
> - Disable IRQ around hid_device teardown; fix a sparse warning
> - Use disable_work_sync() for reset_work in remove()
> - Cap trace copies at 64 bytes; cacheline-align read approval buffers
> - ACPI: select RESET_CONTROLLER, use device_reset_optional()
> - OF & DT: read opcodes as u8, use dev_err_probe(), require reg
> - PM: cancel reset_work on suspend, wait for reset before
>   reset_resume(), fix IRQ imbalance on resume failure
> - Panel follower: fix regulator/IRQ imbalance; depend on DRM || !DRM
> - Link to v4: https://lore.kernel.org/r/20260609-send-upstream-v4-0-b843d=
5e6ced3@chromium.org
>
> Changes in v4:
> - Extended io_lock scope to protect the shid->hid pointer lifecycle
>   against races with the IRQ handler
> - Cacheline-aligned DMA buffers, enforced 4-byte alignment
> - Added error rollback for failed suspend/resume transitions
> - Moved IRQ request to probe with IRQF_NO_AUTOEN (disabled by default)
> - DT Bindings & OF Driver:
>   - Required a device-specific compatible string in the schema.
>   - Added description to explain why opcodes and addresses properties
>     need to be defined in the schema
>   - Added `spi-peripheral-props.yaml` reference and switched to
>     `unevaluatedProperties: false`.
>   - Added fallback to default timing parameters in OF driver if match
>     data is missing.
> - Link to v3: https://lore.kernel.org/r/20260402-send-upstream-v3-0-6091c=
458d357@chromium.org
>
> Changes in v3:
> - Add io_lock init
> - Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
> - Add tracepoints for sync, error handling, reset, and report processing
> - Clean up internal includes and fix Makefile CFLAGS
> - Add more details in v2 changelog
> - Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce=
8afff86@chromium.org
>
> Changes in v2:
> - Clean up DT bindings: fix formatting and remove timing and flags proper=
ties
> - Update DT binding example: use a device-specific compatible and drop
>   reset_assert
> - Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
> - Refactor OF driver to use match data for timing parameters instead
>   of DT properties
> - Switch to fsleep() for delays in ACPI and OF drivers
> - Drop patch 12 as it is vendor specific
> - Add a lock to fix input/output concurrency race
> - Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515b=
a218f3d@chromium.org
>
> ---
> Angela Czubak (2):
>       HID: spi-hid: add transport driver skeleton for HID over SPI bus
>       HID: spi-hid: add ACPI support for HID over SPI
>
> Dmitry Antipov (1):
>       dt-bindings: input: Document hid-over-spi DT schema
>
> Jarrett Schultz (3):
>       Documentation: Correction in HID output_report callback description=
.
>       HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
>       HID: spi-hid: add device tree support for HID over SPI
>
> Jingyuan Liang (5):
>       HID: spi-hid: add spi-hid driver HID layer
>       HID: spi-hid: add HID SPI protocol implementation
>       HID: spi-hid: add spi_hid traces
>       HID: spi-hid: add power management implementation
>       HID: spi-hid: add panel follower support
>
>  .../devicetree/bindings/input/hid-over-spi.yaml    |   75 +
>  Documentation/hid/hid-transport.rst                |    4 +-
>  drivers/hid/Kconfig                                |    2 +
>  drivers/hid/Makefile                               |    2 +
>  drivers/hid/hid-core.c                             |    3 +
>  drivers/hid/spi-hid/Kconfig                        |   50 +
>  drivers/hid/spi-hid/Makefile                       |   12 +
>  drivers/hid/spi-hid/spi-hid-acpi.c                 |  261 +++
>  drivers/hid/spi-hid/spi-hid-core.c                 | 1698 ++++++++++++++=
++++++
>  drivers/hid/spi-hid/spi-hid-core.h                 |  112 ++
>  drivers/hid/spi-hid/spi-hid-of.c                   |  211 +++
>  drivers/hid/spi-hid/spi-hid-trace.h                |  184 +++
>  drivers/hid/spi-hid/spi-hid.h                      |   45 +
>  include/linux/hid.h                                |    2 +
>  14 files changed, 2659 insertions(+), 2 deletions(-)
> ---
> base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
> change-id: 20260212-send-upstream-75f6fd9ed92e
>
> Best regards,
> --
> Jingyuan Liang <jingyliang@chromium.org>
>
