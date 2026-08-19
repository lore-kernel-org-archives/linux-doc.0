Received: from confino.investici.org (confino.investici.org [93.190.126.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C943CF054;
	Wed, 19 Aug 2026 19:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.190.126.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166203; cv=none; b=qyUKHKTIs7oP6pY+8QSEkkXvmfe2WpmKhT+xkDRWbQxscj+FABF4nA6wsrg6TCAApcRee0uQJJ7CLJ8u0yfOd8ONKq4z0k2nBE7yR0+coqA8n+UyiLSZnxBGWyPMOWHhx/SiuWtJtZNSM12HDnjJolKPg8rKwjAeDUKv+oGPe4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166203; c=relaxed/simple;
	bh=29HOlIF8qpm8oqVtERph4AtLkwejVkBopQWMGQDma2I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=rcfrATU/fHWXgpU276bw6+eW6WJEQ5Q74uN7TvbClMd9EWQMld9u9nSBxavxWGQZM7RQHqoZdwdG6wEpWwuBQHmEiP1IhjSanTUUUD4XaBvrx3AAzlfsj4q2l6m36XHSWQ/Ouypjcq1h9hVxbY2ZZrm7iDpkPsPkZ/V4Q9IGswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net; spf=pass smtp.mailfrom=grrlz.net; dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b=AFpa50sB; arc=none smtp.client-ip=93.190.126.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grrlz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grrlz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grrlz.net header.i=@grrlz.net header.b="AFpa50sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1787166193;
	bh=pM+57meldsYf2skpwywLwt45DTfacEdkrKjVmQcpzTc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=AFpa50sB0o+efHMVSfZfyujXtsK+j5g6KdP5tIh7lNwgK0lrU5F3cziZ6xb4rdnJV
	 kR02pTrYO3CD6zviiGJ3Qi2da12pLD2RD+dtO0LLPBiOOEQKYi9X+X1FNRtsdsI3Gl
	 c0FlBd4RMWmiT1y0AjQTYEgfp+++3HUUjNX3qRQ0=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4hQGDd3Nb0z10x5;
	Wed, 19 Aug 2026 19:03:13 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4hQGDd03kwz10vc;
	Wed, 19 Aug 2026 19:03:12 +0000 (UTC)
Date: Wed, 19 Aug 2026 20:03:12 +0100
From: Bradley Morgan <include@grrlz.net>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-doc@vger.kernel.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com
CC: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 andriy.shevchenko@linux.intel.com, kees@kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
 gpiccoli@igalia.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_V2=5D_docs=3A_panic=3A_Disclaimer_about_con?=
 =?US-ASCII?Q?sole_verbosity_when_using_panic=5Fprint_with_pstore?=
In-Reply-To: <20260819183419.2203903-1-gpiccoli@igalia.com>
References: <20260819183419.2203903-1-gpiccoli@igalia.com>
Message-ID: <788B9D8A-D6DE-4114-B607-01250648455F@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 19 August 2026 19:31:30 BST, "Guilherme G. Piccoli"
<gpiccoli@igalia.com> wrote:
>Users of panic_print / panic_sys_info are usually aware of the potentially
>huge amount of information displayed with such options - their goal by
>using them is indeed to dump more information during panic!
>
>What might come unnoticed at first is the impact that the
>console_verbose()
>call on panic path has, specially in cases that users rely on pstore as
>a means to collect the panic logs. Recent experience shows that dumping
>all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute
>delay on panic time due to writing such information to console. But in
>that case, pstore was used, so there was no need for console printing,
>and suppressing that reduced the full time to less than 0.5 second.
>
>The option "printk.console_no_auto_verbose" aims exactly at this use
>case: avoid automatically increasing the loglevel during panic path.
>So, let's officially document this to avoid users wasting their time
>either on long panic printing or debugging the panic delays.
>
>While at it, improve the readability of the panic_print text, by
>adding some line breaks.

I love this commit description 

>
>Suggested-by: Petr Mladek <pmladek@suse.com>
>Reviewed-by: Bradley Morgan <include@grrlz.net>
>Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
>Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>---
>
>
>V2:
>- Added line breaks as per Petr's suggestion (with some text improvements
>  as well) - thanks Petr!
>
>- Added review tags - thanks Feng Tang and Bradley, feel free to check
>  again given we added the line breaks, etc.
>
>V1 link:
>https://lore.kernel.org/r/20260805205026.1699568-1-gpiccoli@igalia.com/
>
>
> .../admin-guide/kernel-parameters.txt         | 19 ++++++++++++++-----
> 1 file changed, 14 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>index deae852f71e4..51cdf4e41c21 100644
>--- a/Documentation/admin-guide/kernel-parameters.txt
>+++ b/Documentation/admin-guide/kernel-parameters.txt
>@@ -4874,6 +4874,7 @@ Kernel parameters
> 
> 	panic_print=	Bitmask for printing system info when panic happens.
> 			User can chose combination of the following bits:
>+
> 			bit 0: print all tasks info
> 			bit 1: print system memory info
> 			bit 2: print timer info
>@@ -4882,10 +4883,16 @@ Kernel parameters
> 			bit 5: replay all kernel messages on consoles at the end of panic
> 			bit 6: print all CPUs backtrace (if available in the arch)
> 			bit 7: print only tasks in uninterruptible (blocked) state
>-			*Be aware* that this option may print a _lot_ of lines,
>-			so there are risks of losing older messages in the log.
>-			Use this option carefully, maybe worth to setup a
>-			bigger log buffer with "log_buf_len" along with this.
>+
>+			*Be aware* that this option may print a _lot_ of lines.
>+
>+			There is an increased risk of losing older messages in
>+			the log. Maybe worth to setup a	bigger log buffer with
>+			"log_buf_len" along with this.
>+
>+			Also consider using "printk.console_no_auto_verbose=Y"
>+			if using this along with pstore, to avoid extra delays
>+			due to increased console verbosity during panic.
> 
> 	panic_sys_info= A comma separated list of extra information to be dumped
>                         on panic.
>@@ -4900,7 +4907,9 @@ Kernel parameters
>                         all_bt:         print all CPUs backtrace (if available in the arch)
>                         blocked_tasks:  print only tasks in uninterruptible (blocked) state
> 
>-                        This is a human readable alternative to the 'panic_print' option.
>+			This is a human readable alternative to the 'panic_print'
>+			option above. Please be aware of the caveats using this,
>+			check the 'panic_print' parameter for more details.
> 
> 	panic_console_replay
> 			When panic happens, replay all kernel messages on
>

Thanks!
