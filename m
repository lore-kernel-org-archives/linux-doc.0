Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDEB340298
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063574; cv=pass; b=bGaE81+O/gho4upFoyUpylgYyJFl6Qc9GXarZAavZg7YHXV7zAOyIN6LyQ1hiT+q9wzFmVTgaaKYV6eHhzHYiYiEzMan1puzzOQuFDH3fjwtg3q0F6eKNxe1kzqJ3Pd9J6m9vRL9vL1MaT6H9DATNXP4YEJrrKvOYFsWyS39GEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063574; c=relaxed/simple;
	bh=dlQKIFsaxCwqnvkgUyYCLKYUIChEVDORaNS2cmPvIXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmJo4Dr2eqephhEduowTUo5tnjH7IEHgTEUfq8xI+yoO7eCnFtoRolzqByEqOwtyfxc5aG7G+ahs6Tu7qUCENQKpHy93xESZ8ESBYvlmumtGjh+gwOV4G8ANaacmnhhWhZPRi1YzdHWOy+qj17YQlrUF82IfFtCjsJpiivXe3To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo7X87NS; arc=pass smtp.client-ip=209.85.161.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo7X87NS"
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-69d92dbc420so4227602eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 07:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780063570; cv=none;
        d=google.com; s=arc-20240605;
        b=Qwbbj+YB0vzmInQjq8BnKWoWdtNkIdfVfLGAYeC4ecOoN5E6IMh10kVflgt4g6ytlu
         L3ImxDyfD75Px+S/s5SJdN7vudX6sSYBRM3JGfWl0+nd3v0waMT6mr7yo8Rch8TgwA9O
         zIChHUpTn/RAAMJfVqDGaIqhlTarME5p8PinLbtTEOIl5klXSX2LfqSOcQblnZn7Dzm1
         NoAtSWFwp0FIJLiT7BF3E3gmnkwAWOSRad2KmCeqldCOl9k6YiT0dwSG7St3yJnTu65Z
         ttdGS1IcBq22XtFfELwICqyzwZtFxTjtiFPPw0Q1/md2TotkD5jwK4mBqFtfXPDhN/vJ
         0j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
        fh=jzEyzojs3dogTyGIAxVQQEmkaPf7zWOJLaC6uj4gHp8=;
        b=KScBIBgAF6pdTT0KUVW3elBNLiwDeeuXSlk+HXQORqnnLv19b+ofuQeH/RIu5R8MIY
         R19Ax9jv7Xtxv8n9OWl/RZ1sZ95LV81ta04QqktR0IR55PGmDEmz/6cwsEh3T1EyEMS5
         XrFT/iETzZVc7db4UZA8aVQkC+jDF0oFxhZjg1Oxge+L2I6rgs0uwWspPy9E5mEh/WNA
         4eVamvSDfaMKDJcCyL8CAoFhWxewzvoB4P07M84u7sn8w947K4WR66L18x1FSL8LEza8
         kj/T1iG/1CvlP9ORDD+cRjxboCLVz6JO9U6WDvkhwBM3wwZIclyxX9/4zaCo2l526Nqe
         TjfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063570; x=1780668370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
        b=jo7X87NS6qDxhOnXL2lAzPbTFzLj0I3/fwYlest3CcBYV9N8TmNB4F5UpemHeXtvgD
         6leWZdM4f26MipKXrqv062eHe0PAFwWKuuKH5vJPjmLqANc0zanTWri2s1LR9Dbn63WC
         bN4YMyrVnlL45wmviLlUU/uEG7ybD7KZLaJpzSJQBhxZaCyTo6J++PjSFK/fRH+BuiHx
         2HmPuSTAwgX0/zrjRg9c7hjMurG3HXL7Fvldgwa5SRn7cFZEqu8qwOw/qKQV7+NXQ0nK
         IHBSn63D/z1lWJhHdBhna22dscHNVCEbJh/WXsE6dkLHTgSqlJcpUQjD/UCwlB9ZWRgK
         h+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063570; x=1780668370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvHjpUscS3LGAt7KUFAQnACdb0jmXR2p4L+IG6VyYLM=;
        b=lH8HXdzd4rkZZuEOUNAlNZ7JpPKvxocce0rTYjZV6NhTiCh05ExAH3VECEzfOJ/IP4
         UatZYYG0ZamJ1z7S4AmuL3S0ejjiJng0V++rilYUwsWkYs4U488zxvGMCZEy/cOnKlwG
         Lb7GjlZU72Uj3LHmJtbJXTlxxzqpsfQrkkA+qJKtp9S1g/d3+nWMhh36134nliJTQfp5
         6XKO+rN968N/PtOyfL7mmpqxyWtJvfrbnf3aML9HXmKZ2ooNoBkP14GA3lBP1KdKY28T
         us1BVVIRVGiPAAwrZPgX7qk1P0K8X5djZY8yDcE7vbA6dxp82udcVcddiZjltIE4vY3g
         JTWg==
