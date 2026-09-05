Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03878314A90
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622155; cv=none; b=aNLslOfrLcBhlh6oICErFXyEs+Xxl3nPfgeYpCkwcEU2Vc8oZIUIYb/l1X0yaEgw6iVy2IjTd3WMnZdQXiuvbLvM6jfdyQ6h5vQEHBtvDYYsXKWCOXrkVo6NFZcCi/BVJO39XcEsAEkXghTHaj/48Eo9syQvBr0jJwTBg8Ix0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622155; c=relaxed/simple;
	bh=5f2NJtia5rl9MGCcJES+0tqBT+y20jSTkAzod6g5yJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNC/E8F1JZ3oR0iOfNJe39YBWcXQiVOR1I0J+9/m03h5TxbDAWi2CaXJsPcuG20lk6ZAt8vybfjQu12Ykc3HLDgghxi8C5kzSr0I4yMmAtV9/Fa13EToArNzniSTP0MX3ed/2/826bS7WFoufprWoDgXzLb6AYTNcI7YiiFK7ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=DnIflZUB; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="DnIflZUB"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5f2NJtia5rl9MGCcJES+0tqBT+y20jSTkAzod6g5yJA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788622149; v=1; x=1789226949;
 b=DnIflZUBFd3uJ6pWGqYBJPtir47/ve2wV1KvMaMXPvIeBc0OPFCXBuj/ZGGNtg4zcKOS3xwS
 TFyI2pJ2mSZ6OmMpIqWTkJ0jWd9fS3hdXgEvNbJIS9XUnJezVSTlsDnoyccNiBCtLaWzBkZuESe
 SsimkngPvJEavOlbMf8G9EvTpIE6L0YYTZ01kqT9gQGWX1Ud1v7QiU1Ace02cnOE8FBfEwVX44c
 R+UVgK/NFh7O1ODMrucckab+8OTUzsmusr2XSIwmMbBmNhNeFXGkNZ/qeHUmN+1X194CRXcdjYi
 0LlcC8GvItP+rbGe2pgIXvicv1F1JoXGmVvqijm6pGPCQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a99cfa15dc6dd0a;
	Sat, 05 Sep 2026 15:29:09 +0000
X-Mizu-Trace-ID: 7a99cfa15dc6dd0a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 5 Sep 2026 23:29:00 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>,
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
Message-ID: <apw1PMXXv2JmDX29@wyuan.org>
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <apqWn2EoguCwX5po@wyuan.org>
 <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>

On Sat, Sep 05, 2026 at 03:29:36PM +0200, Jiaming Ouyang wrote:
> I think this .patch in attachment will solve this problem, and the

Thanks for the effort, but sadly, "no attachments" is a better practice.
;-)

See:

https://docs.kernel.org/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

Maybe you can try git-send-email later.

Anyway, I manually saved the patch and git am -3 works while git am does
not.

> commit information has been modified according to your feedback.

Yeah, I think this one looks good, though.

Thanks.
