Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF75D2877C3;
	Tue, 11 Aug 2026 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786423436; cv=none; b=MmX4V5HinsKxG8bJ5DaZt/zA5KjHIG1szjGP2DLKfp6tqzd8EMRBZhLsR2kyjPgCCrhZY1cdAutSGAcfZMmUYEcOacuRETwIzWnkc7aTKQEG7F28R2QIQXKWdfmFsLEn55NCKIJ5fDcRF1e2VVIW6MMRsAmYKInUSmQ6BmmYQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786423436; c=relaxed/simple;
	bh=5jlRPu6n8HB6k9B2+gyEqMgiedyyPqM/pikCz7ptrXY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+pxGT6rPgBVtff5RvySNtbtwM+A39x1E+QDzKgY6PXLp5fsKurmIJaTCSG2Qe1LlfFXcUiNjM5H3mB0cZrRIOmgk2pbaIkMpVmKeeAuYIiLdgSbb2Be+A7KYdo2ok38jsVJw2qXo35OZcIcr2cOssaQV4d4MeFt4Nwc7MhNgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbQiLPqj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbQiLPqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6921F000E9;
	Tue, 11 Aug 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786423435;
	bh=RuAUPDpRyXyRfsFNNfKozWXmuHm9YAR4rPwanBUu8fk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IbQiLPqjxb0gQNw+GK6dYYRB1DjEHDnEx0yFfQYtoR9OviopzawCWWW/EoNXyV7fr
	 C7kH1Te86UzJ295m3ZOHaxxRMgulKlVakHziOIjruvtOWX4yMmffGlZLlrKuUTMz7O
	 LIz2CjSh1fBDmFCMmtnWEHgKZ97fa1YNdx4e+mAPk4nFcIkI5Q7J6ebEjobZTFqhXi
	 ODZfkCJ4iJuf8HK9WufjFkvWR3K0BdVcK7apoH/DsnAq3r8OHZkbaYVeIVO53LyWm3
	 T6Uc/+NSfjoyyYrzBdqBIDrAxjIudfqBGJ2YUPIXNQsBD/iTifCE7pp5Vg/iIBnoHw
	 wmzwrl894hoIQ==
Date: Tue, 11 Aug 2026 06:43:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] docs: sphinx-pre-install: check GNU Make version
Message-ID: <20260811064349.33ba1934@foz.lan>
In-Reply-To: <20260810143311.57775-3-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
	<20260810143311.57775-3-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 22:33:06 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> The kernel documentation build requires GNU Make 4.0 or newer, but the
> Sphinx dependency checker only verifies that a make executable exists.
> This lets incompatible make implementations pass the check and fail
> later during the build.
> 
> Check the GNU Make version on all supported systems. Prefer a compatible
> gmake command, which is how Homebrew provides GNU Make on macOS, and
> fall back to make. Document the requirement and the macOS gmake
> invocation.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/doc-guide/sphinx.rst |  4 ++-
>  tools/docs/sphinx-pre-install      | 41 +++++++++++++++++++++++++++++-
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
> index 1e105542a..4fb716e77 100644
> --- a/Documentation/doc-guide/sphinx.rst
> +++ b/Documentation/doc-guide/sphinx.rst
> @@ -147,7 +147,9 @@ documentation. After installing MacTeX, restart the terminal or run
>  ``eval "$(/usr/libexec/path_helper)"`` so its command-line tools are visible.
>  The default virtualenv mode is recommended on macOS because PyYAML is
>  installed from ``Documentation/sphinx/requirements.txt`` rather than from a
> -Homebrew formula.
> +Homebrew formula. The script also checks for GNU Make 4.0 or newer; when
> +Homebrew provides it as ``gmake``, use ``gmake htmldocs`` instead of
> +``make htmldocs``.
>  
>  Installing Sphinx Minimal Version
>  ---------------------------------
> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index 1b9d77ec3..54f36c3b8 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -40,6 +40,7 @@ from kdoc.python_version import PythonVersion
>  
>  RECOMMENDED_VERSION = PythonVersion("3.4.3").version
>  MIN_PYTHON_VERSION = PythonVersion("3.7").version
> +MIN_MAKE_VERSION = PythonVersion("4.0").version
>  
>  
>  class DepManager:
> @@ -308,6 +309,44 @@ class MissingCheckers(AncillaryMethods):
>  
>          return None
>  
> +    def get_make_version(self, cmd):
> +        """Get the GNU Make version, or None if cmd is not GNU Make."""
> +        if not cmd:
> +            return None
> +
> +        try:
> +            result = self.run(
> +                [cmd, "--version"],
> +                capture_output=True,
> +                text=True,
> +                check=True,
> +            )
> +        except (OSError, subprocess.CalledProcessError):
> +            return None
> +
> +        match = re.search(
> +            r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULTILINE
> +        )
> +        if not match:
> +            return None
> +
> +        return PythonVersion.parse_version(match.group(1))
> +
> +    def check_make(self):
> +        """Check for GNU Make 4.0 or newer."""
> +        candidates = (
> +            os.environ.get("MAKE"),
> +            self.which("gmake"),
> +            self.which("make"),
> +        )
> +
> +        for make in candidates:
> +            version = self.get_make_version(make)
> +            if version and version >= MIN_MAKE_VERSION:
> +                return
> +
> +        self.deps.add_package("make", DepManager.SYSTEM_MANDATORY)
> +
>      def check_perl_module(self, prog, dtype):
>          """
>          Does perl have a dependency? Is it available?
> @@ -1559,7 +1598,7 @@ class SphinxDependencyChecker(MissingCheckers):
>          # Check for needed programs/tools
>          self.check_perl_module("Pod::Usage", DepManager.SYSTEM_MANDATORY)
>  
> -        self.check_program("make", DepManager.SYSTEM_MANDATORY)
> +        self.check_make()
>          self.check_program("which", DepManager.SYSTEM_MANDATORY)
>  
>          self.check_program("dot", DepManager.SYSTEM_OPTIONAL)



Thanks,
Mauro
