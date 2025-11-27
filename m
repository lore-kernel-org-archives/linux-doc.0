Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EADB32AAA2;
	Thu, 27 Nov 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239583; cv=none; b=pk22ckFFKuPDt2GCExc7y8HSutVzOMj+HFIo2BI2JEALfrwe8Uuy/YDmsXA1c8VVZd8PF8UxIMnG9zQeCAu/G9dTu/JzkR2yWE2AkmCeNU08K5kAEeSNrowBUcwfVgDdXARcBR+Xo9o3kLsq+2zwB/ZkRI32hRcUooBCiRgz9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239583; c=relaxed/simple;
	bh=mM1w2R3NOzcwTWNhHzLrGG3P+96aRM/2CjOBZFUOr7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBsEeYjjZ+QcAytLgvCmj+jlJDIB9MbGgMxTZSvtw4o5BelnNH6FCbu92gIX5xRFQi7Zq+SQGPPiSzmdhLMpoqNEgMVwb7UbEoQta1/q5PLDx76WkWmWIfW4PIuhxPCT5sQ2XIEfXud3+VS/jN8l6tJ1Y+ge/Nhjj0Y1+LQyRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4131477;
	Thu, 27 Nov 2025 02:32:53 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 603373F6A8;
	Thu, 27 Nov 2025 02:33:00 -0800 (PST)
Date: Thu, 27 Nov 2025 10:32:58 +0000
From: Leo Yan <leo.yan@arm.com>
To: Al Grant <Al.Grant@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251127103258.GQ724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
 <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
 <GV1PR08MB1093237396B35459656FF82CA86DEA@GV1PR08MB10932.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV1PR08MB1093237396B35459656FF82CA86DEA@GV1PR08MB10932.eurprd08.prod.outlook.com>

On Wed, Nov 26, 2025 at 03:36:58PM +0000, Al Grant wrote:

[...]

> > >> As far as I recall when this command line parameter was a bool then:
> > >> perf -e cs_etm/timestamp/ <program>
> > >> is sufficient to turn on timestamping.
> > >
> > > Hmm... with the latest perf, we must assign value to `timestamp`,
> > > otherwise perf will report error:
> > >
> > >    # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ Bad event or PMU
> > >
> > >    Unable to find PMU or event on a PMU of 'cs_etm'
> > >
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ no value assigned for term
> > >
> > >    event syntax error: 'cs_etm/timestamp/'
> > >                         \___ no value assigned for term
> > >    Run 'perf list' for a list of valid events
> > >
> > >
> > 
> > That's unfortunate and not what I expected. And I don't think it makes sense to
> > remove that validation from Perf. The test uses "timestamp=1"
> > so I didn't notice.
> > 
> > Can we accept that people are most likely using the defaults so timestamps are
> > already on and they wouldn't be using it? The only real use case of that at the
> > moment is to do timestamp=0 and that doesn't fail.
> > 
> > Although it's not the default for per-thread mode and I did find the OpenCSD
> > HOWTO.md uses it as an example. timestamps make less sense in per-thread
> > mode as you don't need to correlate between CPUs or watch for context
> > switches.
> 
> Timestamps have a more specialised use in per-thread mode, they are
> as you say less essential for switching in the right context to decode
> the trace, and less relevant to BOLT/AutoFDO style usage where the
> trace is collapsed into a heat-map profile.
> 
> But trace can also be used to get a detailed timeline of CPU activity -
> a non-invasive timeline that can trace even through interrupt-disabled
> kernel code. And for that, having a global constant-frequency timebase
> becomes more useful, both in its own right, and to line up traces
> from each CPU with other CPUs and system-level traces.
> It's also the only way we have to indirectly observe CPU frequency
> adjustments. (Intel's Processor Trace, which is generally similar to
> ETM/ETE, has specific packets that trace CPU frequency changes.)

Just clarify a bit to make sure us on the same page.

This series does not break timestamp functionality, it just changes the
PMU format 'timestamp' from 1-bit to 4-bits for counter support.  The
updated 'timestamp' format still supports per-thread mode and CPU wise
trace modes.

The only difference is now users need to specify 'cs_etm/timestamp=1/'
rather than 'cs_etm/timestamp/' when enabling timestamp.  Given PMU
format is not an ABI, it is fine for me for the updated format.

To avoid confusion for users, a well-written document is deserved —
which is exactly this patch for.  And perf log would be helpful.  I
think we are well prepared for the change.

Thanks,
Leo
