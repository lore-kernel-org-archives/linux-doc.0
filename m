Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086F155A47
	for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721751500; cv=none; b=KB4rkeeOdAh22YnK4d2dAXRVVmSNIMkkrzZfTrmwnUe13dwx3Apc/lXCwC5b5BNkdgkgrT+VtduGyJUU6ECLwdTM4HdGihNhkGLl+YZpx+ukwHh3nw/LBy5gjoUEXV+b6P+4aciNZ1O7MGERbaEexdKTOVJQeNzdn+AzACPPH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721751500; c=relaxed/simple;
	bh=UMLw9slHziHEYEojOzNyrppIDmcWF77QgPc6AZRdqyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kdpyIS+MGBC5szRiFJXJ7Oe0+zTJl2NgevWSaSlvsy533g3xU9E4CyOd7pL9Exwq1y5AOY5NqOLFFzX2JM5bAjjkEOMwNpG3NvLGB21Vr10y/k5l1o41d0il0ckwV0TyEfviXEnBi9PklWz+3aCQ2WW749ohcISxLt2CoHqjLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YRzmDSZP; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YRzmDSZP"
X-Envelope-To: marcus.yu.56@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1721751492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjjLwYRxXkUmNJ43uyex+kLv30jvSHho2eawfvU4UXw=;
	b=YRzmDSZPsR+95xOlD0wKSpmxAJ8pZkUr43D0l3tRAtXtP1mi65cns+K68/mmxXV00upXrG
	gMqyUIuIrLesR2ogiBJ6NFrRR7Fz0fwnHQ8ytobc2fRYz1WL3QztsyOFdeZci5v1sCeAwi
	aTKXjQzyeKuMMVJw25wlGH1q2Ao3STQ=
X-Envelope-To: skhan@linuxfoundation.org
X-Envelope-To: corbet@lwn.net
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: chang.yu.56@protonmail.com
X-Envelope-To: zenghui.yu@linux.dev
Message-ID: <15b15e5d-2db0-4f34-80b3-1b83571f8cb4@linux.dev>
Date: Wed, 24 Jul 2024 00:18:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix "WARNING: Title underline too short."
To: Chang Yu <marcus.yu.56@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, corbet@lwn.net,
 pbonzini@redhat.com, linux-doc@vger.kernel.org, chang.yu.56@protonmail.com
References: <Zp8xvjtQKdRSvJO_@gmail.com>
 <b9e7e293-38dc-472c-9d53-5dfec5dc4a28@linuxfoundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <b9e7e293-38dc-472c-9d53-5dfec5dc4a28@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2024/7/23 23:53, Shuah Khan wrote:
> On 7/22/24 22:29, Chang Yu wrote:
> > Fix "Title underline too short" warning by extending the title line.
> 
> Please specify the subsystem this patch is intended for
> in the summary - also check the correct format for the
> summary in the submbitting patches document - you can
> refer to other commits for the same file in "git log"
> output.
> 
> example:
> 
> [PATCH] doc/kvm: Fix underline too short warning
> 
> Include the warning in the changelog

And it'd be good to always CC all the lists that get_maintainer.pl tells
you, i.e., the KVM list and LKML, even though this is a trivial change.

% ./scripts/get_maintainer.pl Documentation/virt/kvm/api.rst
Paolo Bonzini <pbonzini@redhat.com> (supporter:KERNEL VIRTUAL MACHINE (KVM))
Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE (KVM))
linux-doc@vger.kernel.org (open list:DOCUMENTATION)
linux-kernel@vger.kernel.org (open list)

Thanks,
Zenghui
