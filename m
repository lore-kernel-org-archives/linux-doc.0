Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22067340D93;
	Fri,  6 Mar 2026 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772835511; cv=none; b=Gzs6syGKO+6iOPBrISuDSJiy7euVaLatbORXmwJ9MyjiYQljq/n4ohtHknEv5D/P4zU8YnObOyEJOy3GsKmGPRmMBGy0o4X0fyc0nrUwqLw6TUvef4RlykU5SG1hi6Lfeqq+Uuh5Aii1cAVrPZXTH/qgiBMjZxLLNL6v/pekapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772835511; c=relaxed/simple;
	bh=tte0RWWh1kXRgBDYPj76mH/8y95f+zY1/V7jnGKnpyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIR1KtZ/wPJCppmQ5aGeSM5tdIgvu3XVVcijLNNi4qgHcn6zDpPuDLrr9j0v3riiiZHPTyuAzV8TpvUTBBMDU+QA6U+nFANjtn3Gp9LG2DOqJgVPEDUDOTUqWNn5HcIm/DpESOOsx1QS4x0jFvnlhEcezOLIboMPzmhbuPLrJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J4aDUp0t; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J4aDUp0t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=w1eXp0O3uBCTO/YYQjX7PUW51b+uMamwJnIw7U+f004=; b=J4aDUp0trZWBhMSK0i7M5kdI52
	coDTyPn5o+6/hT9DOdYePG2OnjQ6aTw6PLBjac+PqTQKbGQnfNRA3ZvRzzrKkN2RDIYH3vC4Z8RnJ
	XUMTd5R4BpPd6l/8gjkL6mDkHjBf9or97fvspsGDmjJXgOmLk4WTCiBnRrJ9v2bRSvaRO0qhsN+D2
	3/PccvXZnjWttZaRtHSlKeBY2oqT9DznnWP9AdQY5gHrFdMoLfRiblJjj6gIS0VQFhs7CdUfTqjYC
	ZdnzYdOm8Y9zTcghUic5C5Uh5O27dkjpkkd/FuuCKr1NbS63mWDG/pweFQrJBHLbIGMz20qxcFmWh
	ldrrLCaA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydV7-00000004aFd-0KAV;
	Fri, 06 Mar 2026 22:18:29 +0000
Message-ID: <e9898533-6ec0-430f-aa56-b8f472b612a5@infradead.org>
Date: Fri, 6 Mar 2026 14:18:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/gpu: fix spelling mistakes in todo.rst
To: Mikael Rothig <mrrothig@gmail.com>, corbet@lwn.net
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306215647.67980-1-mrrothig@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260306215647.67980-1-mrrothig@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/6/26 1:56 PM, Mikael Rothig wrote:
> Fix three spelling mistakes in todo.rst:
> - 'varios' -> 'various'
> - 'implementions' -> 'implementations'
> - 'complection' -> 'completion'
> 
> Signed-off-by: Mikael Rothig <mrrothig@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

In the future, please insert the patch version number into the
email subject line, like
[PATCH v3] docs/gpu: fix spelling mistakes in gpu.rst
The patch version can be (is usually) omitted for v1.

Thanks.

> ---
> v3: Added CC for DRM maintainers and patch description
> v2: Squashed 3 patches into one as requested
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
