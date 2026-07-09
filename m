Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAB386550
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608613; cv=pass; b=uyvE8Dl4BcrHaJhchbCkj1wOJxvrfScIONvMRrMrR4hyyikIGiIpCx4EGSKC65o1u+PK24w13HOi0itvp+s1A+LT0iYiqPZxexfyBCJXoEY7F2IPlViIeg5CghWd3/yEfm4YfmSnPa3aNKp97eh5G5/1UIlRVAOMSE8NhLHsO/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608613; c=relaxed/simple;
	bh=rr7WB4MDYHWb5nUslxUAErpl4oAzOpvz5aUcjApb3Sw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=B+Ht4RvsEXuGv4K3n3n8ziUHxxl1oDk1GHfyghhrhUb9PUGmWgK70HjQmRgcw1484NvClMxJzAXWB+z1GnBm97uzoq6rI9OOV1jqa34ekH8Gk4ImJTY/J6tpakpRAwiZMqQQFFcejft7DHubU4MOVVuj3ZuNjiYwSuJRp1JtM+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=ld2+7his; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="ld2+7his"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 7741A10B40B6F;
	Thu,  9 Jul 2026 23:50:06 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jrvd6qAxkHd3; Thu,  9 Jul 2026 23:50:03 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org D24E310B40B4F
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1783608602;
	b=egVcH6Qp7YR6UkyQEIa3vdUN5arNE9/rxDcayfmm9WBMg5xYkbRhXtXnrZKcPEIIzPp0
	 BEO6B8w3uMcFAMMTwvk+Og4Fua9ACFxXMVVIcX69QZKV431BcE9F5r87Z8l1ZmVbzrJ+J
	 Z2biMnkrnyg5HVqUbOi1S/nW/8HgJgR6kU=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1783608602;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=cS5p4SmKzskO6J/ooHDa775wQ3OOz8Gg5aqZizA2FiE=;
	b=jCCMY+uBOkNSoJYXQ9r2yBsZC7l1b8TU50T9yWtYQGLSWXdvJVEkv7qnSkKm6JB8eWXL
	 8OL2coxJQfQBNuvcjQy+MxNsNibl+cDF6H7Yp/bTp0EAP+pkSmSKJ1u9jbnAsx25vgitx
	 fv8l6DzEXFpJdQa2OSF3rUDh9OyR+GMMUc=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id D24E310B40B4F;
	Thu,  9 Jul 2026 23:50:02 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org D24E310B40B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1783608602;
	bh=cS5p4SmKzskO6J/ooHDa775wQ3OOz8Gg5aqZizA2FiE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ld2+7hisAHkAP5A/fMp7wy/7g0zGiV/lq8lwvhm02kWLqvTLLUU6vuWYWZGJcIFmg
	 /riZuafiCrwKIMroiAIh+eiiGCHlAlwLs++dU3FnRvWF+MOhA6aolTEIRV46SGL88n
	 3cIoib2WX6wd2EnTWZzxQEtRTopFV/hqA/PYqNKQ=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jul 2026 23:50:02 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
In-Reply-To: <45664250-b2d1-4dcb-83ca-e76d319c9cdb@gmail.com>
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
 <1bf78dca-1651-4173-938c-d76b3c8db229@infradead.org>
 <e942938989f17a884019324412d33031@redadmin.org>
 <45664250-b2d1-4dcb-83ca-e76d319c9cdb@gmail.com>
Message-ID: <9f79941dfecb4e00ce9ed6bbc598a855@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Sorry, my wording was unclear.

I misunderstood the context and thought there was still another patch to 
be merged first. Looking again, your patch is already a follow-up fix 
for the issue introduced by commit 5903019b2a5e.

Please ignore my previous comment.

Thanks,
Akiyoshi Kurita


2026-07-09 23:44 に Akira Yokosawa さんは書きました:
> Hi,
> 
> On Thu, 09 Jul 2026 19:34:15 +0900, weibu@redadmin.org wrote:
>> Maybe it would be better to send this as a follow-up patch after
>> the original patch is merged, to avoid unnecessary churn.
> 
> What do you mean by "the original patch"?
> 
> Confused ...
> 
> Thanks, Akira
> 
>> 
>> Thanks,
>> Akiyoshi Kurita
> [...]
