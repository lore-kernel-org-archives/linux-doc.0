Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA4D3C1D78;
	Fri, 31 Jul 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486442; cv=none; b=oA9E2itK0+YDInNVZOOUJadEW+xTHqVORfLfAsnSPzWcNMPcUms8g560ojJ84nrSAg76ZQTafMfbJ41l5yQG6uQNIKbtRSAL0mqRRhsCUPXF4GoNcTssU4tsGPIKBcN2I9N9o3C9Kjz9YxZhqOIQvT5ji1Ri93kTjB04clK4cXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486442; c=relaxed/simple;
	bh=1JHEdz8d5HConmuvvubGjSULu2mCkUzQRyeDLD1OrEs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Gv32B11kAKY9bRZbY+auv5i/Qd+NlXWw5Nx+xzAWvbKEbshGR9R1DN+5nnRXEmwiyrMaGLNgJMVwIlEIym38+qfwDJOcALnQ36BdmnbvXJKi3yr90mYBYW8ynL6WrmIxktHEOvh3SGSLW/2ounMZ9mqyjUWjPwi/3lxcjJWU9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JuUiETLV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RSaQim6l; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JuUiETLV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RSaQim6l"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C7567EC00D1;
	Fri, 31 Jul 2026 04:27:16 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 31 Jul 2026 04:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785486436;
	 x=1785572836; bh=8MrremMqmjxNVxlgVdfe1iLhILhLy6vLjG+K8oP8Gfk=; b=
	JuUiETLVdUrWhdJgCvAbP29YtZes2j2UytleeT5Q0nHIRrdQMf9zMNe14ystmnVL
	hU1CPJRUf+6dK8AwMU8exLC/f8NqoqCCBnnw1UJt0pJ2LBIJ0AgpQqLtfcRnQO4N
	emCajARHnOw/AUSQYKN8mtmCEldUgO+4o4veM9TBrrDWReBJrdCGOEeucQU70mZl
	KS0i3wIn1kAxpnabMSEfh4AhfLx/GzyC6Wjif+h3QDTb6lp1hx9sqQ6ExwNyfoOe
	47DQmjXlUkwWTcZ2GiD++f3l1o5jIVYxgnUDBcGoqHQLMrJ8I4sqL69kVs9VD7TD
	BkNdXnhj3ZaNkn4UHdyZ/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785486436; x=
	1785572836; bh=8MrremMqmjxNVxlgVdfe1iLhILhLy6vLjG+K8oP8Gfk=; b=R
	SaQim6lLX0UC7kpVtZ2RTuwoZMy1x3tUzuJi/82SxPLKyseAv6eRtbC/C08fdZoe
	Cau4gz3FI/iNbr2waMqQlgOd8ddsjqtitoSP4FY5A1hVX4bt6EOLt8avjOfTmgiN
	4KeNK6jPgow54RNRfDzQTXY+67YW0APLR24oU+tEGj26q7i2dfomBEN1Cr1AutwJ
	JZweIjWgnl6o/VKxMlyTF2YHQ0lxbBohFuY0pmFUtIYagbHOTJW+Q3OzozX0Zes7
	rhpxUzyYqm6PPBmp0TSisWq6m8uRni0axTuIVoFN2Q0mzV8Qbli0l2TO/7CWXtTK
	pV1nVoRyCjUXhNxetarDQ==
X-ME-Sender: <xms:ZFxsahRu-jTtemnKzZVwrcQda3j43FKa8WNKhW5vK7KNtAiX-4WNCQ>
    <xme:ZFxsalmqhTvcxw73E-LXVBtk1HdWiyDoOOLesIIeK2BO1IauVUinKOYtkXH2yyzaL
    8ydyYpT_FZpUY45i0tTPHfOPdwGA5ujgnCihLw52mt_g9NfGoJWeDI>
