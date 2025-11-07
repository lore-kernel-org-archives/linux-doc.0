Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3712432AAC5;
	Fri,  7 Nov 2025 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511698; cv=none; b=OhVuKXZXUDnOxGZ48swhLMMyqGZzL290eR1jALck5oOG4C6YnrfJxj6bhdL7HWfslFSnWGU8TZ53QrzSNQ2dToDHA6Y4QAGQ9wIsBH1mphl4mzlHFG/qsHnin7r92ZDKJojBBYe3DwN5vBYn+X3UwXbEouaJuvdFvJpk4RmXqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511698; c=relaxed/simple;
	bh=2dFHh/cudpev/kjghh4QhgSZ03OeJgU5jQMoCUJa704=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEdh2rAMv12gTzNAZ5d1H7ywEDfhPQJ8R20IDy3FeT39+xiTC7uGnOTdgaJAracBZwyMKtFoG7sWVYVCXpoOVDt7g2ESfPwOsoItuRy3R0581rHxuEA0x5GNmqzXZH6OAz6TqnJCU254rRVJDkzIUJOcLk/F95Q49KTObB/57IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LndbUPaa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LndbUPaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A645C19422;
	Fri,  7 Nov 2025 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762511697;
	bh=2dFHh/cudpev/kjghh4QhgSZ03OeJgU5jQMoCUJa704=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LndbUPaaNlTa77wWfweXtEfVrDgmTXFJGJXiASDXEnNAlQyTPIAHgcYrBT5T9+3lm
	 iLxaUYodoXLgtWX6ThuYZ5bOZbBWggsjbVlnPcuj8368ftypDiWhkFHsl6g2tvYfs7
	 JI0n+Y/17AkQ120EA0mCwGumZMwUkHS2vf968mqkACSLjtFynghuMPczD4XoVT8AkY
	 Mw4kXAGXSWn8eMCOGOpXS25Va5bpgiBhb7mYiDDNEaW7qrl0AkYXgoKTx4TeB28iCW
	 ydo8vLYyHN7xRso53OCLTH/dWw8IQF34S/O6LU2OYvNUIJ9kqjKBlSqDiHgHCCGf+Y
	 tY0ZL19mXEH9w==
Date: Fri, 7 Nov 2025 07:34:52 -0300
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Jani
 Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3 0/8] Collect documentation-related tools under
 /tools/docs
Message-ID: <20251107073452.6213b493@sal.lan>
In-Reply-To: <874irkp97o.fsf@trenco.lwn.net>
References: <20251024200834.20644-1-corbet@lwn.net>
	<d3f4c7ee-6351-4c6f-ae93-f423245c4c9e@gmail.com>
	<20251026073405.0672c9dd@sal.lan>
	<874irkp97o.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 27 Oct 2025 11:04:27 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Patch is incomplete, as it doesn't drop the logic which forks
> > kernel-doc script run, but see below.  
> 
> So I clearly hadn't fully understood how this works.  Before I went and
> broke things, the logic seemed to be:
> 
>   If the kerneldoc_bin environment variable is "kernel-doc.py"
>   	don't actually run kernel-doc.py, build it internally instead
>   else
>   	run whatever program the variable points to
> 
>   ...
>   set kerneldoc_bin to "kernel-doc.py" by default
> 
> This seems ... a bit obscure. 

Yes, but it was the best alternative I found back then :-)

Regards,
Mauro
