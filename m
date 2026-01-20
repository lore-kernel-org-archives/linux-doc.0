Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCE527FB05
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950556; cv=none; b=ZF52HRGgQ6zQUTMxqf1Il4F1flm5363LJRnJQdk1JskCvFBZI239L5aP1hsO4UqgxRkMQLfdvv5xb0rgCL+cju22tS4n0HHWqoIPsCLNGxgdn9BnQrNEWLNLGp1GGImFPxYONfbBW3wjP5Wj8t/epNMfiB+cUEswq9Ng+BdI3Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950556; c=relaxed/simple;
	bh=wdB+Nv9KrQtaXh9e9rpf0Kmt4GPn6VNi5j3B4jQxTVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=afuMx1W+sfEJTxIV14npTsSz1aJcJV0NhNwDEZgmH/tuG/pDsmcMbh0unva9XZpjKhsz47UZjurUJPJwJ21b6BcsYlhbnmQLDy9muL1Dsc9MbiB8SsPXnhks7OcwazxJ0fnT6XA3V+2hssQERqp9zEYi7l5Ef/xwQKnRzZyGjPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Qbi++z7Q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Qbi++z7Q"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2839940C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768950553; bh=c3zunFBLvl7a/+zKtaec84FJz+UuX1srdqGeXVU43/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Qbi++z7QW8AJlN1diQaWYmZMb8Kf0LslQ9rK3q8rlKsqJQP09h9+WVGNQmiLtvRG+
	 MrZqQ0c6UloADJf/l+tmnO5pW/D+5ueZGQSN5wUn/aMQk7JdgcEdjnldcSuFT+CW7j
	 nOR4wJlnkQbtEk9loEAVgpe2mftNK8QtGINA93VHMmA8GWRfHbSGl73yP8R7qsCNjY
	 mftlD1atWKXW+AlGskQjlT5aw//6Nj2mG0NybkDQyS/OpZfjaScTzo5uJthMrsaDzR
	 P5m0fJmxfebn92xF9eB3PErIGv3M0P2j33fMVXK0JXjLoAGna0W9W8pufUXP3EDl+S
	 qW1+x+a8OKOFw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2839940C27;
	Tue, 20 Jan 2026 23:09:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH v3] Rework the jobserver open logic
In-Reply-To: <20260117113632.18b19b4f@foz.lan>
References: <875x91pid4.fsf@trenco.lwn.net> <20260117113632.18b19b4f@foz.lan>
Date: Tue, 20 Jan 2026 16:09:12 -0700
Message-ID: <87sebzhofb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Fri, 16 Jan 2026 10:39:19 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> -        self.is_open = True
>> +            except (IOError, OSError):
>> +                warn('Unable to reopen jobserver read-side pipe')
>
> I would add {repr(e)} here, to allow debugging what error was raised:
>
> 	warn(f"Unable to reopen jobserver read-side pipe: {repr(e)}")
>
> (or pass it via args, as the logic below)

OK, I've made those changes; now I think I'll just apply this, hopefully
it's good enough now.

Thanks,

jon
