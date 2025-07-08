Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D59E55B
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 19:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752003151; cv=none; b=qrjG1Yn5q2vDbZ+vkwVaDOkp/3n6IDcR8SyzOiw9HlAwB+BUWuYHCdIIadYVBFTaaJ6WZrxp1yOvKktQSlrwYEz0qRry2zTieodbUS8svz1Wi9/2XSmrj7PSa+2z5FDZt0+nnhOSIOhVs/w9elWfJqynZO66nU9g0WHj0XiZoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752003151; c=relaxed/simple;
	bh=RwK6tgIFPH8HSYPA5RLI9kPCl0+y/45IOf5J0y/qaE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgE+UABaG6UewNHWjZ5hrRFG1YwvzXskc9xKoVHB1BA1SQ7xospCA3FvIyaOCBUnO6/A0RMZp6fVuw4/yy5TOCvaLR73JNojzVgjc/Z2jcbWHvobSsCw1FR1nhJ8Isooy5LAXQDvav67afcJHqY4wI/R1dOBzjbFdh8y9mZh3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ELMT7SSw reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mgNkGIC6; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=AUnVZ3PL; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ELMT7SSw";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mgNkGIC6";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="AUnVZ3PL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1752004037; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=vow2LS2yIOmbNmmVTiqKXSu2tQNynqPkCNf2Wz6HwfU=; b=ELMT7SSw002KEbp0uf+hzGhngk
	tNWZta1DZeihFbU2QqxYeJo8ckmH4Y/VAYJLdl/te3oP/yFzo4Lg8oNkrHkksn8AgA6kB0EnW325A
	OeWMV2qXAyOAgtc+NMoAcdQY22+dxPCjox0EHiO2tVvsEfCUnD5fKTd161DdDfDHYrI26avzrUSaB
	c1S12gD9xo9Gr8KRos3LV+MXCvLnYmr1tWSNT5Cn2vBOjCONYM7MHNmEa5iNnJNDHWFH8xdJhMnVd
	wVteasbax7lWGy0962s1BMXVWmeeDBNf4GAGUC09117DK7hKsa5d4dA2NQT0Us0A/uuGa/kazsBqI
	l2t9zAqg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1752003137; h=from : subject :
 to : message-id : date;
 bh=vow2LS2yIOmbNmmVTiqKXSu2tQNynqPkCNf2Wz6HwfU=;
 b=mgNkGIC6ZKNIXeP45/0GLcaORDPpdh4lfIW4EaiM0OUMuyB08C90QfIMOwcbyb+ZD4TEw
 PFvcIco5wSU4oSfzDuvArV5eLPEp2piXCZFmN5XANtnV6uZCkXXjlZ6eb19YSrqqAfdcLjb
 oDGEKG8cWWX+uXf8YeikwA9nBQxpTYnvt2OvD0WIKdKxJdg/MIdyPpjcb5vwOJzUbwKA5zL
 v8jeJlRQn6joSQY7NQa95vTyTJ8YsBJ18RRfXe3vDb/cTWA+H+hLBzBblZgoRloub1JUhKK
 OWGjKL0//eyPiQx95ui3RMJkoYeNyHqpjU+zgk9XwxXDpvXxL1LZ5+QYM+Jg==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1uZDtV-TRk4fw-Oj; Tue, 08 Jul 2025 19:22:21 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1uZDtV-AIkwcC8pbj3-HrOb; Tue, 08 Jul 2025 19:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1752002535; bh=RwK6tgIFPH8HSYPA5RLI9kPCl0+y/45IOf5J0y/qaE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUnVZ3PLysOpgJ+O8nXLpyp7L2FFmrtLXoWI62GfnvwC/PalgKc1I43LPpH/vnDe/
 ifG0VOUDSoZqhBoPTcumAdCLwj4RYYkDN3WxQ7dYFghaQrRspuLXd2tLysOIQt2EJ3
 6YMoxi8AKL8SaSVWfGfNYALjBRiGuWcEGJFZ0juM=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id BE4773E698; Tue,  8 Jul 2025 21:22:14 +0200 (CEST)
Date: Tue, 8 Jul 2025 21:22:14 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthias Maennich <maennich@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Hildenbrand <david@redhat.com>, Shivank Garg <shivankg@amd.com>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] module: Restrict module namespace access to in-tree
 modules
Message-ID: <aG1v5v0cIy5X70UD@fjasle.eu>
References: <20250708-export_modules-v1-0-fbf7a282d23f@suse.cz>
 <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
X-Smtpcorp-Track: 7dgyo5o_3Or-.DgKyek3ap2m-.LfNmlwwhKbZ
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sW3z-ZDckN
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Tue, Jul 08, 2025 at 09:28:57AM +0200 Vlastimil Babka wrote:
> The module namespace support has been introduced to allow restricting
> exports to specific modules only, and intended for in-tree modules such
> as kvm. Make this intention explicit by disallowing out of tree modules
> both for the module loader and modpost.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  Documentation/core-api/symbol-namespaces.rst | 5 +++--
>  kernel/module/main.c                         | 3 ++-
>  scripts/mod/modpost.c                        | 6 +++++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
> index 32fc73dc5529e8844c2ce2580987155bcd13cd09..dc228ac738a5cdc49cc736c29170ca96df6a28dc 100644
> --- a/Documentation/core-api/symbol-namespaces.rst
> +++ b/Documentation/core-api/symbol-namespaces.rst
> @@ -83,13 +83,14 @@ Symbols exported using this macro are put into a module namespace. This
>  namespace cannot be imported.
>  
>  The macro takes a comma separated list of module names, allowing only those
> -modules to access this symbol. Simple tail-globs are supported.
> +modules to access this symbol. The access is restricted to in-tree modules.
> +Simple tail-globs are supported.
>  
>  For example::
>  
>    EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
>  
> -will limit usage of this symbol to modules whoes name matches the given
> +will limit usage of this symbol to in-tree modules whoes name matches the given

If you keep touching this line, might you fix the typo?

s/whoes/whose/

Kind regards,
Nicolas
