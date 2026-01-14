Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179E346AC6;
	Wed, 14 Jan 2026 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419781; cv=none; b=TBR/VslKbbyxXtNMc+gv7ny59yXVjc1Sxai2gZWRaJH1JjvnRLNxLO5D6cEeP2rmjy7O8hTtHntxirRi8gK/250nP69h3VOOt7sJI3PX+csfvpMPH9Fag7OOV7dfhgQiDjF93XZy4ELxG1tR3PIVnfcRKB3fnvi8dSpYBV/mzDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419781; c=relaxed/simple;
	bh=CawOrzEaMhv0Aa/7fQdY+0jgGgVZ56U3tf+fbQnpMvA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LktsetRuM55k9Unp2GhDztUYcx9j64Nrd3yWtQ0/LTV/leuB+CMFKcaSQHo1w2B+aqPbDhHhLuxeU9rk1GkhPfSHNhNPvymt8nXVlEiPmbxAoIonCllgV/iv0bvhwBcKXqV0Qq/vQmv0dnXEZ0bHuC9n6FT1a5nyd1ahrHX8XpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsZ7C/gb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsZ7C/gb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7171C4CEF7;
	Wed, 14 Jan 2026 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768419780;
	bh=CawOrzEaMhv0Aa/7fQdY+0jgGgVZ56U3tf+fbQnpMvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jsZ7C/gbw7twUlsd3T9MTlbO9Ugrrb0zSoCT+AlzQRvXQPU6voWSQuwRTEd8OGZ7S
	 owGHKGqW3jVWQmnnRYXF6C5VcfI7cR69Zc91UqwNdQjMI/r12vZaeYOBlxkIyVmqnM
	 SvtXP46qtp0lGiI8VLHtYKxQ1PekeVxZb5UzmJdxF+/kCBkwxyXxAOy+6QSA6aBYhi
	 pchqaYDFtzArEUnz09B1WH+XMcgGDtRWrmFf+bSnotBhCp2ltVu/B1oRqDK1+LeYHr
	 d5BLOjt6ap3P6FW4rNeaIyU83+9oUD4fLdl/tCRyPW3gH2pzzq8X+EcNZ2sPD69+hY
	 F/AP5cYzBgw9g==
Date: Wed, 14 Jan 2026 20:42:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] docs: kdoc: remove support for an external
 kernel-doc from sphinx
Message-ID: <20260114204255.0140a59b@foz.lan>
In-Reply-To: <20260114164146.532916-2-corbet@lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<20260114164146.532916-2-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 09:41:43 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> The ability to build the docs with an external kernel-doc program involves
> some truly confusing logic and complicates the task of moving kernel-doc
> out of scripts/.  But this feature is not useful for normal documentation
> builds, and the external kernel-doc can always be run by hand when it needs
> debugging.  So just remove that feature and make life easier.
> 
> There is still a bunch of logic to build a command line that we never use;
> the idea is to be able to output it, but I'm not sure if that is worth
> keeping.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Agreed: it is time to get rid of such support.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/sphinx/kerneldoc.py | 53 ++++---------------------------
>  1 file changed, 6 insertions(+), 47 deletions(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index d8cdf068ef35c..afbab458550a8 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -190,35 +190,7 @@ class KernelDocDirective(Directive):
>  
>          return cmd
>  
> -    def run_cmd(self, cmd):
> -        """
> -        Execute an external kernel-doc command.
> -        """
> -
> -        env = self.state.document.settings.env
> -        node = nodes.section()
> -
> -        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> -        out, err = p.communicate()
> -
> -        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
> -
> -        if p.returncode != 0:
> -            sys.stderr.write(err)
> -
> -            logger.warning("kernel-doc '%s' failed with return code %d"
> -                                % (" ".join(cmd), p.returncode))
> -            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
> -        elif env.config.kerneldoc_verbosity > 0:
> -            sys.stderr.write(err)
> -
> -        filenames = self.parse_args["file_list"]
> -        for filename in filenames:
> -            self.parse_msg(filename, node, out, cmd)
> -
> -        return node.children
> -
> -    def parse_msg(self, filename, node, out, cmd):
> +    def parse_msg(self, filename, node, out):
>          """
>          Handles a kernel-doc output for a given file
>          """
> @@ -244,7 +216,7 @@ class KernelDocDirective(Directive):
>  
>          self.do_parse(result, node)
>  
> -    def run_kdoc(self, cmd, kfiles):
> +    def run_kdoc(self, kfiles):
>          """
>          Execute kernel-doc classes directly instead of running as a separate
>          command.
> @@ -258,23 +230,17 @@ class KernelDocDirective(Directive):
>          filenames = self.parse_args["file_list"]
>  
>          for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
> -            self.parse_msg(filename, node, out, cmd)
> +            self.parse_msg(filename, node, out)
>  
>          return node.children
>  
>      def run(self):
> -        global kfiles
> -
>          cmd = self.handle_args()
>          if self.verbose >= 1:
>              logger.info(cmd_str(cmd))
>  
>          try:
> -            if kfiles:
> -                return self.run_kdoc(cmd, kfiles)
> -            else:
> -                return self.run_cmd(cmd)
> -
> +            return self.run_kdoc(kfiles)
>          except Exception as e:  # pylint: disable=W0703
>              logger.warning("kernel-doc '%s' processing failed with: %s" %
>                             (cmd_str(cmd), pformat(e)))
> @@ -286,15 +252,8 @@ class KernelDocDirective(Directive):
>  
>  def setup_kfiles(app):
>      global kfiles
> -
> -    kerneldoc_bin = app.env.config.kerneldoc_bin
> -
> -    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
> -        print("Using Python kernel-doc")
> -        out_style = RestFormat()
> -        kfiles = KernelFiles(out_style=out_style, logger=logger)
> -    else:
> -        print(f"Using {kerneldoc_bin}")
> +    out_style = RestFormat()
> +    kfiles = KernelFiles(out_style=out_style, logger=logger)
>  
>  
>  def setup(app):



Thanks,
Mauro
