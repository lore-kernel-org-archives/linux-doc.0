Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A023214
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="e3Ell2Vp"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21784BA
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 11:07:00 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B2F87536;
	Sun, 29 Oct 2023 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B2F87536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698602819; bh=qIHDyKkopnQk5jaueVw4/Cpsh6Nvtzh18mcc6IGeFIA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=e3Ell2VpBQ5K/S8C4newIzNhefdaaZLAqPAUAwH7Fi4SUsfpMJ0rYXyavrgkchcLz
	 1JZOUV594qmOACyFNMAxTdbYYVDgNjvuKkTeIY14OR3UYZXQdYIXA6MKaPSxBKGujs
	 jKTo5it+G6jLKejsvWsIZoNQGc3BqV+PclbJn6cJ3edfZeJ+g2RkKnZOZZSnynSVAq
	 rhRvDCfUA9zPMKFlxDtJTGvDFesBHkkDVgcWx/muR0srjRUVa0OIRCdPM4fSoCAtib
	 NmbFRcj+W8sbXSKQjgka+wovHkYk1Nz4n2uBKhTli+s2tY7rC7cLVc3uC/3ASKrzHt
	 T/IWnteCsyiOA==
From: Jonathan Corbet <corbet@lwn.net>
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 yujie.liu@intel.com, linux-doc@vger.kernel.org,
 swarupkotikalapudi@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
In-Reply-To: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
References: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
Date: Sun, 29 Oct 2023 12:06:58 -0600
Message-ID: <87a5s15mm5.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:

> make htmldocs has below warnings:
>
> ..
> Variable length lookbehind is experimental in regex;
> marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
> <-- HERE / at ./scripts/kernel-doc line 188.
> ...

So how do you get this warning?  I've not seen it.  Which version of
Perl? 

> "-Werror" option in make command,
> needs "-Werror" to have space before
> and after while running make command,
> hence space checking is sepratly done,
> and is not part of lookbehind regular expression.
>
> Below command also didn't
> show any error:
>  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
>
> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index d660e1f4b483..aa9e3e198d12 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
>  if (defined($ENV{'KCFLAGS'})) {
>  	my $kcflags = "$ENV{'KCFLAGS'}";
>  
> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
> +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
>  		$Werror = 1;
>  	}
>  }

Thanks,

jon
