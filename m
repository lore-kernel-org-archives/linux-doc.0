Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CED8223DE7;
	Sun,  9 Aug 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281751; cv=none; b=crEGqfc9pngMcvzmSGhZ4hqIA2uR3Pyjp25VCHFn+3VqxtnGfteCVd9yXxKn0MPk7RCZZv1RjMd3+3szoVkjdZceVhsmRLW/Y7r8//6hhmb717E8Mm8lAU5CF2sL+ge4EOe8mFTI4kk4hkgeMGPBlZ1UaDht/msOHDD7FBkZ0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281751; c=relaxed/simple;
	bh=fTiaqSHafzq+FoM3WNHGks/IjQrJTg2BmixXnYnUPh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y99++bRZNwLMfNYNmF2b3/vXz65w2AbnWZ9O+LTCTtJ7svG+m78H+Zrlryus3NNY9zfuBMRN9nBRo/Ji1WKFxt1W34L0KkK5et7uMpoSQyw9dnvxtE7Dmj33H6x8IK/p4wWExfVwBM95RBTdMNSajwHGVnkXlVVFuID1WpWsMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAB3_zXvfnhqcQOjAA--.18261S2;
	Sun, 09 Aug 2026 21:21:51 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAH8cbsfnhqlcgeAQ--.23822S2;
	Sun, 09 Aug 2026 21:21:49 +0800 (CST)
Message-ID: <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
Date: Sun, 9 Aug 2026 21:21:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew
 support
To: Weijie Yuan <wy@wyuan.org>, Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, mchehab@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
 <20260809101923.13176-2-chenmiao.ku@gmail.com> <anh6axawbEiF37WD@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <anh6axawbEiF37WD@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAB3_zXvfnhqcQOjAA--.18261S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3XFy3Ww1fXF13Kr1kZrW7CFg_yoWfAr45pa
	yrK3WIq3Z7Xw18Arn2qa9FvF1Fkrs7CrW5Xr1Dtry2kFn5Jr97tryag34YgF97ZrsrKa4Y
	vrW0qFZ3Gay5ZrJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUYVMNUUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/9/26 9:02 PM, Weijie Yuan wrote:
