Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CBE388;
	Wed, 11 Oct 2023 00:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGX01UlX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84141C433C7;
	Wed, 11 Oct 2023 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696985476;
	bh=vxagm5mK607K1KreDirna2dD/CK2JhYIxlpdgn72yes=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGX01UlXN7PUeh/rezNXICkNgkjChpyI7T1lSJIxsBZ03gbV4EZDey3D+XYeEqAjc
	 LCrgxfK3gksFWVkYuIByNSlS+2ImCZGqghANtNOsYJGfdqzGAQdRqL/EE5cv4IfI4a
	 LI2I9zyxyYAAlfjmNe4UGCEzjWbofyJzi6jIMs4VyJQ6mofGFHzMwC2E8HMO8wjxsa
	 ceop5zUUTXcZXhfapjpJOBs467S8Y3B05siP83wvKKhOZ+03qW8y3LgYG4WdYxRL/f
	 k1bmzWHnl1ziWwY75VoioFlelLwo40H7anw9+gf3g311zAPeyU6DQRdjHa+u/LHgoB
	 fp5BVVXdDJt9Q==
Date: Tue, 10 Oct 2023 17:51:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Doug Brown <doug@schmorgal.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] appletalk: remove ipddp driver
Message-ID: <20231010175114.40014532@kernel.org>
In-Reply-To: <20231009141139.1766345-1-arnd@kernel.org>
References: <20231009141139.1766345-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Oct 2023 16:10:28 +0200 Arnd Bergmann wrote:
>  Documentation/networking/ipddp.rst |  78 -------

I dropped this file from the index when applying.
