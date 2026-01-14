Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232C3A1E7B
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407940; cv=none; b=WCpipQa3zLSxPnvOhuVzvig7uam/aZZErf0KUhGrxpUrWZXNpKkPGdjhLJ8hKj+yJa3bPr+wDh+tSfLQXQBRuD+QPkNW0Vjsh2eP1U7wKyphe3f7tnuuGnA93x2M+nwvxyc8gRoeGijmcHcdcMYOjgPjcbbudrw3kK2JmzG7gfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407940; c=relaxed/simple;
	bh=7e2w5TVgAIaeERDyjkWps/D7YTPws5bK1GLGDaSKDhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TbZ9X2v/fcavkBPOon5awOKQ9R4nf4vP28ouCMWSZdiL5R4cvKU7TPhpmwf0qIXlhBjhskOrooBCqdELpVhnhjXT2ifkkbDpqkPaPMzqrUMrVt2Qhl7Qs6LEv5/iEZIxpKS41N1vzdMghFQE1huyJDmgawuqwtg+Z7oh6U3S9WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GXW2Qnrs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GXW2Qnrs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3122640C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768407936; bh=Fqck2agDCPvXZzZXkNt1JC7nvJQQThuaHzYu6V1stu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GXW2Qnrszv/Jq4jPdUD9rAM0Tud0HaWObcmXyvRtXVvQ3x6ytt4Y0tRrxJsk1Ml93
	 xru0AdoQ8vN5f1p89QbHjWQ5O3uBLUTb3Pebh1V1YNc3qZ+u5sza1jwnCFJWNezj3+
	 yKQkG8evGDwfsS+uvfJ9bAwcs/NNMmtvvyAbrwPnXXD5zpvsJ3frvczRuw4ZLc4qVB
	 qK0PCUnjxODXyBLLFBs9jJzDw+3akg5dy14vrHR+MTba5SJAwzsL7LCdVRLM2unajd
	 nASIKH8NiTD/8ZRB5gNm0elB+cq7RQtN9IBnZeH6up3oShMrn2dBMxNaERjnoFscyH
	 wesCuMh186cug==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3122640C42;
	Wed, 14 Jan 2026 16:25:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH] Rework the jobserver open logic
In-Reply-To: <20260114102045.1c164472@foz.lan>
References: <871pjtxn13.fsf@trenco.lwn.net> <20260114102045.1c164472@foz.lan>
Date: Wed, 14 Jan 2026 09:25:35 -0700
Message-ID: <87h5soupog.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> On all prints, please use file=sys.stderr.

I was thinking, as I wrote all those, that I needed a warn() function,
but then it slipped my mind.

>> +            return
>> +        fds = split_opt[1]
>> +        #
>> +        # As of GNU Make 4.4, we'll be looking for a named pipe
>> +        # identified as fifo:path
>> +        #
>> +        if fds.startswith('fifo:'):
>> +            path = fds[5:]
>
> Hmm... moving from partition() to startswith might be problematic...
> are we sure that "fifo:" can't be in the middle of the string?

If we don't get fifo:file then it's something unexpected and it should
complain.  At least with these changes it will actually complain.

> If so, instead of using "5" magic number, I would use len("fifo:")

I guess, though that's just replacing one constant with another; if
something changes, both have to be tweaked either way.

Thanks,

jon
