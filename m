Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16533B1AB
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 22:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754345134; cv=none; b=jSOp1JbRrU0E941Bcr2iCXZ5hlny2M+2vqjDFpI/F2UMMdxEm6qmG9A9vOmFBuMqQkud014gQi23U7XOw5+9EcOu0ZyXsfWvGiIsUfNjPfbO3BDHQ2DwIcFaab3W8tg+G07RzMz0BMpm7pj1HzPdmKEl1+DsKjhOZKfrGTUQ9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754345134; c=relaxed/simple;
	bh=FastEB7OgXECdO9hgZYE22NM+7kbCnkmTDsfLodWQSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jg/8V07bwGPQonjXJ9V7biK5Z5T1jNd/gsjGrW0hXuuajEZvuu63l5jRNiQ/QS8LELAFv0/1hMXdekXhVQLn92BsuPZEUZGlTBXPGDl4le+icJb2qm9UcUV4R24ZMqp5rTwV/eJND/vveWCDFZ9EhYfYtLZHcuUPBEAnM+LPJeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=vVd4Fxom; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="vVd4Fxom"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-741b1fe0e00so722957a34.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1754345132; x=1754949932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NY95RIchD8SIo3qd+Q4QMJiYcd/t7uGELHIiLvj0ZuI=;
        b=vVd4FxomPtTPrAkp1tUaoLWOlTE2FUW4q6bEf6oejCMzSSJzMHZqVBDeJsF0Ui2VEt
         KqDjEvNv6Q8azY8NwgeQWiPqAE3skF0VXIDIoA/bNAbWIiR/yxN7Ng0zCDgW2p072MTj
         TOEiBz1bZiHZSB83Pgkr37m5IR7Y4aHSfR5RFWaMx75YhU75JxJdNeV2oYi4DxipUJfd
         einiQBU7t2pAUkluvBzwlcMPdECXyxwuNoL8aCKjlkeefTxoPH4HuRw44pYfmxxcPe65
         EnY/YiAo51C216Rr7uZfytnT2OgkpysHJhfsEd9F5HrfwKVMjXaQ0HcWSWl0a6aqTEln
         wGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754345132; x=1754949932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NY95RIchD8SIo3qd+Q4QMJiYcd/t7uGELHIiLvj0ZuI=;
        b=sm3s8fI6q5g6ATeD2YmTaB/B+XXTovZPQnewWTwLGzS28NSWvW0ELG/HPPJ+Qi2kx4
         ODKKuaFcEDoKk5e7Afd/cAz5ti+X44FDDZX9oF+/F8+zmm6jTU4nTbSUGH3qtjke/Sj/
         kLuUxFqsF5Uu1Qo6d6Tuxgp8LsllFqlvgyn01eosOvRcBTLntbQoHqEeY1S6TYqpV437
         LmrRLLoH3zGHta5FzbO5+GCPTlQLXRSnSD0zmSkiWNQbWfV0VFumC43LrBIYpTqp6mpb
         rNUmo6b5FsrYXHf75GVF6XBZrj/2LGen80Sc9GPpJ+Eov5uBTRugnvqiubFfLZ+huk6f
         /lMA==
X-Forwarded-Encrypted: i=1; AJvYcCWuafgs7SVmlJesP5Y1CeXUt184Pw0X9ohANo8ZpIrVOyzwl6WPMsOJP22nh3ztk6buZ0DJCAX+x6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+wVjZRRvJ5YQ4qX084/cGtx810G8Brp21e4rxXjgga06nw8c
	mczcMxnv6g4M565pXJi4LJc41nlSmm1XFF18lIX59RIc+emZQYeMZarU1P88CgA7aa4=
X-Gm-Gg: ASbGncu99M0xrdGeEY+cc94oUYzPrWPpG1O/fxdCnEyu6QVNzIgxJnoi93a2yOUX4Ai
	n9IESmJaenDJlaAPHjjrr60UWjjH++EYljGd1wbnWPjKcS2ez2gH+RQdSOm9Z25/SP6efTgph2c
	8UtBwAhspc2/e6/2n4m37qPdIMGlNME3PDL06wqFKzfTH4HNTsB+aNXu/NSZipfpE0Wou4CYzUl
	rL/YVgt9PxiRTzWPZjBtzTiJEpfGxQl98F1tOTgGcF6fxgsmzy04lJ4Wn7aoEQi5HLo5E0jqYby
	2iAbFQRosXKqnMOAC7vMj7Co9UbgjfLBdoMIcp58zgfSL03f/7Odk2JTWaXFK6RnHQrZYEmSycc
	726x9wErGCU2ZK3k90rORiL+89ghnh9l940/3+/QuIKRKltOdbQmJ0hYSz91C+Oeq
