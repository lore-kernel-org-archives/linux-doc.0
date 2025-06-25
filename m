Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131D4189B8C
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833701; cv=none; b=pLQxxiqLeSOqG9/XGCJpKzMoKhmNoM4ThMMBMSLdF18ciDRGNOSz8AVdOhUYmN/w7TBRNLGF8dqpX7KjdTH27ZEnYY+hVQh7kMA6Aa2uVtzmSnPi6NgC/xsHxCv7q37ZoLprJjZDCnpKDvNmxXGk4OqqIubhPGB+xM/E8KvDuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833701; c=relaxed/simple;
	bh=VjQgB4d2oSebEr2mIns82XhjpF5sZibBpb/xXzXzJR0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpMEcnnt7BctoFGw5FOFcKEb8Yycovv5SD4kTXcKW0rT/AS8lA0rVf37Uzfc+uyGNhoXWZiMlIMmbi8CO2/70dT5us7UM67in/oHshF/mXdhoG4jbzidK8RGUO2AFtvQnC5r/Ly61LlW8coEWEGB298Shyx+PzSJXRAcQyJpGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gCzSYMhb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gCzSYMhb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so911384f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 23:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750833698; x=1751438498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv4j46Gn/Kvr0K34agGb6tcrNF0OwBTrFfOvFYIVMos=;
        b=gCzSYMhbvO1YxUuqxWbIzQijy7lZFL1v0S1jHa1Abt40+32aD6vNfxY9Rnu7ac+vhZ
         jxspAAsIdo1t03uN7vg1/qHfFNAcrJd2K5olYbuajh8T/w/ejv6tS7U3Gy1j0QWNy85D
         9n+st+be8Y3MvB8Vl4+3SSxHjDCJpRpJZWRvuMMUM4XoZilZS2vmRt1DZzWK8iRU2+Jq
         65KDkidny+SHskUKQchcUyrNx8EAAXBoijcnwQeM58rn3u3I7tbsqThVc+ibOJaVl1Vs
         p0WQ7CnbiJF9lzsn/xe9/p0FRHm9UI9qWEMuVBHXObkov+LeBCsuDkabpYuNdWwxq+bs
         DvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750833698; x=1751438498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv4j46Gn/Kvr0K34agGb6tcrNF0OwBTrFfOvFYIVMos=;
        b=FPnspzYNVIqdzjQNIMvFco7ww0wpWYpflYpG4VDTtyol4+MaOrfYeHroC4JLiJuR06
         FHRBBpngEWHkcv9b9q4c9uSZPwuRVFwYaXmmkLwu0VAvmOSlweyT7LhrFIlwmBu/q80K
         LwyezrUBx1tXcRgrr4Gd6obeEWqsNXZ5y+P0PyPB9bTHpbdsps9l1jIRNOv/i/hCmIwI
         unMKWsFIXG9W4uNLeLvFf156P3JkDGvb78ZSdXQ4qNaCH48EH/MLchkmtEXDS6+BlZF5
         R0cp/s6vp7ZjEOO08aeiSJ5Rz3T1xZCcYgzhxPTDfzOsJkTWaLZIMqi5r0C2NUBq9N5C
         /WFA==
X-Forwarded-Encrypted: i=1; AJvYcCWTYuKs9qsJxZUEB/NFgWHp+O3QxBViSmc8cP6qDyW5xBNLcMcHuOZJ0rcd4yPOJVt32I9jCkhB+9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2Iq1bj4TdlmHTiLzhWk5h+RYil0wEmjCeS/TEwrteOEI1x9z
	/CRdMcsFJMHXWedkPCLqnzvnkW3LI9No1/oqAGgJd/oG6AqHmZaGTX4heD852su3AhY=
X-Gm-Gg: ASbGncu165Q2YxZgjXsBatACbOkOgT9NFxB32nU3gzSntkJrs8cZTfQSa/Zhx3JfZBJ
	6BJT2oZBBIv72mOsgePqdIZQvm4Tl9WnVGz2MAR8diZpFKHt5xnBI+ICR5iUfOaSa2FKgPXSB32
	5g77wWUQzfbrjt5WPOrERIIPqst5OvuNcRf2B+/GPlb38pZz7igvPkP2ulUU3Na7ESn29jRwLIY
	XQJLzUGvKzjj4VnjBRxEhcZ9xXfwYAq2L0SlQRFsfcP55iqQ12WXqJgqpPOjuDYo+HVkQyCRCDB
	veOxIfGK+l3NnHH/Gnw/b7mMsdMcDd514TvHMRoGftnQftWHXbAZK+vU14YJTS4+SoA5uk3FCo0
	/pFi51Tf+6/ndCjxKG68lsCf6GnGTVCXWJoDiR90XbESnUVbaEeKswbmMwRqsGaXBuXM=
X-Google-Smtp-Source: AGHT+IE7FEwxOxfhEE+iSFV9n5lEc4KGhMLsGRyFhWyAeSVP2PCDplXp/ktSglgcn/Fs2s3oXQVjvw==
X-Received: by 2002:a05:600c:524d:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-453821a8633mr4333875e9.6.1750833698266;
        Tue, 24 Jun 2025 23:41:38 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm3646226f8f.42.2025.06.24.23.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 23:41:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:41:35 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky
 <leon@kernel.org>, Keith Busch <kbusch@kernel.org>, Caleb Sander Mateos
 <csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe
 <axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH 5/8] docs: dma-api: remove duplicate description of the
 DMA pool API
Message-ID: <20250625084135.02a1ab09@mordecai.tesarici.cz>
In-Reply-To: <5ea93880-72fa-46c7-b69b-82e2021aa567@infradead.org>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-6-ptesarik@suse.com>
	<5ea93880-72fa-46c7-b69b-82e2021aa567@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 19:40:37 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> On 6/24/25 6:39 AM, Petr Tesarik wrote:
> > The DMA pool API is documented in Memory Management APIs. Do not duplicate
> > it in DMA API documentation.
> >   
> 
> This looks like it works (from just visual inspection), but I'm wondering
> why not just move all DMA API interfaces to dma-api.rst and don't have any
> in mm-api.rst... ?

That's also an option. As long as documentation is not repeated in more
than one place, I'm happy with the result. Now, seeing that it was you
who originally moved DMA pools from Drivers under Memory Management in
commit a80a438bd088 ("docbook: dmapool: fix fatal changed filename"), I
expect no complaints when I move it to dma-api.rst in v2.

Thanks for the idea!

Petr T
