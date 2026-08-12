Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9805F37E5C1;
	Wed, 12 Aug 2026 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565590; cv=none; b=PQmJR28xluwRCMn67ctUSHmk2yB560gLnv+b80hjESpNQ7YvcsaZ0/qsD7XK7COSlj8LUAestgDYfrVzpNkoi3KwVjOdaLFPdLrIuAJfav2W+Z0ViJrdIhB2LB8I0/TE6aqwgp/CtPp1dWOCVaCUa0lxxc1/UjhPKegbd4sWFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565590; c=relaxed/simple;
	bh=6NdDMFLentXnTQOpu2XWrwBrFeC5qZKdOMOuRuYtDpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXHZpTx5k7omGDSTBsuO4pzrvW+n7yviyCZV4hoNQCmaFIfyxXFu+gSpPCQqaT4rpDjD12mYyCgly1IYNtgXls/i8cntSveAhSvqiuY2lS0JgHpqBnM/8FGUdH1dhGwZj+M1TI4ZPvUnBb3db4JExRT0ba15bBVvPW4MDLzwJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klSEWWMr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klSEWWMr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CBD1F000E9;
	Wed, 12 Aug 2026 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786565589;
	bh=NKW0iRSMyOD+zI86XV4yBEPRahbHRvr5vCmYdAMKT9w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=klSEWWMrzPvSWC8oakRfsvyvcYVwsl5x88WxSMsUFl3S3V3R3HdTZpOBaODHhfMy5
	 2tA3wvFLOGkay+8YA6vVPjivIIoCkKkRx4UzOZ/D3yWOShPImTYn6uUEVWelJbgsnc
	 sICCaVzCGN1O94eKexiT3Btoa5TvpBmkSmvMrHYbVWWFo8gm1trCLtZXkVkl59XXHO
	 HH6c1sfeqMLLiCbnbBAIcmMoxzxSc1Af0vIWXELi4fDw613JeW1+lWlvAMrlSiT9Mu
	 xqRwmadHR5OcKKXDXVU8OfsimoPVdVadMh5WTTJWoQbPII0fgl8grDCq9e2Ohr7wgc
	 8xkkMcepR7/Jg==
Date: Wed, 12 Aug 2026 22:13:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] docs: kdoc: add GNU Make detection
Message-ID: <20260812221303.4a5855bd@foz.lan>
In-Reply-To: <20260812182327.53694-2-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
	<20260812182327.53694-2-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 02:23:18 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> The Sphinx dependency checker and build wrapper need to select a GNU
> Make executable that meets the minimum supported version. Keep the version
> parsing and command selection in a common module so both tools use
> identical behavior.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  tools/lib/python/kdoc/gmake_detect.py | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 tools/lib/python/kdoc/gmake_detect.py
> 
> diff --git a/tools/lib/python/kdoc/gmake_detect.py b/tools/lib/python/kdoc/gmake_detect.py
> new file mode 100644
> index 000000000..5c0a28bc7
> --- /dev/null
> +++ b/tools/lib/python/kdoc/gmake_detect.py
> @@ -0,0 +1,62 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2026 Chen Miao <chenmiao.ku@gmail.com>
> +
> +"""Detect a supported GNU Make executable."""
> +
> +import re
> +import shutil
> +import subprocess
> +import sys
> +
> +from kdoc.python_version import PythonVersion

Did you test it? since python_version is at the same directory,
I would expect it to be:

	from python_version import PythonVersion

> +
> +
> +MIN_GMAKE_VERSION = PythonVersion("4.0").version
> +
> +
> +def get_gmake_version(cmd):
> +    """Return the GNU Make version for *cmd*, or ``None`` otherwise."""
> +    if not cmd:
> +        return None
> +
> +    kwargs = {}
> +    if sys.version_info < (3, 7):
> +        kwargs["universal_newlines"] = True
> +    else:
> +        kwargs["text"] = True
> +
> +    try:
> +        result = subprocess.run(
> +            [cmd, "--version"],
> +            stdout=subprocess.PIPE,
> +            stderr=subprocess.PIPE,
> +            check=True,
> +            **kwargs,
> +        )
> +    except (OSError, subprocess.CalledProcessError):
> +        return None
> +
> +    match = re.search(
> +        r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULTILINE
> +    )
> +    if not match:
> +        return None
> +
> +    return PythonVersion.parse_version(match.group(1))
> +
> +
> +def find_gmake(make=None):
> +    """Return the first GNU Make 4.0+ from MAKE, gmake, or make."""
> +    candidates = (
> +        make,
> +        shutil.which("gmake"),
> +        shutil.which("make"),
> +    )
> +
> +    for cmd in candidates:
> +        version = get_gmake_version(cmd)
> +        if version and version >= MIN_GMAKE_VERSION:
> +            return cmd
> +
> +    return None



Thanks,
Mauro
