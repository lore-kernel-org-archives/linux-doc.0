Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F830DD0C;
	Mon, 12 Jan 2026 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236503; cv=none; b=ThVLfgw7cjaCBNiHF0h//VBxxOEaodAQlWGXiJRyzGYwUH1wESb9TqD/szgkQ9BxBpaOJXDiAJLbyFuDdMMa9r/+QItlIrSikaqIEfv3JOF5DJp4VL8y57kGvaREtUH+TrcxObhNOt9Y3pCIr7e2DQVSy9dNjtmjdzsNDKD/GCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236503; c=relaxed/simple;
	bh=YjmAbtgQC/s7dIGwLqCAxwFVOhqrOl6oNjB7NNb8dnY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pbyoJGkeN8Yz3Uiy9GqEBw6YrPn5WoIdMoyzLcJ4JbK6ZmFBHFjRVChjbBq1C4lfOrk1P5QxS34gSvuYsbaAGBqEKqsVrQevpgqWjkf6LWftuiOxqqpq4zk+zD+1Jr53/3B0DV8aR/ISFnn6f6Uk1OViwyljuYdkPB33GDqbUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=T3Cz1/VE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="T3Cz1/VE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7BF940C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768236501; bh=CF2PaMUf9/8lr91dWkt6XrOQUIofSOX+/dF8VryR3JA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T3Cz1/VEfqL0ASF5BGRuk+Ze8SYZZ3dmX/FhYztP+OP2lotL7pGmCt0Qu8A47BtJm
	 vTdkwJCauHrh5zJzOwR3SVFZp1lNeID4LwMpRjzF/4dmrrcfxBsC/FwynwT6tPrM+7
	 XNOUplG9z2lk3ay1rYrjtiU0ANDMrbro3W0qHKVozkeYAYi4nBLAXnTwQ+dwNygJ4E
	 XS91RTkvNJbkwQZulpK1RVg07CJqtUZEKQek8WJbHxGzhqbCrHyG3y0RNAJDqyFoTh
	 qsy1N9hpMB1LLq5vpW7YXcTVUAbR02qVNg2XT80wB17VbBip31rZzfYFPxDbLTWkpn
	 Qv3AZFj+lzZbg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B7BF940C42;
	Mon, 12 Jan 2026 16:48:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Changbin Du <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du
 <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
In-Reply-To: <87v7h6241p.fsf@trenco.lwn.net>
References: <20260108113836.2976527-1-changbin.du@huawei.com>
 <874ioq3jad.fsf@trenco.lwn.net> <87v7h6241p.fsf@trenco.lwn.net>
Date: Mon, 12 Jan 2026 09:48:21 -0700
Message-ID: <87344a22wa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Jonathan Corbet <corbet@lwn.net> writes:
>
>> The warning comes from JobserverExec::open(), for an exception that
>> appears to be expected.  This is the sort of use of exceptions that has
>> made me almost swear off them entirely in Python - it's a huge try block
>> that is using exceptions to hide a bunch of the assumptions and logic.
>> I'll be posting a patch shortly to remove this non-exceptional exception
>> case.
>
> Here's a first step, just to show what I have in mind.

So FYI I'm going to add this into docs-next just to avoid adding a
potentially worrisome build warning to linux-next.  It's not yet in
docs-mw, so it's easily removable if a better way comes along.

jon
