Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179F147C91
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799156; cv=none; b=OTRWMl7ZWHgYqK3ZTylNXFNJJ4XkJ/E2Z9YPEUxr4hRPX0npQVd0hgX0g9kxnqJu2M7K7EDp3VtNGWFEf/UXCI/cGZy0pZBwOxhPQkDF1nEI2kw1xPakHkw/scwAM4j40HGeaN5ka8fSX3a2ImeaN3MseJd9noG5uFURGFQlYnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799156; c=relaxed/simple;
	bh=iV4qip6noqFvRmg0+R4crLreWqZF1KJ9+3ujyzBCiGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtS7vSuPlpLfXeK+kOh5HJedqYE3qRXSiZwiiozmFSMACrWz9HvOjZ7G0SJOPUxeHpgaN6dt7TgEr6GFXPSD5Mz/3LIhkzWm8LwWo1x1t1cRH+G1zNq/3pt+7JPQvlEdod9+N3yPh7Pxs2CHCN0xajo3tq2Y6zf/29W79C6g1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=hAtqRDGd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="hAtqRDGd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so812754f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729799152; x=1730403952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPb8mKU+KzjeBNrDUNxSqXqnN5Ly29w8syBmz/sIRLU=;
        b=hAtqRDGd5/Dp3Qx77cngVdPP3Q2XeBY94seKUHJcbObv07tuQlFXITLSfaSRftacWC
         g+z7pM1U+JzqScRKTgeh4S7SEnBh2uTccxTBPXTj3GTkXVDvzwgaZqOmLjP0YFVzt3de
         we8arjDxpKEOylU4B/NbQN3+n4DrrUVa/7R73E2sX0D95lcp1yZV7F2ZLj1Ie7KUH/8e
         uCDoByP+PkmPCOEI6+CgLeNG01bR77MvVt2gtjkx6h/pT1zrAdw04R+W3n2UfJAbtB6T
         rQ9MFzXpTNlbTT5LSMCdbPWVClrnSvnzgFWdWaHZgf5HpNsVPTfi2o+N572o/mTBUWlM
         ExMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799152; x=1730403952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPb8mKU+KzjeBNrDUNxSqXqnN5Ly29w8syBmz/sIRLU=;
        b=RfwIONXR7I8fTFjv4NjNyrISUrgwldkZSnHqC+yWlzUmQsGSMaIoyOaxPAbqKGbGg8
         7FZd4pQ8v0zze4WyP/dszO/qBq7lAOS5WoO43Z11+J9+2QCuRBjY74Rd6ZQaTfqBn1V6
         6y0lOkKaUo7+FAVKp0ggDG58a9G9sHxJPIt090LjHKh9PzdF/WaChLZ1UYmMe4mvatcX
         Ez2DYGp7D5Xe0iW4vmZyG7njzW13Raf/z9bZ+QZzKhf71Vb2pi9WFQdLZFFK6tFblZk3
         gTgroZU8Dn3KG4Phu6ZxJCnbiMmK6wQg0Q3igZa2EgPpn37BswIwk45gwIiCWnmemaSt
         LxZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2CktgzLDzXJk6PUvdA3UyiQuPWxcLqbJfMJ7Gp/ev5tEWk0BbqJvH5l/B+ok7HgZ+EJRemu17Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnBOSYGvOSkoijhT+xnLP2yFUGadpbIQ9UYkIC/GFYHnpnXDi
	BN9EH1+Riw5AgCK4fg0z8QMSVHHSdMHkNyiE29xCvq66XNxd9jAntc3p2L64KIY=
X-Google-Smtp-Source: AGHT+IE1KNGuPkNPkWg4AR/AqGNEoAixnMnbilmy5HSq6ddD61ZBw/aVan4Y3rF9DyyvlVhbhsb4eA==
X-Received: by 2002:adf:e848:0:b0:37d:4fe9:b6a4 with SMTP id ffacd0b85a97d-37efcf897aamr4839640f8f.50.1729799152197;
        Thu, 24 Oct 2024 12:45:52 -0700 (PDT)
Received: from localhost (109-81-81-105.rct.o2.cz. [109.81.81.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0ba79c8sm12008716f8f.117.2024.10.24.12.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:45:51 -0700 (PDT)
Date: Thu, 24 Oct 2024 21:45:50 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [RFC PATCH 3/3] memcg-v1: remove memcg move locking code
Message-ID: <Zxqj7hw6Q6ak8aJf@tiehlicka>
References: <20241024065712.1274481-1-shakeel.butt@linux.dev>
 <20241024065712.1274481-4-shakeel.butt@linux.dev>
 <Zxp63b9WlI4sTwWk@google.com>
 <7w4xusjyyobyvacm6ogc3q2l26r2vema5rxlb5oqlhs4hpqiu3@dfbde5arh3rg>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7w4xusjyyobyvacm6ogc3q2l26r2vema5rxlb5oqlhs4hpqiu3@dfbde5arh3rg>

On Thu 24-10-24 10:26:15, Shakeel Butt wrote:
> On Thu, Oct 24, 2024 at 04:50:37PM GMT, Roman Gushchin wrote:
> > On Wed, Oct 23, 2024 at 11:57:12PM -0700, Shakeel Butt wrote:
> > > The memcg v1's charge move feature has been deprecated. There is no need
> > > to have any locking or protection against the moving charge. Let's
> > > proceed to remove all the locking code related to charge moving.
> > > 
> > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > 
> > Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>
> 
> Thanks Roman for the review. Based on Michal's question, I am planning
> to keep the RCU locking in the next version of this patch and folowup
> with clear understanding where we really need RCU and where we don't.

I think it would be safer and easier to review if we drop each RCU
separately or in smaller batches.

Thanks!
-- 
Michal Hocko
SUSE Labs
