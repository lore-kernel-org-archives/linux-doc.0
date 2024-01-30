Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341F60DC1
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610288; cv=none; b=Q2dWKjje9ZFAgTGd1NoMtr1AY2sRXFsdsfT0tdqjIblI8ML4xkahhAkfujkTBNJE2u7Y7oOXQdV3AiDfWtGO3eb5GS086qDCztpGpGAAHjMObeekAjTJ2AReSmoEmLLoFXoO1XQi2V+pQR61KsPW1jju2x++43o3O7XBH3cnY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610288; c=relaxed/simple;
	bh=0GxWVGCdG128/b0QWSYuKA8baB0ZuubjdkO6bsWGXeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2BNAKtKcScUTH1QKH28mHV2XLEbV9TmvmetRWa7ZoU1N4JYrT8ea/QeQSWGH7FEbmfGs+AEQxqfTVedR6f2WyhaeCUAyp5ZbiyGpUsjcORASYiIllD3m7uo8Kjglo4wmlMWJkotm+Ak2idCGCXnFIRn7+nBxbywzTi8L9zR4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=D08kFCFJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="D08kFCFJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KlpPPzzm0qNlNYLpEnO6uKxu6Fb0086kSlFZVE/dRyI=; b=D08kFCFJGRhNGAZYE+apOkQqf/
	clhBE++rHQYMAJqJA9pj90wGruMdudkgMSg5vwQ3aOrQmDo/MtM1EftAPpa+k7nJRR6KBU6gmBarA
	acL+jmyuvNF0r8y7aSJZvgDxUPzr1JYsY8jMkTEP3I6/E9b6olN1LtDsWnyoVRq8IWolTE6ZNyNkO
	JxjEPbip6s7EL4TUpNmAP4wf0NrOunEvyD2pKosPYIqLLRENNzeO/3GzIbXJ6liEcqGQwQgt+mJVP
	7dLjnc3MRmyU++k5EiHTF5d02g6MnDlIRljFYLokLTamt+VcgJE1LEJiTItRMdKguV1+U+ph6Ww2w
	Ax9MeK+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45070)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUlII-0001eF-2u;
	Tue, 30 Jan 2024 10:24:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUlIF-0005Qt-Jg; Tue, 30 Jan 2024 10:24:39 +0000
Date: Tue, 30 Jan 2024 10:24:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xiong Yining <xiongyining1480@phytium.com.cn>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jiahao.os@bytedance.com, wangyuquan1236@phytium.com.cn,
	chenbaozi@phytium.com.cn
Subject: Re: [PATCH v2 00/17] arm64 kernel text replication
Message-ID: <ZbjOZ1YOQUBxftrR@shell.armlinux.org.uk>
References: <20240130101613.3425933-1-xiongyining1480@phytium.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130101613.3425933-1-xiongyining1480@phytium.com.cn>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Jan 30, 2024 at 10:16:13AM +0000, Xiong Yining wrote:
> Hi, Russell
> 
> >
> > Needless to say, the performance results from kernel text replication
> > are workload specific, but appear to show a gain of between 6% and 
> > 17% for database-centric like workloads. When combined with userspace
> > awareness of NUMA, this can result in a gain of over 50%.
> >
> 
> Tested-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
> Tested-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> 
> Sorry for disturbing. This time I have applyed this patch on a real NUMA machine 
> through "-ktext=1" linux options and successfully booted. With a database-centric 
> performance test, it shows the patch will provide some improvement near 10%. However, 
> since I am unfamiliar with numa performace test, could you support more details or 
> suggestions on how to get the "gain of over 50%"?

You need to profile the system, and work out where the performance
bottlenecks are, and come up with ideas to address those bottlenecks.

Kernel text replication does not give arbitary guarantees of
improvement, so pulling figures of "gain of over 50%" is a complete
misrepresentation - it's highly workload and platform specific.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