X-Forwarded-Encrypted: i=1; AFNElJ8/xgVk00R7ViTw7BSfdrmWxNnSGk5xZdU+QeUnzolCE78YVMbmPOYkhgltVeFESop/4jYzS56otxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1VduiNMmg5msxHnhParaDpsrZUKFstxrFP5vU5F7YJ74ytOz
	nwpcqSdHLkybGNiO/LxcYewOSd3cEhiD27W9VAsXbe7dYpUrtw1n3qJQ4XoYMUx9Xh4VHBUlmV3
	xblxa2vt2CavtOuafHsb6B4rUCdm2Gew=
X-Gm-Gg: Acq92OHSgo03dULmUDqSvuSVlbj9nbwo3Gf0S7M8uizIP5G/LmoddCra6hla86w75mI
	nAiWpLW0b5ALD+puFXkAKXo8UzIprA0/tZswcnUceiyYhvOYPzVX3C/mXkZZ+TGZgzzMyQwV1yv
	Q8bDvgbq7DD71eB2hC3in+e/NiqWb8U/PY6n62GdsGmmKXZxzNeK23jWwmTU58Je/ggEHcXePzS
	DIJGBgAdVv3dQCzgmJqUDtS/p+lWpRioIhWzIn4hbNBgGoGVnasRMEys9xufC/9bzxw5H5ZxLHn
	Dc8fQ/VuzlvHBS0gN0fU
X-Received: by 2002:a05:6820:4dc3:b0:69d:8879:b68d with SMTP id
 006d021491bc7-69e04031c40mr1576978eaf.47.1780063569742; Fri, 29 May 2026
 07:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527115311.13398-1-zhanwei919@gmail.com> <20260529135028.20763-1-zhanwei919@gmail.com>
In-Reply-To: <20260529135028.20763-1-zhanwei919@gmail.com>
From: =?UTF-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Date: Fri, 29 May 2026 22:05:58 +0800
X-Gm-Features: AVHnY4JSxROazTZrUw4k9CKjlOr2tJ7BgWyUtPWVIMQB2u2A0wFiRfrZym4I1SI
Message-ID: <CA+qUFckr9uC7h4S9xw0JMxGnehXyrQ8HpOYdwoFoMsLk-HM_nw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe/hwmon: document DG2 fan speed reporting quirk
To: Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Raag Jadav <raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Cc Raag, who authored the fan support and reviewed v1.

Thanks for your help, this v2 drops the code change and documents the
DG2 shared-tach behaviour instead, per your feedback on v1.

