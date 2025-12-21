Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B5431CA50
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766348418; cv=none; b=kDpJjlsjizRJ6VBwRM0bOF3ZlKwefWOjlZQ3DlIJU0Q0FnqBoKOMI/9hSjzGO5eYs/eZC25OB3nZA55zMXjYR+6KHMNcxZNQH5pxUR0Vh4aMupJqS4KMV56KAdMJwWFGfxns5gWMV0V1a26un/b+gNbBruFaubmtDhHivrF/ioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766348418; c=relaxed/simple;
	bh=J56voCG2gy92xwqiHbWVyHDJBih1Zzy9Ey4rOQEWD5c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTMMESxbRaRLf1Z3UYy2wL4w4IbXeBa4O2nalormtcwJBYDNx5wzNtMyavb/HSU+dl6HVkrz9YHTF8YsQbLRy8ZuqZt7eWJsPe4430n+zT2e9nm9o0/nAnJ/J4+bztdPizp0zYSjB9Iris+FxIA1AzH9PofOynDnxaYjR4AGyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXxrv5CG; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXxrv5CG"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so2585870f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 12:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766348414; x=1766953214; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J56voCG2gy92xwqiHbWVyHDJBih1Zzy9Ey4rOQEWD5c=;
        b=NXxrv5CGey2TJWSPvY7v0TWicKBD3JZjBGDtoxyB9UjcPgOaVSxVSc6pQEiWZjU7iW
         M1VEYcRloHN32Kj/DdfsohXqs2xbJ65mo92PmVE1QJixWRXVbB1T+kvCaRp/UKEmsSl+
         cyvaNjrhtezvMN0y9GnpbxCUWqvGXdQzVdCNF0kmcqIieRxWg5rFDk/+6UlBnSink2kF
         u+fUWkkzZfptky64u4njZrpbuURdqQHqk7EfUyaB/pXGoNuLqjOUBd9wE6oyLFG1R/28
         wxZbitijfh2D+FQuDlMZFNmb4Kt5YLu0Vur/Swzspe8VArFflsBA/YUzQSpwSfd7Nwrc
         NfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766348414; x=1766953214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J56voCG2gy92xwqiHbWVyHDJBih1Zzy9Ey4rOQEWD5c=;
        b=g6SnvoyD0FZe6P9Vw5u4th/5uXA241VmW8HDrA2Vo+GFlpDs3rfLa4VDsqfb3t+1aJ
         oyEmLZnBEq3WK241MojYoujwurksaai9iZZdjomTR8UvQ9VNh2tUFHv+TbDhvhCALBiZ
         KWI6n12QqxvayPvTTojX5CqDJ/qai2WgXfck1i+PiR5Xnrm2kStRM6nP9rnKTw8RMybj
         tPARON0qal7RvMNpJ9pVerhjU0Krc5CbvfgZCEuPEi8XPJAfI09CNZ2VPJqKO9RRg72D
         4pfB9ZSyXrfaC/Y/giBuYSxhhkB9IhyJXmQ5QygYmZSxsiRKtOahDJ1LCy+irznUmuDt
         gi7A==
X-Forwarded-Encrypted: i=1; AJvYcCWsvFkb0CcS0h9cpEU5ukw/xqvsv3x3ehXmGeMgbsDKCQ+TW9JdY1KomHX/jKVQQTzPdgizjOgmfdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5SIdiwzhh9RYoRF268121jJfgIrXvp/9qSiGhviVWDFSYd8TZ
	V5bYA7Da3Cm4LG1WVjsINBKwjbehBIlBjpAis6EUlD2RqdsFqAdPb3vq
X-Gm-Gg: AY/fxX5GrQpeZ1v7vNB1TWk91L3yIaBSy4Kye3G6heEgiV3Kgxs2luC2OhBWQbyvYM7
	ghRtA+xHnw3PUo6lOKtZ+DdX9XMVRuJtjKl1C85svLgTEa2c9kGPpL29Xb62L7Risid1PqvI3Fz
	UiKC3MlF3Rxp+y5axPn9IbiSqACDqzyB5xknZZLZXpn8+RkB7PqwC+ejphz/OiMNXPCSJUiME2d
	Y8IrzEWOLTPwxa0AIvTdpdnEKawNFZULkuBbxFlPyfv8y35mqyig+Ujf3NumlUGMDhjnNgB7ce6
	2efs9aAwSJVw0xR+sBwbsNftnhLkZVaxH0hIsW7FoBhxQiKdGbhbrf7I4BNaCJ17tDY+xvAqv00
	j5ENgzGguEEIIv0Fg/F+jdKnAHv+gwYVEkwlRJCN/UaMjApjzk/KKV7dZPLIt23Jn+hWrWo6rrf
	yPl0FRRiEUBG75MrIV3P1nHX8vUTcAUiQLurRSjRffU8pHh+ofwcLbPmkY6bl09ijtfOUcEY33i
	nwTSK8lymhaaUw=
