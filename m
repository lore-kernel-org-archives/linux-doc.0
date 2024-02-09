Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2F7317B
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707495291; cv=none; b=UX3mH3YLDbc6veCshBmfF9bQYUtnT0zTufmk2ctF6Q0aXGsEHezvgUGecane+HjQiWYoWfnbXxKm0MFcXR/FYdMR+rTs4MuAadOr/qlnCEX8iWsTkrkcjS1OuOfdZKJnjz4ENy3dukCmU2Nn1G04MvpbV9U7eWYN5j0BwBJLxRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707495291; c=relaxed/simple;
	bh=sVzlYSncAo1gFFo8GKHnZeX2AilT+0vbeM9eS6ImcIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMRCbvI62+wOG4Rqb0a2iEmjQg4WX9wZr8NtgfWcMXcMqVc03RzS02thaa6wpFPM5hJJ0gawkrkQxAtmZ4dX7m3XLR3jwU7UwLrcz22YnvfMqFNJl3c19blihez052HM/ICc6BKA8rqfE+6iCTHv9+X+NCvOeaik5soQzbv/qfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gNTFsq9i; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gNTFsq9i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xyBTthuy04YUyUsrk+iLDr6xP+M56OQcEXAlXoX91UQ=; b=gNTFsq9i4fxjvDgL6y9cJmAYBk
	woG1dsmel4etQ8cHgS6QPEbXw3QE/IdanxiNQ9UFQwUJv3gxsrVswxetLDDTwYjxvOHV40Q//qoir
	5gdIGygvVaD7PcVfDQrg9pxo+PrhdX65L432x4EwrefDVR+amMFVDz1F8t3WYHHJDnQ+hXh7Gne+4
	tO4PiZqQJ1w+PhDUcIVHVviP9icPFVHWBPjhOGCxkZBPyvxOMqu31h8GJEH2SvtfGNUBE3QZvTFJ+
	6+n4fzTzSKOlP+BYCnp+ExPP2H4/7KzIXXNeZ0N15ac2K0awoF9p0bzH70K7kw8gvJnDHLrCh4lGM
	MNhtMLcQ==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTWW-0000000HVBc-0Yqu;
	Fri, 09 Feb 2024 16:14:44 +0000
Message-ID: <1c672ddf-20f8-439f-9019-27b0aacf45fe@infradead.org>
Date: Fri, 9 Feb 2024 08:14:38 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH docs-next] scripts/kernel-doc: reindent
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240208161705.888385-1-vegard.nossum@oracle.com>
 <b7c5562d-611f-43e5-b78b-122c84941f60@infradead.org>
 <e66e7fb6-3877-4de4-8086-b09c445e6b14@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e66e7fb6-3877-4de4-8086-b09c445e6b14@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/8/24 23:31, Vegard Nossum wrote:
> On 09/02/2024 04:49, Randy Dunlap wrote:
>> On 2/8/24 08:17, Vegard Nossum wrote:
>>> Bite the bullet and reindent it by hand. I tried using both perltidy
>>> and vim, but neither of them were up to the task without changing too
>>> much or getting confused about what they were supposed to be doing.
>>>
>> I'm not verifying that the changes are whitespace only, but this change
>> needs to be done.
>>
>> The only downside of it for me is finding what commit to blame for
>> a Fixes: tag. I have no good skills for doing that.
> 
> Probably the easiest is to use "git blame -w scripts/kernel-doc", where
> the -w is "ignore whitespace changes", meaning it will successfully
> traverse history past this patch and attribute lines to the correct
> commit.
> 
> You can also use GitHub:
> 
> https://github.com/torvalds/linux/blame/master/scripts/kernel-doc
> 
> If the specific line you are looking at gets attributed to the reindent
> commit you can click on the "blame prior to change" link just next to
> the line numbers (it looks a bit like this: [[[ ]) and that will give
> you a view of the file before the reindent.

Thanks for all that useful info. :)

-- 
#Randy
