Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2370836;
	Sat, 27 Jun 2026 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782584031; cv=none; b=mqLAAxecs1e7KuL1SlsrUBz/zq5mmI0qIbK6amaKcgwQOAldfaufGWnUkw46CU1OLB6bXbma/PDlENT7w98QLcjKdnQ2AOEEbXWKQ6jZGsU9/HDnQc7ShEKyhwcsZT7ko30kBEhK60+LF8asGwhQbs0/gkQ+hX0MXZQLOK8BLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782584031; c=relaxed/simple;
	bh=BiOcJVMB8N4Ak/yIBnDktAnqfnxpKMjWuWvDSHNolsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g+L13eog2474Nyi1gDtKkQ+w3NhLm6WLpydvex2cm6+wvbTwdTXMV8A5pUIhKHyRybiijSZPDUwivvsXdJb+LFK/LfYFzaMSpKhtJ8Hq+9gDFS2qya18ss3vBd8FmKhmI+b6aVy8m1hrc5Jp/v0A75qGUmvlX99QhWEKfs2bn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T8GBFPn+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T8GBFPn+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=uHOeYxkKAiQhzavro8PL41M7M0u24klFsT/bDBnVfU8=; b=T8GBFPn+xk3ZFm2LU/zXpKevG3
	eEJQ9w0jSqK6H3a8ohov9xiZk50epFupk2cJWVsN+J4nQCFtxUzpXflnJRVGivTuKv03ERZxSsGT+
	ridnhD3ip5WtuZjhwDhYEgFM14Pvvlw+pRry8xnTYdVJ6AySK3cpSHrUrldHNywmuwJhFIO8muWCF
	l1qd/labDeRwbjp0qegq4WcxwFAczETE6iVfPW8NOp9OK0vuhhVISFaDxi+0LiXsndLVD2pV3Zwo5
	jMBe3qtNXt74sVCjwlOQk8rzEjKdcFDcnI5WExP6SsQSX3YKHBIpV7lEebrY8PqA12MvbEH0ugr5Q
	lbjZc33w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdXXI-0000000ChLV-23bK;
	Sat, 27 Jun 2026 18:13:48 +0000
Message-ID: <1d27f8eb-30eb-4f2a-ad3d-54d39e63ad57@infradead.org>
Date: Sat, 27 Jun 2026 11:13:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: parport-lowlevel: Fix curly bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andreas Faerber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20260627092359.30044-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260627092359.30044-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/26 2:24 AM, Manuel Ebner wrote:
> Remove needless '}'
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/parport-lowlevel.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/parport-lowlevel.rst b/Documentation/driver-api/parport-lowlevel.rst
> index a907e279f509..af73741289c9 100644
> --- a/Documentation/driver-api/parport-lowlevel.rst
> +++ b/Documentation/driver-api/parport-lowlevel.rst
> @@ -341,7 +341,6 @@ EXAMPLE
>  			/* Try to detect a device on the port... */
>  			...
>  		}
> -		}
>  
>  		...
>  	}

-- 
~Randy
