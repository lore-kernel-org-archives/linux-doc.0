Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35FC2DC79A;
	Wed, 19 Nov 2025 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555812; cv=none; b=K5hAAiNpdHh0Y5eS52J3ZwufR3fKbb8WVY4cCz+TO6ZlM/oodN5MemO1oAsExDoMyZva+MnHHjwf9Z+18ZWX5wwL4jw8bYl8syX95CtmjDhAI5F85B5PG5f7r5oqN6hGSwdUhIQH6hcFEoneJZoKW+e6DQ9ln/azgKxvaDmd3z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555812; c=relaxed/simple;
	bh=tAvbWanCtbGIJvykbcNuISPrtZrRth7W2XADQ+9YzMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIEkKzK/0NETkai0QPDC/6udg5I8Bf1MLEueJjqx1d41RFQOOtAyyzTH7DWI7EM8aGyqBlYtApOiPfc5KlCVQzpnE+QNoINh3x7myZJepGCexRipenI1+IlHAlQB4U4qqvsnsPFd4KiI7D7VPI4a1uYcLcvsFC8huKzlldCn+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B13FFEC;
	Wed, 19 Nov 2025 04:36:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98D83F740;
	Wed, 19 Nov 2025 04:36:49 -0800 (PST)
Date: Wed, 19 Nov 2025 12:36:47 +0000
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
Message-ID: <20251119123647.GC8204@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>

On Wed, Nov 19, 2025 at 12:00:30PM +0000, James Clark wrote:

[...]

> ...  But then to make
> the code match the warning it might also make sense to change CONFIG_ARM64
> back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested to change. Maybe
> I can just delete the warning text, practically this warning can never be
> hit.

Armv8 CPUs can runs in aarch32 mode, strictly speaking, we should also
can run ETMv4 driver in aarch32 mode as well.  Then CONFIG_ARM64 is the
right choice, this can remind us that `is_kernel_in_hyp_mode()` is
always stick to aarch64 mode.

  static ssize_t format_attr_contextid_show(struct device *dev,
                                            struct device_attribute *attr,
                                            char *page)
  {
  #if IS_ENABLED(CONFIG_ARM64)
       if (is_kernel_in_hyp_mode())
               return contextid2_show(dev, attr, page);
  #endif

       return contextid1_show(dev, attr, page);
  }

Thanks,
Leo
