Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC53815E3;
	Mon, 20 Apr 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667390; cv=none; b=TyUmWfGvS9ChASGgQLdolyjpXUpTyFfP9LxTu6yXHv6R5RDHT3UldX+OKZejGP9hdWWGL/iuY4Qq2YbhYPOmjv4kPUI1D1n2RzxPupEY8W0nFUmx20pXbe9zbsB/bX7uwEB9TBSiTwYlnvPXklQjpVqAe/nlut5RLaeO3jMy9+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667390; c=relaxed/simple;
	bh=ATJWEgxYl2DgA6P3RU7/+7xRbnyWjVgkGIKyfog2UEk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SvU0c+JTVkbLmeeKeUrAzj7j9zVsmHZgQ6c8mPu9Gq9qpHniAOTQNQQQHnCoT4X9czeW3+iqukDlY4IVsKrFh+mSGTONLPCwKror0W2a3ud4TIU56Nz/lsk7Cu+K6Eug2c/F2PK96aApOV8XjLeKElsU7+cWYXlRzZfMyKhkqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=msxtn0YP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="msxtn0YP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B758840B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776667388; bh=V5lG/8qmPRfYfae2xaMBCimH8dzHHT9YQ6vuqn5alsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=msxtn0YPMQuEkjC0+TmQ7PhHZeony/csdrctHIRBk19ZSiHKHjDmHa5SO504GoGpd
	 d7bOH1qphYfGLX2JRWeKaY0H7yekdAwV7tbI0M/Jsq4fJ5CWuW5xEkBz25qSJF2fBr
	 kwWHl5n6rdHnNVBybJu2TAyd8SPcphF7PxPQ2HB6f5/VOdp6PjR67pRLdeKg5mFh5D
	 buFt/ED6qTq95DxWFkFKn+VUOSC4MMPrVCMfZh4NQk8GT7Mk6oNoQqJ5Uk2+h3bABG
	 cg9cGKuDm0Hr0w7M2BMgp138sVywE3J94TDR4Y72BJ2FrRwiowWfw3cg670HkTzkcX
	 pGXZecpQ15y7w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B758840B0C;
	Mon, 20 Apr 2026 06:43:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nick Huang <sef1548@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo
 <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li
 <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes
 <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, "Liam R
 . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
In-Reply-To: <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeNGbNyPxJssnkbO@lucifer> <aeOuCH8ydw_yzdXZ@casper.infradead.org>
 <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
 <aeTTw4gziJigaNbU@lucifer>
 <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
Date: Mon, 20 Apr 2026 00:43:03 -0600
Message-ID: <87jyu2w2rs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nick Huang <sef1548@gmail.com> writes:

> I am really sorry for causing trouble for everyone. I would like to
> ask which aspect of mine was disrespectful, so that I can be more
> careful next time.
>
> If I want to make this kind of change, should I send an [RFC patch] to
> ask for everyone's opinion?

If you want to be respectful, start by reading what has been sent to
you; the problems with your submission were well explained, more than
once.

To reiterate:

- Do not send LLM-generated material without marking it as such as
  described in our developer documentation.

- Do not attempt to document systems that you do not, yourself,
  understand; you have no hope of getting it right, and you will only
  succeed in wasting the time of the people who have to review your
  changes.

The point of documentation is to be informative, accurate, and useful;
simply filling in a bunch of words is not helpful to anybody.

Thanks,

jon
