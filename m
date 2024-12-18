Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6683CD2;
	Wed, 18 Dec 2024 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539481; cv=none; b=V/7alBbLJqN7Bq1UuhcwoueXUtT755egXw4mQUGOsv0Hmxg0cSCt86CfAfLPavGTkXvxVOotiQWLdZWO4jVHl17tR4O9j8dbPtOaw0POnUtenO7pgoZDM6b/Fxjlk7JfLa7DZnbr2gxw1IT/dfcSpEP9NxhnNTTptBDj5TkTt8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539481; c=relaxed/simple;
	bh=yGIL86w9lMwKmLq4JtaRa5pmdHb1zhWoiZtSVXaZFPw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ck9G0R7y54Bc4JZhLplwi0+ruXnqgNo7MBSVTpXaOQEL/itJr5OcmJrIxf3bi1mMM2MTj+iREuwMYQ8oaalUBZXLu/EVVKQEwqg8zN1xuRmzYcMqBOpMRVOulCV1eoi/7U+lVMnXxyuKQKzV8Te+Sc+GIl/wNG2O9ExtJauNGMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D56C4CECD;
	Wed, 18 Dec 2024 16:31:18 +0000 (UTC)
Date: Wed, 18 Dec 2024 11:31:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, John Ogness
 <john.ogness@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Zijun Hu <quic_zijuhu@quicinc.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: lock in vsprintf(): was: Re: [PATCH] of: Add printf '%pOFm' for
 generating modalias
Message-ID: <20241218113156.30a50a07@gandalf.local.home>
In-Reply-To: <Z2K_u6jK5aLDqaam@pathway.suse.cz>
References: <20241217183711.2525863-1-robh@kernel.org>
	<Z2K_u6jK5aLDqaam@pathway.suse.cz>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Dec 2024 13:27:39 +0100
Petr Mladek <pmladek@suse.com> wrote:

> But this would happen only when the last reference is released
> when formatting the string which is kind of corner case.
> 
> As I said, I think that taking lock in vsprintf() formats is highly
> unexpected and thus a way to hell.
> 
> What do others think, please?

We already can take locks from printk formats.

  https://lore.kernel.org/all/20241120102602.3e17f2d5@gandalf.local.home/

At least when SELinux is enabled.

But that may be an SELinux issue and not a printk one.

-- Steve
