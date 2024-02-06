Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEE7319C
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707194951; cv=none; b=cFfPoVg6AW+C4rboeJ/FArxrGWgYplJ7llwSBGH2vEftL9OhYNURSmY4q6KBVUp8XiGqoyvcBPd56YTAI85G3iIPgfva0c+YJ1fcvFeiZ8TMJNCB3hekIswAFEj9mnYQii4vhGaobIT56N/9cHMRaO9v1q2qDkcNFeuqHxoX/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707194951; c=relaxed/simple;
	bh=awFy240+wEkCn4EoNgtXEQ4fKjMTuYDubToZm1/UaY4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmBwUTCOUV8f3s+ofGNS+U3APZKVuq4ZRLjHuF3mP/Y+yhmdpt5XC69loV364Qb9e1/80OY+DMO8B/CWhuatiISuAJd8zHDpj7hU5FDhot6xjZEhnHwgPiAhjr/MNTTwMGxLYjGjgc83cT5AEhn4/1OzRAJ6GERNO+TjF8YGdbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRKL0Kn0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRKL0Kn0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C142C43390;
	Tue,  6 Feb 2024 04:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707194951;
	bh=awFy240+wEkCn4EoNgtXEQ4fKjMTuYDubToZm1/UaY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mRKL0Kn0IG/x/v1S0glcVhNRsvuzPS6TUFaKYBZUQHUj49PLUNGb09AfD+uGL+ekF
	 Tn+e3iCefmxyxcjRTKx+NZKaUkSucNbWYQPyZO/6syBGTvJPPK77RUgx5XJrvHMTak
	 Bi9Kl9WLJCsPTxdEsKacaN3ILLZ3hv0pV8rIC/xF32f7Q376Hq9kHIlwqTclAwdaWr
	 30G2Nc0vkp4xeAT/uzSd8Z0Hx1ntnPvn5Pk0j3orrfoK6p43WIpjasiTDy/YaFPRfb
	 Pb2nP2lCYBGHLvFa7VikDQHvm7oVbsrLqT0ELB+Eg1hqoVIO5YemNApEvixCk+jRmT
	 fXav6xjTdX0Dg==
