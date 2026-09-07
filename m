Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E6C36D9E0
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755971; cv=none; b=dKc6wxbPL9Ymx1iQyaS7nHwhCP4DKUub7Yq2qTlhPstXr+G3mr15XpNbG1eugmc+Amj2vg/xiS/eLd4/xI9GSl2rfJdJTkh98/SLX4c0wzLntCOoYwCzYmFV2+ifKekyq2SyFkPxKZATbmFqgFFuWJ9Gd44rMIsG6AutsMHvn24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755971; c=relaxed/simple;
	bh=FAIaPSs0V0CcPDhWeBxWIleZktmBmZFUFFM6MfeWvxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/ewueRQoxnBfJKP23i01rcwrAAkj63glpeyMok00PhaU0ujaD7CUvbBLjkFqqcN100T9erlJ1Ev6rls57GCAbqOrAF53sMwPjrApFjJ0Ke1W3V8LIbYfg24cZostF+8+NFdkV9BXlowGnHQh8Es9G1SS/8iIBvZTItAlqt5mHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0SVwy9M; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0SVwy9M"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2469870a91.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755969; x=1789360769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ptd0bYwTWHCku/lzL1/Eb/MaxqoonZrCLfmNls8yeb4=;
        b=Q0SVwy9MO74Pd4BEMXgbhN/8yGcvCOl+LmobKtaxX48MZhqu2Ipxmr2DlyXUWogie8
         WKUh9V4kdZQYJ925qvlhMuN03ekP15Q2qBgT99rk9lo4qv+8b94x8LnjD6SrJALxMzbN
         dgNiINgPKjf9VzjrZQBFFI5pBhAqAMrHRU6G7QU+1gg7qSz+Niez53WPj3iyEtcjhs5w
         XMVEsUhcDxkaVtlbrKfTQg4jCD5STYui+0zdmqnZMGuC1Nbh9X2qYjc12tu1vLzQ4Kkb
         AjysKI+c8L6ctqBG1EpJvSlPTrt5XUwbNnrSIbUEnv6YTflPVXc7QpreS8kMInSK/XrL
         ho4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755969; x=1789360769;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ptd0bYwTWHCku/lzL1/Eb/MaxqoonZrCLfmNls8yeb4=;
        b=cT+wPKzUymYMa2gAgnxjImhL7wsf+z/TNKf0EN6Xi0jgTgYiBAvCKoYssTBBk6C+9D
         AXl+R9lZ7Mwq0zYpb1lfd0ERuOsgbFTlGq3zevcyWojDoRX3MKVlJPFwNfAB2t3lShjS
         RD/Uvlvzq8zdchCvMh0IQoQARygsl+Disgp3mwUDDtMIasNcy2GvxE+TK7UL5q/1IOLH
         rfmW73aePzrCMF6eWD/WUX+7RCqOPqEZSpkPwx7CuFhLQL0h/Ky+7w4fLy8UZmWZDap/
         d8/7+qcUIfcBWKCIQa3F0DDS54nwPUm9Y2bJJV0Cb3Jr5oEtFbLehEockr1cX3dRcV9N
         JdQg==
X-Forwarded-Encrypted: i=1; AKwUvByE17aNXCNFjbcmx7K6uurA3ZebIBzWvnDMnEeb1wO6cz75bSKAERLRbQKndX9NzGIdUW2D1DuHqhc=@vger.kernel.org
X-Gm-Message-State: AFuF++mRWBa0uMx3QG3m8Pmijouqh6qyR9wBx5DywVreZ1zvCGVAxk/E
	aqJs0PAGwbypan3+gTrMJo/VABmsUHxzwbGDReaE20S/g55DoLT0hztb
