Received: from mta1.migadu.com (out-200.mta1.migadu.com [95.215.58.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED06382F08
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277582; cv=none; b=rAvf7BHzHDcFoilw77pvwzMZHbxvTjfMOTYxNe6AdRE6rPlM0cWnKgaHf7nApA81ROOUoWt0yMbOWaqeY1ackwAX8ubY/osXUmNcfPP3oR92siagsenr+p/qA8n3GouJxzwD8FXJ7amkxBHLbs1Usd4Va7x3v3JG7km7/4KhaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277582; c=relaxed/simple;
	bh=N7LtSXyDsPdUmzpDANl6KMN7m9fGD7tzp4vxQ92tm2k=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=JBYpspXyeH7l4myE1PLRew0dbeBWTQxCY4k1QBjwqNJUDX+w8HuBnkW20sUH0IIsZARWjQZcWGnhto40sfFTWZi69v+h9CKFj88nq17adHpkoTiHV277SNV5SlLsw7icIumvc8WMyX1dsKwvKSeJlfEDColUZY+/aSEaqWE5Y2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=w+DGRbW3; arc=none smtp.client-ip=95.215.58.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="w+DGRbW3"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N7LtSXyDsPdUmzpDANl6KMN7m9fGD7tzp4vxQ92tm2k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791277578; v=1; x=1791882378;
 b=w+DGRbW3Vyl2KP2XzmmirV55u1W4SnCufpImor3MWvaKDE2Yi4T+VDv+N13QuN5W1010oCLS
 84g8cVS4OAgCqOgsBRRs2Wq9BUxypAkLp9sw3Pf1b0vMC0YoPQghv3XF2Nvr7eKXmAMe8rZnki3
 mulrQ8lXewMMfhxzVdezazss=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e34774ad40f19477;
	Tue, 06 Oct 2026 09:06:18 +0000
X-Mizu-Trace-ID: e34774ad40f19477
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] docs: hugetlbpage.rst: fix typo in per-node attribute description
Date: Tue, 6 Oct 2026 11:06:02 +0200
Message-Id: <741903F2-2935-4AD0-A46B-63457E6E7393@linux.dev>
References: <20261003161125.40485-1-lienze@kylinos.cn>
Cc: osalvador@suse.de, david@kernel.org, akpm@linux-foundation.org,
 corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org, enze.li@gmx.com,
 Enze Li <lienze@kylinos.cn>
In-Reply-To: <20261003161125.40485-1-lienze@kylinos.cn>
To: Enze Li <lienze@kylinos.cn>
X-Mailer: iPad Mail (24A446)



> On Oct 3, 2026, at 18:12, Enze Li <lienze@kylinos.cn> wrote:
>=20
> =EF=BB=BFThe per-node hugepages section writes the free_hugepages and
> surplus_hugepages file names with stray trailing quotes.  Quote the real
> names as inline literals instead.
>=20
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks=
