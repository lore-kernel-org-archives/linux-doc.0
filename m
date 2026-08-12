Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A931717D;
	Wed, 12 Aug 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566196; cv=none; b=RSxDQCFib4wb8AE6pJZMWO4+BXDEcG5Ihfga6nKOdCpjCCzyuG4KCA2+XDeQ9VnEpyqFTARMQxzhTUQ+BjJDPp0tXUBLro22bl9WM0jQd8nJmSXDXr8/mef/IBzVWnr0IPfs1tgJlVDqAPdSFuISOpN318XyU0c2i92SdLKmk0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566196; c=relaxed/simple;
	bh=t6OYTLLGkelHZh66eWPp+jWqpKrjdiuLeMIDObeuLRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFdyuFTylGPrzs9DUYxqNyZK0rPkpQIDqleieJY+QIGBGxfK3nGsSnO10elHMf0ocU1IVS9g7EzdNZheBBQIUekR85AN4VAESt8gZLzZ7CMU4IUHsk6QLRqoCGqdVLZAmCQMEYawJiPA5J5Cp3FRLfMkqQowKn07Uh39AQrooXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhd3BSBr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhd3BSBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5376F1F00A3A;
	Wed, 12 Aug 2026 20:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786566194;
	bh=xUA/pvbYktEDl/FOgyjxuhy2ZwrYIAMWZyj/dw69fcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vhd3BSBr56rdUkIP2Vam5bbjNHnSwgFRvu2GsFj+xmic8esAx2aaQnEFzzHlclOE3
	 jIx/fxjdTt6l1PkLtIOq2m8uckQCr1DWJ/k162I6gz1PMigAAS0zJRCXQtMVFa/ffa
	 Mu9Z30XPOHHrr0SaCAtkTt5SRrdzN3pKHh96S6VAKGLO9Qjq3I/EdKN0LOtQJ0QSVY
	 0ILoNM4gn99RCdPYjX4TbPQq1+H+xuVwt564mh+ZrfI5rvWFIOmGMNJNzWqUuSsRss
	 T4JOrPythGlVAbChWetTavmlV6I8B746WtGvSGC9SlHqdub5eiMeSsWDhyp7HkeVNC
	 wNo5tmrj78bHg==
Date: Wed, 12 Aug 2026 22:23:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] docs: sphinx-build-wrapper: prefer gmake
Message-ID: <20260812222309.19b39299@foz.lan>
In-Reply-To: <20260812182327.53694-5-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
	<20260812182327.53694-5-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 02:23:21 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> wrapper invokes make directly when generating Info and Rust
> documentation. This can make the dependency check succeed while those
> documentation targets still use an incompatible make implementation.
> 
> Honor MAKE when it names a compatible GNU Make. Otherwise check gmake and
> then make, selecting the first GNU Make 4.0 or newer. Use the common kdoc
> detector to keep this selection consistent with sphinx-pre-install.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  tools/docs/sphinx-build-wrapper | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index 1bb962202..15c7e0938 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -63,6 +63,7 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
>  sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
>  
>  from kdoc.python_version import PythonVersion
> +from kdoc.gmake_detect import find_gmake
>  from kdoc.latex_fonts import LatexFontChecker
>  from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
>  
> @@ -97,6 +98,14 @@ class SphinxBuilder:
>      with the Kernel.
>      """
>  
> +    def get_make(self):
> +        """Select the first GNU Make 4.0 or newer in preference order."""
> +        make = find_gmake(self.env.get("MAKE"))
> +        if make:
> +            return make
> +
> +        sys.exit("GNU Make 4.0 or newer is required")
> +
>      def get_path(self, path, use_cwd=False, abs_path=False):
>          """
>          Ancillary routine to handle patches the right way, as shell does.
> @@ -569,9 +578,10 @@ class SphinxBuilder:
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
> @@ -787,12 +797,11 @@ class SphinxBuilder:
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

Did you test bulding documentation with CONFIG_RUST=y?

AFAIKT, building rust docs only work with LLVM, as GCC doesn't build
Rust code yet(*). When the time comes and gcc starts supporting it,
the code would likely need to check for gcc version as well.

(*) There is an experimental Rust support on gcc under development.
    No idea about its current status. According with:

	https://docs.kernel.org/rust/quick-start.html

    "GCC also works for some configurations, but it is 
     very experimental".

Thanks,
Mauro
