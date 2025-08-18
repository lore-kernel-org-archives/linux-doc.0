Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6A3375B8
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532748; cv=none; b=DokiCtLk3pAbhKtZC3eaveZfkYoFdoN2zqczJzvOtTwpyWURiZ0J1842IGRvSlmyLnQI0TUEcBGJvzsRKhc380sXas41XOu6goNYQ8Ohl1sSuzvhhMNST70PwCZbb3LSJ4OO55r6SDTx4AI1/4/5AVNyhrA/vxfD+mPuU8K0ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532748; c=relaxed/simple;
	bh=V4ib/RyN/mo0x8ar4U6LNfOgqaG+ll3syFHXRhRqc78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g0YC5eAxrX6CmTDghmH6i4tGmwhzhNuwvNffT8tDPUeKPhIEXg8FeWftdU15MZYpEaaJxJLO4KWLUkg9VFqM5OXlu+F8yxFYT7UbGO3e5fTQPZTZaFCMT3+XTQanmjRtsPc7Xb2yjm9YI2gPOoonAo+h+efDoYcBjXV93YmA8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l7wsbnzK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l7wsbnzK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31BCB40AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755532745; bh=ulSLL5IxO8lNYeCu4KSyTDz+mdlJ/nPyT5ffAzhI9Js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l7wsbnzKZcUsKHwwFbjN25OLyedEJJDuArat+exM21TgbJxSscElIb+416iKITzN/
	 19un5feqQC9LHS3tffDWtD1REYRhOlSOxfiD1iJdVNbmH8NIXBtpM9z/SR6v9YQY2e
	 gU86yEW2IQW7fz8Z8u18naH67KnW5+F/p5ScuUJSA8nIIoetP5BHhDu+G2y8TvkA/h
	 iozT3H/A84AyqGjwMmhf7em7Ag8j5R6GLXF5MTrEFDYj6jVY5iSRAruw4L2Yf+6Krf
	 1jt/ws1FJ20q8bILlEjwxYim9s8JC0v1EOYlj2FQx4nkvfFdi5oqSkF1Hi0AnIc+zj
	 DqcPpIMY4mu9w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31BCB40AB4;
	Mon, 18 Aug 2025 15:59:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org,
 Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
In-Reply-To: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
Date: Mon, 18 Aug 2025 09:59:04 -0600
Message-ID: <87ikikaaev.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:

> Fixed missing definite article "states that the parameter" as suggested.
>
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 445248787e77..7bf8cc7df6b5 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that parameter will
> +a trailing = on the name of any parameter states that the parameter will
>  be entered as an environment variable, whereas its absence indicates that

Thank you for working to improve our documentation.  That said, there
are a number of problems to address here.

- The patch does not apply to docs-next, or to any recent kernel
  release.  Which version did you generate the patch against?

- When you do a "v2" patch, you should include, after the "---" line, a
  summary of what changed since the previous version.  That is
  especially true when you have seemingly just dropped one of the
  changes you made the first time around?

  Ah, I think I see...you generated this on top of your previous
  version?  That explains why it didn't apply.  Please do not do that;
  when a patch needs changes due to review comments, recreate the patch.

- "Fix a warning" is rarely a good subject line for a patch; you should
  say what you actually did.  In this case, "replace a duplicated word"
  or some such would be better.

- Finally, Documentation/process/submitting-patches.rst asks that
  changelogs be written in the imperative form.  I am not a stickler for
  that, but some other maintainers definitely are, so it is a good habit
  to adopt for all of your patches.

Thanks,

jon
