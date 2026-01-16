Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC573659E4;
	Fri, 16 Jan 2026 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585734; cv=none; b=t/4lSblrQeAmczGVVsQ3IIoLeU9I/P3CgIPS8iSjrbubf67m0o616yZhtjU3gnqLd4JBmi9mcOhSJvfKsT9iaRzX0N+IilcjJ0pVS7U4WIol/7n9WJ+SUMUe9X0lOWRDp2EOiiApsOyEk6lDD6BXTpM5D1046UUVsfkJkKPPr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585734; c=relaxed/simple;
	bh=gMQ3Kn6duO5K4C+v13NxvvgOle96l26rtjp76iy9njw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kY7HchwPUAxcdACQOPF+cSs7xSDVgf+85ntkPnOwSfMhxnyRN4IrKcjXim11IfPiELhVlq+i3zdJeHKZpTlP6eZgbgrbhqokOZFtXYwwtMyozrlVc3z4cCBygytYz24Xip/fIl0B4DJj39A6btVgDPW8SEqD8WjiKXvdvTp+RWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=q4FOfOUz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="q4FOfOUz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6731840425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768585732; bh=SJhFVedYpxbiqojAAn+OWSPvu8sRuqq5A+kGvQ23Ick=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q4FOfOUzkjKXnDUiYNHoV0VCVNY1ywkBeKP6R+1vz70Gg/qFYQQT4d1PiACm3hg19
	 dPdqFNqcc9XzsRzA77PpsJW2B2cvharr3dHRRGTVToiExqGpPGB8aocsqjE4wQc3ke
	 DuFHU5TZu4QUMrySsNgEXzHnxPNfduzLUKhae0VrfjGmIXW7c1wfTdC8h1oVu9x97u
	 9fJl0dJzgz80Qv4AklpBPBgQNWB0FF8NYqSTNZYOg81dkgr/G7G40OhuEBVzf2te/m
	 VK4dJNkqa00frih2OZh1DtV+vngUg29CDXxlll0OijjhhUIrX42l5G/cyLjD2W1nUi
	 I21WHmZR9P51g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6731840425;
	Fri, 16 Jan 2026 17:48:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah
 Khan <shuah@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <20260114212558.1aeb1b17@foz.lan>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
Date: Fri, 16 Jan 2026 10:48:51 -0700
Message-ID: <87wm1ho3cs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Em Wed, 14 Jan 2026 12:24:31 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>> > I do many of these on a regular basis:
>> >
>> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>> >
>> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>> 
>> Yes.  The tool moves, but its functionality remains unchanged.
>
> That's actually a good point: should we preserve a link on scripts
> pointing to ../tools/doc/kernel-doc? I suspect that a change like
> that could break some machinery on several CI tools and scripts
> out there. If so, it could be useful to keep a link - at least for
> a couple of kernel releases.

So is the location of kernel-doc part of our ABI, or an internal detail?
:)

I'm not deeply opposed to maintaining the symlink, though I'd rather
not.  It won't be for "a couple of releases", though; if the symlink is
there, nothing will ever change.

Thanks,

jon
