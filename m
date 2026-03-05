Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38EF378823;
	Thu,  5 Mar 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702658; cv=none; b=ckj531w525iUftAh5tPYIRH9VhIR0HEbc7IN5fClKOAzf5pAD6n+GSFE2Tgqdjmpc6lQjhGHoL2lzfkqh09+5zeXSxwwB6uzzmgCQhIpnf3vRh3+Ncdt/7h1sCvzoouuSqgt4Cvd0ahSesinwQwAjrfHjbUTX5FTEIXmpw5IWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702658; c=relaxed/simple;
	bh=lUDRicC7Vv6SprcL6c3m266WFuvy4RKYmdRkAzuIffQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FSe7xcMtxJBUszYuOvJhEnp14PaOCjJWUofpC0F8aC+7+aXrdwHuhOCRkj8Dxjqq1fvgouhs6HUgDvRNoZo7mJl3AgMT+cXa5wBZ+kGBM5qvZyZhuuyxc0UK9SDR0AnojMx8xZAS3B9ytYwzGRvKnsk3I+vQZStOvuXvkvy4M+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 74994BB447;
	Thu,  5 Mar 2026 09:24:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 5BDDF2002C;
	Thu,  5 Mar 2026 09:24:13 +0000 (UTC)
Message-ID: <1d96c26a14026c7f914e95fba1af10e7a2726bda.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: fix '*' wildcard formatting
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>
Date: Thu, 05 Mar 2026 01:24:12 -0800
In-Reply-To: <20260304224201.1072044-1-rdunlap@infradead.org>
References: <20260304224201.1072044-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 5BDDF2002C
X-Stat-Signature: 7hz7httjd59o98kkuu14qahpyjw5s5p5
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/4Cquh9LDbYTT7B/YzoFyzXQvsUNjuz4I=
X-HE-Tag: 1772702653-472053
X-HE-Meta: U2FsdGVkX1/KogpMLYLD6Rp6HG3N7D/PJpMD0K60Q2z3BCaWmo5mJgX6IL+zUXvoRWZuNshUh9N93UHqXzpNXmQocahLyjr8OVk5ES/5BexgSdhgNvB7R1Ml2Z5S4jwM9wyP4iQU1O71XV0Asd3JArBdI3N6ZO2Qv4ZRsOfrO7d8U9VQX3KDheWFGGBEL/pZHhD0wYHfN4bjINY3mCFOCr3nvJWKtxsdv7+kUKozEFOD+HaM/BcRmn2z8/jD+p+Jf+8hKu1AnCiUazcWUR/Jq4pOtrl61IRdO1RvugnWJAufC26rj8/McOgmT4MIFK/DXI8aW1OclvHv87vwBZ77Fhn/3VF/kgVTIeEl8yVJIFbyF0ba6IPYNkWQRs0Xil2ncgSrJ/gejjGK95fOg5nL4TGXyiZqNrsWcJANx/7yUkWCOhfblMDLBtD4JkOFhJKdjZXyt+2hLl+ZTydRUB34xZHNF7eYj007lMSgrenROYcCH9wLftBrkWKanHtzXSbAsUXNWOr9Dis=

On Wed, 2026-03-04 at 14:42 -0800, Randy Dunlap wrote:
> It seems that these wildcards confuse some parser (docutils, sphinx,
> or maintainers_include.py), so quote them to avoid this issue.
> Also insert a hyphen ('-') before "all files" in several places
> to make the html output easier to read.
>=20
> Fixes this htmldocs warning:
>=20
> linux-next-20260304/MAINTAINERS:40: WARNING: Inline strong start-string w=
ithout end-string. [docutils]

I think there should be a better way than this.
This just uglifies the perfectly readable ascii.

>=20
> Signed-off-by: Randy Dunlap <[rdunlap@infradead.org](mailto:rdunlap@infra=
dead.org)>
> ---
> Cc: Jonathan Corbet <[corbet@lwn.net](mailto:corbet@lwn.net)>
> Cc: Shuah Khan <[skhan@linuxfoundation.org](mailto:skhan@linuxfoundation.=
org)>
> Cc: [linux-doc@vger.kernel.org](mailto:linux-doc@vger.kernel.org)
> Cc: Kees Cook <[kees@kernel.org](mailto:kees@kernel.org)>
>=20
>  MAINTAINERS |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> --- linux-next-20260304.orig/MAINTAINERS
> +++ linux-next-20260304/MAINTAINERS
> @@ -32,10 +32,10 @@ Descriptions of section entries and pref
>  	   Type is one of: git, hg, quilt, stgit, topgit
>  	F: *Files* and directories wildcard patterns.
>  	   A trailing slash includes all files and subdirectory files.
> -	   F:	drivers/net/	all files in and below drivers/net
> -	   F:	drivers/net/*	all files in drivers/net, but not below
> -	   F:	*/net/*		all files in "any top level directory"/net
> -	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
> +	   F:	``drivers/net/``  -	all files in and below drivers/net
> +	   F:	``drivers/net/*`` -	all files in drivers/net, but not below
> +	   F:	``*/net/*``       -	all files in "any top level directory"/net
> +	   F:	``fs/**/*foo*.c`` -	all *foo*.c files in any subdirectory of fs
>  	   One pattern per line.  Multiple F: lines acceptable.
>  	X: *Excluded* files and directories that are NOT maintained, same
>  	   rules as F:. Files exclusions are tested before file matches.
> @@ -44,7 +44,7 @@ Descriptions of section entries and pref
>  	   X:	net/ipv6/
>  	   matches all files in and below net excluding net/ipv6/
>  	N: Files and directories *Regex* patterns.
> -	   N:	[^a-z]tegra	all files whose path contains tegra
> +	   N:	[^a-z]tegra -	all files whose path contains tegra
>  	                        (not including files like integrator)
>  	   One pattern per line.  Multiple N: lines acceptable.
>  	   scripts/get_maintainer.pl has different behavior for files that
>=20
> ```
