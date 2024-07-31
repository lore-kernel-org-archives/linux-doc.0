Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716281B143B;
	Wed, 31 Jul 2024 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430908; cv=none; b=KxeTFt5RT89FHWta9bZxoG4GXSmMk0au9Uvivs3zhhfEBJNvGFmQSZ2xGMk5DsgKWxOdw7DiH1nCEefzq8Gn4kgSS/fJbdbfzdSX3+udE35HxZ8CgTrjDUzhP+P5aK0WXkC/uYt0k2C5EAPuZ13P+tP+LM1QPbeILGRD/T/Ugas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430908; c=relaxed/simple;
	bh=KRgI7PxgNp9DkBvVEDZemsNNi/kphaWCK65FVDFc0bI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HWEhBJKkiHB5qvw9Hdln43lLrZQ3yKUwRrwwNK//PGUNb9j4jQhC67QqC4nN7ga1B2WWj9Crc1o1LUx3CKtoFXJx4SIWR8ckAa3f1atpoaRH0BaP2FIPhWhXnbdIUoXZNf+Xa9bTlkfzj77JWKOzmz/h9ZeSMcc7owDGmGVrZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AqfSR9tK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AqfSR9tK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8040241A31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722430905; bh=y7at0mBVFZgrj6t41ps66llEeOR+2sV/BLVoHd3IYNk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AqfSR9tKNx+qt6ZcC/0Oc5MscMIVonGU1WgmqZGgLjBL99giNbqgnqnjBPlzStEB7
	 LxRMbQU7QDQwxpzYFBHz9VlznXH782KhUvJ77shTbBhhW7rpABGbyDuoBmL2TQsRRt
	 4oKWQQKoMSJAYELLrcZx8e0E/0QXEueKX4A6UPHXhicbKWWeKpHCL9V+fOqW5xp0MP
	 uMG2PeRQY/yXeBxCfTE69LljAwzkzfGVZbiEiMrOmx9Zy8hRhlP6CzmgnEiTumHBJZ
	 Z/6TibmSs22dIoRVcDieMYohwKeBXhe9rKwZtTfdJu0/jxS7KNQuyrMUkhzP4t+Znw
	 bvsPM/MzPj8hw==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8040241A31;
	Wed, 31 Jul 2024 13:01:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, chengziqiu@hust.edu.cn, Alex Shi
 <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] doc-guide: add help documentation
 checktransupdate.rst
In-Reply-To: <CAD-N9QVsYGwVOdnnnzUopDk9sr4gOhgjrJFN3muijvuUK7Q6pA@mail.gmail.com>
References: <20240719041400.3909775-1-dzm91@hust.edu.cn>
 <20240719041400.3909775-3-dzm91@hust.edu.cn>
 <87o76f98lr.fsf@trenco.lwn.net>
 <CAD-N9QVsYGwVOdnnnzUopDk9sr4gOhgjrJFN3muijvuUK7Q6pA@mail.gmail.com>
Date: Wed, 31 Jul 2024 07:01:44 -0600
Message-ID: <87h6c57m13.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dongliang Mu <mudongliangabcd@gmail.com> writes:

>> > +Then the output is something like:
>> > +
>> > +::
>> > +
>> > +    Documentation/dev-tools/kfence.rst
>>
>> Can be more concisely and legibly expressed as:
>>
>> > Then the output is something like::
>> >
>> >    (literal text here)
>>
>
> Hi jon,
>
> If I understand correctly, you mean to remove "::", right?

No, not quite - note that the "::" appears at the end of the line above
the literal block.

jon
