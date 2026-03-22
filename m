Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E1368964
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212243; cv=none; b=RpsWrO/mFQ1ELbW7r8Z+4yhOI8YtTGMo8uC9h+njPbRUXB4blGP4Q40HMTBn1C8qET4IFG40VeuccLx0kBhBJODtxa6jCDSyKsCx8EsIFgVIv+z4CzO/2ILLRnD4sJlp7VebTpQXjokVm5cnHVeW0l1FlP5LYlgCyPeYqNIQwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212243; c=relaxed/simple;
	bh=RKGTAAWMDlxz+nirGJsyMJDhe/DLYGv2XUgd4FrdLrA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=moqPj3N6eTpWmkY8mCtzo0GuBJ1+c++sz72cljI1/EPR4dzoTbPRyZfIRCSlzBuNmiZfB4P+92MmkEatffqFh83KWi0ptow/lrYmyy+/y7H76PSig4D6kV+YB3/v9STgr+/bB9JBIJcT9s2rVxqdOWpcKlwqE/mK56JLkQJ6eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TSLWs+6h; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TSLWs+6h"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4DCF7411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212242; bh=+nS4cXBDitljJZewNqAUtaRZXIhW6bTPR8E+fIQ/jZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TSLWs+6hP/YtYijrbQte5tSf8C6LlrgoZPGe6BPnOL6oX5lTFx08qg2kqW7r/DXb3
	 8X/EpnKMJrim1ePeKVKmR+tv7Uwn0tgT5UeZD2Lwx+wcw0s4on9kmH/MRWrPbh/eev
	 dVq1Lrk0o4ii7+GkmnIewb8oeEnVh+Xc/eFTZAbVYLrK/efL8gY4ImH7m1jWk/P2Qp
	 FFhwdo9yfh4sNRXL5F5xA55/zLjIo/tw44uwNIfwPKFrJhIx2ilI6DQXhzHgY7D6g7
	 yMqq+JBM8YwuPiEIv0ag5qRAeCJ5ZvqLtigrbBf9I2Uzj4V8dMb9bs61ELZpQ+weVe
	 sLF/6oy9EQE8Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4DCF7411E2;
	Sun, 22 Mar 2026 20:44:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/pt_BR: translations for SoC-related
 maintainer handbooks
In-Reply-To: <20260319115416.495020-1-danielmaraboo@gmail.com>
References: <20260319115416.495020-1-danielmaraboo@gmail.com>
Date: Sun, 22 Mar 2026 14:44:01 -0600
Message-ID: <87v7end27i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series adds the Portuguese translations for the SoC-related maintainer
> handbooks.
>
> Changes in v2:
> - Fixed a typo in maintainer-handbooks.rst: "mantainer" -> "maintainer".
> - Small alignment adjustments to follow the kernel-doc style.
>
> Daniel Pereira (2):
>   docs/pt_BR: translation of maintainer-soc.rst
>   docs/pt_BR: translation of maintainer-soc-clean-dts.rst
> ...

Series applied, thanks.

jon
