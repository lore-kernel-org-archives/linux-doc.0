Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC8F3F1659
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037821; cv=none; b=PwHfjBXlBl2YO3hw85jbM/F5WDr7DtNUEJcdKbreYPG6puAizDtnM8HgGYT6gxb6bO3rk91twzBC+lm/YD3jOdZS0iSrf2EZVLx/fq/WOAuamJNmiQs7yy1Plu5OJyjCaQ8WqyvZyojQrFp+PO5Mf63OkiGwKwpbL+jEEeATWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037821; c=relaxed/simple;
	bh=x7vkr5xuv03n5zI2/6X6/P9TOOIWoiQal4W8kv8GZCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4+qq4LJJJVZVJWPlar0fpMQVdZJYr1g1RwYOj4ULNCkdqMarFe9eJKhFiCHV2/5TsGcT38Ip7g8Ys3UJBp48qfyd0XCK7oZL6VCE65/fAr/wkgZnEfXwPTMIF7mSZZpf8MXW6qabA6vrfTcuM6kP6B1bSnExrXrdNQEyAUglos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LfD1dCie; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="LfD1dCie"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6a397db52c1so2234355eaf.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784037817; x=1784642617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIWNtYbjtsZ0PQI9/iIL6fWurRq5Hy1V2922aR85kK4=;
        b=LfD1dCiegdJE37ELt9oebGIyXbPcxFRMQ6YoHYmm/+LW0FfWf6YTFaO6D5uYvrZUdT
         Qvj4EWYiBbvvRiD8dZ3CW/P2N0jcKObP5KbUyhx89LCwqznKgDT5K8bdFwWixULJ3PSw
         H/F07f6MQ4il62sG/Tq/jVNGNjtxH0I+CFEg6MSgyDn03WtKo3p6MJ7cLxs7T3/Bvu09
         8lUPSdIu5kDGGino2Ze6UhKQPH313+G35l34TaZcC6sVXd22Xj7XoBNRIp3NcqXt7Reo
         TMY6zkEQksLU+aMVznW0UmtwmIc0QcTbJ0mdR9/rfBnwOvaDNLRQjszHbuoq09qrpH90
         oqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037817; x=1784642617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIWNtYbjtsZ0PQI9/iIL6fWurRq5Hy1V2922aR85kK4=;
        b=a+0+j2QGNa9C+OsX4+OaCDVC6Yc2ODl1IHj9rzdfRISNAKnouNZtBeHK5XiJyNUVB/
         MZDCs4a0sPX5XilxzftT+y/orrHYRVbZ7SjUvvG9TYKJWATlVUUx8HaP0qPc/wq/edMR
         lYdhtmVRc2auHB+iEXKHrPKf4WQYhF9pqSizzoGm+sRRZbCvXUez1s6UEPnxwN1yvxt4
         RZSfaDxk7Uhb5zJy/pAotX7EEuiNj13/lXcT3XfuNFywxDFnSFQQJCLpoTBWMj+MxfnV
         BaZI+qH6p3PMyQViqnsbrGi0QZJCrYgMV0eFYr4bW2XFCe9HXUQfaBSZ6HDCcIPzGT+0
         na3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8OVzHDLrdhSf+snetzTMGVqFuKVFGawOeF5TdviEoJOzlUXu1qktuRiCopb/gRArajRJ/0bFXozZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YybByYLM9/ldU6ge1QIOZm2rWWA6TJ5v+BrZexwR799MSZZqF+j
	rvEjwmdrp0ZDy67OQvAoOPq3nXOZgvalGtsN583fNu4g/wPLaCx2vXq2s9IGyA0RGl4=
X-Gm-Gg: AfdE7ck4PeVrmTmr1vdL1gOT4ZMH0mnnbb4yOx0qHJ/A+c9S9Kds3qk0jm+SfNTd5hh
	tBHGLOa8Xdmt0RZuoKMVCFN+q5wjmM48A7C2E0wE4q8gWxvZe/wWceyc0TzvgN9D+Tf6NGSfVE1
	GPwQT6QfSJPnLtauWukyWnEH59q8uxTJaygr9GWRfG2qocMDaGhfWUfl0oZSg6/6pljp2Iv4jyz
	64tqLQfWNc8UGcRwIeZBc/GGO+57L55K55U1zRGpMiQrhJrTYWmHdp3eRFhfynVfVgNLIonxqZq
	mdy84WHzCWtUffS0kGpERGMm2dEDCMIAa8rv5e+mJEoTVjUYiMcxBUHmYcQEq35lEX69zHt8Pan
	Y76Ovr4J0vo1WRUTEv+ltgugU3BCT54/cCFh6DQ/96NwdlQ3LGY5UnrRRInOZAOpsrZl8EMM=
X-Received: by 2002:a05:6820:1f12:b0:6a3:1dc5:3557 with SMTP id 006d021491bc7-6a39a5b34bbmr8055289eaf.16.1784037817485;
        Tue, 14 Jul 2026 07:03:37 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1521115685a.45.2026.07.14.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:03:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjdjU-0000000FeUS-19dr;
	Tue, 14 Jul 2026 11:03:36 -0300
Date: Tue, 14 Jul 2026 11:03:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, fustini@kernel.org,
	pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
	corbet@lwn.net, shuah@kernel.org, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 1/7] iommu: Add group lookup by ID
Message-ID: <20260714140336.GA3716926@ziepe.ca>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>

On Tue, Jul 14, 2026 at 09:06:51PM +0800, Zhanpeng Zhang wrote:
> Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
> the numeric ID used in /sys/kernel/iommu_groups.
> 
> An ID lookup must keep the group object alive without also keeping an
> otherwise empty group active. Embed the devices kobject in struct
> iommu_group so its address remains valid until the parent group is
> released, and return a reference on the parent kobject to ID lookup
> callers. Add iommu_group_put_by_id() to release that reference and
> iommu_group_is_active() to detect when the devices kobject has become
> inactive.
> 
> Serialize lookup against group teardown with iommu_group_kset_mutex and
> only return groups whose devices kobject still has a live reference.
> This prevents a concurrent lookup from dereferencing a stale child
> kobject while allowing external users to discard bindings to empty
> groups.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
>  include/linux/iommu.h |  17 +++++++
>  2 files changed, 113 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e8f13dcebbde..da269d10f6bf 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -40,6 +40,7 @@
>  #include "iommu-priv.h"
>  
>  static struct kset *iommu_group_kset;
> +static DEFINE_MUTEX(iommu_group_kset_mutex);
>  static DEFINE_IDA(iommu_group_ida);

I think it would be better to change the ida to an xarray than to use
a string search on a kset..

Jason
