Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941075;
	b=r+qXttILw+AZjjVCqzdBdpWHbdJcd+rrBt0oy3MH5uhoNwahrpc2wLG3cQyaYkY6f3te
	 34gGk4jkI+p+WqpMV6u16w+LXe3R3cyUYwCqUPxULDyKKi9DHjbFEd9puQxtyg9FOQJK8
	 4H8qPhtFdFsq/xDSw0m5KqvheSPlb7nbJ4uJWyrVrZIY/6XidJsHmCSmE4U5Ry2NzGeUA
	 FoqcpaCeQyFjJXyapmDUTVnoWEGduRp8lR0S3boxFXnRaEV1GouTLGC4IjhWRydtS5dWx
	 /4mQJvTExt5zlIRuZqiQcZy3nBsv9DbziTNScRaN9IoZcVp6HfR+2vZdLvJdajsoIWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941075;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=9hjzhVbXqs8Uligd/Lom1QmoZlXUoRLSbbHcDr54RoE=;
	b=c7m067ZS8DihYwZhATCsStkknDS0xTkCNdghkVmFcbzh4DZUy/et6kH6T89Tk5UTZoN5
	 69sHFlvBcCb/h2bOnOR1FcMAYJpIHyoJLiS0BjvTsI41Jh6s08sdKEg4HgiN+GyuDz5ab
	 18uBO0dbRKtw7tLU9JNPDzIYgyr7B/Ye0a1KJtEn67dhkWZxVrUbp333q6O1uQMSgdw5C
	 gdaaTtWXN42dgqk9rSI1bTEtke/ixyylO1SB25XGN5KRgQntKVjmV0njx6P9kM+Rq/EQ5
	 z8c9hLfjyep22kBohLyIw/OOYrKgDkIzOam2AQ1MUwupAhUoqEUioUNpgJbbCetWVGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="tAIgs0d/";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3F4606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F3F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=tAIgs0d/
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id TJjCxrOXByb4YTOAUx4aZD; Tue, 17 Nov 2026 18:44:35 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TOAUx3mTqYskhTOAUxUDif; Tue, 17 Nov 2026 18:44:34 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6afca092
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=H4YqvLFtAOgaTzI6erAA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9hjzhVbXqs8Uligd/Lom1QmoZlXUoRLSbbHcDr54RoE=; b=tAIgs0d/6IPVjT5P1PwWJ8v437
	FBXxaZGypmC5KM59zYPKFZNcdM4F5Nbhfvp59Dx4JjUJhua0e1M89ZJIrkVjawZgqMeq6sBcKlHRG
	g/YkByGwGtdE9RqIacl8neED9BoWBA1yXpbBTqxDQIJ6ugigS1zNwy1c86jDZEnsc2lJPmsF9rR0m
	kgrn1veQEygHbC5E38I6rZFMiosdWXIcrnG2dfpHwZTKcFQmgkJeQpwiJBXVH//l1wR/vees5vxwK
	OGJ3BZGZzwh331DcVLK9uQwm7dI5p268WeUDyPDVXuGiNhgv+3om/UFktI0AdC2/FGh1AoUUn1rVN
	N1rHDG8g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:32940 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTOAT-0000000090N-0AAL;
	Wed, 18 Nov 2026 00:14:33 +0530
Date: Tue, 17 Nov 2026 10:44:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: ltc2978: Remove LT7170 and LT7171 from
 curr1 iin documentation
Message-ID: <548a8b85-e12f-457d-93ed-86475ac7938d@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-4-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-4-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTOAT-0000000090N-0AAL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:32940
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 37
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEq2jzKTev/clImfhlyB2DN4cMiRzujTsOnl86Fu3Y1WdxIdFK4gHzK2MVxXCw8VOwTGT4cSywlcJT54xJd0Ymt9wP9eJhbQNUpCniNXQEtZeimv+3ww
 jOYWv8wYwMfBW1Yz1e1Am3Onl+ve3+7wg10cIZ15+9NCAjnsoIxzY9xo5Y9B/xPtHpexPgEzNnIBDyzzAsPgSwgCNZsfOuocTuNSxFowKjg+N0upZqqye5Ca

On Tue, Nov 10, 2026 at 06:00:43PM +0800, Christopher de Guzman wrote:
> LT7170 and LT7171 do not set PMBUS_HAVE_IIN, so curr1 reports the
> output current ("iout1") rather than the input current. Remove them
> from the list of chips with an "iin" curr1_label.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied.

Thanks,
Guenter
