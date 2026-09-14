Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B82D46A1
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352421; cv=none; b=qDtwXtm+A9giWW+dAmGUwM/JXIcThGEMEmDZ9vkAZZVnfKb6wOOgs5zcGsrG0JBNsjA1iBSc2bJiApReTXXf+KTFXS442CQl32M2F/R6aE1j6Hdw7a6AgzO7ggmPFeHLa3dWX14bEKZ5NFyPfvCb1GaMt2H2QhdVzIAO0lf34S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352421; c=relaxed/simple;
	bh=ItUAaJ9Wdza/1n9xkRWUnVpV4ybgd/bt14CQdsSCP4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El1Hewcq4Fm+cHxpH/L048ljwRgAOX4AEqwTLKi17PGtqv/5piGUvXnf5hD2a4YZz7pyVZS57tbGzTgGu8zWxaVvR7KiDetEcPPJSfvFp3MShfTgl6dOnoqH/NidA+kIcqrdqEM2Us8NUumzIb2SmWD+YEvzi+ix2DbNSQ9p9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR4ywe9v; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR4ywe9v"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6e954afbdso20911205ad.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 19:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352420; x=1789957220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=fR4ywe9v9RJefE+ErUkWfj95sPw9OQCOjr2bej5J0TvYTI72F0GbEdP4AAey3sCRlm
         WY/pnZJNZvFqjKGX2rvpq1H2HiJeBLOt6NIOS6Cb6cTKVAF0hQ1XCye1Riv1bwSxatkr
         92R3aSOLMt6d2hQXR4zCM1On4uo97x7h5URPj4tGR3WBaskEmPOdcaVm8WfYdgarbfYT
         UVOHeiIQU9qq5J0jQt1wUIPBjKAwUo6XEhEtN/wbItDdiSY3vwSseEG9TdkVzXEoS5md
         GAfvoFW6Owcg/i4GAMSxdWfe4T4rAWe/EPZViIRP3+ltCBLv+yRhBoE0W4V9357KzhUc
         pwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352420; x=1789957220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=IGKmJWJnjYtRPXJ1BSq+aDvstZYvOx7VKA1JujLQ3XKDFewicu2T7nfZg+b9AjeaA2
         38QgE13JU7Ghqx9ii9rGpQ560qtAWSoCWCLWW5aFPciar4wHqAmoVOozdHSfIk6THFef
         DQoztON8uUMqwT4DVA6dwbnxb7PhxziPYQ2jREN1QwDzRg9xAJtM9uflsXdnIxH/Qwaq
         BTOs0du8VEBfeeZAzfNVJ0uCW1V10Ke9fAJRA96BmYTwc7nICSnLdScaCObPMcn3TImT
         YTh6NCfpf7Hyvq/DNzOUj2NUF+FNJZDgINommcOqyDp6J5Vx6DpFzpgE8MjKntGcuplF
         7MOw==
X-Forwarded-Encrypted: i=1; AKwUvBx8/N4HG/99vW39qu/z0OCXnUmJLiQ77hBO+sI00VtdEovTslwiZSUiCW8cySoUXqM1AN7jeHwXYKY=@vger.kernel.org
X-Gm-Message-State: AFuF++lUq9fudE/TbHZgmdufUkBK9Sg2TxNYQ2NELFR0pS09Xv6TSdcw
	h3oYn7UidN0qCUfZ3xlPMaBSYm6RUxRcIKdtsp1+8323MDNFbC4867SJ
X-Gm-Gg: AYBFou3P4WTikEhDOmqXgGeCmQBwTF3ZjRfC9ySWY/b85eqj4vRs12IReV1xdCRhNc6
	+5x4nA1hbsM5eATPmQcVMjait0DaCxoLzlTUB8Rdo7Yvgf4JVCZ95fnFMoLfH3xlmlkc3kPYNkJ
	H6UTdQhr+FSORsMt7PixaNHuNPPeYy6Oodwy7uU5iApt+b7Gs6gKtWIhePXGbJA54kS7Qn/noH9
	/shkzXlqW3QWi7QzJTCoFp3jEc0hIkv8mmdHkiQOXrSB3WA9gYC2vIaxHEqCWk0gg275jGTZ5FJ
	Jn3RtrkqPVuf6+8wYeCN87NF/92NF1WNrzjXDgUKiE8Eb6cmjPfqf/tyzuIgk+XmLZw/SSKN+7u
	YztJUCzfCL++bu7YzoQrqCf4K5AY9F8jVwkJ5jznWdcQ15pq5hSth7UJE/U7CWlpUwka5Y7o69s
	Q3QOiyI9QY/ELA6V5k5y0kqa9r4NDri5mLDIK1wHYTnIYUKX+L4WsqfGSqiKFShJe1zgYaMsr+T
	SnJqxqr+Obyl0jngFajyX2LEDlppX/MBS4zRpGt8TPEUwEJolXfQBIlnw==
X-Received: by 2002:a17:90b:17cd:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39debf88a21mr1358455a91.1.1789352419921;
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:2e70:b8cf:e0b4:f155:e178? ([2607:f598:b3da:2e70:b8cf:e0b4:f155:e178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm22496831eec.13.2026.09.13.19.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Message-ID: <99263485-90d4-4321-a434-8c6d1da6b53d@gmail.com>
Date: Sun, 13 Sep 2026 19:20:18 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
To: Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Mingyou Chen <qby140326@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
 <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Language: en-US
From: Bozhen Peng <bozhenpeng93@gmail.com>
In-Reply-To: <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for catching this. I'll fix the underline in v2！
- Bozhen

On 9/13/2026 7:01 PM, Randy Dunlap wrote:
> Hi,
> 
> On 9/13/26 6:12 PM, Bozhen Peng wrote:
>> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> index 9e86ecc29..fd966cf18 100644
>> --- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> @@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
>>  Introduction
>>  ============
>>  
>> +MECHREVO WUJIE15 PRO (HPT) firmware variant
>> +-----------------------------------------
> 
> The underline should be at least as long as the heading line.
> 

