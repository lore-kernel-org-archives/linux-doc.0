Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFD1A01C8
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770397; cv=none; b=HfOQrWivhBmPC/pQ+acGsjPG9X0ex7qajkewmMh7y5wvEEMWk8y22KOHLyEKZ5YQhKruzLT8h/r2fffWiMgHQJjunzomWQ1A/FeMs5PRrXanejZW3Xc4hWt4jMuy9tUUhVGtm03cIq8O0hZwXHNUL9u7EupAwborNQSgL4O66/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770397; c=relaxed/simple;
	bh=9QSmgOPZdH+PJesOTqZc6uIPB0+KDd0jeReg7eEhpkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFbkBfcK9/CRuz2Em6tTkft44eVzjv0SFhJ455QPt2T/M/UCSrJ9xwUh8EkjrV0R7mAt7lP1SZlS5q1be9Hc2nQqIg8gQWvk01ZGEOVMt5zUukyZUI8meDfpq6etnKl+AKjRt4xJcjk1cUImM16xZl//9vfWoERW0gsuE8A0ut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QCbiMnq0; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QCbiMnq0"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 3DF0C8897C;
	Tue, 27 Aug 2024 16:53:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1724770393;
	bh=lmb2oqOq5vJaZzMzPhiNEEPpt4WCsLSX6OKw8ytYuA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCbiMnq0dF18BUn9XeJE6qSxjK3iIgduzEKYuHJ+tyanCUYyMQPnIu/z27NmWRkV2
	 RcmC5/H/L3OnYaMXEqfus26FQkLnRYlsmsw3QpsehVUrh7Q6x3dywvp5ZchRNwAvqp
	 73fjiMbgOiqfHtfv6Ci+FvuaVJOs3Cx8wd2cz7uhHF1umfH8LazxdsztNEDbHkeAla
	 EwIjaxtge7nGHjcDWCd9XhUkpx3zASRs/YpgjpiMUS+1pklkg08QSQurNiRNs2mYoN
	 cxjgNuQeVdf50heSIglJM2pAyQlcQrWatZLgsLSoo5NChGblRb816+d6Vk6cndYtrf
	 4XBJlHtWz7axg==
Message-ID: <34e42bb1-801a-4be7-a27c-b771e8f1926f@denx.de>
Date: Tue, 27 Aug 2024 16:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nvmem: Fix misspelling
To: Matthew Wilcox <willy@infradead.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-doc@vger.kernel.org
References: <Zs3nQxwycafk75MX@casper.infradead.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Zs3nQxwycafk75MX@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/27/24 4:48 PM, Matthew Wilcox wrote:
> There is no function called kstrbool().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks
