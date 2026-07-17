Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA0345CCE
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306661; cv=none; b=XwFjuwbizuhBRv44jC+uOxjk0tfKPb0xjOOVszmhNLzdEd92HMRu8ZksoZbfzK8zukX7Sq1LLcjWldB8ebCTPSzNr5J5f4oE5KLP8OCqtvj7vGK/3te+9R+LOYOb2xC4JHkapyzYvQuwZ1nz7/PtRAksTVsiWmD8WgiTZxZBvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306661; c=relaxed/simple;
	bh=FjQHx1T6pTH/PLe5XKP+CqTkrZwyGk3703IvmyuRNEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9TCnkZ4r47Gcv7Xnb1IB1QSA8UM6hyzGPV3An9EH+kFR21I1eOkOh2UPhHNWgCHefL7U8y50ghoPNOYSOzLY+LAn9lvEHHHkJdOK7gJSid1b+VaH374qxkvKsznh2bfUZlWxIVS09ngEmHAFcVAvq6RFtkF90nonrPwmPW98eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Xdlvs5lg; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Xdlvs5lg"
Date: Sat, 18 Jul 2026 00:43:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784306656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ksJbgq0ipSIBR1uxoYOfsknHukSpHIxAmnMcU7PowSs=;
	b=Xdlvs5lgDsxVn5ip1mSaIAKs2nKgAU1bLxGm0QvrX0h+q8E2y3L/cGVYhD1cYhgqyvxBsz
	aSRZRGMrzOydzzxpqyb+Nl3cCuabaHKKGKNm9rhZDbNsGFUQx29cHxJXvwS+1xTL8VHWNS
	EhDl3Y/3Y8myIfsD2njSBN4BRNaHJe8hBkAHvcRM8Omovjs6LpnRJs5PBBFVMGhot3Lvsp
	EJtnBBUSuVazxaWNUZdXv6b3wnAtJ0TQ52W+AboKliDinypHrIYkY5vhMTHpEem5QsinhK
	ACck+OZCg4MAyjG1Ynm7ZqqEH3fG529tf1Kv7dtDv+yBzbNMJFQD73DBRZAylQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_CN: add process/applying-patches Chinese
 translation
Message-ID: <alpbykBaX-8BkUzB@wyuan.org>
References: <cover.1784289654.git.wy@wyuan.org>
 <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65902acdaa37438479b3739e907a9e0ff604c55.1784289654.git.wy@wyuan.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Jul 17, 2026 at 08:07:42PM +0800, Weijie Yuan wrote:
> Translate .../process/applying-patches.rst into Chinese.
> 
> Update the translation through commit fa04150b8ef7
> ("Documentation: describe how to apply incremental stable patches")

Btw, I don't know how to write the commit message here.

I translated the entire article, but it's obvious that the latest
commit of the original English version only updated a part of it. So
the commit message written in accordance with the usual practices
and rules is obviously inappropriate.

I am more than willing to make the necessary revisions as per your
instructions.

Thanks.
