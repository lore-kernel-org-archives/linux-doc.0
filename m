Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4081B21A9
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761246; cv=none; b=gfYd4EQ97eZ2dWzSgMlihZ/Q7Xav6PeMdU9chiTtrnDFkgju5qRMwHDImifZgRp3KSneBMpIwrgWr4BHUpR1YhyZXAmHFnek2Gsc2jyw1C5//01m3k4rpVsqy7jZrk88VcR+I8f8lsOx9lWIdFPn4D9VV5um5FjMrfWVhQNvz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761246; c=relaxed/simple;
	bh=avpK6tUcSJyxEr2R0gQ1mEBxd/wWm8tXZZZXLNlYYuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1IJneARk/P4en//Rm0KA95WKWMKScLwLkbDUKMd/3rML7nr8ph4WIGDfmenAWgQ9I6qjV9s8x0tteTajwZC/hh+/n1nzVjGWNMU+6NeuYHQ3EJ3gU7rZMVq0ucFFTKbNttBn0QCC1EJDC615ODDCNVqX+oW1wsYU+N1uvqeLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aGwT6WrJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aGwT6WrJ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d41894a32so472262f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 02:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729761242; x=1730366042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C1TB/Q2XIMnswl+oxbdIOcW6rv6E1hiXPecGzghRmFA=;
        b=aGwT6WrJO3xM8T7cSU9jWv/B0IW9djxGZ0rJIMbb89VgOZgT+fziGcsKMu/tTFNOR7
         jorQMDWo2/62WjufMn813RiMt0/YJYuTZm2W627UkN8Kf9ANtZhEx61dWJO9psKTbNgJ
         4Mhu+/mCD4qWXF4I0jeBhsm2hMquIz/a3Kj+8pIUmPnwBka5pfFYESeNk5hwD4ipEiko
         2O8wtx3bk3cbpI9ptI8Lj1tRlkzZRQJd4jhC8MQo8efzq/H0diY5n7hF/W+B4a4u1chs
         pKfAokPaWkXeRQPCbXbHLtVJjAsO+bXbBNzfwPNvgKZUpe+XHEwJ6iwrl4sQdIzlI/Ne
         E/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761242; x=1730366042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1TB/Q2XIMnswl+oxbdIOcW6rv6E1hiXPecGzghRmFA=;
        b=wETnvL7598WLqe2HXgvaNN5w4FmXAl2Sq/xBDyc7AdA9cZTI75ukDs4kjQdZeI+Z8p
         i6v14230muQuWbkNepD2EdpzjvZaWettVaM4dkVfB/Uq7GaAXezZZwSPwcnQg8YzlAzR
         r8zi8sqQWL1yLEp1VXP260PQFKVty95hGhx8Czl/nir59/anYlpHK+PfhRs/fDScExup
         Oa7H7hzKsevXA9CUS4ikOl87A/1PH89zqM+/hzC458p5/NltdDvub0+Ff4OYrJIO8JEs
         eZ+CS0IoMUyCkQpP1uaGvPUjSCfnLDV1P6aBLejUofJYXWjrgJxIBaczzP8LDfVN42x0
         0Phw==
X-Forwarded-Encrypted: i=1; AJvYcCXj36xgPzkgRJ+ZpruY7T/16JFNmTWgh8u92E2UMUYED+EyiV16tKGre+RnGQS5N4O/M9AZHxZItck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOBN8EPX0bT49440b1NdZ4wsircs8TKKw0tdzEK+QB2ALHasTS
	EgT3XGNEywVIC8XT9hvIEY07bXGI+MyOkuFJq0WU6KR9D92jxg2K0wFulLlbwlw=
X-Google-Smtp-Source: AGHT+IH0FAdozsb/aFk6DgRgsawnhV0d3I7f2qAuMC29RAOVCnDBw1CjfFrUTETiG6wfB7DtjCmyuw==
X-Received: by 2002:adf:f10d:0:b0:37d:39ff:a9cf with SMTP id ffacd0b85a97d-3803abc5251mr845102f8f.5.1729761242477;
        Thu, 24 Oct 2024 02:14:02 -0700 (PDT)
Received: from localhost (109-81-81-105.rct.o2.cz. [109.81.81.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd6923sm40205915e9.9.2024.10.24.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:14:02 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:14:01 +0200
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [RFC PATCH 1/3] memcg-v1: fully deprecate
 move_charge_at_immigrate
Message-ID: <ZxoP2TLCGnSm9c8p@tiehlicka>
References: <20241024065712.1274481-1-shakeel.butt@linux.dev>
 <20241024065712.1274481-2-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024065712.1274481-2-shakeel.butt@linux.dev>

On Wed 23-10-24 23:57:10, Shakeel Butt wrote:
> Proceed with the complete deprecation of memcg v1's charge moving
> feature. The deprecation warning has been in the kernel for almost two
> years and has been ported to all stable kernel since. Now is the time to
> fully deprecate this feature.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

I fine with this move, just one detail we might need to consider
[...]
> @@ -606,17 +606,7 @@ static int mem_cgroup_move_charge_write(struct cgroup_subsys_state *css,
>  		     "Please report your usecase to linux-mm@kvack.org if you "
>  		     "depend on this functionality.\n");
>  
> -	if (val & ~MOVE_MASK)
> -		return -EINVAL;
> -
> -	/*
> -	 * No kind of locking is needed in here, because ->can_attach() will
> -	 * check this value once in the beginning of the process, and then carry
> -	 * on with stale data. This means that changes to this value will only
> -	 * affect task migrations starting after the change.
> -	 */
> -	memcg->move_charge_at_immigrate = val;
> -	return 0;
> +	return -EINVAL;

Would it make more sense to -EINVAL only if val != 0? The reason being
that some userspace might be just writing 0 here for whatever reason and
see the failure unexpected.

>  }
>  #else
>  static int mem_cgroup_move_charge_write(struct cgroup_subsys_state *css,
> -- 
> 2.43.5

-- 
Michal Hocko
SUSE Labs
