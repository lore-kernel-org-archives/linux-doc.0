Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA53495FA
	for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wNPVxG2o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ejxm0spt1dL933rOfmOInW5fwUqMtT/i9xtkcwsrW+0=; b=wNPVxG2o7MpM5oA1Zvq1IuVHkA
	2DyKY0GTs+yTMh0j3LJsxqf+IA7QGO4346+yrLRbKGsp/3zIyq6ZWFdmkYSqUAmIBxuoium/quc7h
	EyJhJUdcuYNovvntaRjLcmvASeAjkviACuPKB/8qXprLb2wmPiytwivLwmfX60zfZ9l5obtoNm5M/
	yYuSso7aN2bu/pRS7TlC9ht/wae5cAZSKHEpmw9B4g9g1h7cyf/gkPliMtNtVUC7vb/IVIo2fvPiw
	hsc6eY7Brfn1cdF0coNk0tlfb9p2gLYXxkuYz8ry4jZISbsaYEgEZeFDpdpxiKcbZ/aHfgCh493V8
	WugWNo3Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIcFx-00FaqK-2U;
	Wed, 27 Dec 2023 22:20:05 +0000
Message-ID: <7930ed23-f9ea-4ee3-a55a-cc1bc9446696@infradead.org>
Date: Wed, 27 Dec 2023 14:20:05 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: automarkup.py
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@protonmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
 <e0b06cd8-5198-4c09-b748-f64858abe304@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e0b06cd8-5198-4c09-b748-f64858abe304@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vegard and Mauro,

Thanks for your assistance.
(more below)


On 12/27/23 01:08, Vegard Nossum wrote:
> 
> On 27/12/2023 08:55, Randy Dunlap wrote:
>> Can anyone explain this?  maybe even suggest a fix for it?
>>
>> This has been around for a few weeks AFAIK. I haven't see a patch for it,
>> but I could have missed it.
>>
>> (since 17e02586ed185 in August/2023; oh, that just fixed the move
>> of files to the Documentation/arch/ subdir, so maybe even longer)
>>
>>
>> In file Documentation/ABI/testing/sysfs-bus-papr-pmem:
>>
>>         response to H_SCM_HEALTH hcall. The details of the bit
>>         flags returned in response to this hcall is available
>>         at 'Documentation/arch/powerpc/papr_hcalls.rst'. Below are
>>         the flags reported in this sysfs file:
>>
>> kernel-doc reports:
>>
>> linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2: WARNING: unknown document: '/powerpc/papr_hcalls'
>>
>> and the output file Documentation/output/admin-guide/abi-testing.html says:
>>
>> response to H_SCM_HEALTH hcall. The details of the bit
>> flags returned in response to this hcall is available
>> at '<span class="xref std std-doc">/powerpc/papr_hcalls</span>' . Below are
>> the flags reported in this sysfs file:</p>
>>
>>
>> so the leading "Documentation/arch" is being removed from the filename
>> AFAICT.
>>
>> I tried changing the quoted filename from single quotes to double back quotes
>> `` and I tried it without any quotes, all with the same results.
>>
> 
> I don't see that here, there is no warning and it renders properly.
> 
> If you go on https://docs.kernel.org/admin-guide/abi-testing.html then
> it says 6.7.0-rc7 and (AFAICT) it also links/renders properly.

Yes, I probably should have checked there earlier. :)

> Maybe try building in a fresh clone/worktree just to verify there isn't
> some old file somewhere that didn't get cleaned out/updated?

That does work but it made me suspicious.

I was building in a kernel tree that was built from a tarball
and linux-next daily patches.  That leaves behind some *.orig files
(since I use 'patch -b' for "backups").

If I remove the Documentation/ABI/*.orig files, there is no issue
like I had erroneously reported here.
Maybe get_abi.pl is (also) processing the *.orig files and that
somehow causes it to produce the confusing output.

Anyway, nothing to see here. Move along. :)

Thanks again.

-- 
#Randy
