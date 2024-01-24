Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD07E767
	for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706109966; cv=none; b=Nd1x5z39rA1/TiesWeMBI6Vd67Y2dKVvYdUFHLrnM/q2Z6OLEX83s8dUOSTcW3G5b+Be7HwDEB1CopNaHOGNEFgLGde8eu9+k2C57zwO2jc6OKOMqdcraWeNaVLFwegahr596wqG9HUexuIX3N95U6orBvJNAfADyB9mL/x44IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706109966; c=relaxed/simple;
	bh=awhoYyJ5mFNmsLGxoD5Az6G+RPfbOSniEemC7NUwEYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLO5rWaKnQU1kxI74qFEIjjznhxfx1bAQbZ5W7PrD/mqlTtajYq/3LrkrPXZ28Wc3KOAO4J/cLF4I5tjkV0UAaomts7f9Q3wQmmrQtmQNPx5wjIvIX8pAJS8cxTwUODIqk+4oI3XWfY9swmOaBQB3TSw3/rcFk3tkCvQgsDPTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kbxNvQU0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kbxNvQU0"
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 21F9A490;
	Wed, 24 Jan 2024 15:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 21F9A490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706109958; bh=1AHrLJI/Imz8gb123CgBTD96l7s5Z2PXXtHg42q1Plg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kbxNvQU0fut08fTtdr+GfUoGVZPRJNdWWSiSpEZTVubsT2FJVlJQotYC7JqI7lnHu
	 NdSamnae3uz/JFAFody0SKdWAUqpEvhRu/suapfZ96+bzB6i3brF1IwWWPN2ygmo8F
	 nc37vsyNt7MRMoX3GvoLS5F4nMB+mDPFk1kpGZHrTNY1C9YRSF362Autu0J7xmb4dx
	 nZ1mF0OlskS4BckSCKEAApHsl+aMVC9mpXMa2ASQgUx2+kSO5TqwCpoo2pidTdkFwA
	 sIvwos7VwC2cMBrg+26tAdHu7sFFqr0HeyaA0sKxCNvWCbP1VuNhtgDHHq/s7GBvY7
	 VCrr1ikesCjRQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: docs: requirements.txt has stopped working again
In-Reply-To: <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com>
 <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
 <6e4b66fe-dbb3-4149-ac7e-8ae333d6fc9d@gmail.com>
Date: Wed, 24 Jan 2024 08:25:57 -0700
Message-ID: <878r4eiwhm.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Tue, 23 Jan 2024 14:21:32 +0100, Vegard Nossum wrote:
>> On 23/01/2024 13:30, Jani Nikula wrote:
>>> On the other hand, if you're using a virtual environment, what's the
>>> point in holding back to a version as old as 2.4.4? You might just as
>>> well go for latest, specifying only the top level dependencies,
>> 
>> Performance... Specifying exact package requirements like 2.4.4 is
>> useful since 2.4.4 is by far the fastest Sphinx version that builds our
>> documentation correctly (AFAICT) and build speed matters a lot when the
>> difference is 10 minutes vs 30 minutes.
>> 
>
> I've never observed such a huge difference, probably because I almost
> always do clean build of the document, i.e., run "make cleandocs" before
> running "make htmldocs".
>
> So I assumed the performance regression Vegard are emphasizing should
> be in incremental builds.
>
> Here are some of the results comparing v2.4.5, v4.3.2 (of ubuntu jammy),
> and v7.2.6.  (v2.4.5 needs "make -j2 htmldocs" to avoid OOM.)
> Incremental builds are done after moving from v6.7 to v6.8-rc1.
>
> VM spec used: memory: 8GB, threads: 4, ubuntu jammy
>
> data in each cell: elapsed time, max resident memory
>
>                                     v2.4.5        v4.3.2        v7.2.6
>   =============================  ============  ============  ============
>   clean build at v6.7            10m08s 3.3GB  10m31s 1.1GB  10m14s 1.2GB
>   incremental build at v6.8-rc1  11m22s 3.3GB  18m55s 1.2GB  19m50s 1.4GB
>   clean build at v6.8-rc1        10m45s 3.2GB  10m32s 1.2GB  10m13s 1.3GB
>
>   empty make at v6.8-rc1         3.3s          6.6s          7.0s
>   =============================  ============  ============  ============

So that is quite different from my experience.  For me, full builds got
way slower starting with 3.x and haven't improved much since, though
I've not played much with 7.x yet.

It's weird that incremental builds take longer than full for you.

> I took only one sample for each run, so these numbers should not be
> taken as representative, but they can still show tendencies.
>
> This means the slowness in incremental build is not improved in v7.2.6,
> which contradicts what Vegard said earlier in this thread.
>
> I think incremental build is what Jon uses in his merging.
> So I'm afraid the performance regression might be troublesome in Jon's
> workflow.

I sometimes do incrementals between simple patches (and they tend to be
pretty fast), but I do a lot of full builds and look for changes in
output as well.

jon
