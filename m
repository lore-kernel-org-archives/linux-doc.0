Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651392848AA;
	Fri, 21 Nov 2025 19:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753517; cv=none; b=LFERnLwUt+/GOwZYkc90XuYly42ZYw/9AlBcziqsdxRovsvWWKvIosU8l2mUSCDoi481jlOE/2KSxxFo6JqjqPd4AC+t4/wTqqJK8qFEuG1fW2ZySErZ4Sgug/zAO7FMoTiwanm9taSCPJD+IsSl1ugmCvWRo29wpPqc/sNFH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753517; c=relaxed/simple;
	bh=SJYM9YHbTxQg/kXaHLW6rjUvf7Ew9PIh+L7t/LeEqjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PGucJoX26+R8eKyugkmtMkDbDeCGFdMjHJqi7ewo9j+aflGX7cMeyfCyJSNlLEqsAzVMZgxvqgN8sk4Xl/U5XmhZ4L9L8mIKvQHzJ4SuG8Lrc2t9UCpp3PfJ64J3VaPPOY6J+5NEiHKnHwmRWzVWX+0Fo6StdRAzd7u0GWeGHjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mUaqTuCm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mUaqTuCm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6F60240AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763753515; bh=SJYM9YHbTxQg/kXaHLW6rjUvf7Ew9PIh+L7t/LeEqjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mUaqTuCmO5nrIjzu1hQG4zRQJx0bGHTnlVaalT62oINeUMCUfVr5VhSbxnc0pK1B8
	 o/Yv/IwrwXrLu2oI55HAGP7JsVBUqm7P+9qBsH+xtRZ7BkPPZhGctIiS1BexFURvQv
	 1R5VtmaaYXZiKrvZhQUN5EriOoQ/pS2+OBGkVz/FvHmb1+4A/RDHEU+lJpgvjlktYC
	 o0S1/2CyCfjjRWLOevig0/o2ER2YQ99974WkzRIaCgNIDUTvmQjlQgco0X39q3ceTv
	 yclOidm5f3emPHLkqv0s2IwzvNlhmeOsqbZ96WvQkSclT+8U4azPkVEm6vN14QGh6o
	 8Q1vQB9G6UTDg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6F60240AD1;
	Fri, 21 Nov 2025 19:31:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Masaharu Noguchi <nogunix@gmail.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bagasdotme@gmail.com, akiyks@gmail.com
Subject: Re: [PATCH v5] docs: f2fs: wrap ASCII tables in literal blocks to
 fix LaTeX build
In-Reply-To: <aSCoe_0bMTaqQ6tD@google.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
 <87fra7tgyk.fsf@trenco.lwn.net> <aSCoe_0bMTaqQ6tD@google.com>
Date: Fri, 21 Nov 2025 12:31:52 -0700
Message-ID: <87y0nzrxlj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jaegeuk Kim <jaegeuk@kernel.org> writes:

>> Jaegeuk, are you planning to pick this up, or should I take it through
>> docs?
>
> Let me queue this in f2fs.git. May I get your SOB?

Acked-by: Jonathan Corbet <corbet@lwn.net>

Thanks,

jon
