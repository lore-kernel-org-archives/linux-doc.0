Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B63DC877
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 02:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455444; cv=none; b=blP1R5YKfSAaGkUKxunq+gaaMsL02zhPsdEYItJddvTyIq7v/Xnsx28R9UryNUifyxGUvlXO1Qyk3+12pN3mbMKN7poPU6iavCLyNiSNtrpSvHm2jKNbp0Kr9VUDXWj9QzeFxetZ7saE6cIkyNb2/XAItoFQ5zbjwevtuSrCSIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455444; c=relaxed/simple;
	bh=N4OxoQTixXI0CRT16N1iXZqTHUvsDx1Q9fcNeE9kgUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pua8R70gJ30e0vu9kAjOqIaFkb5NbxBNmUpNazdvk+bndruSVNlAl3vvGI9e+5F6Op7Kc2i+9wZdunm3rewki9hIXkON6hfviTVbgYOU/NwE8V/9skYxwwtPg+VLMucKlhZsUGpb4HrYBQJk0mI2p8lJ8GttExdS6mOKd54jzmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=E/KUNS3x; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="E/KUNS3x"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9157d3f2098so165168485a.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780455442; x=1781060242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3awZDWC/0BEHXSInI6v/h4g63e1F9fJCkxQA7vD56Q=;
        b=E/KUNS3xAzyC0G5EB+KrwKNZP2PaaFGBqYrzzi3riFW2g2Hl9xI4giD9ok2HT6DwCL
         u4K2OUJO3dmn0W5ZKtJ5f/r2xR6z8CKXTWncXmk/lpinHNYaAKMZNWQ8/JxX5elMmjKM
         HFy7vIxTAvEQD4jgxZriuLi4E1f4EmlG7EVlnDE8Wz+RvwLVS6nPuCBe4CR1H8BRDgpq
         Hkc94WHD1xU5zAR2I1oX/q/ZixtaEc+HsSDKvY/8wukHbiN6cACtWFcV3HoEDajqVegw
         onscqy7DfCCZERTXfCIG22TP1ZXsp02TW1N35oI7kOz5CjHslA6DZ8rWxHUnZXz0S3rp
         E2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455442; x=1781060242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3awZDWC/0BEHXSInI6v/h4g63e1F9fJCkxQA7vD56Q=;
        b=QVxuuHu2JovtE48rnxxQ4VhUfGb2U0HWHUWeiZqpJ68dbZR44n2H4hYfQhVyVAq/5y
         XqCO9MDfFFhw1JlEx2IjTXEqluyQxNMeE9v8ZocJ7xYds16VeAetmorCcR/Lr1hVjBcH
         svNjjbZJY7v5oZUaTP5Mf6sNFheqpPslvp55gUuq8V+MtS//swpbkKraMMxbqPluwOKJ
         QYnAj5y34whiB0HmHqUEbE1Oo/jDmATMXCMNu3UqxQe4OXCyTI0Xvs0jFZFmVQvuigkr
         cWG1D82ibuwQrOJ1OpgdQ5aDAX4jPdpRzq7XclI8xZ70OIYuwCiC4fGZUHfqVGNZEotl
         qkVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HthiqWVqP09C774Wo+X2+3X+OxmFrfYWSE91BOkDjFN2q4l9JmPpfhkOR85sDFsCJ/BLNbuHUIsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp9TR6k+WGhdc5Gow7k/uL8VQkcjc0xTt1/j02BLFAT5A6Qf8f
	IQQNRzldpL8SSptxZ2IfWWRT4s+v7wdZinJ2vCVEFKhYRP6MTYSp1oIiUuO9qivwaf0=
X-Gm-Gg: Acq92OG9rXaX41Pt3AWJLU/INeyCeZ0ZTHXWeuObuOkl04Y/aNz5H2OO35X+HYlGk8T
	TBLYYWgdX7NuLLSGQPs8AaCUqnfEV+Jq/OPA3UARMl+xNJrlbQxXntBZgKWEWTlHTfcgnzI1vUa
	PC0xoPhL4xh05tih0vH4UlYpb5ODzHu8IJlRvSoVQDI3pbGLsPmQfwPA2W6FWUbilyCA8UzpkDN
	DCURXYyTkcwhW2I8ylV5ONq5cgYMuJFf30H/gZCZJSi+zZ/tlntnyrM9zISji2GpRspBVEzeKLC
	Tnox99o5gYQ546oBdDZgCYzNtEK6A22NTiGCGVrn0UhcuXI425u/VqQcvdrsAXsWEGNdo5KQ/Xm
	/DqcHKz6ojUVHtNKHqi7jm7/yeRQVn0ofo2pGBjDYDR/Uwm66IkhA1uA+cTcBAbwQk7Q9hVE8TV
	TNynnf9+XcvvllURwewuxYlJYOI/KJIpRGKHhr7hk+X91qJUXaeBnLKsHN1CjBRw==
X-Received: by 2002:a05:620a:3199:b0:915:86c6:8432 with SMTP id af79cd13be357-9158a6979f0mr317963585a.14.1780455442182;
        Tue, 02 Jun 2026 19:57:22 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37bae6sm118824085a.31.2026.06.02.19.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:57:21 -0700 (PDT)
Date: Wed, 3 Jun 2026 02:57:19 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 03/13] liveupdate: centralize state management into
 struct luo_ser
Message-ID: <ah-Wov2fvjYbpjHX@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-4-pasha.tatashin@soleen.com>
 <178038801487.119771.6308607614059754603.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038801487.119771.6308607614059754603.b4-review@b4>

On 06-02 11:13, Mike Rapoport wrote:
> On Sat, 30 May 2026 22:19:28 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
> > index 8f5c5dd01cd0..c8dd30b41238 100644
> > --- a/kernel/liveupdate/luo_flb.c
> > +++ b/kernel/liveupdate/luo_flb.c
> > @@ -579,53 +565,18 @@ int __init luo_flb_setup_outgoing(void *fdt_out)
> > [ ... skip 18 lines ... ]
> > -	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
> > -	if (offset < 0) {
> > -		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
> > -
> > -		return -ENOENT;
> > +	if (flbs_pa) {
> 
> I like 
> 
> 	if (!flbs_pa)
> 		return;
> 
> more

Ok.

> 
> >
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> > index 8d9201c25412..3b760fefa7b9 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -497,75 +494,34 @@ int luo_session_retrieve(const char *name, struct file **filep)
> > [ ... skip 58 lines ... ]
> > +	if (sessions_pa) {
> > +		header_ser = phys_to_virt(sessions_pa);
> > +		luo_session_global.incoming.header_ser = header_ser;
> > +		luo_session_global.incoming.ser = (void *)(header_ser + 1);
> > +		luo_session_global.incoming.active = true;
> >  	}
> 
> Ditto

This functions get's re-written with early return later in the serires.

> 
> -- 
> Sincerely yours,
> Mike.
> 
