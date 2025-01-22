Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69832212D6F;
	Wed, 22 Jan 2025 13:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737554283; cv=none; b=IMLmV6ccmKB/Ta8yfVcttNDN6ZpJARwJF6hYgnJ/Oyxtr02r6Q+tdn9yc7Pkw/VqFAsXazuV0Z1YlIJ3v5uLgm73h4g4r5x1dr8cAvxIqndCrtvC96dO0Evv9Yfjwf/gvJ9Qb66vKLM3WtvCPBG42FDzFp/0RVs1xYB6zflJ4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737554283; c=relaxed/simple;
	bh=5yU+W11YoTKubaH3flcPMxipgW6nQ/0BfYPdfNJj9pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hVpiQfrsyQ0NsSZbdAMEeVDjBrbF1YbJHPOFzh9q12IDu74KswBOdiyToUI9txeX8s7C7ncy8sokOVE4y4pB5b8ticwPYOzZvQLbBgfbRmyQGB1jDRDkWMRyBMm9WHrp8VJQ6B+ogJm01fwJ0b8u7N2NrjYWPlwK115cYaPdDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=anfwfKSy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="anfwfKSy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5039740505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737554280; bh=IPn5jeUNAmNgQhuOxSICJWeWFwggYgY1W1uSCFlKFiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=anfwfKSySbKlSd0DhgFkOBhPkhC1R7NacSShG9XMFFwyQn6DHWHG7xIKv4Ha/TeNm
	 19dZrFwc0vdUzg+v6dM5W1RIGU4TsDV6Vg/82LgHgehsPujDE+0etuMUScx11hOoYR
	 N7GCNISiyoCkNUPrP0DW00qcuz/vKc0Cxouroa/OWdifCSKvvmZ12a82GMdpLqpJTg
	 iJJh9rAtFAT/z25Zwe9aSewte/CZQJSdQdAee3A1YhDqy/6Selb6XmywwTppNHkCY5
	 ff+VhWq52VW+GHEtOV7Tl7MX7B7qWbkYTlWnoe4H0zfcJCsCYEcBBGveOpgFThqp0P
	 ePyptshPx74dQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5039740505;
	Wed, 22 Jan 2025 13:58:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation for 6.14
In-Reply-To: <CAHk-=whEWhHYkj96zyxoBY81J_afP3tAq==F8+zjRix7hwgvQg@mail.gmail.com>
References: <87a5bltgf7.fsf@trenco.lwn.net>
 <CAHk-=whEWhHYkj96zyxoBY81J_afP3tAq==F8+zjRix7hwgvQg@mail.gmail.com>
Date: Wed, 22 Jan 2025 06:57:59 -0700
Message-ID: <87cygfdk7s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linuxfoundation.org> writes:

> On Mon, 20 Jan 2025 at 11:48, Jonathan Corbet <corbet@lwn.net> wrote:
>>
>> - Clarifying that Git commit IDs >12chars are OK
>
> Wel,, I'm not sure that was an improvement.
>
> I'd rather not see stupid extra random characters.
>
> We'll see. Hopefully people realize that "at least 12" means 12. Not
> some random other number.

I took it because it seemed that consistency in the documentation was
better than conflicting advice.  If the policy is really "exactly 12
characters", though, we should probably make it read that way
instead...?

jon
