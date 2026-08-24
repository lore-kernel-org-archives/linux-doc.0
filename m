Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE5938333C;
	Mon, 24 Aug 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596100; cv=none; b=Kqok3S4LYtXjZvIko20BzR4rDqvIWfkCsE36ZHKIQ8VAJsUAgBXxZ2ZxI6I64F703cK8TJ1CHRgmrPF7dFlpvljdeRzAnV0eHppH/thpj7lW4XsCiiaDNAdtxVNuD7X2vzdIUXU2dkQuhu5BKVP0axcGLRHX7hAmRrhaQlpTEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596100; c=relaxed/simple;
	bh=l28porqIqzvAiWulWOWFAaQNdJdMa/34sQaGNlru8I8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IHVmQJzX7UPelsFF4L0Ks20b4p8qZ6vxbt++x52oxdp/PQho3gOFmRvZydKJPkLGPYnhxCS7Ohw62sgnGPo9jMRaio+9fu+A/Y/4y2Wa/IR/iS5soDp/g0Yka2Bi3xw8dYNT4d8JV25GdmInD39z9tyF7CPYMauy6TUwzsQ9yKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mDSs0WHA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mDSs0WHA"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12CBE408C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787596098; bh=qUT3qZLebBBOJfDywttkzmdCgDrXNn+Hp1gXVFDN2lQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mDSs0WHAV/CJcOQQGF50up6HmKvqRrg2tAtphjJlgAtHtNcQV2V/O1UYPcW25Vt/i
	 0+RkqIE0gEq5UaEpO7FuFKLUWgfDwlW5A07sA4V6JKy5soUd/M5NIk6gLGNboVcg5d
	 5cFj6TcTdd1mwvRRqpvC4FFWTok3MXyXQg7w2LPjouHJyIhTHuBF+KPxPc3LbOMQPt
	 ylyiKb4FyjxTPuC3zw34zpdsJCRBtk/v8xVntX+lshrFOKTJwuQJj6v83Epw+DCix6
	 NeRTdOyaktyOY7dJt58EzQeSO77NQlJDJyhGc+2b0/9gQ//zyB/4TZE0sbkTao7sXk
	 R6P6WYQ8PEJAA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 12CBE408C6;
	Mon, 24 Aug 2026 18:28:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] docs: cpu_hotplug: Fix multi-instance removal calls
In-Reply-To: <aoyHeSsuikpMKjr9@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-2-kmehltretter@gmail.com>
 <87fr03zcb2.fsf@trenco.lwn.net> <aoyHeSsuikpMKjr9@gmail.com>
Date: Mon, 24 Aug 2026 12:28:17 -0600
Message-ID: <87h5kjxtj2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> On Mon, Aug 24, 2026 at 10:57:21AM +0100, Jonathan Corbet wrote:
>> Karl Mehltretter <kmehltretter@gmail.com> writes:
>> 
>> > The function is named cpuhp_state_remove_instance(), not
>> > cpuhp_remove_instance().
>> >
>> > Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
>> > Assisted-by: Codex:gpt-5.6-sol
>> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>> > ---
>> >  Documentation/core-api/cpu_hotplug.rst | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> These patches could really benefit from Fixes tags.  For this one, it
>> should be:
>> 
>>   Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
>> 
>> Can I trouble you to fix the rest of them as well?
>
> Fixes tags are already there, above the Assisted-By tags.

Obviously what really needed fixing was my caffeine level...sorry for
the noise.

jon
