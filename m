Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6611AA7BF
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429313; cv=none; b=RXy0JI6SdBtzoE8DlI876QMRCY/PNiXPG317YGEceItTgjyme6PFee1ynpW4MaaiAn/FUfUcJcQIddCGux93Iw8X+2NyIU4VAqjoQc8te0wnfog6bd17nAnf02WGNJy0F9ysTOKNftnW/gO/FGMOxF2kTdDBk6M/RNM/p4P6bAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429313; c=relaxed/simple;
	bh=eLrLpVAGILi7Zikm4yJEmX8gZGZ8YSEUKUTwa7IoouU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RXDgKo7IjWhAj7GytEpzOubcGWc5EIcpsERDmRjWkSP77XN3+VgqdaBtMYfy0Bf7CePbUDY+/lS6195KzsQ4K2ZAWYbLgOH+iSE/o43ogGLHZJQ4CQlKwvv1OyvA3iUVLTigQcj7FkJQ2+PY5j7YS9kaCU589LKBnvGpf5FQycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VzI/oejP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VzI/oejP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6122B406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764429305; bh=gkgsVdzDbN9ksHSULL1bzhckmDqmZsYlMQSmfRZarCE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=VzI/oejPXUQ8dnJqCgIO0d4xTSg8xSStsvFUiddPmos9HoQoLOEYfRkXd45S/WG6x
	 tDE/+sl0qEu2uj7ISn6ruAeTdlkvPboC9cBngAMvht/CGrlbP/MNFQv5hVC15WpgXO
	 1g1abt3FjIChdMpcIJhklFo4Vv7cUbwFsCiBtHo5Rtvlvtc+yA6ZNr/TBwmuICRpbK
	 rzM/eMu2R4K1FrK4cJFPw2oB6/ZoS7AdAx5KmVIhnmY1yuX1Ul67X4ibqZ2VQS/nks
	 tkMpMqXy61g+96i8ScTNU3xT4bAd+crb7/t1/lUIqOHa3lPDHx79CB1dKM65zwM9ke
	 Vz/pz2YYn9jPw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6122B406FB;
	Sat, 29 Nov 2025 15:15:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>
Subject: Re: [GIT PULL] Chinese-docs changs for v6.19
In-Reply-To: <CAJy-Am=UvsKWHFQBdXb1ZM+HYgaCH-6G9M=cqaQ5NNLZ7zTpgw@mail.gmail.com>
References: <CAJy-Am=UvsKWHFQBdXb1ZM+HYgaCH-6G9M=cqaQ5NNLZ7zTpgw@mail.gmail.com>
Date: Sat, 29 Nov 2025 08:15:04 -0700
Message-ID: <87cy50rhtz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

> The following changes since commit 68f3d40ea0ce9fe3a26b9fd1d8ea734386bfb9ec:
>
>   docs: parse-headers.rst: remove uneeded parenthesis (2025-11-13
> 09:34:40 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
> tags/Chinese-docs-6.19
>
> for you to fetch changes up to f12ae9ba4d234732dc091cb0565d52b286de7572:
>
>   docs/zh_CN: Add wd719x.rst translation (2025-11-26 14:40:12 +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 6.19
>
> This is the Chinese translation subtree for 6.19. It includes
> the following changes:
>         - Add block part translations
>         - Update kbuild.rst translations
>         - Add more scsi translations and fixes
>
> Above patches are tested by 'make htmldocs'
>
> Signed-off-by: Alex Shi <alexs@kernel.org>

Pulled, thanks.

jon
