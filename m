Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB336999C;
	Tue, 18 Nov 2025 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484288; cv=none; b=KO9lU/DhreZ52W8udRG784EbzzYTZ4+5pWI5fxv/HsVX9DwiI+Hy99xGvUaxWcNccNaPufc1mu1UevWA+AbLtp99LJhEtBBQLw3K5fSzRZqlmLA/lYMUN5bZXsE2+BJioN3aKBwkJE+YzV+78b/S32NFpM/EahgZ667J2+WFFI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484288; c=relaxed/simple;
	bh=eeiand6FsHJ9QNtj/P3A/ZWqzz6MH5WBDsv7062M3O8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HeFvfPbaJaLRyv76E6vFraizk0AOGeM+ReeGSJ1nfaYLmbuBbadcdbW0d8OKRhScpfiyWDOo5QMQHGmFk1M9rvyM8qr3lFFoCDgRvaJTTAObrWyzh9ja0C4v09I8rndAOjNrErOiZPM3sLI5DFm9vsU5UriSHwzUkuvSqqQIbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hg6aYFQ5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hg6aYFQ5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1ABA840C3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763484286; bh=H/22w94yDaxoRrCKuiOegxO7bzTy3ofHOU/Y0wcrf/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hg6aYFQ5HnMpiqtLXelCJef40iswqaYMLF2ENueV0mGbkrXh+qyMF2sVLvhQrtAnA
	 NKQ8zIkWro/84YbNX0l+halqAM5M19SnCYn8FR8wscKdmHL41Rxi1WQQAcL/4MPgW0
	 lbrFENZOMdfIvaCspV3hWKp8/YzB1UToLQWjXzy3nqR4LQGERgw15ZIUGj5hk9gHpg
	 1tOHKeOEh56q3nHRusiH5l8TacUO2m1RUbFIK8vldNFkdyoDQ/1YvpxTv63SA73THe
	 XumXHR9jLIxJTMeGK3cbbkMZscZ6LbQNGKkRNr83RgjP/PUSzeAtiVb1ohtGCK8UYp
	 AMC64TtQWAYuA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1ABA840C3B;
	Tue, 18 Nov 2025 16:44:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert get_feat to Python
In-Reply-To: <20251111231232.3955f1fb@foz.lan>
References: <cover.1762877066.git.mchehab+huawei@kernel.org>
 <87a50swl6d.fsf@trenco.lwn.net> <20251111231232.3955f1fb@foz.lan>
Date: Tue, 18 Nov 2025 09:44:45 -0700
Message-ID: <87h5ur47eq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Tue, 11 Nov 2025 10:09:30 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>> 
>> > Hi Jon,
>> >
>> > That's the final series to complete the migration of documentation
>> > build: it converts get_feat from Perl to Python.
>> >
>> > With that, no Sphinx in-kernel extensions use fork anymore to call
>> > ancillary scripts: everything is now importing Python methods
>> > directly from the libraries.  
>> 
>> This, of course, conflicts with my library move ...  Maybe we review
>> that and I go first this time? :)
>
> Sure, go ahead with the library move, while this is reviewed. 
>
> This one is trivial enough to be rebased on the top of it.

That time has come ... we should still be able to get this one into 6.19
if all goes well.

Thanks,

jon
