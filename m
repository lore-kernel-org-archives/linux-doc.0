Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C83B19A6
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040548; cv=none; b=D890QbJanUqHOA25ro5XnRh5fXA96gy5tKlqgKpU95k6nUEgz4PIu1ZaZj9+11ZzKUSCIO1hGANmy24WUcX5cemhbjSd8g93dlMH1tFnwPXn73yoWiZh4XruhUBtcRIa9YL4Wl4GvRnlhZB5Xr5xWzBDF6gesaqPRMyxrQPLbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040548; c=relaxed/simple;
	bh=DhCLGMOZL/w8aCkBuXuDq7mP31RtxM9KjJ0TJxr/Dn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oo0HBKxsytRVakqMNTIGE+raMn2RHaNDSF0VYoV5F/FTpqGAMkUCf/5UhDIWpyIQ6C7WG8mCmlh98DO7DdVWnALnPbaUwzZX3vAp3IbqyApC9FN5dTaWR9+MV2/Xq3E46ignWc1nKQf8bG5PzLPHrnN4O6DXjwle5ic1sg5sYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t9kFSCYy; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t9kFSCYy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E4DE6C62458;
	Fri, 29 May 2026 07:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 56946601FA;
	Fri, 29 May 2026 07:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 058F310888CBE;
	Fri, 29 May 2026 09:42:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780040538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DZ3lfW7SRE9G4rYU9VyZ9PvQOFu+n80p9zGN3rx2H18=;
	b=t9kFSCYyYsX7Mpm/43AyGd8fYnebRyCopT4YVv1WlV2yeqIP2xi7Z4lzM/NGEDpKfEflqo
	COl1/50F/BMd2U8vhv2JtY7i/yUoh2uduIOBevb8aCBASp3YSXaTrXbHHEJB/19pHpLnaH
	wuAz+Ei6HtEaxLhFX537DXLu6YVHHtGiyvXTuvIHiMQM8cxSNsScAflkJ5qQEfnLQIiXC7
	n/3x9H1RNTntXn2X0fkVHy/1cR6GS/qtm3cOdKcYM89ZkOOZL4kRAEQnC/bknpD4gb0ljv
	z+90+AwCWwAm2EBd+1dvFrNzaTpWDqoAgPa3KRqzQ8o3LjME2S0L/hhrb7D4Yw==
Message-ID: <b84a5fe0-a080-45fc-87d1-790402d423e4@bootlin.com>
Date: Fri, 29 May 2026 09:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] Documentation: networking: Add a test plan for
 ethtool pause validation
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260522175109.198059-1-maxime.chevallier@bootlin.com>
 <20260526172447.10ca4b9e@kernel.org>
 <5cb8e2b4-8eb6-4446-9b90-1cd4c7964cd9@lunn.ch>
 <20260527162516.0d012503@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260527162516.0d012503@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi

On 5/28/26 01:25, Jakub Kicinski wrote:
> On Wed, 27 May 2026 04:47:47 +0200 Andrew Lunn wrote:
>>> It'd be great to hear from others but IMHO in the current form this is
>>> not suitable for Documentation/networking/ We can commit the "knowledge"
>>> part but enumerating the test cases seems odd for Documentation/.
>>
>> Sorry, not looked too deeply at the actual content yet.
>>
>> What i was thinking was a python file, which sphinx can ingest to
>> produce documentation, and place holders were code would be added to
>> implement the actual test during the next phase.
>>
>> This is how i've done testing in the past. I would be the evil one who
>> thought up the tests and described them in detail using sphinx markup
>> in a python test template file. After some review they got passed off
>> to a python developer for implementation. And when they got run and
>> failed, sometimes the feature developer, the test developer and myself
>> got together to figure who made the error.
>>
>> I'm not sure we even need sphinx. What i find important is that the
>> test is documented. What kAPI calls should be made with what
>> parameters. What results we are expected and why? So that when a test
>> fails, a developer has the information they need to fix their
>> code. The Why? is important, and often missing from the kernel tests.
> 
> All makes sense. The question is primarily how we fit that into
> the existing project layout we have in the kernel :(
> 
> The python tests can be hacked up to print the test case docstring
> before the failure.
> 
> But I think for human and AI reviewer consumption it may be nice
> to keep the condensed knowledge / common mistakes in Documentation/
> If we had the ability to exercise the submissions it'd be a different
> story test output would be a sufficient signal and/or could be fed into
> the review. But for AI making a guess at whether the submitted driver is
> correct purely from the driver source - knowledge is useful.

Also for the knowledge part, we had Oleksij's series that documented
more aspects of flow control (not just the pause part) :

https://lore.kernel.org/netdev/20260304094811.2779953-1-o.rempel@pengutronix.de/

Oleksij, maybe we can merge some of the information here with your
doc for the Docuentation/networking part ?

Maxime
