Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E111AAE00
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693697; cv=none; b=mnqcG5UH+2rk74wEjHkxLfY3p8qFUBBsHDXOktKTTTZZmesMISBN4Qe+q48UnBJiG8lZRt98ddzf0Bw4usg/+Ktn1PFw8OW3zl1JM12mI1MJtiMz/lGhwNFgLY1ug6h9jaMC5Gj7StOw1cf+b8Z7qvg8oMwHlYbycFvtaxG72oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693697; c=relaxed/simple;
	bh=4kavOI3l2wbWuQOCUR79egQTVS3ezCBmAhuZZZRbu6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqhBo7oeTRwvTZrE8jsXF+EfuMXCJ0sZrSVnx4Buvvx++bYg9mlaiT2NXFdIHdUgPKjBsmwyF1jmb3TKGBdB/XYUrF/3No3ZDno012pV8yeATWIRktJx7XTIwgwFFkG/dJbpkwdPyw5YaF7jMMoqP3xFjuKrBsZMVRHDgzHwWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QwNr24Vo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QwNr24Vo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ru7BjzE7IiS99xFkw728Expjx5YO8mDL356ujE/Icm8=; b=QwNr24VoiAnX/lqH2xkPS8R1Xg
	PRefjwXQt2YoqbiIX7WCSjoBws4zPPwx8kTWY83joeZhyIlse2yx1cDTKE0U/sxao2yPcmriWkawV
	ERq1hliZuACn97SkOlCs1Z/0EpyOc5P3DED8aX5jbgCmNB/xFDvHlGRuRTkcqj63ZRiL3QlyNjFyc
	cJ/4HOG7CSR6pCQ/Xs0EpJcSoVttIFCY0ZrfzVEqjTuGfFftHFUNDlGiGmFL+SQKePtC+/p2KcYAG
	qGDTajPoh0DNnjUDulPnyhaR1XQW6WW8r7F+Db1gVaU7mrDOELjrrKtMBPkfQ6iJ/19CL5MBa8nHZ
	npey6aXw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cLG-00000008Q6Z-15XO;
	Wed, 23 Oct 2024 14:28:06 +0000
Message-ID: <f5253a00-854c-407c-a2bb-1c1a0e1a3aea@infradead.org>
Date: Wed, 23 Oct 2024 07:28:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Translation order of documents
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, YanTeng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <CAD-N9QUgp+W3Us2QFNF9Emde1Yb98_Mco3a-gbrfuMssVVbJLQ@mail.gmail.com>
 <b5f4583a-eaea-4117-b759-ab68d1ce351b@infradead.org>
 <CAD-N9QXy7XpsZgwq+f93eVHh5jqm9HLEBoXk4OehYmXQgrTamA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD-N9QXy7XpsZgwq+f93eVHh5jqm9HLEBoXk4OehYmXQgrTamA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/24 10:32 PM, Dongliang Mu wrote:
> On Wed, Oct 23, 2024 at 1:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> [adding Nick D. as author]
>>
>> On 10/17/24 10:32 PM, Dongliang Mu wrote:
>>> Hi guys,
>>>
>>> when I translate kbuild/llvm.rst, I find this document seems depends
>>> on the reproducible-build.html. The depenency means, A will refer to
>>
>>                       builds
>>
>>> B, like the following contents.
>>>
>>> ``ccache`` 可以与 ``clang`` 一起使用，以改善后续构建（尽管在不同构建之间
>>> KBUILD_BUILD_TIMESTAMP_ 应设置为同一确定值，以避免 100% 的缓存未命中，
>>> 详见 Reproducible_builds_ 获取更多信息）::
>>>
>>> KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
>>>
>>> .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
>>> .. _Reproducible_builds: reproducible-builds.html#timestamps
>>>
>>> I have several questions in mind:
>>>
>>> 1. Should we show this dependency graph for translators? This may help
>>> improve translation. Otherwise, it may occur that A has been
>>> translated, but it depends on B. And B needs translated so that the
>>> translation of A can be merged.
>>>
>>
>> Yes. (IMHO)
> 
> If no one write code to collect this graph, our hust openatom club
> could help contribute this script.
> 

I (maybe too simply) thought that this could be a Makefile rule. <<<
There are a few Makefiles in the Documentation tree.

>>
>>> 2. Would there exist the loop? A depends on B and B depends on A
>>> directly or indirectly.
>>>
>>> If we only need to keep the documents in the mainline ready for
>>> reading, it seems not a problem.
>>>
>>> P.S., it seems current docs building cannot detect invalid URL in the
>>> documentation tree.
>>
>> Hm, I thought that there was a script in scripts/ for that but I don't see it...
> 
> I asked this question because I did not find this tool or script in
> the mainline tree.
> 
> This script seems useful. It could help prune old/invalid link and
> prevent invalid links into documentation tree.

Looks like this has been rewritten. See Documentation/Makefile, target
'linkcheckdocs'.


-- 
~Randy

