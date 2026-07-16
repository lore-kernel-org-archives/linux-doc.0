Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C737E5F6;
	Thu, 16 Jul 2026 21:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238591; cv=none; b=qLFNbDmWza+m2CsJymXexaEk8MYtr2Yk8EVidvKqCcwEYqUQmK+2Vrr+wPFTLqxQn7kFWqxSubXPtUOSIV4F3/tB756nOw06zVIgDWU/FjSCBOjPHSRmbnf6/Vw9sA5hmpzBnM+vqllDWWzvqf8veMRhQVelYuezcNUHZOE2Rcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238591; c=relaxed/simple;
	bh=MRv/wMuIMuPD8XChGjD8h8OUWcgUgPh2N7NVFaH3AKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dY1O/z/YkIvVSbwEOoQY6MiiSseGzYCTB1KOn1mJgFMnhBZ0aYg9j4MXdHuDuNr7O7vlTjhIl5lkKjROf6KSYUjMEkss0uA8ImwHJGZGQZZ3SLm90OiLwnxfPwJg2suc1y8GVb589PIxH6CtwdkjvRhC9kmjTXBEpDbVJBeLQFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fr7O+LKp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fr7O+LKp"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 22B0A415A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784238589; bh=VfaTbnijF5pCG4484YYF8bLy1UA4eemmwU/6epjw6QU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fr7O+LKpEoy4JNlsE/voOMjyDC9tfaislGuRYT8flp7UTx/YRFIgm6fGy3Syi3/GP
	 BtVkPb0Lqpq7LFwoqFjq+Q8ouGw3To0FS3f59dcneurMJpZeFkepVYulIKVa9SiUaI
	 g48ZSkjzEWRazH06pMmZNYyibrRqgUgVptSve85ijZikSIvsIi8zy0XaONT+r11VTS
	 PP2jpRG1JepKpfba+cs2Glh9INUc0juglromvx4o1wqw1xu8ovfn0ry9MRDD7jGsmy
	 rKC3XDhjBDXWZDwAfl7q3fpQivdFwg/LRS3NATzlnlqQK0xeDcXW7qNlxxP2Fxegck
	 dbZxtZo4gTx5g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 22B0A415A6;
	Thu, 16 Jul 2026 21:49:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v2 1/1] docs: maintainers_include: fix entry names
In-Reply-To: <bb00e9ba66f2d95306e7ca88fdf0f39fcc570cff.1783884625.git.mchehab+huawei@kernel.org>
References: <cover.1783884625.git.mchehab+huawei@kernel.org>
 <bb00e9ba66f2d95306e7ca88fdf0f39fcc570cff.1783884625.git.mchehab+huawei@kernel.org>
Date: Thu, 16 Jul 2026 15:49:48 -0600
Message-ID: <87fr1i7gg3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Right now, it is printing duplicated values as profile entries, as
> it is not properly handling subsystem name.
>
> Fix it.
>
> Reported-by: Manuel Ebner <manuelebner@mailbox.org>
> Closes: https://lore.kernel.org/linux-doc/98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/maintainers_include.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

jon
