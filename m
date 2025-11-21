Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B62C158E;
	Fri, 21 Nov 2025 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747196; cv=none; b=OMSIgc7RwFXhxJQ/FYDrmslPDzCJNDOQ6KBgyZInbUcViFybcFr2hP33JGq5m6tmdR8pb3aXpHVyPamDYvgeHDMo2sJH8VRtIJefEfg+lZivFBcSH1gj7l8eDksZmNWE9KD9E+Ct2ypT2okudOS+0t3JA50wNagk8YcEN0LzA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747196; c=relaxed/simple;
	bh=6mWB4qUkZK6e8iVP5ICPmPdtJcEeeWQiqW5Tsns0VJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R6ekr3j5ydhRztPIcgpoCC6x5WmATb13hnWqG3fesOQc2vSESV12JG5vCi+uMQcGnQxILZWy9urY9xEs+EELQTj1cZYlEM2mO3802Y1UZCqGgr+HjG16JHJt5Iu5HmbHDfiSp/0ygiJCsUKV2ZnlmwBvvQpWIWfRIakgMP4Fnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=E3UTHJ3j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="E3UTHJ3j"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A6DA840C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763747193; bh=joksVA4p0XaMBDEk9OI+LqnkRUne5obGA5skhqn96zo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E3UTHJ3jilgnkuCCWKRCBUxL1gTTN7jxODDOB+GtOl9fWkSqWYats3nsiRpfkZBUO
	 v8tGRtJlAfKmAkex1UtzHx+C7ILtnax9yxPBhGIaVpcJmtwRQ4q/PAzeyjUMSpJ1BI
	 wqAyUkfnY7tQetQldtLS5yrArA+bXdTtrRIZoOoamhGdu4bLCPeVXAU/o34N7SyJcd
	 Nab0tgpQOBX09wtsmu46DRtsJZtJhhmUOYXenaRehkQSiUUo76Zp2H6AaAN97RxX18
	 w4YnfGpAcUQmxgOwVaQCxemS1R10aWtiiFyx/kimI8ge1GmtOK6VYqhoJvwDt0nUpG
	 OmlrYegvywwGw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A6DA840C3E;
	Fri, 21 Nov 2025 17:46:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Convert get_feat to Python
In-Reply-To: <cover.1763492868.git.mchehab+huawei@kernel.org>
References: <cover.1763492868.git.mchehab+huawei@kernel.org>
Date: Fri, 21 Nov 2025 10:46:32 -0700
Message-ID: <87jyzjth1j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

So you had me worried with this:

> As we don't have a definition yet for the location of the Python
> libraries yet, I opted to place the parse features library inside
> tools/docs/lib. It shouldn't be hard to move it elsewhere once we
> define a better place for them.

But it seems that you did, in fact, update the library location.  I've
applied these, thanks.

jon
