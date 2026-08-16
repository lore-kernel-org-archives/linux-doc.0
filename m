Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920033B27F3;
	Sun, 16 Aug 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786903512; cv=none; b=fo5voPVx9Xevc3wvH+z/1h9fcQKTkZyhbka7xHlxOYE+LuY9HFp3LHipdainVc3dBuNoamnUasJfdAwS++aJPAPR3zM6gVkLFtaEQh6FLmn5zLbCa67pChmrqS7qImKzWEFyyNx8kQ4WvfZegfPPu4atWVzbK7CGSZxOQyncm84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786903512; c=relaxed/simple;
	bh=YoaHAtI1P5uqfMWXJPyh9RG4+3aZIz+Qq7xTSr/BK+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nb6GArLuJpJiYUVHjrT4zQ6CNUFaLaE32IcMgbSJNKF5fhBqxi+MeRXTD9za2WWkdY9RB06MqdHszNrYaXWp+DhvC7SJxgvcE64Mrcj4xEpqO0lQNPs7kqp2f6t/LlhQ57ehIp9RXhXqc8gq7YCWJEldzPoncWAyTxfZpmfnmN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oKhWxXet; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oKhWxXet"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=MrdQvMzpmfvvWZMk8sDz4wRVjl0xR0eyFndsgHqjcK4=; b=oKhWxXetXkfX+85TPubUbqebZK
	Ky2jQPZhG7Gi67eF+7IC9lOEOaAJuLr3SKHZQC63/1OBfeWKFGSkDXUTsYKzekEB3UZFWcAPGO1lJ
	HVhYq+4ZDv3MifvO3qygFUe6vYxjC9Zp7GpRIWBNMNZ7k4F+2YYuq1RtvpgoclOA7D2bAQp6/4wKB
	XFNuz72vjsGZxUcBCM54GG45OYhUQ+nqsHAmwYRjXpJlZIwMWr98KOR+ZBJrZgDKcxFDFXLGVasGJ
	qI4O6cj2OdHoTOCiAn4mqWqaAxPOWrELUCmHdcAfSxGPMHECz191TxOQKCdxA+6QUHQ8EpSWuqwMY
	Yem4V6Gg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfEI-00000004yTY-49sH;
	Sun, 16 Aug 2026 18:05:07 +0000
Message-ID: <db2fca9b-eb16-41ce-b980-151a463c52af@infradead.org>
Date: Sun, 16 Aug 2026 11:05:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc_output: only use out_tail when the identfier
 is shown
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20260816054826.3988516-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260816054826.3988516-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I think that I just found a problem with this.
I'll post an update when I have one.

On 8/15/26 10:48 PM, Randy Dunlap wrote:
> In -man mode, scripts/kernel-doc prints the "out_tail" information for
> all symbols that are found (without the symbol info), whether the
> symbols match the output selection criteria or not.
> 
> This can cause quite a lot of extraneous output in -man mode for the
> symbols that are not in the selection criteria.
> 
> Modify kdoc_output.py so that it only calls out_tail() for symbols that
> are being shown according to the selection criteria.
> 
> Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> 
>  tools/lib/python/kdoc/kdoc_output.py |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> --- linux-next-20260814.orig/tools/lib/python/kdoc/kdoc_output.py
> +++ linux-next-20260814/tools/lib/python/kdoc/kdoc_output.py
> @@ -198,22 +198,27 @@ class OutputFormat:
>  
>          if dtype == "function":
>              self.out_function(fname, name, args)
> +            self.out_tail(fname, name, args)
>              return self.data
>  
>          if dtype == "enum":
>              self.out_enum(fname, name, args)
> +            self.out_tail(fname, name, args)
>              return self.data
>  
>          if dtype == "var":
>              self.out_var(fname, name, args)
> +            self.out_tail(fname, name, args)
>              return self.data
>  
>          if dtype == "typedef":
>              self.out_typedef(fname, name, args)
> +            self.out_tail(fname, name, args)
>              return self.data
>  
>          if dtype in ["struct", "union"]:
>              self.out_struct(fname, name, args)
> +            self.out_tail(fname, name, args)
>              return self.data
>  
>          # Warn if some type requires an output logic
> @@ -763,7 +768,6 @@ class ManFormat(OutputFormat):
>          Add a tail at the end of man pages output.
>          """
>          super().msg(fname, name, args)
> -        self.out_tail(fname, name, args)
>  
>          return self.data
>  

-- 
~Randy

