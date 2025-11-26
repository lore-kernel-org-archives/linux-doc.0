Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8313B30BBAB;
	Wed, 26 Nov 2025 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170094; cv=none; b=Y2x57NybfQMy6cyG8QeUZcdqpPzoYB7U0+3FUohg3yKAo1hfrqk+pr+lK7nO7xB9WU/Xt2Ph7ybuV/CVhgZ2qFsOsBe8yPEuZ32oFYe6YmXIK3vuCcUkVqW+85p0syOKN1ioKFcW6UFq1LUZSAHKbOKitKP3kCP5gqi36Eb7lO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170094; c=relaxed/simple;
	bh=kG4BplKErAnfo/TlorB7v9/ErMxgI4gloPeVD8rAA9M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwBFDjKvh8JQuUeIhA//qlTCLRIClxEPDGZiZo6ZnRaGQAuIixei16FVJm5S1hbM2z2RgSCYlri0ByTISFazzFKo6387dyVCdSKYrRyPM70eGlylDcb0yk6Vh81Ci3VQaPOE9OfKeE2LYslwKjcbv787WEsLz3c0QF4SG4vOeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 535A7168F;
	Wed, 26 Nov 2025 07:14:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 626683F66E;
	Wed, 26 Nov 2025 07:14:50 -0800 (PST)
Date: Wed, 26 Nov 2025 15:14:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251126151448.GM724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126144437.GL724103@e132581.arm.com>

On Wed, Nov 26, 2025 at 02:44:37PM +0000, Coresight ML wrote:

[...]

> > As far as I recall when this command line parameter was a bool then:
> > perf -e cs_etm/timestamp/ <program>
> > is sufficient to turn on timestamping.
> 
> Hmm... with the latest perf, we must assign value to `timestamp`,
> otherwise perf will report error:
> 
>   # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ Bad event or PMU
>   
>   Unable to find PMU or event on a PMU of 'cs_etm'
>   
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ no value assigned for term
>   
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ no value assigned for term
>   Run 'perf list' for a list of valid events

Apologize for this misinformation.  When `timestamp` is bool, it does
support the `-e cs_etm/timestamp/` format.

> > This is worth mentioning so users can correctly assess what happens
> > for any existing scripts they might have.
> > 
> > Based on this then the same command must set the timestamp to 1 -
> > which will have the same effect as before as we do not want to break
> > existing behaviour.

Not sure if we need to record such info.  Seems to me, it is weird that
record a common behaviour for perf formats in this doc.

The perf error log would be sufficient for users to setup a proper
format?

Thanks,
Leo
