Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bPeyQUbL"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFA790;
	Fri, 17 Nov 2023 08:05:47 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7133944A;
	Fri, 17 Nov 2023 16:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7133944A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700237147; bh=myvsvcwBTDBu3p8ZQoWupR+ELqvD/OSm6vnUBlIuGTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bPeyQUbLOIqLYf53j98jes4jr241IzIS0ZTgfw6KMyS+Humgt5plQRDTIiMx55J5C
	 F5cUIUaU1fr4tkMFTvBiFmyNn2xCxscXi/r90CXgOnOI9ynY2wfIJn98KizriTtDjE
	 fQWc9NacEz3GlldanAzg1NCZia+utXGem24s0tlMucodPELzMFOqywYAU4WVF8KCsm
	 M6+xZD8FDlq8Et1l05W+GETtzhmojaiv+DiMYO41phgzSP/srr9MKKPO8VLARLVt91
	 LewnLj19oy3HL4GSKlZPNvkuQ+Ivlm/WuhSiMUCocB2ADj7Sret/WdugIAa1x73b02
	 NKXxh4hmUdu4Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_TW: replace my email address
In-Reply-To: <20231106140140.25455-1-2023002089@link.tyut.edu.cn>
References: <20231106140140.25455-1-2023002089@link.tyut.edu.cn>
Date: Fri, 17 Nov 2023 09:05:33 -0700
Message-ID: <875y20xt4i.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hu Haowen <2023002089@link.tyut.edu.cn> writes:

> The Gmail address will not be used often from now on, and replace it
> with the email which is more frequently accessed by myself.
>
> Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>

Applied.  Hopefully this one will last a little longer.

jon
