Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB243932A
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720148; cv=none; b=TI4/EBNPwE0uwV7RIbVasiU2YSJB0Zaq8RzzPfUNtdb17PKYWOX8eVlyZna8GLb2Jr/0IwE0NWiW5Ce/Yb974zYKwYqxWlGtjmiXRGUSUQU2ssfeITuVpiyOEaKLID9sDYLG3vx/cs+kWbzWFGW1o/K2YtXiq+RywIFQ0cjDodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720148; c=relaxed/simple;
	bh=JS+1m//6NLMSNWEv6Q6u8ERqLZEq8OCqXBW/PAXOF6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEVX9lDORp6g+rEzC+aJsoXJEpv8YzLqbTOzYukLUvD7WJv4Y4EO+1PpY8SpdRl0KE8iYRUt7Y8suPWn2z0OfyE7stUitrYx2Wev+V6MaCoujqoonmXQlOdfeL2CiuOY+Qe8Bqrjj0Abrf7x8mp9HurWhxVMKDtMF3lpu9i9vIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=hY0BwKZv; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="hY0BwKZv"
Date: Wed, 22 Jul 2026 19:35:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784720141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwU9QTm7j+jTP35zxtPppgNXgIEiRGOttcaWAtTsc2Q=;
	b=hY0BwKZvER7zWDnYjAsaMaVOtsaoRhY4YHgzADmsKZqUUB0nT0oY0TXmtBNOkQAGVLmUjj
	X1b7TdepXZ7Zaqrf0TLW2vRUIM00aJ6Yg40NdQuqDufknUymWNwbmPoej7fq00JMV9yKoV
	7kZYijpbNwbGanlzoROZREMCa4kNttqE/MEeBy14/eIJxg914z2xa527Pj4OAzx8jwRBN0
	G/SH/tD1/f7cUZfca+buMqHKbNU3oriiqHgwnqP/1egwnbZsi0HBqm2UQcTqhPJL4HXXtc
	RYHKOPGT7zhMkciCQlN9n8S9skIFcrZ8I1H+gqtRuNpeXIA2P00dw7g8HCzvDA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] docs/zh_TW: process: localize terminology in
 email-clients.rst
Message-ID: <amCrB5xVlENcIzAN@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-6-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-6-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:31AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (文本→文字, 菜單→選單,
> 設置→設定, 鼠標→滑鼠, ...) and sync with the English original: mention
> the Thunderbird "Toggle Line Wrap" extension as an alternative to
> editing mailnews.wraplength.
> 
> update to commit 4971ca2007e3 ("docs: process: email-client: add Thunderbird "Toggle Line Wrap" extension")

Better wrap the commit message to ~72 columns?

like this?

update to commit 4971ca2007e3 ("docs: process: email-client: add
Thunderbird "Toggle Line Wrap" extension")

The same for 03/16 & 04/16.

The rest of this patch seems good.

Thanks.
