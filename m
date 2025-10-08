Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DD2C08C2
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 19:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950095; cv=none; b=CGjcHtrIcSXlzD3z3kPcSIlXs3YOGY2dPPLMJ6wwaGEoj0aPOFsvtKzXQNK2NduKt3zII0UKzreAXIsDAN1BFI90SqoxOeMU0jLbumEyBOHgOHAjyJA/lj+/y1SIMLsWz9KqP5l3CogWM1dxy3itu/qpsODSHsBmKMFG0nLdTkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950095; c=relaxed/simple;
	bh=Mx8yV64sBW/8oBJXjaxDnQBuffFeOT3mlAab+Zq0WcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OlH+/6vt8qIsaI79xaz5LepNYeZJ0EmXjopnSUBcpV6UUsL1FFkVj+OvsDOg8fhWzUuANYHQL5cVMS9uT0Bl3MJKLeosI4Brv0shhkZ28LsahQnBvv1TwJK8yc6HoEmR4YAsLSrPcWGz+h4RLvhvspm6LVpjurC6ItbdZSzBiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FUHyzzFK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FUHyzzFK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=4sflv1/wN1Gwb9XFEZKYqpbJdvjBhZ5S9aYwolZ6AV0=; b=FUHyzzFKxWveCtFEWgmRdwldiN
	dk78oYbprglM6Pl5aKpfbQ5OsLMy1gbVEYODCmnZtz8jnu//3NNMnbeY+E7W0zaQgxcJRjzlh1ZT0
	QkJQ+56nhOvMaG9v1Bab9LTndqpRNcbsJlSRX/9XZWNtyHJA5+V+/4nVOwgOzv2DuTReLVFJcO64N
	ObI3Cyo6Ix5ILV24qmvJPt55lhdtVcabEVsiBhxqRZJVQ2mE1f9PtPe/2O3w0eGaOS+Ush5nmi5CP
	rmwj2aVMTkIN2tiDPUT21idy/hpEQQJlbH7i+IQhHYnYNWGAyN43z18kQ7tfyI9Q6Fw0T7C7ilx3K
	X7riFL9A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ZPn-00000004Wd1-3zeS;
	Wed, 08 Oct 2025 19:01:31 +0000
Message-ID: <b5882598-3765-40e1-b2b7-9fb495cf6eb1@infradead.org>
Date: Wed, 8 Oct 2025 12:01:30 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: EEVDF vs CFS Clarification
To: Peter Story <peter.garth.story@gmail.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <CAEC0iFCK6RznO-_bAuEv80U_6cMMuuPzJptgOMGDZaxGpXY5xw@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAEC0iFCK6RznO-_bAuEv80U_6cMMuuPzJptgOMGDZaxGpXY5xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Peter, can you clarify here, please?
Thanks.

On 10/7/25 7:21 AM, Peter Story wrote:
> The documentation for the EEVDF scheduler says:
>> The Linux kernel began transitioning to EEVDF in version 6.6 (as a new option in 2024), moving away from the earlier Completely Fair Scheduler (CFS) in favor of a version of EEVDF proposed by Peter Zijlstra in 2023 [2-4].
> https://docs.kernel.org/scheduler/sched-eevdf.html
> 
> "As a new option" and "began transitioning" suggest that even in
> kernel version 6.6, the CFS scheduler might be used. My assumption was
> that CFS had been completely removed from 6.6 onwards. For example:
> https://unix.stackexchange.com/questions/127110/which-process-scheduler-is-my-linux-system-using/127113#127113
> 
> I'm looking for clarification on this point because I'm trying to test
> the effect of the scheduler on my software (pydiode, a tool for
> unidirectional data transfers). I'm testing using Ubuntu, and I want
> to confirm that:
> - When I'm running a 6.5 kernel or earlier, I am using the CFS scheduler
> - When I'm running a 6.6 kernel or greater, I am using the EEVDF scheduler
> 
> Thanks!
> -Peter Story
> Clark University
> https://datadiode.net/
> 

