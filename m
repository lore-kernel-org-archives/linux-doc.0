Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDC362
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705993213; cv=none; b=NWANBQnerdw82znva8jGsPC7LQr06LdOMMKjCCoJGIvUcPvbEmj9YIFC1EUJO6d15J4+TL9Z5xei+uwkdcnJryT0EY6JTBOfs0gbzDqywbBqRlPr1uxLl7ReRRvrDCdHymW/db0GutJtykgFQfMM2lRG2va0zpqS+YVMrbwii9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705993213; c=relaxed/simple;
	bh=ow3xtiI8wOys4BdfqsS9ASReMchmYgPUuwFYLKrm/q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iepuygZ9OPVQb8EY1o+mqI+peYJqNq1hRDrI/E/4GEAgUS6gqYyZXI5hYW3UYxURuCSQIHuD57w9yH6iwt0McS6MLWeNwm8G1gm1cN1rE+PtTVYYdZHwWdIiXAg486PbOi/N6N1q2b0DhMjvR61nxjtwqU4vARAmKQ/87Pp/53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kJCR9/n4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kJCR9/n4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=poL9Dy9milewN7yssmr31RwHD/ev9M1GXyVKglwHelY=; b=kJCR9/n4soAk480GvWetwOwYgS
	2td/cpnvNBUGNKGuMFyYutOk4xb45PLcWkCEBs+AhRQyVAIAJj0kvkP+3EKcrlKitPvc/l0Fr4/k4
	UUu5RUNl8t7W6JEHwSI3vZvL+iOAvgs3+UCVR3pm/GK9957C4uQZIL8o/5WIKiZ92yN+jiq3fwfoL
	PyYazwItPBuQFnOK+WTgY7dTSaTr1uyZBUfkDt4QJYnGx3DBWeEmZ60GYqKeXCL19mFmjRsMQFGWp
	Idg2Lgas1fVTd4y0gu3nJ5K6z0UqSeOeiGv7YXC18hczkHqB8eAyjrEOOhK/ZoqpZRQ/Jk2oDAm1A
	/FlXF5Qw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rSAlT-00FLJW-2N;
	Tue, 23 Jan 2024 07:00:07 +0000
Message-ID: <b5ac5db0-15f8-4ddc-94d8-574beea58339@infradead.org>
Date: Mon, 22 Jan 2024 23:00:06 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scripts/kernel-doc: Do not process backslash lines in
 comments
Content-Language: en-US
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240122093152.22536-1-anna-maria@linutronix.de>
 <20240122093152.22536-3-anna-maria@linutronix.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240122093152.22536-3-anna-maria@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/22/24 01:31, Anna-Maria Behnsen wrote:
> Commit 654784284430 ("kernel-doc: bugfix - multi-line macros") introduces
> pre-processing of backslashes at the end of a line to not break multi-line
> macros. This pre-processing is done independently if it is inside code or
> inside a comment.
> 
> This illustation of a hierarchy as a code block inside a kernel-doc comment
> has a backslash at the end of the line:
> 
> ---8<---
> /**
>  * DOC: hierarchy
>  *
>  *                    Top Level
>  *                /               \
>  *         Child A                 Child B
>  */
> ---8<---
> 
> It will be displayed as:
> 
> ---8<---
> 	     Top Level
> 	 /                *        Child A                 Child B
> ---8<---
> 
> To prevent this, do the pre-processing only for lines which are no
> comments, e.g. do not start with ' *'.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>

I compared several hundred html files before and after this patch
and they were all the same, so I will say:

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e8aefd258a29..4277af79de86 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2331,7 +2331,7 @@ sub process_file($) {
>  
>      $section_counter = 0;
>      while (<IN_FILE>) {
> -	while (s/\\\s*$//) {
> +	while (!/^ \*/ && s/\\\s*$//) {
>  	    $_ .= <IN_FILE>;
>  	}
>  	# Replace tabs by spaces

-- 
#Randy
