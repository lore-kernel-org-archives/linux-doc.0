Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DF36A34F
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516029; cv=none; b=MBtJhc3CrA4/TlKrF+qaeVVBqjofl1vG8eMgrvBqyjgYrkH6KhYCuGrLhsdi3qhHepTf1K1meHr/+LsGhVGL7HsEu8Fpx0GLflmg0jbBBKPUCLkP25z+UT+aRsseyLkKAWcwK5ScTfNZa8fnm60ZjpqcXmr+8RbjyjQFD2Wp6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516029; c=relaxed/simple;
	bh=gb/bhCaBcSofH3UK4c+zcu/cvaDEFuvz4M+trIwJIxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e12m4GNe390hxYBZPrI5PXSuLJwvQEZ+5qmY/VCN/HSGL0HbHySenXrfLL+99WqOsUWAEdlu87PBIoOtrsZq3p2d/Q3oN9PTd3ZO4m4IfLSrkWPMgBzlKgNdFDMYakf1u3DEjZafxfA/4ZsTGHcCQgKcexAsb7p9/SPV76N4cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=rC9yDVsh; arc=none smtp.client-ip=95.215.58.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="rC9yDVsh"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gb/bhCaBcSofH3UK4c+zcu/cvaDEFuvz4M+trIwJIxQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788516023; v=1; x=1789120823;
 b=rC9yDVshzzOntEgtbBZWNv/+tg1q+3Ok2YHZbtUL0w/+n9LKueZdXAhyZ17DCeJjz7puKFqM
 kX7tC59YHM+LFLtyQNR+uiA0z6VJ/puj97NVEyCcWXksWXemPPun+SiefDSBEm8+YCF4M+jwvDE
 +X26vMXviy8oKKTMRw34XKf/lLUuF+34KYLqc7WOxeVSnAV1A0wKh+Udnsl5Y8h/0k7Mu9xSIjP
 aa8V14z8flPJyFcvOQheq+OTLIrG2BKwbXSG9RBJiM4eJaMpa2zWsC85QsFaxDNvHdWKw6dH+OY
 yTtMr5KY87YHxq/T38Ua5Y3Dhn1dFUMYuQBobS09mb+4A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 00a224914cde8bc3;
	Fri, 04 Sep 2026 10:00:04 +0000
X-Mizu-Trace-ID: 00a224914cde8bc3
X-Migadu-Flow: FLOW_OUT
Date: Fri, 4 Sep 2026 17:59:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>,
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
Message-ID: <apqWn2EoguCwX5po@wyuan.org>
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>

Hi,

On Sat, Aug 29, 2026 at 08:48:07PM +0200, Jiaming Ouyang wrote:
> From 395948212144549e20cfcdbd053817c4e068da35 Mon Sep 17 00:00:00 2001
> From: Jiaming Ouyang <jiamingouyang13@gmail.com>
> Date: Sat, 29 Aug 2026 20:35:37 +0200
> Subject: [PATCH] docs/zh_CN: add usb/ohci translation
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>

'git am' complains:

error: git diff header lacks filename information when removing 1
leading pathname component.

So I guess probably you don't need to include these email headers in the
changelog/commit message?  I'm not sure, but you can take a look at
relevant docs for this.

Also, instead, please write some meaningful info in the commit message,
see:

  https://docs.kernel.org/translations/zh_CN/how-to.html#id13

Thanks.
