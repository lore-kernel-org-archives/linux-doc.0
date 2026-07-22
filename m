Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B470201113;
	Wed, 22 Jul 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735184; cv=none; b=dk85EdxsIba12vLt0R8Wu09VXv63of2jXS0k9jx8neI2njkuMGj+5i2TPd3rhKo8lNbisCJszQhuQi7qcxUlfqY0VdX8k0F6OusYCVist4divlpQb8DwnGq9OOnbMKfa9AbXjFh7TvYPr23ZW6pFVsFQ32lTgiXtI3+zMfYLqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735184; c=relaxed/simple;
	bh=zk0TrOzGYznxCnNsWvCvbN7OhjHiYBnHaHcZtzxqBpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eT8dBWZ9hKIeUyoF5y2J9YySRUmqaBLGNkBF+BUbysHLTTiTq9/5KSZQU68eQIBosheGTBeTSGysdl4Rfo7eDGvSYehGfcA8OerX37p0hXdB0v59riI0lJXexLicmVjAYj3JHVVyPuSjmUUXOjNfV1dDJwnPIgcPklAlWWn3t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l005NHN8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l005NHN8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E7938408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784735180; bh=qAWssuKVvh5wX2a3O2l+mH1KXddluZt/79acpdFOjd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l005NHN84KYUwpV+QluonBGfdxHUsCiP/fQCEu+eKNCAz/424rBGJ41h6XEg44Ixn
	 ylgLXH09rd5l18MRcmXPxFooy5a/YTq70iBVeQPs6wW0sYPzNazvPYVP85D50n61ou
	 hbh1nbqq/pKEWtpycY4fKL1kKxomzfFyB8IsHLZdEm5dfXMDp6a9XB+8/apyPkSx2e
	 mG6rmVWCnseEFo0CaIDbZaktC4zEajJoaq4Z6KWezFb6U/hYqzz8MbXlxiJIHy0A9u
	 EXjlXg83WNgK5RtBHD1f1b+xYJ9i2fjGAovj0n6froU2bngJqVgmGxUtYzdsAktGye
	 Z+aCTJleR88EQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E7938408B4;
	Wed, 22 Jul 2026 15:46:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [GIT PULL] Chinese-docs changes for v7.3
In-Reply-To: <84cd6621-50b1-4b96-8e70-9685ba8c7af6@gmail.com>
References: <84cd6621-50b1-4b96-8e70-9685ba8c7af6@gmail.com>
Date: Wed, 22 Jul 2026 09:46:19 -0600
Message-ID: <877bmndo38.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

> The following changes since commit be828e6819ed139b699bf7feb00a546cb7806266:
>
>    docs: pt_BR: Translate deprecated interfaces guide to Portuguese 
> (2026-07-16 16:48:43 -0600)
>
> are available in the Git repository at:
>
>    git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
> tags/Chinese-docs-7.3
>
> for you to fetch changes up to 8492d4e6bb7b9b1e78f2d17c4dda5272f25ec118:
>
>    docs/zh_CN: Update rust/testing.rst translation (2026-07-17 20:24:09 
> +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 7.3
>
> This is the Chinese translation subtree for 7.3. It includes
> the following changes:
>          - Add the some rust, module-signing docs translation
>          - Fix/update couples Chinese translation
>
> Above patches are tested by 'make htmldocs'
>
> Signed-off-by: Alex Shi <alexs@kernel.org>

Pulled, thanks.

jon
