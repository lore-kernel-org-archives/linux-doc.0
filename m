Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30B433E66
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950591; cv=none; b=AZQbCigPxWtbUEaW2OKfm1BcUjX6WDUIsF5VQsLcMGyGuJAioe7zyORkQ8Mjp08n2guQJ/lut9DDJoqo6/0bx26PnrUMMgNwNrB1DcCywRuKMgPaPiz+GydoFhY52Wr6HZkqVs1o6iY6GzY97WyWnUsDp2REj5fRWTPPm2HeDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950591; c=relaxed/simple;
	bh=PokocmR9VjH792T9hEpK01TnYL3laM0HlE47t+N2qQQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U44mquwW/qPmEMQyF6qqZgLR2t9BXELURIsdJARnn2ODMtoumCT6J6L3RbiPzteyrliH9KVwZPohH/lehzusrARQNJfdmpToxCsa4E4PCcH0Rqs/UdVDm39CXrB7yBSimSxep0DSTMY91Q+thM0GF91NxSRibK3XuEvRltlMj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PgGQJMLa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PgGQJMLa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 48E83410E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783950583; bh=Ax8ej4eBUVP+xEvgv8ODOC1k+Omp4pxd/3lwjtz7z4A=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PgGQJMLaRUoLTSvCsb6z/KNQpF/CKNe1+WsLu3dMuB80Ilganq/94OvZygup+LbFi
	 VijuQkep37gokdR0OZlTsJWqofDSG1ujIGHm6q8OJ1sLuTi/ouY5geRVoMkmV+AOjX
	 c4VnmBtkB3VcLP+3+cKm67pwgs9oHQIFujuvrHuC3pWrB8goH8Dsh/a5pOoTr3GDQe
	 BEoxjTT8/vZ1OEFibFZVAJ2GAuT2bxxHUrmFc8RAnHY5vIAdpvrv+VMcWsHif+YPyC
	 mFxE4WaVa4uZGvEXlLCYG/yROyhx6efn0BLLsIIJplbd2ag96JAPNxvi1U63C1SBha
	 0weZHuJPIHe2A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 48E83410E2;
	Mon, 13 Jul 2026 13:49:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: Question regarding CC list for pt_BR translation patches
In-Reply-To: <CAMAsx6cLjU1N6zuM47KZcsRhq1ABvRZkw_y57szBHNe1o23tVw@mail.gmail.com>
References: <CAMAsx6cLjU1N6zuM47KZcsRhq1ABvRZkw_y57szBHNe1o23tVw@mail.gmail.com>
Date: Mon, 13 Jul 2026 07:49:42 -0600
Message-ID: <87fr1nhudl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Could you please clarify if you prefer to be CC'd on these translation
> patches, or is sending them solely to the mailing list sufficient for
> your review? I want to make sure we are following the community's best
> practices.

It's always best to CC the maintainer(s) directly.  I do keep an eye on
the list, but the chances of something falling through the cracks are
higher if it is not sent to me directly as well.

Thanks,

jon
