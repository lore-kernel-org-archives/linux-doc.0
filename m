Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA6920B7E0;
	Fri, 10 Jan 2025 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736515963; cv=none; b=ZJWZ3tGk8ezHrD3QXLl1C7ahK6jcEb/DQG/cY6JbxIgW1vstftN7bobC3KZ0fcoK6LXTZBWmbUP2EvJEEKrV1d3X4SOHYgBdpoEC+LtQf44SdbQZJSYSCYJJACHFc4QXBAZrLG4CyIyU7+W5W1UYoSrBzfKCqWkXFo+VyfgLAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736515963; c=relaxed/simple;
	bh=HbC+P+VqXKBV23+gw0jF7hQb1lMa1LqAQBO0LGjlZSc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRWvNbFWOisuX6emGk83TqiuBC6hvfjiFqWAGEen1IiK4y/+df0C8YJOyxX1fmELmKUzsrSqoU2vvXo5zRR9s8Q4ZgwNX/YBh2smGTISeW+rYMUX1eJTm0I2AT/y79EQ6zTzI/Q7tlImQtAkdlX17pjdWg6ehLxM10EGPdTv7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/0KKTYi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/0KKTYi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385d7f19f20so1098782f8f.1;
        Fri, 10 Jan 2025 05:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736515960; x=1737120760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saWRqueZSKazbb7wvwClhKntd6BUUHOVyljPsXjAe+g=;
        b=i/0KKTYiYQCqMc3SNdtJcwSrM9Jzjv+HCGvseGpdH7uWRZTao7KaY73ICLgx/YznYp
         BucOcgBpF6swKhn3Fl8ltvVn+EmzphiPkqyaC65vlQgDqITNcqWBs47Bune5hq5buLS3
         4sERP031ImMj03v86N0nk6v7QjoxuBG/h8+bXycDEd/3fZhmXnjRE/PADLw+m/8xiQ7e
         ji2fFqrJiCDMSR/LMLQwwmVbx3HTXEO9+ekCS/2jRzD3GLC4f7FCS5tkcArvN9w26gYI
         qcTSq4jtilZ9h6cTK5R2gaSFOcD5EG3ifRj1bfmvpzYVpnkOLVce8AjUrHjR2sZ7Pc3M
         etvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515960; x=1737120760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saWRqueZSKazbb7wvwClhKntd6BUUHOVyljPsXjAe+g=;
        b=Uf6GpliIOs/rW3DNbxv2RCCyvZbt9ynJf0xhcuEMD4rcTJMBZIAtS+9UlgIRAJY9zI
         xcoU02yeeXrU1C0pYp9Bdxdfrzz4AHmFBbs48+llJzVmD87JKlaD1aF2N4b0vXm/Bdai
         WjUgRZI1MnHcH8x/lF0yvlJsnaCzlTGChRXiB4+ak+9t5jOdqvbQKxp2DtNmxE8VcfPr
         0X+LfzYgoE6X3PA2DpSn00Q/AhAJkyin5ietmrrTkG+XZOrIfVTIAnEqslu2zSlfW/j+
         XFzzBknl1zezTH5FoT0emes5+7N0f0oy0jz92An8YO1LkUyjGTJV+NPOJlwxc68AoRMd
         PBMg==
X-Forwarded-Encrypted: i=1; AJvYcCWs0lSc0V6CtfPrj9ZPcA8NZr4lckc/fhBQhIqKK0rP1BwOtm7dV7cZWxcq7xaJPpmGhJiNbwGiobptjLTE@vger.kernel.org, AJvYcCWwJnFHs9qfecaaeN+ZXutH6Z4vbaqsD89kG5mjvHY+lb+IcOTWFHqjFAPFqvftp25+71VbFGRXpLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD7ydAjT35emMssZh9WBba0lpHSA2bkN7h+6N/SSb3IFOu7HFe
	ZeVtlfvD/WpsG41zwpH3PXxjLAPz6/tEQ24AmWbCLVqRtB4OZQ/j
X-Gm-Gg: ASbGncs01aOlOM8x2ys0HSS+8mqudW9ibhOaYwcbFyiqsX8rUa8dO5EGhLTjOv2ZkOG
	WycDN0L3qp3C/y/VMx53gqTMPEgOv3m7nZT8Z28/VmiwmslfAgp0XYyHxH9VYnlOFpZonijAYmT
	keUDlidkc6WmvywMzLH+/3BGu7XphYBEL5G24NXRBWs6lZ71a9UacK94C+3GBm+TU0LzfLDJ3RR
	111E3MegwFlsoTwSzsAHlG6mv67ZRpvVO1tlEkHZfBY8P4wAGH08wOeBL4RuAq6fHfEFE4XojuU
	Dk1zqMYrdepQPDQG6U4=
X-Google-Smtp-Source: AGHT+IHDR20wTEJaXBw6GYlyjA58UJfabcULYEHtl8dP90dVreDbKW6+n8lhR4KSYy95KJZ+Ejudcw==
X-Received: by 2002:a05:6000:1789:b0:38a:5122:5a07 with SMTP id ffacd0b85a97d-38a8730394dmr2794933f8f.15.1736515959785;
        Fri, 10 Jan 2025 05:32:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c7aesm4642403f8f.53.2025.01.10.05.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:32:39 -0800 (PST)
Date: Fri, 10 Jan 2025 13:32:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan
 <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org,
 liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 11/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <20250110133237.61dd14fb@pumpkin>
In-Reply-To: <Z36UafdgGTcbvaun@casper.infradead.org>
References: <20241226170710.1159679-1-surenb@google.com>
	<20241226170710.1159679-12-surenb@google.com>
	<275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz>
	<Z36UafdgGTcbvaun@casper.infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Jan 2025 15:06:17 +0000
Matthew Wilcox <willy@infradead.org> wrote:

> On Wed, Jan 08, 2025 at 10:16:04AM +0100, Vlastimil Babka wrote:
> > >  static inline __must_check __signed_wrap
> > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > +bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
> > > +				     int limit)
> > >  {
> > >  	int old = refcount_read(r);
> > >  
> > >  	do {
> > >  		if (!old)
> > >  			break;
> > > +		if (limit && old + i > limit) {  
> > 
> > Should this be e.g. "old > limit - i" to avoid overflow and false negative
> > if someone sets limit close to INT_MAX?  
> 
> Although 'i' might also be INT_MAX, whereas we know that old < limit.
> So "i > limit - old" is the correct condition to check, IMO.
> 
> I'd further suggest that using a limit of 0 to mean "unlimited" introduces
> an unnecessary arithmetic operation.  Make 'limit' inclusive instead
> of exclusive, pass INT_MAX instead of 0, and Vlastimil's suggestion,
> and this becomes:
> 
> 		if (i > limit - old)
>
...

The problem with that is the compiler is unlikely to optimise it away.
Perhaps:
		if (statically_true(!limit || limit == INT_MAX))
			continue;
		if (i > limit - old) {
			...

	David


