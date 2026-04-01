Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CA92DEA6B;
	Wed,  1 Apr 2026 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067915; cv=none; b=LoUMm/HTSPUTuXURUFKRCfv9TCzThaCyemQHmZWiGMFhGQl5WYrqjfC/0NClHXYSyUmrSRfaXhxLBUW8dkgEV3svkWaU4fyAyblMSDS6CN07dgDHovmaobJ3I/aj9eCOn/+tcVHfePvgOJ9GbyUuXv+EULopfRREfPVLgjtpACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067915; c=relaxed/simple;
	bh=ov7en0F5vhrHqMYnwN3HLGogkYj9PTJvucXIRbisf4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szNfdmn2cqPCeOFiBFSOWqptp1gYgrfdNXYrldZSmmHLiRy0kVFTIG+FLH14mMXfD8LmWo0Eb5Q1Tddb9KzO7GUXErEPfVmUm4UdIAktuxU2Y9Gnx14fYhlNLXngFOVHMV1p6JWy0/+veY9LNW7BtSaiqqYU8/O1CJ8G2qz1u7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aNe3NffC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aNe3NffC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lzO/vA3FzH4/6916VeynP5KzZVYZFOeKExWewndmyAI=; b=aNe3NffCp3rijpW7uckt/MRKtj
	M82EvWCXc4RCij3sLFxUK3DqNRjHiJWSiQmsXfelswk3u73A1qGMoz59Lo4/3tXOSAJs/VQmr97B3
	ltvdrztQBqCsOnd9zrda0pn/iyr1NqTbVAPdnUm/FGmPJEa411Y6Bsm5wtPdUAhl32wYFj37m8m47
	rcRVwEKskLLNKIxqI9a/PJYBuOPkltYfKVGFPWqERnWBe4dz30VWY0IF4jnRGVO/unZKxxdnlnyna
	PC8kYB9D1U8NzB7EsbR8Kjd6CsEQYez8lbdnmJI4Fgjyo0Vqc+FWPBtvouGzOsijME9J1eEWhnrlS
	/KMJ+oNw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80FY-0000000FxNP-2AWC;
	Wed, 01 Apr 2026 18:25:08 +0000
Message-ID: <aae4e609-6a71-4b36-906e-9374d62c46d0@infradead.org>
Date: Wed, 1 Apr 2026 11:25:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
To: Steven Rostedt <rostedt@goodmis.org>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260326140055.41555-1-frederic@kernel.org>
 <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
 <ac1HV1HLErp8GkZ6@localhost.localdomain>
 <20260401130855.02c161d8@gandalf.local.home>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260401130855.02c161d8@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/26 10:08 AM, Steven Rostedt wrote:
> On Wed, 1 Apr 2026 18:27:03 +0200
> Frederic Weisbecker <frederic@kernel.org> wrote:
> 
>>>> +"CPU Isolation" means leaving a CPU exclusive to a given workload
>>>> +without any undesired code interference from the kernel.
>>>> +
>>>> +Those interferences, commonly pointed out as "noise", can be triggered  
>>>
>>> nit:                                            "noise,"  
>>
>> Thanks! I have applied all your suggestions, except this one for now because I don't
>> really understand the typo rule behind. Any hint?
> 
> So this looks to be an American English thing (placing commas within the
> quote), but from what I read, British English places the comma outside the
> quote.
> 
> Here's one case I much rather go the British English way. This also means
> it's only incorrect to Americans ;-)

Yes, just leave it as is.

-- 
~Randy

