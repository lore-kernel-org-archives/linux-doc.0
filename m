Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BB31AAA7
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717196; cv=none; b=cdtJ3d+S4lNAYo44nuZ+9jdw8VfWACcEmnGlxV+wtFlYL94vfv0GhUVzt7HcM5qcGOG4nCQJdyKOc69FfdjwzWok1iNvelCP2uCPJa/HVhbLK8NKz8TwQErJbWb2ma3j6xFM4Nm8YVpkLpexFWmOw5aqZodEhT7U+yS7vIyWnGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717196; c=relaxed/simple;
	bh=+eh/SUwQU9XD5Cmg6Rs5yD/vpU03vvM05wtq9Pa0vkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlYh9xyGJlPQ01aso1nIrBn8zmWnq4+fqUx581rhiTTqulIsjDuYdDr+MhIUgd7YQeLSj6zoWHU39ygDn3elm7HnkBXooQeSHwYbsKjQCPAVDFBj+W8ZotW5xexKdHcGC8/77sKz1m2S1mPujck/OcoSk9vAinHhGgjWYw+QLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=K3JEyVB0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="K3JEyVB0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a78e381fc1so6629845ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 12:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1769717195; x=1770321995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St0oud0e7oWpK/kNC2zmpDnKbjo7wRZGc2JcqraRRS0=;
        b=K3JEyVB0ZinlHzNJg+HCDg5yKi1ukkD6IdP9BuJhG9FDpWLhYWTIhgf80+bvtSv6h4
         gr6+xwYl91l9d7LgqGAmfP6qY46K94+/M0qWWYrckeuJmvGrl2KQbg4Tx6GlaZ6AR86u
         7rfdcKtVmR8NS1OX9Xofd84AUVk1jokwNF/9cmAIgYMPHFZXTPUAXlGqxF6FvIpLmH4B
         00ZsvGuvgnVx/rDx0AOUn57NyDZ7M6Kn/QNChU8B/oZ7l1vzGAKKhmQRdYUp8MR2VND5
         QitaJWJh21wEuPkHi8AL14dRQb841GR9XwIsCUfg7mRnI6cRKl2BsRWkHTiMIHn4PBj1
         /41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769717195; x=1770321995;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=St0oud0e7oWpK/kNC2zmpDnKbjo7wRZGc2JcqraRRS0=;
        b=XMN4B5oE/mh1Qyq9gjcz0bUEPDY17BMhDK+k62LzhFIFglDfUVlZ6bg9JMzvoXFjAL
         0SMyyQckdjkS1J8WS4gHcVsq1ZWOJxn21rpb2LJOJsQkJ2ocwq7df+no3eEGjF59nOBy
         8m6viXWPoFedHKDIaK7uzENcw6QgWzZH2601wfhxjlyPUpYe84YxI8kRVh9+yDS7pS98
         8Adc2vAWgjsg9D+6G+BSOeI6CaoEn/0iRFb5xo9vkR6Yz7jTHC1nzdEObxOUc6mgl4mj
         8FF789qk1VR19GL1n24ffxOoBVKfcMP0eRgjqk6EF1kPD7598AbsQqvRn046/czszemp
         6MCg==
X-Forwarded-Encrypted: i=1; AJvYcCVC0yU5xYUnT/AjyGX6HyLJ6CpokODmIXCbjfC3+YcfsWmFeL+jhKyBfMiwnnsENS6k4lDOJhfifnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9RNYh7uRNbphgLH+9qI/6BQbI2Km8EEdNN+ZFdqClUTQYuqe
	/bM26gdmO6FR1pEJNOfBWKPPkqD6jGf9NYJeo4k8S9h9kEOjaMoMPceZ+sKPj/iClWk=
X-Gm-Gg: AZuq6aKp3F82rxyIYr5twhDHK276udl0+b1xiFM15TesWQQ2DXqX8kS0EansecOAD2I
	lphTh2XroVFw+V0BXqkIYjFsz3UNjbFF+1/J6EUjiefAKejz5i0H31qvPcWbHkKzdyGCz9vYjay
	mpfZjzMQpRKlp1f37tbZ5CmZy3z3ibqcyBAsG9etQazFXiOWHc/4HD8lSMdB2BNt5ZsEoPZ1r5D
	jnRin9oIJd3LkrwddDW73DnPk2v6yiVkpbyMBlaUYJwn48pADKlmmJv2f142Oj/CgHITIOHdb3u
	2vD/26eCvvhO7S7UNstX96RXTC0ltp4OLzfIds4Ml3hclnLaw29l4GxmZ4PW6pY2QvwjR3slLK/
	4cOFu4V4/ukpPKRSsr8CDi88hmrZWxVd5wNKMxnQPM3Of7/PO3DrcL2ej/aW4LqBpq3rY6YofMa
	o=
X-Received: by 2002:a17:902:d4c9:b0:2a0:bb0a:a5dd with SMTP id d9443c01a7336-2a8d9a60127mr2972515ad.57.1769717194904;
        Thu, 29 Jan 2026 12:06:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414cc7sm58495255ad.33.2026.01.29.12.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 12:06:34 -0800 (PST)
Date: Thu, 29 Jan 2026 12:06:33 -0800
From: Joe Damato <joe@dama.to>
To: Fan Gong <gongfan1@huawei.com>
Cc: Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, luosifu <luosifu@huawei.com>,
	Xin Guo <guoxin09@huawei.com>, Zhou Shuai <zhoushuai28@huawei.com>,
	Wu Like <wulike1@huawei.com>, Shi Jing <shijing34@huawei.com>,
	Luo Yang <luoyang82@h-partners.com>
Subject: Re: [PATCH net-next v03 3/4] hinic3: Use array_size instead of
 multiplying
Message-ID: <aXu9yZBySHREdqoY@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Fan Gong <gongfan1@huawei.com>,
	Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, luosifu <luosifu@huawei.com>,
	Xin Guo <guoxin09@huawei.com>, Zhou Shuai <zhoushuai28@huawei.com>,
	Wu Like <wulike1@huawei.com>, Shi Jing <shijing34@huawei.com>,
	Luo Yang <luoyang82@h-partners.com>
References: <cover.1769656467.git.zhuyikai1@h-partners.com>
 <b7d6d384ccc0bd4c0d3e7af1f90901d589cbd0b1.1769656467.git.zhuyikai1@h-partners.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7d6d384ccc0bd4c0d3e7af1f90901d589cbd0b1.1769656467.git.zhuyikai1@h-partners.com>

On Thu, Jan 29, 2026 at 12:01:10PM +0800, Fan Gong wrote:
> Since commit 17fcb3dc12bb ("hinic3: module initialization and tx/rx logic")
> use "size * sizeof(u64)" in hinic3_feature_nego.
> Use array_size instead of multiplying can make it clearer.
> 
> Link: https://lore.kernel.org/netdev/20250911123120.GG30363@horms.kernel.org/
> Co-developed-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Zhu Yikai <zhuyikai1@h-partners.com>
> Signed-off-by: Fan Gong <gongfan1@huawei.com>
> ---
>  drivers/net/ethernet/huawei/hinic3/hinic3_nic_cfg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

create_cmdq_wq in hinic3_cmdq.c has a memcpy that could probably benefit from
array_size, but I'm not sure.

For this change though:

Reviewed-by: Joe Damato <joe@dama.to>
