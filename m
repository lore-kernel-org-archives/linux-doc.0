Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C255212D11
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730990630; cv=none; b=m/uZcLlEqgzeXr8nzYddONXWsGQxai1RYTofUMK5i4cPQqdlGVH38F9RJQETS9Sy4QYTzfvvcDDeqjuqswKrZOudipWgn8tkz7fsivziGypRYxTHTgo+IjzgcRbybm13F9CDDSrW1WLT5rtb8qF6zgf3gI3l587d5lmGvYB5ELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730990630; c=relaxed/simple;
	bh=u/UibkWukm8QVSh5GSo+c+62ziGUL4DF2iQ/BqbFg1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlz9FS7D8Wb9i+SDXVgTMgNReyn80SPm97EcVDuShiet9wmPKNVQLIihzLrCgiUgnntF4xB5pXZTbfpymEuvxhwuc05uvjIX7b7TCEEpAiXCQTZTmjHqs8hUj8g8OBMPQ3Vw1zAijvtnoOgjz5aeu2WhAeQ23sfHmiEP8tJPi2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CQgJF8Zj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CQgJF8Zj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314c452180so12689725e9.0
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730990626; x=1731595426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3cGH6XjgAeljYo8IyTePdbXv29oLDJnLSASBiasK6k=;
        b=CQgJF8ZjW7z+XNziw5C67PhXckA68Y9GH93kK0NplJ9HPftB3LA8vRXpDC0kLrCvlK
         fx9qaV61oEe2wxHObaEPPqhACCBz97PTYIj9P9CdCx612+P6marjKQ3UYMd2c67a5zQv
         HRPf6Li/qZv+rffwXUVPx1Wq5Kt96XA153uokkNV+nifKnnmwiSx847KuIiw6Ow6cDHh
         8BrK5oRQolAvi5Iif580q0d8hYKZT7f+2r/gpZOTkIELQli5GiFqoKs7eMnCzKi7z5hq
         lOYsxQUD2NQXry0tk8/L91iqen0Adf2C3Qq6gyQFtx1fgK1xNCvyM8M1psUT/FAB3CdT
         +l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990626; x=1731595426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3cGH6XjgAeljYo8IyTePdbXv29oLDJnLSASBiasK6k=;
        b=q8aBSV/BptlIxpqasJ3sVibW5phXa8u5lhpWgZlCD01tMXa7H0ikZOiu5a1CE70OHG
         NMz+Q+UTNlhtX+IVbU8Z3eWn1paB2OSCruOeyGg7L9AK3BljvCG3rAeazli6bl4xpScB
         xLTipTgYMf+UFhUhOqu/++GrYeR3rLqFHhiy+XrW0umKSIsRVvZRBIslrdRVml7xm8Ag
         JpEh6tH3GnMCWEZ25CHPozsamZrTSaPdzAVoH0FctcS1+OyW+6RMLfLUiOMtxMr0Mrsr
         eQzEje1FmYjJ7naFZuxc0IO6wzF7WCOTFQKrHSt9apg0uIMyWZ66yCrpGDz3goUW3o2q
         oyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnYeLymn1Zu0pYOMlX9MBoVa5vUIuHDyIxKYAhiIpdZAbkLHY0XK/bBGBfTOZn+9DQYSApF2LHNtg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydh42NVLBCQZS1D6VuG0vg+82gnT0QEsVh4HyedBqsyfT6Ayuf
	FHGHnPdcWoguxFP7tCDQqmngh2Mdlm5eP4bJxYEQ2lCTWpDKGS0XP0uBJW0dEjc=
X-Google-Smtp-Source: AGHT+IGhzDR7keUmd6bQp19ov+4IRWvETVRPa552MarSidF2G2tCRWC9KHmpiAN33CFuWpsfUB76gg==
X-Received: by 2002:a05:6000:1a88:b0:374:c21a:9dd4 with SMTP id ffacd0b85a97d-381f0aeb76emr176470f8f.20.1730990626513;
        Thu, 07 Nov 2024 06:43:46 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda0604bsm1887520f8f.105.2024.11.07.06.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:43:46 -0800 (PST)
Date: Thu, 7 Nov 2024 15:43:43 +0100
From: Petr Mladek <pmladek@suse.com>
To: metux <metux@gmx.de>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fan Ni <fan.ni@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v2 0/4] printf: Add struct range print specifier
Message-ID: <ZyzSHxq8WuPp_Ewx@pathway.suse.cz>
References: <20241025-cxl-pra-v2-0-123a825daba2@intel.com>
 <18854680-4ab7-4453-85ff-78351d4d4ec9@gmx.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18854680-4ab7-4453-85ff-78351d4d4ec9@gmx.de>

On Wed 2024-10-30 11:51:54, metux wrote:
> On 26.10.24 02:46, Ira Weiny wrote:
> > Support for the Compute Express Link (CXL) Dynamic Capacity Devices
> > (DCD) have grown a number of uses to print struct range.[1]  Support for
> > a printf specifier '%pra' was being worked within a large series and has
> > garnered a number of comments and discussion.
> 
> This is just printing out hex dump of a memory range, correct ?
> 
> What I'm looking for quite some time is a sane way for dumping structs
> in a human readable form (field: value pairs, using their actual types
> eg. int vs string, ...).

You like to print it similar way like "gdb" or other debugging tools do.
Do I get it correctly, please?

> Any idea to do that in a generic way ?
> (potentially using debug info ?)

I am afraid that a generic solution would really need to work with
a debuginfo.

That said, there exists some generic approaches for printing various
values in the trace code, for example, see

    Documentation/trace/kprobetrace.rst
    Documentation/trace/events.rst

Best Regards,
Petr
