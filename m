Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D83407CE8
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991831; cv=none; b=HkQa4cMmFjLno4V419qb8hrOo6hRjV47hl0yNhiMiGAq2gkZcIV3jqB4yCW5e/qNyIO48IBYz3fbNHrhL+WSR03bTjOpzm6Ql83mHk2JoIyjCM5TW6w8A9gB95qqDLnNcdwqrXh5AARJru5BOP0c143urF0xNrIMY80CBz4fsJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991831; c=relaxed/simple;
	bh=OGcBQSPhd0OtBm3OPKOKyS5T2hegV57vXbgtm396ogI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uqduAGh+IDK7T+LOsGuvvHv4EtCMHF7CrOg3YTLf6Bw1IzLdp/Tf1eaFDMUa6cnNC0C/M/eBlFgDAxrX+UN8CAuQZyLkQoTJH+NuoY5DMFx3fo5ClEVObqo+d+ISiWF5tFC65/xoTwtFp0Cw0iYLhL8KppAbxus2jIG+DuGboF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jc43HmQU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jc43HmQU"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6EE5F40E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779991828; bh=OGcBQSPhd0OtBm3OPKOKyS5T2hegV57vXbgtm396ogI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jc43HmQUowJv4jvfXOeZDuQMO7NmxqXVhJzJgkdBNOP8Xp3hEDIe5A2gw8EeiF9QF
	 OhMnUlehIfD9NfaMxx5Mmbm19UFWWxptmEOrky0raxqJ7X5C/rE/D236lO7B+U+R8n
	 v+ddEJwCCPGeJsreIwVS9SR52xzsKYNGKm7pVRfyX5xJ2YaJjuzfzpj0nNiUAFaoZT
	 SITBWMFSxIP8rnXTDgwBH6kwpxSnlXDES6b9SONgQDLfsgvYV/4wG9y+1SWGey/Vit
	 zcLC0UfusTE6QJCRfjiT4c02+CEl0/Lz7VS53Gud8M1A33YmSp4nPGCB5C1bTg51N6
	 /k7wyWsa3VIIw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6EE5F40E2D;
	Thu, 28 May 2026 18:10:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
In-Reply-To: <CAMAsx6esEkQ6bGn7RYVrrna2r51qLLTvZbbsWJ=y9zg7aBTgyg@mail.gmail.com>
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
 <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com>
 <874ijrlhf4.fsf@trenco.lwn.net>
 <CAMAsx6esEkQ6bGn7RYVrrna2r51qLLTvZbbsWJ=y9zg7aBTgyg@mail.gmail.com>
Date: Thu, 28 May 2026 12:10:27 -0600
Message-ID: <87mrxjjtgs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> On Thu, May 28, 2026 at 11:47=E2=80=AFAM Jonathan Corbet <corbet@lwn.net>=
 wrote:
>>
>
>>
>> Is that an Acked-by?
>>
>> Thanks,
>>
>> jon
>
> Hi Jon,
>
> Yes, that is an Acked-by.

Please actually given an Acked-by line when you do that - it makes the
signal unambiguous and the tools can pick it up.

Thanks,

jon
