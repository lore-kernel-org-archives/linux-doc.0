Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC24E1BF
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3Ft4HYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704915232; x=1736451232;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=BYjsGmQcoB8hzhO35HF0fxGjntFWr6CsvLUwuBankog=;
  b=n3Ft4HYcAJTni+zBLkLYR8BFLEoPKlqebAbzqsQ2oqH65Wee9qt4uPNl
   6ybFhdlQLq5JycFGjkcyYyP4nunggqMd6HCSZ3ntYz4uqav2W22ndl8cE
   SGvp3dJoXJ8T5rZhmHW0Y0Bd8ia4JHa8R1UD26aIG6AqO3OSZ5SFOas3i
   BqbelB5K7pSLN+vR4udDnkwShymDaaTucubf9iKd1TzKC2jcOgBfF3Qwy
   +X0pc+8Xe26O24Nvckt36PWvvE9HBpQfuC8weL89suGeHlOs1dpgKpjw8
   YqToNYszXOAEumrzZl78l9Va7CBdQDap6jsGQHT6CHMh7C7O8vi9PFg7K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5991674"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5991674"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 11:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24061265"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.36.240])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 11:33:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] docs: kernel_feat.py: fix command injection
In-Reply-To: <20240110174758.3680506-1-vegard.nossum@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240110174758.3680506-1-vegard.nossum@oracle.com>
Date: Wed, 10 Jan 2024 21:33:46 +0200
Message-ID: <87jzohugo5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 10 Jan 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> The kernel-feat directive passes its argument straight to the shell.
> This is unfortunate and unnecessary.
>
> Let's always use paths relative to $srctree/Documentation/ and use
> subprocess.check_call() instead of subprocess.Popen(shell=True).
>
> This also makes the code shorter.
>
> This is analogous to commit 3231dd586277 ("docs: kernel_abi.py: fix
> command injection") where we did exactly the same thing for
> kernel_abi.py, somehow I completely missed this one.
>
> Link: https://fosstodon.org/@jani/111676532203641247
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Good stuff, thanks for doing this.

> diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
> index b5fa2f0542a5..b9df61eb4501 100644
> --- a/Documentation/sphinx/kernel_feat.py
> +++ b/Documentation/sphinx/kernel_feat.py
> @@ -37,8 +37,6 @@ import re
>  import subprocess
>  import sys
>  
> -from os import path
> -
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
> @@ -76,33 +74,26 @@ class KernelFeat(Directive):
>          self.state.document.settings.env.app.warn(message, prefix="")
>  
>      def run(self):
> -
>          doc = self.state.document
>          if not doc.settings.file_insertion_enabled:
>              raise self.warning("docutils: file insertion disabled")
>  
>          env = doc.settings.env
> -        cwd = path.dirname(doc.current_source)
> -        cmd = "get_feat.pl rest --enable-fname --dir "
> -        cmd += self.arguments[0]
> -
> -        if len(self.arguments) > 1:
> -            cmd += " --arch " + self.arguments[1]
>  
> -        srctree = path.abspath(os.environ["srctree"])
> +        srctree = os.path.abspath(os.environ["srctree"])

As a follow-up, please replace the srctree environment variable with

        srctree = os.path.join(env.srcdir, '..')

or something like that. env.srcdir points at the Documentation
directory.

Ditto for the kernel_abi.py extension.

> -        fname = cmd
> +        args = [
> +            os.path.join(srctree, 'scripts/get_feat.pl'),
> +            'rest',
> +            '--enable-fname',
> +            '--dir',
> +            os.path.join(srctree, 'Documentation', self.arguments[0]),
> +        ]
>  
> -        # extend PATH with $(srctree)/scripts
> -        path_env = os.pathsep.join([
> -            srctree + os.sep + "scripts",
> -            os.environ["PATH"]
> -        ])
> -        shell_env = os.environ.copy()
> -        shell_env["PATH"]    = path_env
> -        shell_env["srctree"] = srctree
> +        if len(self.arguments) > 1:
> +            args.extend(['--arch', self.arguments[1]])
>  
> -        lines = self.runCmd(cmd, shell=True, cwd=cwd, env=shell_env)
> +        lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')

Another nice cleanup might be to always run the tools in the top level
directory instead of changing the cwd. Like, we don't change he working
directory for the compiler either.

BR,
Jani.

>  
>          line_regex = re.compile(r"^\.\. FILE (\S+)$")
>  
> @@ -121,30 +112,6 @@ class KernelFeat(Directive):
>          nodeList = self.nestedParse(out_lines, fname)
>          return nodeList
>  
> -    def runCmd(self, cmd, **kwargs):
> -        u"""Run command ``cmd`` and return its stdout as unicode."""
> -
> -        try:
> -            proc = subprocess.Popen(
> -                cmd
> -                , stdout = subprocess.PIPE
> -                , stderr = subprocess.PIPE
> -                , **kwargs
> -            )
> -            out, err = proc.communicate()
> -
> -            out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
> -
> -            if proc.returncode != 0:
> -                raise self.severe(
> -                    u"command '%s' failed with return code %d"
> -                    % (cmd, proc.returncode)
> -                )
> -        except OSError as exc:
> -            raise self.severe(u"problems with '%s' directive: %s."
> -                              % (self.name, ErrorString(exc)))
> -        return out
> -
>      def nestedParse(self, lines, fname):
>          content = ViewList()
>          node    = nodes.section()

-- 
Jani Nikula, Intel
