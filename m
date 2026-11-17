Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940966;
	b=5nfrcrB0sMx/Gpm6BXmsOu9Hx7JcX9Zi2y6RVyXehfyAOA7is3UoRw0HGt9YfKKoaFSR
	 WITYcH1IyXRB9q+G5bBf9j0lR6wMkUsDcZga43CLnuFG4Y3PEWExVzQO/66gbb6e8gFP4
	 BQuRl4TeZ3/vBmlVVTXuAWQBKwQIw+NDtw8OgGOwE9yXcccEhvU8hqz+U6sOZ7aWVsfRc
	 kefg161iijl3zWMhYMIAacD1OJPtLIuhwfGhULXdJjqTl6b+C/er0lkpn/rE+5WbEGJ6R
	 PaGeP4rPULizZbQAP6amH3KseKg7oErSizolLxUt5E1qE+Jfc6+QM5v60qLkHZwOjIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940966;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=U073sgNxCLzTRldFiejU5fDtRk4ZLVox1V5xxlEfv8M=;
	b=qJu5xdhpIYMBiGlYei9SCiZmVMYuWzKPx5BWmrLycSeApHxDwbXnGjZoY0MRHrYbBlTq
	 +NyVROu9c7e92/YRvB6EeTv/e4AH/7l2tgaMI8RM8DlQywymG422ia2P5s2yfkgOKkFuL
	 91swXTxnr1xU2ED7R9Vg3JWMUr1hKmK0YMo9f26z8TPczcEaPA5m2EztZt6HPmaFActeT
	 8uBTPmcoaiS3rafuZuXx4c1WKTDDmdynbFv2O1Bz6R423O+744tix59CyrKw5/NZXi1eX
	 HrjbNjU0mysm1+1WfZrMJIXqoQCEUGqUijShCc6kISGlE4ltw2IkCrDPMAPYALH1mww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=I+hiM30B;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C26606A332
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C26606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=I+hiM30B
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id TLbHxBihVJFmFTO8jxMwL9; Tue, 17 Nov 2026 18:42:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO8ixoRVhGh2BTO8ixi4rm; Tue, 17 Nov 2026 18:42:45 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6afca025
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=oLH7HzBLeLt1e18YKfQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U073sgNxCLzTRldFiejU5fDtRk4ZLVox1V5xxlEfv8M=; b=I+hiM30BEG38Bz+tkwRTcnw/p2
	PH8f8XA/0RSfyJ4x9H5SYtctd6Psc0ealaHpWjQmEw9cuaxzPllAM2sqNncsXJFE8/6a4XG5yfSca
	g3dUP22c9ZwAF7IHyf1M4k9kn7jTj+zdrHONgu22h/2vXlq4J/0sLdukytzURQJFeJelsv2iIRaCP
	WsRcO15A2OtlY+IOls2E/SzqMNkcdpV+lV47QPdU+5EYkerR/+GO6EXOLwNObBvDQpPxk67ct43ym
	0ANgIrexZJ99TnfFBUHI1Gw1uCKpWmntjgGMrteGVnRLdTzzuywgxAd2kH4y7p2dxtdjV0OQZ1Ry7
	KMweekjQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48682 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO8h-000000007XR-1FlE;
	Wed, 18 Nov 2026 00:12:43 +0530
Date: Tue, 17 Nov 2026 10:42:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Message-ID: <175a2d96-3716-4fbe-886f-42040c8d54f7@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO8h-000000007XR-1FlE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48682
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEOFrHUpYEgbdaMktVfb3rkfzJHYhONDkWNrwXFoCsqyrLRujiq+3vj186f5sOhng6BaNS77Uib4g0yObMlRJQCWMMaFyrzcB2XQS6TV9kz/3xQU3Uly
 rKt0bEmxk6wIFITqEMmYZDUQvNUH2BpMr9X7JZb5lb9JgejH0gGISQRWfggHj1MZTFGATxWoMksQ/yI2xPSBIVkQpnOClaTbBRfucOwCJd3760YfBJOk3oH6

On Tue, Nov 10, 2026 at 06:00:41PM +0800, Christopher de Guzman wrote:
> Add support for the LT7175 and LT7176P PMBus buck regulators. Both
> share the LT7170 family MFR_SPECIAL_ID (0x1C1D, masked to 0x1C10) and
> use the same register layout and configuration as LT7170/LT7171.
> 
> Chips in this family are distinguished by their PMBUS_IC_DEVICE_ID
> string. Instead of adding another strncmp() per chip, match the
> returned string against ltc2978_id[], as is already done for the
> PMBUS_MFR_MODEL fallback. Only entries whose name fits within the
> returned data are compared, so the buffer is never read past the
> returned length. Suffixed variants such as LT7175-1 match their base
> entry.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied, with the assumption that the ieee754 related bug will be fixed
with a separate patch.

Thanks,
Guenter
