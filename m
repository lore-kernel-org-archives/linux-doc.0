Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B61745CE
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707194607; cv=none; b=PN6ze4V4grT/1zeimw6MNy915YhRfoY4UoGnAK8QtXIT+ySyW4MhHSY2vs7wGkR+7lzv2dxDQdQIL9tvTObyJkv+9nuKyuF2T978diUmfl1u7L++hgBbSV9eY7ApcdT/blLR0mSJq4JoHDSrr9dzuL3NrR8qRgrOl2079eAVFFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707194607; c=relaxed/simple;
	bh=pcLvCuLDPTT+Z4NepKS1LMMnKMnH+8uaI5itcO8q+M0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WttpABnxX4cWCvu4wuacyV7IJCF55EfVTaI4bwHkPrj+iM4ZtBZixQgT85ClJU3u+blwLfD0Nr1fvhyecp5h+hRgKR/lbgMJdTu8pElkpcnVxYvvl+L9ttoT3N4YlqKvClqcNml5m5Z5lXi9phkRQXbyLEGeSEmq4YVuXhFnoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDXraYJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDXraYJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A826C433C7;
	Tue,  6 Feb 2024 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707194606;
	bh=pcLvCuLDPTT+Z4NepKS1LMMnKMnH+8uaI5itcO8q+M0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PDXraYJBLEU8n9Dbkf3L6zowUaEPYkoUmqsFZtxDHYux2447dsxI+OwNPytGpNIdL
	 yoK2NhGp7vBqwujjW95UJ+BTBcs9IdnnpwpNhNdvfMApWsUHZ9SM7BZ/QwMxy14h9d
	 S+8DeicxF7rV5MPg+Omio67pj/YYels4kwQKFzeKokyEkIJDaIsZezu5u7qs7A6vE5
	 lOYR+QjiLhhHPZ6WrnFOjC5lySx48ILJUyJBRmeEH6ZUNAmW1TqeIHMGMZCYbSRxiR
	 K3Cst6oAOuGEBE7SqKtb5ZTdzBpTx8c4qdhgArdLhWxCAia9thWPrw9NpIdjDFGp2m
	 LL2hK+Q/3Wl7w==
Date: Tue, 6 Feb 2024 05:43:22 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/8] doc: kerneldoc.py: convert to sphinx.util.logging
Message-ID: <20240206054322.45cde082@coco.lan>
In-Reply-To: <20240205175133.774271-6-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-6-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:30 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  Documentation/sphinx/kerneldoc.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 7acf09963daa..c74a3e417cea 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -38,11 +38,13 @@ from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
>  import sphinx
> +from sphinx.util import logging
>  from sphinx.util.docutils import switch_source_input
> -import kernellog
>  
>  __version__  = '1.0'
>  
> +logger = logging.getLogger(__name__)
> +
>  class KernelDocDirective(Directive):
>      """Extract kernel-doc comments from the specified file"""
>      required_argument = 1
> @@ -109,8 +111,7 @@ class KernelDocDirective(Directive):
>          cmd += [filename]
>  
>          try:
> -            kernellog.verbose(env.app,
> -                              'calling kernel-doc \'%s\'' % (" ".join(cmd)))
> +            logger.verbose('calling kernel-doc \'%s\'', " ".join(cmd))
>  
>              p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>              out, err = p.communicate()
> @@ -120,8 +121,7 @@ class KernelDocDirective(Directive):
>              if p.returncode != 0:
>                  sys.stderr.write(err)
>  
> -                kernellog.warn(env.app,
> -                               'kernel-doc \'%s\' failed with return code %d' % (" ".join(cmd), p.returncode))
> +                logger.warning('kernel-doc \'%s\' failed with return code %d', " ".join(cmd), p.returncode)
>                  return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
>              elif env.config.kerneldoc_verbosity > 0:
>                  sys.stderr.write(err)
> @@ -148,8 +148,8 @@ class KernelDocDirective(Directive):
>              return node.children
>  
>          except Exception as e:  # pylint: disable=W0703
> -            kernellog.warn(env.app, 'kernel-doc \'%s\' processing failed with: %s' %
> -                           (" ".join(cmd), str(e)))
> +            logger.warning('kernel-doc \'%s\' processing failed with: %s',
> +                           " ".join(cmd), str(e))
>              return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
>  
>      def do_parse(self, result, node):



Thanks,
Mauro
