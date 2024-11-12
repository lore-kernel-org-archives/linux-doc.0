Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A74A1F7556
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 00:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371721; cv=none; b=BgphL4d+xIyXfqqggUmI8HNmpMeqes23M2Brji6QEN0+OvXzrxik7R17VTPputIDf435ovOYIU8VwzOZuXCojcmmsPS8CJcOtLc34r97SfkcSAOiePKv6PQtKM61oDI5LAwAj2Rkt9btVLKlavCWGIw0qtqCg48kM/KcFu0gpUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371721; c=relaxed/simple;
	bh=swpKj3a+UsuANQ/ZoLKZ5n+KlEUivKzsAu8q6b6fVlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9bXmVMok6zBY8/AOqvqqbLWxE9KeXvNluZDPGGDa1ugcLYmhYG1msMhGuN191v6X1znRvO6o8uIlx2MIctps0vW2T3rzTCFaZdI0g0SypEbbeL4HZM2j/D3IGXmbTipsyJyew1tZN/EFRWkmyjg566jRdWVw1OZmnxmdF0PTgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hr+eRubx; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hr+eRubx"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a6e960fb5dso18607555ab.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 16:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731371719; x=1731976519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2RamCiRbvufmYpTkLSPafjrY96FSeVA6M3qaZiwKq0=;
        b=Hr+eRubxLASl+09M+89B0vUptX0MMk0iKEyqfmUJoueXmLWPQCxUJomDRjG4oqSwye
         UVbaNuiV4BusJB1yxUYRM5PnaWEjhugv6LFDhqQ0qGFXGlcJmGRMyMhzzrxfPgHXps+p
         oJqqQ7a6Lw5DO3NsfbOU32BfyTWyWDbarbNqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731371719; x=1731976519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2RamCiRbvufmYpTkLSPafjrY96FSeVA6M3qaZiwKq0=;
        b=dYHNd89MTU98j+U8jvuUf2digrUGhpW+4JfzBN9TW14oNjWZ+/ehD/C7dZGNyFLKp/
         P7o76E19TM/2fFlMIIYQU1LTglChlENAikIMwTTe3hm8kKDZZmagMfB3TXZ3XqIXAw2L
         Q0BH/7MlZUh3LRqRl7gh/W03RgwGe4VfVJtQGbEv3bVrMR6AVYN/tibO0oU1WUlTNMSa
         5iIwZPr6avON5l23EsxIoPthdlI23w/Nj5erlsfPStXF4DLJAWbLMihQm919+9P9e0ak
         vwCveMFLLQbjvc1qPr/7GQ+uxYHgVQmhQ3fL4Oj+w19Yf9bXqZfB44cCJDbyg9av7uj4
         CgRg==
X-Forwarded-Encrypted: i=1; AJvYcCWpwLyEsem86OolZGZCO34v3BhqTVdSB9ngYblPUteSV6MkIMjzwSVGkIvcU/AOe+y+qecJOAQ/FxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMt3Q+es2uP7Wss7tcBj0GCgSeXMoTxkC8BQvz2uWXXaxFL3j
	r/5VIvcDxDBnSTJK2DBii1XJVR2DR3Dq6voP5YB8y8syCWXMw/T+32FbqQHUyew=
X-Google-Smtp-Source: AGHT+IFIiVIb9rMN+B8i2xWtzWDjGjPrTfribRqLKwNimYLO6WRm7F0fCfgf+WS8c5Kw/Wf51x0d9A==
X-Received: by 2002:a05:6e02:1686:b0:3a6:aee2:1693 with SMTP id e9e14a558f8ab-3a6f19adc0fmr165181785ab.6.1731371718701;
        Mon, 11 Nov 2024 16:35:18 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f9890d2esm17379085ab.72.2024.11.11.16.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 16:35:18 -0800 (PST)
Message-ID: <7d14de47-119a-42e4-a911-f8accae4abf1@linuxfoundation.org>
Date: Mon, 11 Nov 2024 17:35:11 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
 <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
 <20241111223538.GD17916@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241111223538.GD17916@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 15:35, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Mon, Nov 11, 2024 at 02:50:45PM -0700, Shuah Khan wrote:
>> On 11/11/24 13:07, Simona Vetter wrote:
>>> On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
>>>> The Code of Conduct committee's goal first and foremost is to bring about
>>>> change to ensure our community continues to foster respectful discussions.
>>>>
>>>> In the interest of transparency, the CoC enforcement policy is formalized
>>>> for unacceptable behaviors.
>>>>
>>>> Update the Code of Conduct Interpretation document with the enforcement
>>>> information.
>>>>
>>>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>>>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>>>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>>>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>
>>> I think it's really good to document these details. The freedesktop coc
>>> team is going through the same process, we've also done a talk at XDC
>>> about all these changes, and I think this helps a lot in transparency and
>>> accountability in practice. With that, some thoughts below.
> 
> I've been thinking about replying to this patch for a few days now. I
> think I managed to sleep over it enough to make that possible.
> 
> I share Sima's opinion here. There is FUD around the CoC and its
> enforcement process due to lack of transparency, so I believe
> documenting the goals and means is important and will help.
> 

Thank you for your feedback.

