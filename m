Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940878;
	b=GH0SUuGJIK47lfZswv/RZwygwVbAY/M9BCRFP7bk9vWTytaf70vPJFBjU+W6BsbNtIn2
	 KAjsAzWH1k//Jon78/ou9bQKuXx7VvNurj9MjjufFwrmMcvQAUURWWlYQ5wXWum/dOd5i
	 suq49JIe/gDW9fkubTgX9C2C2CyxS9V3aXP+hb2nPA+1NybfXszlG6yxe3agWzQwdel3r
	 B1rttGnI2cxGAFQLu/Q/64Zh0rOdkIFHTqkwtr/TWHQpfuq9xnNAYSTGT2J/aXUw9kg6B
	 DQV6DJdPc0mi8KHWMh7gdon4+UTqcvvkz0LGFEYFrEVgjlqRrJqONDeBfbimkbO+Iew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940878;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=;
	b=P+BWIP5xmnSF5EKLrZEYRnk4xT+HNky1oh01Qn4yoly48Gs5FaNolxWbIOBe3mh26lYN
	 u//9eHtSaABSX38bm1JTwX5dNbLojHJFbp05YhUqTXbaS54ap648yW4mqD6ZpjoMbM0ut
	 F6DOS7bVc6rTI08AXgEqJmgXlaPQTjm9VuVoocIGCxiiGjN/oWDWwnmnD6J42aZBeboPq
	 t9dPrnyNbrKOV/XIpeRlgQ6hibFUP/xyQZHy/aWodN7KM0f5s2E5Kv9O1WnXK4qNu6fC2
	 MnvcHnnvatbuOrf8tVW4uHhATyWp92DSkkG5HbdEMBeSSAz9syhTjEZOvkMa+CwcecA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C2606A338
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 18:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364C2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id TMgAxWn7OVK9UTO7DxAaFZ; Tue, 17 Nov 2026 18:41:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO7CxyoICb2qJTO7Dxi7n3; Tue, 17 Nov 2026 18:41:11 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6afc9fc7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=EUspDBNiAAAA:8 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=; b=YFDmMSQ6njJ7g3TGwyqyWG6HbD
	VSUs5xReDgoBDPjfuNVzXMpkDWlDX/66hznqmy1hiwlGvrhHVLfoIqNb9Ba7058Fj6B3Q3Caud8S/
	RW4Y2jcPocH/FzHoCD50S6gLiVL8jpsaYxgL5l4OQ1Q5cOVPJ0DFG/WWDTvYQFb1AXOYJgsiFNtwm
	irFQAVbPn8u3m8Nr4ILti1/hOWXmj/wc+qwyZYYxG6QAHRK80Bz2d9EgvK8t+nqCigZhOSMU5dwck
	hdNbtLBqmKlatziwPdDFz8+mwwxOXQ0TELj9ZWxiKMzSOemDfCMfTvTmSh7mK4LAV+uRtCpespuTU
	OD6atnNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45336 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO7B-000000006da-1bIQ;
	Wed, 18 Nov 2026 00:11:09 +0530
Date: Tue, 17 Nov 2026 10:41:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for
 LT7175 and LT7176P
Message-ID: <ea14de95-c079-4302-8a65-86c4c65a8e12@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO7B-000000006da-1bIQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45336
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfADKNZgNgQp1f98ob9eSu1mCCpXe2bZGKfUoQzl9qJEwuW0Y4sW8C5vcum0UzokYwegh5uwHzGGkiroSnHw+QdbMlpExBjuYwMyuaudT7+iw3DIeebdq
 yPyDAccfOkkZetcWKKgGOnl5qkq9/1tvoLdFMVI7reDFNDNWZOCEr3IHuqIZjE0EUBjItpZHiOaRdHThaTxaUgLHTw3uphj+HkYLiMkWoa/9Ok5f/TxfB4kT

On Tue, Nov 10, 2026 at 06:00:40PM +0800, Christopher de Guzman wrote:
> Document the compatible strings for the LT7175 and LT7176P PMBus buck
> regulators supported by the ltc2978 driver.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
