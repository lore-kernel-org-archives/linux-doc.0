Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C134D3B6
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 03:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762227182; cv=none; b=uwXpYGzhZrD/51roDXqBPy8QVeprWOTic9TomUgQwSXmb5uVJvtIgpV+HVBdIlSTHHoAPa/0yJpz2ZXGHg/jYgXe/x4pulQxHC9lV8lY+oGrBQCaV69oMB1lRpcCBhiPXIXX0DVF71ccqSpp7rYerqVoBc08QgpM+PZLkPKaKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762227182; c=relaxed/simple;
	bh=+dI8B7nGYhSlPKiAEw7HKg5Y1WJCTINWVrK3YlVwJW4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bu4bERwH5GIJZc9jfhOmvN54y4ztPpKTnErt6ql/n2/+/cv1y1QsN3KGnQSB0tN3jS10PDPm9GfYTTnnWjZMO2f4ndz0WI/xfyqFKgTP0lshZNVSJ9eN7DdmytG7UHTyM/HkxjaaJNPGf9o58bbf1JtKE8/5m8/eMiWgT7S5kEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=REE3ZI+3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="REE3ZI+3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=lulaLUnP967LJmdf3X8OatUvmV6ICsz0KeobNEc5Tag=; b=REE3ZI+3z8WvoMKkNmiz/42OXV
	hcW3lL1ky2yqRPsUDKT+57AFTI72UC/goeSQUh761/svcNui9PI1yfcrC0lsZ6P3rdFF7wRQZKQl6
	Egl7oPDDkwfD1E9kKPpINLwPJTKDiDsdAmc1LSIx6IhO/zN1Kuj4uPj85fa68XxUeTBSQCTDYand0
	gVOVbtNIk5/rBe82QcE5by8DsT2wMILhVQS4sITi+htMtT+7P7e+bSUaRgnDUORSj0mnGv5HbWujA
	fKTlorRqJEfU8tHSovJ9U3Ag/tqriS6RUyy/Q3sMr36HYpxdHY0VymlaKJtdQ11pq2Z3Qq1yLVs4j
	VZFtkNaA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7n1-0000000B4D7-0o5G;
	Tue, 04 Nov 2025 03:32:59 +0000
Message-ID: <f1914b48-eb9d-400d-aaa1-1346fdaed54e@infradead.org>
Date: Mon, 3 Nov 2025 19:32:58 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: W1 bad URL
From: Randy Dunlap <rdunlap@infradead.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Evgeniy Polyakov <zbr@ioremap.net>
References: <5eb4fa80-7591-422a-9e23-c6661318b705@infradead.org>
Content-Language: en-US
In-Reply-To: <5eb4fa80-7591-422a-9e23-c6661318b705@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding Evgeniy Polyakov <zbr@ioremap.net> if that works]


On 11/3/25 6:45 PM, Randy Dunlap wrote:
> Hi Krzysztof,
> 
> This URL in w1/w1-netlink.rst seems to have disappeared:
> 
> 
> 2. http://www.ioremap.net/archive/w1
> 
>    This archive includes userspace application w1d.c which uses
>    read/write/search commands for all master/slave devices found on the bus.
> 
> 
> 
> Are there any other sources of this application for the documentation?
> 
> Thanks.

-- 
~Randy

