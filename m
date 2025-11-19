Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857B234F469;
	Wed, 19 Nov 2025 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563078; cv=none; b=R1/A7eMQdavPUpUBkKVgyjMW6WL9EDKUn4xTPnopcNhQ8kj+uI8mwyzg+Km0z2hJlwGal7sKfhZ2Gvjl8ebkRh/p1N9UPVMD5yVehr3YL/oEY14IhEPANSkbZF7eN0IaiGSoCbs6O5PlPjQnSeNVjwYlQRLDeAaloemO9FHytc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563078; c=relaxed/simple;
	bh=jWujOwtyeSsmYMGBysKjOhp9V7DxyqQv84UUvK5JwW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZCX7unp0vZvZ8Z5ZR5r8nGmGunLKyco+7hZhvyYSPD//e4xtn/bza8+v8QiW2A64OLcoWbfWJ0fjnr5QSxPgNaoT1jNw8bwKHDhWnKOks9tHb6nG7gQ1a3r95X1Ic3u3aMmQuCqIAyoQDXsQIsSPrii+2DrARfJCI4tMVSR/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0BEFEC;
	Wed, 19 Nov 2025 06:37:46 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0A403F740;
	Wed, 19 Nov 2025 06:37:53 -0800 (PST)
Date: Wed, 19 Nov 2025 14:37:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251119143751.GD8204@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
 <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>

On Wed, Nov 19, 2025 at 01:55:15PM +0000, James Clark wrote:

[...]

> >    static ssize_t format_attr_contextid_show(struct device *dev,
> >                                              struct device_attribute *attr,
> >                                              char *page)
> >    {
> >    #if IS_ENABLED(CONFIG_ARM64)
> >         if (is_kernel_in_hyp_mode())
> >                 return contextid2_show(dev, attr, page);
> >    #endif
> > 
> >         return contextid1_show(dev, attr, page);
> 
> Not having an #else implies that the contextid1_show() part is valid when
> !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON because
> it's dead code.

Based on ETMv3/v4 spec, would contextid1 always be valid ?  (Though we do
not support context ID for ETMv3 yet).

> Personally I would drop the is_visible(). It makes sense for dynamically
> hidden things, but these are all compile time. IMO it's cleaner to just not
> include them to begin with, rather than include and then hide them. Then the
> extra condition in format_attr_contextid_show() isn't needed because the
> function doesn't exist:

This is fine for me, though in general I think the dynamic approach is
readable and extendable than the compile-time approach.

Thanks,
Leo
