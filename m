Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129D528137D
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 17:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759339598; cv=none; b=sxEF0JL9bqu8OM7x5RPh941mmycIS9Ck0Okh4rOYk/k7+ApsTW6klDVJLrkBdRyHmdXOIUYthmzmh7KOqzGWwu43fiuwtFj+is8PIWbRBbmIrdL+A4tvANHdkmpTfzGE/xMQ9ZTo8sKCp/rwhWpc2EHvhKCwQxzr93534ccDVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759339598; c=relaxed/simple;
	bh=fGCbrjgIhziw+zDqsh2iTpC//hP6SICxRxOieq1HzHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CrmDS+TVe5rlRnW+C/cj7V7TBmniaa5kSj1+6XZ6UgNybIlqood+7z/st27znA/2DXaSrttLca767soE07LwEXaPZKJeWla8xLerDAcwMyXXZbtIdXdV68k2XcUeptuFafgRob0YWV1KbRs+HqU5jTAuax538Iycf1XOZ2TLGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JxRiqgl0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JxRiqgl0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=4C5BoO3NmOQ8BrGKEPZMWyN1kkYPig1iORB9c/nt5eI=; b=JxRiqgl0RGLL98r6O+RG3VZnkZ
	EbJZOxnml+HrgRajgUxb9Ziq9AoMtto5g72YivLzL+y2AbNTGN9+p0VBlBR7fAMr3vrlI34LGOtlz
	EURYIfptvYVzq34EcAcBtRcf/e5GHo7vsYUvY3ZTDloddJN2MxxV6DBigEA9zBJgrRYKYCvfKxFvN
	AE1QyX7500qWC244Lqpz019uO+2Vkg0xesJut7lxE+L1tweH7JhSJqUim4cw5crCq2GvFg2CPHOSa
	sNff1B2TXfByrBPIqoCKQc/K/sPe4O80lOatW+MBruSlR7Nvj0d89kdTFr7/GGue1/LeAwcMR3pgs
	4zkdr5JA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40b6-00000008dt7-2Lpx;
	Wed, 01 Oct 2025 17:26:36 +0000
Message-ID: <d2376986-f320-47e6-a270-fe7d9420a2fa@infradead.org>
Date: Wed, 1 Oct 2025 10:26:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for
 clarity
To: Mr Tourist <zakiuddin321@gmail.com>, linux-doc@vger.kernel.org
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mr,

On 10/1/25 4:20 AM, Mr Tourist wrote:
> Date: Wed,  1 Oct 2025 11:18:07 +0000
> Message-ID: <20251001111807.7900-1-zakiuddin321@gmail.com <mailto:20251001111807.7900-1-zakiuddin321@gmail.com>>
> X-Mailer: git-send-email 2.50.1
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> 
>     The Cc list above has been expanded by additional
>     addresses found in the patch commit message. By default
>     send-email prompts before sending whenever this occurs.
>     This behavior is controlled by the sendemail.confirm
>     configuration setting.
> 
>     For additional information, run 'git send-email --help'.
>     To retain the current behavior, but squelch this message,
>     run 'git config --global sendemail.confirm auto'.

Eh?


You failed to say why converting README to README.md is a good thing
or why it's needed.
What should I do with a markdown file? I'm just trying to read it
like it's a text file.


The bullet/outline format is good IMO, but that couldn't that be done
in the original README file?


Minor stuff:

Warning: trailing whitespace in line 24 of README.md


Thanks.
-- 
~Randy

