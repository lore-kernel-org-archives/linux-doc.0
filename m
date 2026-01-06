Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30782EBB8D;
	Tue,  6 Jan 2026 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736565; cv=none; b=cYohnTja6hJ6P9QkGekUfEPI/cbEip/8i6DoOaSH/W4ktI3JC5orKUp1es3Dw5Sl69EqxPQalj8Xtyh8o72nN7LAj3uf0FNdDHnYBsHGneK5HWheazBxDqV8FQlNTA4vbzmMmXGLIaE/M4M2CRukwTZk5lk5g4YHb1c/EY1k1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736565; c=relaxed/simple;
	bh=F/AWx8Lvi4mdlyDHJ8IS3m8JD9lYINu7+N6+IZXdZ9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kv7qBEUIAXfoeC0gvuje29pjoC7DiNSMO9fbQ30mW+X5cKREBQbaqHzFJkpsZzUxxkFkB2ps0NV/D+aiOTelXU4JlHW+a6KGMVg2Dze1kaJggimaNZNSqh3eDgqSKNSArBqMWz5+gOnr3bcMOPo/NryLbSnoRYHMS18P/5Zb1PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SDN1pbM/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SDN1pbM/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3514E40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736563; bh=jirJp99tyTHjGa9d87GR5YxT42rF6qY//ImlDgG6UtA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SDN1pbM/wZNTKSqGpC1dJl70zT/YHBxnqGl1elqxpb+x7hp/UDc+oNpQ+b5t1nJAh
	 2PBxfjEDHB/wVOQ70zqNqOuDLlPJL3p4aa0wHGkOm2eLHS5X2pUKhjdjQGhhfOcZTZ
	 +O7xgS4K1lwRNL7c9J1bFA50fjfZoHYAvrkiygvGSaDJr14gqih6UAvRXRWwMPXbK4
	 aL7zTqwKaQojiQJzU1tIZ7dAMGIlLr8Qn0DItiaw4ZoS1xyyFc5pSpnzpDt31iS7mu
	 cxmphyK93FbO//9YiNSISbYFxbOc2djp3wfYri8rm2V2rsnwXWQU7ZyZTDZE2CenHj
	 QJkKN0kk+K0zg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3514E40C7D;
	Tue,  6 Jan 2026 21:56:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH v2] docs: add AI Coding Assistants documentation
In-Reply-To: <87a4z9xlst.fsf@trenco.lwn.net>
References: <877bue18ch.fsf@trenco.lwn.net>
 <20251223122110.2496946-1-sashal@kernel.org>
 <87a4z9xlst.fsf@trenco.lwn.net>
Date: Tue, 06 Jan 2026 14:56:02 -0700
Message-ID: <87ms2qcsnh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Sasha Levin <sashal@kernel.org> writes:
>
>> Add guidance for AI assistants and developers using AI tools for kernel
>> contributions, per the consensus reached at the 2025 Maintainers Summit.
>>
>> Create Documentation/process/coding-assistants.rst with detailed guidance
>> on licensing, Signed-off-by requirements, and attribution format. The
>> README points AI tools to this documentation.
>>
>> This will allow coding assistants to easily parse these instructions and
>> comply with guidelines set by the community.
>>
>> Link: https://lwn.net/Articles/1049830/
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>> v2: Move guidance to Documentation/process/coding-assistants.rst (Jon)
>>
>>  Documentation/process/coding-assistants.rst | 59 +++++++++++++++++++++
>>  Documentation/process/index.rst             |  1 +
>>  README                                      | 12 +++++
>>  3 files changed, 72 insertions(+)
>>  create mode 100644 Documentation/process/coding-assistants.rst
>
> Thanks, this looks good to me.  If nobody screams, I'll apply it before
> too long.

Nobody screamed ... applied, thanks.

jon
