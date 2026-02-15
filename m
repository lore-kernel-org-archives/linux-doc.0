Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E13EBF07;
	Sun, 15 Feb 2026 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771179476; cv=none; b=LxJrJauzjJVsAIjPohr7nq/DK87aAFyPf/EeMXK9KYvls3qnU7pwanhXpNZKdVYp5vswctaCxh5WisBOPZb4tsbbwk+a2G/jtIIFQO6SGQLT3+C0XlAE0fuRefZIBYEdm3GnHfMMbLtsCM7eiP7xMhNHKEkg0KX7yuLhn5GnvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771179476; c=relaxed/simple;
	bh=NAbk9KqJ5oLQBytevpveJLSC02v3nkX+RTDtVEpkfPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIJu3OxCoOe2h0SyBP7eWwSXeSk27mbXk/g/AwnF/eoPPNqAhUivQ2x75zJxuF27luHjvmLWe+OiYa/zgSXjDCEjhpgalAxV+FaYDFqub57niZicNcAzzadnRJ26FJ+5BECDCwdB+CiQSNY/ovEHkZybhqYrZg4zsPe9JYOnN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tHY63kUj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tHY63kUj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OWTQpKDP3kzTAoWMcD0Vl2c4iIi/4wfJZDt0FjNeiro=; b=tHY63kUjdM0JaWkTHj6bYIkN0T
	0RvQBpJoVv6Q3O9pU3gAwAgJ5QJVQbC39IWLkpN3o3nm+vjWIMXGgfTdS3Cprk1YHSzg2VLCHiZOH
	yUwbuKJ/YE8M8VJM7ux/vFe8vc+Ydo0FF8jyy2qi2flZJg2wx6MiW1zSyj9k/3k288jDNo2kqC5OZ
	T9ez0Mo6Wjo6/IFy+5ThAHh0ZV/wLOxaUROg+1GM4vTw0FUYBHrJCTSubLwem+KXuBBbezwDHgCOq
	RNIk6PWvxqTZ68o2HNOf5SleuRo8zGElGNJbcwxACOc7FmI+FPtLnlma9E/CRYTIy3T54CWkMKmBR
	zGTK0pow==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrg6t-00000005YjY-1ypa;
	Sun, 15 Feb 2026 17:40:43 +0000
Message-ID: <b0b5c249-b9e8-4df8-96cf-9d30469a00c1@infradead.org>
Date: Sun, 15 Feb 2026 09:40:39 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] README: remove unnecessary comma in "System
 Administrator" section
To: Sasha Levin <sashal@kernel.org>, Achill Gilgenast <achill@achill.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Kees Cook <kees@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260215111156.77301-1-achill@achill.org> <aZHGDN2hYyvDTCed@laps>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aZHGDN2hYyvDTCed@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/26 5:11 AM, Sasha Levin wrote:
> On Sun, Feb 15, 2026 at 12:11:52PM +0100, Achill Gilgenast wrote:
>> Commas before "and" are unnecessary if they are used in the same
>> context, as it is here.
>>
>> Fixes: b9a565b3e4d8 ("README: restructure with role-based documentation and guidelines")
>> Signed-off-by: Achill Gilgenast <achill@achill.org>
>> ---
>> README | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/README b/README
>> index e6549b2a7aac..947265bc64ac 100644
>> --- a/README
>> +++ b/README
>> @@ -98,7 +98,7 @@ Maintain and stabilize kernel versions:
>> System Administrator
>> --------------------
>>
>> -Configure, tune, and troubleshoot Linux systems:
>> +Configure, tune and troubleshoot Linux systems:
> 
> I suppose that this is a matter of preference, but the README consistently uses
> the Oxford comma throught the text.
> 
> I think I'll just point to
> https://docs.kernel.org/doc-guide/contributing.html#typo-fixes and defer this
  Exactly that. ^^^^^

> to the Documentation maintainers :)

-- 
~Randy
