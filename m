Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACBB303A19;
	Wed, 26 Nov 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168282; cv=none; b=OjO3UPV8C06hebZCUI1aW6m5VsDphZ4NBQC9VSkZ3N2DDqEwUNhhBRLeipBj1CoSzDYPLSJTx8hGac4Ndtlx8yCwyKhH3GGBFNqFmas3hwJHiXEL6raFsD5Rld6yG5LzwPBvT6alVLtOTa90+sHUqF6EfX5ngjQN38nZT7ZYTIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168282; c=relaxed/simple;
	bh=2cppOkVKgl0pjKR1U/CqP0UN6xPwA2lHW16XyELe1JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KB6LZwcTxMYB+BU80x5kB3oN3pAHv21+NImAmVMnx+NxhMjXx+klCnITl+kuCLHEDCx/u042zU1nu6P+vRNrg8n/1RUZeBdY0Ll+/ZxcqppHwhsLcZxZ5TYC0oZGmqH2KfXtP94K9W0uTd0hdxi0Ubmqu8gru8uQqdLFAVq+QDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 882F9168F;
	Wed, 26 Nov 2025 06:44:32 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FFB53F73B;
	Wed, 26 Nov 2025 06:44:39 -0800 (PST)
Date: Wed, 26 Nov 2025 14:44:37 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251126144437.GL724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>

On Wed, Nov 26, 2025 at 02:20:14PM +0000, Mike Leach wrote:

[...]

> > >     * - timestamp
> > > -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> > > -       <coresight-timestamp>`
> > > +     - Controls generation and interval of timestamps.
> > > +
> > > +       0 = off, 1 = minimum interval .. 15 = maximum interval.
> > > +
> > > +       Values 1 - 14 use a counter that decrements every cycle to generate a
> > > +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
> > > +       - 1). If the value is 1 then the reload value is 1, if the value is 11
> > > +       then the reload value is 1024 etc.
> > > +
> > > +       Setting the maximum interval (15) will disable the counter generated
> > > +       timestamps, freeing the counter resource, leaving only ones emitted when
> > > +       a SYNC packet is generated. The sync interval is controlled with
> > > +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
> > > +
> 
> What is the default value?

From driver's pespective, the default value is 0 (disabled).  We do
set default values in perf:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm/util/cs-etm.c#n444

IIUC, the default value would be the same with or without this series.

> As far as I recall when this command line parameter was a bool then:
> perf -e cs_etm/timestamp/ <program>
> is sufficient to turn on timestamping.

Hmm... with the latest perf, we must assign value to `timestamp`,
otherwise perf will report error:

  # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
  event syntax error: 'cs_etm/timestamp/'
                       \___ Bad event or PMU
  
  Unable to find PMU or event on a PMU of 'cs_etm'
  
  event syntax error: 'cs_etm/timestamp/'
                       \___ no value assigned for term
  
  event syntax error: 'cs_etm/timestamp/'
                       \___ no value assigned for term
  Run 'perf list' for a list of valid events
  

> This is worth mentioning so users can correctly assess what happens
> for any existing scripts they might have.
> 
> Based on this then the same command must set the timestamp to 1 -
> which will have the same effect as before as we do not want to break
> existing behaviour.
> 
> Mike
> 
> 
> > >     * - cc_threshold
> > >       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
> > >         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> > >
> > > --
> > > 2.34.1
> > >
> 
> 
> 
> -- 
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
