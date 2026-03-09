Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DEF3B52EF;
	Mon,  9 Mar 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074350; cv=none; b=JDZDCgXBujP4n87qYFQNK1b2nYlZzCdz/YtNcmL6SQ5FZf12Gy0KX60FLLQYh3+4koiW0l3RmK8FDxY/QQSaSfA3/nuNHDZI3bu5SNl/4aTGBxdr38lvFkQJGLi1rPy+dSfa/M2F4sTopggyK87m1LVDoRH9lhaHGsAie3VKEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074350; c=relaxed/simple;
	bh=wVpBiWemAt9F48ut3m/CDIT+uUcMN/HtPGk4CqnPbqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RUZ8hkKPvnG7gRCsgqpRcL4YVNQCwhVWrnAk9bQnzHtUAIs4vpgcJUWb4VzlVMvx971uj6kyfAGQwFfDoMLQkViuoozFf5u9Lp8UtfSWvMLJg17dgWJFqXI0KV9hgfYCJ0sZG9OAEEhapQ8zwpzYNk/GoTTYnYRk6WNEwACUizY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DDCHLhbG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DDCHLhbG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 54CC340C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773074348; bh=wVpBiWemAt9F48ut3m/CDIT+uUcMN/HtPGk4CqnPbqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DDCHLhbG9G9x7wnMahD3WWwv2eowi+GCB5pSt1uyMac2NcjhLXAo5eY3NLpV2RVJ+
	 tReRIv7mTEIOGSvXh8Pk9akx1pvWI06vPsgVtGuSkV9+qL1u5gn629K0NOc7yTfAeC
	 /BRHxFqR3SaK09TKTHppIr2BsVUkS8dkLHJ0HIuFMGLwLdPQ8ZIBc2/tYqp1TW0qdl
	 DiBlBQXmCKKK7tpcipgQneRDaqUTpvRHH42w6sc2/OwQemcjU806yb0UyIR27/gMj8
	 54RKbZpTU0RXKrO/LkyjLR9jl1IQlGELaJK8Zs2gLhriAbkHa1sjqR5S0vZiaUE1J7
	 E6y8eqnu+zWYA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 54CC340C9C;
	Mon,  9 Mar 2026 16:39:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 00/13] kernel-doc improvements
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Date: Mon, 09 Mar 2026 10:39:07 -0600
Message-ID: <87wlzlufdg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This patch kernel-doc improvements. On v2, I'm keeping just
> the patches related to man pages generation.

I've applied this set, thanks.

jon
