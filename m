Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E249318BB3
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017994; cv=none; b=ouGWxNbiUnKLccQd+g6akwDHFiQiVbKtom1jaNFNWQVYeqJgZ9Zr4DC+cD+obUeb1NfKo+Ju7id20GK0l4VKaeIse7YKPps3amkNNcSSv+FqHNV0Nkrdbi4M9zx8VSZiF6mw59dWV6fQCsa8Rzp5Iu7BnmoYHEkmGGmJKijKBz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017994; c=relaxed/simple;
	bh=eEfxaVDeuHg/2O86tGs17Sc/sYUDZxKDGC64ZP7eDt0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=pWjMPqor4pBEonD63dduTwcgXCQQjH3xp3EYSSwzpuE8dtqbVasI+gMFhT7sob/FPAWFSc/ynb94ZQi5VJIulRljEb1qMBiuOZ1Lw6/91iFBzv2DfjLRwaY0tNW8wBMLiNUnZnnLcl/5N4E1VqN0lY4aLKQQaFW9pacFc3K4Q1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca; spf=pass smtp.mailfrom=dilger.ca; dkim=pass (2048-bit key) header.d=dilger-ca.20251104.gappssmtp.com header.i=@dilger-ca.20251104.gappssmtp.com header.b=eHrxH70q; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dilger.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dilger.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dilger-ca.20251104.gappssmtp.com header.i=@dilger-ca.20251104.gappssmtp.com header.b="eHrxH70q"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1044552a12.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 11:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20251104.gappssmtp.com; s=20251104; t=1783017992; x=1783622792; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VEx+Ou5+j9qUkh59LaYDmj5XVpjw59xEgpgRSs88k90=;
        b=eHrxH70qCWhTLR0AUERi07EsCpfeIupO2LXrNDFQepR/MCF1/lhjK+kDfc2ss/C9Hs
         jjK3KLXRieG0DpM+FNKFhUNGOQnmY9DrP5MSOtoy9MRJAULk0ZEgTeOBNqD3QnsI8MY8
         ipNk0WPG/lOSZGTgY7A58YIyrQSpb9yc1RjwFPfRAwZYpvVp6r+ShEOVmg/M6pOY9rzX
         YfFyu2HdKdYk7ZyDSKyAd3TMzgQxxMsMPbT4w41JVto4/mQyicabktEPRyI2mLYy7SIv
         PTA7xKHN6em8q/QCN6dn8cMG+LdSZWcBVZkrWZIG/a4O66gR0DLx4ezTlHcdOhvB/tED
         6SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017992; x=1783622792;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEx+Ou5+j9qUkh59LaYDmj5XVpjw59xEgpgRSs88k90=;
        b=EHQAAFLSrDtQ2YH0ioj3xy6g0ks80eopPyowCxMmAewPtsQ4BwCddgs81rsmvLEBZO
         JuWvk1Da9hGd0RuflZzefrRdH57+n3LxMmhzncf8bwSJVF0qpp/hBwWu5vbq4jLy1GlV
         Hq2yQBlzWgvMmvF4IsLDFmd5eWaYKmrtQm1Lr1gcnQGVOwOOLGGEs3ZN4Wo0JO18njWE
         EYF+slXXZRD6yuGhfqhaTjn8E+flwmdqsAUmqNmnvtn+9MBKURPl8Rbrh1aow0bqbLiN
         b8kvSVtTgLW68S/4sINcvA/63hEcuySWWPjYqIkHmTwEu4N6fcaQV+lUsGv7zZAmXcXg
         aBVA==
X-Forwarded-Encrypted: i=1; AFNElJ8n04s7h3To4BT02SIf9yCAeS7ybOlTOOIr9K3EtOGSy1Skns1iYqW33iX/div4gJfmuNYuYs5KOo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGifljZ+LL7dc4yWMXkZPMXggy+PWea/hTIM4t3L9v6dTQfFYn
	XCY5s2xKdgzhrrf/Ht4NDseZBVQTdCF+aO0KQBWCrxR1+K3lkFM8tWZxRauoeWIKvkY=
