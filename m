Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C9A1A8405
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986366; cv=none; b=gtJqMDbDjcT0pheHN2Y//5uqys5d5GZQV9iuxahsSx1thTxVbavEvScS1q2ennkRiY0IvPMKTv4M3Er0NLkQ2HO38bySz02/3o3/wtl/92fDnoyeg81kDjpFyPmqDTLqriqUziyS9KuVcs5uiAl92DRuj/YCzOceYjaV9teeSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986366; c=relaxed/simple;
	bh=LdNrLWd2uxuafdhTuCSofMH8+0+Hg3iJQFHH8rsVdic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBUHnFAFHvIxujBSpUjNoVXRQkB0wrGBBdIevb2S71UyFttdmy8RG6LqIw47m2pHe8DRzs3v0IjAHuey9eSinhUwmhy5XbufbR1EgK+5zB8bqEEbEGTobCqmxzjccf6TNjCWTUTalPW2meE7jDiIYEXT/KGhNlqc9YyyDcqD2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVLhrJ6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVLhrJ6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08B6C4CEED;
	Tue,  3 Jun 2025 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748986365;
	bh=LdNrLWd2uxuafdhTuCSofMH8+0+Hg3iJQFHH8rsVdic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gVLhrJ6OtTbH+HUZZhiaUPrnqjCIOZ/1g0Cc0FwLniIlnsWDa0GyohhkPwli6VCyp
	 r5cDJPpGXvWNAyinBieTFKNULxibg+Csv8n7eY55Qe4XKM1KXuy4g9aLdnNS6hQhW3
	 YAUl6WuvYzqaDcTiU6x8GQjFslIDwfxPIbC1V8xeJfQT2kec2/CWINwgaa51sUu/YB
	 EforI52wm7lUzZ/SqUo61b1YOZx2VDLVsQQq0wgv8n7WjgSJvCvGOv7bkYMkCtJfAk
	 XUYr0f5Ih6G22/sYAnYm4SxNheYiOJoBn1oCHKXbvEQF6GNcxNvjswNqUGZl01yH7i
	 fFQorVnaySitA==
Date: Tue, 3 Jun 2025 23:32:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Remove some Sphinx 2 holdovers
Message-ID: <20250603233242.3892f356@foz.lan>
In-Reply-To: <87h60wlp6g.fsf@trenco.lwn.net>
References: <87h60wlp6g.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 03 Jun 2025 11:17:59 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Remove a few declarations that are no longer doing anything now that we
> have left Sphinx 2 behind.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/sphinx/automarkup.py | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index fd633f7a0bc3..347de81c1ab7 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -150,20 +150,12 @@ def markup_func_ref_sphinx3(docname, app, match):
>      return target_text
>  
>  def markup_c_ref(docname, app, match):
> -    class_str = {# Sphinx 2 only
> -                 RE_function: 'c-func',
> -                 RE_generic_type: 'c-type',
> -                 # Sphinx 3+ only
> -                 RE_struct: 'c-struct',
> +    class_str = {RE_struct: 'c-struct',
>                   RE_union: 'c-union',
>                   RE_enum: 'c-enum',
>                   RE_typedef: 'c-type',
>                   }
> -    reftype_str = {# Sphinx 2 only
> -                   RE_function: 'function',
> -                   RE_generic_type: 'type',
> -                   # Sphinx 3+ only
> -                   RE_struct: 'struct',
> +    reftype_str = {RE_struct: 'struct',
>                     RE_union: 'union',
>                     RE_enum: 'enum',
>                     RE_typedef: 'type',

Makes sense to me. I almost removed it on one of my patches, but I
ended forgetting about that ;-)

You probably can get rid of this too:

	#
	# Sphinx 2 uses the same :c:type role for struct, union, enum and typedef
	#
	RE_generic_type = re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
        	                     flags=re.ASCII)

As this is used only on the regular expressions you dropped.

After removing that:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks,
Mauro
