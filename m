Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69546432BE4
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781894; cv=none; b=HOuH5OmJT+MPlIt1PJnDCn/rWyurGA6xG5QHhGk6stvVYbw4R4qbrWilp8+Pr82vrkGO/aoKRSkqEeCKgYwZTLhXP2ycZKkH+a2rQ6OZbuIhwdVXH0IQsS48XjzvjspJ0OpBVAoB/abCMrlcve6cNH9jA6EFKNFH+UaTNW+Ty2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781894; c=relaxed/simple;
	bh=kjAPPgXnVRvHJy6N7xBwlBlFClLXXw3NtVJdTZntbxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RTmO2Hz/Q3gbzZH5QsjPJN4EN6H4T8j7Cs89UlSeRvmgQD7HEtdbeeopvayvvn2nkUY/mf1GL/iQFpjGAJKz6CoiT0vgvsOUMjsBSXC1iQ8qd84HaKSP2twEtxwi7tBxNP5F8f3IxLvpLEONQUz/gm0eCQ8yiRj2nFO7EOUnQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=loFuPc/i; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="loFuPc/i"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C76D408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785781892; bh=kjAPPgXnVRvHJy6N7xBwlBlFClLXXw3NtVJdTZntbxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=loFuPc/ip751FNrjMTjroCD4gU9JYT/w0X/9tKpmxgT34kk8TWl0CEJP//lPfKGZl
	 KVQlIHAvl6FR/6j2ZfSFyVqqaFEOwLh/km4zNP1uloFDe/wOKk7+tHLxd2GYfdDLd/
	 vgo6JbcFlV0DyA14ZUlwD71AzFF9zr4djKFDlKAcKrXY5dMlAFxZrUnpzhwYDhR9IR
	 r2F8I1LaY3eaeBTnNE+13EGv6iXGDhSo6SwlIm23yjcpQMy9OvDaMZafsxTffY9Do8
	 9NRqtSD9D7EVOQl+xwZc0j1EbcZ/lO0rZpo7WFCExoj9krrN+InsiAnaLZGyO/WaCc
	 ja5r75U+/9gOQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C76D408B2;
	Mon,  3 Aug 2026 18:31:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Doehyun Baek <doehyunbaek@gmail.com>, linux-doc@vger.kernel.org
Cc: Doehyun Baek <doehyunbaek@gmail.com>, Federico Vaga
 <federico.vaga@vaga.pv.it>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v5] Docs/translations/it_IT: sync changes.rst requirements
In-Reply-To: <20260726063928.1322676-1-doehyunbaek@gmail.com>
References: <20260726063928.1322676-1-doehyunbaek@gmail.com>
Date: Mon, 03 Aug 2026 12:31:31 -0600
Message-ID: <877bm7ys1o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Doehyun Baek <doehyunbaek@gmail.com> writes:

> The Italian current requirements text had fallen behind the English
> Documentation/process/changes.rst version.
>
> Sync the current requirements table and add the missing ver_linux note.
> Also update directly related text for pahole, Python and GNU AWK, add the
> Rust/bindgen source links, and remove the stale cpio source entry.
>
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Thanks to Federico Vaga for the review and wording suggestions.

Applied, thanks.

jon
