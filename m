Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4832D9EF6;
	Sun,  7 Dec 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765129375; cv=none; b=dxXvUJ7RoqgTBRTIDwAXmFurkmaFCbfLv7ZWEhnG0GmG0zXbjIfhYKo8qd7jf00f8z+O7OMQbLSO0VPNsRfT/AGxpOwo8ufFMB15ZssGqmnEMAMOp79liARa809HKa075YPy5LBtYIdadfvMS4ENhmUheuShcYMMIi3hKvGs05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765129375; c=relaxed/simple;
	bh=Njxa9k+AnnPNhbd93VoFYWZY3uYzZ7iOJkoICzWBm40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jErIkx67C5qUsEfUnMiZaDcd3LCy2ge7tKEIloVeBl1W5WZdsNU0KLf5EsqMJUG/8T5lDTcmyfYQGAVgU6+8vIgSBpitPenEcD50EgvJhdMAqD9eERua5bHjBqTEMZ8TqS8rF2sGCUdg2Gn8qTIF87r4Z6Ny/mTUoEoVijSRPDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U381Zo3n; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U381Zo3n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ou0IKRw4UnC/yybrH+1T19wYyTiCM5n7FOfDO0Q9ly0=; b=U381Zo3nPwbMa5DrjJ869CScd9
	Kna2iM/rbheiOj1IreczfI1qlytGof9x4IdX+zfDdi+AkWDE+DyQz6SEXX0YPSSnDcwLQU98jSpoT
	xc1jtkaz4BPiuG030nbDQOWRK6hiJhoFnIjQNHicAXBYZJJ3N5MAV1S/JZnz31dNJdlUQ4SqBjJ3k
	YcJisKgC0O6WpMpxj2JEmrM5SiHVThhzzzSegiGEw8lps97vENjKfQ195+t0y0pOvd6HRsDdu3uFE
	1aNnAES1D7j19NrqIm23rP/+9A5ibHDEoJXST/gzTfmBxXIjZJ8+8R39PF9khPyyTkOPh2RT4X9Nb
	HEpaWPYg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSImS-0000000C8Ej-1ppW;
	Sun, 07 Dec 2025 17:42:44 +0000
Message-ID: <c2edab0f-3351-42fb-84d4-f588ce6dcd9a@infradead.org>
Date: Sun, 7 Dec 2025 09:42:42 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: improve introduction wording in howto.rst
To: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?=
 <kartikpro9599@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/7/25 1:37 AM, ᴋᴀʀᴛɪᴋ sʜᴀʜ wrote:
> From 56985c72f365c7f0e9ba8ae66ba99c198c15128c Mon Sep 17 00:00:00 2001
> From: kartikpro9599-hash <kartikpro9599@gmail.com>
> Date: Sun, 7 Dec 2025 13:53:02 +0530
> Subject: [PATCH v4] docs: improve introduction wording in howto.rst
> 

The new text looks good to me. However, each patch should have a patch
description between the Subject: and the Signed-off-by: lines.

See https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
if you need more info on this.

> Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
> ---
>  Documentation/process/howto.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index 9438e03d6..dd840115f 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -3,11 +3,11 @@
>  HOWTO do Linux kernel development
>  =================================
> 
> -This is the be-all, end-all document on this topic.  It contains
> -instructions on how to become a Linux kernel developer and how to learn
> -to work with the Linux kernel development community.  It tries to not
> -contain anything related to the technical aspects of kernel programming,
> -but will help point you in the right direction for that.
> +This is a complete introductory document on this topic. It
> +contains instructions on how to become a Linux kernel developer
> +and how to work with the Linux kernel development community. It
> +does not cover the technical aspects of kernel programming, but
> +will help point you in the right direction for that.
> 
>  If anything in this document becomes out of date, please send in patches
>  to the maintainer of this file, who is listed at the bottom of the

-- 
~Randy

