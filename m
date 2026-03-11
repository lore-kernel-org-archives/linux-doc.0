Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984A175A8F
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 20:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259751; cv=none; b=aUIgVNUW1vlzWOyTtuc6rdnFSvo6NsnTTZNvwOHDTkH71axgwj4pcIIpF1KrjAomcGdXMm7wb1+eLELY+rW2XOZ1BT/pJl4I67aDqAZY1c+6b4dHh6/8Awsz2V+vuD5EwKsE0EnydfLHEtBOA58jhHdb7KDcgoJe0Z9Q/Tv9XDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259751; c=relaxed/simple;
	bh=DXMyQFYVMHR4gmLxYapEorfWW2CBwmkTt6ZsDv+rC5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZGiRD8MzN/t+OQJpcoe4FxbiVodnMp28QL9IPPDyLb4jeOYqxho7OWfB2L0luh8LuoePaPkxUI2jg8R1cSD/kMdHrg7Em45fEQzMZhZyxxQQkEuNjVgQqwKW4+9yYkhV8SKLszt47Q/zim5Lg0YQdoWM0Jxu/FVgiWR4QCCnEio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sDvQCBLr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sDvQCBLr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BD0EC40C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773259749; bh=LhWDr1diLJa3inCbjRKMzkGrs5MlHrcPE68LzyJUGao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sDvQCBLrnvzQoGccDXbu3//xLuSQkj/svBWcXfq1Cj+UwEtdaO3GDeZhS7rtIFw4D
	 iHauGsYAw13L66vCdZSJmkANSJY/nsUW9xodm0wNlUDfV6VfBQyvHQ61M5zOQEXjy+
	 GrBJWQPqBlxjHBLM2nJYnkSxikjrsbbkd7WhM1blZzJiZNPI4/MQa8+q8OaKtVmPHM
	 vIIcAxLT/dpY+axpuieDamePkYt2VAzHIj1kxaelFlAxPrK/TW1iEoZarL+M5YY2kH
	 BWixlllzrZXfIMAmyhuo5WKdRayLYz2TF0qgIG9SQJiGQm9E9nLHmCIC5jJe+7Ac/6
	 QpoAq5aKrLpEw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BD0EC40C63;
	Wed, 11 Mar 2026 20:09:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH docs-next v2] docs: pt_BR: add netdev and maintainer
 handbook translations
In-Reply-To: <CAMAsx6ehZkRV5e7a4KC47LSsnNq24Z=1nhJ+vBLdFbGrVXdE2g@mail.gmail.com>
References: <20260309030411.88945-1-danielmaraboo@gmail.com>
 <874impxab2.fsf@trenco.lwn.net>
 <CAMAsx6ehZkRV5e7a4KC47LSsnNq24Z=1nhJ+vBLdFbGrVXdE2g@mail.gmail.com>
Date: Wed, 11 Mar 2026 14:09:08 -0600
Message-ID: <877briqgbf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I'm preparing v3. I've ensured a final newline in
> Documentation/translations/pt_BR/process/maintainer-handbooks.rst to
> address your previous comment.
>
> However, during local testing of v3, I received a warning about a "new
> blank line at EOF" on one of the files. Could you please confirm if I
> should ensure the correct single final newline is present in both
> maintainer-handbooks.rst and the new file, maintainer-netdev.rst? I've
> also tried to address the "strange line breaks" in the latter.
>
> I have a version of v3 ready to send if the newline fix is only
> required for maintainer-handbooks.rst.

Go ahead and send v3.  The others are worth fixing when you get a
chance, but that can be a separate patch.

Thanks,

jon
