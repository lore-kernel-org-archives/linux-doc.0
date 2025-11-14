Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B6D17A305;
	Fri, 14 Nov 2025 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763122845; cv=none; b=AvtTVPEKkqBHtMwqijNFz5agycw0OBijB3SNuTk8pylGW5NZcsoVSMH75cribH7rZaaUMZSUmW2LAM9KWM6icWc4Q0Hrap5TRqxhyVs9nCoGMc+ONEIPAwW3NFdVR3LjOiBKjx2wx3JJmFnuqN8ogUsdkFjytPIFYPmztPXIqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763122845; c=relaxed/simple;
	bh=jpvozaHG4+jD+ualmVsEsHUAszeagXLUa6ovxM3VTzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5oUEqQJ1im8CIxFE8+Fzoe+YclwEU+oPLAw+NoKPDc+5mibrMOynFCsKNSk3NWFc13mVbt6dELuPY03xiNqRS9nfg8yzaAn4t+mDJ8R3yX7X0x0ybBBSoKvC35P0qif3K0tKRMkE4ZwL2g5LFkFlzrzevTHBAc494eKAMT5I18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8C081063;
	Fri, 14 Nov 2025 04:20:34 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8A213F5A1;
	Fri, 14 Nov 2025 04:20:41 -0800 (PST)
Date: Fri, 14 Nov 2025 12:20:40 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 01/13] coresight: Change syncfreq to be a u8
Message-ID: <20251114122040.GC3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-1-165ba21401dc@linaro.org>

On Wed, Nov 12, 2025 at 03:22:07PM +0000, James Clark wrote:
> TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
> has 5 valid bits so it can be stored in a u8.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 8d4a1f0f1e52..56a359184c6f 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -826,7 +826,6 @@ struct etmv4_config {
>  	u32				eventctrl1;
>  	u32				stall_ctrl;
>  	u32				ts_ctrl;
> -	u32				syncfreq;
>  	u32				ccctlr;
>  	u32				bb_ctrl;
>  	u32				vinst_ctrl;
> @@ -834,6 +833,7 @@ struct etmv4_config {
>  	u32				vissctlr;
>  	u32				vipcssctlr;
>  	u8				seq_idx;
> +	u8				syncfreq;
>  	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
>  	u32				seq_rst;
>  	u32				seq_state;
> 
> -- 
> 2.34.1
> 
