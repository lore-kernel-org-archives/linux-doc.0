Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77F238C33
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526538; cv=none; b=b2q7wDx0S9upNDO/58W4rQ9fe5LO0DBE3qfwiZAZoXhJ+fm+65eMy2rvbNqOBmpbnuH+84YaIsB29k7XrMuHb0P5DkRpL9h7KGPkqKRZnQoVTTIaETOdD8nAiX37GGMtrGDCPbgaNTqPaBWsZtm/WT3zaXLvUKGkrq/58C8OKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526538; c=relaxed/simple;
	bh=rUDEqLaGKm6ZQUUXN90WHjd/zoe+fc5cuVujd6LddVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZop1Z76blu/e+UpVEzyWKx0K+v79oE+5fQToeGiKhrkFEs3vxO9afoRDznUe9G73ECj23u4f8DUH6ZufpStWSBnDstDtsGrSNWQZ8nGQW0W9Zlf/4degVkrpDdsbDpkDiqMo/ygmlDSMZk0lo1/wQZKAJfaHG2JPlutaDrrxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=bMEPNlUE; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="bMEPNlUE"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-435de5b2f29so1302181b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755526535; x=1756131335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mvgGnTzuqm5EUCC8liL9F7L/fpNCxBXVLfxe21l/PJw=;
        b=bMEPNlUE2svk3bDa3a8I9vzpTcNDMzqzDfTy+u9BMtR+GRrB6GEOMiuLWmLmRPYEtm
         W21UvFTU5uRboXuQphWnyBSmeunXvzwsdG7eJUy+5Z6QczKl1hqvH7cv1mW5vUWceWkc
         giBhYHhuLfqyYoXpvtv5UyD9LbSOgnZVf4dgGeJml1aW3ah1uuCGoibwr05iRknf7N5z
         eO6Lh1hmE2ZflhEK5mirYLY3Ct88gce9b8SicXRdLnyANk/i/96gMnLVf9EGdgajne0W
         9HUNHNKFpCm1eOQZnaD9zNaUTXdQe0eWAuj56ZsIIO8H5M673CM4iKrSABCgGUAv2BWT
         Z01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526535; x=1756131335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvgGnTzuqm5EUCC8liL9F7L/fpNCxBXVLfxe21l/PJw=;
        b=hJVirTEa6GlOe+CyW44yTuI+STdvzCBcMtdllhHzfmhtcww4iAEOhAqV8NTu67sX+Z
         4/AO6ToV1Z3GxrVTXmBDCDQpNwou06MZjcSW9Pbxt8NTR9GzRGnX1Zpjn5eJ+eP7v7W/
         gr31hJC00Fu7lurQjmkhY2AZxkg1b+XHKsRNA496vYVyFoxmlF13R09y36wNpC3vlZjX
         p8php4kRJXGAxOUzRHhimRe2T7RdhXnjBmNZuB9snGt7hLaTM7wvE1O2sZ2zt9owWgfY
         dexIAaeQuwAbXokZs+Lt346AUmHVRy1GMKau004hltnyvxB9ZK+RbPIhimRg+D1A70ON
         SE/w==
X-Forwarded-Encrypted: i=1; AJvYcCUuoILNAr70sMIkJvERfFTuWb7Vyz+g0ufL1yhlruG0WiXfRglPkpTgCl58XHmqlUTN4V/t84xMJ0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpqfM6nyMRi1mE3FHhMY06YWjIIs1QjRz2KyxHJWcT8C86sssw
	V9UtiDMhTV39j8uSk8RDyBEBJHfc4ZCbPqYdUu8VHa3+KsKz94YMpHGkK3ihomMxIhDnY08ZH5Q
	hLMkW
X-Gm-Gg: ASbGncuXcOexVbGPlUpuWORc2X5HU2JDrKDBcSpd48Ng86MrAZdeGD3EypMvS257UPQ
	442ckIUhdx0JfIABXYFj6hYwrXYHBVK4Wo5mWR+ivo4QtlphuyasG2URwTg0e+GRpGNwQa+SMeq
	OfStKqk31nzlhN+Zi+NJEcPTx0DBXPxmi4M8Zhagaj/nMxVp1s/M6nwaGif61rbSQ42FkT4zd/5
	9cSP6Bh2E5r/r0/FO4i5qTlhNcudMAo6cRWgRKCmHpyxc/+AiBY7tguENq0ti9DfehXT2ttqq8u
	KWUZL4Bcxa0OkAGmwRyv6PIU+0+A8Mz4JMo5vDJ2MZ+XQmiEutRNvY315g/prV6SMJkLgXtb
X-Google-Smtp-Source: AGHT+IHvo7ZOM5rHAk24hmKZc+hkAikSEtRWDKvfOcli7KYViAuT56UrJGkQ79fMBBVlt+XNlS5WsQ==
X-Received: by 2002:a05:6808:5147:b0:435:7231:74f1 with SMTP id 5614622812f47-435f5e9c626mr5304208b6e.23.1755526534821;
        Mon, 18 Aug 2025 07:15:34 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ed1e96adsm1821089b6e.26.2025.08.18.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:15:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uo0e5-00000004NAz-0Sve;
	Mon, 18 Aug 2025 11:15:33 -0300
Date: Mon, 18 Aug 2025 11:15:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alessandro Ratti <alessandro@0x65c.net>
Cc: kevin.tian@intel.com, corbet@lwn.net, skhan@linuxfoundation.org,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	alessandro.ratti@gmail.com
Subject: Re: [PATCH] Documentation: fix spelling errors in iommufd.rst
Message-ID: <20250818141533.GF599331@ziepe.ca>
References: <20250815153840.188213-1-alessandro@0x65c.net>
 <20250815153840.188213-2-alessandro@0x65c.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815153840.188213-2-alessandro@0x65c.net>

On Fri, Aug 15, 2025 at 05:37:26PM +0200, Alessandro Ratti wrote:
> This patch corrects two minor spelling issues found in
> Documentation/userspace-api/iommufd.rst:
> 
> - "primarly" -> "primarily"
> - "sharable" -> "shareable"
> 
> Found using codespell(1).
> 
> Signed-off-by: Alessandro Ratti <alessandro@0x65c.net>
> ---
>  Documentation/userspace-api/iommufd.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I'll pick this up to for-rc, thanks

Jason
