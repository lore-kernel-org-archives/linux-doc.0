Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B542882C9
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488071; cv=none; b=TzsA7wxxxg7BNk7nuJEmLHHfn8iBdFhoZLdKJhnHnVJlEsyZEXxPJ3wM9pWblC29Zhly0Xw4t+gm3aQC/hjnA22pkjBcQgXS7mId4CQMJQTYcnHg8JYw+Jrqw4YwJd9u5hFaFGZU8/49UoOuMy1SOVDY5g/Ibd6DLIoz+Hylb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488071; c=relaxed/simple;
	bh=97dxDuo1CGiK//r6VlQ2n/mnPEoD6lcPU66zb/bJ+yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1DPzjMq98R7vQIjyDYln1qtKtTx7lkR/FA6DL8qGNaljZH82Ww/T8cndP0uirCZ1/7qpydgjXTwYj2r4QhBh2B8UynYa5OGSaYz2t2ORjIkLeBfxV1+jAni+bOBJQf8CkM8l2dW/+hVhKG8JsLWk/KJ3m58r6lSBCUZXiuel8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVSh+qQd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVSh+qQd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso5607755e9.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 00:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771488069; x=1772092869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uEQ27jPIjOmpNod7ihflopMRb8gsNhXOZ78DPDWRDlQ=;
        b=vVSh+qQdoWRndVsMFPeBdlP2w98Bf0QA9IOMtgp1L1hgAdmnJUOr3TQM3qq1VxfMVg
         yhaaP+uODJGTcdofs9f6M4EJ8cmJLqmF+QLavY+KBK77Q4nrYCwc34r/4OjpWf+yhdS4
         AQ881pIl/dLwF8CLJ5bQXBc/S0xjU9AO1Z2KtVg3+LbY1J2ZbELBMQUbGTi4njtANowc
         HI4AatlQmBqeWRJBfTw4a9XqSxvktUqxEgBVjeIBvPrRGSSspvQOxiPQOydOVrmmBgzK
         /zMrJ1aGo59yvdiSJ5i8QNd+OAsul+ZMOTojICyrY8Oz5D8rsqaw4RuWWd2M0wgyJLSu
         urXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771488069; x=1772092869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEQ27jPIjOmpNod7ihflopMRb8gsNhXOZ78DPDWRDlQ=;
        b=bcpD16seY7R9F6csLjzM4lqaGLmLVqOoG0wdbcVEtvHjldHxW6rnYt/9XNaCMzsfd/
         fC5hKMDTh9i+rLSnCphuaIT6VPMpRM7hFQluAxD5XF6Q0WrCsteSZ2w7H/X/z/T4KHEk
         IyIkbv2bJzNjeoP482S3ZKrMZmQuK8M7KG5kZACkcAh1aZu5AIvSZtSZ9qmubPQeBKV1
         dx0kyBjrHKH2PybtNebB/mY/W0L27jVgk3DcRyv6bA2umJjVz0qYO+2/ku0unKAq1B+7
         Uxd+CuGY5r+oqGsklK4lh8otQKmDOAVp4+UVS1GXIYgNy77TyknE7jxqmPBA5hw2JZFs
         kslg==
X-Forwarded-Encrypted: i=1; AJvYcCXCvrDkb4FCya50TZHXY2WcLViLgILAoK29Zs6SUACVify4XMHagvU/ZbF1JWjlck70FKdSx/ilfys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgS6tVdIjJEQgilNuKi9mnD4Kt6dEwJhgQ/ktjvsNNTGLBq7Af
	rfrg9JDp4n/GB8c3xq62ykj7Ri0xt2frTjZXZTgXr34mlwR3xCR0+eQnZNi7dE7G6RM=
X-Gm-Gg: AZuq6aJCDBMO/VWInkYcmFE96ioxziovsuyLJfLwd47SOpBd3GIHGIMLr5xA7rWd7VJ
	iC5eMrhMXuD8qyx/w2M2GkkJ7CoPF0xl+Vzcm24KYCVqmmY9Q7Yt67cK+x+yKBqg/qA6VI3Absq
	Hlu2h2BpxWGGmLBqTDVpk/GISHY/yd46t4lCg58m+Q610B1YRqUH2LiI9XrPT7d6qtZTk3tKSTL
	6RxON+fOVXZWv6IKuDHfsOK8v9Ec4jCL8B9iuLtUgmOFJ6hyPlURKqsHc8jEAoo5s5T1ptQ3EPJ
	FyfOAJawgzUYOwJH7Y0JTfB+dDrSakYq28CKIGsUcitwBvPLvfrLeyzDg7tgBr2tcYNqPoHJgti
	YkTumz3IZi/MK3NSk9o4iMfibcdzPGIdygFz8Zw6O/EzSf6eAkI1ZjIbPSJOqRGnAQhABWTe3cb
	pyahzLSeLD4lOWC0FrOkLbRjpASFuI2Qxz1dUl/+U=
X-Received: by 2002:a05:600c:1381:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-48371098c8dmr309544945e9.36.1771488068588;
        Thu, 19 Feb 2026 00:01:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837b68e5adsm461946265e9.9.2026.02.19.00.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:01:07 -0800 (PST)
Date: Thu, 19 Feb 2026 11:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marco Elver <elver@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 1/5] slab: Introduce kmalloc_obj() and family
Message-ID: <aZbDQLeMsHCv32X8@stanley.mountain>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203233036.3212363-1-kees@kernel.org>

On Wed, Dec 03, 2025 at 03:30:31PM -0800, Kees Cook wrote:
> Introduce type-aware kmalloc-family helpers to replace the common
> idioms for single object and arrays of objects allocation:
> 
> 	ptr = kmalloc(sizeof(*ptr), gfp);
> 	ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> 	ptr = kzalloc(sizeof(*ptr), gfp);
> 	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> 	ptr = kcalloc(count, sizeof(*ptr), gfp);
> 
> These become, respectively:
> 
> 	ptr = kmalloc_obj(*ptr, gfp);

We are already getting patches that covert these to:

	ptr = kmalloc_obj(ptr, gfp);

(without the *).  This feels like the obvious bug people will introduce
with this API.  I sort of think that "ptr = kmalloc_obj(ptr, gfp);" is
more natural, so maybe we could make it work that way instead?

regards,
dan carpenter

