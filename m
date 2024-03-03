Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFDB5A107
	for <linux-doc@vger.kernel.org>; Sun,  3 Mar 2024 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478961; cv=none; b=lo6ZuA2OgxTotmTrFwzOBTSuscrHQ4xtYLApt6dM7M9W0UNcpKV+b3W8EUW0cMLg/yxcWytvXfXUBxHA3gVQ9BiWtWs6n0f1z/QV2RFvjCeGBXwHKkNNJR+2rGgySSYV3F4oIUwy5z0aAzk3L1ZskST5NdInfYD+sMY3HLr38ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478961; c=relaxed/simple;
	bh=3kvxSuwQ8nZklwG5iHu0nh15RM51L3Np6a4HCNQTTRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gHn1nilHHwPKHVvqwf1Lwbwm0FdQeW1LdkXSSzuvoUU0Ba/SUH8G6X6UDXgFgt8CpBca1qy+eNMH5PMEidpx/bUvN+L/x362gf6fLqbnZE0ClTlea4UZyK4rjq6giSDTzMrJs6dO6KBZflBZZZhOJJxCWu8l7bDV/732zcHG53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XrjEPtQV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XrjEPtQV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5FE62418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1709478950; bh=u/5H4moqKvo4bs1nDfp/IdXMhRJkdeEQR9Ob42G02N0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XrjEPtQVo+1ghb7MYFgg3CL6yM+LXJOh3y/emGWGEic9e84eV2xs+OlI3EnZdPKgk
	 aR+EpJvtBu25fwsKzAqSlzpiyBcGhA2ZzJpi7AFjfvvdq804/573T3nE6yy3SGtTRc
	 E6B+w3VIcx68sH5RfnXFGMSr+SUMUY5pos9sL7k8zM8j13O24lJb6hsbTsvXKVQVSg
	 LnWhawOtW23On+ZA9nie/7bcF+7rgobJUn0KDBu4bVQTzikNqpZKKLOeghoGlM9hQT
	 6e99ZotsdPhjOJBNE9byN+bhkU9lvLLycZ5Pn4xmIyZYZph+rdUvj6x28X1FIFCrKX
	 GJ9d0UKdEatuw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5FE62418B6;
	Sun,  3 Mar 2024 15:15:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: kerneldoc-preamble.sty: Remove code for Sphinx <2.4
In-Reply-To: <ed1ec6f2-0050-46f6-807d-8679f26427e9@gmail.com>
References: <ed1ec6f2-0050-46f6-807d-8679f26427e9@gmail.com>
Date: Sun, 03 Mar 2024 08:15:49 -0700
Message-ID: <87o7bvz6qi.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Now that Sphinx 2.4.4 or better is required, get rid of
> \providecommand{}'s for compatibility with Sphinx 1.7.9.
>
> While at it, reword the comment on \sphinxtableofcontentshook
> for better description of why it needs to be emptied.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/sphinx/kerneldoc-preamble.sty | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/Documentation/sphinx/kerneldoc-preamble.sty b/Documentation/sphinx/kerneldoc-preamble.sty
> index 9707e033c8c4..3092df051c95 100644
> --- a/Documentation/sphinx/kerneldoc-preamble.sty
> +++ b/Documentation/sphinx/kerneldoc-preamble.sty
> @@ -54,9 +54,7 @@
>  \renewcommand*\l@section{\@dottedtocline{1}{2.4em}{3.2em}}
>  \renewcommand*\l@subsection{\@dottedtocline{2}{5.6em}{4.3em}}
>  \makeatother
> -%% Sphinx < 1.8 doesn't have \sphinxtableofcontentshook
> -\providecommand{\sphinxtableofcontentshook}{}
> -%% Undefine it for compatibility with Sphinx 1.7.9
> +%% Prevent default \sphinxtableofcontentshook from overwriting above tweaks.
>  \renewcommand{\sphinxtableofcontentshook}{} % Empty the hook
>  
>  % Prevent column squeezing of tabulary.  \tymin is set by Sphinx as:
> @@ -136,9 +134,6 @@
>      }
>      \newCJKfontfamily[JPsans]\jpsans{Noto Sans CJK JP}[AutoFakeSlant]
>      \newCJKfontfamily[JPmono]\jpmono{Noto Sans Mono CJK JP}[AutoFakeSlant]
> -    % Dummy commands for Sphinx < 2.3 (no 'extrapackages' support)
> -    \providecommand{\onehalfspacing}{}
> -    \providecommand{\singlespacing}{}
>      % Define custom macros to on/off CJK
>      %% One and half spacing for CJK contents

Applied, thanks.

jon
