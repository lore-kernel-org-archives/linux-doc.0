Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7F3D3AF
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WhBx8Sk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC96AC433C7;
	Tue, 17 Oct 2023 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697548469;
	bh=4Ynp8qt72JNt3BDC3l87JhLBKu58eC5RE+4kwFTcik8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhBx8Sk0X+QVFI/EHjaRgHxFh9bzGNs1T8ApZR4xqKCZz1TemsNYiSeJGP1uEUvPS
	 isqszJBh9u4owDEA3zOP2efmq32PmBPC8SnrzYW7Rs7VYnmK2+CDS7UKtI22jok+jK
	 RYYbiynVpmYCmEnRWrvr6fHaiuy6BAeP/6BbnnpE=
Date: Tue, 17 Oct 2023 15:14:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kris Chaplin <kris.chaplin@amd.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: w1: coding-style - naming for master/slave for new driver and dt
 binding
Message-ID: <2023101739-tinker-squabble-237f@gregkh>
References: <91104ef7-c9a6-4c65-aad0-61ecb3c29ea0@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91104ef7-c9a6-4c65-aad0-61ecb3c29ea0@amd.com>

On Tue, Oct 17, 2023 at 10:38:49AM +0100, Kris Chaplin wrote:
> Hello Krzystof,
> 
> During review of my dt-bindings patches for a new w1 driver
> (https://lkml.org/lkml/2023/10/13/959), there was mention that the use of
> 'master' is not considered great terminology nowadays.  Are there any plans
> to replace the usage of master/slave in w1 as mentioned in
> Documentation/process/coding-style.rst ?  As we are in the final stages of
> our W1 soft IP development, I believe there is a small window in which we
> can align on our new IP name if appropriate, prior to my next round of patch
> submission for amd,axi-w1-master and get the binding to match.

For new stuff, please use new terminology, but there's no need to change
existing code if you aren't going to be touching it.

thanks,

greg k-h
