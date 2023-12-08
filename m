Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tRpovcO5"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5361738;
	Fri,  8 Dec 2023 14:44:13 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 639935CC;
	Fri,  8 Dec 2023 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 639935CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1702075453; bh=Fk5zWuZFxhvInLzu8bE0Bc/KaXxHT7KVOlPF6tGAnYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tRpovcO5j+icIvrL4zKrAPCylna1S3wGDGx37xDsRBbhJ4JI3xEFHLUzzFCM5MDZi
	 ZKJA+a144f+Lyg5Js6tsaSky7hMZVLYI3y2L7M3jN3EpQAp5lUpxk48oUrJJdPZolI
	 Erobs3RD6frbeVpDU+7NSy+5R+4015ORS8AWsGQy9xl2mKz0uZNCx6vL3zGopeZijN
	 3uXe5aiOspTrnucb2fPmFtyD0fJXV4VFo6bJp+eem7994TRtaWbTgCXS1v0ZoIuZ6Z
	 w6xDpwdSQ/ZQnJMXMLyTgBNLOAnTrGKBOu4afWHhXaoB0UEHkXQjjXGx6Lbsnjwnav
	 swxXqPn1KSd+g==
From: Jonathan Corbet <corbet@lwn.net>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/2] docs: nvmem: minor improvements
In-Reply-To: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
References: <20231201-nvmem-docs-kerneldoc-v1-0-3e8f2b706ce6@bootlin.com>
Date: Fri, 08 Dec 2023 15:44:12 -0700
Message-ID: <87o7f048n7.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

> This series contains two small improvements to the NVMEM subsystem
> documentation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (2):
>       docs: nvmem: generate kernel-doc API documentation
>       docs: nvmem: remove function parameters (fixes hyperlink generation)
>
>  Documentation/driver-api/nvmem.rst | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

jon
