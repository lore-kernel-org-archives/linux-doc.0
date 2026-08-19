Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3237B3FD;
	Wed, 19 Aug 2026 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164707; cv=none; b=fJL5q0fGpvTvRC7vBxZaHKIbE7JjeFz8JHW5d4ySeJ4m1cY/e/m523S4icJhZeaGym1fPBD6eHbZVgGG2mlpd/LX/mG3MP1ZISRo9rL+a3zS8HiV9JLiiO7dqSaCKQHtPUouH7tDs5VWRW2BnBuWyBc3an2sX+Gf12ClkxPQA20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164707; c=relaxed/simple;
	bh=ZDGQKqJjm9DNsL8hu+JigtPYRdujwebfPdscSfxSWXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdcVI4Z6tfimaPJzJsjtT7ijKTetV8SZso0YTzMlLLVlf5x+ihvPGgFjB+yPwTct4dksQHQHDtkq/Dcf7VCSLIOCq5ea+RIbeK50rKkPn6oaFWpF0926W6HktMeu1NQyA1jQ+ZsWOZwGdx8vOvVLuMCjR2cFU9ArroyJVHXrA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oK4qsXue; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oK4qsXue"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=9iLA/nnuFSMPcd5g2G1X6oGZtQewfGf9RBF50tNjXLo=; b=oK4qsXueA2Jk7esON5Rp8YjKe/
	l3K/kHxSeigbI4aiqxcFqnDoaJvFQsb4B39Vb5sgGZzmKhLV+seriVX6LmW9wIyPH/1sDkAMJ69SF
	we1eGyLXm4Wnwps++p1rCqYX/32x6wWP2pFX6jB8dADoZT+fNaNl7Dr/z/WR16R8o9R6aC8G57ze3
	ikC1zswopHNTixM/cLAeQv1oW73JQ6oM1hcZlqnMDSlUfGjcmaE2hU8kbAfT2Dsxd4L8JaipWZiYB
	Gu1hftpgQ72ER43/154g1xb7SOnQigoQ66Zx0SRdQgLu1Cbsg6nlGfj2L8kWCCmGOrzyOUvFMh7e4
	7XI7Qnkw==;
Received: from [179.135.28.2] (helo=[192.168.1.56])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wwlB8-006Eya-M2; Wed, 19 Aug 2026 20:38:22 +0200
Message-ID: <09999b16-d081-b3eb-eb9f-8857c2895916@igalia.com>
Date: Wed, 19 Aug 2026 15:38:08 -0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] docs: panic: Disclaimer about console verbosity when
 using panic_print with pstore
To: Petr Mladek <pmladek@suse.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, feng.tang@linux.alibaba.com,
 andriy.shevchenko@linux.intel.com, kees@kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net
References: <20260805205026.1699568-1-gpiccoli@igalia.com>
 <aoW1F698494dIOyg@pathway.suse.cz>
Content-Language: en-US
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <aoW1F698494dIOyg@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2026 10:52, Petr Mladek wrote:
> [...]
> 
> Make sense. Few nits below.
> ...


> 
> The long blobs of text are hard to read. I would use this opportunity
> to add some blank lines, for example:
>


>  [...]
> This is too focused on the "delays" problem. I would write it a
> generic way:
> 
> <proposal>
> 			Please be aware of the caveats using this option, see
> 			the 'panic_print' option for more details.
> </proposal>


Thanks a bunch Petr, I liked your suggestions a lot, and already
implemented them in the V2:
https://lore.kernel.org/r/20260819183419.2203903-1-gpiccoli@igalia.com/

I've added your name as Suggested-by - hope you don't mind, lemme know
otherwise.
Cheers,


Guilherme
