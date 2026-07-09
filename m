Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE07430CF1;
	Thu,  9 Jul 2026 16:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613277; cv=none; b=fikra6i+QsJBVpEWbsgpPtw/lMrmJvGxBNZXHFKPpbigbeLz+w0hY2VCf8w3lJcQXJS/AwUils7HXe9258yUxFTZoiJ9OM6vRvbkFUte3NUwzSzw9YnwHn/YsxnWUPjNGq5fBPxodxMJMCecsfnJsLpCznxIVl9mMCXvjMIc38A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613277; c=relaxed/simple;
	bh=PnKg2JIuvoh8F2F6VCTDzTBDp5JC3YGYITROXMJD5JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgDC7NCKUUQ7gR+ihn6W0leFTdNkhn79opgVrZYtdq4bUeb1eqwZzfNb/RZ+XDy3/jNcld1e0JozaZ1difrWV2ieCI9b1E4yecjQjJVU2mQGdeIGAQZRFvm5RZT8r4Kj0T5tszNnSZt4ZhdTjnY9hJxcJZP0QzrQZlXL+9JjhVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PTAiH/jt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PTAiH/jt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HcBMb+6D4S/K7r/BZ0NE4SuMZ8OElwJqXphji4FvtZU=; b=PTAiH/jtEJm1yxmaCijGbqdlt8
	xgSjh+BybPuJ9sM/pjlKVp7rmkUfRMx58NLUCpy3CzdCbJHUTb206+WI4PStvbzbTpVUVmL/3fgj7
	VV6dP5fK5bOHdZKmoImSvswHsEkjrFNMWlIS77Xa7BDnRVlP0vdR6Oq7Y4fgN7nD163ZLNqOvguuF
	7a5MiNM/tst+aZIh4NXskgHb9MmQ+aC9LU2ROngdC8l7uO6idaX96MMJiSu//llscMoBFFzwVwdVH
	QkKdPjAC7O+ZuddBmsYbWNxf2d2yPqLb97CQ5HWYI+q/DfbD1Jx1jPk2qMPUbqziba0a+F/tVs152
	aiM9WIIg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrHz-0000000300l-43Oj;
	Thu, 09 Jul 2026 16:07:52 +0000
Message-ID: <6bf7fae9-9b77-4970-87a2-2ef5da049656@infradead.org>
Date: Thu, 9 Jul 2026 09:07:50 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] errseq: add missing bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
 Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709092900.380694-1-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260709092900.380694-1-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/26 2:28 AM, Manuel Ebner wrote:
> Add missing ')' to nested functions of code block.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/errseq.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/errseq.rst b/Documentation/core-api/errseq.rst
> index ff332e272405..d298d4cd2f60 100644
> --- a/Documentation/core-api/errseq.rst
> +++ b/Documentation/core-api/errseq.rst
> @@ -143,7 +143,7 @@ Because of this, it's often advantageous to first do an errseq_check to
>  see if anything has changed, and only later do an
>  errseq_check_and_advance after taking the lock. e.g.::
>  
> -        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
> +        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err))) {
>                  /* su.s_wd_err is protected by s_wd_err_lock */
>                  spin_lock(&su.s_wd_err_lock);
>                  err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);

-- 
~Randy
