Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050731AF38;
	Thu, 13 Nov 2025 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763063444; cv=none; b=iJuEl3gvU04VPIVUwASTORLf7Ba7a4OZApsr1AMGv9bS8I83nMls14QSYia4LJnGMBtOFNV82pI4F1xL0Ehb7qcqKg3Iy06IcBMWO93S6UWppZrp/3+eqq6+A3Gld0T+JiN4bCu6tId6DAgmOWcvlWMuh2AmrRyl1WVJGDyBJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763063444; c=relaxed/simple;
	bh=oyfV3BA8mWtSuCil/425qvMLPVtszExdKvqmEAq++6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yw85SRLvwmqGWiEZE89tqsM8IppUIEYuMoDiEIyUOG4liM6mmfYsvanO9c/Vn/dsyDQ6fzkNjrvKGeGn4nQ0zQHnOSn92OtBic9kyNv2p/edpZNkCjVwPjMMaXQ+4Agzeb59XAejH+VEUb2ee+CO11lFArvNV2zc/ntLAhYvXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WtfHyBfU; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WtfHyBfU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NxBrkZLzC3qOisRZ+bThbK7gNaHkjaD++6Pvi4psumQ=; b=WtfHyBfUXdnxzMn1dzpCLAcxCq
	T6fJKmuSlJyENHnWW/ob5zOOI7QC9xj1FkuKirxw680jieOfPm7cMN+SLdFjQiKaAsjJJY05n0QrH
	l1lNiAHN0I6wCOPtFDnLB1iwMSjCzjtWhL+pGJOPvpnuyxe0HXhYwJzHT0K/xr05sY8WPGtFsgNZ+
	U2CB6SuCeyZoYzSlpuCWKGFVxFXl8Jk1ACGQ02j8zEc6TunlXoaEcPxkpXwSqiYC909uGeUdc4uYn
	0dcVZ5GIVIZGPnksIgOwRLqpBklHCPBTjozQ69apesBS3GqRUJSB/nAnf/9pRLRG0HVLJ8ScuYhQv
	jVFKxUqQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdL7-0000000B2Uz-4Au5;
	Thu, 13 Nov 2025 19:50:42 +0000
Message-ID: <a53fe942-609a-4103-9e63-6b65fa408dee@infradead.org>
Date: Thu, 13 Nov 2025 11:50:41 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: docs: kdoc_files.py: don't consider symlinks as
 directories
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <73c3450f34e2a4b42ef2ef279d7487c47d22e3bd.1763027622.git.mchehab+huawei@kernel.org>
 <878qg9ucmx.fsf@trenco.lwn.net>
 <xrekus333iar5zod65ffvcv5fz2rf657dmqbl6npc5jyff4iro@6cdqfudzlbdp>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <xrekus333iar5zod65ffvcv5fz2rf657dmqbl6npc5jyff4iro@6cdqfudzlbdp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 9:08 AM, Mauro Carvalho Chehab wrote:
> On Thu, Nov 13, 2025 at 09:21:26AM -0700, Jonathan Corbet wrote:
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>>
>>> As reported by Randy, currently kdoc_files can go into endless
>>> looks when symlinks are used:
>>>
>>> 	$ ln -s . Documentation/peci/foo
>>> 	$ ./scripts/kernel-doc Documentation/peci/
>>> 	...
>>> 	  File "/new_devel/docs/scripts/lib/kdoc/kdoc_files.py", line 52, in _parse_dir
>>> 	    if entry.is_dir():
>>> 	       ~~~~~~~~~~~~^^
>>> 	OSError: [Errno 40] Too many levels of symbolic links: 'Documentation/peci/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo'
>>>
>>> Prevent that by not considering symlinks as directories.
>>>
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>> Closes: https://lore.kernel.org/linux-doc/80701524-09fd-4d68-8715-331f47c969f2@infradead.org/
>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>
>> This looks the same as yesterday's version?
> 
> I haven't changed it (but I was assuming yesterday's version was not sent). I had some bugs related to smtp proxy at the office....

That would be the one that I replied to that was missing a Subject: line
according to my mail client:

https://lore.kernel.org/linux-doc/20251112171452.Y5jX9%25mchehab+huawei@kernel.org/

(actually there were several like that)

-- 
~Randy

