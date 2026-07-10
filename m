Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756A2367DF
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711296; cv=none; b=TlNJcMLtCp7T5JebQ+RGOh5ggve5NIxNRAG/og9NYRblhKgbWOBjDsJcvwz3cMkq4Y+6Io4TDm+Le0DlCpxv5yOdDh2g4+oRWftIGd9x0H/BjnsLQDwtYyMIznbhMKiPZCwIKSv7EvHiF37UXgavAZqWy3Te9D7Hw834eVqFRpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711296; c=relaxed/simple;
	bh=7E5WD+zVTl37AL4SlMGtY6HC6iHeLpVknqlRrVOPp/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YMjJf80nP36dcbpVds0nctV9ELibDMw/QSA76H3XkBC8I6cUKVevrErfa5Ar5fqthvN41Hd5PMOB4MjGzLLWRYtCpl8ssY44ebdNCmO8hcjDNU/dT466gykPi5ALehsi6GqMBbZlRd/LTaP2U0x1Sug13Qrj2l36geSbV+caR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KHYw0w66; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KHYw0w66"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AF5F4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711294; bh=FUKWhrGAsZnLJyaQ4CDccxzHqtNVsmT3KGRtBadwwXQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHYw0w66WXNoMsptTrXoEGWfXU7BzJMu7zuKYuc9OE0uSys5/7vT5yjZFWui1TncC
	 heQon3xav+eXGjfEOaM3OY3VDcThm48l1l/kSow73vYpWcqe5DZAs+cEaxnb7NY9YR
	 ixrTgADcYKcIho8KxpBaWpRQj+xjz8N6Q0KrpcTT/g+TlVS8WIonJ+lI9iE3fAbPzW
	 FWhzNvDFGTEywHymRUlBrp/udzYgo+YF3O9RtYgdWg1Zlmx/SoPYuSz/SCIpAUkzgb
	 0zbao3uKdci55iH5kxarLnsvk4Du2aROYJV10anyqnMy0uzVRTa7UBh4UaLbr9Euwf
	 CXdUNhQTFaYRQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AF5F4108A;
	Fri, 10 Jul 2026 19:21:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: translate the management-style.rst to
 Brazilian Portuguese
In-Reply-To: <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com>
References: <20260703181326.47524-1-amandacorreasilvax@gmail.com>
 <CAMAsx6ewmXd205h37LDTzj9FgFasgodNzS51KzSEH8M_guNJGQ@mail.gmail.com>
Date: Fri, 10 Jul 2026 13:21:33 -0600
Message-ID: <878q7ilkg2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Em sex., 3 de jul. de 2026 =C3=A0s 15:13, Amanda Corr=C3=AAa
> <amandacorreasilvax@gmail.com> escreveu:
>>
>> Key changes include:
>> - Translated management-style.rst into and adapted idiomatic expressions
>>   and humor to sound natural in Brazilian Portuguese while maintaining
>>   the original tone.
>>
>> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
>
> Amanda, for organization purposes, please resubmit the patch using the
> email address that will be used.

I don't understand what you are asking for here?  There is one email
address used consistently in this patch, is there something wrong with
it?

Thanks,

jon
