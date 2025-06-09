Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE2E221FB5
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509749; cv=none; b=mM+0mGZDfh/Y2C0lMgC8fQ5ZUtJnJY77lKFdA4Li7aGZ1nBkzlkn6yP6j+ephLXCYb9cDfR9QdmYmEa5Cgn/gpnDeY7KmtmI8/yoKRG0ChSrf1aAz0ROwYXW2blA1PeWqLLNsh+ctXhylu8WlkP5e73HNlhiWorjqy5teJBVSPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509749; c=relaxed/simple;
	bh=P+F6LRcL1WK4H9WFEaWF7+WrKrFKB5yFtGgRoULT0I0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePxOe9g/3OEtGzyEYvqp2LhfOha15QbnRC5pVJno7ZyQ+fvp5jcDWzJkDveqS/ufWqw1RaFHwUJZj7dLTi/uxT9myoH4z9uAvTre6ThfWIVmAPMhOYChxxaCToT8nruyJ55M+EleELsLOgHDRHj69FCQslbNWJekmNRY7PpQxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T6BHE22F; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T6BHE22F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8RPjB4YTZcQ+MXXZnmORzC0xLY6/Eo39YdVf3kY5V+g=; b=T6BHE22FYioH/rAjOfRftpxE9H
	K0++koAxbtwwYiQM/wJWM+naEcEKN6usA+uUb6P6vH8lvLUQKjAu9DRiRcTSIR03vIX+hhOk248VK
	oN9jGMLBX3094mpwAV3Q0OFXKufFn9g9+OoxOztj4gShDUavPytOO3vagv8U3R4DmEAeUKDuhUVD1
	vNVGbJ599ewFok2DU8wS33JkGRoiC3qq9j2DguvSuS+j0Yrp3dCaqaZjw0iM/lhBDr1Mn2S9ok/rm
	7VvYGGd8JU9c6qmd2qO7TMnjXsp3lDemHmabR+pXKAQ9JC4FTSSCT1mWwuSmPNZJVT/MJM9QhPKTF
	4v2mZeFg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlP7-00000001gkR-2MPH;
	Mon, 09 Jun 2025 22:55:45 +0000
Message-ID: <0ed8af53-7e4f-44bd-b9fe-f71155a03233@infradead.org>
Date: Mon, 9 Jun 2025 15:55:42 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify terms;
 added note.
To: Jonathan Corbet <corbet@lwn.net>, Dante Strock <dantestrock@hotmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87ecvtc772.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/25 7:37 AM, Jonathan Corbet wrote:
> I almost wonder if the references to Mercurial shouldn't just come out;
> I am not aware of anybody using it for kernel work at this point.

Ack that. +1

-- 
~Randy

