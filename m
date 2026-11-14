Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672210;
	b=JiVOkHVNYi8uvB6QWvpS4W3K3PPpewykMluekQRjetvHIlwnY/WkPirPihOYf5fRGruS
	 O6rSiO6/jdO9RckZk4YL9UTaO4R92I65hExCWQOYw84A7CyYBFsAK70ZkmgmpA1lTAvpw
	 EBm2aLzsvfw9jJ/feFb0uBezlcSrSsB7cEgmNJtDACZzvj1jMwaXLf/tv+DcjE6PvC/Ww
	 HijLH0uYpL+OAvQMx8ExyOxNJvLQbE+aU04/m6AMXR77Tw0c4gzkKu1ACe8Ejoxp6oPBF
	 why+m0/OfGHDVo20u1RZEB+21LyXDXoBzQtyEauooXyFh9s7TGrrBYjqSo8clhIEytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672210;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=HLZcm2kGGNPkHrolsS7QSodgMr1auiEM7m7otpV8Qpc=;
	b=EqdooNnt4jRYZs6DM+/fnZlDa+lxCVk1Ju5POC/N/ay0rCuyMtyx2JdCVqSKN+edeld3
	 +PCihkhDU5RYbY8HoajCzMF1LWWJAGVVeb6muZiM6qWS00OZFM/m0H1hvWkAQC5VDijkg
	 +SjCGc/IyXJnMbNBO4khgs1SNiICmi56AaAPaHovxtnmIJZ6V3TTKiIEZQFeWiwF2po6M
	 dCecRvMD3SU4wDs/COXYUvFvIGwreq56DMep+YvEHXlrpDSqDRffZpQsKurErMhoqdg+5
	 a5w6mcfG26rTQonEAUlZtYjWa9a228VA04F3b+OKP6JwCGlRQSAjG+pp1pDwDdDBPkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vuGp4CDe;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF5606A332
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 16:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BF5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vuGp4CDe
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id SB7mxGFvfRiNxSGDyxC7ju; Sat, 14 Nov 2026 16:03:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGDxxOLFc8cn4SGDxxxRz8; Sat, 14 Nov 2026 16:03:29 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af88651
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=PJTSTX75uoluVfBDKb4A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HLZcm2kGGNPkHrolsS7QSodgMr1auiEM7m7otpV8Qpc=; b=vuGp4CDeVz+rwR3TUp3oAyehS4
	0L/a548VOLey5fO3Nc90aSLAgqL2+/53GCRGby1g4J/mvtI8p67am2BwPIVktAx6EkTjmBeYUH3t8
	mBUiG/scRNANP+hSFM7B/teGf2me17VWOAY+oQtwdjIgsJyKLJfv9YVNKOgAXQoKZgladbrZ7qYB4
	uM2D01e2GPTdCtwUSOYuTboUG9P0U7fW7IcskXBZQdTx4zQZpEI5m8/ISGk4T92WD0irIakKlZ+SA
	rY6I8uu31+CocRiLGtIJ1iXnSWE4feU/cmLbT5tdZ+cfqbkMWwXEbn+OIzz4U80NwQRCjQ9rHlJFg
	YoSaxn4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33236 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGDx-000000001VK-0hDI;
	Sat, 14 Nov 2026 21:33:29 +0530
Date: Sat, 14 Nov 2026 08:03:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6683) Make the fan curves of NCT6687D-R
 writable
Message-ID: <6ca20e71-bcfd-4f60-9471-08c39da1a4ee@roeck-us.net>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
 <20261109223442.509238-3-tomasz@bojanowski.me>
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
In-Reply-To: <20261109223442.509238-3-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGDx-000000001VK-0hDI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33236
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI5pIpIV22vQ5je4ffLh0VxoTcdZXdSXjcfIE8l6BHg0sqFd/Q2SL8iEujvBsf51uD8MNWkGR3hC8rfVSMHwTwoweMLiNAay+G/rdtWHrfhJ9Qp0FUzG
 3Ls8ixBnlWtBB6GY16HMIdR6QVBfv/BBnm3ONeHeMYpuG6UiG2GGiBuOcF0lWX+R3OUjPRHsUgxQJQp2G6TuBxvlBNlHJcTSJX8kZxGgUcOdoBu/x3x9GCUh

On Mon, Nov 09, 2026 at 11:34:42PM +0100, Tomasz Bojanowski wrote:
> Allow writing pwmN_auto_point[1-7]_temp and pwmN_auto_point[1-7]_pwm in
> manual and in automatic mode. The points are writable if, when the driver
> is loaded, the temperatures and the duty cycles of the curve do not
> decrease and the temperatures are at most 127 degrees Celsius. The EC
> firmware is not documented and does not take a curve whose duty cycles
> decrease, so only curves like those set by the BIOS are written. The
> limit of 127 degrees Celsius reads the same whether the EC treats the
> temperature registers as signed or unsigned.
> 
> Temperatures and duty cycles are clamped to those of the adjacent points,
> temperatures also to 0-127 degrees Celsius and duty cycles to 0-255. The
> whole curve is written in one configuration phase and read back, to check
> that the EC uses it as written. If that fails while the EC responds, the
> previous curve is written again.
> 
> The BIOS may restore its own settings when resuming from suspend, so
> restore the curves written through sysfs on resume, before manual mode.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16: writing and
> clamping of curve points, the written curve after suspend to RAM, and
> manual mode after resume.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
