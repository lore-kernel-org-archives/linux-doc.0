Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D901BDAA8
	for <linux-doc@vger.kernel.org>; Tue, 27 Aug 2024 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762872; cv=none; b=EGyq961t3WjiBsSmv/emyHc+qfDve98kUV3m+cejxWQBXzHeqnlYfnqircw4r5Cs1JtTtfs3l/gguT+wczcGsy/xtfKq9cZvhWbnFIrHSAtnxCAs03+lBjAXeg/VFpmOulpdy0J2UdRAWIN4Y4wtbpW6GAt8lGRLMAEDuWXJfW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762872; c=relaxed/simple;
	bh=psCOuogJY6vyhqZpgbTol4K+yi7sFZ1xPdXlQn5ZddQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIchkmP50DjRQDV06sfTOjUVFw4kH9raQ4GYWvohuI1goynMNmk5HRFqhnZQN4lnCka8i5zHf7Hy6RgK5pDDknLASSz4iizeBMJ9KQYZjyjyLiR6LQkZjIcyMLxdJb03sinsUfh0mus57wzFN41pLuwis52W+AOOZFaXpxjs2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=ABxAHJxd; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="ABxAHJxd"
Received: from cwcc.thunk.org (pool-173-48-112-93.bstnma.fios.verizon.net [173.48.112.93])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 47RClfTq021527
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 08:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1724762863; bh=cSqYsJazqQVSj1BtvlBuCCy16X7dHrEI2THz+qj+LS8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ABxAHJxdGn2NgKIiNRCi13SIQMoUjIPKgsNqJ2Idcvjcl6O8qww3dII9uwhNo7MSx
	 R0OkZ4VJY8bzfDCASeVtRpj6+r3PyU24vs6idAzQ+RrI4BmxKDaGr1ehQgGJG4IWCK
	 0BynWCMfR1Qt2s+vgyN9/gKZfMAr54p8zLKN3BIkYSvE90kyS4vW9NlWT+BZuav+4F
	 39X8YbcOC/9ko1IM5+dxcGkplRQFFIiyAIdowUsPVxwuvsG1o8pA5Qva5VMqVjX+kV
	 VML6ZM/jcQuoqTSx9ABx81YWvRs5tZLwmmLeGoji8sY7RrDuaDt5e6W74zi0s+l/tG
	 3MACdqFt1PrIg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id C16B515C1A13; Tue, 27 Aug 2024 08:47:38 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: corbet@lwn.net, Stefan Tauner <stefan.tauner@gmx.at>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org,
        linux-ext4@vger.kernel.org
Subject: Re: [PATCH] Documentation: ext4.rst: Remove obsolete descriptions of noacl/nouser_xattr options
Date: Tue, 27 Aug 2024 08:47:31 -0400
Message-ID: <172476284021.635532.18338846085891684831.b4-ty@mit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240728003433.2566649-1-stefan.tauner@gmx.at>
References: <20240728003433.2566649-1-stefan.tauner@gmx.at>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 28 Jul 2024 02:34:33 +0200, Stefan Tauner wrote:
> These have been deprecated for a decade[1] and removed two years ago[2].
> 1: f70486055ee351158bd6999f3965ad378b52c694
> 2: 2d544ec923dbe5fbed64a7f43dccf527218380bc
> 
> 

Applied, thanks!

[1/1] Documentation: ext4.rst: Remove obsolete descriptions of noacl/nouser_xattr options
      commit: 736c24e62e7e1f5d00fb5b750bb7c13c56410d07

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
