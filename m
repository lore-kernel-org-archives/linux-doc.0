Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054149;
	b=EjU0j8+CT3C7PIRbwBr/I8zeT1DNa5Q1WrwfYVIn0V+IGXByEYMDFvVl1XpkrV1qzrXf
	 XwHRL6GGmfx+446m5cRp53ISE0Pqok6AGl3VavNIhUF4VzRrZyvD6B0uDb793Rfc7PLIM
	 186s4D0/RmnQr4C2+Kf6CRaT6mYJwYiAcI8gnesobd6p8EKjbYMDmtgUGhQih12YZesQk
	 QNY42Fg7MiozzXz83RSZLEdej9/6oFknpbENpVOlphlBt0vCxsjaKqwhpQx4N5dfQWIi1
	 aEUoxHWrCxM02YeMFjAf7Gh/LCpelaoP0XGs0eUUJ925o9HIctTUEkYUW3lwAUDd3Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054149;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dal+Jl9B/04ypofIdEIRqZRilk/rMeLNT2uU2ztNnvs=;
	b=Os5VAIftgoikRPTot9YAdfSxOm5i93TBUNwWxkZy1+z2ohNaNlfP7k2KcQr+GEi6Tt01
	 x/BcLZmqKFcGltsMlpRl3pfcmDYD9+Ed6cVhuH0DT8CiStmV4dlhlxV/69mGTyRPQHszP
	 ZFx6H6Aexa2aUuFCHMh/SOMxP0MBVP4wAV7ZPYyyxhS1GZP6U8Om80iVo+nBofNuh6ghY
	 CauYOkNI3iSxip/lV/66sxuPPI6T2T9PEhwJI54WQx+q8utXiOnrgFPY12APxAetBZjse
	 RThl2D8RKitlsgX3HMrebJPKpEf4yHANt+doq/Aqwaz2Vbbwwi4QqYpv/2bv73uDPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6Q9mfJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A52606A31C;
	Thu, 19 Nov 2026 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6Q9mfJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DEF1F000C4;
	Thu, 19 Nov 2026 02:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054148;
	bh=dal+Jl9B/04ypofIdEIRqZRilk/rMeLNT2uU2ztNnvs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M6Q9mfJu/R3ZxN29fikzSQ49xFiFZzLlXRs2t/vJ4QA7RK2gFJrWsfu9eQ/1danKA
	 PuSiV2Ihk2AfABb5A+ZyLvX7IRbeANLMAjYSMIeNzlftARKvfg6c8TycIoXu3PKPpU
	 eY1HNbga52AYhQddjIbYfaE2fo9w+FiEGY30Vr/5vPz/fvc8eAL7afXApVYaASMLEV
	 Ul/ZUX/CjNG+ScTbmEHau3BUzing8I3mbbTV6QDm/rAI/fmR7EaPNMyleULdxk0vju
	 toBOw84QUU6BAkn4O8G8mLGNZLK+5CVmuMH9qW1YXF4le8jLknMm0vS9/no09cTljz
	 Y8bQL9Epxgqfg==
Date: Wed, 18 Nov 2026 18:09:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Fan Gong <gongfan1@huawei.com>
Cc: Wu Di <wudi234@huawei.com>, Teng Peisen <tengpeisen@huawei.com>,
 <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana
 Ciornei <ioana.ciornei@nxp.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Mohsin Bashir <mohsin.bashr@gmail.com>,
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
 <hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Zhou Shuai <zhoushuai28@huawei.com>, Wu Like
 <wulike1@huawei.com>
Subject: Re: [PATCH net-next v04 1/4] hinic3: Fix the RX stalls in
 hinic3_rx_poll()
Message-ID: <20261118180907.641e8e51@kernel.org>
In-Reply-To: <85bd868ec35a5963c08193a3c1870aa87004f63d.1794917917.git.gongfan1@huawei.com>
References: <cover.1794917917.git.gongfan1@huawei.com>
	<85bd868ec35a5963c08193a3c1870aa87004f63d.1794917917.git.gongfan1@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 20:08:31 +0800 Fan Gong wrote:
> hinic3_rx_poll() can leave the loop with a completed CQE still sitting at
> the head of the ring, or with no WQE left to receive into, and still
> return nr_pkts, which is below budget.  hinic3_poll() then calls
> napi_complete_done() and re-enables the MSI-X interrupt, which is edge
> triggered, so nothing re-arms the queue if no further packet arrives.

Look how you Hauwei coworker is fixing this in hns3:
https://lore.kernel.org/all/20261118130330.3026625-4-shaojijie@huawei.com/
That's much better. Live-locking the system in NAPI when its OOM
is pretty bad. My personal preference is to have a work that just
checks for Rx buffer queue being empty every few sec.
