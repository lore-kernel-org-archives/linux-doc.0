Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0EE381C4;
	Fri, 10 Jul 2026 01:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783648077; cv=none; b=tAaB3aDgcksXLjDYVLly4wvsbLsNCcLgnLtkIN2Nod+c97fTKuRmi6+YbSkkpPWo1iuRcO+YEO+mrGEauSltuG8zj3BpEZb+3zb7KQNs+HyEOd6pmQMsG0fNxjz0dwLnqZw1Boq7rpjNYcmUqAbBvZAM3LVnrAAOOX5p8xxtO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783648077; c=relaxed/simple;
	bh=E3YtPlfuAZ4tQ4Mk/fRyeG24Is6TpevNJMxODfE9m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXq6y8p2iNu2Vybpek4AF70plO845MrFetRXz3sYtnteyEWyXezMSwoXkPBxnMDFsBEfSFMLYStPuVtmEnEVSrVpmb5uT/O5G8F5HhA+Yzh4DoXtXHmLPI1RM4F0OHzz7Hu8j9ou1dqeYHwqsv4ysGMH2S7TCRhab0J2d7W3NaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IGVvre/j; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IGVvre/j"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D121940E0031;
	Fri, 10 Jul 2026 01:47:51 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hf8slUNXJT8R; Fri, 10 Jul 2026 01:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783648061; bh=8f4x+XzwHLASKFRDpcb7mw8JVWfNiwTGDazea1MJXI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGVvre/jKW0tuL4GqtkrN5Oy/3ZcU+sO6C+wSP92+OpLWsW0o8EOT5tLt6AOj+Jtc
	 Tq7hdurBy1/wm6W8LEh1p1DUh5zmPi2gLDRqqck1owwRRk/J2WfkcCJYU9jTIOPJC7
	 NMXd5nC/t38a1c+GIIsNidYhXL8Okwjy3Wr2V+mMRBgs4nK+uqw3shTUIQBcRqtVV2
	 PUbgs3m1J649Y8SOD2oEoIcu4jswmmgug22pzXtIQCPj5xfg8m+z9CZRdNrNLG6eJ/
	 VnCHfhMrG3XsKM9nqcn/IoLomjwUuOPvqmS5lOC7LAqZpUXzemwFsGz0gPjZP/kN/B
	 M5HBNmNPNOa9GtzN3Zgs9HNz1HWWf8rDXskrSQFa7wZUMxh1L0bwbyMi5xaQWyYeSi
	 yVI0wU7g2RXl7KdzekKKde1WdVzIqVzZ8NYlFz2RWUgPb4p6LDeJqVbTb6rm/+CA//
	 xEGzxZ0K4I8JN/G2MycenSt69SkgMXSQmAw1cTzmQkhbO8kpfhByiVeJ6Ctb/bbb6o
	 4HKPGsw3MOMbCmNi7QyJXMpCr/jdw/VlnV+m/v+zBmjm9T3/6WJTP9QxFzotInNZyW
	 jOp7jxAxDOGsicyjnXkkEIJHM8A01JGO/vWGTWEz7DUNcHeLnXXGrf4WvMrLhQSuUv
	 P4Pc/IpUQ8NvwqWVbp5YYy8M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E7ED840E00C0;
	Fri, 10 Jul 2026 01:46:56 +0000 (UTC)
Date: Thu, 9 Jul 2026 18:46:53 -0700
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
Message-ID: <20260710014653.GEalBPDRbEUjbynkqd@fat_crate.local>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
 <ak7kgJZyKmEVUdMj@google.com>
 <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>
 <alBC_4TcyduQo2zF@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alBC_4TcyduQo2zF@google.com>

On Thu, Jul 09, 2026 at 05:55:27PM -0700, Namhyung Kim wrote:
> No, it's perfectly fine to update any tooling headers if you need it.
> It should be up to you whether you update the whole file or just needed
> bits.  Just expect us to do it less frequently. :)

Right, so my angle was to perhaps update it when we touch it anyway so that
you guys don't have to touch it. I don't see a need to update the tools/
cpufeatures.h header when we touch the main one, for example.

And since the goal is not to update the tools/ headers without a concrete
reason for tools/'s sake, we should simply leave them out and you guys can
pick whatever bits you need, when you need them.

Yeah, I think that makes sense.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
