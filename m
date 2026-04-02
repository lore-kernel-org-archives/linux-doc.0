Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA43644CC;
	Thu,  2 Apr 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121305; cv=none; b=EMz2mQMwCsFrLBs14Aq1S0oaDShniFh10M4JbsikrlSTAp4pc3EsHntbsgLkOiEPRlAZdWn4r1ZX38REUNsTUl5Nn3YoSWVr6Vn7mMQeuoubHBbamtQu1x3LBbPS7Blzm3aTllXlbkQcw+swKwqXor3SWHN8weXYv905CxlPw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121305; c=relaxed/simple;
	bh=CV6FHJvQKxUEo4ZmNOv8aXGNSmReqHuRRCYGJmUuoww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iju9tdvyHhX8KUADcQixeCqb+RE/gooW2vuYkb7UEwfNLIZ6gq/lbzXA/DGMvhW2F1Z0Bb3nqSMxxTPUTMPQh6v+84RSw3b4dB162C2P7CwMZMqDCXc4cy7MPX/m5f5JUJZXVff2mvoW8Ght9GugAJVBzJisx3FmAq8tX8PfL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tklnRY1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tklnRY1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B94EC116C6;
	Thu,  2 Apr 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775121305;
	bh=CV6FHJvQKxUEo4ZmNOv8aXGNSmReqHuRRCYGJmUuoww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tklnRY1bx34ogpVZWYBitriPWlCSCUIeagZbIGvplvgLYnnNCyk3eZlN4f5dSenmB
	 +AbwJu0KbebhQX9J30G+6S3IWgcPOthQd3mIzb8RSmbQOkiQ4UO8Vtcztw/QqxNtbi
	 lmFUHfFYnXKWlBChg3L5EcdPIL6KHQF98l97sR/HNXOg5avjRBH9BDJWAvVnvo1w6O
	 YYSPeYHVobuShmnfqIvfCj1UXIoMb1ypVR8GOrFhEkuKLP8v/SDEAcnIW4oskN39PO
	 5H+IscCqAMR323g52+6ZsuhAWAhiJP2JWnlsfjL/taMlmpJ1pEK4upZb0m5HhZbZAN
	 fKxQ9BoBQ7Afw==
Date: Thu, 2 Apr 2026 11:15:01 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <ac4zlSfRpGp_xzMQ@pavilion.home>
References: <20260326140055.41555-1-frederic@kernel.org>
 <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
 <ac1HV1HLErp8GkZ6@localhost.localdomain>
 <20260401130855.02c161d8@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401130855.02c161d8@gandalf.local.home>

Le Wed, Apr 01, 2026 at 01:08:55PM -0400, Steven Rostedt a écrit :
> On Wed, 1 Apr 2026 18:27:03 +0200
> Frederic Weisbecker <frederic@kernel.org> wrote:
> 
> > > > +"CPU Isolation" means leaving a CPU exclusive to a given workload
> > > > +without any undesired code interference from the kernel.
> > > > +
> > > > +Those interferences, commonly pointed out as "noise", can be triggered  
> > > 
> > > nit:                                            "noise,"  
> > 
> > Thanks! I have applied all your suggestions, except this one for now because I don't
> > really understand the typo rule behind. Any hint?
> 
> So this looks to be an American English thing (placing commas within the
> quote), but from what I read, British English places the comma outside the
> quote.

So does french english :-)

> 
> Here's one case I much rather go the British English way. This also means
> it's only incorrect to Americans ;-)

Ok thank you both!

-- 
Frederic Weisbecker
SUSE Labs