X-Google-Smtp-Source: AGHT+IGLmBGQXkIgEEAUuqdWnYBxPxsVTyhAuKVstFFI+6BsF/bpCLqzH1HUXplmayJrIbfatzrXqg==
X-Received: by 2002:a05:6000:430a:b0:3f7:b7ac:f3d2 with SMTP id ffacd0b85a97d-4324e50d57dmr9396663f8f.43.1766348414387;
        Sun, 21 Dec 2025 12:20:14 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2278dsm18149220f8f.18.2025.12.21.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 12:20:13 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 21 Dec 2025 20:20:09 +0000
To: Jonathan Cameron <jic23@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 5/6] docs: iio: add documentation for adf41513 driver
Message-ID: <73sjjxkltm7a5ylpwv7jyiha3rsgmiwrjc4gwkva5u2vc36trk@sn4ctgr7v7ek>
References: <20251219-adf41513-iio-driver-v2-0-be29a83d5793@analog.com>
 <20251219-adf41513-iio-driver-v2-5-be29a83d5793@analog.com>
 <20251221180018.488cbac5@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251221180018.488cbac5@jic23-huawei>

On 25/12/21 06:00PM, Jonathan Cameron wrote:
> On Fri, 19 Dec 2025 12:34:52 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
>
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> >
> > add documentation for ADF41513 driver which describes the device
> Add

ack

> > driver files and shows how userspace may consume the ABI for various
> > tasks
> .
>
> >
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  Documentation/iio/adf41513.rst | 255 +++++++++++++++++++++++++++++++++++++++++
> >  Documentation/iio/index.rst    |   1 +
> >  MAINTAINERS                    |   1 +
> >  3 files changed, 257 insertions(+)
> >
> > diff --git a/Documentation/iio/adf41513.rst b/Documentation/iio/adf41513.rst
> > new file mode 100644
> > index 000000000000..568e71bc21e4
> > --- /dev/null
> > +++ b/Documentation/iio/adf41513.rst
> > @@ -0,0 +1,255 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +===============
> > +ADF41513 driver
> > +===============
> > +
> > +This driver supports Analog Devices' ADF41513 and ADF41510 PLL frequency
> > +synthesizers on SPI bus.
> Avoid lists of part numbers inline with text. Those become very noisy
> if more parts are added in future. Given next block has bullet point list
> of parts no need to mention them here.  Instead use
> ADF41513 and similar SPI PLL frequency synthesizers.

ack

> > +
> > +1. Supported devices
> > +====================
> > +
> > +* `ADF41510 <https://www.analog.com/ADF41510>`_
> > +* `ADF41513 <https://www.analog.com/ADF41513>`_
> > +
> > +The ADF41513 is an ultralow noise frequency synthesizer that can be used to
> > +implement local oscillators (LOs) as high as 26.5 GHz in the upconversion and
> > +downconversion sections of wireless receivers and transmitters. The ADF41510
> > +is a similar device that supports frequencies up to 10 GHz.
> > +
> > +Both devices support integer-N and fractional-N operation modes, providing
> > +excellent phase noise performance and flexible frequency generation
> > +capabilities.
> > +
> > +Key Features:
> > +
> > +- **ADF41513**: 1 GHz to 26.5 GHz frequency range
> > +- **ADF41510**: 1 GHz to 10 GHz frequency range
> Keep them in alphanumeric order. Makes it easier to add more parts by
> keeping the placement obvious.

ack

