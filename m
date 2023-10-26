Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70652D021
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monoid.al header.i=@monoid.al header.b="iEG+loyV"
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [IPv6:2001:41d0:203:375::b2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C6118A
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 03:41:14 -0700 (PDT)
Message-ID: <df22c0f4-671f-4108-85a0-d1667ec1da77@monoid.al>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monoid.al; s=key1;
	t=1698316872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd3eoaiF/+tbh5L7T/uyc81E4f5T3FXS86ruMLdkn04=;
	b=iEG+loyV0OVdROto6FwhYBLSvgpMxCFBSsDjAOLWEx2pQa/812stSjx6zR/W44ppOD1z5/
	63/1bOQRsXpW0emDYWCgI7BgWJ5cSsJLMQfsW2q7szxIQEPPxzUU0Y9v4ypAlURe6s4cPk
	ZSWRo1IFj/V+5gsJjEN5Vu5a6dqLY/l2vhCc/a/WCVvM+PUZfQ7s9cG3zwHvXKk216yQjq
	EQ2WnVdNXn17TC0X5rkFglWQ3AZptuBZ0tjutsYNaEkY3V8MuBgmI66KM/fUM4fY9+87dw
	06XSSKCmX3hXz/h3H4yfgcsNvfAKp+llnSZW4qqm2HpkZAc6vIJAlWohhEhAcg==
Date: Thu, 26 Oct 2023 18:41:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ellie Hermaszewska <kernel@monoid.al>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: eugene.shalygin@gmail.com, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAB95QAR-UbfVULOCaZMO4H1AgvzbiHEoSYk-DiYPY6Pg-i7Vag@mail.gmail.com>
 <20231019135640.434752-1-kernel@monoid.al>
 <d013e9a3-df0a-4b8f-a1f3-db3cbd32812f@roeck-us.net>
 <b81ae275-d3ac-4565-a09a-4a5ce38fadf1@monoid.al>
 <3a8fd5d6-9b79-76de-80fe-b39e24510dec@roeck-us.net>
In-Reply-To: <3a8fd5d6-9b79-76de-80fe-b39e24510dec@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 10/26/23 13:01, Guenter Roeck wrote:
> On 10/25/23 21:46, Ellie Hermaszewska wrote:
>> On 10/26/23 03:35, Guenter Roeck wrote:
>>  > This is not an acceptable commit description.
>>
>> This is not acceptable feedback.
>>
>> I am unable to accept it because it is not clear to me what you think
>> should be changed.
>>
>> Is it because I misplaced the message to Eugene? Is it because of the
>> Greek characters? Is is not descriptive enough of the change, or in the
>> wrong tense, or has incorrect punctuation? Do I need to include my
>> testing methodology?
>>
>> If it's only something minor, then please also feel free to correct it
>> yourself before applying. If you can't or it's not something minor,
>> then please let me know what ought to change and I can try to correct it.
>>
>> If you don't let me know, then I will have to guess and possibly waste 
>> everyone's time further.
>>
> 
> Please consider reading and following the directions in
> Documentation/process/submitting-patches.rst.

I will guess that it was my misplaced reply, and submit again without 
that part.

Thank you for your time.