X-Gm-Gg: AfdE7ck5CFlOzjHmqjssfDoLN1dqqX5P8rtechKrMKM1CqPYKRz2fykNdrvoVgMCV3M
	jG00gwB2HVPr5bm4Tj4MzM62EXuiYvTZubqsYH49NfRi6bjsJx9HSfTYnixq7TldzetqPXlr2u7
	RiSvcFJlTtjbITAtFKfcIx0ELl6VDm0WVsRFqnm8lmWCN74weeRsUxf7o853ZNhLp8A3Ior+zgt
	9Rh7B60dxwKKYO1idyRFnSXRVHGZlBFExrW4bKUZIgaNS6AsvVU5S59gYj//vYE69GweqqXjnxV
	x4OHuE1QBxqwFesfxTTwEr6+aDUP8rvVRbbbSlT8YlJlZ1GR3gSWSye9QZWRUDuqPUs8u88KUK0
	Y5C+FHktHc+7cqonqXbh+BkFpQsEh06T+AxWUciSGiYDTXrJ8Wn57SfLGgyID47y57GMSzqcx7W
	nhH85CvOvWVQB9otG0L3UthpTcMrMUkObRQU5/Fb9nCm8JLvVklfx71OgWTtEy+H0y48M=
X-Received: by 2002:a05:6a20:2d2c:b0:3b4:b24e:27a2 with SMTP id adf61e73a8af0-3bff4258cf8mr7186870637.31.1783017992494;
        Thu, 02 Jul 2026 11:46:32 -0700 (PDT)
Received: from smtpclient.apple (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921cd139sm1593095a12.23.2026.07.02.11.46.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2026 11:46:31 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
From: Andreas Dilger <adilger@dilger.ca>
In-Reply-To: <87cxx5l900.fsf@trenco.lwn.net>
Date: Thu, 2 Jul 2026 12:46:19 -0600
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Justin Stitt <justinstitt@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Carlos Maiolino <cem@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Jori Koolstra <jkoolstra@xs4all.nl>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 David Disseldorp <ddiss@suse.de>,
 Mark Brown <broonie@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Jens Axboe <axboe@kernel.dk>,
 David Hildenbrand <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C39A5C8-EA03-4C8D-9BE5-5097101B71D6@dilger.ca>
References: <20260702-aidoc-v1-1-735572dfb995@kernel.org>
 <2026070224-unholy-commode-cf45@gregkh> <87cxx5l900.fsf@trenco.lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
X-Mailer: Apple Mail (2.3864.100.1.1.5)

On Jul 2, 2026, at 09:13, Jonathan Corbet <corbet@lwn.net> wrote:
>=20
> Greg KH <gregkh@linuxfoundation.org> writes:
>=20
>> On Thu, Jul 02, 2026 at 10:32:48AM -0400, Jeff Layton wrote:
>>> We've had this requirement in place in the Documentation for several
>>> months, but it's becoming clear that the signal to noise ratio from =
this
>>> is quite low.
>>>=20
>>> 1/ It's not universally followed. While many people do try to =
attribute
>>> the LLMs in good faith, not everyone does for various reasons.
>>=20
>> Then let's move to get people to follow it.
>=20
> FWIW, in my experience, simple ignorance of the rules is one of the
> biggest reasons why so many people fail to follow them.  When I've =
asked
> docs contributors about the source of their work, they tend to come
> clean, apologize, and add the tags going forward.

It would make sense IMHO to address the ignorance in the most expedient =
manner,
namely by telling the *LLM itself* to add this tag when it generates the =
commit
message and/or reviews the code.

This could be achieved by adding a statement in "AGENTS.md" in the root =
of the
source tree to this effect, or telling the agent to reference and follow =
rules
in Documentation/process/coding-assistants.rst regarding the =
Assisted-by: tag.

Cheers, Andreas





