Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC79444
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705561252; cv=none; b=D0c9duVZBuELElz19awu1/vV7dQ6f7nsJ1i5ZgwEH0V+h07NVgJQYc8VjH4ruuee8sA5im9ls6ZiZfqsWzLC5Glt7oDaSHHushSbpiVwowIyoGfDDtBuhWZ7ODkgWvaYsy9yZq8cJXEndXqH2am6JYuul8Af5FGh24o3lhFi0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705561252; c=relaxed/simple;
	bh=ne4RJerZ1BKcr3DDr4nUHXi4JTCqQ3SwxqgeX36r0m4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=FJEyviwSAr2eq837AI2c89Y2AiDqtD6EhXRUAKbu0oXmbXPzn3VyPDLdm7lYj1U6L+vQULnEBA1/UubMJ9C6+LFq4xjWnToC3/Q71ka8aqHudZIITp/8kFpv48kOiaz+RVcowjhaX7hJNSry8RZW4lJYZPn1U4y4tSjRYa6t1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZtNZ/aQ9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZtNZ/aQ9"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5cdf76cde78so6275705a12.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 23:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705561250; x=1706166050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ja3NjhzUxaN9vb55EZbmkGx8uUNSqsAw4jMXpFWTNpk=;
        b=ZtNZ/aQ9ErtLdKSj44WB120nX+Jr3u4ExLAt0Ze0jP2s8eM3oi46+nTLxrz/Kbs6c2
         VJlrvXvqjUMSxhGytvsrobBlPdFeTCBDCEeELOJAKamO/MEDQrxBnGckUrzKyAX+NKl8
         RG3PtiElxe4tDLosAegPwXSXJvaZQkyL86fZ4bHWJF3oWa59vOcgOOTgjeCFrtRaDh12
         14X2HCsL4og89c4NKcRbzXOulDKABGOUkbeCftTHVPgLia/N1RdKdLWYTHX3Wi5sjA9A
         XKLRGyPlxUBCJhpaSWJ6qWrk3DODBhcVbH0SwaLVKrgedTYlUZCypj9M7j+zAFd/FSUi
         sPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705561250; x=1706166050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ja3NjhzUxaN9vb55EZbmkGx8uUNSqsAw4jMXpFWTNpk=;
        b=MuxairU6XImWedUp5nJQYemESgAyuU5kFElGLMuKiGjVMKKgqkT9wQt2Y/pUhy8X2H
         /gMcnOe8pJW+ywPztR/ux68kjVsUORF+N4ONUKfDxXFVpSML49w+EBZUW6ueU/HSSR5D
         oROgn9hPm7LGSuhZhZZeH0mI0xDdf+lcAEmHmpTUa5pSOT77br+WUuWi+f5I+hingC2J
         uJxabMbhSPv25OJtJ4Zq5CXb8zz7ab7eHN6L5GOVd8BfSjnaQLhZyUVg5GSswoxVM73w
         AYH9zOKtsyh6DS9qN9KgpLBU4yVIxqpMRf1ericUnSSqwzlotV175cb9wZEC8aHU7ntA
         qobg==
X-Gm-Message-State: AOJu0Yy8FaPZQUDl8wDv9s85A6uMsmzryhQkBBLYimZEOXb4BGCuHl++
	tmPYRWvnUfP7L/g27dYAnVbZD6ppKBhW63OWSDqpfLWmM+mwloE62sDiiZAxJ/c=
X-Google-Smtp-Source: AGHT+IFNJ/Xcxkfr87pgOh4oAf0yYZTn64GpQ1TTx7VNwL/jnChKuwN69PElqWR9TzMgwAHQua44SA==
X-Received: by 2002:a05:6a20:1604:b0:19a:8556:8caa with SMTP id l4-20020a056a20160400b0019a85568caamr346558pzj.13.1705561250389;
        Wed, 17 Jan 2024 23:00:50 -0800 (PST)
Received: from [10.84.143.118] ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id lc11-20020a170902fa8b00b001d40cc2c9c3sm705820plb.35.2024.01.17.23.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 23:00:49 -0800 (PST)
Message-ID: <c20484bb-fc79-5e29-611b-9547f11a305a@bytedance.com>
Date: Thu, 18 Jan 2024 15:00:43 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [External] Re: [PATCH v3 00/19] arm64 kernel text replication
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, corbet@lwn.net,
 will@kernel.org, willy@infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, root <root@n144-101-220.byted.org>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
 <Zaeg4jw3TFBUBL8m@shell.armlinux.org.uk>
From: Hao Jia <jiahao.os@bytedance.com>
In-Reply-To: <Zaeg4jw3TFBUBL8m@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/1/17 Russell King (Oracle) wrote:
> On Wed, Jan 17, 2024 at 04:53:38PM +0800, Hao Jia wrote:
>> Many thanks to Russell King for his previous work on
>> arm64 kernel text replication.
>> https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk
>>
>> After applying these patches, we tested that our business performance
>> increased by more than 5% and the NUMA node memory bandwidth was more
>> balanced.
>> I've recently been trying to make it work with different numbers of
>> page tables/page sizes, so updated this patch set to V3.
>>
>> Patch overview:
>>
>> Patch 1-16 is a patch set based on Russell King's previous arm64
>> kernel text replication, rebased on commit 052d534373b7.
>>
>> The following three patches are new in v3:
>> patch 17 fixes compilation warning
>>
>> patch 18 adapts arm64 kernel text replication to support more
>> page tables/page sizes, in addition to 16K page size and
>> 4-level page tables.
>>
>> patch 19 fixes the abnormal startup problem caused by module_alloc()
>> which may allocate an address larger than KIMAGE_VADDR when kernel text
>> replication is enabled.
>>
>> [v2] https://lore.kernel.org/all/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk
>> [RFC] https://lore.kernel.org/all/ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk
>>
>> Please correct me if I've made a mistake, thank you very much!
> 
> Note that, even though I haven't posted an update (I see it as mostly
> pointless because *noone* commented on the previous posting) I do
> maintain these patches:
> 
>    git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/ktext/head
> 
> currently has them against v6.7
> 

Thanks for sharing the information.
Would you mind reviewing patch 18 and patch 19?

patch 18 attempts to adapt arm64 kernel text replication to support more 
page tables/page sizes
patch 19 fixes the problem of abnormal startup when kernel text 
replication is enabled

Maybe you have a better idea to support more page tables/page sizes, any 
suggestions would make sense to me.


Thanks,
Hao
