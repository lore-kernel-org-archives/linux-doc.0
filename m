Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92F17BB35;
	Fri, 14 Nov 2025 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134226; cv=none; b=bfMo7ZYRug+fJVSHDFvYUgxEwEDouQ6wQdguaqgkYrqQnnN1CjE4AZHCWE5Xf/eSfh1zkSDx6a3H8K22eZns/Iyn6ccc3gPxr1fdXZfqKARjRpFawMVas43DMg2ANVWywbfdrqrNpfYQcXK6J9R4/xkLLkuXhx8yFSsmVADd0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134226; c=relaxed/simple;
	bh=A35syVkOdwJsLq8PFB50WHrsC8Ya5dgOwr8am7fNh1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfjpA5dtLwRMRbnG5yIKVX2/uwXNKk89NW1ujGZ/Oea9acFmhlAcSkXIZZhvluhd1wZma5MpoZ1bCSrtYDydu+/JTz83a4pbn1CMHKM7Xuf3r2M83Z5WO9Ww8oXsmA5x7m/zCv9irZQhO0ZR/6dQd09pGkzTy+gru1Yaf52ORzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D12A51063;
	Fri, 14 Nov 2025 07:30:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14CBA3F66E;
	Fri, 14 Nov 2025 07:30:22 -0800 (PST)
Date: Fri, 14 Nov 2025 15:30:21 +0000
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
Message-ID: <20251114153021.GH3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:14PM +0000, James Clark wrote:
> The "config:" string construction in format_attr_contextid_show() can be
> removed because it either showed the existing context1 or context2
> formats which have already been generated, so can be called themselves.
> 
> The other conversions are straightforward replacements.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index d19e2568a0d1..7272e758aebf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
>  					  struct device_attribute *attr,
>  					  char *page)
>  {
> -	int pid_fmt = ETM_OPT_CTXTID;
> -
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> -	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
> +	if (is_kernel_in_hyp_mode())
> +		return contextid2_show(dev, attr, page);
>  #endif

As said, this function now is only used for ETM4, we can remove "#if
IS_ENABLED(...)".

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>
