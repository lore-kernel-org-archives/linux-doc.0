Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCFE27CCF2;
	Mon,  9 Feb 2026 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648368; cv=none; b=ParN2edsToRQNEAOBgMQl9zrpsACrz4nPwjmq1vaAblgHhUQiWOYvb8jKFynit9mEHAd7Dr7j23o3azlZn9xnxKBfmyffA9Bz0E9MMySnTmpcj2EFAZTmyO+HecSkZPGmlNpSYoteNnYp4ZnNDMBWb91m4qPcGxSw5aSOyllDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648368; c=relaxed/simple;
	bh=JDb9Y145AjWWah64yY6021C51t2yxnVIUU1pfCpDnzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RPNi2CPaKF+DNWHXopwN+gl3LJncJuAW6foLoH9j/IZjnUg+szrt2kJhj6qsQD4wIGbeIqg5eSHTeBsJrB5udn96mxXBjWqXxMoTRHkXF9zqY3gVb4ChPSmf+PgUa1iI3SLYHbuxoa2YNrxAcb125WYp2wcDL5g98RenCEJ8qR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ICO0R6cM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ICO0R6cM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 060EF40C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770648367; bh=MaxCjzfsA6de0qYlUQKHdGlET///MCRQJ34FO95n7kg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ICO0R6cMGxCVRMN5WmES4kTJXOoEkLHlW1TclK6WstG6R9GRWK4MkHDa0k1kCMBI/
	 ffCfKcsAunv4Io80V4w/esMH2bFhXxFqrX3pU2hurATmcZIPmdZgu5Y7E5+P5RmSTG
	 A4VRfLpS0fC4fdglY1ymqQ8r4Al6Wqvybix1985rVi+m93Nmhqe03OwbBerY2mosf2
	 o8p6wrp8YAw695eZHUGv//HnrR/VMiIC0+liYIbHPd1RuL6Auvsxz6ktV+Wna+j3J6
	 zjKPiplHy8cILXRHq9LifLfFBuzQszofzmua2EJufnX8zMVcnrCLInTTVNt1tbEMWd
	 l1PLDlI5G3t7Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 060EF40C8B;
	Mon,  9 Feb 2026 14:46:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Min-Hsun Chang <chmh0624@gmail.com>, visitorckw@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Min-Hsun Chang
 <chmh0624@gmail.com>
Subject: Re: [PATCH] lib/min_heap: fix spelling and grammatical errors
In-Reply-To: <20260209085250.75237-1-chmh0624@gmail.com>
References: <20260209085250.75237-1-chmh0624@gmail.com>
Date: Mon, 09 Feb 2026 07:46:06 -0700
Message-ID: <871piuasb5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Min-Hsun Chang <chmh0624@gmail.com> writes:

> The Min Heap API documentation and header file contain a few minor
> spelling and grammatical mistakes.
>
> Fix the following:
>  - Add a missing period at the end of a sentence in min_heap.rst.
>  - Change "customise" to "customize" in min_heap.h for consistency
>    with the documentation.
>  - Change "on to" to "onto" in the description of min_heap_push.
>
> These changes improve the readability of the API and documentation.
>
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/core-api/min_heap.rst | 2 +-
>  include/linux/min_heap.h            | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
> index 9f57766581df..62439be2cdf6 100644
> --- a/Documentation/core-api/min_heap.rst
> +++ b/Documentation/core-api/min_heap.rst
> @@ -75,7 +75,7 @@ elements in the heap and swapping them. It contains two function pointers:
>  
>  - **less** is the comparison function used to establish the order of elements.
>  - **swp** is a function for swapping elements in the heap. If swp is set to
> -  NULL, the default swap function will be used, which swaps the elements based on their size
> +  NULL, the default swap function will be used, which swaps the elements based on their size.
>  
>  Macro Wrappers
>  ==============
> diff --git a/include/linux/min_heap.h b/include/linux/min_heap.h
> index 79ddc0adbf2b..cb1cc0c0e8bd 100644
> --- a/include/linux/min_heap.h
> +++ b/include/linux/min_heap.h
> @@ -40,7 +40,7 @@ typedef DEFINE_MIN_HEAP(char, min_heap_char) min_heap_char;
>  #define __minheap_obj_size(_heap)	sizeof((_heap)->data[0])
>  
>  /**
> - * struct min_heap_callbacks - Data/functions to customise the min_heap.
> + * struct min_heap_callbacks - Data/functions to customize the min_heap.

Both British and American spellings are fine in the kernel and do not
need to be fixed.

Thanks,

jon
