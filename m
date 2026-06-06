Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B24E134CF;
	Sat,  6 Jun 2026 18:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780772389; cv=none; b=XsJWErDllHcKmlxlqxVQJLi8UKJ0wzclt6V8lOA0zd+OgrZ3KtC8ijUnAJmgOcg8pATWCO29+YvecCCj7AbR/4RtS7F+vT5BBC66MKBEwsA0cehqgP0TwriFysh2JJ0wj6CZ2hmOzshjPkwIrTAYDVrxu9JOalWHXtsdVKIDXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780772389; c=relaxed/simple;
	bh=aHDvCVVGudfBcsyg5x5B+E86AQMYP5rs3duHhKD4s5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CN0isXFHbEylMsl8vFQ1ODBtjpwgMNOerzpe4RrKf9AwvXQ/99ge6Pic9cAhANZfwdrPjTg2EXkzk3Zmk8zwlIRYsTPLkM7TGNOtsEktSQl16A3H4bN4KfvG7cUM3WWwtPkKMpHEuMtc8Uq/mvHpVD3zoRD3wrlkkioVEiGmoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B0VwpPpl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B0VwpPpl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=G9xMlKbda2wWF2+KerXG3xXZTMVOgIoa95passNBlbE=; b=B0VwpPplrnMx4CCnhmbWoI0Pis
	rh8xTHQw6xNf8EEhv4SNDu8uPaYU9uGsQIfdr1fk9Zh51NoSFXAUwhwM5ga4OtveaNObsXV1F7+5t
	QnqdMrcgUm3k4He6erGzgk9iQGZ9NLqfJnX4idFmwPtDeCrpvg8RGK6tDBMdVLgLwsGq3ZLTfPDVw
	tptnv5cTMxI+PVFdXzwG1kHRwUwspdyTHDAsfkmLJk7gz/+tpYrOV12JtdF1VRuo9YTKSM08Hn9Jm
	dvEGLn6jyQwNykuHBUpsQ9X3RoXTJN98WpN16lTl6ATbp959uvhLhRR+y8LY1yB2qsYUQmdRVYOVO
	MwAoK9Yw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVwF8-00000001lRQ-1dBG;
	Sat, 06 Jun 2026 18:59:38 +0000
Message-ID: <671457eb-c24b-4f33-a1f0-96f341d67116@infradead.org>
Date: Sat, 6 Jun 2026 11:59:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: bug-hunting.rst: fix grammar
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260605190055.15921-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260605190055.15921-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/5/26 12:00 PM, Manuel Ebner wrote:
> Fix a grammar issue to improve readability
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/bug-hunting.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> index 3901b43c96df..642bf8474726 100644
> --- a/Documentation/admin-guide/bug-hunting.rst
> +++ b/Documentation/admin-guide/bug-hunting.rst
> @@ -63,8 +63,8 @@ Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
>  annotated with "+", and "being unloaded" is annotated with "-".
>  
>  
> -Where is the Oops message is located?
> --------------------------------------
> +Where is the Oops message located?
> +----------------------------------
>  
>  Normally the Oops text is read from the kernel buffers by klogd and
>  handed to ``syslogd`` which writes it to a syslog file, typically

-- 
~Randy
