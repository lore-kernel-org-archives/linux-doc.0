Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CD3E0087
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391792; cv=none; b=hcacIp94tnuPF9WgqOaf2ut64NQ57VDDUw6LBzCS+PPrZmy/es9n3rwV7V6+IpWPMqxhtgcYl+Eq4RhUPyP4soysvXkdYNhv1qOfmgYcaVzas7rI4OxZKwMPdJWjqpdLVS1zv9Kftovc9PHEEGHfx0ElHwziKLgnTtUk0JMNCVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391792; c=relaxed/simple;
	bh=9OrcSnaDziO3sI/nuH6w2ro9ygB/W1iV+9kiib6/tUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FzC+lyKdbeXBY4rcXVVuhxsydYr5ILa8dT2jFCUezGMgBFPN2F1Hp6MgvvoGOeEbSaarmBNQgCw2IjTx/rQthqTIIFgC6mNvc2LQ6xBqqJELbnkIFDN0SkLyLVcZ46ezHf8i4OGJuNIWhBeEUeJ7tY1ECmnFoD+ppkpLp1gs0f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aC0wVmf8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aC0wVmf8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B52940430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782391785; bh=7Gzf/v88XpqraNqsnQgdmQSKpFl/qbkrnSWvq4j25g8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aC0wVmf8Z0Mwj0bX4BbS1gtM+rnWwBvWmJ9ZzKlsqjyWH9ocHkGDRcE9+6PONHMAE
	 DGO/NgpHCCGzzlp1b1mGNoKVtOmKFauGL73ZWiPbMjwyIp9dC9kPwht/gTH8/sUS2+
	 oink04K3c/qqfgGy/4Md06I7F/aAnGV/0sWtwzF+vl9zZvql+rOkIJSenNxeZfEdeQ
	 5/jnABZzHjyWV6z4N62NN5rVL19PrUAJEcLDt2huIWvIfI5gmW6A5nzaxjuoCxan5/
	 tn7SIgHGHdl9VeiLe08XsOHdUqScflGLNa28OBTwkiPSOeu1uJWMCe4poOuCEPNT6V
	 eSBGCXN3IwyjA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0B52940430;
	Thu, 25 Jun 2026 12:49:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH] Docs/translations/it_IT: update current minimal
 requirements
In-Reply-To: <CAN-j9UqSuCWikosJzu+kcU=cOwnfRzYkr85hXS24AqSf=qwVwQ@mail.gmail.com>
References: <20260617085305.3205822-1-doehyunbaek@gmail.com>
 <zJRp95X2zpOwl0JF9O3s_dQfHMeozA4ondxH1RSqBj9KK4jYkV3pWJpNwavq6WlYNbGv3BVBxK8jyc-VhlU62IlfBVhFnGQqnkz71efYe2w=@vaga.pv.it>
 <CAN-j9UqSuCWikosJzu+kcU=cOwnfRzYkr85hXS24AqSf=qwVwQ@mail.gmail.com>
Date: Thu, 25 Jun 2026 06:49:44 -0600
Message-ID: <878q826azb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Doehyun Baek <doehyunbaek@gmail.com> writes:

> Hi Jonathan,
>
> Gentle ping on this patch. Federico replied that it looks good to him.
>
> If nothing else is needed, could this be applied to docs-next?

We're in the merge window, which slows things down.

In this case, as well, the patch doesn't apply to docs-next.  Please
send a version that does, and I'll apply it after the merge window
closes.

Thanks,

jon
