Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A07E335574
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954505; cv=none; b=blq0jNjcpNT7Ox8UQtjWcRsv5MmiAYiIg98SKRs3ZmNUGXfoZ5ijevJBWWifVfSVYwnAkcdHf8swsKsITLNZUzSZyoTCK9GheSs0uTFRgT6XRCvAd+VejHBrMMNze4QQYxAnE8jvBgRtikENfisuyBb3EhgsJupPowGpdl4I0Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954505; c=relaxed/simple;
	bh=3yybAuZWsAu4hxw3MPl3c3Tj62W75rjSQw2gRB6t6zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF930vjgwj0lV/AEu/9S+j6LfjLwrsOKsDv56QsFhRUuEebeMdCemoOLUbhJ8AFVDcLB+kMv1ritudRU6sWzJer/saB2UL8dxlNsqe0UF8FJkGuE0VTYjicePmWIqW+SQiHVamrM8l90ircLuUcCPKbRdHanYaZQZVM0JeyGVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnGu4Cfs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnGu4Cfs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E86C2BC86;
	Wed, 12 Nov 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762954505;
	bh=3yybAuZWsAu4hxw3MPl3c3Tj62W75rjSQw2gRB6t6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnGu4Cfssj+srlDHMGR1YoAkZmNQEjkP7qf3OIjMKBBmKl/Bhay30RV/DkYbS7cLB
	 +S0hZaLWNnibLRc8rdEsfFIrnllXdMMbv6egpjR6L7Ds9KjP+3xV1CidRu0FJdrHzr
	 L3QV6xzfb0PA4OraaiEUbvsxvug6cwL903urPDPo0OA5nf6m2KZOrU+rhFflYOtEzY
	 spJ+q96KetG27+4nWRJ5u1Z9UpOTlUO/GiYCGo4jUWKwTkEHoQMA+3J8EwoRk858CC
	 9WNEv050GLbcVjvT8NAiXQaR7C8q5HWGJ4/kpUi6CeGa+S4xBifvaLOmSEIIrI00xF
	 oRLi+ixcTTpjA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJB03-00000009SuA-0CBG;
	Wed, 12 Nov 2025 14:35:03 +0100
Date: Wed, 12 Nov 2025 14:35:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 3/4] Documentation: include the boilerplate for
 SPHINXDIRS index link
Message-ID: <jhrbxpwu7ef6f72mxxsw4r4xstte2ncydotp4ygmnbwmw7e4lh@hfhaitekjgc3>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <87e4998a80a32d447555d35940bee77aa14a6813.1762948491.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e4998a80a32d447555d35940bee77aa14a6813.1762948491.git.jani.nikula@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Nov 12, 2025 at 01:56:53PM +0200, Jani Nikula wrote:
> Repeating the index link boilerplate everywhere is tedious. Put it in a
> subproject-index.rst snippet in a new sphinx-includes directory, and
> include it.
> 
> We'll have to use the relative include, because a) includes are relative
> to the source file, b) top level include with
> /sphinx-includes/subproject-index.rst does not work with SPHINXDIRS
> builds, because the root is the subdirectory in that case.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>


> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 574896cca198..b9a43ee32a00 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -38,7 +38,7 @@ else:
>  doctree = os.path.abspath(".")
>  
>  # Exclude of patterns that don't contain directory names, in glob format.
> -exclude_patterns = []
> +exclude_patterns = ['sphinx-includes/*']

This doesn't work the way on might expect. The problem also affects
patch 4.

Basically, when SUBDIRS is used, include and exclude patterns need
to be dynamically calculated, as, instead of building docs using

Documentation/, the logic builds inside documentation/<directory>

So, instead, you need to do:

    dyn_exclude_patterns.append("sphinx-includes/*")

To ensure that it will pick just the right includes directory.

Regards,
Mauro

