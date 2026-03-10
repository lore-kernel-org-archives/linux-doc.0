Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFEE3033F5;
	Tue, 10 Mar 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160357; cv=none; b=FpNBtuBk16pc+lfSOj8Qau6YXG/6QiUFax+TCGrxuwr9+llJiLz5OfoXWkIeWJlin0ZlxX5X+p5LPl61Mlwt5IAtTE2Mpq9+ZoiSjpSaWq25wufOwnejUvt7jd/ffgJrQsLSoKLSaZx/MafZEVnnV9PFTWjqBVMIRn4jvl6wNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160357; c=relaxed/simple;
	bh=x9iALpY6G4Ml5mRRbk10hcvbICb8Ewklma/HD/k6pEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4DsCAFm0XAFef7J6fIGtze1ZfA2/ywgnNmxyVWTVTD968pCjkkt/MjZL1Nqk290I6SIsPPzbTNNYU0AzbktHXPEmiNQjCyxV7FNkDfYFbiJ/KgoZTt9hLaIbvkDHewXtCqvqjwK3wG0pmdAxhXSLYTYCDnEEw0mreb/4LKDtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Ck9w+8s6; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Ck9w+8s6"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fVfYc08Cfzlh1Rr;
	Tue, 10 Mar 2026 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773160351; x=1775752352; bh=zERgmMY9V+IHJrTMUF6d9gh4
	Gu9YL29LJtkjNQW+J1c=; b=Ck9w+8s6qPA+Pt8/hzOdv9oPlXd4unNkiK6N5yTA
	pKcSYUrOJ3bvVA9QnD374a9GU6SOcy5/BOM+Zk6Fb4Yyd39k3jOkiAHHFXZ1Lns3
	QtnWvrkc8Z9wWIYdRynq9rlmVnbJv1iyGkAW8GFJpQ8R6nEWX8VT4lmxM4Fhv6X1
	98hEwYRoagrSQ809IgrTDVvB0Lk4DCfecbR7Lj1i3x+CFPcR6BSTkr5joB8xwdEH
	tY2Zcmon7wWUUef/ebA8svKmiAiztsFv4QVsd3AT9EeU/I6h8CYUo7hbKJqp5xSt
	HWSQX+k44U0lkaEwo0+6z0vorTlCG7SB58BHk4ZuDiWLmA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id uActVqqKw_CV; Tue, 10 Mar 2026 16:32:31 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fVfYT1d5QzlfpMB;
	Tue, 10 Mar 2026 16:32:28 +0000 (UTC)
Message-ID: <2c7e0149-c178-41b8-ac5e-270bfea8b1f8@acm.org>
Date: Tue, 10 Mar 2026 09:32:28 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: add AI Coding Assistants documentation
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <877bue18ch.fsf@trenco.lwn.net>
 <20251223122110.2496946-1-sashal@kernel.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251223122110.2496946-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/25 4:21 AM, Sasha Levin wrote:
> +Attribution
> +===========
> +
> +When AI tools contribute to kernel development, proper attribution
> +helps track the evolving role of AI in the development process.
> +Contributions should include an Assisted-by tag in the following format::
> +
> +  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]

This patch requires the use of a new tag but does not add support in
checkpatch for the new tag. Checkpatch complains about this tag. An
example is available below. Does anyone plan to add support in
checkpatch for this new tag?

Thanks,

Bart.

------------------------------------------------------------------------
$ git format-patch -1 457965c13f0837a289c9164b842d0860133f6274
0001-tracing-Add-NULL-pointer-check-to-trigger_data_free.patch
$ scripts/checkpatch.pl 
0001-tracing-Add-NULL-pointer-check-to-trigger_data_free.patch
WARNING: Non-standard signature: Assisted-by:
#23:
Assisted-by: Gemini:gemini-3.1-pro

ERROR: Unrecognized email address: 'Gemini:gemini-3.1-pro'
#23:
Assisted-by: Gemini:gemini-3.1-pro

total: 1 errors, 1 warnings, 9 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

0001-tracing-Add-NULL-pointer-check-to-trigger_data_free.patch has style 
problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
bvanassche@bvanassche:~/software/linux-kernel$ git log 
Documentation/process/coding-assistants.rst
------------------------------------------------------------------------