> > +- Integer-N and fractional-N operation modes
> > +- Ultra-low phase noise (-235 dBc/Hz integer-N, -231 dBc/Hz fractional-N)
> > +- High maximum PFD frequency (250 MHz integer-N, 125 MHz fractional-N)
> > +- 25-bit fixed modulus or 49-bit variable modulus fractional modes
> > +- Programmable charge pump currents with 16x range
> > +- Digital lock detect functionality
> > +- Phase resync capability for consistent output phase
> > +
> > +2. Device attributes
> > +====================
> > +
> > +The ADF41513 driver provides the following IIO extended attributes for
> > +frequency control and monitoring:
> > +
> > +Each IIO device has a device folder under ``/sys/bus/iio/devices/iio:deviceX``,
> > +where X is the IIO index of the device. Under these folders reside a set of
> > +device files that provide access to the synthesizer's functionality.
> > +
> > +The following table shows the ADF41513 related device files:
> > +
> > ++----------------------+-------------------------------------------------------+
> > +| Device file          | Description                                           |
> > ++======================+=======================================================+
> > +| frequency            | RF output frequency control and readback (Hz)         |
> > ++----------------------+-------------------------------------------------------+
> > +| frequency_resolution | Target frequency resolution control (Hz)              |
> > ++----------------------+-------------------------------------------------------+
> > +| refin_frequency      | Reference input frequency control and readback (Hz)   |
> > ++----------------------+-------------------------------------------------------+
> > +| powerdown            | Power management control (0=active, 1=power down)     |
> > ++----------------------+-------------------------------------------------------+
> > +| phase                | RF output phase adjustment and readback (degrees)     |
> > ++----------------------+-------------------------------------------------------+
> > +
> > +2.1 Frequency Control
> > +----------------------
> > +
> > +The ``frequency`` attribute controls the RF output frequency with sub-Hz
> > +precision. The driver automatically selects between integer-N and fractional-N
> > +modes to achieve the requested frequency with the best possible phase noise
> > +performance.
> > +
> > +**Supported ranges:**
> > +
> > +- **ADF41513**: 1,000,000,000 Hz to 26,500,000,000 Hz (1 GHz to 26.5 GHz)
> > +- **ADF41510**: 1,000,000,000 Hz to 10,000,000,000 Hz (1 GHz to 10 GHz)
> Alpha numeric order here as well.

ack

> > +
> > +The frequency is specified in Hz, for sub-Hz precision use decimal notation.
> > +For example, 12.102 GHz would be written as "12102000000.000000".
> > +
> > +2.2 Frequency Resolution Control
> > +--------------------------------
> > +
> > +The ``frequency_resolution`` attribute controls the target frequency resolution
> > +that the driver attempts to achieve. This affects the choice between integer-N
> > +and fractional-N modes, including fixed modulus (25-bit) and variable modulus
> > +(49-bit) fractional-N modes:
> > +
> > +- **Integer-N**: Resolution = f_PFD
> > +- **Fixed modulus**: Resolution = f_PFD / 2^25 (~3 Hz with 100 MHz PFD)
> > +- **Variable modulus**: Resolution = f_PFD / 2^49 (µHz resolution possible)
> > +
> > +Default resolution is 1 Hz (1,000,000 µHz).
> > +
> > +2.3 Reference Input Control
> > +---------------------------
> > +
> > +The ``refin_frequency`` attribute allows control of the reference input
> > +frequency when using a programmable reference clock. The supported range is
> > +10 MHz to 800 MHz.
>
> I'm not really sure why need this as opposed to having a standard clock
> provide it.  What's the use case?

I was thinking about, and for the application I am currently evaluating the part
the reference signal comes from a DDS, and that signal is not a clock it is a
series of chirp patterns. The important thing about this property is to set
a center frequency for the DDS to work on. In that scenario the PLL will not
really work as a frequency sythentizer, but as a frequency tracker of the
varying reference. Problem is that I've realized that recently after putting
together a device driver for the DDS. Therefore this property is still important,
and I need to make the reference clock input as an optional property.
I thought of making the DDS as a clock provider, but that center frequency
would have a "virtual" meaning, not attached to the hardware configs.

> > +
> > +2.4 Power Management
> > +--------------------
> > +
> > +The ``powerdown`` attribute provides software power control:
> > +
> > +- **0**: Device active and operational
> > +- **1**: Device in power-down mode (low power consumption)
>
> This one is fairly standard for DACs etc. I'd not necessarily bother
> documenting it specifically here.

ack

> > +
> > +2.5 Phase adjustment
> > +--------------------
> > +
> > +The ``phase`` attribute allows adjustment of the output phase in degrees.
>
> As per driver feedback, I don't think this is compliant with existing ABI.

ABI is not in degrees? the attribute is named out_altvoltage0_phase

