Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB66285CAE;
	Thu, 18 Dec 2025 22:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097292; cv=none; b=WzpOokeRPuu1Arl2+CbuaOuOMpaj9C4Lqt1M0SDBgVi19dttSiMBHUevtff5DeWOT6k/PUn9Veg5KlT07scgFzx1TBis4/VuIbVGul7JPRbN+S0wuZc3VFoGS0xKaBay3aVM6Sb2t9vSLEucHxfia2PT6VAvCHW83SdZPzT6Rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097292; c=relaxed/simple;
	bh=F1clP+TgIrx8yAQGZ95QpOKCNm6xz8D8rlXjso+rmNc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pnoIPFxPb3fffNx2ka1rHz5c6BxPZm/jo0ku4UW5qK8O7HfZm7Y58iKg5z3SynSpC9WcmUOg1mQGjQ434dJVlHRMopeGuvpjVDXzfdegumu5q+sGTG8c2EMW/P0fXWEdFTxPEE74Vwt0b8b/3sBM0f3SQNM2B+W9x2wFuEL2YVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RhYTkQ6S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RhYTkQ6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FE2C4CEFB;
	Thu, 18 Dec 2025 22:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766097291;
	bh=F1clP+TgIrx8yAQGZ95QpOKCNm6xz8D8rlXjso+rmNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RhYTkQ6SVHny+UgmgRckd08McSyXNsVnJKIEGcJ7CB1zFezQd4xvO5V+++uKQLg6v
	 iq7WCcDUFsRgGunBs1y+8Xt7DjNLCOd/UNRhx3Gp6uiDCIvbPJT6ifowq7+1EtioLz
	 Wms+UJTOY11wx2Zrt+8FaEGlGH/khWaE6Zs/vPM4=
Date: Thu, 18 Dec 2025 14:34:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, rppt@kernel.org, dmatlack@google.com,
 skhawaja@google.com, rientjes@google.com, corbet@lwn.net, kees@kernel.org,
 davidgow@google.com, pmladek@suse.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, nicolas.frattaroli@collabora.com,
 linux-doc@vger.kernel.org, tamird@gmail.com, raemoar63@gmail.com,
 graf@amazon.com
Subject: Re: [PATCH v2 0/5] list private v2 & luo flb v9
Message-Id: <20251218143450.6570952779c195923830c02b@linux-foundation.org>
In-Reply-To: <CA+CK2bD41sMDbN670G5RrNQ-3Qq36dO3LmD18zFu6uc9KxhRzQ@mail.gmail.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
	<20251218130725.1b93a521c039ce121de62472@linux-foundation.org>
	<CA+CK2bD41sMDbN670G5RrNQ-3Qq36dO3LmD18zFu6uc9KxhRzQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 17:30:45 -0500 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> Point taken. You are right; the cover letter should be self-contained
> and stand on its own for future readers. Here is the standalone
> description of this patch series:
> 
> ...
>

Cool, thanks, pasted.
