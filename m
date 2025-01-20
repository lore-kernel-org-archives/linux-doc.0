Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BE1B6D15;
	Mon, 20 Jan 2025 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402895; cv=none; b=QiYL/VvRAO3+anXXs4oHz7edIgNy+hO52ugFbjSgV/F/oMBwgkGx95vh+pMMJlEnZtehLLDmcu69eH1RJak9dJJKx/QmiggwVNLPM++Q4b9TCd9ErjjgjwLSpXRHrtXhXbisThA/kyhNhN9SGehV9AFchS0/UV/aRfnYqqUa0Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402895; c=relaxed/simple;
	bh=T/n42TwFUvKuZ4CPgoaljIEj2y7YBidG1XpdRKQcgo8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=npYzoVZZ4caTkTir5p0qcNbkOF9TIQaYTzIZ7pzhGqApwtk8B56jWqtSoOrsfLr3jI5KQOzZzS0g+UbP9AwEJDBbTH0m6O7jJk9Sms20qI/hrWok2kBzLb1ORakA1fmsmBsiOWvowHSpJFHruDKczcNMe4sy5VTgiswjQx7HdRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mh7DyEEi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mh7DyEEi"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E888404ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737402893; bh=YEO9upxrwiiVzecGObhGxSvSHv4w05Wzb8DCZKiYHXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mh7DyEEiWJG3u/VaHM3u17xZDauAQyrVroV3qfbnUQSKrBMHqRqaFg3IgmL9wjh1y
	 Dh++G61V5/vMe3osxGxDnlOWiBe2UOUWoffXF3PiNe+IjGX2Rb6h68JD8E263jvAnt
	 1gYwRoUvQND0vV/BsQlB2AvyO6pOLZksW6v7hsRUbRQfIxNgBjli5QkM97k/1cvmEs
	 15vdcH2VgZWCc8nDgeyCo6xeW4/4jlI1D/pGnhc2Z/3BK/sSeOjV8FwDPpOsL3nH+e
	 udPScqoQyFP052kFcuiXN0f4g3iOuyE7nAMkKQg1OEVZHWcmvO9vVD3FUU/ooPNG3J
	 TzWylMrfixFkg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1E888404ED;
	Mon, 20 Jan 2025 19:54:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
In-Reply-To: <de9bf5aa-ef1b-4a12-8cf7-9fe0d050e4dc@gmail.com>
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
 <87ikqiboqp.fsf@trenco.lwn.net>
 <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
 <87jzaqvfyt.fsf@trenco.lwn.net>
 <de9bf5aa-ef1b-4a12-8cf7-9fe0d050e4dc@gmail.com>
Date: Mon, 20 Jan 2025 12:54:52 -0700
Message-ID: <875xm9tg4z.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:

> By records I meant mappings of older to newer emails, which in my head
> is .mailmap purpose with version control. Do you think some of the
> mappings as I've added them are redundant and/or problematic?

My point is that this line, which is in .mailmap now (and which your
patch preserves):

> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>

...says to map the @amd.com address to the gmail address.  But this new
line:

> Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>

says to map @amd.com to @kernel.org instead.  At best, this is
nonsensical; at worst, you may not get the full remapping of @amd.com
that you seem to want.  So ... why leave that line in place?

Thanks,

jon
