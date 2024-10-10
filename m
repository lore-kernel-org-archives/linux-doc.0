Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887DE1CF29D
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572405; cv=none; b=iChLlgKQNnO8wm3RgUsNN52MEqNF/6Mz93Lc1PIYGApYo805mcjmkJcpK0LAbIDKmmVhh7JTO+p8srsPq4ATwTEud0nJRHz6QIeySAVlec+qyDmfq0m910S26sbP39DzmAFf5JJVw9xTr/9tNYw7MeZr/azeToRmWepRrOAhVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572405; c=relaxed/simple;
	bh=b7V2f907wC3gpJZSILtBNClfTtCPhHfEFBQrnjR7EFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKXYU/SYOj12yrv21kJdxZb9HsVcFpaW1qOVrSaql78DYqdQchMJU+DxcYIxCf7Hc9aQYjHqkeg9lbdYTVUtNaLT94t2l1cnqoRcJwRw3XNVV22AL796M92h1xiv8xTP6wGwXZLoTmpMlN0BG1dqPgcVxAunKQYLeCBRs0mwrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E1pqjfce; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E1pqjfce"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a994ecf79e7so168881166b.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728572401; x=1729177201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQuFIVPgcDNzzP5dDQ9aPllAbgUFYGZeYMdHPf9KucI=;
        b=E1pqjfcekZD+wFAqLPzmveISV4CLHLku4vJY01Ee0LDYYpBb6O1o95TKO1rJ2Ve6Jh
         mkcU9/pCYYlowq1eId62oV/ID8wzNHB2MTbdiaIop2jOgaEa39il8Srg3QnXCNhqDUMr
         lDvLgn64PMRL44oc2Hd6XyUIKt3m64VqK1ApX5+4CWxW1g1pkQtgn/e72o70j+17LaiZ
         izUycG/p9vpR3fhL9EMl/TTbVhnlttapPsL+6H4wuRdWecn6d5DHoJE7wJyTR/i2XTqO
         FTVXlXdRZu9mYsxJ4EW+iaJUIFprW4nr3nz+BEFtoVn7GB1Dk+AdTtYtL7cLEDoa/HcX
         M2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728572401; x=1729177201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQuFIVPgcDNzzP5dDQ9aPllAbgUFYGZeYMdHPf9KucI=;
        b=hzfvByspApWW7uzTA/M9GgTpeflXaQe2o4s06LKi8TZTc9s1apy6iEmuHiFJM+8xnk
         r4QuTWeFZ2e3BZn3Yc30GspSuh/t4zOA0xjslkdr77UvHjmgy+C8rkkrNHhNG4dN592N
         LU/YbNu+gCMInahxxT5G3s/fyKIXZ94aPjrb86wzcA0sdPlRuS8FUnHBbCvODgHzmeEq
         uwOBfIVlbQpKYFpTcPi/9QMjB65owbLku9zQoAq7X2RAxSRyUdaYQYwhUwUbRlQAmNwq
         UYSVPLR+AE/NPTkFHa05g3oaubUlFE8VBrL/lx6xAj0it/W5xrsEdJlhZCAHioAo3Rpc
         U/QA==
X-Forwarded-Encrypted: i=1; AJvYcCUsJTm6i61PnF2b50w3Q/qNjuztGs25JiW+hP2MvyIA98p0lnIKswpRDReQxkczYCs2k2RzuZvsQFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/YhBBYgsAM+CskkW2g7KnZfp+9xzT9MoJhvcuU2eAOC7MSncq
	F9+vn6FQOeUgVA49jwxfdb6PT49zv6WPx6sPK7eYHuIpNp8ATE7x+tCj9HgEAIo=
X-Google-Smtp-Source: AGHT+IGW2A85HxaygCEijBG35Zwt3g08r3KbMHbf8XGM1RPwC0Ld8GCukhWd13kxEHGSwGXTGCl7Iw==
X-Received: by 2002:a17:907:e654:b0:a99:585a:42a9 with SMTP id a640c23a62f3a-a998d117cb5mr585547666b.9.1728572400859;
        Thu, 10 Oct 2024 08:00:00 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80ef972sm98465166b.193.2024.10.10.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 08:00:00 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:59:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Navneet Singh <navneet.singh@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	linux-btrfs@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4 01/28] test printk: Add very basic struct resource
 tests
Message-ID: <Zwfr7na62OKIlN8b@pathway.suse.cz>
References: <20241007-dcd-type2-upstream-v4-0-c261ee6eeded@intel.com>
 <20241007-dcd-type2-upstream-v4-1-c261ee6eeded@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-dcd-type2-upstream-v4-1-c261ee6eeded@intel.com>

On Mon 2024-10-07 18:16:07, Ira Weiny wrote:
> The printk tests for struct resource were stubbed out.  struct range
> printing will leverage the struct resource implementation.
> 
> To prevent regression add some basic sanity tests for struct resource.
> 
> To: Petr Mladek <pmladek@suse.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Thanks for adding them. They look good:

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