> > +Setting this attribute enables phase adjustment. It can be set from 0 to 360
> > +degrees. Reading this attribute returns the current phase offset of the output
> > +signal. To create a consistent phase relationship with the reference signal,
> > +the phase resync feature needs to be enabled by setting a non-zero value to the
> > +``adi,phase-resync-period-ns`` device property, which triggers a phase
> > +resynchronization after locking is achieved.
> > +
> > +3. Operating modes
> > +==================
> > +
> > +3.1 Integer-N Mode
> > +------------------
> > +
> > +When the requested frequency can be achieved as an integer multiple of the PFD
> > +frequency (within the specified resolution tolerance), the driver automatically
> > +selects integer-N mode for optimal phase noise performance.
> > +
> > +In integer-N mode:
> > +
> > +- Phase noise: -235 dBc/Hz normalized floor
> > +- Frequency resolution: f_PFD (same as PFD frequency)
> > +- Maximum PFD frequency: 250 MHz
> > +- Bleed current: Disabled for best performance
> > +
> > +3.2 Fractional-N Mode
> > +---------------------
> > +
> > +When sub-integer frequency steps are required, the driver automatically selects
> > +fractional-N mode using either fixed or variable modulus.
> > +
> > +**Fixed Modulus (25-bit)**:
> > +
> > +- Used when variable modulus is not required
> > +- Resolution: f_PFD / 2^25
> > +- Simpler implementation, faster settling
> > +
> > +**Variable Modulus (49-bit)**:
> > +
> > +- Used for maximum resolution requirements
> > +- Resolution: f_PFD / 2^49 (theoretical)
> > +- Exact frequency synthesis capability
> > +
> > +In fractional-N mode:
> > +
> > +- Phase noise: -231 dBc/Hz normalized floor
> > +- Maximum PFD frequency: 125 MHz
> > +- Bleed current: Automatically enabled and optimized
> > +- Dithering: Enabled to reduce fractional spurs
> > +
> > +3.3 Automatic Mode Selection
> > +----------------------------
> > +
> > +The driver automatically selects the optimal operating mode based on:
> > +
> > +1. **Frequency accuracy requirements**: Determined by frequency_resolution setting
> > +2. **Phase noise optimization**: Integer-N preferred when possible
> > +3. **PFD frequency constraints**: Different limits for integer vs fractional modes
> > +4. **Prescaler selection**: Automatic 4/5 vs 8/9 prescaler selection based on frequency
> > +
> > +4. Usage examples
> > +=================
> > +
> > +4.1 Basic Frequency Setting
> > +----------------------------
> > +
> > +Set output frequency to 12.102 GHz:
> > +
> > +.. code-block:: bash
> > +
> > +    root:/sys/bus/iio/devices/iio:device0> echo 12102000000 > out_altvoltage0_frequency
> > +
> > +Read current frequency:
> > +
> > +.. code-block:: bash
> > +
> > +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_frequency
> > +    12101999999.582767
> > +
> > +4.2 High Resolution Frequency Control
> > +-------------------------------------
> > +
> > +Configure for sub-Hz resolution and set a precise frequency:
> > +
> > +.. code-block:: bash
> > +
> > +    # Set resolution to 0.1 Hz (100,000 µHz)
> > +    root:/sys/bus/iio/devices/iio:device0> echo 0.1 > out_altvoltage0_frequency_resolution
> > +
> > +    # Set frequency to 12.102 GHz (1 µHz precision)
> > +    root:/sys/bus/iio/devices/iio:device0> echo 12102000000 > out_altvoltage0_frequency
> > +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_frequency
> > +    12101999999.980131
> > +
> > +4.3 Reference Frequency Control
> > +-------------------------------
> > +
> > +Change reference input frequency (if using programmable reference):
> > +
> > +.. code-block:: bash
> > +
> > +    # Set reference to 122.88 MHz
> > +    root:/sys/bus/iio/devices/iio:device0> echo 122880000 > out_altvoltage0_refin_frequency
> > +
> > +    # Verify the change
> > +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_refin_frequency
> > +    122880000
> > +
> > +4.4 Power Management
> > +--------------------
> > +
> > +Power down the device:
> > +
> > +.. code-block:: bash
> > +
> > +    root:/sys/bus/iio/devices/iio:device0> echo 1 > out_altvoltage0_powerdown
> > +
> > +    # Power back up
> > +    root:/sys/bus/iio/devices/iio:device0> echo 0 > out_altvoltage0_powerdown
>
> I'd skip this section as being very standard.

ack

> > +
> > +4.5 PFD Frequency Monitoring
> > +----------------------------
> > +
> > +Read the current PFD frequency:
> > +
> > +.. code-block:: bash
> > +
> > +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_pfd_frequency
>
> This one isn't standard ABI or in your ABI doc.
> Perhaps drop for now?

yes, should have dropped this earlier, thanks.

> > +    100000000.000000
> > +
> > +This shows the PFD is operating at 100 MHz, which means the frequency resolution
> > +in integer-N mode would be 100 MHz steps.
> > +
> > +4.6 Monitor Lock Status
> > +-----------------------
> > +
> > +When lock detect GPIO is configured, check if PLL is locked:
> > +
> > +.. code-block:: bash
> > +
> > +    # Read frequency - will return error if not locked
> > +    root:/sys/bus/iio/devices/iio:device0> cat out_altvoltage0_frequency
> > +
> > +If the PLL is not locked, the frequency read will return ``-EBUSY`` (Device or
> > +resource busy).

kind regards,

Rodrigo
