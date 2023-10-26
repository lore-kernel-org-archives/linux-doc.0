Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6AA2E3F5
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hKuRaPqY"
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E6A1A2
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 07:07:25 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C24FB99C;
	Thu, 26 Oct 2023 14:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C24FB99C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698329244; bh=fIQHHyYaWCO2pipXRxes3cmaSN7jkfvzA/FW3860efY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hKuRaPqYYua2oPTdWL2GhLKNhE/WhH+0tgQ3xrSgdhJ7RX8/obAEkOdHgIKwPhrfD
	 trzOVVaCTxTt/vo+l79BVVm5/CT4jGKo9iIXInIjlAH6bAedseXOAU2tPs3CeK1IE4
	 ZIS5SNmU45e9FeD8DAvYY1pBLJmCMCwyRNqqTQzHoGjTqQANT/7hvml2s3RYeAYE2/
	 s0ZwcGPKFF+TW+2MFX/s8ewN45IiwUGTrW5pazuWN59twdiHJJoagXiVaQdbdmcTW9
	 Z2avKh2pxVkEqH86zSH8eYUF+F7CeNWzK9A2EKrAaXj/AUaIUh4NaYKp4TQFKBVcxu
	 RJU5HlkDaRZXw==
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Leitao <leitao@debian.org>, linux-doc@vger.kernel.org
Cc: mchehab@kernel.org, akiyks@gmail.com, keescook@chromium.org
Subject: Re: kernel docs: Fast sphinx-build iteration question
In-Reply-To: <ZTpvO3tGOkuq3Q9Q@gmail.com>
References: <ZTpvO3tGOkuq3Q9Q@gmail.com>
Date: Thu, 26 Oct 2023 08:07:24 -0600
Message-ID: <871qdh8okj.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Breno Leitao <leitao@debian.org> writes:

> I am working to build a sphinx extension in order to parse some network
> netlink YAML.
>
> I am struggling with the time it takes for sphinx-build to build a
> single file and run my extension (Directive). Mainly because I need to
> remove the `.doctrees` cache directory.
>
> Is there an faster way to iterate while writing an extension?

"make SPHINXDIRS=dir-of-interest" can help a lot.  Otherwise it's just
painful, sorry...

jon
