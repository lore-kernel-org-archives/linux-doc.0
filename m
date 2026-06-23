Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A153A4520;
	Tue, 23 Jun 2026 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246800; cv=none; b=f6kyGOAl3z3MY8SQIiE/JxY/04EQkX5o48+rChRi5SzwWDUeEWqKlrp2tXeQDHW3zzPJYMyhuXsEv5DWRUedxkKWbt0TU0tYTjAU27zVg4f1j6wFHAHqV0FYPhTf5lW9H9WbGm9jSNZl1HeLUra0z/RqZHVhVVRneoW/0u/LdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246800; c=relaxed/simple;
	bh=VD48guEK54JaKqZvhTSDQYFEApXsTODWhVSjI4x0mYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OK2x6xOP7BQT4NNaHt8Fo8dup96Qj+iBYI9YsfCoJasOT/UxQWm+5dIqCFWQ6kSLXIj8ud5iB3syidN1n7bcgT2hyogCJZlqDvr7pvyHmgRiJQlY6iKXM/HSSZ7Un2EfcMQk3pDhL5TUbrFbekw2ddMTzstqYwif0XQL4rS/K8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DySyMg74; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DySyMg74"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3B42F40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782246798; bh=YR60LGaxkOt8ZSGPKed3yDDLoZe4TukhQORz2oIXlfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DySyMg74NGDt0oc1UNthON+QQc2FiMKWBqogeDrmCUfQr1UiL0Y1Jbm6n0WKGokSR
	 6jKJ01QEJFnJbQ1NusQOif/D3xDAEC60RD9b9DmlTC73zHbZENj8lFAA8bJ76puK0/
	 bzKCPSyN9bUIehvLNy8Vfp0dO9hopx9Pv96IKw2czw6lCXwr8A/qGliMVbttJZ5S1c
	 0J8t7Hvv4W3XRALoH80xKv30KxNgqOpKcu6TddRupQc54nSEZX2dLVjTEFnoVnExJx
	 zULli7x8dLAfv0ZWrMMMNuypfapZXPpEqJHS58/FkjJbCHOkmbybX4z3wVsuJ+Ms1G
	 FT0d+SYf8kzlw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3B42F40430;
	Tue, 23 Jun 2026 20:33:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Matthew Wilcox <willy@infradead.org>,
 Harry Yoo <harry@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: clarify that we are not looking for LLM
 generated content
In-Reply-To: <1cbdb3a3-b8db-4ae2-aa66-9042c1033745@kernel.org>
References: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
 <d421c081-8686-4d46-8452-e543401b0503@kernel.org>
 <87wlvpct0b.fsf@trenco.lwn.net>
 <1cbdb3a3-b8db-4ae2-aa66-9042c1033745@kernel.org>
Date: Tue, 23 Jun 2026 14:33:17 -0600
Message-ID: <87mrwlatf6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>>> I assume this was not picked up yet? (via documentation or mm tree?)
>> 
>> I had figured Andrew would grab it; I can certainly do so if you'd like.
>
> yes please. I guess I'll soon start grabbing stuff myself. Stay tuned. :)

OK, done.

Let me know how you would like to handle things going forward.  I'm
happy to pick up MM docs changes or to leave them for you, whatever
works best.

Thanks,

jon
