Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48117C
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734619466; cv=none; b=BML5yvpRXcW85SyjFGzz8ClOODbNN+RNEXLTv+oZ+F1ziG6M8Z3pzSLWWC7BPdV/Cd3131aBwLD196YzqdXMSszKX3igS/SDQ6kyG96q0YAJhPcXDmRQUjZR+i8gkTFP/itT7+gYjuBJG/b5yJgLzCEYwvNtPZ1ZSOLdKVYgg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734619466; c=relaxed/simple;
	bh=kuzNS9K72EkSrNeLIVLdw6jZ00C6nGxLQgNNkN4fUXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfHjJoocURhM7ExmDWlTOYqWpvQSI/RyZqsMmFs3PPWNT7yscoTAbaibRaOV2asLj0CThFOVD6fkBivn5I5tRX8Fc6P51YPZUFoOCZBAXoITFdC3VwlybDx1RD61cG8cUwOrHD9jdZ+2CUqHfKtY1y+NdsqJUIihWg41KWrT2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YDlLqmwq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YDlLqmwq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso9793365e9.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734619461; x=1735224261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUe8L/RSJG7X1qPU8YCoCZFztQIhaGAvtLCydCuhUAE=;
        b=YDlLqmwqvuSeLVYSYfeKdn3Zfsvrc53LUH36k23y2JdV14mWysgKFmbZezRaZwhljR
         +y7rpaWlpOWhnig/LkDhgDxbUroY1tAWngBBUy8Dnxyej3nE/h3gJfENRsrDuuUZPx7C
         7ew6MNPRHPZDm+OGDt88FNGW/DbsqSVuAB6iTkVD8+j5Geh2FX901kGxL2d9nDUWDqAl
         VSRq+o6XjsOqBVbVUU4G3TdgYm9wy7F1nQ0NYXnzWUW39FsmnB/ATIozCk/dKCxyYj/2
         6Rv+zonOlHt856ZGyP0pZNX1Q9LzxkwP5f3Lomy3CuzX7b9HP99FmY2HjV4+m3okH7da
         t+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734619461; x=1735224261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUe8L/RSJG7X1qPU8YCoCZFztQIhaGAvtLCydCuhUAE=;
        b=Yk2J+NQjfhRUfgcyuevASa88Ec15UlAJZShhjpau/d4tXRtya+UszA0xCVKpI7AJfS
         yzNMptzDCr2BBEGevWPAUeeEcJcZwtMs5j7keatr3nGpTyg/76dS3TAAeG6qD2tCch5s
         Zb8rcbMSFtdu9FKBZSPDfFHeJPKAufSaJnpOQ2jZBF8dz9pR6SEe3rAXVgNJx+2AOFFj
         PG1uO4fPRxHzXJ2/C2px583bbzsEWOcIBFBJdZhec4d1zXQ2rRum8yAQzPgzMKABAYtt
         4MdPTGub8TKk0SJS5up9o6uftYoFWx4mdH5NTdmnoDFYeMIHeeTGfZSK2C+hlVl/0/e8
         43KA==
X-Forwarded-Encrypted: i=1; AJvYcCXwqy085Yn18aZG8vUfT6M4akr7xu8wHq9oJxPgu8PQTWdlhYa2QFTsbWlSKm17ed6U8LOTMYNOydo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdUExpTmSP0KzJy2jSed7lbQ1F2lzwCB+9hHg0JqSW5Ixg73t
	TJIBmEdGMjGaovsczWhP0GvpCsE//6Qy0H6wzOJgJuBEnz5mRW4VLYq4XGvB4Bk=
X-Gm-Gg: ASbGncv4JElPGlniuwLSqba3A5IUgvxWNQ/3oBraJS0nzHCBZnBeNBGPLQ4RKiBHayn
	7WV/GRpyUns1Cvq/8QYYvw5A6HrjeH7gGTmZZ6em7IhYobEi4SbeTxmjqVsw2G8wcESt6r4ytKC
	XRD1TAh+SlrHkpRHxKvPJGAGXfpQXGMrttA6ugDOm9U2BWzYQWtTG/fTJMFdl43FgN0bP+pyyV3
	fBxfzy4GlwvfCIUnu/sRHgi10aNvWuGxpR5LHzxT83AMPo9nZASoqWoMg==
X-Google-Smtp-Source: AGHT+IETUPBPDpfMGSiHPHr2l+GQu1KRtFJb1OUCyY4yEHQND0y6u+pyC88kJZkjcOETPOdloGbAvQ==
X-Received: by 2002:a05:6000:1867:b0:385:fd07:85f4 with SMTP id ffacd0b85a97d-388e4d64711mr7110212f8f.31.1734619461577;
        Thu, 19 Dec 2024 06:44:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm1677939f8f.107.2024.12.19.06.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 06:44:21 -0800 (PST)
Date: Thu, 19 Dec 2024 15:44:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Rob Herring <robh@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: ssize_t: was: Re: [PATCH] of: Add printf '%pOFm' for generating
 modalias
Message-ID: <Z2QxQhvserbVvmrB@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2KzcORZocQAwAi9@pathway.suse.cz>
 <CAL_JsqKRpeCgd=6PeHMHnZaJHqn2SAob2J6Yv07n7OdCY++GWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKRpeCgd=6PeHMHnZaJHqn2SAob2J6Yv07n7OdCY++GWA@mail.gmail.com>

On Wed 2024-12-18 11:10:54, Rob Herring wrote:
> On Wed, Dec 18, 2024 at 5:35 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Tue 2024-12-17 12:37:09, Rob Herring (Arm) wrote:
> > > The callers for of_modalias() generally need the module alias as part of
> > > some larger string. That results in some error prone manipulation of the
> > > buffer prepend/append the module alias string. In fact,
> > > of_device_uevent_modalias() has several issues. First, it's off by one
> > > too few characters in utilization of the full buffer. Second, the error
> > > paths leave OF_MODALIAS with a truncated value when in the end nothing
> > > should be added to the buffer. It is also fragile because it needs
> > > internal details of struct kobj_uevent_env. add_uevent_var() really
> > > wants to write the env variable and value in one shot which would need
> > > either a temporary buffer for value or a format specifier.
> > >
> > > Fix these issues by adding a new printf format specifier, "%pOFm". With
> > > the format specifier in place, simplify all the callers of
> > > of_modalias(). of_modalias() can also be simplified with vsprintf()
> > > being the only caller as it avoids the error conditions.
> > >
> > > --- a/drivers/of/module.c
> > > +++ b/drivers/of/module.c
> > > @@ -8,21 +8,14 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/string.h>
> > >
> > > -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
> > > +/* Do not use directly, use %pOFm format specifier instead */
> > > +size_t of_modalias(const struct device_node *np, char *str, size_t len)
> >
> > We should keep ssize_t.
> 
> My intent was to align of_modalias() with snprintf()...

Sure.

> > "end - buf" passed from device_node_string() in vprintf.c might be
> > negative. The "buf" pointer is used to count the number of characters
> > which might be written when the buffer is big enough.
> 
> Isn't Rasmus' suggestion sufficient?:
> 
> buf += of_modalias(dn, buf, buf < end ? end - buf : 0)

Yes, this should do the trick. I sent my overview before reading
Rasmus' reply.

Best Regards,
Petr
