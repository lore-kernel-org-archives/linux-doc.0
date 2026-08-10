Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3242E8D0;
	Mon, 10 Aug 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786391805; cv=none; b=T36Sg+0RAN4TOdClDm6XJgwmUZKPGjVYn2fQeeFylakdWBJB48HOkxGg29yg8C5W1d/RuilxD2hzZ3YsgAEEdJk5kPWw98zNFCHAXk61qIAvQ6yzQNBV3JCjV2k42w+hKdm5QTix6vGoOGBHoNdwqXo7bBvlgbU9aZjZhHgVRGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786391805; c=relaxed/simple;
	bh=m8T7LHFF8F+dNjeqf+zI5cI5RCQfbIrgvho7NafVjdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHHGYflG8AY2DR1m4pD6l+XxJbNuHNvLulXcAFrRlP8xFDXqn1r2PF0erg+ID8AHRyky6YpvpcX1dQNW+887QmyR7Enz7xPfD7B3wIH2kja5GikTyQfudvzw418XMeOZ59vs/o0LQsXT9geXFi+9WzhrLVPwsApdMTBRzsbXxOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKeTobhw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKeTobhw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EBB1F000E9;
	Mon, 10 Aug 2026 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786391803;
	bh=nEGUhgXJZjXJ8XgW/cGZkWx1uD8WvXugZWJqyT9Ydpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MKeTobhw0yNzSPL0JLk79Qzmsa6c7UYmCKsHOdq/xHHLpwdMvtugi3IMPsCih1crB
	 SB3dkdLSF3qwbjVJoJjs793qZVrx4dgAv9ULdmzTJFtJRLnO+gfZhvhlfj6+aTdBbA
	 0W1jxHpZ7pMPamoBzJFCbkUCO6vXum2WwVuIK4CtiQkVnPY15gCMuHwiXoII8zVtCs
	 +lkt/Hqw67RcVnacbq6fPvsUb2/ZksVGELWjMfjq6EumZ4q/sk2AvSjbOdMYlL6K6X
	 SHOlgI3wKaWpnEeeMvQXEuIKCLr2bhttyCPar1IP0vbKClcJFTIfMzK8bHyLepQtcC
	 5bTlDiPgoHvaA==
Date: Mon, 10 Aug 2026 21:56:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] docs: sphinx-pre-install: add macOS Homebrew
 support
Message-ID: <20260810215251.3a25758a@foz.lan>
In-Reply-To: <20260810143311.57775-2-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
	<20260810143311.57775-2-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 22:33:05 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> The dependency checker currently reports an unknown distribution on
