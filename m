Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818F335A5
	for <linux-doc@vger.kernel.org>; Tue,  2 Jul 2024 04:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719895023; cv=none; b=HqVxlvnDQsaDzejvRHhG4rCRukZnSHA+KJ3Ve6Uo9KqxMxrqM0jyk7pjSrWVMsZL6/CC6ntsq5BDN2C3RLav3Mka8j/aa4QoFj5pcPEPwS87hTD53sTOL9xLoExbk+CDY8mtleJd+qYehilDHBPKwW7RSzhuLcsJbr8sukj+p+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719895023; c=relaxed/simple;
	bh=COdofZI0yLe7Qei1B6Qkb1Szy1SP27VggR/s5mibXQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra9AywcOXg1PyNifSaUarG+wYx6AbxgmNjp1DZG+5rVykCzHDBX2srSa8EoV4Q1wUPpk1+KO04RRwGol/Y6095BpXntELtLpEUrneBWj8KOLtKfGmowfSRPk9N0/aQBJSqbs1LSCaeCuX0zCnCsorm+473BN58eFlNobh3LZWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtDjdeYG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtDjdeYG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fa9ecfb321so22411315ad.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 21:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719895021; x=1720499821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7wJUnGUJSkYxsQGi1RA4irnfeYuwiGT6Z1uOT3kzXFA=;
        b=GtDjdeYGK4BC0yJkyn3ns2mqWmG5FIqQFq7QJ09IvM441Zex4Zrtbo7cqrSP5liWev
         T3Kg8seqh6RwMarmSgWSE+gDjplF2ixQkzeIslLRiL52KTOBAiAofUPOIkPmIqv8OH/+
         aJAWfOe9t2igz0y7k/0ko0kSP/DRD3t9ZoKyW2BWVspF4LRsxQ4myVgyPiLK+APpLkWG
         mS74caXNzAYsauDctp2FuIzJBYwKPUu7NaSADBw2/atc6ePg/SzlKxFwRU6OXiR+Kzi8
         Zuw2OCwsroLJM5B+Tq/kUtzA+fBSr06sONK4qdHW2VdwfiJPRKdldOjRy6py35cbOnUd
         RYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719895021; x=1720499821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wJUnGUJSkYxsQGi1RA4irnfeYuwiGT6Z1uOT3kzXFA=;
        b=qbknH/gZshkWGi+XZaN+tKBPYPTq4v3Z296US7jjyFAGG4VUa2otqZSagcCTfUUT4Q
         x0y6o5rsrLzJbTivzaBf+uhc3b5jkjI+nqsnJdU7kZ9whG8UX752l1I+s3i2aqh4umcu
         cOjF/KILV0Vry8Ls4wphZ1I4vN9IjW9AUcksQUsbGTdY/smb1iyNO0Krh9KtRItgyDCS
         LYXKuhJUXUfMeMiqOwYhOzmCDbXOUkhNKK4Y3630xtkvGvIwFwBt1KJxvVMDl8Ux4eUe
         goAldxZaleGe9FAH7nh+1uKRkovsKEQkdX7LCLMmugBM85nPpvmocFwMXEn6v7yZhGsv
         2TpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgPO6A7sJYTDVRk78HMLzIsDz6UkGWQXa7TcpX8OqaMGXJ/WHWwFzs4Gt/dE+HTPauEzJAvD3vjTZPgSC03WDnV6/KCCLc5yLT
X-Gm-Message-State: AOJu0Yxs7FD02TpIftkj26rWaLdiviPMl/BhXrzzdqrMDgXYa9g3uG9I
	QGYCXtoDTxrFWGi5RoUVQ3fTBvha8NHRCMUsYxa6VswIjg/8+rQQAwyCjJjVp5w=
X-Google-Smtp-Source: AGHT+IGg5crGPbSnlDPvZdZlEHxAc+4TJ6Al2n+BlUolTHf0JpxXwT5dxv/2p5/mvOy1DIjwWyg1Bw==
X-Received: by 2002:a17:903:41cb:b0:1fa:bcb:3da4 with SMTP id d9443c01a7336-1fadbc96936mr47120155ad.33.1719895021462;
        Mon, 01 Jul 2024 21:37:01 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10e2197sm73664065ad.63.2024.07.01.21.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 21:37:00 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:06:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: "'Rafael J . Wysocki'" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: docs: Add missing scaling_available_frequencies
 description
Message-ID: <20240702043658.jwumgakxplddqlnx@vireshk-i7>
References: <20240701171040.369030-1-rgallaispou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701171040.369030-1-rgallaispou@gmail.com>

On 01-07-24, 19:10, Raphael Gallais-Pou wrote:
> Add a description of the scaling_available_frequencies attribute in
> sysfs to the documentation.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  Documentation/admin-guide/pm/cpufreq.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> index 6adb7988e0eb..fe1be4ad88cb 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -267,6 +267,10 @@ are the following:
>  ``related_cpus``
>  	List of all (online and offline) CPUs belonging to this policy.
>  
> +``scaling_available_frequencies``
> +	List of available frequencies of the CPUs belonging to this policy
> +	(in kHz).
> +
>  ``scaling_available_governors``
>  	List of ``CPUFreq`` scaling governors present in the kernel that can
>  	be attached to this policy or (if the |intel_pstate| scaling driver is

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
