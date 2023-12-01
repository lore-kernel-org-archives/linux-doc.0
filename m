Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b+wII0J7"
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D926FC
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 09:50:10 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d01c45ffebso6884385ad.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701453009; x=1702057809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61mRZHUPoSC+/V5UJ4QedAj4EUtFQC65cWS1GaV62vk=;
        b=b+wII0J7L2Fgq8jeVhjyuDXMk/KN6AtxVDDSkJhtfyoxRWjEpA0x+2UhC9At/XoH9V
         D4Rqewe5z4hu49LzEnxv78xRM4XNSRWMVvGuRvJFgVY3Ke4H41KN0a0oZY+d/fdY+hn3
         AYf4GxEa7BCx2jyheBtnvDO2qESWXWzwtRRsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701453009; x=1702057809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61mRZHUPoSC+/V5UJ4QedAj4EUtFQC65cWS1GaV62vk=;
        b=qQCzLeNER+w9oEKbYcQ7XF+isP4QCf2dTEz+k9XdHBi2tkaKi2FgFLo8+4O+qiC0Tx
         /Qd8RxAkUs6pHTdwrCmaYJD8lTztHWCzpv4XOyITi9hRgM87dwO1iyu7V1tpm07Qzsmo
         M3rD5+PbG0pyrHW+GMK8JRwyxXKJioQXgwG5kgPgl4KL1yfOJDjFexQfbVgBOyLKUKzy
         P5CufBFGNzm5M9n2Q2nM8xK4+wOtcx8kg3gea7eygutNODyMuQsw2zCRQYIOIYbXpWo7
         APfEen7XN+2DqjkEF4sy6Z/FTJwT9y8O+ZbuwpaEOdwF3rpm1mLPO+KPy3KbsWpe3tOJ
         I2QA==
X-Gm-Message-State: AOJu0YxnnZ72Vme39cuv3c+pZusFnEYGOf0RL2RikF5v7AfSQFcxqIYx
	uvg8Q0Kg4lK97Fkwx/GwaoPhng==
X-Google-Smtp-Source: AGHT+IFyZfMEe3PmabCp9F5OxkYHT5tTq3uuvSeo+6Da+zmgcN0FNPX5uOuo9lQMGQ2bvVuB0z4EkA==
X-Received: by 2002:a17:902:c944:b0:1cf:a2e7:f843 with SMTP id i4-20020a170902c94400b001cfa2e7f843mr34281143pla.23.1701453009544;
        Fri, 01 Dec 2023 09:50:09 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902f54100b001b3bf8001a9sm3615644plf.48.2023.12.01.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 09:50:08 -0800 (PST)
Date: Fri, 1 Dec 2023 09:50:08 -0800
From: Kees Cook <keescook@chromium.org>
To: sxwjean@me.com
Cc: vbabka@suse.cz, 42.hyeyoo@gmail.com, cl@linux.com, linux-mm@kvack.org,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	roman.gushchin@linux.dev, corbet@lwn.net, arnd@arndb.de,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [PATCH 3/3] mm/slub: correct the default value of
 slub_min_objects in doc
Message-ID: <202312010948.63ACCAAE@keescook>
References: <20231201031505.286117-1-sxwjean@me.com>
 <20231201031505.286117-4-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201031505.286117-4-sxwjean@me.com>

On Fri, Dec 01, 2023 at 11:15:05AM +0800, sxwjean@me.com wrote:
> From: Xiongwei Song <xiongwei.song@windriver.com>
> 
> There is no a value assigned to slub_min_objects by default, it awlays
                                                                  ^^^^^^
> is 0 that is intailized by compiler if no assigned value by command line.
               ^^^^^^^^^^
> min_objects is calculated based on proccessor numbers in
                                     ^^^^^^^^^^
> calculate_order(). For more details, see commit 9b2cd506e5f2 ("slub:
> Calculate min_objects based on number of processors.")

nit: multiple spelling mistakes here. Please double-check commit logs
with a spell checker. :)

> 
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>
> ---
>  Documentation/mm/slub.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
> index be75971532f5..1f4399581449 100644
> --- a/Documentation/mm/slub.rst
> +++ b/Documentation/mm/slub.rst
> @@ -150,7 +150,7 @@ list_lock once in a while to deal with partial slabs. That overhead is
>  governed by the order of the allocation for each slab. The allocations
>  can be influenced by kernel parameters:
>  
> -.. slub_min_objects=x		(default 4)
> +.. slub_min_objects=x		(default 0)
>  .. slub_min_order=x		(default 0)
>  .. slub_max_order=x		(default 3 (PAGE_ALLOC_COSTLY_ORDER))

But otherwise, yes, this change matches what the code does.

-Kees

-- 
Kees Cook
