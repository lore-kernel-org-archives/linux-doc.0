Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674429;
	b=uASJjuUE1+iiDQzEGZP2YNteRuuJ7Qvr+tUp9FvvZdU9gpbRxe86Pnq93W4RS2cpzHeI
	 Bxh7wiQnRvw1kaX6JvRGFyA1tfMV4R0m/XIfZxniB3F/KncfBUNBimVMJbozLNzUzUo69
	 DMJKPfzpFbwB60FocYaZkdYTZHPz2XJouL7CUlb3jeulUDpMVUmwmjtjOmIB9g+3mRfgY
	 UqD1O69itoGNj8UbbhIX9qfR/rd0WHkPoyMIW6GkRteerH0/+QhTSn+P7yASrQETTqPwe
	 KkBTcVl7xgU6J4ptqghi1U/K+B5rDjg6yhbUQBv5p6VKWTWeDDpnH3OJatomR3KjO5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674429;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=qT+oFTqjnXfJ1mpiTL8Xu0OZE4Z9H1kospYw4y7hkE4=;
	b=wqMfH8lh0+JqliTLjK1zfoEg5ZzFJ11hssxMPMHCNPiYWqLSiowQ5WAkEvsq3ApbcsXV
	 4bDamKcUkqqeAoLf4WkATsls+4ouMjc0ynDl5fbIOU0aSt4yx7huv7VmQju2sueC7nOiA
	 mkZL00nOVW0Fa7huPxU9M9PSFfVja2PQrQTUwceIMvQeQIrQlQT75jdrrRevBFR5Bs7MQ
	 iwFTI6TFq40PTaAlmMxaRLvO9lguSAJ6Yfl7wnPnNPH8bMaGomprX6YJfkfU5HygZGfCc
	 bGcDR0tguOqfkAimstKOEtDjuzf3uPDryVS0nTBalBYYoCoKlxe+/nogc1dhpvjoiig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=wFUjJzq2;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64F606A332
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 16:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A64F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=wFUjJzq2
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id SFXoxzdpIJFmFSGnkxyfEG; Sat, 14 Nov 2026 16:40:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGnjxkjTRGh2BSGnjxpqzs; Sat, 14 Nov 2026 16:40:27 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6af88efb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=UeLHFo6_AAAA:8
 a=hB7I0uFEIlzqdhcDmNIA:9 a=CjuIK1q_8ugA:10 a=EDBwm2zjIHkEGtbFp8of:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qT+oFTqjnXfJ1mpiTL8Xu0OZE4Z9H1kospYw4y7hkE4=; b=wFUjJzq2OCZylB5jkgSnrPmk3T
	7+VxmlluBOYlGfsfOlpiMqrb4Dr5HGM5EjYpl6Nq26YhH86N5tFQmCM7QNEnqY1bhtFx0TrCZcyF7
	IUpBikUeVBwTAWsELP/t8kMMoUEfHk2sHP3qhFj7LAuCDGp5nvEJMegqlhl4E61vTAMRL0YtEut36
	QiVNmH1YUheXwAyjIPhYz6XdxBr5OPu9Uefx1+PRNjUaIEPcZVwtAF/GBwTEJxs1bvqAHOIpuPqqU
	TqN90IaYTzzDv21KDidNAx1lYqNYEL13yaj1c+LVn5a+hvf0rBcoDPObQ/2O0wZ5iCEAp/8NpIgHn
	PIsbQc4g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45206 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGnj-00000000Ifr-0eDh;
	Sat, 14 Nov 2026 22:10:27 +0530
Date: Sat, 14 Nov 2026 08:40:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Herdman <lk.gzpc0@passmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: Re: [PATCH] hwmon: (nct6683) Add customer ID for ASRock X600DC-ITX
Message-ID: <bde7ca8f-b3c7-4b81-9596-825c52e3af7a@roeck-us.net>
References: <20261114-nct6683-asrock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com>
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
In-Reply-To: <20261114-nct6683-asrock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGnj-00000000Ifr-0eDh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45206
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 78
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGCnTCYsdUFfP3POxKnDnCHf0WB7Ca4asUbj6JGwtNXxNiaaoWboG9aJ3E9rpllbhqbzwRkqwayvHCHsgJdb0wOCNKjo5y+J8hBqtu+TMA6uklCRkOTM
 ikO1rJ8ch6m0TgyGgUE2Sa9EyGZewO1fIxf3Bev6AukMEPNUvB3diKQYPkpT42PYuoa/27WmTaDw8eChudJGatpJzT0buvH6lBwSiVehRPT9Ajq4FzK6KGsz

On Sat, Nov 14, 2026 at 08:37:11PM +1100, Samuel Herdman wrote:
> From: Samuel Herdman <lk.gzpc0@passmail.com>
> 
> The ASRock X600DC-ITX (BIOS 2.02) has an NCT6686D with customer ID
> 0x165f, which the driver does not know, so it only binds with force=1:
> 
>   nct6683: Found NCT6686D or compatible chip at 0x2e:0xa20
>   nct6683 nct6683.2592: Enabling support for unknown customer ID 0x165f
>   nct6683 nct6683.2592: NCT6686D EC firmware version 1.0 build 12/23/25
> 
> The change:
> 
> Add the customer ID so the driver binds on this board without force=1,
> and add the board to the list of tested boards.
> 
> Tests:
> 
> - With force=1 the readings are plausible: the CPU temperature (AMD TSI
>   Addr 98h) is within a few degrees of k10temp's Tctl, VCC, VSB and
>   AVSB read 3.36 V, VBAT reads 3.2 V, and fan1 reads about 1450 RPM.
> - With the same change applied to v7.3.3 on this board, the driver
>   binds without force=1 and reports temperature and fan readings.
> 
> The patch and this changelog were drafted with an AI coding assistant
> (Claude Code); I reviewed them and ran the tests above on my board.
> 
> Signed-off-by: Samuel Herdman <lk.gzpc0@passmail.com>
> ---
> This overlaps with Johan Dahlin's pending series "hwmon: (nct6683) Fan
> control and sensor names for ASRock NCT6686D boards" (v2, 11 Nov 2026).
> Its first patch also adds NCT6683_CUSTOMER_ID_ASROCK8 (0x164a) and a
> table row at the same spot, and its later patches key fan control on
> that macro. Whichever lands second needs its macro renumbered
> throughout; I'm happy to rebase on top of that series if preferred.

Applied, fixed conflicts. Thanks a lot for letting me know.

Guenter
