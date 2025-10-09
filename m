Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E0298991
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759993150; cv=none; b=OHXLlWfARLyBx5wnd1u29+C0tX4vhoRa//BW7e/dYO0ZQ6IJ6uUlsM+Ddbb1t+PARYaSVUGI/UUjukI3HR2iIeWaVJfD5zVAHpd0AtuOHtB4t0vSF4pqd5W0N/KXA64cBTLP/jpS5rEFJ/7VLopGMWh4eyzWxJLUgJQHeIYM5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759993150; c=relaxed/simple;
	bh=Ie6zA82yEtCBz5vjBchACMycL7iZJt10L9hFBZj2lOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFvtPNy6B0FWrZDXIRpC78O5uJQLAD0PVSkvnlu1gWhY3ayRJW6dIFFLESdde1Iv1hH7RDw63pa1kSNUczdTJA9bsQ5tgH5Ygl/LKuj5oYLCzciCa7T5T0y3e9klMx/DNV175iZQfNGwhevvHctm4Hp0ddxvLjMgAI68m8X/pwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JZMx9g7a; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JZMx9g7a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ie6zA82yEtCBz5vjBchACMycL7iZJt10L9hFBZj2lOw=; b=JZMx9g7alVTb4c/D5AAeMYQLFH
	wnoIL66829RVytr9q+NxkoIMB/bKh7tRgiW94AomXel2XdiNFg0YJ/AiZrCAIU0iYo3R+VL2KcFtw
	ft5QY29Xji+JPo7OR6Oy2T4n1bs1x6Lyg0NUt7ElMwkZBJSA+41mQfZ46lnuRnvobihL14xPCCrZi
	02ip1ySUyQKl5Bpp+Z1eUfizy4aeEspqDAzIDAiDmYCo8IRiXRDKc+mHyeImC8P+q19xPrwLkOYKb
	JazAdRVLzTrGQp5+S+6islTUwhirmwDCnQSf1+3933ao5n+bhpwCbcrpN4ukShc8X9HWyT34JwfQT
	MSM7xptQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kcE-00000001FRJ-1BoM;
	Thu, 09 Oct 2025 06:59:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B4E0530039F; Thu, 09 Oct 2025 08:59:04 +0200 (CEST)
Date: Thu, 9 Oct 2025 08:59:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Story <peter.garth.story@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: EEVDF vs CFS Clarification
Message-ID: <20251009065904.GZ4067720@noisy.programming.kicks-ass.net>
References: <CAEC0iFCK6RznO-_bAuEv80U_6cMMuuPzJptgOMGDZaxGpXY5xw@mail.gmail.com>
 <b5882598-3765-40e1-b2b7-9fb495cf6eb1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5882598-3765-40e1-b2b7-9fb495cf6eb1@infradead.org>

On Wed, Oct 08, 2025 at 12:01:30PM -0700, Randy Dunlap wrote:

> > - When I'm running a 6.5 kernel or earlier, I am using the CFS scheduler
> > - When I'm running a 6.6 kernel or greater, I am using the EEVDF scheduler

This is accurate.

