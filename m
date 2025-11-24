Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6489013777E;
	Mon, 24 Nov 2025 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955680; cv=none; b=EZTJwzRBd+Qen66p7C6RuTq4dTTooX6D2Hdft1vi4gyK8APcMbZp5ng3A/FOFsgv946HZwxv3UPdLvFcLYDju0OsIt7SfhDVADIB2ROoDXbO7c/m5dwHhNCIA4QXmxXKS8VmJIQs2pyn1cJS/DkDbbPXXkyl3mWDxMN4zGEM9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955680; c=relaxed/simple;
	bh=fTuFPh1gu0pT5zDLKGliV0QGHjp+aJDjXG9OGuqkSg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NOoR/prk5vLtz/Nkc6DMWoiMMSxDPGazTIc0MyGmGFd5YYyrAWMT/zawiSDW6g6c8wZ2s/3fbq6ozRz94MHMmagfz+5+aLWG5STehfTcTaDTPCPDYbXz6Nr5NfqKvcIbJtq8QH1tXsxroHoY7PbSGriGSOY56S4pp4wwfcISIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ukll2hQZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ukll2hQZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=zer1I+uzfGatoSqzHCXNp2K0CqxAputY15cJMedciLk=; b=ukll2hQZ79ssaXHNnou1v7sv4f
	SeRe9wnUM+sBkIwkNrMH9ytC4PtGA+c9zhmu9eO36i12x60e3xyka3iYPVkTjueK0Y8dBva0X9lW5
	+irwUN7J6R/BT/xXxNePye1TIVa7zJ6uXPaxIr6E40ZNX5rfwpGhcmPTiB4oqHYmtwF8s9SzTAGb6
	RSKVeLm3E4zwib0eGfVPh5A6vYYqR7W2UDaVJaOgI+y6/LH2gPn+KF13wRMEvi6wOxX5FTS2VV3bw
	WTEtPqy2Y8f/e5zeSNNTvKdauLXUygn7a2aWO6y0degN0iOagRjJ2gtoNGVLZ1FHg7ef1DIj45Dez
	wPiI9EJg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNS2-0000000B2Y5-3SXk;
	Mon, 24 Nov 2025 03:41:18 +0000
Message-ID: <52ca6fd7-9286-4d8d-8611-644d38d79484@infradead.org>
Date: Sun, 23 Nov 2025 19:41:18 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] docs: kernel-doc.rst: don't let automarkup mangle
 with consts
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763814816.git.mchehab+huawei@kernel.org>
 <f68f2da2a5eb1508c4c56b8f59719773b84b146b.1763814816.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f68f2da2a5eb1508c4c56b8f59719773b84b146b.1763814816.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/25 4:37 AM, Mauro Carvalho Chehab wrote:
> This document contains several words that tricks automarkup.
> 
> Ensure that all of them will be inside a ``const`` markup,
> avoiding automarkup to touch them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/doc-guide/kernel-doc.rst | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
