Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC2A921
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 00:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059079; cv=none; b=qEMAvJ7bZozNVKpXL0LLa2w/Fli/YrH3OA94IeKqqq7uwqRYLALQm8+IJUjUPwJMIhWwFLuo1FwF63aUuutRPKUIbaW4gx6pF6zuS8AlUfEbiXO9lJjgsyIuQ6ve38jw7tS97AmDO4nk3ingumiY5I2VRfbVnl9MWwZeEhoqF9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059079; c=relaxed/simple;
	bh=flz3KI+pObSKl6+JdCtMWPSPqM5U/a/duvHNej2nPwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5+jYowi2dY9GaZEkxp2t2XsE1V0fGkQ24M0/BL6DVKI71lazGlQlsNTIqVzPHvrKT4m7eN2PJd55eUFymXiMAwaX9o1H2gCmx2JhKHsIpd0m4+mxZCMC9WnSYhqvJpbg7igAnvxYW4wL4YncLBDQwm/qCzHP78QRsMrxxh7AkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Wuki6RHE; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Wuki6RHE"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab93f24dc3so70506631cf.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Jul 2025 17:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1753059077; x=1753663877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpYWz0hHkJ5czp6E2Ogh66jdWDkJrXo9PJQzqqTm/Fc=;
        b=Wuki6RHEfJTxiD+F6P9VAA1AmczSE7s1E/nTpYm5wXMo6RQaI/dAfBZclKatIhRU/e
         PaQUKdUzNB1sANwHNJc8vHB7Be3RN+BQf2NlQf6fiYTF2s+PM8UkFDgyFXqHF9N1GMOR
         ygIRhfnElJbHTvjFpEv/WE57CNYAaX2Qqvd2+yX+JEi7B8DqM7cZZW/FGUZuQJa3UDXG
         6ojn3XG84PX8fxjFLVJD+eWQXai8HrhrGUmiUA+SqpVANz2vzJugJgH6seHfYEoC7mhe
         cGToFNoETlcPnr0jqufQpODB9nfFSf5WXF61TCh6ZGKnT5IXGlMreHfUykz8lAkhYObz
         AYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753059077; x=1753663877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpYWz0hHkJ5czp6E2Ogh66jdWDkJrXo9PJQzqqTm/Fc=;
        b=m8oRJQsgKb+bLCKHYfaFuJKI934++wp96wZCZ5lHeNV66c/xeZI8kH5G2NM5oiPDKU
         ycvV3yKWjRSth8fd9FjXVl9EQV5Zd4ldAAghagOx7mLkGsBUMdEzWap4BSuqcQCcEZwW
         EfrWDHEn1YQJumjnci5xdJuXrjTl6pN8ik4Zn0vVy+MxzUc4Tf28969vk6WYMlfdfRSV
         BqLI7xrpxZXTJywryiY/83B71s2tRY9LVQOoHR6Ub0WD1oTgV3fiJbc5J3TUne4uan2b
         2bIF+enDGzI0npFwfjY0wRzeCF0jjM1Sq0uBm0O6y/jQff72JYNxYSIEdgQLU04gv2BL
         8uAg==
X-Forwarded-Encrypted: i=1; AJvYcCX1jGgvKvHswo8AO/5P/NJm1kGJphrO4wDm/Pg0xeswM0GyWSSspoB9eGbcO4aLy/Kf6F1eYIzGYHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytmGfUpyHh3w0v+FXWCdyNKkWQtlOI7vH8Cv/hG7hv53anx+WQ
	vQYiJOTLtB7tFKEcKOdQFWnTVxwPE575QFrlNYwi2tHkzK9ey7Y/7MMHk2OHLVCZ6dU=
