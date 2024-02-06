Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84ED12B173
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707209864; cv=none; b=UJKB8wy8WuSe5lmIYF4euA2284dFz6Ph3EynWh5RCf4xVzRi3HrZL8vSibfuGtAkb13W3lesNj8hvvVvETwBoOO/B0zBpX8YuAsyyPo63CcExm9D1qKyG9ygtaWGQDYysFIkSueX9OXxkvGjbQiresfji/921OS/fZp6GGCdxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707209864; c=relaxed/simple;
	bh=CvgISvorx9JO5B5ysnl7t1Elu3J5NPW5l/4tmGWQvEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HlcL0utAm5hE/H90LPwqyQhtQNkHa2758XslHMNV0IQK00SJ5rksanXilPxHLpbmDscTZw5gBcYYKCoPdH9AKU+j5wKvFi4enNyfHLqOLMOlMVmI4tyuFZa5RR3ZlqQAnr5amOaHk900mbtZhx4k/FvIW2cNQu7W7NAymFHYJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYlAP05B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYlAP05B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707209862; x=1738745862;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CvgISvorx9JO5B5ysnl7t1Elu3J5NPW5l/4tmGWQvEU=;
  b=gYlAP05BWaz2PwrLiD+Ut0IJvZ468ZqM+MrdlFngyfQsXQiDJEja1kHW
   XFtYhhE2YA8N41zD7NW065NC5O4VYnvXnZMFQwlKggP+62u9lVU+SSyzk
   W13ZRYsZs+UKfZUPAVCKLp3vteAcRNAClKlIcHZRa5Yv1oEEilNq8VU98
   PXd3uRXP+LaYgTXgaiIJm501DTUAQeCSpy06RZ+cFlS0IYiNWaJ+EhDWd
   jkxB6n6E32fvyOv7WtWp+1ZJQ9tFX3SnrmNTfRp3SLXuC4GBjuG/VEdJN
   9gWnoRNaj4q5fUZW8Rb9u+gLKHbElf0sAcwP8+82OShQoNnsjTM5Jbmx0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="600082"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="600082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 00:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="1245613"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.150])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 00:57:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
In-Reply-To: <20240205175133.774271-7-vegard.nossum@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-7-vegard.nossum@oracle.com>
Date: Tue, 06 Feb 2024 10:57:36 +0200
Message-ID: <87zfwec6m7.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
>
> Gotchas:
> - remove first argument 'app' from all calls
> - instead of (fmt % (args)), use (fmt, args)
> - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)

If you're doing this, why not go directly to f-strings? IMO the above
are inferior to it.

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

For example:

logger.verbose(f"use dot(1) from: {dot_cmd}")

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
>                  "install either Inkscape (https://inkscape.org/) (preferred) or\n"
>                  "ImageMagick (https://www.imagemagick.org)")

These could be converted to use """:

"""Neither inkscape(1) nor convert(1) found.
For SVG to PDF conversion, 
install either Inkscape (https://inkscape.org/) (preferred) or
ImageMagick (https://www.imagemagick.org)"
"""

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

-- 
Jani Nikula, Intel
