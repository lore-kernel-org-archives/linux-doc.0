Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1DB217673
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346898; cv=none; b=oy9jr0yNBEpZnNM6OItYpgFMdz7xnaDSGfiIuINfFMrwiEHo8Qqh9vUZWh+sgoPr6SSfvruLz758PfwYuoAdILlsXhCwPkWvfIk+O/Bjs0ERTtcz+NtDT5ewD5kbPQkVNxC/GirxVGoAbkoS8/v1s3phBgYFaa8c0FE82UJmIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346898; c=relaxed/simple;
	bh=77bK4Zp/TbJCp4MDtt6BamPlf5APkGCXJN1UMIG44Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5XgkyFtXxnu8mYP5IVhUDE6sxmXcGZMF1I6mSE6zP/VTkf/miDISVCsP0icd42ZscqW3MAc2A8l2zO52XFC8ezLUHnb2OyTR4Nw537+isc3bmWUEnLL4tDanioiij/HnRtv27WPpFVjhIzDZJfD4qtanGUq5L6eDA9yE8I/5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTKeeARZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTKeeARZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2241053582dso2420805ad.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741346896; x=1741951696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KHuSHjoctZDpRbteDuBYEVJTRxTt8Y9MylCsxslIVY=;
        b=jTKeeARZ+bslbWFsD97aEFoRpd3SqFTHIvLlPCYh/OWWxpUdWfW/WncupTBctMd1ME
         zbmA2dGyBK6qs2gUhtl5Smk9M1Uc+qWlqpvFtd/41xpfEs2UZDlXXZ1BhsgGzPXRN1md
         t3LycwxvDj1sO2F4uhnHG5zbfKTyVBnButv12EsUGIb/DToYzCBQ68I6jRutYSU797Qa
         Y1iHZmaoWjcPZOZAZW74HCNZPUdeqtyYobyUaKuYxfZ4Q8Art9amBCU/ecHaxkq5b5pZ
         ehbieWMyNiOI5IuVZrz9dtQCqSUUBx1Cxa5gwKpXgqOBadcCDGfVSlrO6RMECIEVgBAq
         644Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741346896; x=1741951696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KHuSHjoctZDpRbteDuBYEVJTRxTt8Y9MylCsxslIVY=;
        b=HzRUdn/9NbeQ6IcBcf+qLdKG13v2NqVA2xNjDolZgTq8sDgjnpnpGV/fnVX+Ii/B+f
         srJwO9TRm1e/txLUfIj6Z0g1CQCZPz7rvs4kuAoTDxmaKpig/VXnRtZ/rLAkogI3UeM9
         53UOY8mVVqn8YLpftw41JQfbzud9+exPUGXmLRjDBrzAvueUKAIXJ4rQ+qw1+1gz53X9
         z6wD/zi4By5Owfl0E4FqAQiNc55hGJdysCZwlL42aPeMt0IInTe4Wyg7al0OKM2L3unh
         2BokRjEgYUyoEPMoszUyIiuF4chb89cev16Aqsc9s0JAqu07X4+FdQnlYxAJkIBUaFYm
         teYg==
X-Forwarded-Encrypted: i=1; AJvYcCXmVJ0SYOWg8dL+oOT70zD0ULoXqAtrOeM7PU8qKYaM728bQb6WkjYxPxlx3C/uOxQqbaeSjXPUqvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YydxOthoPiinDpg2O51sE6ZA2ZA/cHzl2850fB80v3SCEndRh/d
	R7I04f3pBE+iIPMy1C6Eu/pShEcAJUHmyQqP4UCtrnD4AOJaqWFZrKw7CJ0l5uo=
X-Gm-Gg: ASbGncuD99P1ZNAAKuZT2C2kZHeSpS7Z4NWuRooKfIJLxU5gqMAnGsbQjYXZ9Ril4+x
	3fJLFeSXR3PSPZlqJELSvVJruUs74mSHq1BPgcVSERr0zke+++3hcv7nTOm/+imUhSxrSGahrZX
	jAk6q4jdQhXW93tnea/VMXPafY7FJpJT0SqQNCVXBrSFqHqYBtw98mA8pxWO20lNgDFSaR8hkS4
	e8UClYI4lH89KLNBsuhsQ+kWn0rSTKONVIePq1eekPw/PZulhaPcck4Lpty50fIwk1f6VPZx5bU
	Mlv6FWJHrlVyRIXx1eO70jRJLkoXCeZ42TILWXq4s9Rm+w==
X-Google-Smtp-Source: AGHT+IEvps1aGNeyDSEfmuS/2kZ/UIoJVeC4FQ3bEv/wYy7E3JSdL5e5iwjVJ47HjPenjvhwUyieNg==
X-Received: by 2002:a05:6a20:3943:b0:1f3:289e:36d9 with SMTP id adf61e73a8af0-1f544c98c99mr5849762637.40.1741346895822;
        Fri, 07 Mar 2025 03:28:15 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f7281sm3085274b3a.94.2025.03.07.03.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 03:28:15 -0800 (PST)
Date: Fri, 7 Mar 2025 16:58:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH V2 1/2] cpumask: Fix kernel-doc formatting errors in
 cpumask.h
Message-ID: <20250307112812.3la74kiomyqbzhk5@vireshk-i7>
References: <cover.1741332579.git.viresh.kumar@linaro.org>
 <f4ad81150eaa00b43c161f0d1f811f8ecfe21889.1741332579.git.viresh.kumar@linaro.org>
 <e3637b13-1f51-445b-8d9d-bd53a691eca3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3637b13-1f51-445b-8d9d-bd53a691eca3@gmail.com>

On 07-03-25, 19:57, Akira Yokosawa wrote:
> Didn't come up in your diff, but you need additional changes shown below:
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 656d2208467e..a6c1961cc535 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -285,10 +285,10 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
>  }
>  
>  /**
> - * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
> - *                        @n+1. If nothing found, wrap around and start from
> + * cpumask_next_and_wrap - get the next cpu in *@src1p & *@src2p, starting from
> + *                        @n+ 1. If nothing found, wrap around and start from
>   *                        the beginning
> - * @n: the cpu prior to the place to search (i.e. search starts from @n+1)
> + * @n: the cpu prior to the place to search (i.e. search starts from @n +1)
>   * @src1p: the first cpumask pointer
>   * @src2p: the second cpumask pointer
>   *
> @@ -306,9 +306,9 @@ unsigned int cpumask_next_and_wrap(int n, const struct cpumask *src1p,
>  }
>  
>  /**
> - * cpumask_next_wrap - get the next cpu in *src, starting from @n+1. If nothing
> + * cpumask_next_wrap - get the next cpu in *@src, starting from @n +1. If nothing
>   *                    found, wrap around and start from the beginning
> - * @n: the cpu prior to the place to search (i.e. search starts from @n+1)
> + * @n: the cpu prior to the place to search (i.e. search starts from @n +1)
>   * @src: cpumask pointer
>   *
>   * Return: next set bit, wrapped if needed, or >= nr_cpu_ids if @src is empty.

How did you find these ? I only looked for build warnings / errors earlier (with
make htmldocs). Anything else I should be doing to find these issues ?

Thanks for your help Akira.

-- 
viresh