>> Thank you Simona for your review and feedback.
>>
>>>> ---
>>>>    .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>>>>    1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
>>>> index 66b07f14714c..21dd1cd871d2 100644
>>>> --- a/Documentation/process/code-of-conduct-interpretation.rst
>>>> +++ b/Documentation/process/code-of-conduct-interpretation.rst
>>>> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>>>>    Because how we interpret and enforce the Code of Conduct will evolve over
>>>>    time, this document will be updated when necessary to reflect any
>>>>    changes.
>>>> +
>>>> +Enforcement for Unacceptable Behavior Code of Conduct Violations
>>>> +----------------------------------------------------------------
>>>> +
>>>> +The Code of Conduct committee works to ensure that our community continues
>>>> +to be inclusive and fosters diverse discussions and viewpoints, and works
>>>> +to improve those characteristics over time. The Code of Conduct committee
>>>> +takes measures to restore productive and respectful collaboration when an
>>>> +unacceptable behavior has negatively impacted that relationship.
>>>> +
>>>> +Seek public apology for the violation
>>>> +*************************************
>>>> +
>>>> +The Code of Conduct Committee publicly calls out the behavior in the
>>>> +setting in which the violation has taken place, seeking public apology
>>>> +for the violation.
>>>> +
>>>> +A public apology for the violation is the first step towards rebuilding
>>>> +the trust. Trust is essential for the continued success and health of the
>>>> +community which operates on trust and respect.
>>>
>>> Personal take, but I think a forced public apology as the primary or at
>>> least initial coc enforcement approach is one of the worst.
>>
>> Seeking public apology is in response to unacceptable behaviors which are
>> serious in nature. These incidents are exceedingly rare. When these incidents
>> happen, they usually resolve when another developer/community member points
>> out the behavior. The individual responds with a voluntary apology to
>> mend fences and repair harm.
>>
>> The CoC  gets involved only when it receives a report which is the case
>> when normal paths such as peers pointing out the behavior to repair the
>> harm haven't been successful.
>>
>> This document isn't intended to be a complete summary of all actions the
>> CoC takes in response to reports. There is a lot of back and forth with
>> the individuals to bring about change before the CoC asks for an apology.
>>

See below clarification on above use of "actions"

>> The CoC seeks public apology only when it is essential to repair the harm.
> 
> Limiting the CoC committee to seeking public apology, due to what it
> means in terms of both process and goal, would deprive the committee
> from many useful courses of action. I was expecting you were not limited
> to this, and I appreciate that you are stating it clearly here. It is
> not however clear from this patch, and I believe it would benefit the
> whole community if this was explained better in the document. A more
> detailed description of the different means of action and outcomes would
> help balance the fact that the proceedings of the CoC committe are not
> public.
The actions CoC takes prior asking for a public apology are working
with the individual to bring about change in their understanding the
importance to repair damage caused by the behavior.

Since these are measures to bring about change, the document doesn't
go into the details about the logistics.

If you have other possible courses of action in mind, please do state
them.
  
> 
> I would like to add that I appreciate the emphasis on rebuilding trust
> as a goal, as I also believe trust and respect are essential. This
> includes trust that victims will receive the support and protection they
> need, trust that authors of behaviour deemed unfit by the community will
> be treated fairly, and trust that the community will continuously work
> on improving inclusiveness. All three aspects are needed to avoid
> driving current and prospective community members away.
> 
>>> First, a ban or temporary suspension seems too mechanical and not in
>>> proportion with the offence of failing to apologize. In my enforcement
>>> thus far as maintainer and now also freedesktop.org CoC member we only use
>>> punishment if behavior has failed to change _and_ we need to protect the
>>> community from further harm. Usually it takes years to get to that point,
>>> unless in extremely severe cases (like public harrassment campaigns) or
>>> when the person stated that they refuse to even consider changing behavior
>>> at all.
>>
>> Please see above. Public apology is necessary to repair and restore the
>> health of the community in these rare cases when an individual doesn't
>> understand that their behavior could cause harm. The CoC tries to get
>> the individual to realize that offering a public apology is necessary
>> to repair the harm and resume respectful and productive discussions.
>>
>>> Public means you're amping up the stakes and massively increase the odds
>>> of people being afraid of their reputation and losing face. In my
>>> experience people are a lot more reasonable when you discuss their
>>> behavior and what needs to change in private. This even includes the case
>>> where a temporary suspension had to be put in place already first, to
>>> protect others.
>>
>> Please see above. The CoC works with the individual prior to taking the step
>> of asking for an apology. It is a balancing act between repairing
>> the harm caused to the individuals at the receiving end of the public
>> unacceptable behavior and working with the individual to understand the
>> harm done by such a behavior.
>>
>> The CoC is mindful of the negative impact of seeking public apology and
>> instituting ban could have on individuals.
> 
> It could also be worth adding that, as Sima pointed out below, public
> apology is sometimes not the best option for the victim.

The CoC takes these into consideration during the investigation,
before determining the best course of action.

Some people may
> be afraid to report bad behaviours if they thought that the story would
> be made public by a requirement to apologize publicly. I have total
> confidence that the CoC committee will consult with the victim to
> determine the best course of action, and that is worth documenting
> explicitly.
> 

Thank you for your confidence in the CoC.

Please note that the CoC has the obligation to keep the reports
and individual information private. This public apology is specific
to a public violation that has taken place on a public email list.
The information and details are already public.

The CoC could receive reports from a community member who could be
an observer and not the victim. The CoC has the responsibility to
investigate all such public violations.

The CoC has the obligation to keep the reports privates. The public
part is where the individual who violated the agreed upon Code of
Conduct is asked to apologize to in response to the thread in which
the violation has taken place.

thanks,
-- Shuah




