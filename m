Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675739;
	b=q1wHVSnGfwtvGXd5CN1l91+P4PywqiBWtBDIdwFS0JmAnAiZFLpIdweaoal5x2uU4AyK
	 riUPNI4snPhZHgrwshjqTik4GAhccQ1CwnzVR/Ko53j7K8Pot0ANt4GjKPJumE6Wr1zGM
	 wkirqMP0drp3AMaz3/EhL3LpvESd8vOf4MDeCiYtFXSNu2bR4yUsk8kKunWOKgHawHjho
	 ja1LOLZRew92x0ZHDkGRLDr3ew0T946BOjwbU4Bux3azagFRQ1IfwacekAseGsH6uN/uV
	 Yjp2D7efammq8QgCivuvkZAUKj0ElzVlQSr8RSLmC3Sz5+3Z6df1HmxkiNNHP9KgWMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675739;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=Ft/zTEz/wL8pC9DEQAzUBMC37NSK0YmpGlR/ZgjOZuI=;
	b=QWBL0NBwmAAtAH1Dr1JhKaRCyGeOejPeU+cqkFdT/rs8vg6b02hHO6osF9LN8IERLaa3
	 Xs06zECOK/3onvilTDRYbVyTlYIryQU6m3u3v7EjYIwmEeNKr+krWE+A24Djp81eYYu1Q
	 c5NkI369CJUqlQGUi5hUFKVQan8Mz0wDP9OAjBo3Xr+ARzWKuLcadcpCFhtjMwV0hwGqJ
	 UrlRzUSVXdw9rlIG5gY4j08gQ8P58xwxVaT99OOice6Uq5To46R7bf88hCW/2FWqxNgTY
	 /e55uWLRpDDp+uZG+7eYLG/av1yVAl9HHGHrNW8NK3HjG0xFTR1fkoFpedOpj6sjLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=F2FY4UhB;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345C4606A327
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345C4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=F2FY4UhB
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4CBE7408DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792675738; bh=Ft/zTEz/wL8pC9DEQAzUBMC37NSK0YmpGlR/ZgjOZuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F2FY4UhBU7SaoUFlnnMu23tKtH0RedXqBRNNP1dpztVFHQu8Ek4UzmrVEEzkFxW7i
	 Hc8YnEasCAxA6tQvjx78DoTOseT0DMvmbHRR61r+MF9v94UVopCLjZKCzLbGkpeakP
	 Y62Kse9N+qPPbH4q7d9uaeA/JAFzBNKj3z/5CwCpXDYzcCaUfqxX7MQ4TBur9B/AmK
	 idkGqOs8Q3fVMpxF2Ddq0ug3JAJixXAU5VAVy2soTlEzFTSV5x9OQo8Rsxunxi0eix
	 CCC6AkMQMTsmURRfgG0f0ev2ucfo8dLKDmu5LWR2PQCqY21fQzBPNvL1+eA1BwysD2
	 UdUHHby4QLHbQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4CBE7408DA;
	Thu, 22 Oct 2026 13:28:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, David
 Hildenbrand <david@kernel.org>
Subject: Re: [PATCH] docs: core-api: include documentation from linux/uaccess.h
In-Reply-To: <20261021160345.f01d046a25999a2d6edfb65d@linux-foundation.org>
References: <878q3q4qby.fsf@trenco.lwn.net>
 <20261021160345.f01d046a25999a2d6edfb65d@linux-foundation.org>
Date: Thu, 22 Oct 2026 07:28:57 -0600
Message-ID: <874ied50fa.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 21 Oct 2026 16:54:41 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
>> Documentation/core-api/mm-api.rst brings in documentation from the
>> x86-specific version of uaccess.h, but many of the functions in common use
>> are documentation in include/linux/uaccess.h instead.  Incorporate that
>> documentation as well.
>
> Thanks.
>
>>  Documentation/core-api/mm-api.rst | 3 +++
>
> It's confusing when a tree-owner sends a patch.  I never know "is this
> for me, or does [s]he intend to apply it".  So please make this known!

I know the feeling :)

I'll go ahead and apply it here.

Thanks,

jon
