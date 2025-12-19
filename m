Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560E27EFE3
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154009; cv=none; b=U6UbFZIUegyvZDySO3P3qkXCsmTWK8xEPEk799fDY8QvNH8kbB4qhKYw2Fh+lwqSGI/p4zVWCCXsOLawWpcC2ZS/t6QspVxiW3amfiFlzZKm691+rgNnValT8dD/yXBrITsRyG0S5P/7Q6u6NBU81dpl9oanvXKXHf49b6aKUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154009; c=relaxed/simple;
	bh=NBuj7vehVfrpXLwgulyjPT0R37vSRcyvtRGC+VQKuw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exM61JYcnFFaHIjNRoeiS7ntpaYB5SXXK/AZ9j2YdSnAsYD4YKp86oLNijrvHWNcf4iKtpeyndfyc06wIL2kn8byCIPS9KvkCuGpFqeKkdEDacb8EajscFq3JPxGWcTyasQpxhXSrCepAe2G65u6eFauOEU9wYiNWe7II3/GJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Mh0w9yfN; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Mh0w9yfN"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b25ed53fcbso257963685a.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1766154003; x=1766758803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hW7NRm3sDPFQ7nrkAaNC4Y4Wd/wDKIKOLKQhRLlFa/g=;
        b=Mh0w9yfNzZWDw22maBDQgi4m9xla0R2GW5tXgs68wAQ7a6pwFggD3ZxUU2A3+22SYs
         n18Gihl6r4x9EGp9BvJywcUwqC0UBPLr1dX1ZOTisHCzxw+goEb8wWOa4ozEtTjwdW5d
         2BWRy6/IrpfkSNlu2nJuzeZqw66f+KncTY6Sadp9dlzBop5X77AEIDwAt9B9ktrSurjE
         SuWEc1F/je5VYIzRbU/UYxJy/OSiahTdCLsGOCmj0pjMwSjajuSL1jY801+WcDbEM8ED
         8wY6RqpI8kA2BgpuYi1qhV9azNFKsaOkJrhRqed0vsElItNJJiFD/vxc2eTbIPHLTEvd
         HIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154003; x=1766758803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW7NRm3sDPFQ7nrkAaNC4Y4Wd/wDKIKOLKQhRLlFa/g=;
        b=ltk/QN1GOZpYUMwAhTZAMLGosdxAx9sBHw5aL5DNUPL/C1yJohO6qllJPn56wRSHpv
         ZNy5GkKplqjYaPin1kvxA4HYBKSHjH+92ZoAJ6Ky/0G12l4CgqJWGyu5EgNYnD7veudw
         LWVy/d6CiS8t6/OMsI4eOIBbkyspsgjpDKioRvY2OVobP1qHTdnvbFJfgCwtCZG8jgns
         82EzJD8mDQmZTZt4s8rbqg/wrmQoGcrWoMLU/xfTsxKwibGlxF8ff+9RCdZCKO7AG3ZJ
         MW7ZVBHL8m/IPOMRMShfsn6MUemg6AL94oiSOJY2dA7lsUapkmHe5zd3UN+R1ht2xmwz
         UhKA==
X-Forwarded-Encrypted: i=1; AJvYcCXtG/qzq+tN7Bu206xH0LX1LZbVQLlFgfwTtSK3GRcY9614hloUPkPQ5wdqMwEMLVj4q6c33Mf5FVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUAQasDcuwFdFOgcjI51ZCAXG+5LAI2/LBdfvOpq8k/irBQdA
	SjVYnMfR7Pjh4BVB8yqOjAZUIhBpdzaEk+HsBpGQ8OJK5hLPhb4SkgKLFNKxglTXCkc=
X-Gm-Gg: AY/fxX7cY4j6xVNLIcl974iFPT/XOGyl4ti9uZWPt0oUmbbMJHiK6NNfK3gJJJ5oAEK
	bgnZTZg9Vm4S939ZKYdFm2IRRCLK6UToX99XSV9z65nr4CRoG1Kv34NzBE6g/Oike/DLccHVVwS
	vQSWJLwobMsJXqT6V4z4qWCHkfayoeEwx1fcWbbyT82sfsDkehqKlFw+T7408vzqOgsfjtupIfq
	n5SQvq9wM6Dzq/QQAD6xzqIHN9fPkZU3h/IKxKDlVn89cLbmws3WiygoYyGZFsLsln9rQjsMrrB
	0W+RguIqdVmMVzArF1HBVELWYU2utB3KVArtOIyIdRT2qCdOBHcoM66MUjNygste8xGv2O5MfG7
	Qax9/4SOt4U0WEzG64oQNdWI/fhdpB2gl7xArGaZJUM7uzM0QKNS1Wd97eimJZsko1qOHPyJSKy
	Xn7yPwLeLSyoszZe2KGATYDHmQqau0T+U4Xo44q2hr2F0ePE/zUQPXXMNY9MQU1PLH1eVJ2w==
X-Google-Smtp-Source: AGHT+IHYIJem5uFvmhfvke6poQSoVh8bw4dQD1q/LPyab5JVfwmTl1oj56sHyV4WyvlwsvYQx1rjSg==
X-Received: by 2002:a05:620a:4108:b0:8b3:3d62:67f5 with SMTP id af79cd13be357-8c08f65683amr458504385a.11.1766154003033;
        Fri, 19 Dec 2025 06:20:03 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm188333085a.50.2025.12.19.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:20:02 -0800 (PST)
Date: Fri, 19 Dec 2025 09:19:25 -0500
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	david@kernel.org, osalvador@suse.de, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	muchun.song@linux.dev, laoar.shao@gmail.com, brauner@kernel.org,
	jack@suse.cz, hannes@cmpxchg.org, mclapinski@google.com,
	joel.granados@kernel.org, David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v4] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <aUVe7Q90PxGBCt9e@gourry-fedora-PF4VCD3F>
References: <20251218151211.1237411-1-gourry@gourry.net>
 <20251218165538.b299508aacdaf7d941035ec3@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218165538.b299508aacdaf7d941035ec3@linux-foundation.org>

On Thu, Dec 18, 2025 at 04:55:38PM -0800, Andrew Morton wrote:
> On Thu, 18 Dec 2025 10:12:11 -0500 Gregory Price <gourry@gourry.net> wrote:
> 
> > This reintroduces a concept removed by:
> > commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
> > 
> > This sysctl provides flexibility between ZONE_MOVABLE use cases:
> > 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> > 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable
> 
> My x86_64 allmodconfig blew up.
> 
> > ...
> >
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -49,7 +49,6 @@
> >  #include "internal.h"
> >  #include "hugetlb_vmemmap.h"
> >  #include "hugetlb_cma.h"
> > -#include "hugetlb_internal.h"
> >  #include <linux/page-isolation.h>
> 
> What's that doing there?  I put it back.  Helped!
> 

erk, this must have been carried over from a forward port, when all
these things moved into hugetlb_sysfs.c - very sorry, I will be more
careful.

> But the build still failed because the patch refers to
> 
> 	extern int movable_gigantic_pages __read_mostly;
> 
> but forgot to define it.  v5, please ;)
> 
> 

doh, well that's just embarassing

Will sus this out and send v5, sorry for the time sink

~Gregory
