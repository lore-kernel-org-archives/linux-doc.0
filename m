Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E772DC780;
	Thu, 27 Nov 2025 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263897; cv=none; b=N3DKK1KGcL+M+oG0GB/dMnBqGUGyUoqIp0Fig8S/QmV1aHUWzVt6CsxJm3Kcz7PZUtu0qkZUJBeetHW2oCmuPpZIiQwjbkpCUC15kFWBLIurI4aBZx7gXg94swa938KaOlRaI5KRd1tnf7vL44pv7m2iBhIOfIOEjNFM7CyUO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263897; c=relaxed/simple;
	bh=wqMn8seKFIq2wq+jhSvRw9F9LzjxLgo9SgvwyVemjZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Js5ilBjwC9k5mVfVF6jkIwzMqaAoc2khZK3+eUMN4p/m1vimm043djgv/g3R7Fs6g9gUcawJvjrMus2ozMSLwRe6xmzvZa0pBt+bwfy8VxRD0OWizsIiV8sDncYCPMKthBAIPlFFCJZIx++flQMDrGRXH3395j8hIKbujYAByxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JWA2kEam; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JWA2kEam"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1C41540C2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764263889; bh=er+eFEwRU3CkCEeylATCuIcAlxI7qwRMrkONrVzSQN8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JWA2kEamHDeShJskeTqMRGTaXRKybNFyZLDzgR3SJ2kvr5TgV2pyjwrIwdHQ/Q61b
	 nNzlOHQfRtGj0c2ujdNYT/9Zvhs6xVfYcHLUxi30aSxuASWA1nlI2vzr0FTYyutmYY
	 DqcVkPfohIfdS/fcGsDRfomEEyKYfWTwaU9q6TIaTK+dGXUx/i8+xaIvwU+bbwNki0
	 zM66HJ9/fbqVdB7iCUpqb8mphWjN8kXTBiA2ak4ibsC7fNxVCArFegMc14FGBqBmEg
	 kNcXACsiXqPq79BTbZT+RnL/a6QjyBrEbIUIrCz/9xGuzYTQln6nDIChWX3DO5Qyxd
	 0rlnxcJUcJ/pg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1C41540C2B;
	Thu, 27 Nov 2025 17:18:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence.csokas@arm.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move Python modules to tools/lib/python
In-Reply-To: <61a0b2e5-fa53-4ed2-af26-c519a03a9dc9@arm.com>
References: <20251110220430.726665-1-corbet@lwn.net>
 <61a0b2e5-fa53-4ed2-af26-c519a03a9dc9@arm.com>
Date: Thu, 27 Nov 2025 10:18:07 -0700
Message-ID: <875xavwg1c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Bence Cs=C3=B3k=C3=A1s <bence.csokas@arm.com> writes:

> Hi,
>
> On 11/10/25 23:04, Jonathan Corbet wrote:
>> scripts/lib was always a bit of an awkward place for Python libraries; g=
ive
>> them a proper home under tools/lib/python.  Put the modules from
>> tools/docs/lib there for good measure.
>>=20
>> The second patch ties them into a single package namespace.  It would be
>> more aesthetically pleasing to add a kernel layer, so we could say:
>>=20
>>    from kernel.kdoc import kdoc_parser
>
> This is great, the code looks so much cleaner! However, it would've been=
=20
> even nicer if the redundant `kdoc_` was done away with.
>
> So instead of:
> * `import kdoc.kdoc_files` -> `import kdoc.files`
> * `kdoc/kdoc_files.py` -> `kdoc/kdoc_files.py`
> * `abi/abi_parser.py` -> `abi/parser.py`
>
> etc.
>
> Will you consider this?

We can certainly consider it...that's a relatively small detail, though,
in the big organizational picture, so I wasn't concerned about it at
this point.

Thanks,

jon
