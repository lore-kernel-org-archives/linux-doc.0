Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F82FABEE;
	Tue, 18 Nov 2025 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449936; cv=none; b=dfhNEeB+PUqmN2XoIIGBNEGt/OGqR5h6JAG9LYYJz4uSWmRAGQwIK49OqpCDd6Cj6wllaoovISSH4mrB1B9/f2NNk9LmY1EWLJGqyainwlNT3QOX2U7ulOSb/40LjFGzdKkjdneNWIzra+o3N561MMBUInIOJCHj/a+Da782YxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449936; c=relaxed/simple;
	bh=fh+LUPYN+Ou4se7CDT4p2ot+qRuMvGQPL7FtkC87dk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPHd1lfWaqR00I5viM7nxgVpDsV7xSK9RYFVwnetS4uKHXORCXMVAHHQBeh0M0F8oWP2t1B7FtKVGPPdrMHH1uSW0OjEnoIu694WKUo8WwvVgfhsyl3mYjn1aFrIFmrheOfhsH4NjQPLw1YvGLzi3xs0ytHGeoLsm6O2bK+KE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CPCRoNFn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CPCRoNFn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=K2qyZjKDkK/fAxAy5mI7127fW/5nBS92L5fIxGN8Lrs=; b=CPCRoNFnqIuq4Gkp1c4rq5qg+g
	2Kov4j+z4hvr6M+rRV0oDzyxy9Xwy82GoMzq90FbjK7U73Ro8Ar+Qrye/gStNQ5lvPIWNFvODJepz
	BapqjDW/6csCcKr4DElZUNlUvSxOLjnwMr2AlOXTjeGIWIe6nCxxSe0apBa+y8JLiYdMfiqH2omEx
	HjDmpZdBJVL25uBPlACRzY6NMmdh4hUwWo1tAm4GFrUsrcKB5Jn+/9yHiWvLMwQRDPvnL4/lXYVI1
	Bmcvf7HXtpX4RGjSCDOWbjkS4bWv48dIjKjqG09YeCK7k6d1XJsq2vRKekFBjnzRSHVSEh3d+GaRW
	+KB1+FDg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFsr-0000000HXge-0JhU;
	Tue, 18 Nov 2025 07:12:13 +0000
Message-ID: <6017104c-740d-43db-bc53-58751ec57282@infradead.org>
Date: Mon, 17 Nov 2025 23:12:12 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/admin-guide: fix typo in cscope command
 example
To: eanut 6 <jiakaipeanut@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <CAFb8wJv4pUusuW-NsSsa-v-WuHZmbHS8Ha9mydqQPrBAMMQt6w@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAFb8wJv4pUusuW-NsSsa-v-WuHZmbHS8Ha9mydqQPrBAMMQt6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
[adding Shuah]

On 11/17/25 10:56 PM, eanut 6 wrote:
> The documentation previously had a typo:
>   c"scope -d -p10
> which would confuse users. This patch corrects it to:
>   cscope -d -p10
> 
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  Documentation/admin-guide/workload-tracing.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/workload-tracing.rst
> b/Documentation/admin-guide/workload-tracing.rst
> index d6313890ee41..dbdbed4a1b41 100644
> --- a/Documentation/admin-guide/workload-tracing.rst
> +++ b/Documentation/admin-guide/workload-tracing.rst
> @@ -196,7 +196,7 @@ Let’s checkout the latest Linux repository and
> build cscope database::
>    cscope -R -p10  # builds cscope.out database before starting browse session
>    cscope -d -p10  # starts browse session on cscope.out database

This makes the lines below agree with the 2 lines above,
so it looks good to me.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Could you also fix the comment below, please?

> > -Note: Run "cscope -R -p10" to build the database and c"scope -d -p10" to
> +Note: Run "cscope -R -p10" to build the database and "cscope -d -p10" to
>  enter into the browsing session. cscope by default cscope.out database.

                                           by default uses the cscope.out database.
(be careful not to go past 80 characters on that line)

>  To get out of this mode press ctrl+d. -p option is used to specify the
>  number of file path components to display. -p10 is optimal for browsing


thanks.
-- 
~Randy
