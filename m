Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF0C3783AC;
	Tue, 24 Mar 2026 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368576; cv=none; b=BMJO4JS4uSxY5sHykHqbm+rL4NAmGnbMjBDnxBDbeLjG1KnG3hQSQZyKSqFF/mIUgKYC12RZTkkWDB7DsWGLXyDIs5grjJ2Y2mwshc2dVE9Wj1+WYDWVcFj1xcl8FJH3nX+wa7xizg+jYW9GzreG0lZxfEUfNEyhIWONfOrEN2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368576; c=relaxed/simple;
	bh=3eGZkZF2E5iDvhWmwBI+5vJ898+4uMYJpFVFxUcX0Gw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rFT7cx78qWTgs//zcXi8RhasGg+SOO2e0UsFpX1wgyynpq+wwHnFD3NBA51JFldFwxXjpNl85Yngl4Fub6MzxHV6ZLd9wyBHPljLHDzbJHDoCq7m5LiJzJliKhkaUqmiZjDVCf4P7Fi3iwR5feWx7r424X92bC2oLw63EQpblfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LwK94CJF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LwK94CJF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 684DF411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774368574; bh=vIVfraVpO+qUOmSU4jOLYDL4I15nzsP+Rg3pdC9WrxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LwK94CJFYw973HUIN/gK7ewHjIBAU4kiVj41+kRV5gmDeLXvGV7cx4eAh689iL08D
	 hXlQadTNkTkRvQJeSG5o0ySV4Ad5rLn+osiKlW7Xt2gsnRcwpUdg7tFPC+jZuVNlDF
	 4/pZX4Wl4Choqu0rGsQVzC7BObuaDPkkTQIGkHdWUnO3UZSDy9crEotDAWerZD7r55
	 U7LivXLhVz4+1HWoxrf40UAfB57+wS9FSCWwVUUccK5CQ5xCsdNW9YorZ5waBJnkv4
	 VitUUf9ChW9KmhYipS0DO2uT0kM6b42z4lzTjPn8ER3CBvpbIQQOu6tmcFGQF446sv
	 FJkEXKSFYEXoA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 684DF411C2;
	Tue, 24 Mar 2026 16:09:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: tovicito <tovictakamine@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tovicito <tovictakamine@gmail.com>
Subject: Re: [PATCH] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api
In-Reply-To: <20260324160048.4899-1-tovictakamine@gmail.com>
References: <20260324160048.4899-1-tovictakamine@gmail.com>
Date: Tue, 24 Mar 2026 10:09:33 -0600
Message-ID: <87tsu56wg2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

tovicito <tovictakamine@gmail.com> writes:

> Signed-off-by: tovicito <tovictakamine@gmail.com>
> ---
>  Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
>  Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
>  Documentation/driver-api/libata.rst                    | 2 +-
>  Documentation/driver-api/pci/p2pdma.rst                | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

The changes don't look terrible, but please resubmit with a proper
changelog and a full-name Signed-off-by line.

Thanks,

jon
