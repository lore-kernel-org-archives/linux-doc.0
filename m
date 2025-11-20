Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571062D2398;
	Thu, 20 Nov 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648725; cv=none; b=OpApuSbsEMhgkRo7qXjqniT5GAzrxQn6rOASJIGz3b19htwudx1VVez02akSYibODVAiI7EnT3qT9FAEZQi/4eDs5m/cnG22B22eoBaWDUFkoEGbdQoq+72zeHC7Im7HmOzXdd5+1YtwC73DL7zPT2fATcGaYGKvCqxPjlvoD/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648725; c=relaxed/simple;
	bh=vHflyRHzkWyt85jQsCUSZo6ZUQ+8CgSRMGOJTBOlSd0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNKz0/9mLuntpD2rGzGQUK6WIsexnnrIpueYR3qz0Cm86vLuPEZH9l7R/knYpyqbd28J0aBhsC5YQVcMS3Euh3Z4qIL67e6eKReTCpZb/TuX5A9cM+SQMuBT2E1jfpKSECsHN0VdBQlq/x3n91/MPSTFyRdCmgfUIG3ea1zmUSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ABB8339;
	Thu, 20 Nov 2025 06:25:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF323F740;
	Thu, 20 Nov 2025 06:25:22 -0800 (PST)
Date: Thu, 20 Nov 2025 14:25:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 03/13] coresight: Refactor
 etm4_config_timestamp_event()
Message-ID: <20251120142520.GB724103@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-3-82efd7b1a751@linaro.org>
 <CAJ9a7VhYaU=kAtvZtSnkj-9OicCWwqYQBX4Q3zDtCay-8=Y7Cg@mail.gmail.com>
 <4090a47c-2208-486b-bd96-47518d7aa90c@linaro.org>
 <20251120141821.GA724103@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120141821.GA724103@e132581.arm.com>

On Thu, Nov 20, 2025 at 02:18:21PM +0000, Coresight ML wrote:

[...]

> Maybe define a general macro but with extra checking:
> 
>   #define TRCCNTCTLRn_RLDEVENT_MASK  GENMASK(15, 8)
> 
>   #define ETM4_RS_SEL_EVENT(paired, sel) ({  \
>       if (paired)                            \
>           assert(!(sel & ~GENMASK(3, 0)));   \
>       else                                   \
>           assert(!(sel & ~GENMASK(4, 0)));   \
>       FIELD_PREP(TRCCNTCTLRn_RLDEVENT_MASK,  \
>                  ((paird << 7) | sel));      \
>   })

It'd be better to use BUILD_BUG_ON() instead of assert().
