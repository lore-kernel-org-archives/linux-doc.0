Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350D28E0;
	Thu,  9 Jul 2026 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783556027; cv=none; b=fNsP+dDq+CfmQCMbYD8E+KOTvRgr2wL1o9R4hF05XYJv+EZRLEDehbWm1ntf473UIQuWZgbUraig1ehLabBJ+ROVbafvdbnvxcJV34rr6SDsxv4MS0RCpr/6QLZb56HaJJP6tMBRjnX4a53NVNvlpZYozpU4kvq0Tb9FejZXdsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783556027; c=relaxed/simple;
	bh=o6+FdIK32ujbiAy8E040lU6hw/zhNA+0f/tqyf/tniY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EElvcD8EGAFROENQCqPi6Nm6AX+2j0Vep66vEqY5Bt0/cobfrILfN7y257APgMNlwKlFJbvdB37Zt0VLwC+c+bN6xoTIu/GC6c+mjS+aenKdOkAR4CUKzqDpdOcppCYsQS2KJs35Q4hmUk4airSMZatd0oD3vJVJ9vXTScCot20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A6HDH6gT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A6HDH6gT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 70FDC40E02B3;
	Thu,  9 Jul 2026 00:13:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Nw6wzWAasnRp; Thu,  9 Jul 2026 00:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783556010; bh=Dm142gdEcTFW/K9q2hEUYlWar6YFLyEh07MT+JePuXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6HDH6gT9tSmpGm7gFBb/zhdlHgbVz1vAN3hdKCTt8avHG6GDcMqOkm2q0UeWJgP5
	 mPP7npwtAwMaukjfTKWu2skzW4OjvT+JzT///eMqXXa+eLQAk6I00tt8mP8X6njaiF
	 ADj5LN3F5Q2en4+1YDGo5EWz/VuSNxnnFB6Pffh6jGAsiiHwyRQTBbMP/xwZBKMdPv
	 D3WVZXc47avg+tru4fyObIuSqbx+6St68K6I2e4HhvK2MwzwtuCCfdWEELBfJrl0mC
	 YdosmLKT9bzZ+7o7Y7HhTfMTiGH9rZ2wGspOg/NLCWOfxHN2S+HVyNCDl84Usgls71
	 Y5tY7Hp/s+REbrGk7pIV+KLTgOKBRTHmnyjHE+fIwWOvAt+okJ24D854k54RJJ0MPt
	 /WzzC73Sg8+Uc3TiZ7xRhNuI1I38BXQa9rPDweLrCjLSS6T4mHfQE4tog0mmj7QkHD
	 UgfrBbg7CjWePrEMpl2R4LXn2sGFcVmAH5yuwuY6Yv/9EHoGhjW9Q6xbWXb9odyAI7
	 5nYQbQfDXaGdwaqPvFlaKSeUH5MLY0+c+r0D9OVE0ZJDwiy8Y4hkd1R6e+ipOf4JuH
	 z9Wh9BhVB8Ab2Lx7P3JHFZ0z4XwwFN6FmHGKH6pts1rO457NWF8udf5FRXbTPqHdoK
	 csHy5RojnCi7B+bg/++YBpo4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C4F1540E02B1;
	Thu,  9 Jul 2026 00:12:45 +0000 (UTC)
Date: Wed, 8 Jul 2026 17:12:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Babu Moger <babu.moger@amd.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, corbet@lwn.net,
	tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, tglx@kernel.org, ben.horgan@arm.com,
	fenghuay@nvidia.com, skhan@linuxfoundation.org, x86@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com,
	xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
	tiala@microsoft.com, chang.seok.bae@intel.com,
	kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
	elena.reshetova@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
	eranian@google.com, peternewman@google.com,
	qinyuntan@linux.alibaba.com
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
 Zero Association (PLZA)
Message-ID: <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
 <ak7kgJZyKmEVUdMj@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ak7kgJZyKmEVUdMj@google.com>

Hey Namhyung,

On Wed, Jul 08, 2026 at 05:00:00PM -0700, Namhyung Kim wrote:
> Well.. it's changed as Linus wanted to not update the headers for
> trivial changes.  The script is still there but it's not running
> automatically.  For perf, we used to check ioctl and other user-visible
> changes for system call tracing.  And some headers moved to the
> tools/perf/trace/beauty/include directory to sync separately.
> 
> I think the headers will be sync-ed less frequently.  So you may need to
> update the header for tooling changes manually.

I'm reading this as, we should not touch cpufeatures.h in tools/ and let you
guys decide when you actually need bits from it? In the sense: only when you
really need bits from it, you'll update it and other, unrelated bits which are
not needed, can remain different...

Or?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
