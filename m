Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E60F3BC4F6;
	Thu, 15 Jan 2026 18:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768500286; cv=none; b=Lug2dul5nwK0CvXkBtWRfICuke9tHZkj6bvgv598iBKsQX1+OD9iRt7igrF6bH3+KQiRD0LPnDhmIT/nwLzJ2S2a/TmlZZhiTfp/9zLSvZaEu65IgTR1wtxF47zAJJNyP6BwZLk5v69tTkHhUXKfzrRZHvmVA8xNNtfof7MGb4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768500286; c=relaxed/simple;
	bh=9hkarJJje8gc0gD2suJvBvDLb9N8QBbbv6knUZZp3jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZjXdrDp12zJ6Wr+vlQ9Q1HFOnnZEnqLbx/W0tLYdvjxdE2Lq9NaCNtdJ9Hjva2X5Per7Dc5/cwnfOYlSKwBeikJ/QFKaojBwQa8iBzPB4FD4bvKYdD4ApBG1LtxykhQry1AGJToIxIz7FxvRVNkrynhNpPsUN1WzumAF0z74yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DvL+OCfP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DvL+OCfP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 18BF340C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768500284; bh=aNqJbyONTSYlLgf5UGb/3iqR8k+NsiooB4VfEm7E3c4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DvL+OCfPsaTDUU3PMIXjqKFCdNtUbu0QWq1RmV8cGE3X+UdXFtFhMMjrZb0SSW/Wv
	 5Jnv38Q3N77vY1dUYODHHAOmqGyqByoZT7b3UR4ePbzSgoQn94o4uiehY4YSqrqo9y
	 GJDdUcu6XJVjy6HjzsjM7MgB65nfX1iKFp4126Dry92BAK5T0+ulOGz2KS5AXPcX1J
	 vgkoXu9BoFtlY+KH4Q8MzAUz5iLm9yMQnfjYo6apphIzaBfQmY8PXQW1+d9YCZbxDe
	 FleyqnhzRoLysQWcwnwK9/tr4ERSmbuJefnyTF7YYfV2EznDVZGuDCHuZ7DotO543f
	 5zcF3AoUnb4AQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 18BF340C46;
	Thu, 15 Jan 2026 18:04:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <87ecnquda3.fsf@trenco.lwn.net>
 <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
Date: Thu, 15 Jan 2026 11:04:43 -0700
Message-ID: <87wm1isqf8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> On 1/15/26 7:05 AM, Jonathan Corbet wrote:
>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>> 
>>> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>>>> Em Wed, 14 Jan 2026 12:24:31 -0700
>>>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>>>
>>>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>>>
>>>>>> I do many of these on a regular basis:
>>>>>>
>>>>>> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>>>>>>
>>>>>> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>>>>>
>>>>> Yes.  The tool moves, but its functionality remains unchanged.
>>>>
>>>> That's actually a good point: should we preserve a link on scripts
>>>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
>>>> that could break some machinery on several CI tools and scripts
>>>> out there. If so, it could be useful to keep a link - at least for
>>>> a couple of kernel releases.
>>>
>>> I think the tool source should be called kernel_doc.py or something, and
>>> scripts/kernel-doc should be a script running the former.
>> 
>> I honestly don't get it - why add an extra indirection step here?
>
> a. compatibility with people in the wild running scripts/kernel-doc

That is easily achieved with a symbolic link if we need it.

> b. adhere to well-known naming conventions.

The normal convention is to not have language-specific extensions on
commands.  As in "scripts/kernel-doc".  I still don't understand how
making a wrapper script somehow makes this better.

Thanks,

jon
