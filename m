Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F172F7477
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020947; cv=none; b=gxjlmk011yVCMHXHTGUOSs33PmZ2mdFO861EZbJB4E/i6I0MsmR6pzHiqF5MUPjLf25JU46yH955uQFIueeMbib0ehOw5T6x7Eskv4uW54DtZ0VOFrzhqy6pCASoegrVmJTRzj8lZ89ntuZYQbMTSQ+xXYJj4JFr3/NoauBS9HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020947; c=relaxed/simple;
	bh=9Wnyfu+XaOOZnlufreHhCk7JiqaiO+DPUVXZqATdgmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaY52+RbQh30UPB2Ixz2mZxt8U5mKQ28t8BFxt/x0BnzC8bJ7PCo0Bpz3nxivkqccx7pmED7ajuP7CTC3G285UsvTimHjfC+pRvXL4DvndtkQ/iYJCNmVMan+mLpRKnOFvzbVqAcBdndVoXdow9qTilc52u6nvF7Y7H4bmn0NG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1NVraV+b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1NVraV+b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lrPIpyIK37IliP12r4RxpJdSz6iDcvTig/imS+n1pZs=; b=1NVraV+bxzQ/9gCkBMs1wm/QQD
	qHdTa3Y/z2Y7OjG8BwS50zH6FmrAreVNBae/1EbYw7vONudBNG2B0KP//0kqnlH5oBPDDmYpgEbWb
	jZCnVgV2ZeEn4X6B9RWHNSaQGN6dBn521augPEKGhGKiN5YibFQNo3Bfu5a7GKIt0rOHhFlWEoe8+
	cMnzzh3HFsz59ek7TmXb9cCE/XGfhXVJrXaRSlvGraICX769vZ4ciI3YYKgNxdN884lkAjHTzLKzU
	13p5PuvnttDmqxouIIf7yPs9NdUnOaeEUXqnRszz34I7esSGyPCwb/mSbXEu+lmnKd8pCmQ/SZFyx
	SgKhDWew==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult7M-0000000BeBB-0ekg;
	Tue, 12 Aug 2025 17:49:00 +0000
Message-ID: <36b8eed4-2148-4d73-af9f-5614060f9f54@infradead.org>
Date: Tue, 12 Aug 2025 10:48:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix spelling mistakes across multiple directories
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, jaegeuk@kernel.org, chao@kernel.org,
 dlemoal@kernel.org, hch@lst.de, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 kuurtb@gmail.com, sj@kernel.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name
References: <20250812173903.43333-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250812173903.43333-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

The changes all LGTM, although maintainers will probably want the patch split
up by subsystem.


On 8/12/25 10:39 AM, Soham Metha wrote:

> -Availablity
> +Availability
>  ~~~~~~~~~~~
>  

Whenever a heading is made longer, the underline for it must also be
increased in length; otherwise it causes a build warning.

thanks.
-- 
~Randy

