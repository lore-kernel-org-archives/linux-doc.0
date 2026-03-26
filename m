Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93583231830;
	Thu, 26 Mar 2026 22:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774565990; cv=none; b=U3PEi2D/wfHhYMTGEdb+NioUZZIaq1bbYTy1OiLHRlr8Cp02grVuqsfankE0Jh4nnXHakuX27wk0fT9QmYKBeTXFUA54dBNjpxLgv96JLFTnwzj/IZ+XNpxmEnWC7/E8DBMDfIy7APbz4poZBS/ZVRdd2gn9/lC7IdRcSVt3hBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774565990; c=relaxed/simple;
	bh=go4R2BmQ/jWxnoXjn/SoGN/LX7meA3aaYpMyJWVWQn0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDYbNBU1j1Si4Rbu/gA3MBLsPj6cQkTXQWbCEWbBDV70xdBufqi9iNrFQeIJffGFZsaF+mPiAypXZyeIMH+LCn1c/LeRCywDOBRW+T8IVJSP3y/ljPF5JL7UJCPFRUj++1z/eGV+xmyVv32PNyBGit5lCrP63v6l7F3fyR6zfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 5910F5D9CD;
	Thu, 26 Mar 2026 22:59:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 6A1C52F;
	Thu, 26 Mar 2026 22:59:35 +0000 (UTC)
Date: Thu, 26 Mar 2026 19:00:22 -0400
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
Message-ID: <20260326190022.4b249f94@gandalf.local.home>
In-Reply-To: <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 6A1C52F
X-Stat-Signature: 15uspcrqy6nw6b3p5c7xos3nkidpphj1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/7CfHtfGtXHgmrBWCDsrvMBMEP0mlNtyg=
X-HE-Tag: 1774565975-778056
X-HE-Meta: U2FsdGVkX1/0AyakNfuk5z1OzZ13xJFatf6y0esOepfdmg5428wLhci8HMXIP8pd2Z8uULOrDflqGMhlPbaJg3QbjNn1ZNu7eIre2Gkni470jmsG/GtjBBJ0wVinOxmaaxMtZLyw29/f5u6SorOGdKfefXoA1OI8O6944JlPiUynExl9pa86IpLii+jECk9qfMsj7tPTuBFGPPtRnE1dnUkMgvSHQ+Wf+YMs3N9bXb+boZEckQF9DKEHSoYGtDGhvmNsBGI03AjetIgEcR3iLOB3eGl7OhKeJgIQYZ9oogAj4kCMEUaUl6Yr2zK6EjqyI63JEnQYcEFAEqI8KEXyGwNXCmzLwox3HAHEiWX9EeenRX0hoEMfW6GsA0wc+qTb

On Thu, 26 Mar 2026 14:42:32 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> > +Those interferences, commonly pointed out as "noise", can be triggered  
> 
> nit:                                            "noise,"

Really?

Even if it's grammatically correct, it still looks horrible.

    Those interferences, commonly pointed out as "noise", can be triggered  

vs

    Those interferences, commonly pointed out as "noise," can be triggered  

As the quotes are going around the noun, and placing the comma into the
quotes makes it look like the ',' is part of that noun and not a
punctuation of the sentence.

Being read by C programmers, I would keep he ',' out of the quotes as it
looks like a string literal "noun,".

-- Steve
