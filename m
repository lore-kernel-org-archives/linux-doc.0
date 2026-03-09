Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CE18024;
	Mon,  9 Mar 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071688; cv=none; b=hzRY3hhQJDUMfk+bIfr0klUNz1S0TkGc/oVr6Q6ihJBhC/H1xbeBUDD3ha8v0gPOrZUGF1urpqdWHjPBeiWfn+JkOqtHsXNHff+Kv1xmOCmiMpNe0zCn6E/Q9pq899iJfBGDdEo52jfK3iFf5guNO9dYgu06zFeV4JAMa4nLclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071688; c=relaxed/simple;
	bh=l+jC9WfgYrvomBhwxV4emfkoI4UXBrnGpiFzo+C80NE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MSQXSkZSfHETlXWgFzo7d9bVbU0pPwiVSjs5dMCvWEp4s51ybo2abogQN3OFJkUsA2fSoisPauGhACqmc0jtDU+m3GZdVTPyukil3je9lnx6fP/4hdfP9xHLSA4y19dyb156Q1w6O7u6LDvZNh64+/HUXlDjk2siENSQhokgxqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HX7cEUR3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HX7cEUR3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4D56940429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773071686; bh=ZrBiDZvh1f78RuF1rTS0QXSdJymjyO6c7fzrOAD+2zg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HX7cEUR3na3iM/osZulCWBgO2/DmXZkpXH6zPTmWQA3AyfGpC6d7zD15QJfIMnnqe
	 j1avvxf5fBthUyXo8YdMi6qfz/UAyQvGo1P6jtnGiwEDMW5NAp/agPLQ8nd0aJFQR8
	 5YI/PIPYLr0QdMmo0A6EKKJjVGGsPEKDtQspElyundDZrviz6He7zsS4gPpBUgU/rB
	 0UNDLgUNToZVlxySn2DZsyNg0b15lUPA5TL3+PoTTiMnkNP2/m4zIqlPx/ue5s3O1l
	 +8gmBJcor34iwY2u/vVjBpoQwNqqjXy3O5noH5LtQ32wbor6k4TOBSvwWhoemss+mV
	 F4QgPXG4Ncv1Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4D56940429;
	Mon,  9 Mar 2026 15:54:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang LIU <tttturtleruss@gmail.com>, tttturtleruss@gmail.com, Shuah
 Khan <skhan@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si
 <si.yanteng@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/docs/checktransupdate.py: fix all issues
 reported by pylint
In-Reply-To: <20260309074716.10739-1-tttturtleruss@gmail.com>
References: <20260308104135.9037-1-tttturtleruss@gmail.com>
 <20260309074716.10739-1-tttturtleruss@gmail.com>
Date: Mon, 09 Mar 2026 09:54:45 -0600
Message-ID: <87cy1dxaka.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang LIU <tttturtleruss@gmail.com> writes:

> This patch fixes all issues reported by pylint, including:
> 1. Format issue in logging.
> 2. Variable name style issue.

I'm somewhat unconvinced about that second change.  We haven't come up
with a coding style for Python code in the kernel, but I think we do
want it to look at least a bit like kernel code and not just defer all
decisions to tools like pylint.  I'm not really opposed to this change
either, mind you, but the process of getting there worries me a bit.

> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
> ---
> V1 -> V2: fix variable name style name and keep the format consistent with other logging format
>
>  tools/docs/checktransupdate.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
> index e894652369a5..cc07cda667fc 100755
> --- a/tools/docs/checktransupdate.py
> +++ b/tools/docs/checktransupdate.py
> @@ -76,11 +76,11 @@ def get_origin_from_trans_smartly(origin_path, t_from_head):
>      (2) Update the translation through commit HASH (TITLE)
>      """
>      # catch flag for 12-bit commit hash
> -    HASH = r'([0-9a-f]{12})'
> +    hash_re = r'([0-9a-f]{12})'
>      # pattern 1: contains "update to commit HASH"
> -    pat_update_to = re.compile(rf'update to commit {HASH}')
> +    pat_update_to = re.compile(rf'update to commit {hash_re}')
>      # pattern 2: contains "Update the translation through commit HASH"
> -    pat_update_translation = re.compile(rf'Update the translation through commit {HASH}')
> +    pat_update_translation = re.compile(rf'Update the translation through commit {hash_re}')
>  
>      origin_commit_hash = None
>      for line in t_from_head["message"]:
> @@ -131,7 +131,7 @@ def check_per_file(file_path):
>      opath = get_origin_path(file_path)
>  
>      if not os.path.isfile(opath):
> -        logging.error("Cannot find the origin path for {file_path}")
> +        logging.error("Cannot find the origin path for %s", file_path)

Why was this change made?  The first time around, you'd simply added the
obviously missing "f", which seems better?

Thanks,

jon
