Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44562D9499
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316912; cv=none; b=DnLe9OaF3jD4tIU5Tz1gZtSzK2OofM+3xfH+rgA1U0kOpU8wyohatfOJYrkrP99Dr5HQA+D4yp73OvTR2m4LPxuyRnRa8U7E84SCCNm71aqkHTWXIOhcoUNPF1eELilR1XfDbunJeHasX8entkHI5JNNyXWfH7ysMOZP9rMo+0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316912; c=relaxed/simple;
	bh=Zby18NWIZd9LikNKagpy2NdD5nLGxACKPIZ2QhLKgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvygJxcrW4ppzEYuL/HCi41tIb4JP3RbR/QbM5/Eju5oDsGrHYqip7EYBhMvHKKlO0WVz2tdQXKgiQUwwgjlzVZmS4SsAbJF9Ppuw0lC9zqMfOZ1v7rAt/+7OVQPkSv/jxLSmze4SBvrtp1pzGJrDXP9Oai8vzJSlXPo0eC9u6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JUDqJ7Bq; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JUDqJ7Bq"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b25ed53fcbso290094385a.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 07:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768316910; x=1768921710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zby18NWIZd9LikNKagpy2NdD5nLGxACKPIZ2QhLKgIE=;
        b=JUDqJ7Bq0RsedDLwBXVWeJnqte1agHdfmJpW4D3oMyijYOT9FZyYb/lZA3kKTB2XRw
         gyfU9kwV0TeSE04a3O3VmnVtqd7bVTFkruT2fCnUwcGCrTQfwJd6e8J8BiAXzwz/kcGp
         O2jKH5ixrGKkhciDqH5Porin2Ns7fdYIa3XT5CdEJQ03EjDwtoDKjxoqFQk/7pNfxOWR
         c7sjFA9dF4S0D5WkNL87lklDW8JnH9sUyYcyNbnsyE1tbSdFayN8Bh68dDmA29KviG2B
         tymaLQIg6NousnKbL62Svt2xCe2wPqPWnPkPwXARsax7E/jPTWotp4WsGK9+13dUZiae
         qc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316910; x=1768921710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zby18NWIZd9LikNKagpy2NdD5nLGxACKPIZ2QhLKgIE=;
        b=sRtR9ou24EmsAwk7LrUhVDWiMtITG3Sep0ANnNw6hmp6gK0yplyVISn7OwfY6X1OcZ
         k47hPX1tQUzYe6h+L6hGHRqn3wHsIJ7lu6r7dk8H5t3Iv6LwCRwerj7dT3HMeRZpbYWC
         M8m6mQz3spYlbaW2rilWZmpLea2NpHz+P2hPC0VoCLJqeXDKp/ElcJjcNwvOo6+R4Maw
         cULblr5Zv4+t/GkiZkvu3417j5BdR+92+zW/r61wGMjOJpnfTcqNdQfOAtPs4sbCOGKY
         lwim+mrBX8oQ6WqXn1tKT6h2ua4aw1GVaEq+O3giZ6b4swhGg8xvmudHmyLz3tsTE1YJ
         kYLA==
X-Forwarded-Encrypted: i=1; AJvYcCX3ifbY2igAbms10aOlZody0zocLTeMt1lc1neilcEDqA1LigQVz7RlPFZnA3rwVjRb1S6+hnBst3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZpf8YEgseLZHerLSznQgV5kq4iJvbv0a+GZavLT3iSixLy6X
	BunXHhqLMtLNsD0W1fhCYOHzdpg42qhzQ6UUEcH63WDjV/f932e6moR9INTssLy1Hl0=
X-Gm-Gg: AY/fxX7jU3S0O6n6pwa8NcPeXFHp3cUO1oeDOBt/KXmMgyxwDlzCY+MyB28sHDTAkJS
	FGkaSuV0kK5dSNV3Wl4s0gRDcO+CFhlsS3vxVvmqoiLP7l8sX1fVww24k4pCtzQI+RsHhMvjMP5
	LespQYAIwwkcJOlJ9RWKI2i8vkiEpzoWvzlM0EjD+cpjhbZUP82cdB435LjHy1rT4PKiAeiLMnW
	E/O9UTL9rd+POTiNdz1dvEKnornAdeW4F31j4wPi05o20eVQkkKkvUwjkJmmURltyXHcQgROQYq
	cY8UEl6I8KNBQ7/pWORafQj6T5ZTVCv7A/Zdh1hXc9+Hnqc4Tws8xBfsoxkMI85Hpt0CzblioKG
	G32YE498CzbXxeadJSYAHBEaPQeZHMSNjLoAO3IyuaQsfzBcqOviHVvVEzvj2ImA+EthBhFBjMa
	p9ozVAqgSbKOnu4W3RtWbmvT3pbIbRNF5jiFUrfIYyztj08bQy1SVatY0XT03gFkC+MiQ=
X-Google-Smtp-Source: AGHT+IEXQELOkUASiIG47wGrsPIeAZgzyEl1xKDO2iVvMsRIfq+sXO7FgFplrL2YHUPM6Jt0YgNMYQ==
X-Received: by 2002:a05:620a:44cf:b0:8b2:74e5:b3e with SMTP id af79cd13be357-8c3893a9e9fmr3015531385a.36.1768316909508;
        Tue, 13 Jan 2026 07:08:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm1696908185a.25.2026.01.13.07.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:08:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfg0S-00000003udw-1o8a;
	Tue, 13 Jan 2026 11:08:28 -0400
Date: Tue, 13 Jan 2026 11:08:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, xiaqinxin@huawei.com, baolu.lu@linux.intel.com,
	rdunlap@infradead.org, Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260113150828.GP745888@ziepe.ca>
References: <20260109195111.GQ545276@ziepe.ca>
 <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca>
 <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca>
 <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
 <746f5adb-1d91-4ca2-8ae0-a2d171203b66@kernel.org>
 <CAFgf54pbkfdFr6biE8BiNKBnTBFWxXGmvxsZ0E+C1C44c9AW_g@mail.gmail.com>
 <482f2f36-e906-492a-a80c-987bf7359d83@kernel.org>
 <CAFgf54ovfnTHmMuZGk73SEEKsP3k-_exR1wqUE4W9tLYKv_iDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgf54ovfnTHmMuZGk73SEEKsP3k-_exR1wqUE4W9tLYKv_iDw@mail.gmail.com>

On Tue, Jan 13, 2026 at 10:49:28AM +0000, Mostafa Saleh wrote:
> Would you have a problem if we added a new function in page_ext
> "page_ext_from_phys()" as Jason suggested?

Given the hidden complexity that David just pointed out I think this
is essential to encapsulate it in a function.

The function must be able to accept any phys_addr_t and safely returns
NULL if page_ext cannot be used for some reason.

Jason
