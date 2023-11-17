Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KO25bMBh"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06C01BD5;
	Fri, 17 Nov 2023 07:41:04 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C90244A;
	Fri, 17 Nov 2023 15:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C90244A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700235664; bh=jVdq+6k0xB9ZmQtIbpMNodvqbQ2endS0oVsG7D/mifQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KO25bMBhJlIGXc/stKmZEU18nDAzXku8rRwTyrKkMyzIWav2Sj3X7G83PeWa+8LpU
	 wCycie+pQwo0ngPhTyu4oDbV/vp9HnJ/0o6zyqcS4LZHwY+98Nsly/NMUTZXGgcVWs
	 v5BGeJ0pzcw8WjeoIUhxbK1sdZgJJ2cmUQlFnzfRP/knaRryvIiyJaMLTaIalwB8da
	 R32cX7XxBYXInWnQsFQ2XiUDpjRwUwdB9u60Y1M5tJGqS1LFC54REG5zDrucylobfJ
	 JL2CmHrXaoT3lTvaaDEeYzywNdrqY/l2oesgQ9Y1OZvjXzD7RetaUGqfNdbtUHGAZf
	 d1kxxGOFB1ipQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 sergio.collado@gmail.com, Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] docs/sp_SP: Add translation of
 process/handling-regressions
In-Reply-To: <20231031151325.2903088-1-carlos.bilbao@amd.com>
References: <20231031151325.2903088-1-carlos.bilbao@amd.com>
Date: Fri, 17 Nov 2023 08:40:57 -0700
Message-ID: <87msvcxu9i.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao@amd.com> writes:

> Translate Documentation/process/handling-regressions.rst into Spanish.
>
> Co-developed-by: Sergio Gonzalez <sergio.collado@gmail.com>
> Signed-off-by: Sergio Gonzalez <sergio.collado@gmail.com>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
>  .../sp_SP/process/handling-regressions.rst    | 797 ++++++++++++++++++
>  .../translations/sp_SP/process/index.rst      |   1 +
>  2 files changed, 798 insertions(+)
>  create mode 100644 Documentation/translations/sp_SP/process/handling-regressions.rst

Applied, thanks.

jon
