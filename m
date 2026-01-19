Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328EA29BDAD
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768864884; cv=pass; b=uNyFR6pHn3fYVC+kq2n0/H59lfWl5wRuz6OTsrUrDlMV0eh3FJz+LOK8fDKYQQb7XRaiUh27z1/vSOkK3v8md7bnKWfpd1OZ+0YlA1I5xR9MvSjO9D69CJlzxbiOBmSepx+s5xOV1md/6RjfqK9swnFDA7auj1/h2b79cHdOvR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768864884; c=relaxed/simple;
	bh=YdLrpfctD2iaOxKslCuiUJ1fqUiNAufKSSGVvvwU4KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5JeqkfgtUg1jR15WW3Ob6mCC2IV4GfdQIf7cVYIcRaiNW1yhg6vxskg2ktYkAbGq1Al+FqQW06S0DWr9c/1RwjOKx4lJKNqNCKY9f4TquYzN0GoxxOYuxOdhQg2GGAZFe0Fh6vCcTL1PIVTrKv7W85j1nmcIqyafVP6Nz8PM/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaEVp/Om; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaEVp/Om"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b78886454so5948446e87.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 15:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768864880; cv=none;
        d=google.com; s=arc-20240605;
        b=Rct1zc9taQgrrkqFRrJnUzH4X2tY3Dtp8V+27kcBnUXy8FR6aOXlY/jHOIz5vCOUe2
         1vLh0LmQUqEYUJPXGOEpEdE4mvLqyncAy7914muoA6Qu2mTWRvcRe9Jl4Tesp5JPvm01
         mM4giWLNPBy87F1uaVYxO9jAWAlnB+tzEj7N4ZBEz6Nt2VV8z+H0Fn1T9fgI6eaPCQR8
         +q7X5+0JEkjcWZqX1HBYGNmzKw57PET7drF+GpCloJ57UWAaJ1TgBduahrisWQSbg3+T
         59m9RIV6DFPT25DqEpGv3aEmK+1E/Ar8fXxW1N8jUXdxxJIeLC02JUZ8tJGCNOfKjDLX
         38Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        fh=7XllsZ7CQwqBBWD/GfZksnRLfRgBeIY5Wlc0gANDkDc=;
        b=UrNukJpip/nWCLz3BjPKvsdAr1ixchB39XGftsLZA+k5X6zd5nPpRYMgzHurnXsb1V
         xXnwMhhFG3FvQUiVI9WJ3J79ft5W6d+1u5JD/TLVENNn/Hsyk7pIlq5sWs1ReXSToETN
         +Tp+r2h4zGB7btD0VG/mgnwpwJnLl4NZRJDVWpeVJPfFbudBmEqqcjrbGFag2iEH26Y8
         8mKv8LJlzLI8jfSxeAuZocBrRgZCblE0/gFoexuWrbPOptfnu4SkNzlBrdN74sNnHUjQ
         wNHb+3nOjxbZa5SMsHKq9pHZuP13eKz6OH4yGqWOO5n5IB2mIdcmNFUhuGaP9yf+TBel
         H4bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768864880; x=1769469680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=WaEVp/OmqKIqk17b8S2wMU0OTXVwqstcFUjOmf8MeZnII39fn5dFpnt71GEuGKwtKX
         KCs4kK0tEi/1Jnw7aD2Op1GCHfcEqG0cqrgmyxhNTXcvsUR8YTS4xGn1HaaR2ZxI6vTW
         5elfb91Rk6gZ3WH1zcMf8o2vVOJLfu+9J/v3565IL2j5Ni7s0dB6pcOS8FqVtH61LHrI
         ayiyJ0hkZ5/UQ9K7EA8ujjsKweMN6aZh69tV03q8owAamkBmtHzFt0QosbZKnpseko7D
         4kleJo3gV4JbN2do/DB2wRRerz2u2aSiZ3yrLkDOXDGaRccTpe3dUZ6NcSSRRrxjCixq
         WLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768864880; x=1769469680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R6InNnz7iacJl3/TduXAj8W3uRVmL4OnpDkc9siuZ9s=;
        b=mBlE8wvLC1ZvZx9KpgznhtEEdPwgL80zfJTAaZxj2SQktoVOY0zfxc+zi9Hu5D7DbY
         Fh5kJ35XgXnguFH1PLmFHqhAi/kl92Lsw5SabLv2lnrc+hmL9YJOpVNAyQzHljB8xoYb
         0VA7yv/wN5oeSNwr2VU7GabhqwGBJ45r895Qp42nvdD+0R42ynGGY9gYqLv/1lD69qZm
         tiVpJIiMmCGPOL+9cOu1eB+qr6scqwmNm2M3/xIpK2pgwXdJZFDAdAwWSKaSayh8wCc7
         nWJLzyFkeK/bjr/n+jErM+LmSDlAuUxFZ3oNicyRqJJsqRLsMDA9dAjo5ZlzYlJNWMP8
         VPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM9Y5zFOI/AkD6iBHlOpcXvlj+uijL/q8CFQ/3ytw71pT3hQe/PRQaM2l0WEKhG1XugB5PYI0FXW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8cRB7t/hNv5TZo0uWiLQ4Ff6PqeLWZ6GbtU6Thpjg5USkJv9
	7letyu/CNzhbuiYQJdx+jQriUcQJP4rmqcGw58U3HML+soXDB19dz11JkmogsiP/oqnaB+KL3xq
	7TM464LYYbRU7DdTzEAnlDjF5px1aEkI=
