Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453670;
	b=ljm6vgoXe/v7t42re29jnjoX5h87uTyiLi2Gy8BxE9fjuoMvWguRqrXOHVSW4QcwnKiv
	 AlUIKixwSvLooXBqdoqXZmHX3hLWtAk3NtLaC9q/F5IBCIdmCpAQkA6JR+JKvW9l2cs8t
	 yIgE2EEXLgqR185RIlqb7MltgNt0MAvqQVtgWzXLLeS7VH2CvfMalSgC/4PP94ZhlzRxm
	 IaE1KBFNFqAFrpiU4MwmAeIQATz7xFy4LFVpt3fPt77mAgjr7Vw8ZNaRYM+BETGXVY5Bv
	 iCvu42O7M94TN1Wek1sK4bDqFsJM7NFqAyZ+PJU5EaX9eUlDS+dk6Uq6830/0djLdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453670;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=n0m5HRYqZtggy9euRJ5CVsur/JK0LZAjXvYyzRlm6fU=;
	b=A/Kv+o1PqOSVNDLVkdzcTehc28R3eq50w7XVnLHQPWGNmz81rJU944EBZw86013/0sbr
	 T1+yu+cNozFtjwCEWrR28I/Pb3aZBrLJXq5uKWmMMVDlnIOEaUwQ1MAd8y/cGv1533NVm
	 uqpLQpR0wBNY3aODsA+C4DAUYXwRj4d56q7kBBJ+8JjMkrEqk8g2x+cELv0fyHOCgHVT1
	 lNAjslHsxByQMW4j/Pc1vVXT1c+08TIrQjluFFVLN0NgQHb6j4CaagVymYlnIXQ6qmRFk
	 9flmUFkeORM9VLq6hvQjsI0pXHsWD5O5xXm3dq1ST8y8fEzEorTDN1zJZHbs/xlMhDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tX1QdlbD;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA05606A31A;
	Mon, 23 Nov 2026 17:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA05606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tX1QdlbD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n0m5HRYqZtggy9euRJ5CVsur/JK0LZAjXvYyzRlm6fU=; b=tX1QdlbDjkJvraVwfTvM8QDyvh
	RVyR4teuR9X5sTzNZBpuoWd2fgVAlypOdFteyxBgrGL8vBvdU+t1n+1+sYrETjQ5uJlRJIeE7TQHC
	KDNp8GV3drDoGgMeIK6irhlq+awViXlwTas562QZZBmEdKb8SidsWDvorvOuT8LMM2WWSYNLcqVww
	RZaz9WHs1Zvdu1Xr/l/X2gBtzBQFbVq/81Ef1Y6KvRzvBcEBDLvuZ1+2PUShJ4a/zUF12WtjeqrVA
	SPKC2XXjLHnKz99yKal0LjVA4eCA0mifwlF3pN55wjSNMkjCIVAxvzbLiAk6OxGc1sRxqYfySx83n
	pkXwHWEA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXW8-00000004IXK-1gTr;
	Mon, 23 Nov 2026 17:07:48 +0000
Message-ID: <ed7797ce-957e-467c-af70-72cce79ebb08@infradead.org>
Date: Mon, 23 Nov 2026 09:07:47 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: digsig: fix siglen parameter name in
 digsig_verify()
To: Baran Tuna <barant@fastmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d548d5aed35fb8b664fcc31dc21773a251205399.1795452233.git.barant@fastmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d548d5aed35fb8b664fcc31dc21773a251205399.1795452233.git.barant@fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 8:44 AM, Baran Tuna wrote:
> The kernel-doc excerpt for digsig_verify() names the signature length
> parameter @sigen, but the parameter is called siglen in both
> include/linux/digsig.h and lib/digsig.c. Use the correct name.
> 
> Signed-off-by: Baran Tuna <barant@fastmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/security/digsig.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/security/digsig.rst b/Documentation/security/digsig.rst
> index de035f282196..25a0d7969668 100644
> --- a/Documentation/security/digsig.rst
> +++ b/Documentation/security/digsig.rst
> @@ -62,7 +62,7 @@ API currently includes only 1 function::
>  	* digsig_verify() - digital signature verification with public key
>  	* @keyring:	keyring to search key in
>  	* @sig:	digital signature
> -	* @sigen:	length of the signature
> +	* @siglen:	length of the signature
>  	* @data:	data
>  	* @datalen:	length of the data
>  	* @return:	0 on success, -EINVAL otherwise
> 
> base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606

-- 
~Randy
