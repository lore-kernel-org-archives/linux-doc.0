Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nwsRLZKk"
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8A4FC
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 09:47:44 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-285741e9a9aso2205066a91.3
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 09:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701452864; x=1702057664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gCNVYgwpLFteuDrNzIDZLAqe84pArYWACQkufwvTL5U=;
        b=nwsRLZKkP99RPhIfEYEerx8QGFGX/dV8yw1rcpqkf07xvSX7rg9r5qpm93GoUV82ur
         Rqx1WLl2pDZjBo+yIz1rHOSO92Q4sFnaW5U4+Vp+1qwnWtniXn1KaOKpgnCRTrUEPEqz
         497ADQZaglfAg/OOPhw94biQ25f+eLFcEzx4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452864; x=1702057664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCNVYgwpLFteuDrNzIDZLAqe84pArYWACQkufwvTL5U=;
        b=H6RsUUCBE93Mqx3XejNFufw2SlV3y5meRw+ke9RLz66sCBt83qRrmSjwXYQVk4K5e7
         qzJwOprcRXWeKTGZQ4f1hlD8WQa4f0q8hPWZhaJ8jjZvK4L2EjHB1lMwoaHtuVKEYuCw
         67hXOgO2xzYuATcGpJ7XrqqnHPYm1rd2qhEOGkJ2NV5X1Ct8VMrSp241cXcG2tNQQqcr
         rDanRwdVcsNuzOS70TqFnURXmY+70iCBukhYnRQVcN8ANkWDOT0IduAPaQGt3Vy4/88c
         mLGrbWwFVPFrLn0vf0df+mXJbrIEaj+0IZA+oH8c1/pI1fWrSm8nPl5cFpOPD201TXZj
         YW0Q==
X-Gm-Message-State: AOJu0YytOfElxYZuTic1kJ74onYNRAgmUJzGeyd36mSMQzv5ckvp1Z6+
	zGosyKAp7509bz3zsq3f24aQMg==
X-Google-Smtp-Source: AGHT+IHsxxKzBrAkmN72uyMXEJDAqDR+ulUeRgl6PfoYNKg3RuRmpeIq7Urzdpn3+Vl7k98IzwGuOw==
X-Received: by 2002:a17:90a:1a5d:b0:281:da1:4b96 with SMTP id 29-20020a17090a1a5d00b002810da14b96mr22934593pjl.22.1701452864074;
        Fri, 01 Dec 2023 09:47:44 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a17090a01d500b002802a080d1dsm1661658pjd.16.2023.12.01.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 09:47:43 -0800 (PST)
Date: Fri, 1 Dec 2023 09:47:42 -0800
From: Kees Cook <keescook@chromium.org>
To: sxwjean@me.com
Cc: vbabka@suse.cz, 42.hyeyoo@gmail.com, cl@linux.com, linux-mm@kvack.org,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	roman.gushchin@linux.dev, corbet@lwn.net, arnd@arndb.de,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [RFC PATCH 2/3] mm/slub: unify all sl[au]b parameters with
 "slab_$param"
Message-ID: <202312010945.7C5DB1FBB@keescook>
References: <20231201031505.286117-1-sxwjean@me.com>
 <20231201031505.286117-3-sxwjean@me.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201031505.286117-3-sxwjean@me.com>

On Fri, Dec 01, 2023 at 11:15:04AM +0800, sxwjean@me.com wrote:
> From: Xiongwei Song <xiongwei.song@windriver.com>
> 
> Since the SLAB allocator has been removed, so we need to clean up the
> sl[au]b_$params. However, the "slab/SLAB" terms should be keep for
> long-term rather than "slub/SLUB". Hence, we should use "slab_$param"
> as the primary prefix, which is pointed out by Vlastimil Babka. For more
> information please see [1].
> 
> This patch is changing the following slab parameters
> - slub_max_order
> - slub_min_order
> - slub_min_objects
> - slub_debug
> to
> - slab_max_order
> - slab_min_order
> - slab_min_objects
> - slab_debug
> as the primary slab parameters in
> Documentation/admin-guide/kernel-parameters.txt and source, and rename all
> setup functions of them too. Meanwhile, "slub_$params" can also be passed
> by command line, which is to keep backward compatibility. Also mark all
> "slub_$params" as legacy.

*If* we do this, I think the old names need to be recognized, perhaps
with a boot pr_warn() about their deprecation/renaming for several
releases (likely across LTSes). I think it's not a good idea to
wholesale rename these with no warning. That's going to cause a lot of
surprises and broken userspace...

-- 
Kees Cook
