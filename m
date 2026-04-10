Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E28CA52;
	Fri, 10 Apr 2026 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775779734; cv=none; b=Ie5PvaWywSheO+hT7qfWxjQfD3jeBn0hO7YgmgC5V4pMP594c6Ec8U0X3Ui4sEcUWKp3Tgs/1EkclBiz4XZk702AOSgAv0sgxA1yfRdTIYDeyVgA0U5vGceXKazlVczsoxhqPHKrrdobAawI2AwGVtd2JOSjEr60DXDDxiGWnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775779734; c=relaxed/simple;
	bh=ELWN+a5LsWSHaHbDjE6QKxhB0DGIU6ZG/CP5DPTcaTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeLGjY0A3wTTQH5Z1uqbBrAZf/EQLeb9MrJTklQGTVEZ4oqFwAvoX3OT6S3LtxRO6Bu0HQji6VtW7e9GeuWk6yH2YN0P9gxjPaRWuAGVupZuTTSc1U933L3+ABBsKPDVBA2wRON/YCJnz+bOtSJMB4fFYupK8oPRmMwysHDSOus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UdAUPHay; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UdAUPHay"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=RDqNx0m2aNuAaxFHbmee5rl4JB4Bo3c89ceO0rhEiWk=; b=UdAUPHayqOJKB6MzfsWvM25LAE
	fi4tOgnaOkcnQMAs4sLma3CjCAQPrbrjaN5OoX5AmHeepfZ914CHTo0Tj3o5j0w/7euIn4TTarA1O
	DXm6jYYM6AwiwNIzoOkLLvUTtHIP8OqzyjlWM8KjUTmcOxO1fmu3MqEHWzu/Mszlp0WLsWiv+yA0v
	WEKub6eFktRRB9YyXTufVg3pVpQtzDmg6dygBFpAOzGo8ucb34ixUlghEjJkmguXCZEx+lar+26Kq
	jJrhay0bQPL4HCWCmCzs/Ok2xxmLuVUqsKZZZV3bjXw6Y+u+2pw047oiu6l5zM2MIuhSkvYu+Nm7u
	+R9yNVpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAzQW-0000000BM5p-1TFh;
	Fri, 10 Apr 2026 00:08:48 +0000
Message-ID: <72487cc4-b5fa-4a07-bcb5-a6ba479161e3@infradead.org>
Date: Thu, 9 Apr 2026 17:08:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: escape ** glob pattern in MAINTAINERS descriptions
To: Matteo Croce <technoboy85@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matteo Croce <teknoraver@meta.com>
References: <20260409223135.10186-1-technoboy85@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260409223135.10186-1-technoboy85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/9/26 3:31 PM, Matteo Croce wrote:
> From: Matteo Croce <teknoraver@meta.com>
> 
> Escape '**' in the MAINTAINERS descriptions section to prevent
> reStructuredText from interpreting it as bold/strong inline markup,
> which causes a warning when running 'make htmldocs'.
> 
> Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
> Signed-off-by: Matteo Croce <teknoraver@meta.com>
> ---
>  Documentation/sphinx/maintainers_include.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
> index 519ad18685b2..54f34f47c9ee 100755
> --- a/Documentation/sphinx/maintainers_include.py
> +++ b/Documentation/sphinx/maintainers_include.py
> @@ -89,7 +89,8 @@ class MaintainersInclude(Include):
>              output = None
>              if descriptions:
>                  # Escape the escapes in preformatted text.
> -                output = "| %s" % (line.replace("\\", "\\\\"))
> +                output = "| %s" % (line.replace("\\", "\\\\")
> +                                        .replace("**", "\\**"))
>                  # Look for and record field letter to field name mappings:
>                  #   R: Designated *reviewer*: FullName <address@domain>
>                  m = re.search(r"\s(\S):\s", line)

It's nice to eliminate one warning from 'make htmldocs', so this is good
in that regard. However, there are still multiple problems (not Warnings)
with '*' characters in the MAINTAINERS file:

1) 	   F:	*/net/*		all files in "any top level directory"/net

In the html output, it shows "/net/" italicized (that's what one * does).

2)	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs

In the html output, it shows

	F: fs/**/foo.c all foo.c files in any subdirectory of fs

with both occurrences of "foo.c" italicized (dropping the '*' characters).

These 2 examples are actively wrong.

I didn't look at any other possible issues.

-- 
~Randy

