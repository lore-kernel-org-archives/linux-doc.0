Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA0220680
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201623; cv=none; b=VuKJqMvUQvrBGhK9rW8j6dYa/Tx+wvU41WTdAB+END6AoNgL11qROpBvanAbLYTeMxt3UnvpcHGDDvCye+hY8jrWwifbNRKsEwMF2FU7goPJJLQvRjTrQpmylYi18S2uA73LiYLmTW3/JE6/xh1K8oOMpVNSqALtnoGBEJkDfUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201623; c=relaxed/simple;
	bh=5TLinsCFZY6ypy0cnZ760RF7CdaufS9N1m06Lm0tnw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rek44V4GdoWXEdRYL7EnBa+IE20N64IbgFXMwKlUA4WJU0tj/X345eCgvDKuZgl6EQStGjRf5eqctIfRPFvT2mHFor70Ik4YfFB8WKo9LzHGXAYp0ct4wBLWDu1K/nq7dUAxhAqPzzVNykKnjV33p+V2Xdo/9NJcrRGi440yV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anG/Z06Q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anG/Z06Q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2239c066347so80850575ad.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742201619; x=1742806419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1gfFdT9yc0ID86bAZQcBXC/s8a7FX9Kfok55CN+i30=;
        b=anG/Z06QSOhuaHYtTZZNDN4jrc5wAD1zubQKxfrDEye3qYCrDdRBwOTuGtpLmttUfK
         3ZiVnzR5M5s1H5/TIvFcFFrCsGs+1jtybSXBcy+8ILEWdI16pjKpS4aAiH45IAuwjVuI
         b9HXo400YMy7IuXWwD/RcUGEqbYacwdzAVdEKtaeNTSM8XRiElJzRar6/VJu8NcTmYLU
         PK1cz+10+c1xXxamovm3jY+cweWnchFRLkNVjjRNWcwCKPlFbWA2zAXH7rMjH9PedCJK
         aDbtpe17gvdxjMle57L4SPARnVzNZNh7NKvFkoimpHdAU1R4sqiLtEqfz5UjnPpMGfJj
         o4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742201619; x=1742806419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1gfFdT9yc0ID86bAZQcBXC/s8a7FX9Kfok55CN+i30=;
        b=BKM4t+FqJvSuwTetgtGSKYRjlAEL40sDnHLDqJW88cktTV6UNhfhfqU1NVmRCQ6I1V
         WvfAXdMWn7oOVwmnaSliwBVe276yWvfuBy11WAzaiYVX8ynKMpUQxmOqQ6vjVu5cKi0x
         vVn4GbjHFc3WAG8sz5+lODPW5XN/n5tFqTYzIWSNQF2SEk0f5bXyofgjNHTK2Z26+NyD
         RxlWzYsdwLJzhF/F1lpLyl+7jyF3YNOTd5XCjrj6xMFXS16rQSDzg11ehf8qR6U2l0Kg
         5Dfwvs/Lsvax/pllyIRRIVzUpBE96dvjekz6gWY4k7511WKK09JiaQ5Gmx7wEAXfNKBc
         EEeA==
X-Forwarded-Encrypted: i=1; AJvYcCWG9T7mOdL8BVUMrx8NfE1laaFhfAzW6+YqW4HHJiTGj8L8DXp842rmQfy7x2lFo9GWXx8OLH55kbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv68Gk6L6DwfXA1KWowEpul3Dy2Cit8cxPLBtJQB3ObCAE3788
	/PlrXJZKZN41QgnwDJF2WchJE1TmiTwjTAtVdtV2maTAzpq2eDpwiLmj1gv8jpo=
X-Gm-Gg: ASbGnctp/IUe50Jk2enj8Yi2ukt6W0legaZRNbkZz7l8yMEdGVFlKwgxdmsHvsS0jU+
	jfZjJO26Tm4Y+Xwymtw9O04xjughmk8ektKqLTNjIkVpWECOJI3XvLOj6BkoIL8A0zOhtHkW1y8
	+Jr9zc9c+AtLOpfw6jp/3SwJB7vR7XKDasdM8X5ih7JODcg59lzKTtayGLZxN+6uP6iB+c9CXgN
	AJbl03Qu+D5rX9UinMFQ/E9XyJRHq60mxo3vyl5weitrL49L53Q2fIvfdrTo2hoLEO8VkFIq0CH
	0MGm1I4mZMHln2A9tY4bqoBT38Ui/U0Ye8cAgSDqNBJ3Gg==
X-Google-Smtp-Source: AGHT+IFDNnj2E/5Q4qSJV0JJLbClWNS4V04i4NWCWhKijLjJLsNAdu+JYl9z1X7dvEDSsRoDUhQEtw==
X-Received: by 2002:a17:903:2f86:b0:224:93e:b5d7 with SMTP id d9443c01a7336-225e0afa057mr167261555ad.34.1742201619619;
        Mon, 17 Mar 2025 01:53:39 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbeb89sm69895575ad.204.2025.03.17.01.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 01:53:39 -0700 (PDT)
Date: Mon, 17 Mar 2025 14:23:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in
 cpumask.h
Message-ID: <20250317085336.tlmuvpq663m4krkb@vireshk-i7>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
 <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
 <20250310155301.6db5033c@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310155301.6db5033c@foz.lan>

On 10-03-25, 15:53, Mauro Carvalho Chehab wrote:
> >  /**
> > - * cpumask_first_and - return the first cpu from *srcp1 & *srcp2
> > + * cpumask_first_and - return the first cpu from *@srcp1 & *@srcp2
> 
> I don't think this would produce the right output. See my other comment.

I see. I was only looking at the html output earlier and that was
showing up correctly.

   return the first cpu from *srcp1 & *srcp2


Tried with "scripts/kernel-doc -rst" now and it does show

   return the first cpu from ***srcp1** & ***srcp2**

-- 
viresh
