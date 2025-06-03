Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3128AD51
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991849; cv=none; b=QjrYn6Zq7TkYkb/lwGdAaVP7rBunmFlp2r++hoA2RQnJ6u+QFPgt0VxBdnWNT3zwmT5HVT9Mk+K6pX8HSO0yuFZy+cynuJpZN2MmnpIRhUoO8V+vkF0E0vGGFxG8vt47BwjHLn0lhwowePkNyvXkLgjtcXLy4xDToMPphOR1vlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991849; c=relaxed/simple;
	bh=EILbcwjSvJyr1wLSYz69Q7Q9IxD9Ia/nCf1igvwOTqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PqCNN7vIM+CDvYiRwGmPD8R+/RuQNVzfL7qenux8zIZPx27twV7EjH7xXSFHjCsNY58sdrzovKDQyFwtodt2ga97jKNt2uuhcx3S4W7FOQmL7nqNnv+BYTqBHeCzdw13eg+Tl1Ku0uw/p2x/YfZifeQPKVqBDKfKhPVwmV/l3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=edJ0Y1Jb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="edJ0Y1Jb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EEB4E41A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748991847; bh=QPRzg2xz9dtJFr6wFP9euJBmNETC9qTwd5mOJKEkYzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=edJ0Y1JbjHbRnk9gc97fio9iK+3XcOadl8tZAOuU+lCCAQfpaZcim5360AAL4Ko0J
	 MiZevhzeKm+DMALvFUbwGY+uf1PCGu1SUvGvx9E4xyJk8NLE78ccmAeHnRqniO8Qix
	 EGNlJ9/xOoav0wbHIOssUzdpo1NWpjI4nzLtOppsDM3nUlY8XaON1Uu6duvyxwAqSq
	 lYTYyaLfUhAcfaiNLHkIkiuAp4OtXQQMSrysSrdyKvUXrI/2/GeUVgUJkDbVSUk4Nb
	 52wg0G6niMR2pCEf1ro/8A0KTkriWZSS/76MZSFo2RF8LCAVcQArFSHM4RjBY6WWVt
	 o3aeIN8H77tZg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EEB4E41A90;
	Tue,  3 Jun 2025 23:04:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
In-Reply-To: <87r000jvcl.fsf@trenco.lwn.net>
References: <87cybklp2n.fsf@trenco.lwn.net>
 <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
 <87zfeojzr0.fsf@trenco.lwn.net>
 <e6232bfc-092d-478c-b085-72bf4e9544f6@notapiano>
 <87r000jvcl.fsf@trenco.lwn.net>
Date: Tue, 03 Jun 2025 17:04:06 -0600
Message-ID: <87iklcjul5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> I wonder why they used a border rather than the text-decoration that is
> there for exactly that purpose?  I'm inclined to change the CSS to get
> reliable underlining for everybody.

Having played with this a bit, I'm guessing they went with the border
because the text-decoration underline gets mixed up with underscores in
function names, while the border sits below the underscore.

Assuming we want to preserve that behavior, tossing in a line like:

  border-bottom-width: 2px;

makes those underlines (that I never even knew existed :) visible.  So
maybe that's the approach to take?

Thanks,

jon
