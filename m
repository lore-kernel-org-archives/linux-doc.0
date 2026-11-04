Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759505;
	b=F5M51bPASEh/Pl3Yw3BUctt8Mglc4zV/Jifxv8+XB6TLXUck0hpq6Rzsao3Xq7AriCkQ
	 5ImWjH6OUhasXJ361HZtx08toFJr/gjBmDaGJ+MbbuDIc/urWVtfDS4OD3MJ3+sYtPdvo
	 tUIns/0jE8VAoi3btMdYff6Z9lXbjkniVUGg2E/39SYJo4JxI4tsjAoBYkWJI6bXmbgWE
	 AwEPxD6R4vPj/VPdQ/tOSfEiX7cratBJAZhnycQkUPhYolrA+ht0voLq71XGspoWKXyl3
	 jDAcgUs6JA6mrs/JsSitjteXaa/VgzTvYuLicpgkTOZvzbaSZinIffYyzWpEHJgXIEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759505;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KpIailOT6zTz1ZDOWVRUyepJuCxKy7Kcrt65ylPjS+s=;
	b=AbZ+7h4GbaHbOcslaQMneqWmVYU8TmczLtjsJRLBRa6wB/lPDg+XQkHRo9wesWa2GQhj
	 gm3pCr1XqfYs2SMAwR11Jnlf1hWRsUlu0ihYVaTpLUa/waZOXWIYqAxT9tOQEPkLRv5Jw
	 r5Zw7ZAsc9rLhyGNc0nY9ZpFkXhtTg6YjSb58ls8gu7oX6lMxGP2jkV8nitHjnp3EoTud
	 QPHdz4lH0QHsLP0NCTYm6Uwp8aeB3uzQ8tuJP69NMa0mUrY/l+CuQrbsVd6xPoFWMlOa+
	 n0Gp521rVnwD2no3n1zuQslHv461DdtbDSYoq9vADlfSGbYkdY5MVLJEymfPxmoeu3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JvjsTltC;
	arc=none smtp.remote-ip=91.218.175.100
Received: from mta0.migadu.com (out-100.mta0.migadu.com [91.218.175.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA2606A326
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CAA2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JvjsTltC
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KW0TeR7Ixk8cNAO1ivyvwa7MNW21jOj+tAZvidZp44c=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793759502; v=1; x=1794364302;
 b=JvjsTltCfM6EduDPsH5bI+IFS4gQv3tDU8NFYrzmKZobdGYF7GiNYq927fmIWcttnnNsW5kJ
 Nib7z+SIsfks9EhO7U1xq+/msFkUZ+D+WzjPd7aHFE9Klo3f1fkOhimN/rp9acPH3L29XHOIRYq
 AQwu4Qv5WXz4ZeJe7hAW0mwEo79KO2Y5vhkoC6C6Uy9ylQv9HWPyvDh32Qe6Z2lBsyf/S4hseUa
 VjqxIX3/rIjtir/S1EltNM7M2qQaN7Emyw4LAEYHM84xLPGZY6ZdNojcUFpqxJ9AztSNje3lKr1
 5/xbhwjJT6VsrPoNydBMFtQBu2D8LszcVHCSgBdvb9ylA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36fd9caadc958bcc;
	Wed, 04 Nov 2026 02:31:41 +0000
X-Mizu-Trace-ID: 36fd9caadc958bcc
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 10:31:33 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Weijie Yuan <kernel@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create
 branches
Message-ID: <auqZBQbcfn7mMRIN@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ardqGdjnd7kC1B-E@wyuan.org>

Weijie Yuan <kernel@wyuan.org> writes:

> From: Weijie Yuan <wy@wyuan.org>
> 
> Git has been promoting "git switch" since git.git commit 328c6cb853d7
> (doc: promote "git switch"), and the command is no longer experimental
> as of Git 2.51.0.
> 
> Suggested-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>  Documentation/process/submitting-patches.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 4c28a239e8cb..63a5550bd490 100644
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
> 2.55.0.1055.g20c0e7c0fb.dirty

Junio's <xmqqwlqt4lwj.fsf@gitster.g> reminds me of this patch.  It seems
to have got lost in the flood of patches.  Any feedback would be much
appreciated, while this is only a minor cleanup. :-)

Thanks.
