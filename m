Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A03A9DB9;
	Thu, 15 Jan 2026 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489550; cv=none; b=PCWyUbLvC2hQL4iazOl/D46g6J9jvOpNoXNhOMWwA94/nNSkFMegrFuB/Ub4s+y1s6RpTpEGDpAs2G68WZMx1FnmFaqhCAovKrqg1KTrcww/TJwprjr5wWcRoS4sATkGHfIQeq6rJXKrmMXJoCsR+fL2OWoA2txhQk0tcD/sTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489550; c=relaxed/simple;
	bh=ZYKXMs0hBi9WU3FI6lPvYRM2x2BPZgLuM2dFvniBz1c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XaPOZkUwFWY/YMF0MTlte25Cv+FfGAgTqL0Gqnk4D2FdZF0dvc4r4Ml+fYlJke/eegYjERQgq+klhMoVHFUnrD+Kl+h7TNJ06o137FlVCFAXJozMPt4hPz33NeJ679zz0Y2BYMenVeYTYMu6OGK5afZsXkMkAkKndJzzTTY5ONw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OmujBLoJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OmujBLoJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D8F0440C99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768489542; bh=DuKzz1/YJHs2VL6GCvWxqszGITIG/Rnm/C9K+GZ+WSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OmujBLoJcUiRIScluZawXwAq1daZCqnoZyaH4Vzf2kk6xGFAR5p5qPjOOCb4WqNQr
	 vFFg5K5zXrzqQaU0t278u/dNZP+0b/6eTrYFCWaUIENNSsSLlYVSbJoWeDFp7bl6jC
	 Xc1E2cwyqz/arbd6JNTnZlfbE6FT0vGe1ZpJNFF4AJxn8KXdh+jbuDytcKN2awYIDw
	 yhrrNdHgxmSyCf8YWY4bRKD0po+Wo+QHqZAZAHOYYKRIg3tH5w+4qasg02NZS5+QJR
	 8dJXQ782AdpzESn5yNevExydJJs0s6XnKV5GhNt/P1Qeyl1quqKf9EylGW8jY/+LyP
	 ms7Z+FlHtnlxg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D8F0440C99;
	Thu, 15 Jan 2026 15:05:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah
 Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
Date: Thu, 15 Jan 2026 08:05:40 -0700
Message-ID: <87ecnquda3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> Em Wed, 14 Jan 2026 12:24:31 -0700
>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>
>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> 
>>> > I do many of these on a regular basis:
>>> >
>>> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>>> >
>>> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>>> 
>>> Yes.  The tool moves, but its functionality remains unchanged.
>>
>> That's actually a good point: should we preserve a link on scripts
>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
>> that could break some machinery on several CI tools and scripts
>> out there. If so, it could be useful to keep a link - at least for
>> a couple of kernel releases.
>
> I think the tool source should be called kernel_doc.py or something, and
> scripts/kernel-doc should be a script running the former.

I honestly don't get it - why add an extra indirection step here?

Thanks,

jon
