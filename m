Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC03367B6F;
	Tue, 19 May 2026 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209719; cv=none; b=itehxQmJ6D+dbnQN8M9IDsePi3FthXASl7WH6aJXakNPOQtk9CEd8ly8Ltspa1+Twjq1oZ1oZQyStdZ1KH6j+zPVjuSXJHBEZGMIqsYXmuGRWnQFR+LoRdbR1h7rzHfRSWcf8xAO7QIVjLc/XNMG9gs8GVMyxZizsHwK2Py9YdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209719; c=relaxed/simple;
	bh=z6ayC6jHJZYN65J1bBTQkXynzc5Zsy7g3R7rUyerkwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAdTpcUhbItAp8ix/8+uJpkxA+pgtsdV8MaZbO6ZDwCb+2YAJfticH/0A7P5IcB5yZ54WTISIz/AE1N54uGNdaEWQQq4jRAZa4/reKe8CFV98HXLClj7R6OuqtJqbZxz6B2GdfEYAlDO6AvqkqYnP+80igfl7izdV/bfJUrSesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LxZYyIoM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LxZYyIoM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dsadsPhnJxyNtzA2wIso9SDv30uPDl02/dN/RTxAuvU=; b=LxZYyIoMEwNm3CT1v0yqWt2rcM
	wupluB9gsnrXTrNQzXrMyjDiWJ8hdM4v7wNTPiE/5SBZqgW2kb7kr583I+fcKFi5msSISYLrMY6vC
	CCryca5uPp3vv34ifK/7zDK8Rb+214tyP+5Lo+YHJfS1uZ7eRbTjcAC0Ser7aQQrgQFOlzwI7qGGD
	wap0CB/Z7y2o4meaAx5FwKfCS1oOHpGj+ciQ6C7qFKUBHr3n0xm3Bz9uyXGBnItsuVeobTAVVydJb
	dCXp96iGJR9iNCszR6mHK9sJr7b+mUWuawN2aV7YmUeBDyuMSt4l7zzn/wYbu9b0gUC8oiajhLnsM
	nq6ErIVw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNis-00000002J6I-0u0R;
	Tue, 19 May 2026 16:55:14 +0000
Message-ID: <4de418e8-4d26-408c-8dc0-dea51a63c945@infradead.org>
Date: Tue, 19 May 2026 09:55:13 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] kernel-doc: Issue warnings that were silently
 discarded
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104215502.1049817-1-andriy.shevchenko@linux.intel.com>
 <87sees73i5.fsf@trenco.lwn.net>
 <90db7fc0-5ce5-4ed4-ac33-18910c37d3d7@infradead.org>
 <aRC5NjhOmuGIpdPA@smile.fi.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aRC5NjhOmuGIpdPA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm still seeing duplicated warning (logging) messages coming from
kernel-doc. Is there any progress on this?
I thought that there were some patches for this...

Thanks.

On 11/9/25 7:54 AM, Andy Shevchenko wrote:
> On Sat, Nov 08, 2025 at 04:03:15PM -0800, Randy Dunlap wrote:
>> On 11/5/25 10:12 AM, Jonathan Corbet wrote:
>>> [Heads up to Stephen: this change will add a bunch of warnings that had
>>> been dropped before.]
>>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>>>
>>>> When kernel-doc parses the sections for the documentation some errors
>>>> may occur. In many cases the warning is simply stored to the current
>>>> "entry" object. However, in the most of such cases this object gets
>>>> discarded and there is no way for the output engine to even know about
>>>> that. To avoid that, check if the "entry" is going to be discarded and
>>>> if there warnings have been collected, issue them to the current logger
>>>> as is and then flush the "entry". This fixes the problem that original
>>>> Perl implementation doesn't have.
>>>
>>> I would really like to redo how some of that logging is done, but that
>>> is an exercise for another day.  For now, I have applied this one,
>>> thanks.
>>
>> I think that this patch is causing a (large) problem.
>>
>> With this patch:
>> $ make mandocs &>mandocs.out
>>
>> Without this patch:
>> $ make mandocs &>mandocsnoas.out
>>
>> $ wc mandocs.out mandocsnoas.out
>>   29544  267393 3229456 mandocs.out
>>   10052   95948 1208101 mandocsnoas.out
>>
>> so it appears that this patch causes lots of extra output.
>> Some of that may be what the patch was trying to do, but
>> with this patch, "mandocs.out" above has lots of duplicated
>> Warning: lines.
>>
>> $ sort mandocs.out | uniq > mandocsuq.out
>> $ wc mandocsuq.out
>>   18012  167689 1994145 mandocsuq.out
>>
>> $ grep -c "^Warning:"  mandocs.out mandocsnoas.out  mandocsuq.out 
>> mandocs.out:25273
>> mandocsnoas.out:10022
>> mandocsuq.out:15252
> 
> Yes, that's what Mauro explained, that we may have the dups.
> 
>> In mandocs.out above (29544 lines), this line:
>> Warning: ../sound/soc/sprd/sprd-mcdt.h:48 struct member 'dma_chan' not described in 'sprd_mcdt_chan'
>>
>> is found at lines 7 and 29122.
>>
>> So maybe the logging output needs to be repaired sooner
>> than later.
> 
> Right! But I'm not familiar with this, so I can help only with testing,
> and not with real fix development.
> 

-- 
~Randy

