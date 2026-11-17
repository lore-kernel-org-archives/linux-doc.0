Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941000;
	b=kM/L43R9cQLbBnAJDUiKG5BxhlP0iWePe8ivMzClTy44bfBlvuR+8qWCEXUebJaHEFN2
	 KJE6c8ZJ7MTgNs5v60Zya7wtqN5uQiUJWlObgULy5RsJV3311Tbc1AVy8MDIVZWG+USqz
	 QgvGbMWCzr28qnJxVf6SvyjMYNeH5yyN/6zzPqWQCI+2K/Kx0a9SlxA2yyvKdyP3FJW55
	 VTw7EzbWxZfb3xqpclaol+QaaNIgaaff0R/fn4Z8l2K4av/85mIWkIeqP1y+hNVBtRgVN
	 mX1MYpbdxeHGoK5sMvR3c98mp8Z7yZmD4tqxVL6RGSKiEf1y3w3mXSDsNzDtDezwe8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941000;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lfQK1qZ4pCnARv91d8ZOSe1H7v7Ch00995WaHoda5R4=;
	b=qMzV7vxpYjdmotalEA5gUngde5wJ1yKg6BFg6gFWTp3nreB1gcPrNya66pOTE3hs5v4i
	 Dw5WsTgayAK9OfMUQCzovlxUMi5pGb/45b1KYpe4sQz+eu61Z30cMpxWGYuCLNN2KLfCO
	 AzZzowF4cnWHB3AkdaU1iSJeCd3+T+4P2hWC6QUrBiPBMqE20zxLsP6kjjHimw5jC/OmH
	 i8ddAOZa0c19A4Gqq+tHBgeQxmNQf8R1YGk5Ym8qWMuy4jl8PeWg3DTF/rf8Gr8bKyA9u
	 eszKFQD6wYHT8df4MsRc2jNzAOflIfpf4VcJudc+PhOVsR4vGg0nMfjP/KzSoF4VG5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p5pQpwrG;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF4606A331
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AF4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=p5pQpwrG
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id TNKtxWzYlVK9UTO9HxAbSm; Tue, 17 Nov 2026 18:43:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO9GxoSplGh2BTO9Hxi670; Tue, 17 Nov 2026 18:43:19 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6afca047
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=KQfoQ390rSe1vipBtJIA:9 a=CjuIK1q_8ugA:10 a=GiPHQlO4o4oA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lfQK1qZ4pCnARv91d8ZOSe1H7v7Ch00995WaHoda5R4=; b=p5pQpwrGgNVXIksQWi7otCUCTH
	xdUHmv3f8JO2JDwzVsxySrwUVOBvBxWVQGWq59lMMWIXLlyOM++4KdwI5tBIujcfJB7rD9Z0MMJTJ
	mgXRw8zEt7ymetR9Xn0CyQKabEzGM6zGas3Ab3+L489vSR03rjO/NRSqsr2MmIKfidEVfRjTDJvHX
	ZXNDo3gbqlecGX13wsKxn03NmtyOGht3GxJmNZsqGV9AP7Z9GEM7cC15UrYHcKtdwIsN+8jrP/LZ3
	8y3DRCk2GxtNTQ7HMfP54SBhsL/au/KBg0msvGKC2Hil9GDb9J+D052C15pmKAS8vQAFNEnCnwx++
	DB+3TCNQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44568 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO9F-000000008EC-42KE;
	Wed, 18 Nov 2026 00:13:18 +0530
Date: Tue, 17 Nov 2026 10:43:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: ltc2978: Document LT7175 and LT7176P
 support
Message-ID: <0e44793b-38e3-48e4-aff3-84e423ff63bb@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO9F-000000008EC-42KE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:44568
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE4ZCFsIu7R5qS1OtviTNh0v2lAAG0g9M7EoWhwznsQB5sNz/xMwy/teL5AXbyTi9xZUfyRR8scnP5DSZYGk31NvhnQOzQstZTcxaexziSr2JrKMNB4b
 wFn2XNscLuUedzOsMHX5dYuaTKBtMFSYoLB0owyth7VykqiQuSf5GxqjRqgPeThLtFL76zaHLVyqHkb2TlAu6DRKtXRzKN487IWg7tmqZdrY+TA+JGBP+SUr

On Tue, Nov 10, 2026 at 06:00:42PM +0800, Christopher de Guzman wrote:
> Document support for the LT7175 and LT7176P PMBus buck regulators.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied.

Thanks,
Guenter
