Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB8939AF9
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714665671; cv=none; b=khdBa6IhWp1OEJV0nEdNDE5lJJl7k9EXideUu/D93HuGS7bDiQ7ya+u1PB/H4u4Kbwbp8fsT3B8vrFFkXy0IFtqFA2BFwCgHQP/Uzoh4i+EN3gx3mbiOPS3d3LKpMyZLFgPMwdqkHRMspNIC0Ej7Rd0pYAcpT7jq5O6jjrioAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714665671; c=relaxed/simple;
	bh=EzOmkD0cMn2H4/QPfenDBg5jJhWNUUPSnjc/IguNCpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dyhrgPRzvU9fVR2fpAcFwIaa6vsXIma+CC55xVMH43bFoPHmcguqXR0I18B8vvQYUOJCcQe2OqD92k2h7aCkRvx2z0h9NgWKhmXapEXhNoOURINh8CSesuGfpkgH/dhZCjjDDCXbaJhTemfaRiR6zU6xLLtSGKMqCEqHLO/SBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iztJNwm5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iztJNwm5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AFCA547C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714665666; bh=hOxwFRG/nb4s7VXTG7o6ZKzPrfZ0O50hS7rMCweQijU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iztJNwm5BEwSJ+Lr2a5N7aOsgnRz5GZptHdvn7eoOfKruFgeHc5Vgse23JYH3s7Kl
	 uuk2YfbeQRPh544WjTco1Nf0zYT25pqXo5mUcwGw7Khod+rTHUJLg0r/1cJKUoC6Hl
	 y0rJL6NzBZ31UPt8XAQZ3iaZMaOCIuxUhYhIMrTCxZVhUO2+GRcfavtjGODIEuXdkW
	 reV5b8vXkNgXCXVRM2CAWIEKxduHhHJiEH6v3b89fWVmV0uAkPsdneV3bZLWQlEqGD
	 JcWMkyuDzWPwjtm8ngGApaHzxPMx3kZFzx9HdcKngsOKJRrGemM/0RyPVG+HGL1q/9
	 vW6GqHEtZC3kA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AFCA547C39;
	Thu,  2 May 2024 16:01:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: kernel_include.py: Cope with docutils 0.21
In-Reply-To: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
References: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
Date: Thu, 02 May 2024 10:01:05 -0600
Message-ID: <87wmoc6w5a.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Running "make htmldocs" on a newly installed Sphinx 7.3.7 ends up in
> a build error:
>
>     Sphinx parallel build error:
>     AttributeError: module 'docutils.nodes' has no attribute 'reprunicode'
>
> docutils 0.21 has removed nodes.reprunicode, quote from release note [1]:
>
>   * Removed objects:
>
>     docutils.nodes.reprunicode, docutils.nodes.ensure_str()
>         Python 2 compatibility hacks
>
> Sphinx 7.3.0 supports docutils 0.21 [2]:
>
> kernel_include.py, whose origin is misc.py of docutils, uses reprunicode.
>
> Upstream docutils removed the offending line from the corresponding file
> (docutils/docutils/parsers/rst/directives/misc.py) in January 2022.
> Quoting the changelog [3]:
>
>     Deprecate `nodes.reprunicode` and `nodes.ensure_str()`.
>
>     Drop uses of the deprecated constructs (not required with Python 3).
>
> Do the same for kernel_include.py.
>
> Tested against:
>   - Sphinx 2.4.5 (docutils 0.17.1)
>   - Sphinx 3.4.3 (docutils 0.17.1)
>   - Sphinx 5.3.0 (docutils 0.18.1)
>   - Sphinx 6.2.1 (docutils 0.19)
>   - Sphinx 7.2.6 (docutils 0.20.1)
>   - Sphinx 7.3.7 (docutils 0.21.2)
>
> Link: http://www.docutils.org/RELEASE-NOTES.html#release-0-21-2024-04-09 [1]
> Link: https://www.sphinx-doc.org/en/master/changes.html#release-7-3-0-released-apr-16-2024 [2]
> Link: https://github.com/docutils/docutils/commit/c8471ce47a24 [3]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/sphinx/kernel_include.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
> index abe768088377..638762442336 100755
> --- a/Documentation/sphinx/kernel_include.py
> +++ b/Documentation/sphinx/kernel_include.py
> @@ -97,7 +97,6 @@ class KernelInclude(Include):
>          # HINT: this is the only line I had to change / commented out:
>          #path = utils.relative_path(None, path)
>  
> -        path = nodes.reprunicode(path)
>          encoding = self.options.get(

Applied, thanks.

jon
