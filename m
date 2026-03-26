Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAB7396B8D;
	Thu, 26 Mar 2026 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566967; cv=none; b=Ni56gytJZt4dUl97MiZKnmBQdqDUO0dZPtp+ZCqApEzBxHdF0C6M5I2qnnwKcEomtQ0kXVoXnhRT34WLG2OOPMvroPUBruyIzLTh5LfKraApcnddzPUv7zC9bTPseYPq0BCWSXlWZd5If3kVZ5XngHi9r1w2gEl8IzpVsgF4ZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566967; c=relaxed/simple;
	bh=PdMBOjibiBWj1bEXT5J7wJCcxTCVZtar1l+Z04TThgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsIhqN9BYLxDrcRM2+5fGuKycCfS1/U1Uv5FA+O1cPaoen1GIKpYaIV1d0sZwlJhK4Sls8pDFofE4GN3Kwb3cKvS0IemfnT3LF13N9oAOCNlP7wpLb/B05qiCG7yogfbLsIM9ZG/qZ84rtc/qkVKGMYzo/SpBtB++WPYLTnPQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id CABEAC44C6;
	Thu, 26 Mar 2026 23:16:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 018AD20012;
	Thu, 26 Mar 2026 23:15:58 +0000 (UTC)
Date: Thu, 26 Mar 2026 19:16:46 -0400
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
Message-ID: <20260326191646.16fe726f@gandalf.local.home>
In-Reply-To: <17c061f5-b864-4652-b4a2-356c7534d42b@infradead.org>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
	<20260326190022.4b249f94@gandalf.local.home>
	<b5e6c518-c7c8-46f7-928c-d4be5a8365dd@infradead.org>
	<20260326190644.4b7c2b5f@gandalf.local.home>
	<17c061f5-b864-4652-b4a2-356c7534d42b@infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 018AD20012
X-Stat-Signature: f3zq7cm695f57ajj96mtf9jdajau6c7b
X-Rspamd-Server: rspamout03
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/JfFpHT2G/XTGPy3O9Na9zG73rsRTo3KI=
X-HE-Tag: 1774566958-838668
X-HE-Meta: U2FsdGVkX1+U2PKG6WzRS5xFNCKP8xZ0dSbgpkNfb6kiNlNNLTN6z/tr6XnE/X6sMZOaYG+pupvN3/JMQQvNXFWqKY7WjSYdIaVPJK63oSXfedg7kIHbjsaW9LHOyKjZkKCDezLeJokxsnCfZjXD5wtZRmPAcWSlpkAch8woDSsvGgSfJvVSNQuh8Qs4YwBQVss+6amE5XMbrccX+aPjWl0GaFgsbJag6lYnfc1dOSjJSDPWtrkn115f7VzsTael/BqjEXa7QOu60S6aczxhYklXR88qhdNWjWyj28KS8sPb+qxTf8TWoYq6IYsKYEiDwkxwxKBYxl5eMpexSmPhhUC78Msz0fyu4FMoLO1PW3wjMuxxvU2tJBj0DuxtiZdPgcIfS7IBMoTnLwcA0+oC0g==

On Thu, 26 Mar 2026 16:09:15 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 3/26/26 4:06 PM, Steven Rostedt wrote:
> > On Thu, 26 Mar 2026 16:03:18 -0700
> > Randy Dunlap <rdunlap@infradead.org> wrote:
> >   
> >> Stephen, all I can do is make recommendations. If it hurts your eyes, tough. ;)  
> > 
> > Who's this "Stephen" you are talking to?  
> 
> Oops. I guess it's the one who accidentally wrote "he" instead of "the".
>                                        (Do you like where that period  ^ is,
>                                         even though it's incorrect? :)
> 

Yes, Randi, I like where that period is. I also need to fix my 't' on my
keyboard as it seems to act shy sometimes.

-- Steve
