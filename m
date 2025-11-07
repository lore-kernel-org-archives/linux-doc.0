Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39E2FF64B
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 21:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762551214; cv=none; b=ZXXAfTYM3P1pKUZUd3XycuuO4HWEuDvKMWZzf0iFmzgAh9XnVr2YHZFoRUOpOsFvBvo/qkVuIKRKOF5KleFRv1Vj0G2KNoiufqKMteIH0XrFGJQfPhhYcVIksp5AyeEb5YV6sMlWWwcPq5J7BfUQJZtKJLtEpcqOz86ZvO44+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762551214; c=relaxed/simple;
	bh=3bLuZjbkJUNNf7eCMd25mCNiQRx6TxP1DhdgShNskEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRdqvvY9eR3z31UMnvjvCgKDB6nGusPgdyg/kHiA5UxFOE8+4PaMRvqaVFp78v5TvHKO2liYjZJjl6qHYEirBFcQracc2IJSDgz8FFsxuQRboixWYqiy5F96POx94EHAtVn3jwmlbJf7rymWktYIAYfboNLvY+E61HVEEYtyMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jAUcoTKA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jAUcoTKA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cmdm8IS/le98Syh35a1KL9O23CyEpXLnI7cmobL4+5Q=; b=jAUcoTKAH4zRi7XGKbwClsdK9o
	MhDLCy/7eqO+V07wwKEIQAUyssFOSM9yn1OGuMlufVnLqF7wUUSpqvMK638gvPeogQ0EJPUP1eTe8
	DvQGql4IgE6Se6qgusezO9A6qIpA2nswbHMUNX5hBncu4zbmukrTQNI4y5yDKlFmVDCAMcEIMlfqt
	KBOAY5ceDEIIosisgrPLoW3g3u1xntVN4gsS12J7eC4l5Bt95OzMdtRrcN9tClzG2seiV9720hzgg
	y4D36beVaIT0nan+F2xloKimOEpXaLlthpELgZ//XMSJRBWabhEBSkG0p+2WQUzil2ZNBHiMG6NSH
	2tbxvqgg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHU5M-00000001Agw-0YpN;
	Fri, 07 Nov 2025 21:33:32 +0000
Message-ID: <71b341b6-fe88-4f32-9d6e-992b1642ea8d@infradead.org>
Date: Fri, 7 Nov 2025 13:33:31 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: about make mandocs warnings (1)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
 <20251026085906.2d7e1d70@sal.lan>
 <af5d13a3-54ae-443b-bcc4-0b7de2f29ff0@infradead.org>
 <20251107071556.7e2b8f96@sal.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251107071556.7e2b8f96@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/7/25 2:15 AM, Mauro Carvalho Chehab wrote:
> Em Sun, 26 Oct 2025 09:43:34 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> Hi Mauro,
>>
>> On 10/26/25 4:59 AM, Mauro Carvalho Chehab wrote:
>>> Em Sat, 25 Oct 2025 16:49:21 -0700
>>> Randy Dunlap <rdunlap@infradead.org> escreveu:
>>>   
>>>> Hi Mauro,
>>>>
>>>>

[snip]

>>>> Note: hundreds (probably thousands) of the mandocs warnings would disappear
>>>> if kernel-doc accepted '-' in addition to ':' as a function parameter
>>>> or struct/union/enum member separator (like it does for
>>>> function/struct/union/enum short description).  
>>>
>>> This is easy to fix, and QEMU has a patch mentioning what is needed
>>> at:
>>> 	9cbe72b868b7 ("scripts/kernel-doc: tweak for QEMU coding standards")
>>>
>>> on its description: basically two regexes from Perl code would need changes:
>>>
>>>         -       if (/\s*([\w\s]+?)(\(\))?\s*-/) {
>>>         +       if (/\s*([\w\s]+?)(\s*-|:)/) {
>>>
>>> and:
>>>         -       if (/-(.*)/) {
>>>         +       if (/[-:](.*)/) {
>>>
>>> If I'm not mistaken, I got rid of the second regex during rewrite,
>>> but I might be wrong. If I recall correctly, with Python code, the
>>> change would be aon a single place at scripts/lib/kdoc/kdoc_parser.py:
>>>
>>> 	doc_sect = doc_com + \
>>> -	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
>>> +	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*[:-]([^:].*)?$',
>>> 	           flags=re.I, cache=False)
>>>
>>> btw, the [^:] pattern there seems to be trying to avoid catching
>>> "::". With the new proposed regex, and if "::" is something that we
>>> need to avoid, if one uses "-:", it would miss the description. 
>>> I guess that's ok.
>>>
>>> From my side, I'm OK with the new regex, but one has to verify if
>>> this won't cause unwanted side-effects.  
>>
>> Yes, for sure. I'm willing to do some testing on a patch.
>> Should I begin with the KernRe() change above?
> 
> Yes.

first report with the one-line change to KernRe() above:

$ ./scripts/kernel-doc.py -none -Wall sound/soc/codecs/cs-amp-lib.c
Warning: sound/soc/codecs/cs-amp-lib.c:574 duplicate section name 'Return'
Warning: sound/soc/codecs/cs-amp-lib.c:574 duplicate section name 'Return'

Without the KernRe() change, these are not reported (which is correct).
The new/changed line finds "*\s*[Rr]eturn" in a comment (without a trailing ':')
and considers it to be a Return: section.


> (sorry for not answering earlier... was in OOT solving some stuff
> abroad)

Sure, not a problem.

-- 
~Randy

