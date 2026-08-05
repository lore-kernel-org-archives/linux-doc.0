Received: from out-186.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF53DE453
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912625; cv=none; b=YIr5QWC6COWQ92RM+wXghFLSPOru92IEBd/sS+2qCO2g+jkwJP9OF8UJW562L5Xc95DXzlSr0UBadgo9a94HB4pgszgihUhn7KN/Hu9qJTzK/SnWiZbxTp377VgVZyu5GUdxTi7XVDbK5JF7u8YKFo1E2LcHTqE0wd0GdlNpnUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912625; c=relaxed/simple;
	bh=hgYd0++50OZGmD/HFFSD2UuS8R6Q054PdSAGyYhAxDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBB6PRAm6FgwHATcIpKLBc39pN4rNUnqhx/obwcqlZiDMyuCQB2EyWpfEnPRwxGmD2zHlZC0MtHkSpPVY9M7hGO4/UFpr0bClwkk52UrH8U8Lc+f8CEp9U3cTjY96nYppGeLpT8b9W2SD128gs8I6SfiBBnagiQ4dGazwUzyXmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=tDavDdkU; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="tDavDdkU"
Date: Wed, 5 Aug 2026 14:49:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785912621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqYDKU+agB6bvXxNBx1X6OE93x4H4MGsXirqespjRM0=;
	b=tDavDdkUNJN27Db3KYyOcWGhuO+9MjmZ5OJ44uJXZKjQzG33bWh9MQs62at+v0opsKhe1e
	gwGVrSoJ14FQPcF/ztZX1mNFHNqr3tvcZ2GKW9qsFFnWvTjGtn/Uw0KgJuZhE/E3R3N4W4
	rsbiHlyRhJMnmdoz30zw7D+/KcsKxMvw7sQNioKPidoZ36vYgyCzVyzKUxmE/cKDEqppF9
	0hNiGco3TqcLtw4/UYPz9gAxmeI1omAJZIp7ASsvgyISffpUwcCmx5pBEa/8b8X7hSuV6l
	N3u8mUSB9G9/Ng8dSnrqSOeAlL1nkRfh2VCXSPLBhHRC+Au8IsRiPfcQYkKUgg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/16] docs/zh_TW: process: localize terminology in
 embargoed-hardware-issues.rst
Message-ID: <anLdFtHtcZMNpyIx@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-13-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-13-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:34PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 硬件→硬體,
> 信息→資訊, ...) and sync with the English original: silicon-vendor
> wording, real PGP/S/MIME key URLs, updated Linux Foundation IT
> paragraph, disclosing-party responsibilities, shared-resources rule,
> the new "Early access" section, and the current process ambassadors
> list. Also fix the broken zh_Contact cross reference.
> 
> update to commit cead34ac1ce1 ("MAINTAINERS: update ndesaulniers")
> 

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Note: the translation of "Linux Foundation Fellow" remains unchanged.
      As Chen-Yu suggested, and I also heard many different opinions on
      this. So let's leave a note here for furture reference, since the
      main purpose of thie series is only about correcting certain
      terminologies.

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../process/embargoed-hardware-issues.rst     | 209 ++++++++++--------
>  1 file changed, 122 insertions(+), 87 deletions(-)
> 
