Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D965B6BFC0
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 20:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648225; cv=none; b=WLCd7AOsk40NSYPs8GOCoThQlK+w8xOtnEM6K404tmvFpHFnAGy2ZG9oPe5ORE+Rd6bveo4JAGjo048IUigOO/13XnOVZ1yn7W5QQfPDBKOSzxoPj08oxFjKMHXeo5iUPo62xtAqwXj8V/mxcS8KwPR3mgTKwuxO+Yl4Hy6VGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648225; c=relaxed/simple;
	bh=na/aUtOcSwHgh4cyTX2YVSuj7BSBZAYFelQIEE6jV80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dMCRkBaLTLCYP1wPhqGyCegsVEvVYWfviLr1kEbI08k+mTTZ5Zl0NCiHt3M1SqBs0kxDHNcBNyUl85xHa6LEnvaXZ2FvGcTVTE8YGwwMpXG4FEhJDr6MSr4Tlig0GQ7w6b4kmbrgtgFL3GETeqflRFoy0K7wF9yTh6N94NVqhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ngyhr1od; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ngyhr1od"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 494F641078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746648217; bh=W7hpeEle5EyWZIZllCq1fjRxtMI0bYnu2U9CuxNsweE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ngyhr1od20TMUMa4PYqJ8n93UgopKTTR+RnUg3GCAUjhkF4mtA70L0/4xm41kEiZx
	 sOWs+nN8VglOTbdIHAAteQlRre0+8vp+1vYvl0L61Uu5kRgyPEcxQR6p9x+TCcZMS5
	 nsLiVMbHZtLdbMLvPgJoDA5xAitMPMyD9itskaV10rzf6LqTBmDhTr4iwyBpObEw7E
	 tIfrrQIhosuM3UDPHViCxINTERPCL85huMlMY+Qt1gpuMcyBZePQSSMyOO7rjmjs3O
	 8UZ174oZRbG4vSXmut0iE+ypNpNOBMHsJTLa/YAhjHzNnwRbZc2mn7/d6QKmsJ45bk
	 sT04FNqtT+qQw==
Received: from localhost (unknown [151.37.179.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 494F641078;
	Wed,  7 May 2025 20:03:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ming Wen <mwen@ambarella.com>, Rongrong Cao <rrcao@ambarella.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li
 <longli@ambarella.com>, Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen
 <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
In-Reply-To: <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References: <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Date: Wed, 07 May 2025 14:03:29 -0600
Message-ID: <87v7qctcha.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ming Wen <mwen@ambarella.com> writes:

> Hi Rongrong:
> =C2=A0
> Thanks for the update. Good to know!
> As the next, Jon may help to check a bit why this changelist is missed to=
 be merged into LTS Kernel 5.15 and even LTS Kernel 6.1. It should definite=
ly be needed.=F0=9F=98=8A

The stable maintainers need to be told to apply a patch like this, and
nobody did that.  I will try to have a look in the near future to decide
whether that should be done in this case...sorry, I'm on the road, and
have a few balls to juggle at the moment.

jon
