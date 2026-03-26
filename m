Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88F31F98F;
	Thu, 26 Mar 2026 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566366; cv=none; b=XUhs5REeqf2VFvsTrw9THSg6hfTCV1PNCwmJvRaCE2BUOBf3i2lgiqfdugWX0TLSVOGk0e5IGqUCISd53cAWNKsBUYjf+s4Da4UchXsc3VsEBvTwtsQc4XmE7b0mEI18iqfVM5hGQYxumH0WBvvCO9xNsGQMIhO+h7pceYhAT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566366; c=relaxed/simple;
	bh=dFswScSveuGCYQsmysOZRsG0mAcU4CGuPZPgdW2GE6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8eWxjebD8cAcfBwX+5UOK9E4pGgDX7yJLZr1z5E3eJyU9ZWZHTFkxJKfG0QiH40bYW4uIVecKmvcaHeJoXD28T8ELejnR4CxYq1sw2zdJ3iESkcEtfqmTV+yLjmcV5VZXcahmvjV1UbpDBd0XoOOvWYgCw/RxdxAnD0R0lbQ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 2A6A31B960B;
	Thu, 26 Mar 2026 23:06:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 49E5930;
	Thu, 26 Mar 2026 23:05:57 +0000 (UTC)
Date: Thu, 26 Mar 2026 19:06:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, LKML
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
Message-ID: <20260326190644.4b7c2b5f@gandalf.local.home>
In-Reply-To: <b5e6c518-c7c8-46f7-928c-d4be5a8365dd@infradead.org>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
	<20260326190022.4b249f94@gandalf.local.home>
	<b5e6c518-c7c8-46f7-928c-d4be5a8365dd@infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 3j64a37kzqxzbah37x53811mboubscmc
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 49E5930
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18KiFTHrmKIdmrvPu5JfQxHc+B3HPl0B7w=
X-HE-Tag: 1774566357-340392
X-HE-Meta: U2FsdGVkX19wUl6gWELuxSATzrz1h/Lsk8v82v+viwRT5MuSUR3cBfA2uCJ6DgIARZqPryeS0oWMXCiNLi+ltLGcd6C4lp3/rrr7CeZwz0ev6/SlYESkndoMAHqDMmK4B64qg5ekq4Yv3jhkou9YwlqXXd3Bk7II2RP6oUl2iaWiH9gBABAlQjsV2m3Re2XsRXiQCQLO+53aGFmUZc2J1uSFO7cBsi0V3nAQ7BP6pQsvOgrXeuG0ypnwnKfasvk4GLv7aXypth6Ug7azT7G94h4uVsbWoKvR12OKPnOtPKvYynS1+mXCUsI6lDMLuSJFFTdP7lUCKu4Px0weS0ABHxH+z6URY86wAeeg6BTJPK5viVqXkC0i/pqhK/rtwiKvqo7Hd5ezt8O0TYQvpm+ZYQ==

On Thu, 26 Mar 2026 16:03:18 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Stephen, all I can do is make recommendations. If it hurts your eyes, tough. ;)

Who's this "Stephen" you are talking to?

-- Steve
