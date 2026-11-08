Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164385;
	b=tZsuOpwEexLb6MBx1pHUyQmCzW6u5p5ad9sazIOd1hD2RYkjWUf8+RXvOHR/7GEQy9P/
	 yjdf9LOnpmYYDONjNPDRyOv0EqIQeOxvtIJIHekqSwYziVLXpt157mjxoeZl/cvqCzok4
	 7+vF8usTFIHMua9hgCh+VBsaboHjuku0GCyC/rAjs7UvtWt0HRXAE/lrapd4ubw183CGL
	 KNaYzs7A8jCj0sTym4nIIyXhDUdIhXskj4sp1w+qtpNceS0/zl9ZsuzukyGpXEaIC4dFF
	 9DGZx9g+RAJFFcFAZ+u85JzqkwDMYQVhjJhjVM/l64Ea/TrkzX0BmSxSJd1dr7mubMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=y63byGnQBDqvrsbSDi7RU9ZtkQTeXrhNmd2jcGqenW0=;
	b=F4xC9h9lxlR+nkp+bRo8p+rvdvXd66ufHCfa4+YWkfhevx+OG28bNvoiLgUyFLEusjAe
	 dTZabDvwpjYiD8hM203/R1wow9hnOxWnpwzRG+mU5bNZvyFJthG569lPxmtdJsscQ4C+a
	 z5qvxsLDtvVWsGYZpUABVwISfTa2UuEOtLUFPFhbn8PojHHp6Kan/8xAFa0c6Z2jP6q3r
	 ThBHEqWxZIbPykR7awk4jD0982OA6Ti8yneK/134V31dRE3gNwOwoH0cn4n9V/39ZCnA2
	 APus+Ne1O9PjemnXe0oCSK2MavvJW4rLzF2klZn6K9OqUNaupjSRa5DLeG2UH6qCd2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9twU3XS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3F606A31C
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 18:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D3F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9twU3XS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso2041935e9.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 10:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164383; x=1794769183; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y63byGnQBDqvrsbSDi7RU9ZtkQTeXrhNmd2jcGqenW0=;
        b=V9twU3XSCvvfnwaNC7aMVNibhquHL0k+8QawwvYYW+KA7/JVl9WHNMRiFs0O8Fsq+Z
         8Hvld7gN+we/NiFGSqjlpu2e5EYfcJROTSBjQc4CSjxUoiJWbTURhyH/vPGznKi+XkCo
         F5VxbDzyiqf3N6fhRWvUqDFtZ5ZOjaYxDAvCz1VjT+UH2lJl6c85cYlwhKq0iexQbZE/
         iGH2Aen1322yQNYFD8BV04ruJF98hSSW2miGTcIAGfDuADNNjtqs2EKQdH+1sEpxHv2v
         PGpwkZ6cTGnllH77HL6vqTYtUmuS/iha3QgbEOUHjYdJ84owt4hpALfWl7YIcHAQaQTo
         MxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164383; x=1794769183;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y63byGnQBDqvrsbSDi7RU9ZtkQTeXrhNmd2jcGqenW0=;
        b=V0BfQT0VeXJR9ZmCY/nXMOnk5ZMD3m9xEnpw6kLCs7Jdp4qYox/Z1ysd1WycX20wNa
         7D+EMtEXHcf7r0FrYHqE7PlZ5A5ArJT/HYn2IK+T6ERxyO1Ph+u4zFqU+O6KEnn0D0A1
         IWZOLmAnKSw/mhQqSZVJ2eETvskpdciKf+tVmYr5uk992dZR8TaQonh61DQGN9gYM0cd
         VzsoETdkInz9SzGeJBpJcnLr3Z7ffTSzRh/BmtkPJ7FvZTiPOt47qjm49Z1sGE8UhNvI
         +S/uXpnYzeMxqsGlIkTDAOmuA4aB06MxdVjMKDmKfcSSs7bIGwJJiW/oN14iP4DHHpVd
         dGhA==