X-Gm-Gg: AZuq6aJNqAlWZkLVKOJNF18P8/2/W+XK6NlNtPEfakMuFDhmcxI7OszE0k6UJARB9yz
	BPqpB1odCuBI7tiHXlfs6rdWZMn48gYxjtXbAOQlxhDDEn/TqW5SAi0revNewcG+PMAxLTPtzLY
	YoHzapNpb59rIHlf3MYYeklygvg5fmwBBQtp/XEzE10AkeaIIvNpwvAZosyDvekGQFUijS7BJw2
	woQ8jwbLnyju+epvccfEmn/sHrQKhl8V6yN65EdcGDZLOfrTXfAa+WqbjUh0xxfRJ4o+VA=
X-Received: by 2002:a05:6512:3f0d:b0:59c:b818:c063 with SMTP id
 2adb3069b0e04-59dc8f11cc5mr49938e87.9.1768864879748; Mon, 19 Jan 2026
 15:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226235101.106451-1-vishnuocv@gmail.com>
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 20 Jan 2026 08:20:43 +0900
X-Gm-Features: AZwV_Qha_AGcHlqJSZIc-uaFh5iazIYWt2QyAkghgDolNbh_GArBAIYfPOiBrsA
Message-ID: <CABxCQKu35Gc_+axoWD6pWuyFkbgWyRc67RP4iTsP8xw3U713PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] TrackPoint doubletap enablement and user control
To: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I=E2=80=99m writing to kindly follow up on the patch series I have submitte=
d.

I haven=E2=80=99t seen any review feedback yet, so I just wanted to check i=
f it might
have been missed in the queue. If there=E2=80=99s anything I should revise,=
 test, or
clarify, I=E2=80=99d be happy to provide it.

Thank you for your time, and sorry for the inconvenience.

On Sat, Dec 27, 2025 at 8:53=E2=80=AFAM Vishnu Sankar <vishnuocv@gmail.com>=
 wrote:
>
> This patch series adds support for TrackPoint doubletap with a clear and
> simple separation of responsibilities between drivers:
>
> 1. Firmware enablement (trackpoint.c):
>    Automatically enables doubletap on capable hardware during device
>    detection.
>
> 2. User control (thinkpad_acpi.c):
>    Provides a sysfs interface to enable or disable delivery of doubletap
>    events to userspace.
>
> The approach follows the KISS principle:
> - The TrackPoint driver enables hardware functionality by default.
> - The thinkpad_acpi driver controls whether ACPI doubletap events are
>   delivered, using existing hotkey filtering infrastructure.
> - No cross-driver APIs or dual filtering paths are introduced.
>
> Changes in v5:
> - Rename sysfs attribute from doubletap_filter to doubletap_enable to
>   reflect actual behavior.
> - Fix inverted logic so events are delivered only when doubletap is
>   enabled.
> - Suppress ACPI hotkey delivery instead of injecting or filtering input
>   events.
> - Register the sysfs attribute via hotkey_attributes[] instead of
>   device_create_file().
> - Drop unnecessary helper wrappers and debug logging.
> - Update Documentation to reflect the new naming and semantics.
>
> Changes in v4:
> - Complete redesign based on reviewer feedback.
> - trackpoint.c: Simplified to only enable doubletap by default.
> - trackpoint.c: Removed all sysfs attributes and global variables.
> - trackpoint.c: Uses firmware ID detection with deny list.
> - thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
> - thinkpad_acpi.c: No cross-driver dependencies.
> - Documentation: Updated to reflect simplified sysfs approach.
>
> Changes in v3:
> - No changes.
>
> Changes in v2:
> - Improved commit messages.
> - Removed unnecessary comments and debug messages.
> - Switched to strstarts() usage.
> - Simplified firmware capability detection logic.
>
> This version addresses the remaining review feedback by correcting the
> naming and logic inversion, aligning sysfs semantics with behavior, and
> fully integrating with existing thinkpad_acpi hotkey handling.
>
> Vishnu Sankar (3):
>   input: trackpoint - Enable doubletap by default on capable devices
>   platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
>     double-tap
>   Documentation: thinkpad-acpi - Document doubletap_enable attribute
>
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 20 ++++++++
>  drivers/input/mouse/trackpoint.c              | 47 +++++++++++++++++++
>  drivers/input/mouse/trackpoint.h              |  5 ++
>  drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
>  4 files changed, 107 insertions(+), 7 deletions(-)
>
> --
> 2.51.0
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
