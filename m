Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172380026
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706030736; cv=none; b=WKawH63J0p1mtHSplT7OOkp/uX3XhO+boBWFBicbuAZcV/NTJc1SdQBPyAd0eCAjKt2Ttsi6YmfV+bBVUxQJy65u8M/5HRhEmEtjv0EQFwr3fINRBqx5JkmGa1dqqo7Q4nNKf0x2o6fNTMz+Ooa+supy6y+4fJ8q7hv2S5VAsSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706030736; c=relaxed/simple;
	bh=RlyFkbNTSdgtepfgjRlfah2drYHFWjCbQEDIFZfB0Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiAXFyiLA+k4HZYk+tamu8KpyRyjcf86c6Ndf5gqEvS6k1fDkeiY2+3ZSRG39gxahbLL6rvwxLczqjnVvd3zCF9vZ5GQhc5oyd3YMFOsKeLyF+MB6ABqocWsOv9sC3+z2mJ1U8SUZzXEo/+uIMYpc5jdhCyF5qhwmjbhp5EPZd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=IgE1LKcS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="IgE1LKcS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bjhb2hfzK/8i0tKZI56owzt2KGG7OFmwSuGm4x1P2gU=; b=IgE1LKcSfIHc7PJOysQSDI9e3C
	hk4sUUEKr51UKs1Bvg2k8X8ZunFhmWH3DahtvnfuXpMFc7SgSPvGLkqwbMK53IzfZP2S9xBwHA8py
	0z8BkvLbqaNoDo3qdH1Uh3Z8yoxxIeepfkheorVEfCypvlM8r1toj4PIcQlleaoq2fo1FfMuaOxwc
	YG3lKqsWN7cLSCyd17HeYHkpuD7UfNrfLfodJuKEKgSa6D2DTNC4NyYkEru0CisHqpwEFPi/2AGSa
	crYK2F1J9b4mtzFEJ1XbW9vQ0RPDnruau/wu18s7gFZbGO9DOja8ZARQ6QnhXRTJujpRSYcA4UlcB
	MOOXwRHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42660)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSKWX-0002q9-2X;
	Tue, 23 Jan 2024 17:25:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSKWQ-00027i-Vs; Tue, 23 Jan 2024 17:25:15 +0000
Date: Tue, 23 Jan 2024 17:25:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: jiahao.os@bytedance.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 00/19] arm64 kernel text replication
Message-ID: <Za/2esftSXq4+aa5@shell.armlinux.org.uk>
References: <20240123103509.696983-1-wangyuquan1236@phytium.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123103509.696983-1-wangyuquan1236@phytium.com.cn>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 23, 2024 at 06:35:09PM +0800, Yuquan Wang wrote:
> > 
> > After applying these patches, we tested that our business performance
> > increased by more than 5% and the NUMA node memory bandwidth was more
> > balanced.
> > 
> 
> I have successfully applied your patches on my arm64 linux. And I could 
> start it with a qemu machine(virt). However, I don't know the way to test
> the performance it brings to the kernel. Do you have some suggestions?

Please can I make one thing utterly clear... kernel text replication
in a virtual machine generally doesn't make sense unless one can
setup the virtual machine to be truly NUMA. In other words, groups
of CPUs with their local memory and remote-node memory having higher
latency.

Kernel text replication is something which solves the problem on
bare metal NUMA machines where running kernel text that is located
in a foreign node results in the CPU running slower than it would
do if the kernel text were in its local RAM.

Unless the VM is setup in exactly that way, then kernel text
replication has no place in a VM, and probably would result in
poorer performance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