X-Forwarded-Encrypted: i=1; AL+hErFnq0VJb8t7iI7bkiogjvrDJPSZlIbF3ZL875tfATolt/gIsPBjkvvEmGnJ8sr8ky9h8jM5OobsuoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C87O+8Puw6o0cLCDlbya7Fd49NTMGRP6xEqIASiIDtCnDqnf+
	afUYeMWHvHFNyDc+6TLI7e5R3N3Tj/2p9jlgUWSOA6DOc7YvUznkNJWK
X-Gm-Gg: AYBFou2H6ThM4PnZJIhiy4faqO+r9UOZ99uZvwwjLOWDBs+JClHpLNGbOUjDSp/pxru
	ov7/HDzHXfLwdsCuvix2vZR+Akb0OxuDHRAmzJqFAsXcFinVRtOg5ynCr6WubZBwTbJ8H87h//R
	6eF0x6FHBXlAlfBp9ajzq0izk/nNiItWw4Skg0AsSg2FbOjYFo4f5X0pllAM0RoUh5BQpMHzK3K
	emCjoerfVA4aAtmzR5H/8UI/Lz8OIqvbwFQ+2oAzwY8cr2azUcNQKVGzRCeCWV8n25nMLB4uyrW
	xemXUI0Slj1wPVWAF4K2EyI0eQXgvndem4eV/o5BLhaUBCx7mbCmNpb9T/3OMc9bf1/gK7xSRCe
	vsjuUykHULHkHZGUklijRTn9tnuVjq/kN2FVdm5quRJyp8Cor9NK85N+cwJfn/XrAFb2EXVQ0Tf
	egM7CxbkB+xLARvkie7jjYdKtINPlqllJOlveQd4Nl7/XSQGLR1zbExmmJwcMX7vhsjGVk0fili
	rnOvJ8KvdOE06ZM8xZzY5s8fSzfJ+Mu461nmyZJyzSJozW3CMTxDYv54tSmIu+oyBDCEcvUOx28
	WpEqnK1eA9l4oSD4a9WbTz+dSGJW93tDCnB8YLyDfkp1pRvYFSSkPv0m13LeiSa3DCpyxJIfzoC
	nXotX4W2K2XhE8Figxvve
X-Received: by 2002:a05:600c:6990:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4b963c7e550mr38189275e9.13.1794164383440;
        Sun, 08 Nov 2026 10:59:43 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:42 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9729a4c6-22f9-4102-b62f-c76a75488240@gmail.com>
Date: Sun, 8 Nov 2026 18:59:41 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 03/10] kconfig-checker: Add the configuration checker
 code
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-4-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-4-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wygbcu0eB30HJ7r218T0kJHN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wygbcu0eB30HJ7r218T0kJHN
Content-Type: multipart/mixed; boundary="------------XEeck90arMImjdiitW9iXW07";
 protected-headers="v1"; hp="clear"
Message-ID: <9729a4c6-22f9-4102-b62f-c76a75488240@gmail.com>
Date: Sun, 8 Nov 2026 18:59:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 03/10] kconfig-checker: Add the configuration checker
 code
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-4-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-4-darwi@linutronix.de>

--------------XEeck90arMImjdiitW9iXW07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Introduce a kernel configuration checker.
>=20
> Validate the passed kernel .config against a YAML rules file and report=

> problematic configuration issues by severity.
>=20
> For correctness, readability, and long-term maintainability, type-annot=
ate
> all the Python code and split the tool's logic into a clean set of clas=
ses.
>=20
> Create a proper Python objects data model for the kconfig checker to wo=
rk
> with.  Confine all direct YAML dictionary access to YAML files loading,=

> validation, and data model construction.
>=20
> Document the tool's development rules on top.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  tools/kconfig-checker/check.py | 558 +++++++++++++++++++++++++++++++++=

