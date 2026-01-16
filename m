Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367C3939BE
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768584855; cv=none; b=Hiw1Qju2IA4x0vWTA0c4dsvyFSpGuuFLR9ergThhFMAEfABf+sdT4JsWXrPHJbQrXpYO2MrhekUtqEDn4BenLPechuLKXspCFjF6yzbTn1nSobBrE1jWT7SeTPHMlFLavS0cVPXurfkyRODUkMwrfiHDCBLgJi0+hYre1Q9HNSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768584855; c=relaxed/simple;
	bh=pZ+W0QTw9y9lr5+1wsiLvwSTaC8HKvOB5d0zE019dFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QhfqrB+GpuoCJKxnqcdMLSOEpdwI/0C3DycI0YAfNQzW1uQ6j2FFFCIR5CtEzpcJdWUG7y0HjCA/IJxleAQEguMjl//ze38yRYZG2O3yVCNnrtmlA9+25qeVw02qineRViwK477tRRmMddQ1iyutmQo2uYUdKD1nA3yXd9rl2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EPmLXoBa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EPmLXoBa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 45D7F40425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768584853; bh=LUG8/rpfLiRPluo5o8qgaZDL+3tCqxUFA7dhNjWSzHM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EPmLXoBaGKgPG6KmaOQcMlFvCOxYwOlqeBkAzeroL9VvFih4LLpDB2+CaQc4OVorE
	 upsx2h0iPKbpnB3Zl/gZ1f8nRltKMpG5GkYV6twnqsDYyZaXIcFaCZwv+INwnoiWtk
	 wkyyny7S+Yh39/xr0/GMZn0ceJXr2edBE1m+sHFonJhDmJl5zgqlT0SwivOTOhvUwY
	 bys7ziKnM4Pd8Kitx2VLfH2wiz/iLOQfJ8jkCuGF205qBN2oLhy5q6wwOWEv4rfnFX
	 6NUEcsPzURVS1AK+CMbedc4eC+p3NvO53VupMkL4VKyMDeliEKTpVWZ91j/J5vidmK
	 DAeHwpC4+9unQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 45D7F40425;
	Fri, 16 Jan 2026 17:34:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: duchangbin <changbin.du@huawei.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, duchangbin <changbin.du@huawei.com>
Subject: Re: [PATCH v2] Rework the jobserver open logic
In-Reply-To: <a295bc17877e417b913b27e7bec8ebd6@huawei.com>
References: <87cy3cup9s.fsf@trenco.lwn.net>
 <a295bc17877e417b913b27e7bec8ebd6@huawei.com>
Date: Fri, 16 Jan 2026 10:34:12 -0700
Message-ID: <87bjitpiln.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

duchangbin <changbin.du@huawei.com> writes:

>> +def warn(text):
>> +    print(text, file = sys.stderr)
> Maybe this could be:
>        print(f"WARNING: {text}", file = sys.stderr)
> to unify the warnning messages.

Yes, that makes sense.

>> +        split_opt = opts[-1].split('=', 1)
>> +        if len(split_opt) != 2:
>> +            warn('WARNING: unparseable option:', opts[-1])
> Calling the warn() function with two positional arguments, but the function is
> defined to accept only one.

So that is embarrassing.  As penance I have now actually tested the
warning paths...

>> +            return
>> +        fds = split_opt[1]
>> +        #
>> +        # As of GNU Make 4.4, we'll be looking for a named pipe
>> +        # identified as fifo:path
>> +        #
>> +        if fds.startswith('fifo:'):
>> +            path = fds[len('fifo:':]
> Missing a parenthesis.
>                path = fds[len('fifo:'):]

...and that is even moreso.  I *did* test this before committing it, but
that obviously could never have gotten past the parsing phase.  I have
no idea what happened here.

Thanks for taking a look, new version coming shortly.

jon
