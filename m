Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F7850240
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 22:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432441; cv=none; b=oATSt/cGMR5naxsP8/hGSFBNBW/8qwaB+Ez4MxQa1BzoUl1kUHxC7ZLzynIfRsOxSGKOWuOFXkf8mqnrnXVla0DNig2yNcsICSUsLVJBdGCGKZBSmYoxydiCcmux3xeFzepfrwJH5If3RhXnwZBiMgafofMmnxZjgnDmIOTCl08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432441; c=relaxed/simple;
	bh=XGnfatujS/6dwVTGCxvJAjzTI5SU9NzAb/+VStPhS2I=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UgBuySfidFg3N0F5dF7Jjz+20+WXUss1ZnnCrkuBIpemwXP13gx3etr/kKKomD0nRDNOihW7KTdHXD+KmK7foHiF2qajNDAnuVY8+CSH4e6BcKdW+YdVRy8Q9nOCMhFWCmyZXevy95njVfPUypRGMD7DIaO9EUgQGZO+k1ghG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KpL46RCZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KpL46RCZ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1374445917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707432435; bh=xPLyYaWmRjwHNX9MQtZKbv2j9BNH0GbJ2Xk9JaAst1Y=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=KpL46RCZDEyKmQAx26MNAoS9Pw5O9iRHon8OGQj9K9P/psLrb0QFrVb+XARtn0cp7
	 YKTtOD3KA8ewDYfpojyaX5Ng0tCFSdpTubHyuVJ71nUnimjX/rra1tWq1M90JPbXpN
	 u7cg8abSAjQKID7FWGKTyv7Rdyq5PthsAf5VZAWqzIbum//kX8TlbXPqnXrQ8lPa2F
	 dspuqYPl0PZVMgnu5M4Wl5+qWVxT3W0Q6rE3Z9qw0ZbciFLu1bCR2qrBzd/NPta/KL
	 dbGA5HxUzj1VIcchO6Tk87u6Kz7ZxoLf+iPpj+un8J3BnLQ5WYN5fKO6mspoqajMIf
	 Ruuvdj8VxdlXA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1374445917;
	Thu,  8 Feb 2024 22:47:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/1] docs: proc.rst: comm: mention the included NUL
In-Reply-To: <20240206022237.794761-2-mail@christoph.anton.mitterer.name>
References: <20240205154100.736499-1-mail@christoph.anton.mitterer.name>
 <20240206022237.794761-1-mail@christoph.anton.mitterer.name>
 <20240206022237.794761-2-mail@christoph.anton.mitterer.name>
Date: Thu, 08 Feb 2024 15:47:14 -0700
Message-ID: <87il2yfua5.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Christoph Anton Mitterer <mail@christoph.anton.mitterer.name> writes:

> Indicate that the actual value will be one character less.
>
> Signed-off-by: Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
> ---
>  Documentation/filesystems/proc.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 104c6d047d9b..c0e92a056079 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -1899,8 +1899,9 @@ For more information on mount propagation see:
>  These files provide a method to access a task's comm value. It also allows for
>  a task to set its own or one of its thread siblings comm value. The comm value
>  is limited in size compared to the cmdline value, so writing anything longer
> -then the kernel's TASK_COMM_LEN (currently 16 chars) will result in a truncated
> -comm value.
> +then the kernel's TASK_COMM_LEN (currently 16 chars, including the null
> +terminator, which is printed as the line feed character in the file) will result
> +in a truncated comm value.

I don't understand the line-feed comment at all; printed by whom?

I think I'll just apply the first version, which explained the situation
well enough.

Thanks,

jon
