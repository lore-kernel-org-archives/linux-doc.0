Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E935B136
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788629297; cv=none; b=GSBMdUWQ/7Rb/pD7qCzEkfDUc04aCPW/OIf3S5X+rrzfLv53lV9lDQ0i+VCqs6iMBkInDYc5mluIcccxQ91R8jAm7sGydxkF5t2iMZyy6HupE6WdLkJ/OzGNt7DR1Sg7jLgqKu83qs1U6sA0PHqW7fy4doEAYrr37Jl1jb/DY1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788629297; c=relaxed/simple;
	bh=0ioWXb1kUQkIoB5QK1rq9sVt1DrCKm97Jq8iuwmLjwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Doml0TidWyO9V0XTR6X6Ie1fqfJAeyOXaBGWRgAbhXiszKbFmP21QfUfpLg0jb4gEY0JT0wMEv1wTduFuDU0hjS+51ZL9hCH+f/K6KKpT1Oq192vAz979OLQxhmKHf4d0TsG+OSjFLU1PPMicRtYsJTRg/K8wXkFhzl9E0Afgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EFEU5SXH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EFEU5SXH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=QVVWn6Qhwu2BxAgLQh/i0L8eR22xJ5cjuHwEDde4GGs=; b=EFEU5SXHVoclkFIQZaoSCh9ilH
	wk4gtKwu+f7lafLuNY1Q8l+7WezqnDAI3JDMr2nLApQwpuQ8a3VFvPUoJvO4nmt8kaa7Nt/fSbrV4
	d5jsRSjNdtXGf4sbXA0cabBx47yHrBiENkMRXcpbVawwfbGBkh+5PEXm7HBmBEWQICA0qOREmX+aw
	JFxVXVjQdD3XBr+TWQaPu9xsoFsHBWW27/nd+rE+RmHTQoCVNeTHBj0kerfAiD6pq9AhfiM0FyByo
	03/5KidHRsdy3BoXa/bTcps95VOYses18nqzXQJ10fZPESW64JHKhKxwvPWbNmScYg1fzfh4JsMiQ
	0OIEScPg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2uBX-00000004Hzh-1hgM;
	Sat, 05 Sep 2026 17:28:11 +0000
Message-ID: <d35f3d9b-46b1-4afc-ab5a-25224c6dd0f3@infradead.org>
Date: Sat, 5 Sep 2026 10:28:10 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: drm_wait_vblank is a union
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260905103542.43360-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905103542.43360-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 3:35 AM, Karl Mehltretter wrote:
> drm_wait_vblank is a union of the request and the reply
> (include/uapi/drm/drm.h), not a structure, and has been since before
> commit 2d2ef822758e ("drm: add initial DRM developer documentation")
> wrote the sentence.
> 
> Say union.
> 
> Fixes: 2d2ef822758e ("drm: add initial DRM developer documentation")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/gpu/drm-uapi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 93df92c4ac8c..b08d731a093f 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -707,7 +707,7 @@ VBlank event handling
>  The DRM core exposes two vertical blank related ioctls:
>  
>  :c:macro:`DRM_IOCTL_WAIT_VBLANK`
> -    This takes a struct drm_wait_vblank structure as its argument, and
> +    This takes a union drm_wait_vblank as its argument, and
>      it is used to block or request a signal when a specified vblank
>      event occurs.
>  

-- 
~Randy
