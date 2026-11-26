Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701191;
	b=dbt8P1CDBOoESD90L0G0uWFwBwgI3JI5gxI731vFKsWRSDVPp91HXKbxMQtMwXZHuuON
	 vyKvmHFFNEaa8KykLTf4mn89nWhns/A9fLN3mVe8ssswQdGUKksVIwVXPW8KjrO2bTi6X
	 9aTV29GUe0A2H7PPO97treUGAz0mrpTDMQ0zK+d9ta9Wv47ssfnExp7TME3ysnPBieztZ
	 Kr74hHp4C8z6g+a94HpW/flA4F/b6dsRSEiDYOypVGdRS7Mx9I1D9e1K6pyMYnsHuxdmd
	 wvYEJpCKeeQDUAWPxYW5nDrmvek/Uo4SvN/Z1r4bXysl0IxbGzowcreTpmEirrsd2ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701191;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wBNF/N6dV01CZXPBjN7hTYh2V25GC86ewPpc4xVTK6Y=;
	b=azHu3PL4CHMu//YCA4NuET287PiznhIcmcPQif7tdU/vSHgnIt0h2qyG3t0f3eNmSF2C
	 IyZyCtnukMlhBKmwp9NpmjnyvIW8aG2MFcKuSg7WEm9bsL0m3SzPtTxMrPny+Mq+UNnAj
	 RULIcca7rPRmdZ4Bui1r7lACI05YosVuA24a10HAonhZ3w19dMB91IUONtBuYV24Tu0z9
	 6SrotCm1LLfs/Z/Bf6TwQsk1xUHdG+1HOS0U0gEhM7cvrcxlb8rbf41Ldo89NEMeQpIBK
	 jDltmEKJ6PDG0/MG1IESnpvM/6zacdj707aJtod3wWDsK8p1H1GGzghCu68OiUNIuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=n31L8E2O;
	arc=none smtp.remote-ip=91.218.175.39
Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E53606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1E53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=n31L8E2O
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wBNF/N6dV01CZXPBjN7hTYh2V25GC86ewPpc4xVTK6Y=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795701186; v=1; x=1796305986;
 b=n31L8E2OALKvoOVzU1ZbX00BV6t9pq4nic5j86P0CuIY430bBRGaskE0PWsvHYd+7LIm/zvP
 AzghWd5uJcA3BbjuHCoNWdV04khtlsJ/mTpO+4oGBZJysFXcPPDke9KmHwup5eSXhPV5iMR2JYP
 /X/2ukpl6tQy4cbb49tv8ThsfxLYdTAozhIfxQGrsQvKda1CmMQXkc+J0Q+AtyadCqT/ZBM7j5v
 d1A28oEJxfdR94x4bwGG8jyIpwerYzKjBETYbUU2GMO1pveBpdYO4z2FmmE67efGWuH0Y5Mpa1t
 8/gLEH/ISX+0rD4ynkC9E8Fi0C57tIaYol6Vw0C6O+KnQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a22f4692d3e40a9;
	Thu, 26 Nov 2026 13:53:05 +0000
X-Mizu-Trace-ID: 8a22f4692d3e40a9
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 21:52:50 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add RCU docs Chinese translation
Message-ID: <awg5sl7LxTOVqpSw@wyuan.org>
References: <20261126132523.6329-1-xiongwei.song@linux.dev>
 <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>
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
In-Reply-To: <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>

On Thu, Nov 26, 2026 at 09:35:28PM +0800, Bruce Song wrote:
> Sorry for the noise. git send-email returned "timeout" after the cover
> letter was sent out. So I resent v3 of the series. Please ignore this one.

I'm not sure if it's a problem with Migadu or network condition in
mainland China. Every few months, I encounter the issue where email
sending gets stuck. I do not know whether other linux.dev users or
migadu users frequently meet this problem, or just me made stupid
mistakes elsewhere.

