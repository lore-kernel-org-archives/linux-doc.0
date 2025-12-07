Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C35255E43;
	Sun,  7 Dec 2025 06:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765089058; cv=none; b=QGPlyYTnK2oukuzGf0j2ea5BElCygYgAaJo/1V3+1xhlcUSTd/mcgSOIgGPP2tH8DucTCgBoyy+cxriSRYZS7R6wSapiYzg3CJjCMXd/chBBiPvtknz/J4x1td9CRWueQO10IwoMgAVJzq2NDk0JuC8yNWaBixYPYmk7QGv/uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765089058; c=relaxed/simple;
	bh=U+ur7FTr/ssykIDf96Jify3sndNzQs28Tplis90X7d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxjY0CJvV6/0Q+AL7w7g4CjE4OHVLHo4ACSxlgkkOOxs8Qm/3GmM/nguoLTAmULq3/XLPU6nXL38N6cf4GvPPzMOAYXypI0hrDAueKyU8ODu4oMXkk/h7ar2l5iSkkYMc25TgwtnBH+ok2Mf8owGxKhWCorcNepwMF+w3KZkfyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GmfXHZZf; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GmfXHZZf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Je6jD5G35geR8pf6ldKkd+WGngIc7Meww25wgBmBZU=; b=GmfXHZZf33XXL9kzZbm9N0ly5+
	s8DEIkjDD7iDy3WeyGPMLXlpd65m1zCD9Dbyer9bwGjNZmc0GYnVjxwh8i61XbFwCTfSt7zCuCRTR
	d6Cq8Xe8iC5AsIWsIfsbasGBhJYE7X7DjGci+Jnpd+cbaik0WKc3a2vRqRjmg+170CN9idOEuMhbN
	ShJGK7bzw7Mr77sCzOcqKNT3WU89zxsPV2x/5hSLh4rHcKvC4NgDBSsnbNnNaguZfr6Xj59D7qXsj
	t1YaNOncHo0X1PaNXw1ePdye9AFyxmox00xWjDHhPybcx00FkhbfA9U1/WAoErylb0A0ckjiRShWg
	ubibIF7A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS8IE-0000000BWtS-1z7X;
	Sun, 07 Dec 2025 06:30:52 +0000
Message-ID: <93555355-8be5-4e81-a569-8c43adb1986a@infradead.org>
Date: Sat, 6 Dec 2025 22:30:46 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: improve introduction wording in howto.rst
To: =?UTF-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?=
 <kartikpro9599@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <CAOCmVvBR_7KnXwShGmjp-hpxVd18tbLJHY-+pWqjWz_qO9=qjA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAOCmVvBR_7KnXwShGmjp-hpxVd18tbLJHY-+pWqjWz_qO9=qjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/6/25 10:14 PM, ᴋᴀʀᴛɪᴋ sʜᴀʜ wrote:
> From 48d7e03ca7278705283d95b7da75739b97996a66 Mon Sep 17 00:00:00 2001
> From: kartikpro9599-hash <kartikpro9599@gmail.com>
> Date: Sun, 7 Dec 2025 11:35:19 +0530
> Subject: [PATCH] docs: improve introduction wording in howto.rst
> 
> Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>
> ---
>  Documentation/process/howto.rst | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index 9438e03d6..7c7fc331c 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -2,16 +2,8 @@
> 
>  HOWTO do Linux kernel development
>  =================================
> -
> -This is the be-all, end-all document on this topic.  It contains
> -instructions on how to become a Linux kernel developer and how to learn
> -to work with the Linux kernel development community.  It tries to not
> -contain anything related to the technical aspects of kernel programming,
> -but will help point you in the right direction for that.
> -
> -If anything in this document becomes out of date, please send in patches
> -to the maintainer of this file, who is listed at the bottom of the
> -document.

Something seems to be wrong with the patch here:

> +This is a complete introductory document on this topic. It contains
> instructions on how to become a Linux kernel developer and how to work
> with the Linux kernel development community. It does not cover the
> technical aspects of kernel programming, but will help point you in
> the right direction for that.
> +If anything in this document becomes out of date, please send in
> patches to the maintainer of this file, who is listed at the bottom of
> the document.

Each line that is changed (added or deleted) should have a '+' or '-'
(respectively) as its first character.
I cannot apply this patch in this form:
patch: **** malformed patch at line 38: instructions on how to become a Linux kernel developer and how to work

Did you send it to yourself and then try to apply it?

And the second part (last 3 lines above) don't need to be changed.
They are the same as the current content of the file and don't need
to be touched.


thanks.
-- 
~Randy

