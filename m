Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3C8634F
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762224334; cv=none; b=ROBpW8BGrz6DsioDuHeCMMhvwfnbVYwa+7W1i//Hdr2iiBunj/gVyw5pu9Tvu5XCFA4KMcdDskLVy1nH2b6N+sic6o741kF/MnnsUfE8daDh1pcLsclcfYNqKtrPTgLUuU/f6IrE3nn37CiE4r4Yfiwb4aPpUgz2xLH2d2C55q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762224334; c=relaxed/simple;
	bh=l9rZ6acW8SsPCh2UKcQYsk640DMr0yIUHFV5blAdyyg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HBvEWXcoGZZDvZ2EuZZRZlPiE9M92v7JtQNxwPv9pdLzQjjwJckzM2mh4QSyoXEBPaROVSUCWx3xfGNFucYmzaVZHPDkPYFfHRtLkjjHBwXlP5HWwVsjoI4itIQN7b+ONYl+TtzEEwB67HwkUOPATGVAjAYkMApyA4xA1P9Esk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C/wG5fW6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C/wG5fW6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=EjcocC0HnpAy+uT+t8kfyaZhoBfYZ3HQgkHRKdcaCC0=; b=C/wG5fW6tIPp3XB5HncJC3TDsw
	+t26At/6LQFRNB3aDsvnmtyOmNgFWXyCKcQT9Gzzo+VHvC68tF3LBb/30gMuqkLJkB94IKKfNujQ8
	pP+SUCrrqnf2+Vgq3j4mDxPU0ri5D5muniV2PQE/U0UpiSO6vVh5l9Dg+ZBEmVJQjufmFChPlgI8l
	/HiuhERkr6RvYFvm16RLUYpVjswvrpYRwxrVaUJxXTWGLfV/TIyU7DSyUFfDs7Yav1hD8Al+AhCXH
	npOI8JHK6LxzQ9Nu32lCNE4HR2HDKjy4O/0VSggg+4uBPLN/XkKho9QSgAPKG6TRZ/2lnGt/w0v/f
	TocVv/fA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG72z-0000000B00t-1zod;
	Tue, 04 Nov 2025 02:45:25 +0000
Message-ID: <5eb4fa80-7591-422a-9e23-c6661318b705@infradead.org>
Date: Mon, 3 Nov 2025 18:45:25 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: W1 bad URL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

This URL in w1/w1-netlink.rst seems to have disappeared:


2. http://www.ioremap.net/archive/w1

   This archive includes userspace application w1d.c which uses
   read/write/search commands for all master/slave devices found on the bus.



Are there any other sources of this application for the documentation?

Thanks.
-- 
~Randy

