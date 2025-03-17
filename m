Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842522222B2
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203449; cv=none; b=HvVAgprqX4sVDhfBpSN+p9cyeYzaxTHSf3KkcN+RulaMNvLpc9GuH3f7jJk5Y4zFQTO3ktg08WuDs/By4GA2Lh+H7gL+kSpdroiGG3sbqrQH5qj7InkJr7xf118sjyBFxMHYrpvcLYXYk/bqldxl09GYhXAGipJhALg58a5cPjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203449; c=relaxed/simple;
	bh=n20nGFxTmcJaZG2reuyyngVL2ZIPOhrefpjSOvNbBzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwz7Ns+omE1dzNvWPTxE2M4AavVB4qC/Wbu7C0qpN4ePFaw3aRreHq1zplqsAfqbyNF8XpVfCU0/NDgbikvg9BBJFGKCTTXL0jsX1vVIBYPLykGU+UOLwL5vffzJ0RgMVVhNS/XUg7a/2USz4Ttbb7WJyZyA98zISJd03cOQs68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xy/tzjt0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xy/tzjt0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22423adf751so64173515ad.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742203447; x=1742808247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qX0t6hmEl/ttFwtNba0D0ghdF1Z5CR+NbGCxyEIf37s=;
        b=xy/tzjt0G76DGeZ+YqH3trc1+czZxDUza6y5SNjHEfjkXJlQbjs2nk4R6RgizLAB/8
         J8RZy35kWjoi4kiznEPSthe+/yCRU4QNvp1icYHTrJOgcfb5ZCNYt7kxQVtNWYFxNLzn
         PlN5SRjOUhYxYpqZkuoAn32MoX+eYXQU4HKzhHcTx9wZj7sTnKBss/NiIVIMC5GS1JRm
         GWWa8b3eA5Y5KGvno5lmRK4Y1ATOc7drWzbisOKpt9Lg4/LJ6wzKu4hcVFT+lPXoq2Gz
         9kGs+L2Re4M3OugBI7zMZGa+plzb8VUKZvTPBltKdbVa+j8IGyeHdBe0b4sk+nae+j9m
         G+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203447; x=1742808247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qX0t6hmEl/ttFwtNba0D0ghdF1Z5CR+NbGCxyEIf37s=;
        b=BVsEbiWAVQ2OpY2A6kXZJoHHv8e1ioxpITeASNGdoI0BX7rW+o30APj0jkmoh+Xh1l
         Nx2kUFBHWhHkMVKTWEc4GRNyXRtCRdEvx+1sNKrm0xYONv3HQkLVEYWN8ZbMl7W8MtBy
         LBaWE8TCUPwrVUhdRCZTt4qAIGOGyns429I1TNPRkzFEYvnIYkGIIqITpg3ux1rrON4V
         OwoZJs1wG+DEWg72G1052onUCikZxE/sYLFVsd98YgEfgTblXdJTCZ68bboqdxs144es
         bHQkJb+Vc7ZuEZxsSdPlYfUpF9Thf+WA6A69vDy9MrVJ6fy78Pk5gOiyFvLVNXClkNxT
         ZPtw==
X-Forwarded-Encrypted: i=1; AJvYcCUI95PKR1Eyk4F2HzZpax+WkJfPzqdeYhF6wKTTzP05yrPZ7TVEwgBjHtRHW2Gds/cvIXpPri5oqQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIUOW6Rb6x3IxJjjB9PUxQK0Lr0dsH5VjsfCyK7YLCIqmc/69a
	dKC/XIQyQVtEMs60cKJocRwnruhVe4v9Z77rqpmVJ3iYL3PMXb55q+dUf66QXuk=
X-Gm-Gg: ASbGncudDYu48rLwZS/WfreokodhFnAvBYhnETLwl1KworztKH8yTSxhxAkfKA7U0Xh
	HFuAUvUcK8IHezoSm1sM6zv0nQOH/5LWcNoIfA8dLe/eNEfeZ8Bd3CWV6CZcqnWVQk7qd3hs7eO
	9peRh+TaCVtsr0mWCtbRdPJK8+7yZxAUUTzBn4/qQeRimsyIy7uZmgkL5T03HK3SWeJuvVMPHxd
	zXY5lq+abUUnPoU2FR0tjez4Ued/HdPJhb3v41rdYOib4NQRXsQASPyahNVE72I48PXngxyQ6je
	tSXMMR3s/sSTKUqWw/Yzs7rKfLvFivdPnrM4MFBmrMXK0g==
X-Google-Smtp-Source: AGHT+IGJ/2dHOLsZIbIG2tr0KpKh72aCjWHwXgPaFwja0OjiG43diYcHNku0fI+Vv1FDoPAaGUSjNQ==
X-Received: by 2002:a17:902:d482:b0:224:1074:63af with SMTP id d9443c01a7336-225e0aef7c4mr157534905ad.34.1742203446830;
        Mon, 17 Mar 2025 02:24:06 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883fesm70839775ad.6.2025.03.17.02.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 02:24:06 -0700 (PDT)
Date: Mon, 17 Mar 2025 14:54:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>, Akira Yokosawa <akiyks@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in
 cpumask.h
Message-ID: <20250317092403.uphmlx7u52ntvih5@vireshk-i7>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
 <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
 <Z8snakYmzhaavkKN@thinkpad>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8snakYmzhaavkKN@thinkpad>

Hi Yury / Akira / Mauro,

On 07-03-25, 12:05, Yury Norov wrote:
> On Fri, Mar 07, 2025 at 01:04:51PM +0530, Viresh Kumar wrote:
> >  /**
> > - * cpumask_next_and - get the next cpu in *src1p & *src2p
> > + * cpumask_next_and - get the next cpu in *@src1p & *@src2p
> >   * @n: the cpu prior to the place to search (i.e. return will be > @n)
> >   * @src1p: the first cpumask pointer
> >   * @src2p: the second cpumask pointer
> 
> So the question: if some word in this particular comment block is
> prefixed with @ symbol, can we teach kernel-doc to consider every
> occurrence of this word as a variable?
> 
> Why I'm asking: before the "*src1p & *src2p" was a line of C code.
> And because we are all C programmers here, it's really simple to ident
> it and decode. After it looks like something weird, and I think many
> of us will just mentally skip it.
> 
> I like kernel-docs and everything, but again, kernel sources should
> stay readable, and particularly comments should stay human-readable.

I was looking to get a public links to cpumask APIs, like:

https://docs.kernel.org/core-api/kernel-api.html#bitmap-operations

which I can use from the (WIP) Rust cpumask documentation.

Can you suggest how do I move ahead with this ?

- Let the warnings be there and keep the comment as "... cpu in *src1p & *stc2p" ?

- Something like what Mauro suggested: "... cpu in @src1p and @stc2p" ? 

- Something else ?

-- 
viresh
