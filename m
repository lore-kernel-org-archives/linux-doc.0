Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85C3FAE10;
	Thu,  9 Jul 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593266; cv=pass; b=hvAACxfHIZNVR78PrAGUHTAbCy+FzhLNgDeuTmcMzGvic/3MEBsfMYjN+gsfu0jypIjX4DSzht00ILY7nNGFa7j8p3zA/XW3ZGzuf6tSLDRVssUokuCdPmdFd345y9FSzT6S+6B7RopTfZuRez8v5tnfT0nDBpjiCKPcnBMKHlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593266; c=relaxed/simple;
	bh=5xFHYt5qaN8ud9dn9divYtXE4YYsc1tBGY0Icd09ttI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=YSOiLzAU2wWYxfA3aKP9OABtg82a4QU5sL4a9gVGcorDhEcQ1PJuGIAMhOS1uDaRUk5bTup4rrU36s+Dh15IkLwTiAMtuQM03icr2gA7PtLxvvPFP01RBnN9DzJAk+wGst+a7Y6FwsG3CISWTUR3K3pV6xNFvlCO+lJQnCuVDNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=ll9PLPn3; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="ll9PLPn3"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 3559F10B40B6F;
	Thu,  9 Jul 2026 19:34:19 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7Q9O2v-OmhP; Thu,  9 Jul 2026 19:34:15 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 64F8B10B40B4F
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1783593255;
	b=u0S0xl7PNn3zd8swXKwyhKmXXWqJt0sgNb2CybRB1hHiDhm4SkavgQu/JnnvCEQB5C7v
	 AyzUgZUVByaEPBm1urYsu35MI0NFnv1avf8YF68h2urXZU9KSM8KeiorLNc+GCpKHYSSE
	 CMEzi0IqJvbmwepP5ohfyowtfjr7WckuA8=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1783593255;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=gbZc01zxm/XHB6OiBBKkn4ZbxstPNHgzEI2Wpvn33Fc=;
	b=JNmskrwSDvu5Uae1apCCJ6W7lPpyqkuzESO+FdtVuVLdMsetay2Q2zpBDpJjieOHwHhq
	 dXw+1xwygMcc85ElBQHkIMVoXsEPgxrjcm5wiCdB7E6MA3kzxtNAChcr89SJ/Ywje9iyf
	 eVVjIRnh1sn7PUDVXq1bQPxTq0NetGpnL4=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 64F8B10B40B4F;
	Thu,  9 Jul 2026 19:34:15 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 64F8B10B40B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1783593255;
	bh=gbZc01zxm/XHB6OiBBKkn4ZbxstPNHgzEI2Wpvn33Fc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ll9PLPn3NZQ8kPtYcEzPI5wnrdNLXJpSPHfMWrAEXAFwU/zfErwl1vzqTZh9efhq/
	 q95+kSZg2nElRD/FFOZTPP/GEcRLddHOkRlSPeTVnvMGs0daumBqgjFmSb4JKTO5jG
	 5PPiSqLkC64SxZC02qOo5+xiUlhbNC9kGs0mPU98=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jul 2026 19:34:15 +0900
From: weibu@redadmin.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
In-Reply-To: <1bf78dca-1651-4173-938c-d76b3c8db229@infradead.org>
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
 <1bf78dca-1651-4173-938c-d76b3c8db229@infradead.org>
Message-ID: <e942938989f17a884019324412d33031@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Maybe it would be better to send this as a follow-up patch after the 
original patch is merged, to avoid unnecessary churn.

Thanks,
Akiyoshi Kurita


2026-07-09 06:04 に Randy Dunlap さんは書きました:
> Hi,
> 
> On 7/2/26 3:44 AM, Akira Yokosawa wrote:
>> Commit 5903019b2a5e ("Documentation/SubmittingPatches: convert it to
>> ReST markup") made "DCO 1.1" a subsection under the section "Sign your
>> work - ...".  However, the DCO text is meant to be referenced in the
>> section.
>> 
>> Furthermore, in HTML and PDF docs, paragraphs following the DCO:
>> 
>>     then you just add a line saying:
>> 
>>         Signed-off-by: [...]
>> 
>>     [...]
>>     as it was propagated to the maintainers and ultimately to Linus, 
>> with
>>     the first SoB entry signalling primary authorship of a single 
>> author.
>> 
>> appear to belong to the DCO, rather than to "Sign your work - ..."
>> where it should.
>> 
>> In reST (and other documentation tools), once you start a subsection
>> under a section, there is no way to go back to the section.
>> 
>> Fix the section structure by making the DCO a literal block, with
>> indent changes made in commit 5903019b2a5e reverted.
> 
> I don't see much difference in the before and after HTML
> other than the use of literal blocks, which do make it a
> small bit clearer where the DCO/Reviewer's blocks are.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks.
> 
>> While at it, fix the same issue at "Reviewer's statement of
>> oversight".
>> 
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  Documentation/process/submitting-patches.rst | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
