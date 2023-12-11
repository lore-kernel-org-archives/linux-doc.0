Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F256474;
	Mon, 11 Dec 2023 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9wn2a/7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ED1C433C8;
	Mon, 11 Dec 2023 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702337430;
	bh=UHEs2AqJSESH4k9T1jOhhUdl14jHJc+0zyYnOuWknr0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M9wn2a/7Jv+gFkF348t+9B4VJ4g3EKPIo+t04vf9QYikPLkv3WsURy3x8O1pUYgJ4
	 +NOjoQ26aGtR/z70P7CWZiBPRzOX1wk8mrYSfPAvDP5GamAmMv8ASVwWOzwtkJPSYU
	 uv8Mhx1E2AfocSTwLgOd8yoPTYrzWv0PPGoVLgkdm/xNI+zJfW3bTjc4+NAB2P8xIp
	 pilQcwU1iROvxVTF4EtaVUuXnWS55c82k+HxblTuQ2ydDJAWik87oerbws7eSL5LN8
	 pWrj78OUY+CQ3IJ7STfd+axXj4ZeugSHNc2hFfd32sbrfZuBgttKSzoGosJ6dVCmpA
	 6U8MImyLiqozw==
Date: Mon, 11 Dec 2023 15:30:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 03/11] doc/netlink: Regenerate netlink .rst
 files if ynl-gen-rst changes
Message-ID: <20231211153029.4b861bff@kernel.org>
In-Reply-To: <20231211164039.83034-4-donald.hunter@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-4-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:40:31 +0000 Donald Hunter wrote:
> Add ynl-gen-rst.py to the dependencies for the netlink .rst files in the
> doc Makefile so that the docs get regenerated if the ynl-gen-rst.py
> script is modified.

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
