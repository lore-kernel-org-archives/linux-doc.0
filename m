Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04A2737FC
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054030; cv=none; b=JW3f2ydUnZYs8KRZLARDZIM4bym9s5b423mH3mn0huIJsmqh/smWCn4bsZ6qRp1vSKz2Rg+oppBGQhpx2FUMYiVMznkmnkCmUoN6iWj2+7fHzfIRx2wolmmUwgUjVvkaUo5ubXFhVTdKzo3ae62idh/msOIpzVzaSJI8eKvUZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054030; c=relaxed/simple;
	bh=LsSls8wk6XCwjAOhbC+5FYnfEZQF0/QblHRVEhNIZQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdAg7yEoXal3DN3HL8oxagNn2BlWk2jgxp2r8T9I3S4HNW2q6M3+8fIv/+4X+1AxoLVJ1wcirGATGwUt8lqi0h8QW0LM+Lz9ezaPne6Ubg6Gq7hjHNkVQ+XN7bf2KQlfSdroFufKuH11AXIh2IxwUngxuY3l8x8EI2IDdB9ZA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=GbbdRAGj; arc=none smtp.client-ip=91.218.175.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="GbbdRAGj"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LsSls8wk6XCwjAOhbC+5FYnfEZQF0/QblHRVEhNIZQY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789054023; v=1; x=1789658823;
 b=GbbdRAGjEGXAzKWFBNuG9nA0hpLqM4Pe1TNsZ7ffCIrmS4I2aRfkfm3vdlvqhBGAee0prP02
 Y7SMiwRpDxZp4FUXa2EeFRxJoIKqqmh5fxgitXlJpV61/wFaPfE66C2fco5OzjfKhLa30uLkJdj
 +rYKHc6l9zpgpmpyKPg2VgAo3jhMGOBpMvm7sJ+m9Z3l21WvsJliI6Xpas9l5TdiVRJgWfjDRi7
 VTkuOsr9gClTylYdE5e3ms69oQvJ4LAqY/ql3wjM/pwv2mWyRF/Jgy6R8MPUFugbfGZvbnw0zKV
 d54KECVsCZB4dDAYUdcE49RJZiE6pQrrSLBBaFGpRdHbg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc010f885fb15325;
	Thu, 10 Sep 2026 15:26:53 +0000
X-Mizu-Trace-ID: fc010f885fb15325
X-Migadu-Flow: FLOW_OUT
Date: Thu, 10 Sep 2026 23:26:49 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Daniel Pereira <danielmaraboo@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: translations: pt_BR: translate
 programming-language.rst
Message-ID: <aqLMOaNNMa-crNxy@wyuan.org>
References: <20260910151145.1226-1-silvapfabio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910151145.1226-1-silvapfabio@gmail.com>

Hi,

On Thu, Sep 10, 2026 at 12:11:45PM -0300, Fabio Pereira da Silva wrote:
> Translate programming-language.rst into Brazilian Portuguese and add it
> 
> to the pt_BR process documentation index.

Why is there an extra blank line between? :-)

> 
> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>

Off-topic: Just out of curiosity, why is there no diffstats here?
Handmade patches? But perhaps it doesn't matter much.

> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/translations/pt_BR/index.rst
> index 71eb024fbec8..d24da0262f73 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -73,6 +73,7 @@ kernel e sobre como ver seu trabalho integrado.
>     Requisitos mínimos <process/changes>
>     CVEs <process/cve>
>     Lista de verificação para patches <process/submit-checklist>
> +   Linguagem de programação <process/programming-language>
>     Interface de drivers do kernel Linux <process/stable-api-nonsense>
>     Conclave (Continuidade do projeto) <process/conclave>
>     Manuais dos mantenedores <process/maintainer-handbooks>
> diff --git a/Documentation/translations/pt_BR/process/programming-language.rst b/Documentation/translations/pt_BR/process/programming-language.rst
> new file mode 100644
> index 000000000000..5fdda01742d0
> --- /dev/null
> +++ b/Documentation/translations/pt_BR/process/programming-language.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _programming_language:

     ^^

Have you compiled the document? I suspect that a warning will be
received here stating that there are duplicate labels/references.


Thanks.