> macOS and cannot provide installation hints.
> 
> Detect macOS and include its product version in the status output. Use
> Homebrew for formula dependencies and install the command-line-only
> MacTeX cask without sudo. Only require Homebrew when dependencies
> actually need to be installed, install the DejaVu and Noto CJK fonts
> needed for PDF output, and explain how to refresh PATH after installing
> MacTeX.
> 
> Keep PyYAML in the virtual environment requirements because Homebrew
> does not provide a PyYAML formula. Document the macOS setup, the
> --no-pdf option, and how to create a case-sensitive APFS volume before
> cloning the kernel tree.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  Documentation/doc-guide/sphinx.rst |  18 +++++
>  tools/docs/sphinx-pre-install      | 113 ++++++++++++++++++++++++++++-
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
> index 51c370260..1e105542a 100644
> --- a/Documentation/doc-guide/sphinx.rst
> +++ b/Documentation/doc-guide/sphinx.rst
> @@ -131,6 +131,24 @@ It supports two optional parameters:
>  ``--no-virtualenv``
>  	Use OS packaging for Sphinx instead of Python virtual environment.
>  
> +macOS uses a case-insensitive APFS volume by default, but the kernel tree
> +contains file names that differ only in case. Before cloning the tree, use
> +``diskutil apfs list`` to find the APFS container identifier, replace
> +``diskX`` below with that identifier, and create an additional case-sensitive
> +volume with::
> +
> +	diskutil apfs addVolume diskX APFSX Linux
> +
> +On macOS, the script uses Homebrew for system dependencies. Homebrew
> +commands are printed without ``sudo``. The PDF toolchain is provided by the
> +``mactex-no-gui`` cask, while the required DejaVu and Noto CJK fonts are
> +installed from Homebrew font casks; use ``--no-pdf`` when only building HTML
> +documentation. After installing MacTeX, restart the terminal or run
> +``eval "$(/usr/libexec/path_helper)"`` so its command-line tools are visible.
> +The default virtualenv mode is recommended on macOS because PyYAML is
> +installed from ``Documentation/sphinx/requirements.txt`` rather than from a
> +Homebrew formula.
> +
>  Installing Sphinx Minimal Version
>  ---------------------------------
>  
> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index 965c9b093..1b9d77ec3 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -518,6 +518,24 @@ class MissingCheckers(AncillaryMethods):
>          a decent coverage.
>          """
>  
> +        if sys.platform == "darwin":
> +            sw_vers = self.which("sw_vers")
> +            if sw_vers:
> +                try:
> +                    result = self.run(
> +                        [sw_vers, "-productVersion"],
> +                        capture_output=True,
> +                        text=True,
> +                        check=True,
> +                    )
> +                    version = result.stdout.strip()
> +                    if version:
> +                        return f"macOS {version}"
> +                except (subprocess.CalledProcessError, FileNotFoundError):
> +                    pass
> +
> +            return "macOS"
> +
>          system_release = ""
>  
>          if self.which("lsb_release"):
> @@ -716,6 +734,93 @@ class SphinxDependencyChecker(MissingCheckers):
>  
>          return self.get_install_progs(progs, "apt-get install")
>  
> +    def give_macos_hints(self):
> +        """Provide package installation hints for macOS using Homebrew."""
> +        progs = {
> +            "Pod::Usage":    "perl",
> +            "convert":       "imagemagick",
> +            "dot":           "graphviz",
> +            "ensurepip":     "python",
> +            "python-sphinx": "sphinx-doc",
> +            "rsvg-convert":   "librsvg",
> +            "xelatex":        "mactex-no-gui",
> +            "latexmk":        "mactex-no-gui",
> +        }
> +
> +        if self.pdf:
> +            font_dirs = [
> +                os.path.expanduser("~/Library/Fonts"),
> +                "/Library/Fonts",
> +                "/System/Library/Fonts",
> +            ]
> +            pdf_fonts = {
> +                "font-dejavu": ["DejaVuSans.ttf"],
> +                "font-noto-sans-cjk": ["NotoSansCJK.ttc"],
> +            }
> +
> +            for package, names in pdf_fonts.items():
> +                files = [
> +                    os.path.join(font_dir, name)
> +                    for font_dir in font_dirs
> +                    for name in names
> +                ]
> +                self.check_missing_file(files, package, DepManager.PDF_MANDATORY)
> +
> +        install = self.deps.check_missing(progs)
> +
> +        if self.verbose_warn_install:
> +            self.deps.warn_install()
> +
> +        if not install:
> +            return None
> +
> +        formulae = set()
> +        casks = set()
> +        notes = []
> +        for package in install.split():
> +            if package == "yaml":
> +                notes.append(
> +                    "PyYAML is not provided as a Homebrew formula. Use the "
> +                    "default virtualenv mode so it is installed from "
> +                    "Documentation/sphinx/requirements.txt."
> +                )
> +                continue
> +
> +            if package == "mactex-no-gui" or package.startswith("font-"):
> +                casks.add(package)
> +            else:
> +                formulae.add(package)
> +
> +        commands = []
> +        if formulae:
> +            commands.append("\tbrew install " + " ".join(sorted(formulae)))
> +        if casks:
> +            commands.append("\tbrew install --cask " + " ".join(sorted(casks)))
> +
> +        if not commands:
> +            self.distro_msg = "\n".join(notes)
> +            return None
> +
> +        if not self.which("brew"):
> +            notes.append(
> +                "Homebrew is needed to install the missing dependencies. "
> +                "Install it from https://brew.sh/ and re-run this script."
> +            )
> +            self.distro_msg = "\n".join(notes)
> +            return None
> +
> +        if "mactex-no-gui" in casks:
> +            notes.append(
> +                "After installing MacTeX, restart the terminal or run:\n"
> +                "\teval \"$(/usr/libexec/path_helper)\"\n"
> +                "before re-running this script."
> +            )
> +
> +        if notes:
> +            self.distro_msg = "\n".join(notes)
> +
> +        return "\nYou should run:\n" + "\n".join(commands)
> +
>      def give_redhat_hints(self):
>          """
>          Provide package installation hints for RedHat-based distros
> @@ -1138,6 +1243,8 @@ class SphinxDependencyChecker(MissingCheckers):
>              re.compile("Kali"):                       self.give_debian_hints,
>              re.compile("Mint"):                       self.give_debian_hints,
>  
> +            re.compile("macOS"):                      self.give_macos_hints,
> +
>              re.compile("openSUSE"):                   self.give_opensuse_hints,
>  
>              re.compile("Mageia"):                     self.give_mageia_hints,
> @@ -1458,7 +1565,11 @@ class SphinxDependencyChecker(MissingCheckers):
>          self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
>          self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
>  
> -        self.check_python_module("yaml")
> +        # PyYAML is installed from Documentation/sphinx/requirements.txt in
> +        # the virtualenv recommended on macOS. Homebrew does not provide a
> +        # PyYAML formula, so do not ask for a nonexistent brew package here.
> +        if not (sys.platform == "darwin" and self.virtualenv and self.need_pip):
> +            self.check_python_module("yaml")

This is not right: yaml is needed even outside venv/pip, as
it is required to build some docs - See Documentation/sphinx/parser_yaml.py
extension.

So, basically:

if python on macOS is *always* shipped with python3-yaml package (or
whatever name it has there), the code would be something like:

	# For whatever weird reason, macOS added a non-builtin module
	# on its python package, so no need to check as yaml is always
	# there.
	if sys.platform != "darwin":
		self.check_python_module("yaml")

Otherwise, this hunk is wrong.

>  
>          if self.pdf:
>              self.check_program("xelatex", DepManager.PDF_MANDATORY)



Thanks,
Mauro
