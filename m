Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019361DED40
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786280579; cv=none; b=mSRRLtpSCoUFs9x1xLtlTI8yVexJ3J0gGFEx/YtM6WKNOlFxiaTmYSfqZ938XtKrkVvw1RH6SbQKMmLVa8PTeCSu/9vxTppggQLtN4sfFwspznoIbJ4ENBUEttFgbV66csg0vnqowlh1+IKSkGP5lzER8Gy4kP34FX1KK9OUuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786280579; c=relaxed/simple;
	bh=VbOWkKCnEOP8BgxsLq/D/yUUKl57K2iHpiBk27sA1GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d26H+EayuUDEMphvZStzh0H2JAiFVfGBR0g+lBV/Pc7RMSnptRIXWsisxP/vHXPGvIpOFL67JFWCq+I0gIQyRSHIQAhVpEhIGfzXsXmgvGmbl1OB+iWhCM1LF31OXyXUbuNQpPz3We5LpgV/y4U62XIMPWh0gqSqYIUtERY6JJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=b/xjkd30; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="b/xjkd30"
Date: Sun, 9 Aug 2026 21:02:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1786280574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xSBuQsnKG4YIE0x/zQhxjWjq0O8hJgyYuqOIQDxfL4E=;
	b=b/xjkd30UAU9l34vhg+0GrzgDESLwkGekwQCtI/SKW8GBlVetUcjk4RJUftXHRkFnwy+ZK
	DrekZO0BhPdAnyN1hZoNBs8LdsgrIULjpRDLAy8wOzUYncQvC8sm/w/Rsp+tNy6NgKOrpK
	ajQhtvmiZrMi+HDgfQb0AIBv6L57QJWyzByB8w+qMLCA4grg5X1MEWIBgy1J5cLHNUbdfP
	EOhinC7pSrONWIK/8IS5vqqaVY3YdaisZneNjhhMj+VkdjwplVSjQ1kwf1UPRQXzid7abs
	KQAPS33bpdF+voufSld6j1W4UmxWTJytZ42pPhtNsRBbZb+7AtrHeMKsQu9Oxw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew
 support
Message-ID: <anh6axawbEiF37WD@wyuan.org>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
 <20260809101923.13176-2-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260809101923.13176-2-chenmiao.ku@gmail.com>
X-Migadu-Flow: FLOW_OUT

Hi Miao,

On Sun, Aug 09, 2026 at 06:19:20PM +0800, Chen Miao wrote:
> The dependency checker currently reports an unknown distribution on macOS
> and cannot provide installation hints.
> 
> Detect macOS and include its product version in the status output. Use
> Homebrew for formula dependencies and install MacTeX as a cask without
> sudo. Keep PyYAML in the virtual environment requirements because
> Homebrew does not provide a PyYAML formula.
> 
> Document the macOS setup and the --no-pdf option.
> 
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  Documentation/doc-guide/sphinx.rst            |  7 ++
>  .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
>  Documentation/translations/zh_CN/how-to.rst   |  6 ++
>  tools/docs/sphinx-pre-install                 | 89 ++++++++++++++++++-
>  4 files changed, 106 insertions(+), 1 deletion(-)
[...]
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> index 9ec2384e1..e8c91d81a 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -102,6 +102,12 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
>  开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
>  您通过 pip/pypi 安装最新版本 Sphinx。
>  
> +如果您使用 macOS，脚本会使用 Homebrew 输出安装命令，Homebrew 命令不需要
> +sudo。PDF 构建所需的 MacTeX 通过 Homebrew cask 安装；如果只构建 HTML 文档，
> +可以执行 ``./tools/docs/sphinx-pre-install --no-pdf``。macOS 用户建议使用默认
> +的 Python 虚拟环境，因为 PyYAML 会从 ``Documentation/sphinx/requirements.txt``
> +安装，而不是通过 Homebrew 安装。

