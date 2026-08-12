Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883BF2BCF46;
	Wed, 12 Aug 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565841; cv=none; b=KK5ufJcTRg+WOmImQV+h+XyAKyOgj2OIE4IELXWnvMZajPs7WPjDpUhgzD4ZBUWcIvxc2g+JGaXCeg86RDuWI+yGUkwd2ZkDtTANyaouyTlvsmDbQcgEJGjmXYajU2v4+LZFRRo2+taaEuDGutq0IOgE1ykUjacyZASoY4sZ5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565841; c=relaxed/simple;
	bh=w+AFdUt/iPI3omfNhjBiCzKh8HyTEhhowKgvoDQ5CQc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fewYKOiaQnfcKlIJ6lRYMqNcnhCEKDQoKihtYTs8lRksh24YV5WUZcyGgXpYHIvKIkzubrN6W4kFew7GsPK9G0Kxf8pzt9welt4uS1kBSZAAsHGw9ncl7/+NEXI9+r4gKJCG6FvxUXhybLKXrLtgn9uOGlTBFvD3ShFcSsRWEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWjOePrz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWjOePrz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA211F000E9;
	Wed, 12 Aug 2026 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786565840;
	bh=iS+wesjo7vp2W/27eHZkgDA7kX1rQYnn10bqMEnMm+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RWjOePrz1MVnCBjwYN6heBHlu6AIG7j7/hcpFdUSZCVtt4NwsrnxvSotimfE8wmYZ
	 LIJOn6fe+GA/FQvd5fyYLa3VtEohBn5hJ0vsyRgNRgdUr2lb7Ob2pG2A3frIKQXL/Q
	 dRe8prxdizefFxiK+LoEBEmF3BsD6KYVRHykIwBhM8IN4kaz6fEENR1IGBtvY6xnS5
	 f+LKGusmIf0J+H3tudtcUwanhzymgCXDwGDGdp/+BLC8oJjziX4vciz0R9CDdmqya6
	 s1Kk3UtFa3swPlAgc7QpvHSSEK9DvY5hM5SXNR4Fwg4+WuCMpCj/SyoXfiHhkzj1XM
	 FUmU0bp68MZvA==
Date: Wed, 12 Aug 2026 22:17:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] docs: sphinx-pre-install: check GNU Make version
Message-ID: <20260812221715.41f9c365@foz.lan>
In-Reply-To: <20260812182327.53694-4-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
	<20260812182327.53694-4-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 02:23:20 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> The kernel documentation build requires GNU Make 4.0 or newer, but the
> Sphinx dependency checker only verifies that a make executable exists. This
> lets incompatible make implementations pass the check and fail later during
> the build.
> 
> Check the GNU Make version on all supported systems. Prefer a compatible
> gmake command, which is how Homebrew provides GNU Make on macOS, and fall
> back to make. Use the common kdoc detector so the dependency checker and
> build wrapper apply the same selection logic. Document the requirement and
> the macOS gmake invocation.

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org> # For sphinx-pre-install

> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  Documentation/doc-guide/sphinx.rst |  4 +++-
>  tools/docs/sphinx-pre-install      | 10 +++++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
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
> index 1956f1369..7625ac5a4 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -37,6 +37,7 @@ import os.path
>  src_dir = os.path.dirname(os.path.realpath(__file__))
>  sys.path.insert(0, os.path.join(src_dir, '../lib/python'))
>  from kdoc.python_version import PythonVersion
> +from kdoc.gmake_detect import find_gmake
>  
>  RECOMMENDED_VERSION = PythonVersion("3.4.3").version
>  MIN_PYTHON_VERSION = PythonVersion("3.7").version
> @@ -308,6 +309,13 @@ class MissingCheckers(AncillaryMethods):
>  
>          return None
>  
> +    def check_make(self):
> +        """Check for GNU Make 4.0 or newer."""
> +        if find_gmake(os.environ.get("MAKE")):
> +            return
> +
> +        self.deps.add_package("make", DepManager.SYSTEM_MANDATORY)
> +
>      def check_perl_module(self, prog, dtype):
>          """
>          Does perl have a dependency? Is it available?
> @@ -1559,7 +1567,7 @@ class SphinxDependencyChecker(MissingCheckers):
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
