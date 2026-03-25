Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298E34C9A6;
	Wed, 25 Mar 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467621; cv=none; b=TX4Uy4HgFvOy71vKhSdF72L3qny9Cktbbu4kzMYePf8Z9L04tZQWWNgZ8xHNTe9DEXUVyJ5vBAjcDW7F4wNy+qg9NdxsyPtm4o6YOmUQLCXA1eu5/hKWg4pbztAO7czJe5vq/+Z8TbPzXoI2vvkAMB166VZ6UPP/3hAbDUyURjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467621; c=relaxed/simple;
	bh=9zX7UtGytQM7vMV1uL87V8xV2ol0NYGkhlfUJHvglKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=laqMSwsDMxZK6Qh1WTISUGtAdChVPIwaVxuyGAf89XLahZq2bGsMl8qPwj23M+fJzmicKrnt/sLjk1kHhVYxP/t7qcRaXGaAIGBYgWdqXBW9U203KQQ/8g2YsHfHxWAyirZdJK5fd/UUtfqT5bFvAmCKqpF++HEP9lb1VJ+7wQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q4BPq+/R; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q4BPq+/R"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CA4240C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467619; bh=l3ZvicdM3Z/ujrHLRbQeTksh7B+HcLZrfxR2WZIahyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q4BPq+/RbCABlzx0Otv+ob9R63AyZ9CKp9MzvkkSj2UpaAK3xgqpCugDeyvCGoBPW
	 cSRcQIjCz1Zj6qx+OJSRrThUEunkoHEq9ozi7O7fTxDHcP+obQMOQFxnUsnEYhp/ML
	 agZ6JLwaVTkkIeX2cuBsIjxzkHssZHfQPcW2c2kKli37rUsRqgWs6mWCIkfcwk7RNp
	 KsbFeNH3PucePTLFBeulFFO50mP1p8OWzGdWJjKARXBJmxbxHbkiETSVSQNv8iNZD3
	 oA23VVCoh/Bpy0ANXQfAH6Yon6ed/SrDALt74iMspXEkJBuOr0fNkOyShoDfHUDKYZ
	 cO4UEsS0JDGTA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5CA4240C6F;
	Wed, 25 Mar 2026 19:40:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/7] More kernel-doc unit tests
In-Reply-To: <874im3g0w6.fsf@trenco.lwn.net>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
 <874im3g0w6.fsf@trenco.lwn.net>
Date: Wed, 25 Mar 2026 13:40:18 -0600
Message-ID: <871ph7g0kd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>
>> Hi Jon,
>>
>> This series comes after
>>         https://lore.kernel.org/linux-doc/20260318104321.53065c27@foz.lan/T/#t
>>
>> and contains the remaining patches I have ready to be merged.
>>
>> Its focus is primarly on adding unit tests for some corner
>> cases. Several of such tests came from Randy, and were already
>> previously submitted on some old series.
>>
>> I added a couple of extra tests there to check if tables and code
>> blocks will be properly producing rst and man content.
>>
>> Due to such test, I ended discovering one bug, fixed on the last
>> patch on this series.
>>
>> On this series, the actual tests are not part of the unit test
>> source code. Instead, they're loaded from an yaml file that
>> uses a properly defined schema. One of the tests check if the
>> file follows such schema.
>
> I've applied these, thanks.

Actually nevermind...it appears that this series was superseded by the
set sent on Monday?  I've applied the newer set instead.

Thanks,

jon
