Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44D1DBB36
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730123635; cv=none; b=n1FpkYGLbdZFo/uhYoFxPKIRBi+I6GfpxXmqEkqqPl7Fa6/HZVPIvsfiu7hX4TZjiOp+E/A+iAJ7+80txUxG3LmTko3XcDqXAXR4w1ktZSXlYEHDyzBeNzY9NHa+pjiN68CILkwCL/p1r9ECLJZgNH8vbViLQtT3wr/g5eM60yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730123635; c=relaxed/simple;
	bh=L5IFAGdxLKk4RP5WLTAZCi65fPYxfWuR27gxz1ekNPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyJgiHdLehZLgpMB8sdAbZNL10hIPQFj8G+loWeGJhS/P+Xz8U7QHKpFyfwuEUdDInQnPGvPnB3VVAnMKUr2nNGUsCeHJFA0lz7Z/yC0d9dMa1S38S4XDjBjw/a3p3YJtEBjRCgeyo2y82fIPk16R8nkkLxWDvxZLy8nyFrokSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=dk9vHumB; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="dk9vHumB"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b1457ba751so340300385a.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730123631; x=1730728431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrmsujUgQJ5BlGaZvf5rEXiek96RGTOcx92GlV6YM4Q=;
        b=dk9vHumBp4Ou8nakV4bmZm2GVSphMZEAsG/abqDET5MBRnNg4LnVTWtih80bMJwMOz
         Ir59+SLDTczbS3cwJyjQXlq5NNq8DNSeDsDE9bGSaVVHD4EhBWMJFucJW8ZAJn47OW5Q
         vHQNyNCn4xLPCHIkX7hAxvY6T4UDIC+u7JWKhdhn8WW6lFANLoAQdIAuNGYd51BGHgCZ
         d+ewLqcIiGb9ctsMvs4WAygBLbaReRR34AP5qIyeg7m6xn9JvFtGOng9KexL/gOyehdz
         G6qnvFcsjIRh/QiiC/74WvWHnWKoi1t9EigKkh6WYTFp2NxfEq2v510F25ne8igPXDAW
         d3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123631; x=1730728431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrmsujUgQJ5BlGaZvf5rEXiek96RGTOcx92GlV6YM4Q=;
        b=HRJuC3rCcy0UgEvw2O3e5llfF24cF4boBlomHSegdNLRTZ93KpFDAtB1QxzVZdz74O
         2ZHySNNpAI7HlCsVWrYpAbxi9Q27QNIiVSvzEBnsYJZd1jE8pGoBOJ58EJlMuphaKtRj
         R3Bcndoxhs1SrIqM+Ly8Vft/wQQ71iL4nB/Np0sCTVNOyGATCl347sv0+Pw2sU+Mg+hU
         BUmH5/HvWXRVRCN11foICrFpBmZ5xOBbThG/rUDhqme8eFuWCaq9/dkiG5NNnpg+ghma
         8jtv5yoKKo+8gKzoT89ubB8ZTKn6yC3nR0PPtAT4C2aWFSV8b2nUayE0lBEweJfkAIcN
         RY9w==
X-Forwarded-Encrypted: i=1; AJvYcCUOs5Y1+IJpStpmsdEIYqB+qsLDYpWTnyCOsMCX8Er6MHXrMdOaeqvhGqFZz4d+w663vQMFpi0XsEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqy9ZI5nPxmBbMdf56/bkUDII/TRpYsfjMjqJ9ra2lo2YynLMD
	7JdW2GzLR45X/MTc/oXwVtZLfG5IfF2WE7GK7Ri1uxWNct6i276e26d/F6KVIg0=
X-Google-Smtp-Source: AGHT+IH40KuDHrVOWhkEyQxVYIBNRcqoqm2Gc7OFJ7y7QxKdJ+GlPWy+DCSBDUatY4TQu0/pwXFjgQ==
X-Received: by 2002:a05:620a:1709:b0:7a9:783e:3fb1 with SMTP id af79cd13be357-7b193efb057mr1458081785a.23.1730123630974;
        Mon, 28 Oct 2024 06:53:50 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d2930ddsm319958485a.42.2024.10.28.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 06:53:49 -0700 (PDT)
Date: Mon, 28 Oct 2024 09:53:45 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v1 1/6] memcg-v1: fully deprecate move_charge_at_immigrate
Message-ID: <20241028135345.GA10985@cmpxchg.org>
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-2-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025012304.2473312-2-shakeel.butt@linux.dev>

On Thu, Oct 24, 2024 at 06:22:58PM -0700, Shakeel Butt wrote:
> Proceed with the complete deprecation of memcg v1's charge moving
> feature. The deprecation warning has been in the kernel for almost two
> years and has been ported to all stable kernel since. Now is the time to
> fully deprecate this feature.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