Zhan Wei <zhanwei919@gmail.com> =E4=BA=8E2026=E5=B9=B45=E6=9C=8829=E6=97=A5=
=E5=91=A8=E4=BA=94 21:50=E5=86=99=E9=81=93=EF=BC=9A
>
> The number of fanN_input attributes on DG2 is hardcoded to two because
> FSC_READ_NUM_FANS returns an incorrect value on some boards. How the
> physical fans map onto the tach channels is left to the board vendor:
> some OEMs route multiple physical fans through a single shared tach
> line, in which case the unwired channel's pulse counter never
> accumulates and fanN_input reads a constant 0 RPM.
>
> This is expected behaviour for such boards rather than a driver fault,
> and the driver has no reliable way to distinguish a shared-tach layout
> from a genuinely silent fan. Document this so the flat DG2 fan count is
> not mistaken for a bug and "fixed" by lowering it, which would hide a
> working fan2 on boards that do wire two tach lines.
>
> Signed-off-by: Zhan Wei <zhanwei919@gmail.com>
> ---
> v1 -> v2: Drop the code change. As pointed out in review, the same PCI
>   device ID ships with both shared-tach (multiple physical fans on one
>   channel) and 1:1 fan wiring, and FSC_READ_NUM_FANS is unreliable on
>   some boards, so the DG2 fan count cannot be lowered without hiding a
>   working fan2 on boards that do wire two tach lines. Document the
>   behaviour instead of changing the reported fan count.
>
> v1: https://lore.kernel.org/intel-xe/20260527115311.13398-1-zhanwei919@gm=
ail.com/
>
>  Documentation/gpu/xe/index.rst    |  1 +
>  Documentation/gpu/xe/xe_hwmon.rst | 48 +++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_hwmon.rst
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.=
rst
> index 874ffcb6da3a..3c14cdcaa8a6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
>     xe-drm-usage-stats.rst
>     xe_configfs
>     xe_gt_stats
> +   xe_hwmon
> diff --git a/Documentation/gpu/xe/xe_hwmon.rst b/Documentation/gpu/xe/xe_=
hwmon.rst
> new file mode 100644
> index 000000000000..8cd48df59386
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_hwmon.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Xe HWMON support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The xe driver exposes hardware monitoring sensors (power, energy,
> +temperature, voltage and fan speed) through the kernel hwmon subsystem,
> +typically consumed via ``/sys/class/hwmon/hwmonX/`` or tools such as
> +``sensors``.
> +
> +Fan speed reporting
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Fan speed (``fanN_input``) is reported in RPM and computed from a tach
> +pulse counter: the driver reads an accumulating pulse register, divides
> +the delta between two subsequent readings by two pulses per rotation,
> +and time-averages the result.
> +
> +Number of fan channels
> +-----------------------
> +
> +The number of ``fanN_input`` attributes exposed in sysfs is the fan
> +count returned by the ``FSC_READ_NUM_FANS`` pcode command. On DG2 this
> +command has been found to return an incorrect value on some boards, so
> +the driver hardcodes a fan count of two there. As a result up to
> +``fan1_input`` and ``fan2_input`` are always exposed on DG2 regardless
> +of how many tach lines are actually wired.
> +
> +Zero RPM on DG2 is not necessarily a bug
> +----------------------------------------
> +
> +How physical fans map onto the tach channels is left to the board
> +vendor. Some OEMs route several physical fans through a single shared
> +tach line, while others wire each fan to its own channel 1:1. The
> +driver has no reliable way to tell these layouts apart, and the same PCI
> +device ID can ship in either configuration.
> +
> +When a channel has no tach line driving it, its pulse counter never
> +accumulates, so the corresponding ``fanN_input`` reads a constant 0 RPM.
> +On DG2 this is most often seen on ``fan2_input`` for boards that drive
> +both physical fans from a single tach line. This is expected behaviour
> +for such boards, not a driver fault, and reflects the board wiring
> +rather than a missing or stalled fan.
> +
> +For this reason the fan count on DG2 is intentionally left at a flat
> +value rather than tracked per board: there is no driver-visible signal
> +that distinguishes a shared-tach layout from a genuinely silent fan.
> --
> 2.43.0
>
