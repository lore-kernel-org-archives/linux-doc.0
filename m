Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E12561A2;
	Thu, 26 Mar 2026 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566026; cv=none; b=soBjENwVJb04hU4YCVLh13WQpnLz8E46jMaAbICdOfETaOcL+QvL0kPiju7+LvuG4Ogb49/PmEQ5b37CeYox9JgGNOY+EQWe0VJFbDLp739dZVZ1BP6y+O06VDADB7vlgj2DQyvxJkoytReLEu+qzXqhSReZ8Fe7qnkLFI9BAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566026; c=relaxed/simple;
	bh=VOmqstW0nS5TjYcKlkNTy+hJsCHIFVmtDdm7nDccrC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJ6zqremji95YQXMm/FPJjBbF1RMoj2yUfduF2f2saQfaNaUJKZbWTvEYRLnCTwD5GmPMpyoWe4rEirKktReNLko/TujbJXuhxfbXkJtiMQIUCa/U02unfiaip9IJXFcIpRgGp44eYFFb2LNznwMLbPpCS+ZKB+EXpewn2lAl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id A04631A0F09;
	Thu, 26 Mar 2026 23:00:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 667756000C;
	Thu, 26 Mar 2026 23:00:17 +0000 (UTC)
Date: Thu, 26 Mar 2026 19:01:04 -0400
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
Message-ID: <20260326190104.4c399247@gandalf.local.home>
In-Reply-To: <20260326190022.4b249f94@gandalf.local.home>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
	<20260326190022.4b249f94@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: aauo8oidnbbf5m3s59efo5xjkfzodx3n
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 667756000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/cM1q0ZF6UGu7J8LhSt2MSOPc8y9UGVYE=
X-HE-Tag: 1774566017-923840
X-HE-Meta: U2FsdGVkX1+rjdQ0+UqIsNno9jEEuSzZF374b1J4Q8GU4NZidE/He9LKGjcPKIzqTTRaZBaeHA6amWnBhg6rhpm8rccvd4ZkdQu6BKp3oDqya4KS0wr03Mrh7A7MB9l7RbdMY3Ru7SHa88TG+DUWjCU5BSR8nxu+petgImLWzlEh238oJBmOSREX1t2X8UtLyfUzrCNhMAVYnPb1/oowd8vW79lvBgm3mz6tCaOtUri28GexJS+aymYn5XmkuyIEFre32MoFTWENED4sr8IrIJ1GWGLvaVBzShHGTgPRSAl6yb7NK1Cgc7oFWNFFSmN/aasFXLLRNUiHieiiCVTJtFkCCWlTePFt9dotEYJ/nb47Hqq90Aa6q/cP8T/FhXUBiVgIfB6xBZ2YN0TeM0rS5w==

On Thu, 26 Mar 2026 19:00:22 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Being read by C programmers, I would keep he ',' out of the quotes as it
> looks like a string literal "noun,".

  Or was that supposed to be: a string literal "noun,."  ;-)

-- Steve
