Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8B2248BB
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597404; cv=none; b=PBaMuPLcIue1d6wp04480+Xb9MQfQCPMjEBIYv/OBf7sFzcV5cJ0WSuDlBK4k+/RlQ1EIn92Te80TlDtqkdMHCll/OTWRZPcTuY9lWg0DMz+AMQeLg+FmexKtaa+Iz2EHPij1TlZhNe3Oq+YQvXqlV4UaL6IFrNd2gwYekecZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597404; c=relaxed/simple;
	bh=dB7cfRMG6eYt3IOz3D75C3q+wK/A1eRQjvKm0OIGCOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekiccWw1Ngkrewo1PzqmGAE7JmTrpxrn20U8sEIoQFdNfIf79b6sNh48mievisn/SGt7dz71bU4iVmJL/f7Hw3c+gw1iowPzJaAAzkaYzgLGIVO07s5plHDz+3K6m4vXO65dAhipxRCiIskdgWMEsMhAyqo2uO+l20uVJ8x0CPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YSYgwJ+J; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSYgwJ+J"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22548a28d0cso40201675ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741597402; x=1742202202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8spwRf4xO/w3sEDDedsRANeKdgJJ1ne9O5afi/pXFgY=;
        b=YSYgwJ+J0dnNKxozaNlFUb0Ijc5dD5Wwyaj8Ke8Lnufda+x5cezgL2TT2Rv+yVm9+t
         VZNvkLPNrIfBkH9/QbsDcCwRwHvCG5B3h7wmX0mWru+9rxUB3rKX4DiG7tgDoyECZjY7
         n6mhMPMiETtUFqmm6bgxJLSwkpldiLojPlRuWlMSNs88YahUb2asVK+pEYLxANn1MR7/
         r1G7ALlyfbp8AemWXsFZebvXID/SyJcg4Xl0fO4DxEpcZjxO8ShSuel5fKvzkYg4jXbs
         GxCwnPXyhQqbnxRan4hyjq08xzHSSZev+8QXCIfe6N7Hzv1Ctrax7NUB5AGDtYE5d81a
         +2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597402; x=1742202202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8spwRf4xO/w3sEDDedsRANeKdgJJ1ne9O5afi/pXFgY=;
        b=S97JPkk5avJjaV7OfFxZpIuJpVkKni5C9h3KcJw4NK9hsdws8/ZUyrVBMnSSvuFhc3
         s4awTPFoYrdonDmxECzdMOUPwMaGVjcivjUIPJC4nOao1tuwB6Y1IxJhjjoi9CbNtky7
         sWmhmPVO0920Lw85DnSwqfyRuLTYKqpr5dgzdGyXAWJmhhNrrU4vSXyuUDrctfEIJjkN
         yG6lFQyVkrQ0stUkz8KNpz0s7xXWChF0nAcJLzlZK2TsfSKG04Jct04bMt2dHsfo0q02
         qkKAXw9WO4b/J3NiGeol3DvZoMi9+i4/aB+HlQwxlGY/qpkGVmIluXhBZJsyemEKLJMa
         BQVg==
X-Forwarded-Encrypted: i=1; AJvYcCXYS30EImhlM3KwHhdnExcJ4aN+vdcbCIQhFjRGZ8Exr8ACA7DLgjLcPUVDFsnKoNbbaCVMwDBfqm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vW7RykROO1aKFOSLPIjsx/yDvBszi2g/sV9pBUbgL44YvJnu
	KImpR/QirWZcyjW2U9p1PQ6M5CUEpw72LBaLrAvdjvq0HShkzJOIC7wjgRR+Nic=
X-Gm-Gg: ASbGnctfNaiJuoqkj0Y0gGuGGGtYEL+jyD0zNKvc9nIoK1cW3Cv3bZQEYfoeHRdT+0/
	81mvU3RxBP2BwZaAX6+kLNfyDIsUiMZYiRnIEn5o4HqYsFuoIQHYBwXyYeWeUvzAIPlvSZThR7X
	Ts/b8UCDLBpyILbmA1hnVMEwoUsXENq02OHdgcZeiEfQA3bWIj9KIhrZOP7VVqTECpBbiShjE1S
	MfUQZvLxW4Wn1kIpml8aXT92H6dA22jhvU5CtYuE6WiU2jcC+tfW8/Ur3RSOzunNCSadDZiG1a/
	S6isqboNLkoFgVJssZTAAkXA9OHf1WbQvhcLN4rCT5gaPg==
X-Google-Smtp-Source: AGHT+IG20Shii+wpINoEOGggIX/8XSh/36qhwdvrIDba/9dPKlSDd7dBJSgNS0S211wuxpSKZka4uQ==
X-Received: by 2002:a17:902:dac7:b0:223:f7ec:f834 with SMTP id d9443c01a7336-22428a9fedemr222858015ad.31.1741597402490;
        Mon, 10 Mar 2025 02:03:22 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e8518sm72631645ad.66.2025.03.10.02.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:03:21 -0700 (PDT)
Date: Mon, 10 Mar 2025 14:33:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in
 cpumask.h
Message-ID: <20250310090319.olwxrcqczwjla2jm@vireshk-i7>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
 <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
 <Z8snakYmzhaavkKN@thinkpad>
 <20250310061540.zpfyisvchyua2cuv@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310061540.zpfyisvchyua2cuv@vireshk-i7>

On 10-03-25, 11:45, Viresh Kumar wrote:
> On 07-03-25, 12:05, Yury Norov wrote:
> > >  /**
> > > - * cpumask_weight - Count of bits in *srcp
> > > + * cpumask_weight - Count of bits in *@srcp
> > >   * @srcp: the cpumask to count bits (< nr_cpu_ids) in.
> > 
> > Here nr_cpu_ids is also a variable. Why you don't prefix it with @?

Hmm, I thought @ is applied only to function arguments. Not sure what
should be done with nr_cpu_ids.

Akira ?

-- 
viresh
