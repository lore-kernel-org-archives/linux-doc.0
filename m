Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3B1E9915
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510780; cv=none; b=ROHrQmrKsJBZN06rqqQY4ZtbZos6G577tHYjddSzXrbPnxzfPsEHqiWsyRxApbWulMeQ5hIohavtZmgplvksoH2yWNWptXk95dxuT6SMH3R9yWqLTswjk35FYxZUR+1Bb5z0ykbvW5845OAlm0QXrwgZ0Cg5eiEn3hxWVYCSx28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510780; c=relaxed/simple;
	bh=EtIwskouixYac0vnLUnzVuX8YxP0ix/79lSYafYuDVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OGeLbd1tGTxCOw2ih06917VelsjpDaIFL0d9vwd+ueV51RFuIOQp6d+d7gK/YcxrYqHbSFN7qqNvnP3Wq5YtnZwmRMAZ6bCm8SOFa2mNx4fN6rJXhLlcLW+tR/DAv+P1f/gi/eILJYYJQV3shqkF7TLUYcfOZu2U2nq8D1etFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EWun7zTX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EWun7zTX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB5DD40ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757510778; bh=EtIwskouixYac0vnLUnzVuX8YxP0ix/79lSYafYuDVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EWun7zTXHB3N+a6nrJsFNTXeRhBaL/vPmcyX+CY/pav1gpGgmjGD8pRYFGhtYEA8j
	 XJmXMBWknNSA+EcBfhyFa4Jf+vuq3URnZk4rgoELblBRVxC+QX7/Hk7K0QTNuxMPE2
	 4Ev/pA96m3GnL2OGMA5AVV6cJKD4VVrlPAdhD694GqWkfhHk0oTsCfhovJeLoNMl1b
	 P8E9xUG6WnfcHEJvHKoAGlfy87Rli+vZtXmrdfXq+eJKk/IT5fzSSSVD8jVxTb9TWG
	 S/KYShTW0H5k94fJs0R9wQE5qTRGtuRhLgETz6YdImeXvdrtIVc0RuhQuLWHCaPDiK
	 mW6vg/DQJeIeg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB5DD40ACB;
	Wed, 10 Sep 2025 13:26:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhixu Liu <zhixu.liu@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: sphinx: handle removal of
 utils.error_reporting in docutils 0.22
In-Reply-To: <CALMA0xaRpHXbpfQV3bFLgyhG+usg2c72ddPpYD5JU9r1AV=rZQ@mail.gmail.com>
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net>
 <CALMA0xYMNcD8UN5ykJALMskFGnNaau3cxJ1E5=bDE_mGS+bZBQ@mail.gmail.com>
 <87plbzv2x8.fsf@trenco.lwn.net>
 <CALMA0xaRpHXbpfQV3bFLgyhG+usg2c72ddPpYD5JU9r1AV=rZQ@mail.gmail.com>
Date: Wed, 10 Sep 2025 07:26:17 -0600
Message-ID: <871poetp52.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zhixu Liu <zhixu.liu@gmail.com> writes:

> On Wed, Sep 10, 2025 at 3:31=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> =
wrote:
>>
>> (Incidentally, Sphinx has not caught up with this change, so how did you
>> test your change?)
>
> I see this problem on gentoo, someone else report it at
> https://bugs.gentoo.org/962349 later.
>
> Your patch is fine, I don't know (or didn't check) that we can remove
> support for python <3.6.

The minimum supported version for kernel stuff is currently 3.9.

Thanks,

jon
