Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D563518
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 16:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026802; cv=none; b=eYoGtaTxL2hDtT+CqZCEb1bswbWtj1T2nPykA5neS1Pg2zupyELkZGnSujneVB3vFXdo+nltT4uYQPDC7z54P6GMoWxxT7EvNDKuVAy9U4OmPFEiJEuR1rDJYS7snnHdKbmuVA80IDlso/SxzV7CIHXCJdFNjPUiziLJ8vkkrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026802; c=relaxed/simple;
	bh=wZV1nDsf1Mh6bNPqk15yidzQEr972rNKIDNejFgduiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A/euWbHRa+Q0fjuxzdGcPfkwsYyC45i8rWFiigliz0LdTMfp1ykHFWKznEgG0ydDsr68vjjH2tCIvLW7ChTfpSozSwtMlRrZVVatV6D6rT69IXYluFKtOg/pjhsxrbKwlTJAVmoctLCyF9aGgZ0xhqemhB2EArXMM8fUccLksQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QDt7fcS4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QDt7fcS4"
Received: from localhost (c-98-53-138-11.hsd1.co.comcast.net [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 61E3C383;
	Tue, 23 Jan 2024 16:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 61E3C383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706026796; bh=c+HCD0uBFoV0Qlz1Gu4hTVYE7PigHRTbK6L0ISNBkVY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QDt7fcS4U5n2Suz9ohSr910McYe+qd+OeRhvg21y6RJ1DWUgTn+6jECAW83E9FjdB
	 xissCZUUSOYng1oj3OIaRE4p8ve/14XuPYLGIdfhRL//aV+EYOe3MZRlR9P3xJSQWs
	 2ugROBKDd5i4GK9YDZuvYF6/HkMxkiu7datmG31FG5B+M1pprLliiRnWnhRtMn1yr4
	 FwuXS7KrjHbyiOJ8HjGkxy/gkJ2Q3fXKqJpjSHI/x/KsT908+op86WoTD1Se1ZRfWH
	 TTjKd1dkPTf05lscoxTcIt61KelIl/WHvRJHJTrFQLZrG/FQUFhumcwILIf9pHYeux
	 IbMYnioPzk+0Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: docs: requirements.txt has stopped working again
In-Reply-To: <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com>
 <878r4gnsev.fsf@intel.com>
 <2018acaa-a6ce-4074-b3e1-1a12018573fb@oracle.com>
Date: Tue, 23 Jan 2024 09:19:55 -0700
Message-ID: <874jf4m384.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> It makes sense when those ancient versions build our docs just fine and
> run MUCH faster too. Here was my proposal, more specifically:
>
> 1) requirements.txt : take out all the version constraints so it will
> just use the latest versions of everything (unless there are issues with
> those) -- this is what I think Akira/Jon/you really want

Yes, this is what I would do.

> 2) requirements-2.4.4.txt : create this file and add and freeze ALL the
> sphinx dependencies at specific versions that make 2.4.4 work --
> freezing everything means we should never really need to touch this file
> again

I don't believe you'll ever get to a point where it never breaks; that's
a *lot* of dependencies to track down.

I don't think it's worth it.  The number of people who *really* want to
build with a 2.4.4 system is, I believe, quite small; they may all be
copied on this email.  It is enough of a niche thing at this point that,
I think, we should not go to great lengths to support it.  Perhaps
somebody can contribute a document for folks who really want to do it.

> 3) add a warning when building using slow sphinx versions, perhaps
> encouraging people with these slow versions to use
> requirements-2.4.4.txt with a virtualenv.
>
> I think this ticks all the boxes:
>
> - No more whack-a-mole (since requirements.txt would have no bounds to
> update, and requirements-2.4.4.txt would have everything frozen)
>
> - Doesn't raise the minimum version unnecessarily for people who would
> still like to use the older and faster version.

I'm happy to not break 2.4.4 for now, though I suspect that day may
come.  But I think directing people toward such an old version is not
going to lead to long-term joy; for better or for worse, Sphinx has
moved on.

jon
