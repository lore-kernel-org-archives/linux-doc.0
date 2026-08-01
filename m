Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A978835DA63;
	Sat,  1 Aug 2026 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607585; cv=none; b=CJfhSrx0pOaI6EL5oOqPkhIZ4SQRQuqwHSbAJdLibCAHT0rqmhW1dbtYQ4M28qfnnZfoX2Aj/F4EPYjQPJiwEv2na+JeXryRZEIVZsHJeCsHnxttTi03yugCWb1weTWe+cntc+aIp5R76EYDRBOs2ZjkhPvOxENUewTOMP9ei5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607585; c=relaxed/simple;
	bh=4HPWD8mz6JzY1qqDHkccYvCkbPUtJjNQ2Bv/0/0vnpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/O0tdvl/+AlYIUOgXv+aQqDz3IbC+X0s8uRwGxUdPSjSe5EIY9Puom070jqkIhNEGgpOwSDpun62JigKFd7YrIbqVuTD26k826CkB1Gj93i7/a9W8vNGrc/+JkPgNfC/DT1GQTYoXPWH52DETuBuGHN0k0RAAdms417HdHCXAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mJkQPTyn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mJkQPTyn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/gYJ0FtWqeSp4VlnAl6EefPzJDH/jtpTSYn60b33KKY=; b=mJkQPTyn7QyYSf1t7xKxmSO66S
	HcZtNAxQwAqHp8RT2k3AcIty4pWo7qwSeqy5NfZiw3K7VPJX2AU1+zDRd5Gxf+zrmPQ9ismd1FHSc
	Q4Qq6io3PKhTucRcOHcab/A37ChaGyK3xzKBUJnPR2ET6v7noM7As7XsQ00y8d6DfnZ/Od9CjA3Zm
	FT4YHssOOexdF0T/Auztj/6z+fAm+6QAtfu0R2WP+Gpp0Qpdyx+wW3sSwmhUZVljwQApkt72zcIa9
	J8d7VIs9ossm8Em8u9I0S8QDjQie+hYn+hcFAKiCW/njuk+5oeumJyOHPtH3PT6lKczFTjlCQ0GaB
	C/OEUxOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqE67-0000000EwVz-0Jmv;
	Sat, 01 Aug 2026 18:06:11 +0000
Message-ID: <86572838-e816-4d1c-8077-d6faef5be3ce@infradead.org>
Date: Sat, 1 Aug 2026 11:06:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ipmi: fix word order in create-user description
To: Lukasz Tymoszczuk <lukastymo@gmail.com>, Corey Minyard
 <corey@minyard.net>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260801111804.3593320-1-lukastymo@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260801111804.3593320-1-lukastymo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/1/26 4:18 AM, Lukasz Tymoszczuk wrote:
> Correct "allows to you" to "allows you to".
> 
> Signed-off-by: Lukasz Tymoszczuk <lukastymo@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/ipmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
> index d08cee98e34a..062c38d93fbb 100644
> --- a/Documentation/driver-api/ipmi.rst
> +++ b/Documentation/driver-api/ipmi.rst
> @@ -280,7 +280,7 @@ Creating the User
>  To use the message handler, you must first create a user using
>  ipmi_create_user.  The interface number specifies which SMI you want
>  to connect to, and you must supply callback functions to be called
> -when data comes in.  This also allows to you pass in a piece of data,
> +when data comes in.  This also allows you to pass in a piece of data,
>  the handler_data, that will be passed back to you on all calls.
>  
>  Once you are done, call ipmi_destroy_user() to get rid of the user.

-- 
~Randy
