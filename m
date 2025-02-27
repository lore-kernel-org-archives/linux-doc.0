Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984422A4D5
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740653052; cv=none; b=MznHskiQ1miVfNWJN/VBuYuWShwx+VgRVei+AFQsVJ2WTL1nd5MXgyTGnkxP6+UcPooAi+yHbgxGwvqh0E1vqu7t+wpuE8UKzYIouPVM4lxZ3+lSYvtg2/XgtHrw1AbhEHTeanUXzTDq8c71iEKxWvz7AwcUBVX6bl8TXMb+3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740653052; c=relaxed/simple;
	bh=tEDdS/gZajm817gZDBDZ4UrcSDHVNYbG4Ol0kmsCq9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mO/hJ39uf4ME4syTeD2ogSLwiEoJxqni+Ts3by/FYOyYW5Twf/m8touCYXIJSe4T8GxGuyRPTzhEyH09gzI6SeQqMGDmFccEnXR7bsjnL/gWKzoGH4dc7Mwf7qcEWe2MPW+vCgLnNx6J5pKzz2rDTDfHsmn47kIJf6q5GzXisnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VpROq8+f; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VpROq8+f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/l/Gbkmng0eFAMz8USK5RoJGdM/GWgyNzonaaTX2eY8=; t=1740653050;
	x=1741085050; b=VpROq8+fZmCFR/o6Mk4x5BYtdhqFgfHxd2AiHShzcg8DvsRS40U1+MgV85Zcj
	LPtAd2NfVvgFDoYOrKqc548+zKP6Da4SyRS0uot9tsFXQ7Be08XeGj/54mmUaBn3amrHblRqzLFYs
	/qW5y8KdhYqkan7f2MwKWBvscx9mIXic/eBbShB6pd1tJqqe9vsITFbu5E4DrnpjK6hRR/jYdnxh3
	54y2iHDm/O/slaWqh8TkOI3lhjW7/emO8yBDjZc26KaII0DPMVY8Eh4UcDHH22+YIMfWZwHG0thTH
	cyEvXH2AqSTCzbsFo/IqGZv1hrGca3fijeCu5RWmNZ5cQiDwPQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1tnaxY-00Ge6d-2m;
	Thu, 27 Feb 2025 11:17:40 +0100
Message-ID: <e341199b-4020-4741-90c2-a0c079edf59e@leemhuis.info>
Date: Thu, 27 Feb 2025 11:17:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 1/1] docs: Disambiguate a pair of rST labels
To: Jelle van der Waa <jvanderw@redhat.com>, linux-doc@vger.kernel.org
Cc: James Addison <jay@jp-hosting.net>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
References: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
 <20250226203516.334067-2-jvanderw@redhat.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <20250226203516.334067-2-jvanderw@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1740653050;93b2e844;
X-HE-SMSGID: 1tnaxY-00Ge6d-2m

On 26.02.25 21:34, Jelle van der Waa wrote:
> From: James Addison <jay@jp-hosting.net>
> 
> According to the reStructuredText documentation, internal hyperlink
> targets[1] are intended to resolve within the current document.
> 
> Sphinx has a bug that causes internal hyperlinks declared with
> duplicate names to resolve nondeterministically, producing incorrect
> documentation. Sphinx does not yet emit a warning when these
> duplicate target names are declared.
> 
> To improve the reproducibility and correctness of the HTML
> documentation, disambiguate two labels both previously titled
> "submit_improvements".
> 
> [1] - https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-targets
> 
> Link: https://github.com/sphinx-doc/sphinx/issues/13383
> Signed-off-by: James Addison <jay@jp-hosting.net>
> 
> ---
> V1 -> V2: re-send using different email client

Many thx for looking into this. FWIW, next time please run
./scripts/get_maintainer.pl and then ensure to add the maintainers of
the modified files to the list of recipients.

> ---
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst     | 4 ++--
>  .../admin-guide/verify-bugs-and-bisect-regressions.rst        | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index 07cfd8863b46..2d1b6f7504c1 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -347,7 +347,7 @@ again.
>  
>     [:ref:`details<uninstall>`]
>  
> -.. _submit_improvements:
> +.. _submit_trimmed_build_improvements:

Hmm. Does not matter much, but adding that "trimmed_build" in the middle
feels quite a bit odd to me. I recently in a similar situation added a
short suffix; here it could be "_qbtl", which is derived from the
initials of the file modified. I'd say that is a lot better, but using
something longer is fine for me as well, especially if it's only needed
in one or two places.

>  Did you run into trouble following any of the above steps that is not cleared up
>  by the reference section below? Or do you have ideas how to improve the text?
> @@ -1070,7 +1070,7 @@ complicated, and harder to follow.
>  
>  That being said: this of course is a balancing act. Hence, if you think an
>  additional use-case is worth describing, suggest it to the maintainers of this
> -document, as :ref:`described above <submit_improvements>`.
> +document, as :ref:`described above <submit_trimmed_build_improvements>`.
>  
>  
>  ..
> diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> index 03c55151346c..1b246d8a8afb 100644
> --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> @@ -267,7 +267,7 @@ culprit might be known already. For further details on what actually qualifies
>  as a regression check out Documentation/admin-guide/reporting-regressions.rst.
>  
>  If you run into any problems while following this guide or have ideas how to
> -improve it, :ref:`please let the kernel developers know <submit_improvements>`.
> +improve it, :ref:`please let the kernel developers know <submit_regression_tracing_improvements>`.
>  
>  .. _introprep_bissbs:
>  
> @@ -1055,7 +1055,7 @@ follow these instructions.
>  
>  [:ref:`details <introoptional_bisref>`]
>  
> -.. _submit_improvements:
> +.. _submit_regression_tracing_improvements:

Same here with a different suffix.

Ciao, Thorsten
