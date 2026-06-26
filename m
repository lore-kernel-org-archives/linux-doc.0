Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B253EB0ED
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468477; cv=none; b=GxvG3PIJ/iIX1p6B4jHAEByFUT/FFdbSZtR7QNUFb6H+iKIFe5DuJ0DVhjuR7A0mN02dvoGG3sWVX/yUT1UB+hwcvZZjnoomPaEsyAlTljXmbRXMjNTL/TiFEJGE2hKx7uJ9dQqCSIbMRMwJFigAYjFs+nqZH3Q39DbkQovabHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468477; c=relaxed/simple;
	bh=vRqJxTrvWCq8wTML6cZgQqGJIvz14gDRbc4515PzAVI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTtTCmhTcdSffapKUryXsznWX3EaUc7TIX/Fmjxv3r4dob0OpW7eS46J7976PGbwRDSZnt6NQdid1dYYOVMbg7zzlalyoy0Xb5u9TrH1vwlbjdOYOGJYD1eZjn2Sl3tOeVpiiioUU5NpmCzNoCbVM8H2NoWXRMCNaomlunq1YRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRrphZ33; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRrphZ33"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3969C1F000E9;
	Fri, 26 Jun 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782468476;
	bh=SjSICcesLMNidWF3YgpcoqOwaqt078t9XXjZB7TZQwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nRrphZ33yjZJHUV/EVRQ/plgietEuN0WR7DyAgpVcbJ8Ua01/IEkx89pgjHuT8fpI
	 1HcsKo4UcT38DaFrRGOqGZXXn7qgf+Npg06QqZybI+vuXGwuwQYPWriy8WQJO/LCL1
	 u+q4h+msgzl/g19nQVXw2/fUBBIus0dEER/DwRNBShH3k8AVfX3Utb3sZDOGVbnuM2
	 9BcF2pD/nCChY/37isBvOXD2ZnCR+R8PC9iCPpAOYWbbIiAxLgsV5sr2adPkRTqmAr
	 T8/nQz8Ux+GTAzzqpV1ipdTx4TA5QbWU/2BTFj7qndaC9NhPW57y8wNW+Ist6rJ9tc
	 EFZUrlpPU4BFQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wd3TR-0000000Bi6T-3657;
	Fri, 26 Jun 2026 12:07:49 +0200
Date: Fri, 26 Jun 2026 12:07:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Docs: conf.py: fix typos in comments
Message-ID: <20260626120749.2f3dc318@localhost>
In-Reply-To: <20260626005248.1121464-1-rdunlap@infradead.org>
References: <20260626005248.1121464-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Jun 2026 17:52:48 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Change "variabled" to "variables".
> Change "relative patch" to "relative path".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
>  Documentation/conf.py |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linext-2026-0623.orig/Documentation/conf.py
> +++ linext-2026-0623/Documentation/conf.py
> @@ -61,12 +61,12 @@ manpages_url = 'https://man7.org/linux/m
>  
>  def config_init(app, config):
>      """
> -    Initialize path-dependent variabled
> +    Initialize path-dependent variables
>  
>      On Sphinx, all directories are relative to what it is passed as
>      SOURCEDIR parameter for sphinx-build. Due to that, all patterns
>      that have directory names on it need to be dynamically set, after
> -    converting them to a relative patch.
> +    converting them to a relative path.
>  
>      As Sphinx doesn't include any patterns outside SOURCEDIR, we should
>      exclude relative patterns that start with "../".

-- 
Thanks,
Mauro
