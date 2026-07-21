Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0846C4D0
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658253; cv=none; b=JIc715MpejuFjm3v8HMZKP4TOjELlSz+JnmXIfLdthyuwLCE/7qYujIF7ptCz2z4TV3FtY/aKi2B8qxKBoZ3JUl0pl/jIm4TfXvI4M4wyO+0P20teypd0r8sGo1WK4pu+k5dzm1CYW99xYslADZYC/hDsgknVlaUgO0yAqRr1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658253; c=relaxed/simple;
	bh=SZS4vrqaL+vnrrQt0MkPNv7usniW4HDi8BZyvpJS1NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzGM49cAppXgnb/q0hXJdp+bG1jiaQfQ4Lml92L6r4MODBX2QT/sqayG8TFZZerY3ru0xs9eYUkj80rhuOpoCoKInEgUKZgbw+sBkq/NkcrZKMg2G9e3IBVP3NcInmd9cP+gq9Vz1ArMnjN6wb7I6T8I5SSQ9OPBSTgFsZAk+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5XvVBoZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5XvVBoZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so11006578a91.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784658252; x=1785263052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPAByUFNjXARQRVB7YGyFb7Dt669+QjeYcGeM1abPys=;
        b=B5XvVBoZ+9bnklGRFdQ9zXHoVNSpCqgwh83zmMgd65crjf1jbiOsYmdjbDkiWKLwlI
         k5WUJ4jLrYqzNkjHJvoK5vTW2Hqt/glpD7RfSeMjuUNgy81IbYflvZYV5EXbIZHV9/Nv
         5Kth6GNIsHK09t7lor/P2kbVw9YOxyz8o34Bai0I8gtlUq0ONz+JJNduHNU8XnhHpkHy
         2LfgLt9WDA2kGqrI8M1OxEUQoDeHKddCwuAbykPadiweQ/53sws8uG0jl69y5hmdlfpL
         X/91NztWiTEIs9dXyBtoaMGJ1bugRDMbVUjoCVwMEcQnXYxC9CskDVIQO4QNha0F0Gj3
         Eqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658252; x=1785263052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPAByUFNjXARQRVB7YGyFb7Dt669+QjeYcGeM1abPys=;
        b=MjF6Ugi68m+6htCHOqc8je32bBbfGdVtW0GfQEZlMm5mHgbiau9+NOL7r0Tn4Pv7Yy
         QKwKlIG9KnngN4ayuru3kGIsVPOG1plVuMJFxlVsU3qeoPW6WlfltvXkWzWg5VctZQWe
         6I4gumcbs4Z0RF5+aGiaInIz0cbnrhw4/61YY4LXsK8FqNekFlkavwj4kXwNTC9rBbIT
         JoR1W3iH9xhuLwfWMYozTr2VpoLwVb8gQK4XsXo+5MdBKXOZqbIGKXyICT+FxgizFOCn
         9hY5ITBNZkb3ZR+ZOu9tMhZYq/D762MIANBHy+yJMCUzcU2YMAub48K1XzbHCtKI0v8M
         n83g==
X-Forwarded-Encrypted: i=1; AHgh+RpG1j//f915A14A82iB01LBbkYDZnBsJ0HxaxJEbItEWQ/l0U0jvitd133mb/vAJ/09zmeDMpAUeTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuD7QJMEI4kC8baljOg9lNpBf35Bqy+dHtMohzaqq5nlEKHvJz
	kcnK2VgTQYpXTQPKCdQxsEdEZQS6nsPU7uvFuD214v2BqE2iFJCvkSNa
X-Gm-Gg: AR+sD11eeAlVD07TPvr+6gSNZ2a2BKB2qrU9XxmSpO3sNxaG5nbKwYi6a5AS9LEnBQK
	tbx/gqm9JXNiNrK3L38N0uzsdNtwNnaHjlB5wanUiEyxv4NYU18LYaiFTWlkZBVPExw8eA7Y7dM
	FX69qhf/aSN5i7dWlArfBHls6kAqKHjLxcTrDWwQLA2tS3ggw7VDnu9EPX0H/K6hYHf6c2iGGdL
	WIXI5L3eY9mkzi+AWzdJnICiLsR37ESYQZt1yD8x3GkMILhVI1qlW+WTZwyi71r/BsFKess3C3/
	mZNQ5LzWNyfGNKmEVx5v64RPe39jVRdIpmWK7butkj9P+ZYqLZ4XtYFHEunaqW7H6bcUukCC6HQ
	mQ2ttJnOFrh024kiVhB6sYEGbVNn8yFdp8B/58F4WTjZhm9S+iaK61PgBDxpbCi/4vsta+IDFMm
	DVOg==
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr9940872a91.30.1784658251458;
        Tue, 21 Jul 2026 11:24:11 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92396445sm2047911a91.17.2026.07.21.11.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:24:10 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:24:05 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jyun-An Chen <jun930436@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:MIN HEAP" <linux-kernel@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] Documentation/core-api: min_heap: remove undocumented
 min_heap_empty()
Message-ID: <al-5RcMAtUMGmSU0@google.com>
References: <20260721180127.132730-1-jun930436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721180127.132730-1-jun930436@gmail.com>

Hi Jyun-An,

On Tue, Jul 21, 2026 at 06:01:26PM +0000, Jyun-An Chen wrote:
> min_heap_empty()/min_heap_empty_inline() are documented as part of
> the Min Heap API, but no such functions or macros exist in
> include/linux/min_heap.h or lib/min_heap.c. Remove the stale
> description instead of adding unused API surface.
> 
> Signed-off-by: Jyun-An Chen <jun930436@gmail.com>

One minor nit: the subject line says "remove undocumented", but it
actually removes a documented function.

With fixing subject line:

Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> ---
> Changes since v1:
> - Per Kuan-Wei's review, dropped the min_heap_empty()/min_heap_empty_inline()
>   implementation (unused API with no in-tree callers) and instead just
>   removed the stale documentation for it.
> - Signed-off-by now uses real name instead of GitHub handle.
> 
>  Documentation/core-api/min_heap.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
> index 9f57766581df..919dcf1bdec7 100644
> --- a/Documentation/core-api/min_heap.rst
> +++ b/Documentation/core-api/min_heap.rst
> @@ -240,19 +240,6 @@ This macro returns `true` if the heap is full, otherwise `false`.
>  
>  **Inline Version:** min_heap_full_inline(heap)
>  
> -- **min_heap_empty(heap)**: Checks whether the heap is empty.
> -  Complexity: **O(1)**.
> -
> -.. code-block:: c
> -
> -    bool empty = min_heap_empty(heap);
> -
> -- `heap`: A pointer to the min-heap to check.
> -
> -This macro returns `true` if the heap is empty, otherwise `false`.
> -
> -**Inline Version:** min_heap_empty_inline(heap)
> -
>  Example Usage
>  =============
>  
> -- 
> 2.43.0
> 
