Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127B46BF
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954743; cv=none; b=jrYSymLsT0hRml/cgDO4c9HX5UIhbUF5sHxSIRU6JatdpQ+g3m0czi3NXJK+imbqlUnqqa1Idsx+/8WFCw5Qu9aI32TzEOte1DVOzRCtZ1o0wmJtGMnhJpFriKF+PcGoIEQmyygVV/kyYcTrjEpIFUdAUOPeoZzioYFmZUKoFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954743; c=relaxed/simple;
	bh=XTI8QAhFJpLZXd5AVCoHXt62byXuHFK7H8OVCFX+k2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7P+Dv5QCX+pZ38uKSL/pALx4qW/5yYFUKXsVJ5LlGkIOpKqBEvlkyaw0aZGF0UE8aT8Su7dlM6OJaKQ2MpM7kEAMuiz2VHXYQ8PPi6KpU7DyRRxV0rSxZNg+apIcjZXypriqCcNxGQzqkPWJDOD68STx51VD6mzdS3/sRHH4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgqDntyy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgqDntyy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04EFC4CEF8;
	Wed, 12 Nov 2025 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762954743;
	bh=XTI8QAhFJpLZXd5AVCoHXt62byXuHFK7H8OVCFX+k2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgqDntyyTw0ucXG8rCnh+kNR688hTRSagtt6M/cGNkLCQM3mmxywUfMbQ0PrriuFy
	 /rrFcweIDw+vGyo6i+l1S/J4MCjqsV2EiNsjX0nKFaFdumGIPRENHkosED+mPb4Vaf
	 0m5PHldg1NRFTDeu1mGctbPBykzRCchBmlc83OzS8qgKvmT/wkSdl5EPjfg2QmeV1U
	 2USh4ilhvxiU9zfdQKhb/YhleI9gntElPg6niXxFoQemHWqyvLvwCCWR3rsVjxslZx
	 bUSUo/IV0AjweslYIN2Tr2PJg+ixsA3DXsoxMjVAjOrTB7cldBD2/6KZ4AC0yiiihH
	 rhGX1jNNeTjVg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJB3t-00000009TA3-2wMU;
	Wed, 12 Nov 2025 14:39:01 +0100
Date: Wed, 12 Nov 2025 14:39:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 4/4] Documentation: use a source-read extension to
 include the index boilerplate
Message-ID: <qf6t4cbpurcssabychbtxplqv7metgglduu4soqjexfxs6ongy@yryw3bnk44y6>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Nov 12, 2025 at 01:56:54PM +0200, Jani Nikula wrote:
> Reduce boilerplate all over the place by adding a small ad hoc extension
> in conf.py that adds the ../sphinx-includes/subproject-index.rst include
> to all SPHINXDIRS builds.
> 
> Note that the docname is just 'index', because the SPHINXDIRS builds
> happen in the subdirectories.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index b9a43ee32a00..cb0936a71d52 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -589,8 +589,14 @@ kerneldoc_srctree = ".."
>  # ------------------------------------------------------------------------------
>  loadConfig(globals())
>  
> +# Add index link to SPHINXDIRS builds
> +def add_subproject_index(app, docname, source):
> +    if app.builder.tags.has('subproject') and app.builder.tags.has('html'):
> +        if docname == 'index':
> +            source[0] += '\n.. include:: ../sphinx-includes/subproject-index.rst\n'

The relative path there breaks SPINXDIRS, when it is pointing to use a sub-sub-dir
like:

    $ make SPHINXDIRS=userspace-api/media htmldocs

    Traceback
    =========

      File "/usr/lib/python3.14/site-packages/sphinx/util/parallel.py", line 137, in _join_one
        raise SphinxParallelError(*result)
    sphinx.errors.SphinxParallelError: docutils.utils.SystemMessage: Documentation/userspace-api/media/index.rst:69: (SEVERE/4) Problems with "include" directive path:
    InputError: [Errno 2] No such file or directory: 'Documentation/userspace-api/sphinx-includes/subproject-index.rst'.

Thanks,
Mauro
