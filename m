Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067020;
	b=MDUESnijh6ybMRL2ylInn406OQRkfMFui0GY6Lq324G05R9/vbka93pPZ/W7sC3pgVln
	 3YN5I4MP3M7FcpwFxJXi2tbUmPRKHFxZf3wYAvzXqH9rzY/1w0uTO2jQibYNPbuikGT/9
	 UGFBskn03+gm8Yiv3Ujv+ooZo6a8tw8/KxsrK5yoRB+Om0/0htswLPgEG645nMsazsFX5
	 aIIpaKQkoSL4IIP/fw7SAGd5VBDePmohVlJwCs8JNKXw3YKDSo36CfvOmASa2B731l9Xc
	 keQak90pXM7d6sJL+Jn7P37ZqihDBE7kG05rOfLWph85wUQXDLrBv43SLTdnlleAyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067020;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=jkGPn1wQc7Ebuqw4SWuRJT0DLUb/33269ZxdcTJ1u1M=;
	b=a/XAvKyMQJOq6502E+cGEdxLx4o9GsZ+41itadAbERQrWU5nB2A1nWueW1OpdCq03Ufg
	 T80Chtxn/ssnwwTQjNF0ASF7sNPIjO99etuc7j7fBhdEU/SClyks0yVr+8s/hNkMd9n3q
	 cKEl+ppKWS1WXyRW6WgpF4XsjhfxhugCQ3oKJej7DN3FEMSgnNztHB2m/9RC3kuyMOF8O
	 tJ0aGcbGen+i+F0+vEw0CvS8201qkbFvhlaBXiJudQCdCbwIJ1NcKfSC13ngdQFo67GRR
	 YphR9bvpKnNzciX+QBZEWFddeLW8ipdUPSGI0UIYgdcwTPNMqrlVVHk/M80rYdGOwwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GGYJodqy;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1EB606A330
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 15:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F1EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GGYJodqy
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id POCbxem0dRiNxPimjx8brs; Sat, 07 Nov 2026 15:56:53 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PimjxMp17b2qJPimjxnacY; Sat, 07 Nov 2026 15:56:53 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6aef4a45
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=hLRJDZDFrmx7wTgVqVsA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jkGPn1wQc7Ebuqw4SWuRJT0DLUb/33269ZxdcTJ1u1M=; b=GGYJodqy+mofxo+qSFQBoVOes7
	69z//7Ph/O6MBP0V3xgNfLZZiVkjmCC520ASEvF2wWTSkU1y1upa0K57P1EI0mQ7IXOdx52/HVVfd
	6W3J2hFY113hJZbivjr4By5TA5DLjBk3NNoi6VA9YQIZ4Pmd/wpxQhvTL1h/rUJAPx30TYsEswPpb
	hral/Gk480eibaCtHsO0N6piU9X8Foio9Y3s6K4an5cdZmkyCWm0AbVaPwE+K/JGIADPBwvkiK2kO
	wCcWsIUsj1xSnVT5ZnsKnaZ5XbyIgzLD09rVDyZhmdJq3Mrb45uElip8QO3RYKYEjdINSBrTxpAhF
	JJqWxTnA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37414 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPimi-00000004B4x-3pIP;
	Sat, 07 Nov 2026 21:26:52 +0530
Date: Sat, 7 Nov 2026 07:56:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
Message-ID: <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261107082821.8257-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPimi-00000004B4x-3pIP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37414
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGVaigxsw2knGj+ym/KJfR549GpQbAnUz/d7L/bLun2oYCttj6HL3grOE1QSKeV62QuTC8nyrfpVRjqio8HEtSSHFFW1peaEu6Wi7VD7l9/mPE4ifqJ9
 n47yfmZhap8szLlKbU8GhsFrQPHloD6YufV+DGV+1Dx0ClGf9XrdDSWv9Z+8YcVD2cN8Meq2bNl2k5pEQSJimra6r5VNiuSPvDDcu0kNXud9CNcBNP72/wWm

On Sat, Nov 07, 2026 at 09:28:21AM +0100, Tomasz Bojanowski wrote:
> MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
> drives the RGB LED headers. Besides the LEDs, it measures a few voltage
> rails that are not monitored by the Super I/O chip, and reports them in
> HID feature report 0xf0.
> 
> Add a driver that reads this report and exposes the rails as standard
> hwmon voltage attributes with labels. The values are cached for one
> second. The driver never writes to the device and keeps the hidraw
> interface, so user space tools that control the LEDs through hidraw keep
> working.
> 
> The controller has the same USB ID on different boards, while the rails
> and their position in the report depend on the board. The driver is
> therefore only registered on supported boards, which are matched by DMI.
> On other boards the device stays with hid-generic. Probe reads the
> report once, fails if it cannot be read or has an unexpected format, and
> only exposes the rails that return a reading. For now only the MAG B850M
> MORTAR WIFI (MS-7E61) is supported.
> 
> The report layout was determined by analysing the vendor's Windows
> software and confirmed on hardware.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68), with the
> driver built out of tree against kernel 7.2.15. The readings (CPU 1P8
> 1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V) are stable and plausible for
> the respective rails, repeated reads within one second are served from
> the cache, and hidraw access works while the driver is bound. Loading
> and unloading the module repeatedly hands the device back to hid-generic
> without errors.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Again, I'll be happy to test with older boards. Alternatively, I might give
adding support to older boards a try if you can provide information how
to access the sensors on those boards.

Thanks,
Guenter
