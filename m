Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F9D37FF47;
	Fri, 10 Jul 2026 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711040; cv=none; b=OxJnwkR0bQP2pkbjrkVeoKfruDP+2+dIxd/tJKdZbuuSUbwuQs/6mSMjd2GvPzxVRRnfU9y9pa9Kg3zfZOxbynOYCQOGZyeWoP+D1agy/Xe2jbJGaHNG7u30is6vPQOrvUfxy9/ytFNsG/5v692qq2+gJLHMUtwkrSQU2BhyPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711040; c=relaxed/simple;
	bh=Tbjt4L3HLKnvppMXnKxzu7vV+YLNZYIAaX9s7DFrWns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q1d6XgED/BcKGQHu9oekTVKmfqrNoGfT1qtnvl0O0js4qoy4rsH5ce06+JmYzqd0pChrdTBc2YJE1dkyC5azAF6B1T5cn6L+EflKiqy1veZe0/zyeIs+Qy483IxOu1f+la+CwchT2E8C/1fkNuxbfLtWidwfiNwzu/NVuyi1et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rQcp2iyh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rQcp2iyh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6A954108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711039; bh=hieFuS276gQonHDGqyzywvVnwpgExFJfLyVk1oTADdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rQcp2iyhaZ5nynNTIvgjHVJWTfmMwuPvbTPZZ6dNxPW+V9Cpmh0eb6MQ5AL9l98sB
	 6Jby7hfE2xd/GRGodavs4CuxJupV+jhJobqmMkYT03OUtXqvEuLwkadKgeNR519Q0M
	 RPa+QaZQujAAZ7xIz1QgNhR3W7V/wW296bwf93b7fiiFY9qyN3L6razj1zi4uY908x
	 cRTx2RqXiSOjKE3wIhhClaSRQNzLakd1lILMIf5uNqZ1iIemDBms4NpPTvNvRpegtr
	 blrYJugB5M3I7zJZ8eoqAxPcezWjG3Fo0IN2c/JOpiHpctdJwmA3y5W6zzrUo8CdiW
	 bgTB5/wai2WpQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6A954108A;
	Fri, 10 Jul 2026 19:17:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Iwata Koki <iwata.koki@fujitsu.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Matthew Garrett
 <matthew.garrett@nebula.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iwata.koki@fujitsu.com
Subject: Re: [PATCH] Documentation: admin-guide: fix a doc for
 efi_no_storage_paranoia the "5KB" instead of the "50%"
In-Reply-To: <20260706050534.1653916-1-iwata.koki@fujitsu.com>
References: <20260706050534.1653916-1-iwata.koki@fujitsu.com>
Date: Fri, 10 Jul 2026 13:17:18 -0600
Message-ID: <87h5m6lkn5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Iwata Koki <iwata.koki@fujitsu.com> writes:

> The documentation for 'efi_no_storage_paranoia' incorrectly states
> the kernel cannot use "more than 50%" of the EFI variable storage.
>
> This percentage-based explanation has been outdated since commit
> f8b8404337de ("Modify UEFI anti-bricking code") introduced a fixed 5KB
> minimum reserve threshold (EFI_MIN_RESERVE) in
> arch/x86/platform/efi/quirks.c. At that time, the documentation was not
> updated to reflect this change.
>
> Update the documentation to reflect the "5KB" instead of the "50%".
>
> Fixes: f8b8404337de ("Modify UEFI anti-bricking code")
> Signed-off-by: Koki Iwata <iwata.koki@fujitsu.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied, thanks.

jon
