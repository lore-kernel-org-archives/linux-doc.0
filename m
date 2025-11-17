Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A86283FF8;
	Mon, 17 Nov 2025 17:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401526; cv=none; b=g/utcQS3VZm28Bd9mqHot/eMn7T1Ku6U1qgI4ccfvsoHXv5i0fcmBrt8/+fKXMtDocOY1HclnSMEX8tuPCaIXivg3w7USL6jd5deXW1MEEkgGRqlggZ7rkLz/TuynqNY1IGU+zDH/9n3TZ24xTbfskRkyG5D7FpVTiYxOKGZk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401526; c=relaxed/simple;
	bh=izUhITkqKxOI3iN8DI35PxZaT0hNPzJEzB6+6VIjT1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPjgIElgenRU148uRAS1GHxv7H06DqzuXyqdZIpAD8dtbqjaditimAowanvowMz12MN6zW6HffU7KADMwZ3Q01sFu32Xi3Gxp/s0il7/UUpksNbZEVr9lMSPutepCIb8wxlS/34LphykgWbWDlE/f10wgeqfB73fvYZslykQfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dWZbhW3z; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dWZbhW3z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xi74qDLloo+AmSUup2+38Brb9tV+LKt3G1KeQ4yldQg=; b=dWZbhW3zHUQ/yTPqu/d/vbQ8Vu
	thoHuSu4vuvX1n3ahzVzFmddYjtdgCFhiYJk9+INnx7mOZIjBIavtqP5k+f5HLlFOeDxxHINOjJD0
	JdsSetgaYy4DTLfE+Kax/DC+qAFggFvkM6U2sGOIGz0vQ69ySvE/417vKKu8UDd7po9r2huV5VWW2
	VtU0h8uT+5WranKtQUdLW4JsBam/GLiiy+Go4Ev2oXi4jlRqfyjMKo/h4YMfeZaAD9npVX1xBc6Td
	c9k+VbXWSQDZvGntViVA40mQAL4NmROlqLNW68np3nUui2g90Mal1JUoFdlWWciQwfBCiZFUvS/1u
	NUbhAyHw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3I2-0000000GYo8-40Y2;
	Mon, 17 Nov 2025 17:45:22 +0000
Message-ID: <55830002-5b72-4964-b6f0-67dfbbf13537@infradead.org>
Date: Mon, 17 Nov 2025 09:45:22 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-doc: add support for handling global variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
References: <80f85eacc306e62de8c9c68712c653ba290c2ff2.1757262141.git.mchehab+huawei@kernel.org>
 <d85e3f24-dbcd-4f28-b31f-a77661fc66fb@infradead.org>
 <20251117104543.42419bc5@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251117104543.42419bc5@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/17/25 1:45 AM, Mauro Carvalho Chehab wrote:

>> So, I grabbed some global data from 6-8 places in the kernel and put them intoinit/kdoc-globals-test.c. Then I modified Documentation/core-api/kernel-api.rst
>> like this at the end of that file:
>>
>> +
>> +Kernel Globals
>> +==========================
>> +
>> +.. kernel-doc:: init/kdoc-globals-test.c
>> +   :identifiers:
>>
>> The html output says
>> "Kernel Globals"
>> but nothing else.
> 
> With the version I sent yesterday, after replacing:
> 
> 	global -> var
> 
> the symbols are there.

Great, thanks. I'll look at it later today.

-- 
~Randy