X-Gm-Gg: AYBFou3eppT64MbDcOyLFILmasIR+2MYC4p8/w4HJySiG4V2pfaCOhPYjMVd5U2/4YE
	IcJiuKADEh1GltPkw1mDis/v20kqWdKAqJ3XZdttGeO5r6qs+GrxcD63rRFGhmHdRKqkmPOaST5
	n2JgcLCztb8ptJoChluxsfUNLA0/E3JjsnfStyJxybv3b0+9nKGn9j/MzqTwiTIjJje5yl/HYOc
	XOUyu0zQYWm5FV8R7UBnWQbGXMBOXgcrUqNAPXEbD+hNPtcXrcM/CDepzmdOE8jrvVE+CKFKtaH
	+RWeIb/8/aEkLFCFRsH3zm7zRfwig4I1V90V1f1Q20CeisK4Ez4P5Ev6kKFQd0cNaiT10MqH4B0
	SXcUq/Ps83UOxEf4q3G4VRabGU1bCqlvtVIgfEcQM7DQQ1MPwa0sVSH5AzsTLG5iocTx4iamZQw
	rAxUWFZFNDlkvZ/osfvQ49tPG975AeY4InE3Sh9qTnj8a1uADqzEifA62w0bw7Lgy4xCgUMD2by
	v7jS6/k8tj7/YE=
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr32376800a91.21.1788755968878;
        Sun, 06 Sep 2026 21:39:28 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm18014444a91.10.2026.09.06.21.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 21:39:28 -0700 (PDT)
Message-ID: <6dcf7822-f3cf-46c0-af04-2964f8b3381a@gmail.com>
Date: Mon, 7 Sep 2026 12:39:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] docs/zh_CN: Add Chinese translations for five
 networking documents
To: =?UTF-8?B?5LiN5q276bifQW5rYQ==?= <businiaoanka@anka1.top>,
 alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, wy@wyuan.org
References: <20260824043806.46731-1-anka@stu.cdut.edu.cn>
 <0180CCC46BD8F82B+2856576.mvXUDI8C0e@anka-20eya00ycd>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <0180CCC46BD8F82B+2856576.mvXUDI8C0e@anka-20eya00ycd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!



On 2026/9/7 11:02, 不死鸟Anka wrote:
> 在 2026年8月24日星期一 中国标准时间 12:37:59，Siwei Chen 写道：
>> From: Siwei Chen<businiaoanka@anka1.top>
>>
>> This series adds Simplified Chinese translations for five documents
>> under Documentation/networking/:
>>
>>    - team.rst: Team devices driven from userspace via libteam
>>    - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>>    - driver.rst: Softnet driver issues (probing, close/stop,
>>      transmit path guidelines, and extack error reporting)
>>    - ipv6.rst: ipv6 module parameters (disable, autoconf,
>>      disable_ipv6)
>>    - secid.rst: LSM/SELinux secid usage in the flowi structure
>>
>> Changes in v5:
>>    - Use direct link instead of ":ref:" to fix the warning of
>>      "undefined label" in the translation of "sriov.rst" since "switchdev"
>>      documentation has no translation in the same directory.
>>    - Revise the commit title: "SeLinux" -> "SELinux".
>>    - Translate "flowi structure" and "flow structure" into
>>      "flowi structure" uniformly in the translation of "secid.rst".
>>    - Link to v4:
>> https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.edu.
>> cn/
>>
>> Changes in v4:
>>    - Fix two minor issues in the translation of "ipv6.rst" and "secid.rst".
>>    - Link to v3:
>> https://lore.kernel.org/linux-doc/20260811071200.54062-1-anka@stu.cdut.edu.
>> cn/
>>
>> Changes in v3:
>>    - Remove spaces before and after "（".
>>    - Add a missing space after "IPv6".
>>    - Update the translation of "secid".
>>    - Link to v2:
>> https://lore.kernel.org/linux-doc/20260727073538.56951-1-anka@stu.cdut.edu.
>> cn/
>>
>> Changes in v2:
>>    - Add translated documents to corresponding index file.
>>    - Link to v1:
>> https://lore.kernel.org/linux-doc/ 
>> cover.1784866896.git.businiaoanka@anka1.t
>> op/
>>
>> Siwei Chen (5):
>>    docs/zh_CN: Add networking team documentation Chinese translation
>>    docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
>>    docs/zh_CN: Add Softnet Driver Issues Chinese translation
>>    docs/zh_CN: Add ipv6 Chinese translation
>>    docs/zh_CN: Add LSM/SELinux secid Chinese translation
>>
>>   .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
>>   .../translations/zh_CN/networking/index.rst   |  10 +-
>>   .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
>>   .../translations/zh_CN/networking/secid.rst   |  24 +++
>>   .../translations/zh_CN/networking/sriov.rst   |  34 +++++
>>   .../translations/zh_CN/networking/team.rst    |  16 ++
>>   6 files changed, 293 insertions(+), 5 deletions(-)
>>   create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
>>   create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>>   create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>>   create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>>   create mode 100644 Documentation/translations/zh_CN/networking/team.rst
> Ping
> 

