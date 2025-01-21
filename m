Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9532E406;
	Tue, 21 Jan 2025 19:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737486875; cv=none; b=O8nIYaihI9OtQNJqp626YQgFFIKiJqYCXjS6kjWrnAAjruCYfmnKR1/fIQnH5Koza0+4zZcrJOdG6EiIqGBFR0Eh5yVb5A9P1IWGJbvJ+RdaIv1fiLbPFiOfjdl3enPZSmizzlZOP8YVoHdoGUoLfyNu+j7QMmb4opvqE89FuRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737486875; c=relaxed/simple;
	bh=HMIlz0MGhxAebKrnPxyOaRqNxQPgVmxIXMlwCf5cFwU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KgwYJ3/OsSZ+00vjd+QIp5kYJ5gHENeiVzcDAR6ymVd3rBkS8rgchQCT+uhbISqGrSKjRpYNV5q6pfXpalMYW/KTFKtk5+NcGrQBLtZ3XmncMGqrpskDBHxOYXn4Ocae+Vv6OSoFlZaCO/EnEZk0AIivb3XCVAs3gddqlV0Lr9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=amp4qLJ+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="amp4qLJ+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9D936404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737486872; bh=RKdvzO2RWQntBLsi4CJfDe2utvK1THvOVAsvfDo0Bs0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=amp4qLJ+okT7rzYqpvDEgYAZh2jzem0uQqTdsZ4zNUPSJALXxNjsYPNgruJHjnSb9
	 TmxO+8JihIeNNZSiWvWKXuBOS10TcP11wqeX8zw3Vb+QHUe9TazXgN/dKJH2Ufq76I
	 UjdAUcvcOVe1Jee8xUQP3dDMuyWpZrbpj5/BsArGABt2LS+cdi12JlEGwAKK4k4nZ1
	 M7Fyr51CevFV+peld+24LqYCY0AuckjQNJMpWMIwbHsIjWMfAqRSaw+Zq7KYCH+4KA
	 DoTXlTVYKMNRwkRN3FE0oaCLKyxrCwl+4zChaArvQpl8g2wEBy9VylnrKUB66KSWm5
	 2tt0hog5w1rsA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9D936404ED;
	Tue, 21 Jan 2025 19:14:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, carlodelos90@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Fix backticks in README instructions
In-Reply-To: <bffb09b8-8e9d-471c-871c-2fb3605dc7ed@gmail.com>
References: <20250121003056.10930-1-carlodelos90@gmail.com>
 <bffb09b8-8e9d-471c-871c-2fb3605dc7ed@gmail.com>
Date: Tue, 21 Jan 2025 12:14:31 -0700
Message-ID: <87tt9sf088.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> carlodelos90 wrote:
>> The commands `make pdfdocs` and `make htmldocs` were incorrectly formatted
>> with only two backticks, which caused confusion and didn't render properly
>> in some contexts.
>
> Do you mean:
>
> ... One example is GitHub where top-level README is assumed to be in
> the GitHub dialect of Markdown.
>
> ???

Indeed, "some contexts" is a uselessly vague description; please say
what the actual problem is.

>>                   This change updates the documentation to use triple
>> backticks for consistency and clarity.
>
> Obviously, triple backticks don't work in other contexts.
>
> So your "fix" breaks assumption of others.
>
> I think GitHub can render its README pane in reST format if you add a
> symlink of README.rst -> README.  No?

The thing is ... *we* don't render that file as RST either.  So perhaps
the best solution is just to use normal "quotes" rather than any sort of
markup?

Thanks,

jon
