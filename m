Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FF36F
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 01:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Coh5tL+X"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5913e3a9e05so155282eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 17:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702602136; x=1703206936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkruKU4a5bjXzJWOR3RC/txskZKPO+PmORU8eDBqdN8=;
        b=Coh5tL+XJtCFKgsf8NNqA/FZt5stJC1tADMa4UaOmNnQMTXc/Ll5Qj7v4qSSl9hmEd
         CX6OABf8bvWijjSRoJ8JTL7fSPJiMne0GEEoOJ6Zn9Qqixx9SnsBj6LkvDDvUbohgfhI
         qhYOtGdAwihQ1VBVVlmbXQHz1fNhQYmce/ziI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702602136; x=1703206936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkruKU4a5bjXzJWOR3RC/txskZKPO+PmORU8eDBqdN8=;
        b=kmAgKqUrBe5beXmXj6omNIf//Csz3Zd6gGyz6IDaaXgMoxRyrDlu0wnZQKj4FQcBvN
         vqJjDihAr8mAVPLf60UxUIZ86Q8Gt/dAaAXAfZAEVUgz7o/2YGQT1GWtJ5/FlhZApoTN
         dmttlRTNRVauRIGUSHYblKHUGA8dYXGINi2wKawNI9OwL7euGWG+QXbqYG/tDeILvvLr
         Gk3lT6PCWA4uR6XW7pPvQ5C2jxAWil3ffOs39vdECT4fna3FglNYNu8dOSOnewF6LVj5
         AS/CjWAR6hRL4nbIwMW98xOWiiLsesS2qER3iADjbOuxRBfM2Fo0Qm8ssNkoSodeHEkc
         T6rA==
X-Gm-Message-State: AOJu0Yy68Ox8sh4BAdFV2jry/1ps8VGwnieGHHAT7qbTHiw1X2dpoXOy
	L2nZ8QRiJo2LNWPyPccc7Da6Og==
X-Google-Smtp-Source: AGHT+IHHSlfuVuFLEbWp0S1w35rpI8fafNVNhJmQK3Uu3c1zhb4GOk4bGqarOHhYFza7b+HShr1s6A==
X-Received: by 2002:a05:6358:7e45:b0:170:f329:74bb with SMTP id p5-20020a0563587e4500b00170f32974bbmr4719923rwm.44.1702602136471;
        Thu, 14 Dec 2023 17:02:16 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e14-20020a056a001a8e00b006ce6bd9703csm12227711pfv.194.2023.12.14.17.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 17:02:15 -0800 (PST)
Date: Thu, 14 Dec 2023 17:02:15 -0800
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] scripts/kernel-doc: restore warning for Excess
 struct/union
Message-ID: <202312141701.DD74B450B@keescook>
References: <20231214070200.24405-1-rdunlap@infradead.org>
 <bd003104-f09a-4904-90ce-ade286a2d051@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd003104-f09a-4904-90ce-ade286a2d051@infradead.org>

On Wed, Dec 13, 2023 at 11:05:42PM -0800, Randy Dunlap wrote:
> (correcting Mauro's email address)
> 
> 
> On 12/13/23 23:02, Randy Dunlap wrote:
> > The warning for Excess struct or union member description was
> > removed when the $nested parameter of check_sections() was removed.
> > This causes some kernel-doc notation warnings to be missed.
> > 
> > Recently the kernel test robot somehow reported an Excess member. The
> > code in kernel-doc has not issued that warning since kernel v4.16, so I
> > don't know how the robot did it. (See the Link for the report.)
> > 
> >   drivers/net/wireless/intel/iwlwifi/fw/dbg.c:86: warning: Excess struct/union/enum/typedef member 'trans_len' description in 'iwl_fw_dump_ptrs'
> > 
> > I patched that warning away even though I could not reproduce the
> > warning from kernel-doc. The warning should be issued for extraneous
> > struct member or union member description, so restore it.
> > 
> > Fixes: 1081de2d2f91 ("scripts: kernel-doc: get rid of $nested parameter")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Link: https://lore.kernel.org/all/202312060810.QT9zourt-lkp@intel.com/
> > Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  scripts/kernel-doc |    7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff -- a/scripts/kernel-doc b/scripts/kernel-doc
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -1659,6 +1659,13 @@ sub check_sections($$$$$) {
> >  					"'$sects[$sx]' " .
> >  					"description in '$decl_name'\n");
> >  			}
> > +			elsif (($decl_type eq "struct") or
> > +		       	       ($decl_type eq "union")) {
> > +				emit_warning("${file}:$.",
> > +					"Excess $decl_type member " .
> > +					"'$sects[$sx]' " .
> > +					"description in '$decl_name'\n");
> > +			}
> >  		}
> >  	}
> >  }

Yes, please!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
