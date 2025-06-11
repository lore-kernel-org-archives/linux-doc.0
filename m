Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF1E238C0C
	for <linux-doc@vger.kernel.org>; Wed, 11 Jun 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649998; cv=none; b=Dyy/BVlnJp0U6X+3ATTXnRwXYMRLglkBkP33CTTmM14JcB5I6NtI0mMp1Bn+/88f3H4Gdup607pzCkrg9QYXI1BDIBP+0/nyO8+Q8d6tgqq6R2hDYuMzzdwiwoBoHBGm4Gi31kFoKlWL6AyQZiG5/JXHiKIeW+J4bf4/WpqvJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649998; c=relaxed/simple;
	bh=9SIdAh840g6tydo2JznT4GeDVA5YXlZf24fa0jmn9oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoCcLMqpBpfewADd4DYGtOjsBGOUdJwgquEXdI8WsoB7UPvVNnculngaefj9BYOU+wCKkaaswcaenQ/kGS7zwjY3Z1jBqCLKb/Gy6+c6GHBlZ249w28D+XNPH975rLIKQKClDoA4ayNcO16UpWfxGQkIiQ++CgIZ/pxFCHnr/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WYdAW6iz; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WYdAW6iz"
Date: Wed, 11 Jun 2025 15:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749649990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4zq30Zx1gm5+DnliSP1IJP9mnbwAcrHCYpwo6PmyzBc=;
	b=WYdAW6izimj/1gDUnPW+moaf3Nr5+ezwcwuLHSc4IvraMglv8YBB9VUujsatvLjE7apE7p
	u9v5WzRBHxvmN01qtvUkfX2q9urcqWHuzQ2J9T3qKK3D1YvTQTqQ18DDnJz95VqMnpFJVF
	LrIlkoskO2W4MhCJ1lY8fuv0ZUIvBeA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 01/16] kbuild: userprogs: avoid duplicating of flags
 inherited from kernel
Message-ID: <20250611-overjoyed-vengeful-goshawk-0aaf8c@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-kunit-kselftests-v3-1-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 11, 2025 at 09:38:07AM +0200, Thomas Weißschuh wrote:
> The duplication makes maintenance harder. Changes need to be done in two
> places and the lines will grow overly long.
> 
> Use an intermediary variable instead.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>
