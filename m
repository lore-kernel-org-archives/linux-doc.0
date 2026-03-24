Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E870363C61;
	Tue, 24 Mar 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369448; cv=none; b=i0sVKS4wvIRp5AuW+UryMNRqwA47pFAT0McJbEfqK8do77P1YF9xuX8/PZJIj6Yj5Skahoo6OSAtuStQNi+KckmPIOCPlnVmDFjvIQuRc11kKc+XsjtfG+Or5xBuxpf5aj5PYCd7FLp0twWkIdgELLOx5dCznNWusjCptcBfrE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369448; c=relaxed/simple;
	bh=7rKmnaLemA4yayvIHA3RdoP0hVRC5U3QcDfEb76UJIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4we9L8Dld3ohBeyjpyq7b2EhOxk3cg1hzA8gicr8r15bQXNPb+9wASS2Fb5yHpZTDJriHIIP6MycEshVnai7e12HtFJzF7dPt3cHQukGs4+NeU3yobwmLf0k3Rjo4aVWpyLF37rsn58fFyK0XYHV1og7EE+95C13Q/JC3dJ0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FqIM8rLt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FqIM8rLt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fS1bjnQ+QGU+h4p/CxhcNAZyeuuxnXFqgllOh28ZBiA=; b=FqIM8rLt08yuV9/jD2INOc1vOJ
	r9RA5a/cCjVB0tLAO4E1vA6srRRd8ktdwNlN8hffskej3pp9uqu7X72Q0KBoSKG5Pwy3H2M8uVD/6
	6LpSASRFsueMiwqv4iSdCxWHENLMWfXyOnyHHwvXWNoEaW9M0CD8n+VjQelal0/OhG4mtBJFC7oOy
	gZEGYwWeUC47i10ujCD6lw+v6VKk46TygurdnB2X/XwTK9KJoHQ9q3a0WIvZU6WQbXdXA3uZQAW2l
	oAOrMbGVBuD4W8Q2KvHPAXlEEOG+zw8NQx0A/WF3JBea+xNzHXmvScZdQIwDC4LGkGcnahUH+gPkP
	jFxAe0zA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54Y2-00000001swQ-2tIj;
	Tue, 24 Mar 2026 16:24:06 +0000
Message-ID: <c17639f2-c3c8-4f62-a109-248a10dbc553@infradead.org>
Date: Tue, 24 Mar 2026 09:24:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api
To: Jonathan Corbet <corbet@lwn.net>, tovicito <tovictakamine@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260324160048.4899-1-tovictakamine@gmail.com>
 <87tsu56wg2.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87tsu56wg2.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/24/26 9:09 AM, Jonathan Corbet wrote:
> tovicito <tovictakamine@gmail.com> writes:
> 
>> Signed-off-by: tovicito <tovictakamine@gmail.com>
>> ---
>>  Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
>>  Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
>>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>>  Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
>>  Documentation/driver-api/libata.rst                    | 2 +-
>>  Documentation/driver-api/pci/p2pdma.rst                | 2 +-
>>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> The changes don't look terrible, but please resubmit with a proper
> changelog and a full-name Signed-off-by line.

and you can add to the v2 patch:
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
