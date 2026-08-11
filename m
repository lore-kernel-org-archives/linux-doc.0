Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432CB2ECEB9;
	Tue, 11 Aug 2026 04:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786423880; cv=none; b=beftJzw1xRe/cf2vrgeOn7k687gI6yJsSbXJHPHE/Z5IYq0SJh4PIWzB5FHt2TyN1Bp+gGVVCgBL3mONLgRvjViz3Za+d7d0MS7j7sGi085vZWp8rrhIQXjefCew8ZTfVV9Mo3Ubfbrpy7b6nNhQjiYFKgSGHVpl7Fsa8R/b/mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786423880; c=relaxed/simple;
	bh=SB2Pnvs8qXIE/+amsrAsXCg6KSsNNUeI99L2rg+++DI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgmKXlwgUxfpJwAg1LFEHJTEc2CfwhNTuoWEXf8+3za/ZpfhPd8GrnUJlPk4KmX8GXFvuFsIz/T7Y3l0ovGzy6BayKyTMEQLj6IjnPhjImbX1VQHsDnPEIs6pMlXcf/a8FNk/ceo3sZbXgF9ZfjvqLGqsH7c6GAfA0M0433NqUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTqIFkuR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTqIFkuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50861F000E9;
	Tue, 11 Aug 2026 04:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786423878;
	bh=uK0ehIF6KvIHZIFihfw4DvOTWT/I4w10kDdjpsvEpYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LTqIFkuRbRBy4RRkCVw/O0D/kxlV9EnuD94k3QGPrtTOBXK04MYFG2CTP5paw7AYV
	 fZ5HRRNMU5ydXDLHiSGrgA3PxEI2a3vlvEo49wgbKioJNw/iIV+jZdVfW+YiPSJeMF
	 fNbULYFdLnDTfpoApUBBIyWuqc5oKpbjM+RB/cFgvllYCbRpCqhj5zHDLl//iG1TVY
	 sqGPRF4Dgppu8/0NtIo4SpUbvdlm0ULPGbU2zl9JxxXbeK+SGNuUs8OyFDlNTE1AGQ
	 37JBz0BLvgMLwA0JBcZ9ILiGXtzJn1vRG3nl9aZvFLdLANBJMFNoQ1/OQsNc3EPKtX
	 vzBY1/xFQQmvQ==
Date: Tue, 11 Aug 2026 06:51:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] docs: sphinx-build-wrapper: prefer gmake
Message-ID: <20260811065113.78e304c7@foz.lan>
In-Reply-To: <20260810143311.57775-4-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
	<20260810143311.57775-4-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 22:33:07 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> wrapper invokes make directly when generating Info and Rust
> documentation. This can make the dependency check succeed while those
> documentation targets still use an incompatible make implementation.
> 
> Honor MAKE when it names a compatible GNU Make. Otherwise check gmake
> and then make, selecting the first GNU Make 4.0 or newer. This keeps the
> wrapper's selection consistent with sphinx-pre-install.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  tools/docs/sphinx-build-wrapper | 55 ++++++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index 1bb962202..aa6a297db 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -71,6 +71,7 @@ from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
>  #
>  VENV_DEFAULT = "sphinx_latest"
>  MIN_PYTHON_VERSION = PythonVersion("3.7").version
> +MIN_MAKE_VERSION = PythonVersion("4.0").version
>  PAPER = ["", "a4", "letter"]
>  
>  TARGETS = {
> @@ -97,6 +98,46 @@ class SphinxBuilder:
>      with the Kernel.
>      """
>  
> +    @staticmethod
> +    def get_make_version(cmd):
> +        """Return the GNU Make version, or None for another make."""
> +        if not cmd:
> +            return None
> +
> +        try:
> +            result = subprocess.run(
> +                [cmd, "--version"],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.PIPE,
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
> +    def get_make(self):
> +        """Select the first GNU Make 4.0 or newer in preference order."""
> +        candidates = [
> +            self.env.get("MAKE"),
> +            shutil.which("gmake"),
> +            shutil.which("make"),
> +        ]
> +
> +        for cmd in candidates:
> +            version = self.get_make_version(cmd)
> +            if version and version >= MIN_MAKE_VERSION:
> +                return cmd
> +
> +        sys.exit("GNU Make 4.0 or newer is required")
> +

As the code here seems to be duplicated, please add it on a library
to be used by both scripts, as this makes easier to maintain it.

The doc tools libraries are located under tools/lib/python/kdoc.

Both scripts are already prepared to use it. For instance:

	from kdoc.python_version import PythonVersion

PythonVersion belongs to a common library.

As make is unrelated, please create something like:

	tools/lib/python/kdoc/gmake_detect.py

adding the code there, and then use from/import to pick the
needed class or method.

Regards,
Mauro


>      def get_path(self, path, use_cwd=False, abs_path=False):
>          """
>          Ancillary routine to handle patches the right way, as shell does.
> @@ -569,9 +610,10 @@ class SphinxBuilder:
>          texinfo directory.
>          """
>  
> +        make = self.get_make()
>          for output_dir in output_dirs:
>              try:
> -                subprocess.run(["make", "info"], cwd=output_dir, check=True)
> +                subprocess.run([make, "info"], cwd=output_dir, check=True)
>              except subprocess.CalledProcessError as e:
>                  sys.exit(f"Error generating info docs: {e}")
>  
> @@ -787,12 +829,11 @@ class SphinxBuilder:
>  
>          if rustdoc and target in ["htmldocs", "epubdocs"]:
>              print("Building rust docs")
> -            if "MAKE" in self.env:
> -                cmd = [self.env["MAKE"]]
> -            else:
> -                cmd = ["make", "LLVM=1"]
> -
> -            cmd += [ "rustdoc"]
> +            make = self.get_make()
> +            cmd = [make]
> +            if make != self.env.get("MAKE"):
> +                cmd.append("LLVM=1")
> +            cmd.append("rustdoc")
>              if self.verbose:
>                  print(" ".join(cmd))
>  



Thanks,
Mauro
