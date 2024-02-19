Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2E954FA0
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708378272; cv=none; b=uR0pbc5pFKj3es4snvk0vPduC54Xlmw2iRVQKyeHIHuSzlFnxo8eIVQcYLRIVlM74qy5VZqDK76rp/aIwG6ekWup4lu6sdF/RRZ3TKhJc5uKKcFC0vatafTJF6tkWygN3IOXVtuBuMr7TXc3oaD6XMIehqhHicylkFWSfEri/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708378272; c=relaxed/simple;
	bh=CEP4GAl9cAYCsZRSkkvl8Aucx/YD+bDiujmW5YlKhTM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E2AjGbogGfOpipzPVYXEQ27vFxoJ3K0c1frsaCxEEhl3VDwy+sJD60ScdlKWHnM/1BxpFNI99P7+1mfvMbGkz4yh0+GCK4TV5xhQ0PShIxNeRcQCv5imxFj+BHM+/DBdV2PhxSBtB0nXzQudTzPbqduShRDeeNQx/HZLb0S/e/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=R/+Ii97J; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="R/+Ii97J"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8F4D47A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708378270; bh=CEP4GAl9cAYCsZRSkkvl8Aucx/YD+bDiujmW5YlKhTM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R/+Ii97JDBw6MIZGbjIR3gAQl9j3xlbBhPyDOqDZyBk9aS22eK9TW4iSpqgYlRyl3
	 PQ/RJjW+PbNdModdXpiMDe2CA2PtYYBWGy0cwHnGArQlq/iW11RMwazJUb/TDYu6pq
	 gg7wyOv9xSX4kO1Jh+FxVJmR9gVck4cUZ+hIkVJCoze6XYiZz/DzAZFeE72MjyFMtY
	 fEKnJfhxIpLfGs0rEJETNTqXT3DeVXjNS9xR/rZq2RGJhWfgIkpFjxfy2ZoV6Dwv5s
	 bLyIQAM7hzq3vo74BcOu0pLr3jgdV6Z3KZCMWRjoMHG9PScT2nKqh3TbE2FA40wkW1
	 SGsPkEUh7JQHw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E8F4D47A99;
	Mon, 19 Feb 2024 21:31:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 0/5] Some kernel-doc-related cleanups
In-Reply-To: <20240215134828.1277109-1-vegard.nossum@oracle.com>
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
Date: Mon, 19 Feb 2024 14:31:09 -0700
Message-ID: <87cyssnntu.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Hi,
>
> The main bit of this is readability cleanups in output_function_rst();
> this should make it a lot easier to understand how the function
> signature interacts with other elements in various cases
> (macro/function/typedef/pre-3.x vs. 3.x sphinx) and formatting.
>
> This whole series is functionally a no-op; scripts/kernel-doc output
> should be byte-for-byte identical. I've verified this to the best of
> my abilities with both pre-3.x and 3.x formats.
>
> As a bonus, scripts/kernel-doc actually shrinks by 2 lines overall
> (admittedly not much, but hey! Not bad for a readability cleanup).
>
> This applies on top of the scripts/kernel-doc reindent patch.

Anything that can make the script more readable is welcome to me
... applied, thanks.

jon
