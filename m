Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323456D1A7
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685828; cv=none; b=gLe3SYgyVAC8Uys9VCQ/pbTB/Nn4LFTZJTLzuzDMDzx+SfyUzOyYjppPiRAMQNDR/AVkRnI4wNuL3x6ht1HxL5oLfSr8LteFx97Wxny6w7HsPaEpSCS61y7AaDOYT5gJm9Ja0WT7yS8PiTOG8q97f1BUVoyNnD6czoMAFuu3Fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685828; c=relaxed/simple;
	bh=1I9+Pj5YQSChf3iBDwOVDQ5DkCm9d8fa1LEnpkGTDlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyT1d7CN2sn0Ya8iOH2nLvfJUuJ0S1TjnkGg5O0xcgX4tRjaEBi9uh1t89+DqeqfOG0aPPYAsy0M3Y9ChHuZ2lGQ7Ne2Mc3h9EIj0KK8+ZkRsqS/RN+MSGNw/Wo279xDMWRPKQnXZxdciK1U/1foTLGNI5Jz1sc8l5X9siMIUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDD1fCTe; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDD1fCTe"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b54acc8c96eso683492a12.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757685826; x=1758290626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1QxBTlE7wBHAWIKlSIVw+tKYZtGp4FqMWgYg6ZMy6M=;
        b=FDD1fCTe0boeNQMn0OkkSqRGKuFiBhKfXtBambUo4DvrRts4OvHU9pCRWOEzjhcStI
         xbmOOPlNyw71Fk/BnXI4mE2k5GtA/1e2qYfWWWLFU9QUhi7WdGlZtMEAhjXrSthCqBAI
         50U8AUTMJMeonlPSJyc+K6qfTBXcqwkYfbmKX0/ekdK7VrERh5R5ysvygHhmbBhNBEkE
         FBum+0t0IRmmMjzzx3volw4q2NhV/uTIogsKMJUATZ91D6sthep3kS94OjB0nkMuwWrE
         /vx7BE9rjZv2DXai6D28c9+20oqwAUxseecxziMeG2kKIDhqHDFptyyflDNBRALkkTND
         mDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685826; x=1758290626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1QxBTlE7wBHAWIKlSIVw+tKYZtGp4FqMWgYg6ZMy6M=;
        b=C12cNEHu2Svwc2VZsBshaoJJ8MWGw8xkmKJRM20YkFSOTelknLu3XVK6FAhX23dHvm
         h8ZWXCaTbtMO3piHotbEl9hn7fiiiOP1A1YQtaz4SM64LdSifgfgVhlxNmuOr1imeYrl
         t5kNbbP2jA4vPuLB4H953PmpkqOXZLTMl5/T3oOfLo+4SuwO11b5BB55rmxYourVJWOQ
         CCKR9+6wNWLUoSp4l+3g5f3VClBH+Nvt6+gpFokomB0AVJBOlV10gwa9BFT+1aM/XQWN
         Td+/gx/c2AlcZGttzeFJrppPmRNmdZAJFFgQ33c9021Pv+2HfdktvOsV59KYjZYReXsf
         RaKw==
X-Forwarded-Encrypted: i=1; AJvYcCWa2BB+CkUbcdvUFkHWbIgTMmJlpbTzXaWDYIRg4c3xT24Fpcj3IK2/otqdsLkKZujTdW1Av9Kfduc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCDHa0XBpaI0kWkcD1EaBcW8cGkiDZLmNKSWZZN4/DUAyuHeI
	+S/Mi/SckGv5Z1pdJ2QxTz95l1HuiXxjsyLv/wI6MrOGANSXKA9RRxVx
X-Gm-Gg: ASbGnct0wol9OTswRdujF4jlKUewF0ErETB4Zy53RbSq9TWkNkx1hU9VIJ1sKhARsvJ
	wfsyv2l3pA2eDCKRz6aEssUjV3aX8MrSIDHqOFNhZTwETUAmc3DIHOyDRnTGUDEhep7vtGjLlCE
	5hBMNBQiKyM08egjxTHq8t4Xefhqw0j/b1yykYmqfNgNu/Ct4QUTWmv3+u1HzmsfByMhp/DqDPS
	R7WvEuYFPKptFt5eGYQmggrG0SNTiVuRCPdXklePY40ZU4GiFXPLWATJg3jgzhgAbXO2VHg+CsS
	2O2UO3nQKyHtGTvPB2SAeXwarzhz6FR/urmd1Vg/m60uaL+k7iSNE+ht46S9N/Kw2wrvs9BcMGx
	br3MKnjG+yYPA41TzAUwtXCp6IM4r6xC2rp2NMjEn2LrnNwGS8DJIlaFIgVrccNVJbuo6WE32eN
	PlFeQ=
X-Google-Smtp-Source: AGHT+IG5X1Gan6zjQjJMTNF/rCRnIvsPNEFCkkjRGBaWPrcJK0WciPjQY9PjPdMsK2clZM3/U1Sepg==
X-Received: by 2002:a17:902:ccca:b0:25d:f26d:3b9e with SMTP id d9443c01a7336-25df26d3c13mr21633615ad.11.1757685825575;
        Fri, 12 Sep 2025 07:03:45 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37293d12sm49743615ad.39.2025.09.12.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:03:45 -0700 (PDT)
Message-ID: <f3d142be-3980-4d4e-9d66-c03276694bf9@gmail.com>
Date: Fri, 12 Sep 2025 23:03:43 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/19] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, jani.nikula@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, tmgross@umich.edu
References: <20250910153334.0b3e1440@foz.lan>
 <28c45f53-a3ff-428f-ba99-ebb09e0581d3@gmail.com>
 <20250912130420.6c14dbbd@foz.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250912130420.6c14dbbd@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025 13:04:20 +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 12 Sep 2025 19:15:44 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> [-CC: rust people and list]
>>
>> OK, Looks like I have to bite.
>>
>> On Wed, 10 Sep 2025 15:33:34 +0200, Mauro Carvalho Chehab wrote:
>> [...]
>>
>>> The current approach of using LaTeX for PDF is dirty:
>>>
>>> - Sphinx can't produce a LaTeX file from the Kernel trees without
>>>   hundreds of warnings;
>>> - latexmk hides some of them, but even it just one warning is reported,
>>>   the return status is not zero.  
>>
>> This sounds interesting to me.
>> As far I remember, I have never seen such strange results of latexmk
>> under build envs where all the necessary packages are properly installed.
> 
> I saw it here on multiple distros including Fedora (which is the one
> I use on my desktop). Media jenkins CI running on Debian always suffered
> from such issues, up to the point I started ignoring pdf build results.
> 

So please provide exact steps for me to see such errors.

I don't have any issues after strictly following the suggestions from
sphinx-pre-install under Fedora.

I even invoked [...]/output/latex/Makefile manually after running
"make latexdocs" by:

  - cd [...]/output/latex/
  - make PDFLATEX="latexmk -xelatex" LATEXOPTS="-interaction=batchmode -no-shell-escape" -j6 -O all

, and all the PDFs were built without any issues.

Quite puzzling ...

Or does your Fedora have some Noto CJK variable fonts installed?

Hmm ...

Thanks,
Akira

