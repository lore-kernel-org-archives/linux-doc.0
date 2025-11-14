Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12F623E355;
	Fri, 14 Nov 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134888; cv=none; b=SswmOO6CViwjOAxYF9wYedx1Ue9glv9gU4ICsbPms6StVorcZwX6J8ty+ze+n78WlR9xZTV0UnfBNUwKTWJCakMBLxtJ8OVwdEkwLYkJN1VyzzffdachkRj3zZjf3ZBec/rScL4NnN3CKJy6eKsIZZzuR9ZWECYFcFLHJ5K9fYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134888; c=relaxed/simple;
	bh=y+pujojxiP82NQHOLAud1w7yc1/AS5HOYUs4UoBXFb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd1y8Ym+7+2BmyLvThgEMpl0mCjEBQkmL0HJGT3KYyuim7/+JseT0t6yDNtFDVovdtMWz9x3C/eXJFxX3LLZXS4gIodA2oomynabxkMuzRuZWAR+auVroG8nBejHrat/wS0OAtBLPqtMYsTG4nhrDdyjoHMwaoLgSGJPaJ20V+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742701063;
	Fri, 14 Nov 2025 07:41:18 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE98F3F66E;
	Fri, 14 Nov 2025 07:41:25 -0800 (PST)
Date: Fri, 14 Nov 2025 15:41:23 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251114154123.GI3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
 <20251114153021.GH3568724@e132581.arm.com>
 <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2d2660-7552-4cb1-b974-87f376f153d9@linaro.org>

On Fri, Nov 14, 2025 at 03:34:32PM +0000, James Clark wrote:

[...]

> > > @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
> > >   					  struct device_attribute *attr,
> > >   					  char *page)
> > >   {
> > > -	int pid_fmt = ETM_OPT_CTXTID;
> > > -
> > >   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> > > -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> > > +	if (is_kernel_in_hyp_mode())
> > > +		return contextid2_show(dev, attr, page);
> > >   #endif
> > 
> > As said, this function now is only used for ETM4, we can remove "#if
> > IS_ENABLED(...)".
> > 
> > Otherwise, LGTM:
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Unfortunately it's still needed to make the build work.
> is_kernel_in_hyp_mode() results in an undefined symbol when building for
> arm32 so it needs to be ifdef'd out. I can add a comment though.

Maybe "#ifdef CONFIG_ARM64" is more suitable?
