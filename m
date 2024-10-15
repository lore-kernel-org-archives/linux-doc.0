Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104DD1F76D9
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015688; cv=none; b=SyWeg7g1N0wH2dJ9GXqXsK9Nfih/i8k+9r8cQmnqpSFWLPkiCy9LLuGrUOFZOQS+nF2WX7emp7G8T5l+qvtVZOeyDbLg7lNyctYNdGjlkaRUFm5NtOx2AvAWrOqGeJrpZIog6A5AG2w8DMbiiPCx8EjF7+bA6qhyWGfcVzTQIaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015688; c=relaxed/simple;
	bh=qgzYfiD4coC7p5Uto2mr6HlVe4fvAp+tA/ur+AuhVzo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jW1qrTAuBPquGToiy8ZQNJZGPstc9e5YBaQodyxUAOqUmAob9V9pNyS85Zu9s9XTxpBEqUzP3R626BMxzuw6TBANTKx9XdLjlLN5CKvSBBgHRSPWqxT+5Wg2WbslEZe6Ekv2riaNSOT6Qq3tbwE2yACJEW/9RpBOVamkDhZdvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=arR1MWBK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="arR1MWBK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=mvtiWU8Ag9pHKC4wjojLiiILjlSFHX0Fw810ggjRYtA=; b=arR1MWBKSGZ5IchnJ6SpZSdWjg
	XCty/shzmQ9vre8xQ2CbY0+WuFTFiJQKD2ETJmRZYuPVhHHylCh6AxkY4cKGS7Z5I3nZH0QqPUQp+
	f5peDa4CZ/+xiAd1WNsj6mbXmI27Yq8Zx3OmUqAGzczdRV4LIU9drgBMxJIXLTmjwIHZz76HRCpVV
	13gFIw+gn+JuEDeV8AQSemNgne7mRCpIIEpTHxMSgaBLLRJaAiD8+KTOU3etvABtGNJuicRRjZlTd
	xz60JhVyyD8JiQOAZ6pOnQGDr8Gyck3BpBWWoVAamjA8cC02Hy9sLLsw6TwvqLtZjrdjRT6CQhL9i
	d+y7VpEg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lxj-00000005W1h-2bur;
	Tue, 15 Oct 2024 18:08:05 +0000
Message-ID: <cfea16fd-5b32-4a25-b0dd-21c46fc46d78@infradead.org>
Date: Tue, 15 Oct 2024 11:08:01 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kernel-doc: allow object-like macros in ReST output
From: Randy Dunlap <rdunlap@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Horia Geanta <horia.geanta@freescale.com>,
 Vlastimil Babka <vbabka@suse.cz>
References: <20241014051333.462847-1-rdunlap@infradead.org>
 <87cyk2u1lu.fsf@trenco.lwn.net>
 <ba5fe544-df7f-4a94-8790-17aa3d616ab6@infradead.org>
Content-Language: en-US
In-Reply-To: <ba5fe544-df7f-4a94-8790-17aa3d616ab6@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/24 10:14 AM, Randy Dunlap wrote:
> 
> 
> On 10/14/24 8:48 AM, Jonathan Corbet wrote:
>>> /stuff/k/git/kernel/Documentation/gpu/imagination/uapi:169:
>>> ./drivers/gpu/drm/imagination/pvr_device.h:686: ERROR: Unknown target name:
>>> "static_expr".
>> ...that I haven't been able to track down yet.
> 
> I have found/fixed this one.
> Doing more testing.
> 

I got the warnings list back down to the normal/usual/expected ones (i.e., lots of drm)
and a few otheres. This is with Vlastimil's patch applied.
I'll post the new patch soon.

-- 
~Randy
