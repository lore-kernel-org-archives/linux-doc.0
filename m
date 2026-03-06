Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1273431FD;
	Fri,  6 Mar 2026 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822500; cv=none; b=eguHs7xmZ/nconCUXTM+dnuMqptrhYPZCbu/gFVFXxqZ/rzZOGnwbzKp+8rjpwXtdvnq3jvuOOp9gCgx+fWhpZL387JisFOgTP1hKBt+3g5L3CEP19/bWZ2VPZ2dcRYEZTnpTnm9ZVqZJFRvcuAeCfI6/Gq7gVviTZvK4efTcQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822500; c=relaxed/simple;
	bh=4J1hqdT0pqrcrGfryBLBKrq7Os0xsVkdbFk1Sk70JdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stvYAXgqtpGHpJar3j9UKPMKnI5sFrck4Mfjgkm1RmG+s1ZpU0J2eGyzBg2Cyr+nzzAV2BZpXCNXZzFkHbM+O5xAowJv5P8EncpuztqydcdOXQYtlNC0/Z8d+Nf1kxcTgC2h7U1mxivrSJy18BeiBxu2Fmu4E/6r70vU/H97cBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E8oJf4b/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E8oJf4b/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ks2Fc16oJU6Q2v56F0xsiVlNgwQ9ICF+yP+izHjclXc=; b=E8oJf4b/KEI+hRIX5r9Im5vlGE
	9KPC1WZdA8WVrjdX0Wxu2hSHRje+rcAkcTFNfbIDqljAZZz+FX79nyDMzMsS+G39U3xtN3vsO23nA
	By7A5Z5rg5/aOhSY3AxdzhZN4O/C2HyFksg4eLrxGqxeTaqTTVlzPYBTnR1dO3+RzCjOspNxQSG+k
	UlhF2vMxwqKRAb9FsJbQIXwSDrM/cNXHGJEXgr4jlESpBhcoiRUb1Ndhb/HBnHG4TeywhgxM20ZWG
	/I3QFyyzcSvGqrrqCnVrbofLJwLnSbSVIxFOVk7g7N6XDj3XqBCx0tdTv518Lfg8bbBNFt0Q/ANgG
	7x5Lsh2g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya7G-00000004LeO-0FED;
	Fri, 06 Mar 2026 18:41:38 +0000
Message-ID: <224b24c7-abb8-4a1b-afd8-541aec492a96@infradead.org>
Date: Fri, 6 Mar 2026 10:41:36 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] docs/gpu: fix typo 'varios' -> 'various' in todo.rst
To: MikaelRothig <mrrothig@gmail.com>, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260306092822.48393-1-mrrothig@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260306092822.48393-1-mrrothig@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/6/26 1:28 AM, MikaelRothig wrote:
> ---
>  Documentation/gpu/todo.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 520da44a04a6..33678b669339 100644
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

These 3 patches should all be in one patch.

The corrections LGTM.

-- 
~Randy

