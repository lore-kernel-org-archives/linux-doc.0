Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45F3B19B9
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743772; cv=none; b=DmPz70sBqNp+lgy27/5RavNBYbU1ZY5thX6zeyys8Xc2CcwLCRn2RihwchQy5+JmH8Lu7yrbWu97I9/dcjUdYCYM0kObzMkLBj5lBvWvd/oOlKONU34QAeAxiGvqYu7Qzf14osAeTnIvvkWMZBTsNhMSzbIMaUOE4SqJOOkvrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743772; c=relaxed/simple;
	bh=wD44Y63EA6JkdHHUiSvWdGUuUfwMmdpo4BQ0mpObOMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiGyyiDxnq2vhm0Td0TwUDLvbyrmxEeAkfWyzwNWOBw6ERMQ7TffzApZSr5XlBalA1Y3cJwJ5ZK35BWFfmaGzvv0ZGFY0Wsq5cWaSkwXUQQWpHmAkvR+f83IjoiZzQluwlEU2991m6ifqQyOgdjEjTmQ8F68lcERJGHT3m6HvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1kHAjQ7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1kHAjQ7"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9b4f8ade0so1678869a34.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782743770; x=1783348570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ+IDJoBNvSWtfXppBh0Q5Xykl47ag4KSNlB4tlfBVo=;
        b=g1kHAjQ74IEb1AjgA9gRYcmuFlQ9SL16jryvgJ8TojgNqMNHZ3qPBzZyz/L5EEviqP
         V3Xm7htCJivKZJCnNXp81VAk587SHhREB0fIldDpFlWcNDR0UsutxmDcZ8AcOfyV0X8E
         ko0TlCbIgQRg8FtBU0zweqbjgw3hBtqJuZ9WnGA5HLHqkk+iIo7Oln/Yi9piev2sEN7I
         Ojo/55x0uHEM18LbvCA+dcAuRHeJ6D3nzPcA5JuF7/3KBT6dgn1MJQYTHqx+Pw0yAhi5
         FTuphYpAKXzLuST89g6SfYilxrL+4Tx4gjXySE0dGl2DUwIbrjX1ilRDzuLlfKjhsqbi
         v0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743770; x=1783348570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZ+IDJoBNvSWtfXppBh0Q5Xykl47ag4KSNlB4tlfBVo=;
        b=C5x9ndozPw8ZSaG6WfdQ4l1JGmIhunItZ75NqRIHoKai3+NP4YlYTDI4RiKLY6/pIB
         ExAJLj0izl6sIgnVi7gNkznD9kPO4iCeLWFWKXlVmEuyBM2PoaC2O7WLKWy8Ujo6aXL7
         QLqZNyJ6ICVXcPUiXNMRekJhkrxU2kOPsl4s6fm7RT51l3ecW/q6drfsQ2ermWw/ShE/
         R7yq+zE/ibBRH6XnWw7v6nb2U9uXDD+e123QExUjVy6LA55ADLmy0VXOk49DFdwEZ1EB
         y6kJBDR2Sg+NY4WwqRUR5DmacIXYEAe2YLtLBPFNLTy9BLMK49a7q9iSXhjIEZtIvih/
         MOLg==
X-Gm-Message-State: AOJu0YzCMhtA8yUbE0PJ0+kuku9nhQw3MjOnlm1IGOY10I+2v5Yq9j9+
	jolZdCTCwNhw9M7dmIzLCo1yNuJ12XdLljiQgi1/9yz4CjqHvIaKedbz
X-Gm-Gg: AfdE7cngbQ5k11EqvmyPnSDbcj5oLkCYKIbz0lzz1itYmhtz4evOMzWlU8tMPBuJHX6
	9EE6Bs7ltFmWjTGJ7rDV7ZQ7zDt/7ONCj4O7CouruhvDy6bpeNEEEecTaJC1oy2ttGQdLce7uqJ
	NMGob/yguGdG6r/q64ZG2/Z7WZ98y60vyXxNQLD6HqYkPJkWla1D8ekLWxiDXye0USAxNFVPYOY
	FS/2i+4xFU3XaT0qkF76ZAJ/dRFDzeNOOwH+iUpeRy6lXGCIqUHF/NtVw3+Je/VpPKoUDgX/J9d
	+4OqVW1rgZ3sJP3aV5/Tt2DHVYk4F/9oVqDVUeoj2FZFSwMWA/69aZgi5Oh2MaFwTTxKZCUbGHa
	h8AxM11hd9TrRr81wg7JY5XTPB0CRMk/XrVTRI4mOXxZKTfDz8cjPkKn2Cp2oOdgWRnkZ4C3WUP
	IeYazVhgXnhaWq331C1LScudz0OXysMSM2lJxEjp2MaLXoaGVuJUG3LzCF+D7k8w==
X-Received: by 2002:a05:6830:6d17:b0:7e6:f7fb:967f with SMTP id 46e09a7af769-7e99bf3f3f4mr15732114a34.2.1782743770576;
        Mon, 29 Jun 2026 07:36:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa800350sm9005340a34.25.2026.06.29.07.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:36:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1e697d2-9f9a-4f33-80f0-2225cd7f91e6@roeck-us.net>
Date: Mon, 29 Jun 2026 07:36:07 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: watchdog: Fix brackets
To: Jonathan Corbet <corbet@lwn.net>, Manuel Ebner <manuelebner@mailbox.org>,
 rdunlap@infradead.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, skhan@linuxfoundation.org,
 wim@linux-watchdog.org
References: <14d8a272b4d57b9e316a1351b38867417a2a6603.camel@mailbox.org>
 <87pl19xy34.fsf@trenco.lwn.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87pl19xy34.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/26 06:42, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
> 
>> Hi,
>>
>> is this patch on it's way?
> 
> On its way where?
> 
> You posted it two days ago, during the merge window.  Surely you do not
> expect action on it that quickly?
> 

Unfortunately people do have such expectations nowadays.

Then I come in the day after the commit window closes, with the thought
of spending a lot of (unpaid) time this week reviewing patches, and
instead start thinking that maybe it is time to resign as maintainer.

Guenter

