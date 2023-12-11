Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C123952F62;
	Mon, 11 Dec 2023 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUGY3iCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA06C433C8;
	Mon, 11 Dec 2023 23:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702337864;
	bh=ano9RC693ei4DJE6/E6Uu9EVCgAcMVl7TIeTtNWeGpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GUGY3iCDAewKjKrsPAMa0ET3+5OjbxkIEYK2FYeLHzqiEeKD6cS6WpGiacYddcVE0
	 SMsjWIaIeNGyMSsyeeb08t/7y1fJIBrV9FT0Mqo80hivsP8pHma2/FUbjff089Ur8a
	 CJ1mFfXbgvqhxFcedNK3RqKwawxubAUhsZTM0KfvSfDbgbgcSopdhDL0T6G00je6Ce
	 58MQ0Qywala7vzpWtwspEUmvG2yAPEaXCpsR/ZXISj2l8j+USb7X5vGL+h+ZNEcpwN
	 Wj7P1kXjHmnVoXzg1ut3zoTARQVW7IaTzs+tHMBgi/c/KmIV+LwR2eK3kx7qoEDwkP
	 505MwaIaoCZtA==
Date: Mon, 11 Dec 2023 15:37:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 05/11] doc/netlink: Add sub-message support
 to netlink-raw
Message-ID: <20231211153743.298f9821@kernel.org>
In-Reply-To: <20231211164039.83034-6-donald.hunter@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-6-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:40:33 +0000 Donald Hunter wrote:
> Add a 'sub-message' attribute type with a selector that supports
> polymorphic attribute formats for raw netlink families like tc.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>

nit: I tend to throw a | for all multi-line strings, I either
read somewhere it makes YAML parsers happier, or Rob recommended
it. Don't recall now.
