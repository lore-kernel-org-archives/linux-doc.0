Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EC347A0D0;
	Wed,  1 Apr 2026 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060826; cv=none; b=a+8mymWPZGfIcc32hW9LyIAU3/VlHZRxjAGVKpwaQYoEzvF4IuvugRUjUQO+jjCD6GYMMCQbjo5DMUnBnX+WnSDXsrhrlZJKKOiLEuyPxqNFQ/nSdT+X+8DQsk/x36YV3o7OMXKIPuv7tuaLOINQSL149kaYMziaULaMgNpkPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060826; c=relaxed/simple;
	bh=qvOJix5Rxwc9sdpsH9CobjZ1ASdx57nkq/57g07ShDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfPJHhDKbBNm4j3oauJSEdGBtjS76fz1UvRD+IL4UMqHlpo+qaTuNDlRio5Aqv8e75ek8mvrMc6zPWejfA7hWTEnEC1AJmNpsxbSRc4/xk//+wlH6A1Nt43qJehRlPVAUcgfkjg4pS7rI9q0piMDbmIk2luO5j1FaVC8fo48/eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7n+0JD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7n+0JD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4A6C2BCAF;
	Wed,  1 Apr 2026 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775060826;
	bh=qvOJix5Rxwc9sdpsH9CobjZ1ASdx57nkq/57g07ShDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7n+0JD2uH+l3RwCMkGl6pQIi+znzso60mgBrCG9yeHxgpor1jmmJ4c9QcygjQqD+
	 eX0AyWzsBagSMFFn/mrD1pHsX1digVY4+XVsifA5nI5bkkuFe4SzL8QMROoITiVtCZ
	 VzI5NtFV7vnkcIItzxxMPu+0xLbQGhtmVAn4hwEgsfJ3aHMxs90Q7Dn+WlzqtKwA9k
	 Xd/kGSN2goq1pT/8YaK0TMG5rRmipBET7a8uzRX5qKJE8a8JclWOiKxdSsPNQVGb7h
	 h1fncA0LQHGgFqMQmE9SCFbMLLZBkRNxt0OTIBWa7xvejjiD00oNfZeZqZHdV3i0BF
	 PGhesc5EQ0U+A==
Date: Wed, 1 Apr 2026 18:27:03 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <ac1HV1HLErp8GkZ6@localhost.localdomain>
References: <20260326140055.41555-1-frederic@kernel.org>
 <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>

Le Thu, Mar 26, 2026 at 02:42:32PM -0700, Randy Dunlap a écrit :
> (Just some small comments -- take them or not.)
> 
> On 3/26/26 7:00 AM, Frederic Weisbecker wrote:
> > nohz_full was introduced in v3.10 in 2013, which means this
> > documentation is overdue for 13 years.
> > 
> > Fortunately Paul wrote a part of the needed documentation a while ago,
> > especially concerning nohz_full in Documentation/timers/no_hz.rst and
> > also about per-CPU kthreads in
> > Documentation/admin-guide/kernel-per-CPU-kthreads.rst
> > 
> > Introduce a new page that gives an overview of CPU isolation in general.
> > 
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> > v2:
> >    - Fix links and code blocks (Bagas and Sebastian)
> >    - Isolation is not only about userspace, rephrase accordingly (Valentin)
> >    - Paste BIOS issues suggestion from Valentin
> >    - Include the whole rtla suite (Valentin)
> >    - Rephrase a few details (Waiman)
> >    - Talk about RCU induced overhead rather than slower RCU (Sebastian)
> > 
> >  Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
> >  Documentation/admin-guide/index.rst         |   1 +
> >  2 files changed, 358 insertions(+)
> >  create mode 100644 Documentation/admin-guide/cpu-isolation.rst
> > 
> > diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> > new file mode 100644
> > index 000000000000..886dec79b056
> > --- /dev/null
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -0,0 +1,357 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=============
> > +CPU Isolation
> > +=============
> > +
> > +Introduction
> > +============
> > +
> > +"CPU Isolation" means leaving a CPU exclusive to a given workload
> > +without any undesired code interference from the kernel.
> > +
> > +Those interferences, commonly pointed out as "noise", can be triggered
> 
> nit:                                            "noise,"

Thanks! I have applied all your suggestions, except this one for now because I don't
really understand the typo rule behind. Any hint?

-- 
Frederic Weisbecker
SUSE Labs