Date: Tue, 6 Feb 2024 05:49:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Message-ID: <20240206054907.066a0325@coco.lan>
In-Reply-To: <20240205175133.774271-7-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-7-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:31 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
> 
> Gotchas:
> - remove first argument 'app' from all calls
> - instead of (fmt % (args)), use (fmt, args)
> - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)
> - realign wrapped lines
> 
> I changed the "Neither inkscape(1) nor convert(1) found." message from a
> .verbose() to a .warning(), since that actually affects the output in a
> big way.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/sphinx/kfigure.py | 66 ++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
> index 97166333b727..b58f6458af63 100644
> --- a/Documentation/sphinx/kfigure.py
> +++ b/Documentation/sphinx/kfigure.py
> @@ -58,13 +58,15 @@ from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives
>  from docutils.parsers.rst.directives import images
>  import sphinx
> +from sphinx.util import logging
>  from sphinx.util.nodes import clean_astext
> -import kernellog
>  
>  Figure = images.Figure
>  
>  __version__  = '1.0.0'
>  
> +logger = logging.getLogger(__name__)
> +
>  # simple helper
>  # -------------
>  
> @@ -170,7 +172,7 @@ def setupTools(app):
>      """
>      global dot_cmd, dot_Tpdf, convert_cmd, rsvg_convert_cmd   # pylint: disable=W0603
>      global inkscape_cmd, inkscape_ver_one  # pylint: disable=W0603
> -    kernellog.verbose(app, "kfigure: check installed tools ...")
> +    logger.verbose("kfigure: check installed tools ...")
>  
>      dot_cmd = which('dot')
>      convert_cmd = which('convert')
> @@ -178,7 +180,7 @@ def setupTools(app):
>      inkscape_cmd = which('inkscape')
>  
>      if dot_cmd:
> -        kernellog.verbose(app, "use dot(1) from: " + dot_cmd)
> +        logger.verbose("use dot(1) from: %s", dot_cmd)
>  
>          try:
>              dot_Thelp_list = subprocess.check_output([dot_cmd, '-Thelp'],
> @@ -190,10 +192,10 @@ def setupTools(app):
>          dot_Tpdf_ptn = b'pdf'
>          dot_Tpdf = re.search(dot_Tpdf_ptn, dot_Thelp_list)
>      else:
> -        kernellog.warn(app, "dot(1) not found, for better output quality install "
> +        logger.warning("dot(1) not found, for better output quality install "
>                         "graphviz from https://www.graphviz.org")
>      if inkscape_cmd:
> -        kernellog.verbose(app, "use inkscape(1) from: " + inkscape_cmd)
> +        logger.verbose("use inkscape(1) from: %s", inkscape_cmd)
>          inkscape_ver = subprocess.check_output([inkscape_cmd, '--version'],
>                                                 stderr=subprocess.DEVNULL)
>          ver_one_ptn = b'Inkscape 1'
> @@ -204,26 +206,26 @@ def setupTools(app):
>  
>      else:
>          if convert_cmd:
> -            kernellog.verbose(app, "use convert(1) from: " + convert_cmd)
> +            logger.verbose("use convert(1) from: %s", convert_cmd)
>          else:
> -            kernellog.verbose(app,
> +            logger.warning(
>                  "Neither inkscape(1) nor convert(1) found.\n"
>                  "For SVG to PDF conversion, "

Nitpick:

While you're here, please change the logic to not end likes with a "(",
e. g.:

            logger.warning("Neither inkscape(1) nor convert(1) found.\n"
                           "For SVG to PDF conversion, "
	    ...

Same to other long strings.

With that:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


>                  "install either Inkscape (https://inkscape.org/) (preferred) or\n"
>                  "ImageMagick (https://www.imagemagick.org)")
>  
>          if rsvg_convert_cmd:
> -            kernellog.verbose(app, "use rsvg-convert(1) from: " + rsvg_convert_cmd)
> -            kernellog.verbose(app, "use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
> +            logger.verbose("use rsvg-convert(1) from: %s", rsvg_convert_cmd)
> +            logger.verbose("use 'dot -Tsvg' and rsvg-convert(1) for DOT -> PDF conversion")
>              dot_Tpdf = False
>          else:
> -            kernellog.verbose(app,
> +            logger.verbose(
>                  "rsvg-convert(1) not found.\n"
>                  "  SVG rendering of convert(1) is done by ImageMagick-native renderer.")
>              if dot_Tpdf:
> -                kernellog.verbose(app, "use 'dot -Tpdf' for DOT -> PDF conversion")
> +                logger.verbose("use 'dot -Tpdf' for DOT -> PDF conversion")
>              else:
> -                kernellog.verbose(app, "use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
> +                logger.verbose("use 'dot -Tsvg' and convert(1) for DOT -> PDF conversion")
>  
>  
>  # integrate conversion tools
> @@ -257,13 +259,12 @@ def convert_image(img_node, translator, src_fname=None):
>  
>      # in kernel builds, use 'make SPHINXOPTS=-v' to see verbose messages
>  
> -    kernellog.verbose(app, 'assert best format for: ' + img_node['uri'])
> +    logger.verbose('assert best format for: %s', img_node['uri'])
>  
>      if in_ext == '.dot':
>  
>          if not dot_cmd:
> -            kernellog.verbose(app,
> -                              "dot from graphviz not available / include DOT raw.")
> +            logger.verbose("dot from graphviz not available / include DOT raw.")
>              img_node.replace_self(file2literal(src_fname))
>  
>          elif translator.builder.format == 'latex':
> @@ -290,10 +291,9 @@ def convert_image(img_node, translator, src_fname=None):
>  
>          if translator.builder.format == 'latex':
>              if not inkscape_cmd and convert_cmd is None:
> -                kernellog.warn(app,
> -                                  "no SVG to PDF conversion available / include SVG raw."
> -                                  "\nIncluding large raw SVGs can cause xelatex error."
> -                                  "\nInstall Inkscape (preferred) or ImageMagick.")
> +                logger.warning("no SVG to PDF conversion available / include SVG raw.\n"
> +                               "Including large raw SVGs can cause xelatex error.\n"
> +                               "Install Inkscape (preferred) or ImageMagick.")
>                  img_node.replace_self(file2literal(src_fname))
>              else:
>                  dst_fname = path.join(translator.builder.outdir, fname + '.pdf')
> @@ -306,15 +306,14 @@ def convert_image(img_node, translator, src_fname=None):
>          _name = dst_fname[len(str(translator.builder.outdir)) + 1:]
>  
>          if isNewer(dst_fname, src_fname):
> -            kernellog.verbose(app,
> -                              "convert: {out}/%s already exists and is newer" % _name)
> +            logger.verbose("convert: {out}/%s already exists and is newer" % _name)
>  
>          else:
>              ok = False
>              mkdir(path.dirname(dst_fname))
>  
>              if in_ext == '.dot':
> -                kernellog.verbose(app, 'convert DOT to: {out}/' + _name)
> +                logger.verbose('convert DOT to: {out}/%s', _name)
>                  if translator.builder.format == 'latex' and not dot_Tpdf:
>                      svg_fname = path.join(translator.builder.outdir, fname + '.svg')
>                      ok1 = dot2format(app, src_fname, svg_fname)
> @@ -325,7 +324,7 @@ def convert_image(img_node, translator, src_fname=None):
>                      ok = dot2format(app, src_fname, dst_fname)
>  
>              elif in_ext == '.svg':
> -                kernellog.verbose(app, 'convert SVG to: {out}/' + _name)
> +                logger.verbose('convert SVG to: {out}/%s', _name)
>                  ok = svg2pdf(app, src_fname, dst_fname)
>  
>              if not ok:
> @@ -354,8 +353,7 @@ def dot2format(app, dot_fname, out_fname):
>      with open(out_fname, "w") as out:
>          exit_code = subprocess.call(cmd, stdout = out)
>          if exit_code != 0:
> -            kernellog.warn(app,
> -                          "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
> +            logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
>      return bool(exit_code == 0)
>  
>  def svg2pdf(app, svg_fname, pdf_fname):
> @@ -388,13 +386,13 @@ def svg2pdf(app, svg_fname, pdf_fname):
>          pass
>  
>      if exit_code != 0:
> -        kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
> +        logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
>          if warning_msg:
> -            kernellog.warn(app, "Warning msg from %s: %s"
> -                           % (cmd_name, str(warning_msg, 'utf-8')))
> +            logger.warning("Warning msg from %s: %s",
> +                           cmd_name, str(warning_msg, 'utf-8'))
>      elif warning_msg:
> -        kernellog.verbose(app, "Warning msg from %s (likely harmless):\n%s"
> -                          % (cmd_name, str(warning_msg, 'utf-8')))
> +        logger.warning("Warning msg from %s (likely harmless):\n%s",
> +                       cmd_name, str(warning_msg, 'utf-8'))
>  
>      return bool(exit_code == 0)
>  
> @@ -418,7 +416,7 @@ def svg2pdf_by_rsvg(app, svg_fname, pdf_fname):
>          # use stdout and stderr from parent
>          exit_code = subprocess.call(cmd)
>          if exit_code != 0:
> -            kernellog.warn(app, "Error #%d when calling: %s" % (exit_code, " ".join(cmd)))
> +            logger.warning("Error #%d when calling: %s", exit_code, " ".join(cmd))
>          ok = bool(exit_code == 0)
>  
>      return ok
> @@ -513,15 +511,15 @@ def visit_kernel_render(self, node):
>      app = self.builder.app
>      srclang = node.get('srclang')
>  
> -    kernellog.verbose(app, 'visit kernel-render node lang: "%s"' % (srclang))
> +    logger.verbose('visit kernel-render node lang: "%s"', srclang)
>  
>      tmp_ext = RENDER_MARKUP_EXT.get(srclang, None)
>      if tmp_ext is None:
> -        kernellog.warn(app, 'kernel-render: "%s" unknown / include raw.' % (srclang))
> +        logger.warning('kernel-render: "%s" unknown / include raw.', srclang)
>          return
>  
>      if not dot_cmd and tmp_ext == '.dot':
> -        kernellog.verbose(app, "dot from graphviz not available / include raw.")
> +        logger.verbose("dot from graphviz not available / include raw.")
>          return
>  
>      literal_block = node[0]



Thanks,
Mauro