> Hi Miao,
>
> On Sun, Aug 09, 2026 at 06:19:20PM +0800, Chen Miao wrote:
>> The dependency checker currently reports an unknown distribution on macOS
>> and cannot provide installation hints.
>>
>> Detect macOS and include its product version in the status output. Use
>> Homebrew for formula dependencies and install MacTeX as a cask without
>> sudo. Keep PyYAML in the virtual environment requirements because
>> Homebrew does not provide a PyYAML formula.
>>
>> Document the macOS setup and the --no-pdf option.
>>
>> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
>> ---
>>   Documentation/doc-guide/sphinx.rst            |  7 ++
>>   .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
>>   Documentation/translations/zh_CN/how-to.rst   |  6 ++
>>   tools/docs/sphinx-pre-install                 | 89 ++++++++++++++++++-
>>   4 files changed, 106 insertions(+), 1 deletion(-)
> [...]
>> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
>> index 9ec2384e1..e8c91d81a 100644
>> --- a/Documentation/translations/zh_CN/how-to.rst
>> +++ b/Documentation/translations/zh_CN/how-to.rst
>> @@ -102,6 +102,12 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
>>   开头的命令。**请注意**，最新版本 Sphinx 的文档编译速度有极大提升，强烈建议
>>   您通过 pip/pypi 安装最新版本 Sphinx。
>>   
>> +如果您使用 macOS，脚本会使用 Homebrew 输出安装命令，Homebrew 命令不需要
>> +sudo。PDF 构建所需的 MacTeX 通过 Homebrew cask 安装；如果只构建 HTML 文档，
>> +可以执行 ``./tools/docs/sphinx-pre-install --no-pdf``。macOS 用户建议使用默认
>> +的 Python 虚拟环境，因为 PyYAML 会从 ``Documentation/sphinx/requirements.txt``
>> +安装，而不是通过 Homebrew 安装。
> My question is perhaps quite stupid. (I'm not familiar with this part)
>
> How can you make "git clone xxx/linux.git" done on your mac? I've tried
> this before, but it seems that there's some format issue? macOS's
> default APFS is case-insensitive.., so I guess you did some extra
> settings? (like 'git clone --sparse' or 'git clone --filter=blob:none'?)
> But my intuition and experience tell me that it won't be convenient ;-)
For Mac OSX, you need to first establish a Case-sensitive APFS Volume, 
and in this volume you can execute thse commands.
>
> If so, an additional description for macOS users might be more
> user-friendly, I guess? Since the how-to file aims to lower the
> threshold of the process of translation. (While I don't know how many
> macOS users are potential contributors.)
I don't prefer to add many description about "how to start kernel 
development on Mac OS X". Some key parts should be enough.
>
> And another thing is that zh_CN would prefer splitting zh_CN
> translations apart from the original English one in your patch. Because
> there's a script to monitor the translation status.
> (Better confirm this with zh_CN maintainers)

This is a good suggestion. However, many minor changes of documentation 
contains EN and zh_CN in the same patch :(


For the script, l will comment in another email.

>
> Thanks.
>
>
> I haven't read this script carefully. Please feel free to ignore my
> incorrect comments below.
>
>> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
>> index 965c9b093..51a296cc7 100755
>> --- a/tools/docs/sphinx-pre-install
>> +++ b/tools/docs/sphinx-pre-install
>> @@ -518,6 +518,24 @@ class MissingCheckers(AncillaryMethods):
>>           a decent coverage.
>>           """
>>   
>> +        if sys.platform == "darwin":
>> +            sw_vers = self.which("sw_vers")
>> +            if sw_vers:
>> +                try:
>> +                    result = self.run(
>> +                        [sw_vers, "-productVersion"],
>> +                        capture_output=True,
>> +                        text=True,
>> +                        check=True,
>> +                    )
>> +                    version = result.stdout.strip()
>> +                    if version:
>> +                        return f"macOS {version}"
>> +                except (subprocess.CalledProcessError, FileNotFoundError):
>> +                    pass
>> +
>> +            return "macOS"
>> +
>>           system_release = ""
>>   
>>           if self.which("lsb_release"):
>> @@ -716,6 +734,69 @@ class SphinxDependencyChecker(MissingCheckers):
>>   
>>           return self.get_install_progs(progs, "apt-get install")
>>   
>> +    def give_macos_hints(self):
>> +        """
>> +        Provide package installation hints for macOS using Homebrew.
>> +
>> +        Homebrew formulae and casks must not be installed with sudo. MacTeX
>> +        is a cask, while the other dependencies are formulae.
>> +        """
>> +        if not self.which("brew"):
> Homebrew seems to be treated as a build dependency here, rather than as
> the package manager used to provide installation hints.
>
> If all actual documentation dependencies are already installed on a
> macOS system without Homebrew, this adds Homebrew as SYSTEM_MANDATORY,
> increments self.deps.need, and eventually makes the script exit with
> Can't build as 1 mandatory dependency is missing, even though the
> documentation can actually be built.
>
> Could we first check whether there are any missing dependencies and only
> complain about a missing brew when an installation hint is actually
> needed? I don't think Homebrew itself should be added to self.deps.
>
>> +            if not self.distro_msg:
>> +                self.deps.add_package("Homebrew", DepManager.SYSTEM_MANDATORY)
>> +                self.deps.check_missing({})
>> +                self.deps.warn_install()
>> +                self.distro_msg = \
>> +                    "Homebrew is required for macOS support. Install it from " \
>> +                    "https://brew.sh/ and re-run this script."
>> +            return None
>> +
>> +        progs = {
>> +            "Pod::Usage":    "perl",
>> +            "convert":       "imagemagick",
>> +            "dot":           "graphviz",
>> +            "ensurepip":     "python",
>> +            "python-sphinx": "sphinx-doc",
>> +            "rsvg-convert":   "librsvg",
>> +            "xelatex":        "mactex",
>> +            "latexmk":        "mactex",
> Nit & Non-blocking:
>
> Btw, would 'mactex-no-gui' be a better fit here?
>
> The documentation build only needs the TeX command-line tools, while the
> regular mactex cask also installs the GUI applications (I forget whether
> GUI is big or not, but I guess <1GB). mactex-no-gui still provides the
> full TeX Live distribution, so it may avoid installing software that is
> not needed for kernel documentation builds.
>
> Not a blocker.
>
>> +        }
>> +
>> +        install = self.deps.check_missing(progs)
>> +
>> +        if self.verbose_warn_install:
>> +            self.deps.warn_install()
>> +
>> +        if not install:
>> +            return None
>> +
>> +        formulae = set()
>> +        casks = set()
>> +        for prog in self.deps.missing:
>> +            if prog == "yaml":
>> +                self.distro_msg = \
>> +                    "PyYAML is not provided as a Homebrew formula. Use the " \
>> +                    "default virtualenv mode so it is installed from " \
>> +                    "Documentation/sphinx/requirements.txt."
>> +                continue
>> +
>> +            package = progs.get(prog, prog)
>> +            if package == "mactex":
>> +                casks.add(package)
>> +            else:
>> +                formulae.add(package)
>> +
>> +        commands = []
>> +        if formulae:
>> +            commands.append("\tbrew install " + " ".join(sorted(formulae)))
>> +        if casks:
>> +            commands.append("\tbrew install --cask " + " ".join(sorted(casks)))
> One more thing about the MacTeX hint: after installing the mactex cask,
> its command-line tools may not become visible in the current shell
> immediately. Homebrew's cask notes say that the terminal needs to be
> restarted, or eval "$(/usr/libexec/path_helper)" (Is it?) should be run.
>
> Otherwise, a user who immediately re-runs sphinx-pre-install after
> following this suggestion may still see xelatex and latexmk reported as
> missing.
>
> Would it make sense to mention this in the macOS installation hint?
>
>> +
>> +        if not commands:
>> +            return None
>> +
>> +        return "\nYou should run:\n" + "\n".join(commands)
>> +
>>       def give_redhat_hints(self):
>>           """
>>           Provide package installation hints for RedHat-based distros
>> @@ -1138,6 +1219,8 @@ class SphinxDependencyChecker(MissingCheckers):
>>               re.compile("Kali"):                       self.give_debian_hints,
>>               re.compile("Mint"):                       self.give_debian_hints,
>>   
>> +            re.compile("macOS"):                      self.give_macos_hints,
>> +
>>               re.compile("openSUSE"):                   self.give_opensuse_hints,
>>   
>>               re.compile("Mageia"):                     self.give_mageia_hints,
>> @@ -1458,7 +1541,11 @@ class SphinxDependencyChecker(MissingCheckers):
>>           self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
>>           self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
>>   
>> -        self.check_python_module("yaml")
>> +        # PyYAML is installed from Documentation/sphinx/requirements.txt in
>> +        # the virtualenv recommended on macOS. Homebrew does not provide a
>> +        # PyYAML formula, so do not ask for a nonexistent brew package here.
>> +        if not (sys.platform == "darwin" and self.virtualenv and self.need_pip):
>> +            self.check_python_module("yaml")
>>   
>>           if self.pdf:
>>               self.check_program("xelatex", DepManager.PDF_MANDATORY)
> Thanks.