My question is perhaps quite stupid. (I'm not familiar with this part)

How can you make "git clone xxx/linux.git" done on your mac? I've tried
this before, but it seems that there's some format issue? macOS's
default APFS is case-insensitive.., so I guess you did some extra
settings? (like 'git clone --sparse' or 'git clone --filter=blob:none'?)
But my intuition and experience tell me that it won't be convenient ;-)

If so, an additional description for macOS users might be more
user-friendly, I guess? Since the how-to file aims to lower the
threshold of the process of translation. (While I don't know how many
macOS users are potential contributors.)

And another thing is that zh_CN would prefer splitting zh_CN
translations apart from the original English one in your patch. Because
there's a script to monitor the translation status.
(Better confirm this with zh_CN maintainers)

Thanks.


I haven't read this script carefully. Please feel free to ignore my
incorrect comments below.

> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index 965c9b093..51a296cc7 100755
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
> @@ -716,6 +734,69 @@ class SphinxDependencyChecker(MissingCheckers):
>  
>          return self.get_install_progs(progs, "apt-get install")
>  
> +    def give_macos_hints(self):
> +        """
> +        Provide package installation hints for macOS using Homebrew.
> +
> +        Homebrew formulae and casks must not be installed with sudo. MacTeX
> +        is a cask, while the other dependencies are formulae.
> +        """
> +        if not self.which("brew"):

Homebrew seems to be treated as a build dependency here, rather than as
the package manager used to provide installation hints.

If all actual documentation dependencies are already installed on a
macOS system without Homebrew, this adds Homebrew as SYSTEM_MANDATORY,
increments self.deps.need, and eventually makes the script exit with
Can't build as 1 mandatory dependency is missing, even though the
documentation can actually be built.

Could we first check whether there are any missing dependencies and only
complain about a missing brew when an installation hint is actually
needed? I don't think Homebrew itself should be added to self.deps.

> +            if not self.distro_msg:
> +                self.deps.add_package("Homebrew", DepManager.SYSTEM_MANDATORY)
> +                self.deps.check_missing({})
> +                self.deps.warn_install()
> +                self.distro_msg = \
> +                    "Homebrew is required for macOS support. Install it from " \
> +                    "https://brew.sh/ and re-run this script."
> +            return None
> +
> +        progs = {
> +            "Pod::Usage":    "perl",
> +            "convert":       "imagemagick",
> +            "dot":           "graphviz",
> +            "ensurepip":     "python",
> +            "python-sphinx": "sphinx-doc",
> +            "rsvg-convert":   "librsvg",
> +            "xelatex":        "mactex",
> +            "latexmk":        "mactex",

Nit & Non-blocking:

Btw, would 'mactex-no-gui' be a better fit here?

The documentation build only needs the TeX command-line tools, while the
regular mactex cask also installs the GUI applications (I forget whether
GUI is big or not, but I guess <1GB). mactex-no-gui still provides the
full TeX Live distribution, so it may avoid installing software that is
not needed for kernel documentation builds.

Not a blocker.

> +        }
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
> +        for prog in self.deps.missing:
> +            if prog == "yaml":
> +                self.distro_msg = \
> +                    "PyYAML is not provided as a Homebrew formula. Use the " \
> +                    "default virtualenv mode so it is installed from " \
> +                    "Documentation/sphinx/requirements.txt."
> +                continue
> +
> +            package = progs.get(prog, prog)
> +            if package == "mactex":
> +                casks.add(package)
> +            else:
> +                formulae.add(package)
> +
> +        commands = []
> +        if formulae:
> +            commands.append("\tbrew install " + " ".join(sorted(formulae)))
> +        if casks:
> +            commands.append("\tbrew install --cask " + " ".join(sorted(casks)))

One more thing about the MacTeX hint: after installing the mactex cask,
its command-line tools may not become visible in the current shell
immediately. Homebrew's cask notes say that the terminal needs to be
restarted, or eval "$(/usr/libexec/path_helper)" (Is it?) should be run.

Otherwise, a user who immediately re-runs sphinx-pre-install after
following this suggestion may still see xelatex and latexmk reported as
missing.

Would it make sense to mention this in the macOS installation hint?

> +
> +        if not commands:
> +            return None
> +
> +        return "\nYou should run:\n" + "\n".join(commands)
> +
>      def give_redhat_hints(self):
>          """
>          Provide package installation hints for RedHat-based distros
> @@ -1138,6 +1219,8 @@ class SphinxDependencyChecker(MissingCheckers):
>              re.compile("Kali"):                       self.give_debian_hints,
>              re.compile("Mint"):                       self.give_debian_hints,
>  
> +            re.compile("macOS"):                      self.give_macos_hints,
> +
>              re.compile("openSUSE"):                   self.give_opensuse_hints,
>  
>              re.compile("Mageia"):                     self.give_mageia_hints,
> @@ -1458,7 +1541,11 @@ class SphinxDependencyChecker(MissingCheckers):
>          self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
>          self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
>  
> -        self.check_python_module("yaml")
> +        # PyYAML is installed from Documentation/sphinx/requirements.txt in
> +        # the virtualenv recommended on macOS. Homebrew does not provide a
> +        # PyYAML formula, so do not ask for a nonexistent brew package here.
> +        if not (sys.platform == "darwin" and self.virtualenv and self.need_pip):
> +            self.check_python_module("yaml")
>  
>          if self.pdf:
>              self.check_program("xelatex", DepManager.PDF_MANDATORY)

Thanks.
