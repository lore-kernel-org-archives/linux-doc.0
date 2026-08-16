Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5EF3D9DCE;
	Sun, 16 Aug 2026 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786918944; cv=none; b=GIthdj63QSjl7vqTaoFIw2oKLJeJLk95jF005sRSerTA4n5Tsi4yjpS+1v8LWK0Lc5ln+AS5k+BBoOM38oMsBw7BU50uIj/gXdaEdV3BYN0yvNMuhgICKRIiSCO536QS6EatKB6gxKisHjX91OkAPEI1cB5SFvFKurIK01yAsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786918944; c=relaxed/simple;
	bh=3hmBpaMnAtwOdjF7oxxNB90HgaPg6nuJWulxlHSsuYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFKMCQpdwfczKZKHulUsEgj/7kTUMcWp3/JvGTveNLHQgOofP4k+FsmLjKVzohGgukUIBa0vg17SeI5GEhvBPMLMVBRHlI2H1S6PckK0gEej6JZOu16UV95wR+GzQUaTzwQ3cqwDdgBgtLCPLv7rf5hZzjfbSuLwAS7Z07gvXnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Woqv5TCY; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Woqv5TCY"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CFF84408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786918936; bh=PHlIKzqf/xUe8/WghJAjbi7vgSksD0pH60s8VEOA0Sc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Woqv5TCYcXGN4AtmAUMqcHfOIX6tjEiWfsUwGwldiFPAj9glsxupjUxfw/mNrTS3h
	 4OdtbMyHYyFdu86Kp93m0AHI31zfRZRI1H3tqh11EeLN0aRIiLQ6sRVTIZCY6+6tyj
	 2V81JLLe/dcvjg2zlK7jDJkTdTcpEeaJ22ZwGcVBVeJWlbz8D8bfT2FUMzRQRi2C+O
	 gTCQr1SIMJJWfXOp+5DdlEa9ffRLKb/PbXY8xrKBgUeLcfN7iX0exBVfNk2ZBW1TYe
	 5EOFbkFnok0XxlVJ0b3keb7HOfm675VrMgWGUryl0YheGHJYECJevvKpo4XZb/Ee7t
	 yqvb+wg+Vf6XQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CFF84408B3;
	Sun, 16 Aug 2026 22:22:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH] doc:it_IT: align Italian documentation in process
In-Reply-To: <20260816193906.68808-1-federico.vaga@vaga.pv.it>
References: <20260816193906.68808-1-federico.vaga@vaga.pv.it>
Date: Sun, 16 Aug 2026 16:22:15 -0600
Message-ID: <87cxvhd7u0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Federico Vaga <federico.vaga@vaga.pv.it> writes:

> This commit updates the Italian translation in `process/` following
> these changes:

Thanks for the update.  Just FYI: at this point it'll wait until after
the merge window, so be patient...

jon
