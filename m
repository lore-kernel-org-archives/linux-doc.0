Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC16271A7C;
	Wed,  9 Jul 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049534; cv=none; b=Zun0MrKiL9UPq0553hx50ky4F7iOq11ik3uktzKlph/fze8Tq0m0oGqMw327tXmTLJloexf/ENfYSroelLn7NIf9xSd9JhPoWPxk3sY53elU1HkVcBfUb3pDQJ896jSa2a83MKdu7Z2RqgefuM3yCKThFoQn+EkNpUijHLE52Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049534; c=relaxed/simple;
	bh=1K6P4jQQ4oUzs76Wesuk2nfLVFheuO4FQrKaoIRvi6I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbgVpxkW37RcUfXxbfNSaRStiyjgxSwepT18uba+L3ROCGwa/JRENeeE9uRKBc2dDin802E6LOW9ExriDMiN3zkbPbpqXaB52gDMVZg5P9x23OS92M7PRfU4uJaBAeTCboRJ8tFornhYa8SifS2HsEcvG2xXPLVglBn4LrzmgDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKe0N6Vt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKe0N6Vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381A6C4CEEF;
	Wed,  9 Jul 2025 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752049533;
	bh=1K6P4jQQ4oUzs76Wesuk2nfLVFheuO4FQrKaoIRvi6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vKe0N6VtLnBJ7D1ryYL1Brpljkh4qq3F5kwux5rDIZoIUa1gADvx6drhevwDn5x9E
	 j38KbGt2D/D1bah7G2JdgmfTfCnv+SoDbFRIRmgOfkPJlkJwzdz5jcWV/UeEI+mAZK
	 vVNiJVGrpscLmbscIY57YjtHIbqYKwvDjaUVXH60jxQyHiK7IY50qYm0BlAm8gVZPI
	 j7Az7873ZDs0n+VPRikiquEeXyCZeYuVRnRcM73OUYr4oe5AQXj44dseAeWxpiazZd
	 Wr7MlQIkGSJAVXCgQiTX43JmSoKLvpCOQ2U49jxQsls1OQs/V9bwDjITa2aq6FePaP
	 M4gakSN77SmyA==
Date: Wed, 9 Jul 2025 10:25:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Sai Vishnu
 M <saivishnu725@gmail.com>
Subject: Re: [PATCH 00/15] Translate sphinx-pre-install to Python
Message-ID: <20250709102528.07adf648@foz.lan>
In-Reply-To: <87zfdmmbz9.fsf@trenco.lwn.net>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
	<87zfdmmbz9.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 02 Jul 2025 17:03:54 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This series port scripts/sphinx-pre-install to Python. It started as
> > a bug-compatible version with the old logic.  
> 
> In my limited testing this seems to work just fine ...  Unless somebody
> comes up with a problem, I don't see a lot of reasons to not apply it.

I'm coming up with a bigger patch series in a few. Just re-running
the tests to see if everything is ok now.

Thanks,
Mauro
