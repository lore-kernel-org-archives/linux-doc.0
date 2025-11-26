Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6781E23EAA6;
	Wed, 26 Nov 2025 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764165719; cv=none; b=rUDLu7eFrBh+ZCMbQpXru3MUsSbxIxSW+pZ/uDEXuSAsi1A3ytVc5i2OY3q7DW5azRTgYo/RQ+ApEMPuPAJXIZc8byIpO40dvw263gG+irwUKjmKlqiA2Mvx38+yoadjDore7J5eqIOqF7Ms5fhZYxinOMJLl9pC3TLLWfGVlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764165719; c=relaxed/simple;
	bh=ai9zoFZ/rFbXtytL805Fuj+PA5zGMsbhcA5wNMOjdRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNU6ydta5Uje0qT5L4Q+TZSsJoCjtvkgVV/R4WLtrPmUO5NehLSxJgBjtc80NW9AnfnJ3gL98zVASWCIPjwv603yo1+onOMsGWscMOK8KloIPEIK4mhZLQmrCgVhldhtOaqz5g8dtGWnnxE7hksjh6dvxVmpzPKNGWFV+bF1pns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11A77168F;
	Wed, 26 Nov 2025 06:01:49 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130FA3F73B;
	Wed, 26 Nov 2025 06:01:55 -0800 (PST)
Date: Wed, 26 Nov 2025 14:01:54 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251126140154.GK724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>

On Wed, Nov 26, 2025 at 10:54:42AM +0000, James Clark wrote:
> Document how the new field is used, maximum value and the interaction
> with SYNC timestamps.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 806699871b80..d461de4e067e 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>       - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
>         <coresight-return-stack>`
>     * - timestamp
> -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> -       <coresight-timestamp>`
> +     - Controls generation and interval of timestamps.
> +
> +       0 = off, 1 = minimum interval .. 15 = maximum interval.
> +
> +       Values 1 - 14 use a counter that decrements every cycle to generate a
> +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
> +       - 1). If the value is 1 then the reload value is 1, if the value is 11
> +       then the reload value is 1024 etc.
> +
> +       Setting the maximum interval (15) will disable the counter generated
> +       timestamps, freeing the counter resource, leaving only ones emitted when
> +       a SYNC packet is generated. The sync interval is controlled with
> +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
> +
>     * - cc_threshold
>       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
>         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> 
> -- 
> 2.34.1
> 
