Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744D13988EB
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572957; cv=none; b=l9hMHaNbdic5Ln8rOsWBFn2eav+AnrdnXiOVt5fDA9xFbx6cqRqM5164Duuk3Xrs5KkM/vbV1aoGq8sfCJ9TqL0aiK6PKSMGfxyW9vv79DijpuJxDoknx2RwhRMxJrqggy23sq3CDML5c7RXUhKVCO8twM7TZ3kHutyRHJKU/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572957; c=relaxed/simple;
	bh=B2RGeXABwxiX83QA7bO5Q1sJq8lQtsYmlXwf+SlYyP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxCz8xwYE2nnDDhWm+mbxj//y+Cslis3wLqvtvPHW6t6WUTUhPwj6oJkT6HwLu8EILv9zOdTRC6IB6IhDhm4UQwvP7ic94WU5i0CCnOqJ4EHVynfIJbp9oagYGCsqIGriYj8JehAUQSLYxSArkVu5syZ27wHXM+UgnmqonIEVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=neK3kwQU; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="neK3kwQU"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B2RGeXABwxiX83QA7bO5Q1sJq8lQtsYmlXwf+SlYyP8=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787572953; v=1; x=1788177753;
 b=neK3kwQUHK/dBLjSwcaA6FaPILOC0OqENrEhVm8F8iCEVYITPOCKsmdbTIVKDK0NNlCwNo+q
 OvO9fraiAAnPC8kNf7pJ4Z8+Am1/cxDHWnQdNFkqgXpdRSj//Ibc90u6DdgmyfWOw3MlIQdw2D/
 uXijIhXTXd5p3bU1vhrZkvjgjXIbfHbSclwdXNsLMkyAT5BxygC0abaaGD3bgz4NZBMkBJ3JdRT
 ++sdEJJFeyX8Kv5Diu8bXUmWvyKObQOml/Ury9o81izLO7Su0RHhI+hmYwvV7cYukko6ry5lufR
 bkwEskJVcXFJBMJxebC96tSqTxAmOK13kwZK9LASP8liA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 56456962caa09406;
	Mon, 24 Aug 2026 12:02:23 +0000
X-Mizu-Trace-ID: 56456962caa09406
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 20:02:19 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: process: Capitalize Git, Quilt, and
 Mercurial consistently
Message-ID: <aowyywsvZD_-rqSu@wyuan.org>
References: <20260824100050.12315-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824100050.12315-1-ducthinh100812@gmail.com>

On Mon, Aug 24, 2026 at 05:00:50PM +0700, Nguyen Duc Thinh wrote:
> Update various process documentation files to properly capitalize "Git",
> "Quilt", and "Mercurial" as proper nouns when referring to the source
> management tools themselves.
> 
> Instances explicitly referring to literal command-line invocations
> (such as "git log" or "git bisect") have been left lowercase.
> 
> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> ---
> v2:
>   - Fixed the extra spaces before ':' in the subject line.

Alright, thanks.

>   - Reverted the accidental 'git switch' changes in submitting-patches.rst to keep the patch logically clean.

Really? But I see that is still here in your patch below.

That said, I suspect that some agents might simply prefer to do such
convenient things without informing the user. If you have used it, it
would be better to take a look at the corresponding policy, btw.

>   - Regarding the scope: I did not fix every single instance across the entire documentation subsystem because the list is very long. I am primarily submitting this patch to gain hands-on experience with the Linux kernel contribution workflow.

Fair enough, welcome.

> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e..b6ca49437 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
>  using the ``--base`` flag. The easiest and most convenient way to use
>  this option is with topical branches::
>  
> -    $ git checkout -t -b my-topical-branch master
> +    $ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
>  
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
>  
> -    $ git checkout -b patch-review [base-commit-id]
> +    $ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      $ git am patches.mbox
>      Applying: First Commit
> -- 
> 2.50.1 (Apple Git-155)

Thanks.
