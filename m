Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133A2F999A
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112927; cv=none; b=f5Zfv2g8qFpt2yZyo6Nt2nOQp1HWWWT4q8eygQ7xcp3/liDKomtebPB4Cnq3ko5Tv6sxRt5erKAuSc0F655SIgP+uJxmrxSscsIBIgoyczMD3wlAHV8QKbZ6dD1Mrn9mNLRM7XPR/Zj3uJH+zFU3IltSlXu2MGKfJF5fbxrvNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112927; c=relaxed/simple;
	bh=w0ouKptykXmNigxZC5kHw1IEzuv4psf7+p8nEWC69Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Caaf8ld1zTOgwzctwDTegt7JLxvmCORFA72RVZXtEBIUt5Q0PMeqgMOcf4vVT6MjYkMwquoA0dZK+WHQlmqFAiqSsk+d2jLrHPH8Ip0tcE1vhSFVyDMI1umFHPzzd69yAAXOANVkZiw6OH0Dz20CoYsWoDn2uDszXHnrbzyZzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rZigzKGS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rZigzKGS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pggfmbdpGZOyYC0NJM+dTAZP6m/p4pfU1MFCzI4Ifm4=; b=rZigzKGSGt5jG9U+tuFXQYEeMR
	qMyvmJERodOJVtVDOF6KBXn97KcF8LExaHhrOu2dbYX6FTv2gB/Xi6bR885OSRiO3pQmJEKSc+Il9
	Je3eGlX9kq+suX+PvrGFJusPbwiKre5900IiSwMyJ49K8a5YrQKC9yX003phV30eTrhEH4aZ/tv8b
	LVMcwhnX6MQmV1KLXTQXvYmGpc6rsdFuScyqx9WO+DnmN9uZNBaM0/3psR6OcztyfTNGP9QY5Tgta
	/Iz+R54C/j1Jhd5+6JqgEtxAEFTt88e2ZvqPQQdTrPFZeCH0ofcYK0ArKJqLArYA9CXf8Uq7+n8oS
	/qWtDSuA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umH2y-0000000EmmM-0rdm;
	Wed, 13 Aug 2025 19:22:04 +0000
Message-ID: <7daf2e6e-cd33-40d9-8ae5-d4cd08ff0162@infradead.org>
Date: Wed, 13 Aug 2025 12:22:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel_hacking: Fix minor typo in
 hacking.rst
To: rakuram <rakuram.e96@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 ukleinek@kernel.org
References: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
 <20250813182434.7189-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250813182434.7189-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/13/25 11:24 AM, rakuram wrote:
> Thanks for the clarification, and I apologise for the oversight in my submission.
> Could you please suggest the best way to check whether a similar patch has already been attempted before sending one?

Well, I remembered seeing one recently so I searched the archives of the linux-doc
mailing list (https://lore.kernel.org/linux-doc/). In the search box I entered:

b:"compatibility"

but that's not going to work for a general case. For other patches to the
same file, I would change the search argument to

b:"Documentation/kernel-hacking/hacking.rst"

HTH.
-- 
~Randy

