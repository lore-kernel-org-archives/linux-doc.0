Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7639419F
	for <linux-doc@vger.kernel.org>; Sun, 24 Mar 2024 00:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711238756; cv=none; b=I7k9hRQ0Iyr4EHFJ9n6wQ/87KPoDKSMQ6EfkhJrlB5lE4IrHfCfUlefCFROBHuPGICL0Ylhf/cFBKmR2Omy7YxjRBrwxUfkWPPdM2ZL1kZSArVcT6mktDaYjdVFRye+WNJ44UxxZID8PkJA2XTLyR/tqhAB8zN+SXyHPG4Y3tAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711238756; c=relaxed/simple;
	bh=tngAzZ2uw+xwj08I+ekVrAMXofBlAHSMcxSqDMnDh78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6JuBl/ZS8KIy+vEEGpmwUZD/4fdSlwd87oWEb2sXphm9LS2G9D0sbuHx/mKjqQSy4W7jpMnPrJnDxtdEkFczD7ru1Ld6ap4dngOYWPyhOfQHXO3Fx6yiXEoYyjBI1Yqal9QtU4YLWwS1yCar43wVKqTJe/0+YPJdQ8r7hlcmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEq14zZE; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEq14zZE"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso1917575a12.0
        for <linux-doc@vger.kernel.org>; Sat, 23 Mar 2024 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711238755; x=1711843555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALK38+I0UvcAAMsMgAr4jciw/dKag37Qazc9QyOqYrY=;
        b=cEq14zZEAvU1J8C2nL2g7yYbvRhkiNl7C1hYjuGp9yX6wCy8YC5jtNiIqfNHWMT2NB
         /I8qMyMUlWuY3e2bX5KQE+Bd8dM+RwGyHM8KKGnA0ntrl1xteogBa7YvO6+IG4zo0970
         bx0N8y4Q/lqJpsCmW2Yyk+MxSKRLeacNsByMSca/170NuTx68GA9op5uGa49iXGVJDEN
         oYc07+CgFZdfc+XbrUm9bApVEJOpnJRcJhDYXxcEU7wyKa3PDo3JDsbc/oLs6VhMgD99
         S/zhQ1aQwOJMRXsdgYP+3oXs1xzDUmmxg+RtV43snt83l4UwGPlcnVjBs9DcFOwbFRVl
         k/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711238755; x=1711843555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALK38+I0UvcAAMsMgAr4jciw/dKag37Qazc9QyOqYrY=;
        b=gepVSO8bnmnl+zA9V5dlRRQSM9nKPrmc6K3d03NCa7mQGdeu61u/eIrreUgKy4hgyh
         CgHYubfmTn5YM3aOasHzeAIai0q9OOavRY3xFyUiF7UR5UkLstWbn45nWIDZevCmQWRT
         kxkSHfSp8ANa6oIX4fHkDTgsrys0vX0y9q93469Fa7L+KlijjrpIa1NPb1pKmJK6QP0E
         9OzJhEHJ5TowlUU7+PuZHY8jpKY5IotjKyY4/MxKiC3Vb49n+5WsMfAeXB8oHYykWFX6
         w/Ge9j7oixi0cJ59J2yShpcSK4N9YLLTjfMuQ9vWfy9XP1M8CwsLuYvOxxH2iWujOKYa
         qu0A==
X-Gm-Message-State: AOJu0YydY+Qe13mvgHg7eCWF2WSakDh2kf1WyH2mCXE6S7ZHTaU/yGPS
	l7YUd5mswoqBGJS3QrpDPVSKHNoMDOHkdYbxkcMBJ2ujEZD/HNj5
X-Google-Smtp-Source: AGHT+IHOnzggpQ+DqbURNm00LTjXfY8/ZfIacUJfpf6bFKj+t3Ok7cyc+6GwYSkteObMA8Uks9isdA==
X-Received: by 2002:a05:6a21:3293:b0:1a3:ac75:2890 with SMTP id yt19-20020a056a21329300b001a3ac752890mr4416556pzb.46.1711238754604;
        Sat, 23 Mar 2024 17:05:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b001dee1e0beddsm2114461plg.246.2024.03.23.17.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Mar 2024 17:05:54 -0700 (PDT)
Message-ID: <8361afd6-ac80-4d56-9620-961a7a16cfa7@gmail.com>
Date: Sun, 24 Mar 2024 09:05:52 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Detect variable fonts and suggest removing them
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, =?UTF-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?UTF-8?B?0Yc=?= <relect@bk.ru>, Akira Yokosawa <akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <b6235333-5142-468f-9f59-4454ca8531e7@infradead.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b6235333-5142-468f-9f59-4454ca8531e7@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 23 Mar 2024 07:55:52 -0700, Randy Dunlap wrote:
> Hi Akira,

Thank you for your comments, Randy.

> 
> On 3/23/24 05:02, Akira Yokosawa wrote:
>> xelatex doesn't understand variable font format.  Recent deployment
>> of variable Noto CJK fonts in Fedora and openSUSE tumbleweed breaks
>> builds of translations.pdf.
>>
>> To help developers work around the build error, add a script for
>> checking existence of variable form of those fonts and emitting
>> suggestions.  Invoke it in the error path of "make pdfdocs" so that it
>> is activated only when PDF build actually fails.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Reported-by: Jonathan Corbet <corbet@lwn.net>
>> Link: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
>> Reported-by: "Иван Иванович" <relect@bk.ru>
>> Link: https://lore.kernel.org/linux-doc/1708585803.600323099@f111.i.mail.ru/
>> ---
> 
> [snip]
> 
>> ---
>> Cc: linux-doc@vger.kernel.org
>> ---
>>  Documentation/Makefile          |  2 +-
>>  MAINTAINERS                     |  1 +
>>  scripts/check-variable-fonts.sh | 30 ++++++++++++++++++++++++++++++
>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>  create mode 100755 scripts/check-variable-fonts.sh
>>
> 
> I don't have much to say about the patch except that it seems like a good idea...
> 
> However, some of the terminology could be improved IMO.
> E.g., "variable type" or "variable font" should be something like
> variable-width font or proportionally-spaced font.

Good point.

I need to be more careful in using terms rarely found in kernel development.

In this case, "variable font" means "font file which employs the OpenType
font variations technology".

There is a Wikipedia page at: https://en.wikipedia.org/wiki/Variable_font

> 
> "static ones" should be something like fixed-space fonts or monospaced fonts.
> 
> Unless I just completely don't understand the uses of "variable" and "static" here.

"static" here means "non-variable".

I'll expand the changelog a bit in v2 with your comments in mind.

        Thanks, Akira
