Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C513B19A0;
	Wed, 27 May 2026 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911436; cv=none; b=mrAi1MAoqu5Um7ST5/rRxhyZtZragqT9R6NqAxA0SSffB7RLOnTkss54En/qhuqcGfBv+hNRJGmMqYg0gsIxdfxanalT8huSEtXOD1LxWG14mcfbtlcePmSjjBzTg0ro9B2F06Xda5A7BufVxCjyLnwUlC8A3T4Sb5CK18wLvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911436; c=relaxed/simple;
	bh=Hlcw5NmDdhXZKNv+/z2jeagFAksri84BWr7P8wwGYNM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bqg6HooM4MTRw9NuDeIfUwsnMl7OFv+lPMxGS8aoQaasuAQ9wkJlo/SxGd259wgo62YPicXNnQgmzMFLBDGn56pwcif7mJsjkjHcOAZChtoXYiz1Ifxi+3tdWsO0W1lzaLvTmRPKIlTH1ZG/KEOmuuG6JVCnvpv6JoFwVHGmDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y5G2G7M8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y5G2G7M8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C71F000E9;
	Wed, 27 May 2026 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779911434;
	bh=72Gz2NsTX3fg94N46zv80p0uplq9u+H7HG+tAgnNYCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y5G2G7M8GI8nodHw68ElsQlY3SOz5wwHEMUtA70B+QukbaRS53+iCic26tCx0xhEX
	 INr16cLT2gH80YbU40eN256vRUgMZQ81yDmeiYVvPsQcMgs5ev2/8h2TwVEHjHphhU
	 t7rBVz4iXKmqts1GfofhRkfUhIYR153Mj+0sKSmM=
Date: Wed, 27 May 2026 12:50:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: Re: [PATCH linux next] tools headers UAPI: sync linux/taskstats.h
 for procacct.c
Message-Id: <20260527125034.ba695164344d2645dd055af0@linux-foundation.org>
In-Reply-To: <20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn>
References: <20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 27 May 2026 21:35:58 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Background
> ==========
> After commit 9b93f7e32774 ("tools/getdelays: use the static UAPI
> headers from tools/include/uapi"), the Makefile was changed to use
> -I../include/uapi/ instead of -I../../usr/include to ensure tools
> always use the up-to-date UAPI headers.
> 
> However, only linux/taskstats.h was added to tools/include/uapi/ in
> commit e5bbb35a07b3 ("tools headers UAPI: sync linux/taskstats.h"),
> but linux/acct.h was missing.

Please let's Cc the author of both of these commits!

> Problem
> =======
> This causes procacct.c to fail to compile with:
> 
> procacct.c:234:37: error: 'AGROUP' undeclared (first use in this function)
> 
> gcc -I../include/uapi/    getdelays.c   -o getdelays
> gcc -I../include/uapi/    procacct.c   -o procacct
> procacct.c: In function ‘print_procacct’:
> procacct.c:234:37: error: ‘AGROUP’ undeclared (first use in this function)
> did you mean ‘NOGROUP’?
>   234 |  , t->version >= 12 ? (t->ac_flag & AGROUP ? 'P' : 'T') : '?'
>       |                                     ^~~~~~
>       |                                     NOGROUP
> procacct.c:234:37: note: each undeclared ident
> 
> because procacct.c uses the AGROUP macro defined in linux/acct.h.
> 
> Solution
> ========
> Add the missing linux/acct.h to complete the static UAPI header set.

It has always annoyed me that we do this by copying the file.  I'm
surprised that there isn't a way of using the original file directly.

> Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from tools/include/uapi")
>
> ...
>
> --- /dev/null
> +++ b/tools/include/uapi/linux/acct.h
>
> ...
>
