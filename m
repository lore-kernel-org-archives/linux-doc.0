Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34443846C;
	Tue,  4 Aug 2026 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849949; cv=none; b=j9Wpu+PsCCVGa73Mxdm+AlI6RQoBQgMuaezzCQ8qQpnbS8QyrFaJ7m32A/W9rXjMDk0i0Po4XP0yKc4MrcRI4c/ADnUlwSiYsl5XqzawzOYAu+rCcldPeqHCEcNAmbCicKp4fIneActFl1ogqH8iayJURghTDA3nvHQ51x4t7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849949; c=relaxed/simple;
	bh=L8d+JZXNEMA9DzwL3XU3p1wcy7WY9DQm7Hwn7Q2xwrc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aIHD/cmhjcvDmI1SfGqf/N1RPydasmsp8rPMDhQQjsnUy8JwxGFs6LN0E5zIIuWm547ODI1+hubjUIeghl/ivkyqQObEkHHo/n78Qnm76UW4QfNpBFHVi289Uhv65OpfkrEZpfHxG33FDF8cz8iatXGxCJY2Tqc34SrZaMmhJYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CryWbFoM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CryWbFoM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 39FEE408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785849947; bh=4ENAolMWyHG3xr8wGNw2bOQDm6BdYGkNxXUpRkRraTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CryWbFoMMqlUjDOPAF6vOacJDcmf4EwXJ5SnGBuhacM/skRC/qC8YBn0qv/Yvk5P4
	 6ERsyfRGzd1DoiE2L6HRqAdC7AbFNwtlSGbRSU096+ufoKg2kD3acbhX95ZJhf0DNQ
	 BEwQultYi3t83t3O6Bgs+8OFsczskNkreRE2k7QkohBe1dpVgWB6j0HM+coO0XrZZP
	 79njkrmgDYb+9VbXExSkiE07d5DkFajjD88bTzlpbzuV3SQWCtme4QUVHy0R3chj8q
	 sajf8nH/8jRaDpBNA65Gp74iVlLZkvZ2chs4nBFKQldsolU+bYDp2k8rMRDtH9EnGO
	 fpaIVNQUjjkJQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 39FEE408BB;
	Tue,  4 Aug 2026 13:25:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Antonin Godard
 <antonin.godard@bootlin.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation: html: show sections in the sidebar
In-Reply-To: <6928a83e-b268-4905-80e8-7b65048dd040@infradead.org>
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
 <87cxvzxbin.fsf@trenco.lwn.net>
 <6928a83e-b268-4905-80e8-7b65048dd040@infradead.org>
Date: Tue, 04 Aug 2026 07:25:46 -0600
Message-ID: <87qzkeuied.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

>> - Did you check the PDF build to be sure that the captions don't intrude
>>   in some sort of obnoxious ways?
>> 
>
> I only checked html and epub output. I can't see that epub is affected.

EPUB is HTML+CSS underneath, though, so I would expect to behave
similarly.  PDF, though, will lack the CSS trick used to disappear the
captions in the normal text.

Thanks,

jon