X-ME-Proxy-Cause: dmFkZTExOvy8Ez2u5D5ySq0KkFtxKCUg5ZItldVPt9bjE/7pGOinjVilE3gahYCtk+jOfd
    Ruh1qHRVtEk8SlSNY7l6Z/nnxcvNS0knbE0qnFn1WsrxkCkUS3L/Ad1qEBW2vMrq0vWxaD
    ja4ck0hynKtw6UfSkpMD/esqGxncHba2D6Sy1DW8d0i3n+CbM97l+WuWCMoY+fdKqQMxSg
    BeGSgyDBrCyEDP6dOUg5xPDOwG1FjqzkWsUushi8zrphfrsidWFklaigzQNqI1FG8ji+V8
    XSx46HDOQ3dq1gGhR7wwiXhdpHe7qXArnb6uzN+fb4Z76SI6iwV5ztnow/DMPyvoY9RbNt
    RhpR2eoNV78XCw7iSd+gsZf7+deKI6Vfd3KJio1Ni+LcB2vRAbYJsMoundkOjdDMNoVs+B
    Hw8RlCuUVddA/Zucax5O3nk3uyYzIVpyqxT5gNZu2BXueC071jor/OZVZeqNcTY0D/CQGe
    kS9gkR+Xxt7G7ToGiYjWA3GuWlx9Aur4zI7ZyU17XGq60gKfHksWF2tMjyEwQXHDPSCAul
    8qCkaz58NVFgMSy0b5CDRjSnKhvFqfWxdczgTjgzqy1skdWpAogSonXjAmW06ZLjJa3prq
    R8oEhGf7YLSOCMuKhLfBs/wgoi4lxFToDY97fQp3Q4PV466AZkUU82u1QZsA
X-ME-Proxy: <xmx:ZFxsasc_I66bTLfABs1fa0vd_Q2odZzu2w092Ul7tDO7cbVpIE-gjQ>
    <xmx:ZFxsasd3O5BrcG4qK2LSv22250lETQfEYtAjPwp58TZ971DP9lHa0Q>
    <xmx:ZFxsam0Nscsh6RwTfJcQ2ZncY7M0GV6wxAisgOXsHOnSEtveZ3iLrw>
    <xmx:ZFxsak9406ntnVU1TBagvBdNbX5Ds_fMDAbZSKHDqQgSr4rhjQK3Hg>
    <xmx:ZFxsavIb4XPRvtaLfGsZDGT_40ed7Bjb7pu5Oi7sR8GpiN80AzA8kBul>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7CAAD182007E; Fri, 31 Jul 2026 04:27:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHOvGHbUHvkw
Date: Fri, 31 Jul 2026 10:26:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Graf" <graf@amazon.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "The AWS Nitro Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Mancini, Riccardo" <mancio@amazon.co.uk>,
 "Popescu, Diana Andreea" <diapop@amazon.co.uk>,
 "mknaust@amazon.com" <mknaust@amazon.com>
Message-Id: <f06eb3c1-4e5f-4001-9280-4eb6a43c4af2@app.fastmail.com>
In-Reply-To: <ee807af6-3fb3-48b7-b2b3-4c5f22d51ced@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
 <421d4cb5-77ab-4d36-aa61-64d4f536cc81@app.fastmail.com>
 <ee807af6-3fb3-48b7-b2b3-4c5f22d51ced@amazon.com>
Subject: Re: [PATCH 0/8] nitro_enclaves: Support multi-NUMA CPU pools and per-node
 allocation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2026, at 18:35, Graf (AWS), Alexander wrote:
> On 30.07.26 17:43, Arnd Bergmann wrote:
>> On Thu, Jul 30, 2026, at 14:53, Alexander Graf wrote:
>>
>>> I picked a per-fd target over a second NE_ADD_VCPU carrying the node on
>>> every call. NE_ADD_VCPU already reports the id it chose, so a VMM
>>> spreading an enclave over several nodes needs no new call, only the
>>> target and the count it already drains; the variant would make that
>>> same VMM learn a new ioctl for behaviour it already has.
>> I had to read this three times to understand what you are trying
>> to say, but still don't know why you picked one over the other.
>
>
> Thanks a bunch for taking the time to do so. The message is: Both work. 
> We can either have special ioctls per allocation (CPU, memory) that gets 
> a special nid property or we can have a global "allocate from this nid" 
> cookie behind the fd.
>
> I don't have a super strong preference which way to pick. The main plus 
> point for the cookie is that ADD_VCPUS is already an ioctl which we 
> would otherwise have to add a new nid-aware variant for.
>
> Do you have a preference?

I would probably have picked the other one to keep the logic simpler,
but as you say it's not a big deal either way. If you end up adding
a new variant of the existing ioctl command, you can also add a few
spare fields and use copy_struct_from_user() for both commands to
deal with the zero-padding as well as checking.

        Arnd
