Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4036F
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BYekMJ3h"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28b012f93eeso32384a91.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 17:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702602218; x=1703207018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJfZoktJfBhaqxhrtP3TtINYf1lM0VcG2eYQT5MkNfc=;
        b=BYekMJ3hfyVkB0gZj32qdT0Hmpu/IWXOitneHf71cLJo0qpnpmySs54FdBBW7uiKIe
         fkF7s7wV9Bg3OlJov4GsRmMw/0wilXoKADS8VlW+qdvr4iySC4JHFXUknMT5lrrmsybU
         28H3Opd2epwYvTBcyXhM2lmPeMcEq1r1VN4hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702602218; x=1703207018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJfZoktJfBhaqxhrtP3TtINYf1lM0VcG2eYQT5MkNfc=;
        b=ZU3aCbyisvqhAbprdY9cobCi4ns8jEGpo8Uv67tdM5cWaPKwX8Y+5cAuJyF04Bv4Hc
         KjLMs4UKrAzUf89i8tKeru6uml7gWQjNgqwz3tECWlXFuDQ+qEf+N6UUqWOa6elZmoud
         GK/HEoxVJbL3HxM2JircdRIptC9loId6oaDV7i2N2yyM5V4iIJbUMTLF6j4PbunnP41F
         ns0haiH8hZOCr/rm+rLS0AsXxaOwhUBEnUW01+z0/skBkjutlZ389Xlb8rdA4yEwrDpc
         w9XgMR+PDUMzBv+eodWOePV6BR6r6k6jFSzYfMydqSJ5MtwkzU+HQp64xbF9YQp96U8D
         JVIA==
X-Gm-Message-State: AOJu0Yy96UHNZt1OBwGn4cgEXzCvXDflf6mTYLAEJ4zTDhGhA1ArT5x6
	mxvyogFMqHR33OsjMExGC+ARRg==
X-Google-Smtp-Source: AGHT+IFnd1ZmlTfwFaDdtmaRXbsRH6CYedM8C7nkVG+wUbMQ3IWigllbuf+tAqZ5/ar08ZiRYS3Ceg==
X-Received: by 2002:a17:902:6806:b0:1d3:5879:d591 with SMTP id h6-20020a170902680600b001d35879d591mr2109540plk.20.1702602218386;
        Thu, 14 Dec 2023 17:03:38 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b001d35d62b066sm2854431plg.283.2023.12.14.17.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 17:03:37 -0800 (PST)
Date: Thu, 14 Dec 2023 17:03:37 -0800
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, kernel test robot <lkp@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: conf.py: Ignore __counted_by attribute
Message-ID: <202312141702.F33A94F8D@keescook>
References: <20231215001347.work.151-kees@kernel.org>
 <a65e9a7a-b5f1-4397-a953-cafb79a10fba@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65e9a7a-b5f1-4397-a953-cafb79a10fba@infradead.org>

On Thu, Dec 14, 2023 at 04:25:01PM -0800, Randy Dunlap wrote:
> 
> 
> On 12/14/23 16:13, Kees Cook wrote:
> > It seems that Sphinx is confused by the __counted_by attribute on struct
> > members. Add it to the list of known attributes.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202312150614.kOx8xUkr-lkp@intel.com/
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Documentation/conf.py | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/conf.py b/Documentation/conf.py
> > index d4fdf6a3875a..5898c74b96fb 100644
> > --- a/Documentation/conf.py
> > +++ b/Documentation/conf.py
> > @@ -106,6 +106,7 @@ if major >= 3:
> >              "__weak",
> >              "noinline",
> >              "__fix_address",
> > +            "__counted_by",
> >  
> >              # include/linux/memblock.h:
> >              "__init_memblock",
> 
> If Sphinx needs to know about that, then fine. OTOH, for scripts/kernel-doc,

I *think* it does -- I can't reproduce the robot warnings myself.

> a similar change could have been made to dump_struct(), along with these
> others:
> 
> 	# strip attributes
> 	$members =~ s/\s*$attribute/ /gi;
> 	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
> 	$members =~ s/\s*__packed\s*/ /gos;
> 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
> 	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
> 	$members =~ s/\s*____cacheline_aligned/ /gos;

scripts/kernel-doc doesn't actually need this -- it already processes
struct members in a way that seems to ignore trailing attributes.

-Kees

-- 
Kees Cook
