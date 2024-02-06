Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CE1E492
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707195027; cv=none; b=tKMGsLcnLkhPIA+erOiEJkzmsPuqXgqdFE6pRvHJpJr7JDSIg8mvGWVtAEG3WZhm3/EhruN3OrOPJq3LfaDJ7FWD8ivC1cePHmO25CPM9/2E2Zr/mhwa/tJnI6RZoGu0WQzk49laHuDZVMpPLSRu7bxZMCyCbPQJCml2zy0iaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707195027; c=relaxed/simple;
	bh=o/pkgylquEmd14VCV13uF53e/2/qpxqfDlVgUyKa4Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeAgh+v+29EnFD2yVUoLO3PWZvgCR5yNdAR+sFA6LmjECauMXyTwVA4VdiLFPVXkj3MVekFIL4Kg4OCa/HdLi3Qk67UvMf+CUqmWlPAaGJTNO6g/F/bM0z1nfAso9Xu86D+CIMO9Thf8g1CGRLbN/IGeBzZrmfrPQm/0kXZRkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKWYh5qS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKWYh5qS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AA8C433F1;
	Tue,  6 Feb 2024 04:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707195027;
	bh=o/pkgylquEmd14VCV13uF53e/2/qpxqfDlVgUyKa4Wc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DKWYh5qSbohd8QiDm4uXMBScufUdmhEhWUu9VtCfS7HIOfUjeNsV+OcJOs4ojlJSf
	 ekMCScW9v/PQEC03XIm4qe+dQ/NPLD511B3urUY56gaH+YvLxQocF4b8VfmjK5WtFK
	 zWf8qSz+tT2oenZU+qbJbF9GM76N7Ok6FdFTj4MNSmfsZ1TU0wpeuM+pxerP8Swt6F
	 BNW9ym897nDsymsA5UpqdWYF0X0I/Syd3KD/FQ2tSaET0lEL3irKGkQtFKHtXbYbOi
	 TUOd6ZvVUvOs5ppE742GxFDixKp3RevWt0lFeCVpwaAwI0GSGZ/Zi/Cboekv8wzrTa
	 KZMi18aEVV4kg==
Date: Tue, 6 Feb 2024 05:50:23 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 7/8] doc: remove kernellog.py
Message-ID: <20240206055023.7cf76b00@coco.lan>
In-Reply-To: <20240205175133.774271-8-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-8-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:32 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> With the last kernellog users gone, we can remove this compatibility
> layer.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  Documentation/sphinx/kernellog.py | 22 ----------------------
>  1 file changed, 22 deletions(-)
>  delete mode 100644 Documentation/sphinx/kernellog.py
> 
> diff --git a/Documentation/sphinx/kernellog.py b/Documentation/sphinx/kernellog.py
> deleted file mode 100644
> index 0bc00c138cad..000000000000
> --- a/Documentation/sphinx/kernellog.py
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Sphinx has deprecated its older logging interface, but the replacement
> -# only goes back to 1.6.  So here's a wrapper layer to keep around for
> -# as long as we support 1.4.
> -#
> -# We don't support 1.4 anymore, but we'll keep the wrappers around until
> -# we change all the code to not use them anymore :)
> -#
> -import sphinx
> -from sphinx.util import logging
> -
> -logger = logging.getLogger('kerneldoc')
> -
> -def warn(app, message):
> -    logger.warning(message)
> -
> -def verbose(app, message):
> -    logger.verbose(message)
> -
> -def info(app, message):
> -    logger.info(message)



Thanks,
Mauro
