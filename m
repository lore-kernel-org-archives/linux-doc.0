Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058788;
	b=j45znZjJmlpL+wYZ10qH+dSLL/uDC1S/kKM7apsOz4Fw60h/jU0tBW/bo4oscIbXYgfN
	 evhKYHAnUkiY0/0SxjoLRDoOfiPRLfEfHizl8DWQJ+nA//Cm0hi06Bt4znnGR5kaLLWSM
	 juWB6tA+ziF8JuwXbuh71lVef6Kl2XoiRDOwGZy/6ZRel7YqfnxMe1aWcg3UJpOTqnZQ/
	 c9w5ZzzYqpZKncm1C3L+P/QLsjRLLbUPlGRRiuesSwabOim0SodQX1vsGfrrIkCX9ByDa
	 JmFT/X8QMbjeucp48KfNL7iRcCOoJJEzEU6PcJl32ERr9rqzsQj6FJazLp4hV83HQsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058788;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ri+TfwsOnP7xcZmzKWrAYSmFWOQ/jDasWw5uN85uc08=;
	b=CyDdTvjUfmC13pwa0UTHnZ1v6LHpXExiHDYFQD21k9c5TYdlPhw6AV7q8qZFAxXhh5Sa
	 5WzwcHdWt72Ja78mESA0l0Y/b9r97X2Xvw5fPjmo5sfgxh0LjwYUi/aRnGB6YqLw4nJKD
	 UQmNIv5pKgB7caWpASZ5fW0A9f61beXs6+WRPMpsP21nOUjzD8tG06kUED1SoxLDSbjcC
	 9FExMaHzxhKu56FBADlpaknXImzKT1lJZv9w2uI/ll/R0p+xZt6eh7uApPLDYRT9uJ1ls
	 kMcpSxkupMvK1ycilrs+6ZZqFfhqwp6TfU/o8i80DZqYr3dL1G0XIH00Fm4QlFfgjIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=VcwWTGiI;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5058606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 13:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5058606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=VcwWTGiI
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ri+TfwsOnP7xcZmzKWrAYSmFWOQ/jDasWw5uN85uc08=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794058785; v=1; x=1794663585;
 b=VcwWTGiI/NoAxIhAKMSPXWipbOQG8hZp2FtIZlbuAiUHnWHrYg79oY6wvwmWsGkxAi/jkO+l
 mbShdyr2jHZC9yilUKU+857z1mZrBpmYFoc6ma4aG+FkeSI7fUn0KnXLHc+35XL+XGX0VRw3wZU
 O1a3oORj/pikFnp5eRRB1sdGLmLinN66EKPrZj8r5YbunVNVJeaJbg6yLcYhUlIadBeTfuMRKUX
 z20LG8ocwUgmt51lEUpPI0lVfSiauCJmMa5oZNQnLhfJuA1y8DTLDo7wQ2Xo0E9gITd+cObQCd5
 blBEZIUu2Gr17Hg5K45zDkQE/VfdtztAsHj2xCCY32YdA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4c603d33b053550f;
	Sat, 07 Nov 2026 13:39:45 +0000
X-Mizu-Trace-ID: 4c603d33b053550f
X-Migadu-Flow: FLOW_OUT
Date: Sat, 7 Nov 2026 21:39:41 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>
Subject: Re: What's cooking in Chinese docs (Nov 2026, #02)
Message-ID: <au8qHT4-7VUe9o0D@wyuan.org>
References: <au8heODCJCmmCWKA@wyuan.org>
 <CAD-N9QU4tWCoXyt0onyRtSOM_kK-MHRmJyjjNDg7YRsq033yiQ@mail.gmail.com>
 <au8nT3DVrC4jJicS@wyuan.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au8nT3DVrC4jJicS@wyuan.org>

On Sat, Nov 07, 2026 at 09:27:51PM +0800, Weijie Yuan wrote:
> All above are changed in my local copy, will send them out next time if
> anything more updated.

Nov #03 sent out now immediately to avoid any misunderstandings
regarding the status of series.

Sorry for the noise I made.
