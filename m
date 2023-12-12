Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD111FA0;
	Tue, 12 Dec 2023 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+z+sfBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C61C433C7;
	Tue, 12 Dec 2023 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702346424;
	bh=/B+C22GdsP6vYM18msvyE+otVChGojCJaFNKZ0bqjpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K+z+sfBWFTRbjBK/xFEp6tdW/pJ7Hj2XJUma045M19fNSgiTzfqBw9gSs3x1fiM3a
	 4siVqd/cr1XDa2A9g5LCWCFM1+EVUHCOF9diDS2UlDVzwvVPJ8ZHD3oQpegekcd48f
	 nr45GQ+NjrNs1L1xTwimV/v7X8a90kV+lmkiBHw26uEHQlhnTN/Gbk+YxA/T+6uwcN
	 ZaquAtaBHkA2Xl+ki1an41daHT57DuAdhYFJp3VSyQOkuowDGXN/8BxUJNuWavd0ti
	 7DrnP39ejsrSUJETFHwxaP9hC1sK9SQmDAr3yH6w/AW6i7x6TvmoHvwgrmEgCEAP1g
	 LluPrLkpHFPEQ==
Date: Mon, 11 Dec 2023 18:00:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Jacob Keller
 <jacob.e.keller@intel.com>, donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 07/11] tools/net/ynl: Add 'sub-message'
 attribute decoding to ynl
Message-ID: <20231211180022.5fa402ed@kernel.org>
In-Reply-To: <20231211164039.83034-8-donald.hunter@gmail.com>
References: <20231211164039.83034-1-donald.hunter@gmail.com>
	<20231211164039.83034-8-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 16:40:35 +0000 Donald Hunter wrote:
> Implement the 'sub-message' attribute type in ynl.
> 
> Encode support is not yet implemented. Support for sub-message selectors
> at a different nest level from the key attribute is not yet supported.

Other than the fact that I think this is the patch which breaks 
C codegen, looks good ;)
