Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663770823
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 01:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755652115; cv=none; b=LQMo5ZJJaK+r/4Vmriat7L9nhOM5ne7jL+mX95SmPnlm/I8iP43l9pCWBZd4winaFbeHkOJao/xjjtl2yLh6If0J9shv/mke4S2L6IX54av3HS99CtLuEdYTiCKfPWFIyzzQvg1rTVpOtbbM5S2bpK8NlPQVpLZfMic5RU1/rUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755652115; c=relaxed/simple;
	bh=HRLMyCfwAcfssVFrAhwq0eZNBnnyMKG2jnRy1VCNxvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShE8dopYR+Sx8+F/MGbWClXbu+fUG03uy1Dc7dkrrGlc7prDoJFpcdVsQdna1Qi6X1lwEhOHlAXtxWhiSz/2eyaXrB6i2PqBhsf3Mtg+2E8+ewa8sGtAuiVySpsPeHjIq/QlKy7jQgghD5LUIVaK8YJB0Q0GRzPHd4fn/k77iNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lw4b8WF+; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lw4b8WF+"
Date: Tue, 19 Aug 2025 21:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755652108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4RqJtTe0TJJz0GUaQNuT4YcjFhsas7L86jF7z2f/wA=;
	b=Lw4b8WF+PZPA/xL/n28/7YyJDcmmXzdnShIza5PkuhI2u8fDJtwahd0n8G9WbYXHVtCxPY
	Kc/H3eXFlbeTAaLckRlrCBo6Y2BKQqWWVs9QIdUwktbknjeEPg7YCSfG9Ly976iIgWAUub
	+PhZA7IWOqqzlrawstR5vCfwUViHzdo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux bcachefs <linux-bcachefs@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: bcachefs: Add explicit title for idle
 work design doc
Message-ID: <p7ocizi2jg36uvk64yy5mv5bzg3dyrvnosz5mhj5j373tzr7iz@txx5juyvhwzf>
References: <20250820002218.11547-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820002218.11547-1-bagasdotme@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Aug 20, 2025 at 07:22:18AM +0700, Bagas Sanjaya wrote:
> Commit 9e260e4590e044 ("docs: bcachefs: idle work scheduling design doc")
> adds design doc (desiderata) for idle work scheduling, but missed
> explicit title, causing its two section headings to be toctree entries
> instead.
> 
> Add the title.
> 
> Fixes: 9e260e4590e0 ("docs: bcachefs: idle work scheduling design doc")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/filesystems/bcachefs/future/idle_work.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
> index 59a332509dcd97..30f2844c3d9e5e 100644
> --- a/Documentation/filesystems/bcachefs/future/idle_work.rst
> +++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
> @@ -1,4 +1,5 @@
> -Idle/background work classes design doc:
> +Idle/background work classes desiderata

.....
what's going on with that spelling?

> +=======================================
>  
>  Right now, our behaviour at idle isn't ideal, it was designed for servers that
>  would be under sustained load, to keep pending work at a "medium" level, to
> 
> base-commit: 37c52167b007d9d0bb8c5ed53dd6efc4969a1356
> -- 
> An old man doll... just what I always wanted! - Clara
> 
