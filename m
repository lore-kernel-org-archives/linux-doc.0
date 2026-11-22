Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388940;
	b=0T5NY7a3ejHr8ufxVmy5tWrCiuWkiWNa0FZNhj3GCe3eN2WSu5wE0vvPQw0VBBW7n8CV
	 Rf/TB584wphH8Qpj2Y6N8igChgDzTtB+iq3ep1vROo8hq+EyWlJ8cWnuy2PDdA0V3YjZ/
	 5s/g7a+tBuHj0E3xGqOXE2k+MfeupkerVr1qqEvQUpTpG0ZCFuteroeXEM1af8f7+Sv+N
	 c1nxXQRBTre8cu7pcJmT3o8RJDE9tAM/LZ4gKUWS4mhvOLsAMDWvuEVAmNsZFPCMKAP3R
	 /oD/mIjKHPmNk4P/oZ62k4c0zh/D8tDZY/COYweGeLXDjjTHyZbrjSYVLeg3mKyDJ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388940;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=vUNmsWCmRksZ0Wy01xeWV8q/zfGDEdGQYg2EdsMVqSM=;
	b=0WeglLphlsabMG8YpSra4OlWt4IM4BotU4kV3VBHQNo/bAwZGOgB8sQXt0XLaD8VcOYx
	 i4GTcdIZynq7W5z1QFCGVIBZ9DvYce9lY4+0cWERVRTf0wBTyCFF40zNEyl+HFatIwr+j
	 Gcmt1TT3P6vgHLmVw/GL0s1gn0dKJ+MhaHOOsgasmi4Y/6qXKGQNAXsCRTQDw6FB39Iwr
	 bk2QyrVa+12Us/Y3LGxY42v9R7dCXTXchr3rnRoH6cNDFe6FzfntYh6AsvOjV+Vno2wdx
	 S368LVLUah+PZXSdC5zN3QkuvukB1a+V4UOwIfOJQr+kUbZN3ajtKNqP/jAeKZuxuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Fpon2YfQ;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A78606A31D
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Fpon2YfQ
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id VG9yxrPlpV16IVGg7xjxGM; Sun, 22 Nov 2026 23:08:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VGg7xj9yWuJrPVGg7xxAKK; Sun, 22 Nov 2026 23:08:59 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6b03760b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Ikd4Dj_1AAAA:8
 a=MP5OZd2acgXZqrE2zD8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vUNmsWCmRksZ0Wy01xeWV8q/zfGDEdGQYg2EdsMVqSM=; b=Fpon2YfQC565WiFfuJMPGgkUNX
	TrCTqSZsCZSpmnDyS7+VeImg2s/vOobm/yvyS4FilACFrbfUHV6klXsoHgyIdMcNKR8H0vM5zR/Gl
	BKPH7ijdlGCcyxa37GFCdC5XGcdx+iMTHyCcRDWaBck41/z4wbRagG7Qn6J7Nl67xhgSZ7B2AcW2K
	7wZFSEAzB32Ji0u7apWGPm44vbnODBBbFrdbKCJTwal7QD8GvF2XrFdS7HJ+/o9PB+LKBH64XdX4V
	dc1+JjV5YBr7oIv4z3Xe1W/BeUtFWungBW8oQz0/GIItTF6A/MX/zPAW/7NkMBPloPMTO9y2WJQ4N
	w/4aWo8Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43608 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVGg6-00000000vPg-302Z;
	Mon, 23 Nov 2026 04:38:58 +0530
Date: Sun, 22 Nov 2026 15:08:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Radensky <fradensky@nvidia.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/mp2975) Use PMBUS_FORCE_PAGE_CHANGE
Message-ID: <cd6814a1-5499-44e8-bfa2-5e2bda01f065@roeck-us.net>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
 <20261122170949.3059743-4-fradensky@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122170949.3059743-4-fradensky@nvidia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVGg6-00000000vPg-302Z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43608
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 9
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfARpkwOgU/6BchPjPYiXL5e6rFl5MElrDgnLUYrDl51dKJFWkXXhWlm5T1cll2+PU5vpYzfNz2fuHw4+sP5B+VwiSko1d52l/kKsCXS3/ZdJLH/dqr2k
 4cDPmjZXiwsgdDFf7HpQRSFWKmhkYUkKceHJNTJKdEFGpTSt+keZu2mqqeGJAsTf3RwZGOGYZYA+0gdGhKtm1Xd6fDZoD5SxpIuxVZNoZ5gAUvZy5TQ764yL

On Sun, Nov 22, 2026 at 07:09:49PM +0200, Felix Radensky wrote:
> The voltage reference, from which the vout fault limits are derived, is
> read on page 3. In a single rail configuration the driver writes PAGE
> directly for it, since the PMBus core does not change the page of a chip
> with a single page. If changing back to the rail page fails, the core
> reads page 3 registers in place of the rail registers, until the next
> voltage reference read changes the page again.
> 
> Set PMBUS_FORCE_PAGE_CHANGE, and change the page with pmbus_set_page()
> in both configurations. The page change is then read back, and a failed
> change is repeated on the next access, as for two rails.
> 
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter
