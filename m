Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587414600B
	for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715576940; cv=none; b=J3ZgrAUZnuGfSc/sCYzaDaBCWdeXlyCpPOdeTqS1vVRKq06SBl0NhBxpaP3tCG58Um1c28zlQlzvdwOZrU5wi6rh+65DCtMwD5AQepWylQUWKJdKYKQ2YEK/udoYAoFo+2z4nKmNf5ARsan2SNAluyhqesdKVAU7x5wLMP6tLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715576940; c=relaxed/simple;
	bh=c0qj7EO2hWgEdBmPmmYPtC+0SMkLGHRGOtPd1rOwpNI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FrroZE2WRN9flmVoeTPTqaVZSgR7fj0zQtJDcrMHGm0s1NPHyXL7EwXlO0KScTAUiIlHHQiy9Id5wOsS2QWowdWjwYMtYjkas6u/6nea7g9BVM1+hewRvs/wyANeedXUcv6DM6GUttGt4Ok2WF0AsrHTF1BYKI6lbyHU721qaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVQ5HLAh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVQ5HLAh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dca1efad59so3062593a12.2
        for <linux-doc@vger.kernel.org>; Sun, 12 May 2024 22:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715576939; x=1716181739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F4HDGDd0ermJAT0XKDnxdf0bpECBNtDSyUnxwnfurQ=;
        b=LVQ5HLAhwlFqRtpk26bh5dHyOhmrihAP8AlVRuEctmh+x8hWfWj5DSPUAdRo12HSYs
         jcTskv0mtZah7H48dknhepzl2Pm9p2oDcRRPKbznBStw5i78CYPwd0wjquFF3M0m7LT8
         gi/UFVJ27lnkpMFuapUd1gTNlKr9Q/4apvFliy2JYzECcGhW1sbJ3mpEj2d3gxUbHRFV
         fiB89IgTptp2k/MjDQaSkG9QNmmw+uEYwg4ebVqPvKFdA+oxIN/iPoWPHc/98e295rbr
         wpc608/44GjsSSHwnqwRGvfaq2axE9JFtaO89rBwfspGS1B2Q231DD9cRdkfwx0lDxkJ
         Su8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715576939; x=1716181739;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4F4HDGDd0ermJAT0XKDnxdf0bpECBNtDSyUnxwnfurQ=;
        b=p7rNKs4vYwPmkdLQv99L4LWr+NVWVSHox/wsfhCLqSmTL1iIidThO16VVqEwRlP3Iy
         Z5ETCa5UXhdcBqLY5/wUEqVIFtKfm6i26kh1D8BBuB3/j2TfeqVD81enpxAqUHlw89k9
         ooWdK33NSDnNKTV5ym5sed19O2l+MBc4dNJO6jLN1m0MswAM/A1dZDA5SNANMPnR2YyP
         jFUaFgA/x4N6R5ROVEOKr+V9o/QaQb2qMi7gif6E/Y7rpn7GY5M3j3Amh+aN46nnZpIV
         vIINCItissUSHN96xjbYbARTOtCDEeOKOeiLqFW9VnyTuO+GV0z+uR1lkcKSU5le8xDk
         m/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCX8BqEeC++zutU5MN9OceVkICgNzo0FznRGUn+VLbgnOcJSpiBdTMp4ovpJU33rBoNOoL7J7IGD//V2KfPml83N0wx3fr1nsYH9
X-Gm-Message-State: AOJu0Yzfk5oZscAZE+aZkABodTqHCateZzQV23oxZR3NxRJlJh+qNqBk
	4+WlXOvaDLtg937TEkUdI7I/gvMlKxgkCWv+rzpDIplfJ6LI1+2A
X-Google-Smtp-Source: AGHT+IEndHq4eaMA3HBondq+FZhOz3UW3nrh09Te4Zv+WBWo2eSkzbo9FXqYQH6iL8a7TQH2nUwx1w==
X-Received: by 2002:a17:90b:3002:b0:2b4:a57:4bee with SMTP id 98e67ed59e1d1-2b6cc3429c3mr6055158a91.17.1715576938759;
        Sun, 12 May 2024 22:08:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca547bsm8860212a91.36.2024.05.12.22.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 22:08:58 -0700 (PDT)
Message-ID: <be8b3af7-18bf-4bc4-9951-413d6bfb6796@gmail.com>
Date: Mon, 13 May 2024 14:08:55 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: didi.debian@cknow.org
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <2996994.g7u86YH9XO@bagend>
Subject: Re: checkpatch doc suggestion
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2996994.g7u86YH9XO@bagend>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 12 May 2024 17:58:10 +0200, Diederik de Haas wrote:
> Hi Bagas,
> 
> On Friday, 3 May 2024 14:55:49 CEST Bagas Sanjaya wrote:
>> On Tue, Apr 30, 2024 at 12:56:30PM +0200, Diederik de Haas wrote:
>> > I think it would be really useful if (f.e.) the following URL
>> > https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG
>> > 
>> > would lead me straight to the BAD_FIXES_TAG explanation.
>> 
>> So to add link to arbitrary location in the docs, you have to explicitly add
>> target (anchor) to desired location. Then you can reference it using the
>> target's name. For example, to accomplish your suggestion above:
>> 
>> ```
>> diff --git a/Documentation/dev-tools/checkpatch.rst
>> b/Documentation/dev-tools/checkpatch.rst index
>> 12796899584739..002b0aa68b8022 100644
>> --- a/Documentation/dev-tools/checkpatch.rst
>> +++ b/Documentation/dev-tools/checkpatch.rst
>> @@ -612,6 +612,8 @@ Commit message
>> 
>>      See:
>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#desc
>> ribe-your-changes
>> 
>> +.. _bad_fixes_tag:
>> +
>>    **BAD_FIXES_TAG**
>>      The Fixes: tag is malformed or does not follow the community
>> conventions. This can occur if the tag have been split into multiple lines
>> ```
> 
> Thanks to your hint and some experimentation, I managed to add id attributes 
> to the various ``dl`` elements and can directly reference the tags :-)
> 
> But I noticed 2 things in the generated HTML documentation:
> 1) The id attributes are all lowercase, regardless of how I defined them in 
> ``checkpatch.rst``
> 2) The underscores (``_``) have been replaced with dashes (``-``)
> 
> So instead of linking to checkpatch.html#BAD_FIXES_TAG I have to link to 
> checkpatch.html#bad-fixes-tag. I was hoping that I could get the literal tags 
> names (including underscores and uppercase letters) as id attribute.
> 
> Is something rst/sphinx always does or did I do something wrong?
> 

For authoritative info, I'd suggest consulting the reST reference for
"Hyperlink Targets" at:

    https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-targets

and "Hyperlink References" at:

    https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-references

, and other related sections therein.

HTH, Akira

> Cheers,
>   Diederik