X-Gm-Gg: ASbGncsTzI+qSquV73OQ/MIwwWvXz15gmmm3cxG86xTyHfIGDDwutf4BKwuZqEi35Sd
	gW+81e0oBh1NnY7NJV+zFTDA4Hya1437vjUpl4cLux5YYjjZDBgqkPjfPNPpTccmGCpFqNuYxUb
	ixDAicyFpRHW1fzk/HXJhiGrJDiDQmjc7H6myz4oOjrhzLUE3YgVTrOKQfAC4yVOFgUtwZ9WMat
	5nS8Sh+seRNkrhxX9f65VasEGQb5S3UpXjLYFccnY1zncVxbGIX+GSk2yxIGWAvHaG/9kDK1pMJ
	8UC+nJVXnUHLV8S3hOBP1+jznoFLB+FXqwCtpLHqLT5hp4XQYFr43BK8J8DhftpfZqrI7k1tQhR
	we+YsenBBwGxBsC+/jWBV8m2I2gysznhF8M6nJ3tkoTgvrR8x49O2Dl43q4/IFaqPgaib9Q1ky4
	BK7Q==
X-Google-Smtp-Source: AGHT+IHJ8BDCuM0ht9jJt2VhuA48Qsrq7u0dKStcaY7gkl2qUWPyhDCmG32ZpnKotK9wXF3jPQv7ew==
X-Received: by 2002:a05:622a:1a25:b0:4ab:95a7:cf9f with SMTP id d75a77b69052e-4abb2db8e1cmr169676251cf.54.1753059076774;
        Sun, 20 Jul 2025 17:51:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb4b204cdsm35378211cf.56.2025.07.20.17.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 17:51:16 -0700 (PDT)
Date: Sun, 20 Jul 2025 20:51:14 -0400
From: Gregory Price <gourry@gourry.net>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cxl: docs/driver-api/conventions resolve conflicts
 btw CFMWS, LMH, ED
Message-ID: <aH2PAju1rLxIbXXk@gourry-fedora-PF4VCD3F>
References: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>
 <1985851.b9uPGUboIS@fdefranc-mobl3>
 <aGwmFwGNmw8n9zGR@gourry-fedora-PF4VCD3F>
 <17128669.tgchFWduMW@fdefranc-mobl3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17128669.tgchFWduMW@fdefranc-mobl3>

On Thu, Jul 17, 2025 at 04:14:13PM +0200, Fabio M. De Francesco wrote:
> The table above shows a real configuration copied from an x86 platform 
> where the Low Memory Hole (LMH) starts at 2GB. 
> 
> The"HDM Decoder Base/Size" refers specifically to the CXL Endpoint 
> Decoders HPA range Base/Size. The first row of the table describes the 
> first window (CFMWS[0]), whose HPA rage base/size is 0/2GB, and the 
> Endpoint Decoder that the CXL driver should match with that CFMWS, 
> whose HPA range base/size is 0/3GB.

The only thing i ask is being more precise with decoder references.

HDM Decoder can refer to any of: root, switch, hb, or endpoint decoders.

Below you make this distinct in the explanation, but in the table it's
simply general "HDM Decoder".  All I ask is for a bit more clarity on
what decoder will contain what values to avoid further ambiguity.

> The driver expects that the Endpoint Decoders HPA ranges to be contained 
> into their corresponding Root Decoders. Furthermore, Linux fails to 
> attach Endpoint decoders to already constructed CXL Regions because of 
> the same size discrepancy issue. 
> > 
> > I think you need to describe what the expected behavior is for what linux
> > will produce in terms of the decoder objects given the above.
> >
> The expected behavior is that Linux should be able to match the Endpoint 
> Decoder with the Root Decoder range even if the CFMWS size is smaller 
> than the Decoder's, as long as the latter adheres to the 256MB * interleave 
> ways rule. Furthermore, Linux should be able to match the Endpoint decoders 
> with already constructed CXL Regions and allow the attachment process to 
> succeed. 
> 

You may also need to describe more than just the contents of the
endpoint decoder.  What would the content of any intermediate decoders
be (matching the root or matching the endpoint?).

> If this explanation suffices, I will incorporate it into the next version
> of this patch and also explain that "HDM Decoder" stands for Endpoint Decoder 
> and that the CFMWS HPA base/size describes the System Physical Address (SPA) 
> which the CXL driver uses to make Root Decoders HPA range base/size. 
> 

This explanation is better, just need a few more bits of data and I
think you're good to go.

~Gregory
