Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428438A73A;
	Wed,  1 Apr 2026 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063282; cv=none; b=rfc0aTW3+JoGjHPMFgtQWTdyh9AXZ9mqjt4YOfxvusNzHrlQmVjeSC0TJOvbuJJGGOi4DHnsDLL39F1RNPWZ+VQTkAW86vkaHeXaUVFp+Vwlt72m1FsWnVFbibLkbWYHeaWZl33jBGfpo3EJ0LFF+yUzbIY4tv8TjMi8GplV3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063282; c=relaxed/simple;
	bh=Y+X+HfJ/P9oKt0CdYPVPWVdpeoNGcI1JoS2jXd9mMJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOSnxCNfkzL2Taq1mAmqsLq4GqmS20DvLb/w1nlBDuFO1bPByULwN0q3jyFH10uxFtDpu3ZJ7PFO1qochccREHlFddC/6dnktWWhkZYp3YRFbBwFCmceyEDzkAJ9f9dZwkxI8/66GxZ43/Nm8swXpx/10LZMqTiSIUvPwTsygDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id BB7DD86C97;
	Wed,  1 Apr 2026 17:07:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id E0D1719;
	Wed,  1 Apr 2026 17:07:54 +0000 (UTC)
Date: Wed, 1 Apr 2026 13:08:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marcelo
 Tosatti <mtosatti@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Phil
 Auld <pauld@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin
 Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <20260401130855.02c161d8@gandalf.local.home>
In-Reply-To: <ac1HV1HLErp8GkZ6@localhost.localdomain>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
	<ac1HV1HLErp8GkZ6@localhost.localdomain>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E0D1719
X-Stat-Signature: w496gfc5zsqy13pt8a3r5goajqt6hh5t
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1//2KP7EXmElLUnbYyyNOlTVaH2PaJDt74=
X-HE-Tag: 1775063274-856017
X-HE-Meta: U2FsdGVkX18QanLKHhM8C86Ix0j4AjMr2DSwnTtv01Tfn/gIeOEv5VLurvzeTpdSdUdihStwX5HXuzl53k9OUM5zJb/JVgZM6czmY5Z1U3qE/Rb7nZ5SggUGXVykcy2eeIUBkm2iQYhsfq8gZ/A6bSISnvKYelAhBFyM5FZ+4ydER9mLXx4LMo08xdqWSG7aSbX+CyFvtPMnfapsTDlf3CcP1f2Xp+z48jJAWEFuGHsAn97hhbHw/90xxxqIE1g/ruh3e0byH2iedCFD34aw11HUJv8esE5jkVz+uItlR1qstIpPArsQKDWqJpVVc0ovexWcfCGTRbh1JoJVMAgPOZ6WPXupRCAy

On Wed, 1 Apr 2026 18:27:03 +0200
Frederic Weisbecker <frederic@kernel.org> wrote:

> > > +"CPU Isolation" means leaving a CPU exclusive to a given workload
> > > +without any undesired code interference from the kernel.
> > > +
> > > +Those interferences, commonly pointed out as "noise", can be triggered  
> > 
> > nit:                                            "noise,"  
> 
> Thanks! I have applied all your suggestions, except this one for now because I don't
> really understand the typo rule behind. Any hint?

So this looks to be an American English thing (placing commas within the
quote), but from what I read, British English places the comma outside the
quote.

Here's one case I much rather go the British English way. This also means
it's only incorrect to Americans ;-)

-- Steve