>  1 file changed, 558 insertions(+)
>  create mode 100755 tools/kconfig-checker/check.py
>=20
> diff --git a/tools/kconfig-checker/check.py b/tools/kconfig-checker/che=
ck.py
> new file mode 100755
> index 000000000000..476cd13e59eb
> --- /dev/null
> +++ b/tools/kconfig-checker/check.py
> @@ -0,0 +1,558 @@
> +#!/usr/bin/env python3
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Kernel .config checker
> +#
> +# Main usage:
> +#
> +#     $ check.py list-rules
> +#     $ check.py check -c path/to/linux/.config -r preempt_rt
> +#
> +# Notes:
> +#
> +# - All code is to be fully type-annotated. Before introducing changes=
,
> +#   please verify type-safety using:
> +#
> +#     $ mypy --strict --no-warn-return-any check.py
> +#
> +# - The minimum required Python version must not be newer than what is=

> +#   required by the kernel build at Documentation/process/changes.rst.=

> +#
> +# - The tool must not depend on being run inside the kernel source tre=
e.
> +#   This simplifies invocation, testing and possible future packaging.=

> +#
> +# - The YAML rule files are only treated as a serialization format.  A=
fter
> +#   loading and schema validation, such rules are parsed into an inter=
nal
> +#   data model: Severity, Rule, SymbolRule, PatternRule, Rules, and ot=
her
> +#   related python objects.
> +#
> +#   All checker logic must operate on that typed model, and not on the=
 raw
> +#   YAML dictionaries.
> +#
> +# - Minimize external dependencies: this tool is also intended to be r=
un
> +#   from distribution kernel-package scripts in the future.
> +#
> +# Script exit codes:
> +#
> +#   os.EX_CONFIG          passed kernel .config does not match rules
> +#   os.EX_NOINPUT         input file(s) could not be opened
> +#   os.EX_DATAERR         YAML/schema/rule data is malformed
> +#   os.EX_UNAVAILABLE     Python version or dependency is unavailable
> +#
> +
> +from __future__ import annotations
> +
> +import argparse
> +import os
> +import re
> +import sys
> +import textwrap
> +
> +from dataclasses import dataclass
> +from enum import Enum, auto
> +from pathlib import Path
> +from typing import Any, NoReturn, Optional
> +
> +#
> +# Initial sanity checks:
> +#
> +
> +def error(message: str, code: int) -> NoReturn:
> +    print(f'Error: {message}', file=3Dsys.stderr)
> +    sys.exit(code)
> +
> +if sys.version_info < (3, 9):
> +    error('Python 3.9 or later is required', os.EX_UNAVAILABLE)
> +
> +try:
> +    import jsonschema               # type: ignore
> +    import yaml as yaml_m           # type: ignore
> +except ModuleNotFoundError as e:
> +    error(f'Missing Python module: {e.name}', os.EX_UNAVAILABLE)
> +
> +#
> +# Actual script:
> +#
> +
> +class KernelConfig:
> +    """.config file parser"""
> +
> +    def __init__(self, file: Path):
> +        try:
> +            self.lines =3D file.read_text().splitlines()
> +        except OSError as e:
> +            error(f'Could not open {file}: {e.strerror}', os.EX_NOINPU=
T)
> +
> +        self.symbols =3D self._parse_symbols()
> +
> +    def _parse_symbols(self) -> dict[str, str]:
> +        """Extract CONFIG_* symbol assignments from .config"""
> +        symbol_set =3D re.compile(r'^(CONFIG_[A-Za-z0-9_]+)=3D([ym])$'=
)
> +        symbol_unset =3D re.compile(r'^# (CONFIG_[A-Za-z0-9_]+) is not=
 set$')

What does this do for Kconfig's int, hex, and string options?

- Julian Braha

--------------XEeck90arMImjdiitW9iXW07--

--------------wygbcu0eB30HJ7r218T0kJHN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGnQUDAAAAAAAKCRDElYPCBXNxILlL
AQChbcKlonSXUa3TJuKdVVP0T/VTxOqGsEjOelartYR2RgEAyBM2bZtsfxLzLDLge3f2Jazt2mRu
u+hzj/qSZNHDuQ0=
=BT3m
-----END PGP SIGNATURE-----

--------------wygbcu0eB30HJ7r218T0kJHN--
