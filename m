Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD8481FDE;
	Fri,  6 Mar 2026 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833195; cv=none; b=LvtexzU1FTV7WXB7ar01JWP7CuRXh90ScLJKO4mMSwuTC/tyTpQR11s4W81+xD/Ogg9XBRT3wCVDtjJSu4rHbfUDjlI1f2P48Pp5spGh+Iv7CT1PZU9p4oFpigwvZW5eDNTjQuV3/rLhd/LknmpotkBwiiaMyXWHKbSqG4jBPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833195; c=relaxed/simple;
	bh=pdg/OVspk9quk6tR/WJarQBTdIJxulfnGNMD8iiGXlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezct9+pSuJ96Gh3F5sTr6xMmcoI/fAm9Z/QzOdRxZ8yZfo18EtRvP+e82tE5IrwsL4gME2oNlX7c8vJVmp38FAiMmXtGHNdpiikwNZpOShCoAibCZMwIvA9mpD4ZF1nq7ebsoSur+vZnBNrEbu0pbK1xSdtGEIp6IcnO/+ajU58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jbokxscn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jbokxscn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qSKNngXNZbzRm/wMCvyL5Yxa47tZEL5B8GJZkFddzWY=; b=jbokxscna4Y9Qv0Vwq0feqzjKV
	W7epUDYVvz4BsqjnoeDZ3YPQ08leIamzJ4KgHtESBiaUOvaFo6oAjg/dWOXWTkuh1Smdd53Y185A7
	oC1zbZOnUZC4V2yxjSTvgsH7J5fikmgVzYkKmGSg+wHwaL6OUTA1Mn6v0TX2ciNoCAm3VKRbdqwvs
	cz4nOBXRQwNjBTHRCdJccLeqfOaf5uilub4d21kyszNbuqpNZT2eeIAfBT3CL6FbX9q7r3aCiwAE8
	V52ahZoSJ7bWiu1J8cI/MsrZ+oaL6ZGZpk5xzkjop47dr+o4IGQCws8egS7S2mIpn2NQpPmTwJeaW
	p3XqWeeA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyctd-00000004XeY-1EC8;
	Fri, 06 Mar 2026 21:39:45 +0000
Message-ID: <808ada08-22f1-4d17-8d93-6c64c771b02f@infradead.org>
Date: Fri, 6 Mar 2026 13:39:44 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/gpu: fix spelling mistakes in todo.rst
To: Mikael Rothig <mrrothig@gmail.com>, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260306205754.65746-1-mrrothig@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260306205754.65746-1-mrrothig@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/6/26 12:57 PM, Mikael Rothig wrote:
> Signed-off-by: Mikael Rothig <mrrothig@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

However:
a. There is no patch description in the email body.
   (see "The canonical patch format" in Documentation/process/submitting-patches.rst)
b. I would Cc: the appropriate maintainers as listed in the
   MAINTAINERS file:
   M:	David Airlie <airlied@gmail.com>
   M:	Simona Vetter <simona@ffwll.ch>

Thanks.

> ---
>  Documentation/gpu/todo.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 520da44a04a6..686a94bead07 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -269,7 +269,7 @@ Various hold-ups:
>    valid formats for atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
> -  version of the varios drm_gem_fb_create functions. Maybe called
> +  version of the various drm_gem_fb_create functions. Maybe called
>    drm_gem_fb_create/_with_dirty/_with_funcs as needed.
>  
>  Contact: Simona Vetter
> @@ -294,7 +294,7 @@ everything after it has done the write-protect/mkwrite trickery:
>  
>        vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
>  
> -- Set the mkwrite and fsync callbacks with similar implementions to the core
> +- Set the mkwrite and fsync callbacks with similar implementations to the core
>    fbdev defio stuff. These should all work on plain ptes, they don't actually
>    require a struct page.  uff. These should all work on plain ptes, they don't
>    actually require a struct page.
> @@ -882,7 +882,7 @@ Querying errors from drm_syncobj
>  ================================
>  
>  The drm_syncobj container can be used by driver independent code to signal
> -complection of submission.
> +completion of submission.
>  
>  One minor feature still missing is a generic DRM IOCTL to query the error
>  status of binary and timeline drm_syncobj.

-- 
~Randy
