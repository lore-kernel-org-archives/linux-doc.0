Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99754153BDD
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714661556; cv=none; b=J4ay96WgCMsqAmzDx6g2HSo3SNdXDRas48hIUZZZVNSk+xDV1gphGmtLU8Dqeaqa5dQFfsYXBcLW7Mg4u9FaQmlLXWsIDyOhmpMBMG8efMYGu5s0axxX3n7aSNCo3s6KnYZXme0vOkjErM1JzBnDhOSU+ktWO47IqTWh74L/9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714661556; c=relaxed/simple;
	bh=pYRS6Z+/aqRPRk+HLCuzM9w/bEgcB0neFnE+jrmqE2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fb3bvqtiG8o8hgqNFecekuHLGhSOUuCtZuwZE7OeBtnwDfObcWkWy11HWyoJUeNDV4XLQb4VYsbUQ2+bQt03GRfufOm0cDipcoppZJ6xB3O8SN74ZldkrLNtH0WkgYPiV5SrAXaQ3vJlgKfrVUQzAN8Q5S3IJdHNdbGCSC3VRuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jTK2bNDg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jTK2bNDg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2EAB47C45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714661549; bh=6LdnacyoiEOHEtF8+iGQoRcUMJ4qyC6uv9SXtnZi2aI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jTK2bNDgsjftmNe/B4w/DoHaI9joDaBxF/2besvUdhdOWCXJ+AG2LEok66v8bcytV
	 7E8jPJ3WhxAA1dnR0uP4deNuO044IJIQa+dbeNASkHb1sO7aedUieLMjaAiBiliRUT
	 YAtGBAwN+rN0kwDoltn8vZoBSwPVH67LgO0Z+sMUvScKSfuhCNf2ld86T/+WoZfFS+
	 tJ3psFnGg92OtqUuyRfPxU0gze/lWNNDbPtOngsKbTQdXVyTR5KVzVK1dMZ+xdIa49
	 G/Abt7abQjjKYN7VJ7WgUqTrSLq6CQtLC/lFKl5F8pyjsowqvTVZsqA7gbbkGVKit8
	 FTLaCvN+FwavA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A2EAB47C45;
	Thu,  2 May 2024 14:52:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: kernel_include.py: Cope with docutils 0.21
In-Reply-To: <376c813f-971c-4558-b596-64e7f6f3833d@gmail.com>
References: <faf5fa45-2a9d-4573-9d2e-3930bdc1ed65@gmail.com>
 <376c813f-971c-4558-b596-64e7f6f3833d@gmail.com>
Date: Thu, 02 May 2024 08:52:28 -0600
Message-ID: <87edak8dw3.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Wed, 1 May 2024 12:16:11 +0900, Akira Yokosawa wrote:
>> Running "make htmldocs" on a newly installed Sphinx 7.3.7 ends up in
>> a build error:
>> 
>>     Sphinx parallel build error:
>>     AttributeError: module 'docutils.nodes' has no attribute 'reprunicode'
>> 
>> docutils 0.21 has removed nodes.reprunicode, quote from release note [1]:
>> 
>>   * Removed objects:
>> 
>>     docutils.nodes.reprunicode, docutils.nodes.ensure_str()
>>         Python 2 compatibility hacks
>> 
>> Sphinx 7.3.0 supports docutils 0.21 [2]:
>> 
>> kernel_include.py, whose origin is misc.py of docutils, uses reprunicode.
>> 
>> Upstream docutils removed the offending line from the corresponding file
>> (docutils/docutils/parsers/rst/directives/misc.py) in January 2022.
>> Quoting the changelog [3]:
>> 
>>     Deprecate `nodes.reprunicode` and `nodes.ensure_str()`.
>> 
>>     Drop uses of the deprecated constructs (not required with Python 3).
>> 
>> Do the same for kernel_include.py.
>> 
>> Tested against:
>>   - Sphinx 2.4.5 (docutils 0.17.1)
>>   - Sphinx 3.4.3 (docutils 0.17.1)
>>   - Sphinx 5.3.0 (docutils 0.18.1)
>>   - Sphinx 6.2.1 (docutils 0.19)
>>   - Sphinx 7.2.6 (docutils 0.20.1)
>>   - Sphinx 7.3.7 (docutils 0.21.2)
>> 
>> Link: http://www.docutils.org/RELEASE-NOTES.html#release-0-21-2024-04-09 [1]
>> Link: https://www.sphinx-doc.org/en/master/changes.html#release-7-3-0-released-apr-16-2024 [2]
>> Link: https://github.com/docutils/docutils/commit/c8471ce47a24 [3]
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>
> I forgot to put a Cc: stable@ tag.
>
> Jon, could you do it for me?
> I'm not sure how far this wants to be backported.
> Maybe v6.1?  It's up to you!

I was planning to do that, yes.  I'll try to get to the queue today.

Thanks,

jon
