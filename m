Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6542C181
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 00:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740183817; cv=none; b=st5Km9mCFCYsGBuTXVotkREj1CTK7+mzZXfnUG5MEjIs6rIj0YaxV8xXziZ6K0FoPAa38d2PlNwcFzFxKYWUAC+e2ljKtSLNgv7Cw9OQc3LExaN7MH7QVF4/jrHN7TfJfnDA5iJDx3vHeacXGY746G59nTPSW/FS69VsNTOvBEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740183817; c=relaxed/simple;
	bh=uWGj/ghDVjddUIymJroVvjH/8Eeew7Akh55VEKldi0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rqu/EZxXeLe6gTHhEL/FAohCCG98BG767YdQDxsedce3X64pyMU4lmMrNIJDkZcVKrhlyskQYFxfkZGj9A+FuDiCzcOOGw62t2zAik8XLatAylkGSkQlA2jZevgGr9T3Htf5Y/n45JY58vT7QpsEsaaL3D8dnhL5LTLpkb9VlSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ftTjcCjm; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ftTjcCjm"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e1b11859a7so13758616d6.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 16:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740183814; x=1740788614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSzQcTJF5xLPZTvWx3iP/k+uVIkdYz50MFGnhN54B4k=;
        b=ftTjcCjm1k1zfpnaap8hCLBJy00DKY0HtrXdKThR2yPM47EMDOSztXfrx3+TNn1Nl3
         TE6ifyYxGZadqPi+t222T2i24K3dNtPau25/rzx634qGJpSROoE+GHxUbOrFQ+NQEnbr
         OV4JAFNGU5XLI5L3fBHBnGskA9yCqDht10YIbVDcBLAqrVAixNX2QR4yyEaFvYw5ERNY
         Khx1IU5YdGcG0Uci1zkipyLWio/33BZfcOkBSsf9nh3IjCZTPci+2lUsHMhDnxMYsEQF
         2n5F6xkg2M9eq6sdRJQ/ZE5Pyf5fkjsQ1y0KtiCjGJ2Uqh3+MIvgTAnhgEVe0ezpQIwP
         vGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740183814; x=1740788614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSzQcTJF5xLPZTvWx3iP/k+uVIkdYz50MFGnhN54B4k=;
        b=IY8jPnNurWsjRFJLxkDbotD0WTuG5nYwnqdVY7cQHhkZAPfLYB19srWVbwkBdonIgl
         w16Vp2ePy3X3CMHEBi8opD+r8P2DkjRCRmZsPXkwfLNw/ufss5fsbdOfinelIDqqcpPs
         MK25GoW0yuydj5lk7gYeHCihuNTS0BvCHHBoex+SkloJLankLG83UsukdeWxAoG39+YD
         D1Zw1gMZSi0wI/5oTuc/LrtstITX6Zf2bzlwsQ3AUW9AAPIwHXtYk9rLx4yYurwHLuH5
         if2ATVNrlHhQEJbJP1DjJQTboMHICjS1sSznploGVLK/TUeaHoNGuPcMg0Pp0qau9aiK
         qhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeOVE6+Wc4+P3oFy1bKkOEGtExQOAX6o0K79VCwjwpK+nC6bk4EgjYswgJAI9uvowE7pc0V25HgIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG49A3lwfTg/UBRLcRlx20oFjG3Hs4XpMyy7OZGvOyioO/NYZy
	OLTlJZ/UKQOdDJRxbge1vAitu8gE7XfxZxI2IgTMVba5nH/+0TgiBgyeHjhQvRMIPzOV1m0Df9R
	YnTCdW81pO2ZdgjP53Ql/VMXW6n1sEjh+Pbbk
X-Gm-Gg: ASbGncs8tRx0Ym29xg4Hx6iiKNlA+QCKVE0IdkbNgwpnbYNX4ooUdPmvkAGOnhEFCV4
	XkMZHXENt4K6S1PGXYO0VUPKE5Tf2tO6M8hOaXE3SPaUt6cCoE0vC7IKFp5brI1Nkv3xNB3ljjW
	uBJXtFzGY+tajcQpfPRWglkX61wr0VERm1rhx+9TYdBA==
X-Google-Smtp-Source: AGHT+IGuQ0EvmHyfKG5oNm+O437XGsKsIWjy7D69nwbmU+BvrwdeCAVThohimbQuZ5UbFbSqz6k2XiLKMUmXP/PvzrA=
X-Received: by 2002:a05:6214:29e8:b0:6d4:b1e:5418 with SMTP id
 6a1803df08f44-6e6ae995a51mr75420156d6.33.1740183813487; Fri, 21 Feb 2025
 16:23:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220-kunit-list-v1-1-40b9d56417ee@linutronix.de>
In-Reply-To: <20250220-kunit-list-v1-1-40b9d56417ee@linutronix.de>
From: Rae Moar <rmoar@google.com>
Date: Fri, 21 Feb 2025 19:23:21 -0500
X-Gm-Features: AWEUYZmnGvGuhAJ-WPSpg1m6Yg9Ho5W4SXQsSKmnp-R-4-C-DrR6attW40T2wKY
Message-ID: <CA+GJov590t3N5NgsPTan2yR2150Y41wotPzW1RojTC6CEd_O1A@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: Implement listing of available architectures
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 10:44=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> To implement custom scripting around kunit.py it is useful to get a list =
of
> available architectures. While it is possible to manually inspect
> tools/testing/kunit/qemu_configs/, this is annoying to implement and
> introduces a dependency on a kunit.py implementation detail.
>
> Introduce 'kunit.py run --arch help' which lists all known architectures
> in an easy to parse list. This is equivalent on how QEMU implements
> listing of possible argument values.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Hello,

This patch looks good to me.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!

-Rae

> ---
>  Documentation/dev-tools/kunit/run_wrapper.rst | 2 ++
>  tools/testing/kunit/kunit_kernel.py           | 8 ++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentatio=
n/dev-tools/kunit/run_wrapper.rst
> index 19ddf5e07013314c608b570e297a8ff79a8efe7f..6697c71ee8ca020b8ac7e91b4=
6e29ab082d9dea0 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -182,6 +182,8 @@ via UML. To run tests on qemu, by default it requires=
 two flags:
>    is ignored), the tests will run via UML. Non-UML architectures,
>    for example: i386, x86_64, arm and so on; run on qemu.
>
> +  ``--arch help`` lists all valid ``--arch`` values.
> +
>  - ``--cross_compile``: Specifies the Kbuild toolchain. It passes the
>    same argument as passed to the ``CROSS_COMPILE`` variable used by
>    Kbuild. As a reminder, this will be the prefix for the toolchain
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/ku=
nit_kernel.py
> index d30f90eae9a4237e85910fd36f7f1c731d952319..e04195b135edc8f1aabe21d09=
4b276e47c4f6848 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -14,6 +14,7 @@ import os
>  import shlex
>  import shutil
>  import signal
> +import sys
>  import threading
>  from typing import Iterator, List, Optional, Tuple
>  from types import FrameType
> @@ -201,6 +202,13 @@ def _default_qemu_config_path(arch: str) -> str:
>                 return config_path
>
>         options =3D [f[:-3] for f in os.listdir(QEMU_CONFIGS_DIR) if f.en=
dswith('.py')]
> +
> +       if arch =3D=3D 'help':
> +               print('um')
> +               for option in options:
> +                       print(option)
> +               sys.exit()
> +
>         raise ConfigError(arch + ' is not a valid arch, options are ' + s=
tr(sorted(options)))
>
>  def _get_qemu_ops(config_path: str,
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-kunit-list-552a8cdc011e
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
