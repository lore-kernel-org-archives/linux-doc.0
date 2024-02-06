Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8608745CE
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 04:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707194221; cv=none; b=memYZWtKPfMqOQ9QbppFc7VP2q6riz2Rb5+KGPzNrg4YZuJcDv+tUuLWukh7P4i3yx4NWSA+cwjJbDjggcf5x3dAEIYzV7mH68dj4f0D9dL6Kev0snHnM1+G+4AVwgvTkboNtkIMT14sny96UxvW9iTYwg67oFkq977F0JHd7SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707194221; c=relaxed/simple;
	bh=LqbQiN83GREc7uepXUECcVyo4MCKVDwPuCP3ZcjMgtI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwZ2HJA+pR4GW73t0itA0bbTaeA0R6IVcJeQcS6WPxdFlOtt+u3M/jebRIaIu9R81dclDGjmiUqZb2yJfct7dDWNSXPLWXttxn1Ec7ZUL6rqRi3VwI90wu1AMXW6P8G8rWemB65nQM3psjSFvajLkAVc/GirhrAYzRfPDpaOgmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUTLxtC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUTLxtC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602A1C433C7;
	Tue,  6 Feb 2024 04:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707194220;
	bh=LqbQiN83GREc7uepXUECcVyo4MCKVDwPuCP3ZcjMgtI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aUTLxtC5W+f0KP2bqE8Qm0riRGsaC5u+NA0pOLQ91C9Dz1NJ3ecngBi7SZDsIBVKW
	 8lXB8T/67ALVFcLSZ5eObKPhoEwbEMqat/8YqgFFl3z5uwh6zFWSR5K7smg4WGNA7c
	 I7glcsJt2RPsNz5dOoS/Jq0us44rS7DZ7PDshkvfdSa/1VHfGM6qH/mGVvDeG9gPg0
	 pu8w6fKlfouGwPtWV+QhuYnx9oPjbxEszEl+Sl4yy8frvXMTlu+d1cb9D7mRZ8r8XF
	 e3EPS/uSMr8VaSZcZH0INBwYDrPRB1SpwNzf8EJro9dGalNafUlUpVxGQ/3oa48llw
	 3CqpT8m2fxe9w==
Date: Tue, 6 Feb 2024 05:36:56 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/8] doc: kernel_abi.py: convert to sphinx.util.logging
Message-ID: <20240206053656.30941200@coco.lan>
In-Reply-To: <20240205175133.774271-4-vegard.nossum@oracle.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-4-vegard.nossum@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon,  5 Feb 2024 18:51:28 +0100
Vegard Nossum <vegard.nossum@oracle.com> escreveu:

> As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> to 2.4.4"), we can use Sphinx's built-in logging facilities.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  Documentation/sphinx/kernel_abi.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 288f26097569..9eb7282cc941 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -37,16 +37,18 @@ import os
>  import subprocess
>  import sys
>  import re
> -import kernellog
>  
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
>  from docutils.utils.error_reporting import ErrorString
> +from sphinx.util import logging
>  from sphinx.util.docutils import switch_source_input
>  
>  __version__  = '1.0'
>  
> +logger = logging.getLogger(__name__)
> +
>  def setup(app):
>  
>      app.add_directive("kernel-abi", KernelCmd)
> @@ -129,7 +131,7 @@ class KernelCmd(Directive):
>              else:
>                  content.append(line, f, ln)
>  
> -        kernellog.info(self.state.document.settings.env.app, "%s: parsed %i lines" % (fname, n))
> +        logger.info("%s: parsed %i lines", fname, n)
>  
>          if content:
>              self.do_parse(content, node)



Thanks,
Mauro
