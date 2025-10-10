Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20EF207A18
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760127018; cv=none; b=dJW4ftfIAFp/sABdf/O7Ld2aegLJe/BkYVp5dQH8yfL8QSI6KBjOg/fhBznX7yqhhiUWK+NbKGfvC/BAfkTY5Or1W7dwMTS4EetLUX84StOmbwRL+OD6ryE+eK2rjleRBF7tLS3WAOTx4+R1ZYs9GXIwNW+8C7pDsG69MJtH+fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760127018; c=relaxed/simple;
	bh=XJBORi6dhjJFI3h41m6Lwb4KXFXb/L1Bgsv1wnVLzOo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=h4UrpDOt2Z69oYg0dAYNZimJuNtcCafvzXjUAvkaLhI40jVAGx7eYB02lgUa86EEBFvARRM7etCmSJva/tCtrV7yTlJH6exq4H7deMGQYRccpV7PguHVfkeFMeZ1dJfjGI4TQXMEQbo3rrVee+6ifc2pKn1nOeS6Tp5Wayjt+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CF+JLmZc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CF+JLmZc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PQMYIg5oWcmkTdG/blPUSt5gBHK7OMfTY4m12MEVF80=; b=CF+JLmZcOgbOvwaKOCrr38xa+r
	Zqh69GYhOr7qYEyMgi5nwxhlxJK8HQMX/foazn3LPrCPMHsdgWgWQ0Rt8hdTvdHbYHP9SN0qRhOdu
	bxS9G/m1y4h2jFmUcYZiUCAcsSeLQguGhYoWSzvWBzGvc2myaBFw0D2JJgxWKZBFgzTTEYG7jgmxe
	LTrrnM8y5dCYnSbJx5hhbaiTHV3wkMZkxPhBGcVH4AR9yr5Az37dn59uHWIImmORQo0LEV80hqAs7
	CgscpRjrYUzr9XociTVOdjlWgE0MgJy3Um8oLaqkk8qsnNr9Ol6U5g0bOp6w4Z5ZS4exZPmFR+WAM
	U7v5JxTQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JRQ-00000009HwX-1paj
	for linux-doc@vger.kernel.org;
	Fri, 10 Oct 2025 20:10:16 +0000
Message-ID: <5da3eb9b-207c-486d-8ae8-557a45c8a3fe@infradead.org>
Date: Fri, 10 Oct 2025 13:10:16 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: commit lament
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I look at this new patch/email:

https://lore.kernel.org/all/20251009105650.168917-23-wangjinchao600@gmail.com/

and think, should that be in the debugging/ directory?
Then I compare dev-tools/ to debugging/ and I say:
  Why isn't all of debugging/ inside of dev-tools/?

and then I see this:

commit d5af79c05e9382d38b8546dc5362381ce07ba3d1
Author: Randy Dunlap <rdunlap@infradead.org>
Date:   Mon Dec 9 16:00:41 2024 -0800

    Documentation: move dev-tools debugging files to process/debugging/

and I say wtf!  :( :(


-- 
~Randy