X-Google-Smtp-Source: AGHT+IFb15fKkmoC9SPgLm/k/c4CHRaUaa9kPFmtSl+959gz0smfjwanQ5OD7XAAx5dCBqHcm7ev5A==
X-Received: by 2002:a05:6830:3745:b0:73e:9bf2:92a8 with SMTP id 46e09a7af769-742f8aab4aamr760623a34.3.1754345131794;
        Mon, 04 Aug 2025 15:05:31 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:3059:9aaf:e68e:7cb6? ([2603:8080:7400:36da:3059:9aaf:e68e:7cb6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-74186dd26a9sm2446776a34.57.2025.08.04.15.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 15:05:31 -0700 (PDT)
Message-ID: <9dcd185f-184e-4c1b-95c8-9f649a9d05f8@vt.edu>
Date: Mon, 4 Aug 2025 17:05:30 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/core-api: Fix circular buffer examples
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: carlos.bilbao@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>
References: <20250720160243.149595-1-carlos.bilbao@kernel.org>
 <1e3c4ee3-f66e-4ce0-819e-e0bed6a744e8@gmail.com>
 <8723a37f-0a04-4e46-80a1-7bb817ecae03@paulmck-laptop>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <8723a37f-0a04-4e46-80a1-7bb817ecae03@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 7/23/25 15:47, Paul E. McKenney wrote:
> On Mon, Jul 21, 2025 at 11:47:25AM +0900, Akira Yokosawa wrote:
>> +CC David and Paul, who are the authors of this doc.
>>
>> On Sun, 20 Jul 2025 11:02:43 -0500, Carlos Bilbao wrote:
>>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>
>>> Fix circular buffer usage in producer/consumer examples in
>>> circular-buffers.rst. They incorrectly access items using buffer[head] and
>>> buffer[tail], as if buffer was a flat array; but the examples also use
>>> buffer->head and buffer->tail, so it's a struct. Use buffer->vals[head] and
>>> buffer->vals[tail] instead to match the intended layout.>
>>>
>>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
> Hello, Carlos, and thank you for your attention to detail!
>
> This one could likely use more help, as the last substantive change was
> more than ten years ago.
>
> But are you referring to a particular use of CIRC_SPACE() and CIRC_CNT()
> for this change?  If so, could you please identify it in the commit log?


No, it's just the uses of the structure. Take a look at the patch, you'll
see. The mistake was introduced in this commit:

commit 90fddabf5818367c6bd1fe1b256a10e01827862f
Author: David Howells <dhowells@redhat.com>
Date:   Wed Mar 24 09:43:00 2010 +0000

     Document Linux's circular buffering capabilities

     Document the circular buffering capabilities available in Linux.

     Signed-off-by: David Howells <dhowells@redhat.com>
     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
     Reviewed-by: Randy Dunlap <rdunlap@xenotime.net>
     Reviewed-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>


>
> 							Thanx, Paul
>
>>> ---
>>>   Documentation/core-api/circular-buffers.rst | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/core-api/circular-buffers.rst b/Documentation/core-api/circular-buffers.rst
>>> index 50966f66e398..b697915a2bd0 100644
>>> --- a/Documentation/core-api/circular-buffers.rst
>>> +++ b/Documentation/core-api/circular-buffers.rst
>>> @@ -161,7 +161,7 @@ The producer will look something like this::
>>>   
>>>   	if (CIRC_SPACE(head, tail, buffer->size) >= 1) {
>>>   		/* insert one item into the buffer */
>>> -		struct item *item = buffer[head];
>>> +		struct item *item = buffer->vals[head];
>>>   
>>>   		produce_item(item);
>>>   
>>> @@ -203,7 +203,7 @@ The consumer will look something like this::
>>>   	if (CIRC_CNT(head, tail, buffer->size) >= 1) {
>>>   
>>>   		/* extract one item from the buffer */
>>> -		struct item *item = buffer[tail];
>>> +		struct item *item = buffer->vals[tail];
>>>   
>>>   		consume_item(item);
>>>   
>>> -- 
>>> 2.43.0
>>          Thanks, Akira
>>

Thanks,

Carlos

