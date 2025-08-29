Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155E35A2B3
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 23:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756508876; cv=none; b=QgXnVPx4lIVEzVP4wOwIqxfBv5kZIoWcwHqk50dnOBpvRF3ufBjMuycsT3Ix27GUECA6l7G6SJMDM/SuzF4kBv/dUbTdN1n3jjzsdkJPvjzdzZ6kd/YRJ/5umKs69jgnBneYOK5M88T3zKoDZYGXOcNmIaSYwt6KI0bOwW29CaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756508876; c=relaxed/simple;
	bh=vSBtuCoJW8W0VrGQmAYx1wSpF+FXZgi7Pve6sfhyckk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=VslFY4ECI+udgErH8ay3x6o5aBXFGrUu8CAIVzfJ4FxWXwU/SKIVNokB72e5lDLi5pF+4kOPXJKdMWwC9j9DZGRBQmjK4Z+IOBh4EQZwC38P3LuCzU6RhR8j/srPBkvi38XjCINfN6qe+/nE9yL6VoZhLwxZYzvLBSCU7AssCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h7qTQYIC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h7qTQYIC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BZENjRPvOt7Ok/fzHMDZwD6vrPT9D+2Kb9xtw4Yc+b8=; b=h7qTQYIC0gGN2FVirJq8Os6LN7
	4jmKwOZY4PNiIgmUryD7gSB03qatovMrfB/IIB0G99l7p8Wh2RGO2mXITPO8kVj+br9fKg+Cosg2s
	Ytj2MWCVP5O5o2XqzHsNX9/FC3LihuDRXq2ghtir9t6Ewt3Ouv1cz81MykXS6EaqsfaxsQynhVqms
	bmY6BVbAnnZ7Zzxw5xJPXjYBuy756yBKXi7hyutX29xL6FuoM+PFJ7/6y3QIi8XQ7ayRpgKCw4KXy
	pCGlWwN/IDzvH+mA2IDMMWvBWfr7EirLONPbvelmDsJ/EhuHWTwGgyC8tsim1JR6euImO1mOq2tuQ
	zhx4+hhg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us8CJ-000000070NJ-0uY5
	for linux-doc@vger.kernel.org;
	Fri, 29 Aug 2025 23:07:55 +0000
Message-ID: <6151bb43-8587-411c-8ec0-3b187bafdc43@infradead.org>
Date: Fri, 29 Aug 2025 16:07:54 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [howto?] linux/kernel.h: enum system_states
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Looking for advice/suggestions (for kernel-doc).

I sent a patch for adding kernel-doc notation for enum system_states
in <linux/kernel.h>.
See  https://lore.kernel.org/all/20250818042123.1786468-1-rdunlap@infradead.org/

Then I recently tried to add that to the kernel docbooks. Oops.
There is one little word that is making this difficult: extern.

kernel-doc does not support documenting (/**) something that is
"extern". I can't remove the "extern" and with it present, kernel-doc
just ignores this comment.

It seems that I am left with using DOC: to document this enum, which I have
working -- it just feels suboptimal.
(Or I could move the kernel-doc block to init/main.c, where the variable 'system_state'
is defined. But that's not the right place for the kernel-doc block IMO).

Any other bright ideas/suggestions for me?

Thanks.
-- 
~Randy

