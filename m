Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0362D
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxwpRjEI"
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B12894
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 17:02:36 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc53d0030fso752565ad.0
        for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698624156; x=1699228956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PTmft0JlMHLfMqnzsQ/EQfttlgxRD47/P/YZu8JPJY=;
        b=RxwpRjEIlQr3R1UmPd1ixSUk07LUW3evHnW/Cl/psxdFv2juljzOPrubv1Y78cFsc7
         KiFXaYZ1Z77IlNaWN2lXRksPGE7zEQ+2kQZjbXjmbvzuCfcBSXwqXERCVZRv2OO6JKRV
         jl2Ukm1L0LVDm0ewNmU7g0f+Lz3f8DEjOvERb1atQ1oMZEhfXDONA8ohepn/PvmRJNBF
         hQTslnjjOPLpH7Yl/6DDU1uY6rdtk1M8Sj8xrqqTHuTIE3/mb4xHjLtWgBpEqxVdfL0n
         3M9QxdX7w3fW+We7BvB1YmZ7ReP3RDSvgFOPWryYqgLhKrRCvlRyj31QiZMeb9Hv/gIu
         Tg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698624156; x=1699228956;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PTmft0JlMHLfMqnzsQ/EQfttlgxRD47/P/YZu8JPJY=;
        b=S9J9Uj9dwQbyFadnZmfTR77V52lCY8XD2/L0ae7AMpADb51z9cMXLUffmozSGz/0/n
         T7FAu2SBwequWVhMx77PeWSYO4dqlUI8YQDsAsKY097+FTREyDn+DGP3YnruJTPcfiDV
         Q+t3qQv1OPB+gBR83OZU/N7pErGVWsngm73RiZaSi67v1f8wNStkcNPOQRmMznqPcqTc
         gsbnmkbjwPFlKlKy+t4LtzXiL3E6aKX5pjPm8GuOU8i8Ck1CM6W499S6gcp0ZxqVykrG
         d7p3gRzI3lqUKW95xOKxvJUnN9kLd2uOVfIou6ZQqJQMSE97adL4Y/KX3AbQDxGyepr/
         5/gQ==
X-Gm-Message-State: AOJu0YwzybvvEVFv+dIFnVkxkBfe1bOW7AUCDeWkEWE3t40xwiSUti6V
	oORDgjp7vJVHAy00yuS0YSs=
X-Google-Smtp-Source: AGHT+IGVJwzMgaVnk2ohcb8d0cpNEFNBQ4prSyD76h7ze5Iu0tN6vL97hDVtvuBcunoMhCxAkxz15g==
X-Received: by 2002:a17:902:e543:b0:1c9:ddd8:9950 with SMTP id n3-20020a170902e54300b001c9ddd89950mr10633604plf.21.1698624155841;
        Sun, 29 Oct 2023 17:02:35 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001c625acfed0sm5145703plk.44.2023.10.29.17.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 17:02:35 -0700 (PDT)
Message-ID: <645ffbbc-8b33-4a93-94b6-6487e31c7f4b@gmail.com>
Date: Mon, 30 Oct 2023 09:02:32 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 swarupkotikalapudi@gmail.com, yujie.liu@intel.com,
 Akira Yokosawa <akiyks@gmail.com>
References: <87a5s15mm5.fsf@meer.lwn.net>
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87a5s15mm5.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Date: Sun, 29 Oct 2023 12:06:58 -0600, Jonathan Corbet wrote:
> Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:
> 
>> make htmldocs has below warnings:
>>
>> ..
>> Variable length lookbehind is experimental in regex;
>> marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
>> <-- HERE / at ./scripts/kernel-doc line 188.
>> ...
> 
> So how do you get this warning?  I've not seen it.  Which version of
> Perl? 

I get this warning on Ubuntu 22.04LTS, whose perl is v5.34.0.

Swarup's change silences the warning there.

I could provide a tested-by: tag if I was familiar with that
"variable length lookbehind" thing ...

        Thanks, Akira

> 
>> "-Werror" option in make command,
>> needs "-Werror" to have space before
>> and after while running make command,
>> hence space checking is sepratly done,
>> and is not part of lookbehind regular expression.
>>
>> Below command also didn't
>> show any error:
>>  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
>>
>> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
>> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
>> ---
>>  scripts/kernel-doc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
>> index d660e1f4b483..aa9e3e198d12 100755
>> --- a/scripts/kernel-doc
>> +++ b/scripts/kernel-doc
>> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
>>  if (defined($ENV{'KCFLAGS'})) {
>>  	my $kcflags = "$ENV{'KCFLAGS'}";
>>  
>> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
>> +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
>>  		$Werror = 1;
>>  	}
>>  }
> 
> Thanks,
> 
> jon

