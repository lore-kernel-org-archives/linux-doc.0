Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394706;
	b=pjWJOQxg5rJDJbKJO+pKfosEsMJGDLtzrlyzXGj21XN44ZKULdDcgy2Qw6cJhpU1c4FJ
	 BL9DHUSCzlVelsJpvrcxhz96NDPSqgOgf+8aBKosY8CGr8XoBpg73/SBnVi62lSgPoFJ2
	 jK7oaAzAg+fBOYQIjkK0pRdt25XncfBvv7JVsrb74qNG62ftqN8k15LzhHTTO3MabBA58
	 fIaZ/Z9y9OsPKimG/82uWs3E29ZOaHMUdufRi9qh0cO10o5luzaJLUR58uKp3u5UqgIpu
	 RVWh4pkMWt+z2ZryNjgAGrqKjl6HXJGAimha8IiGF6QwcJOTBWHVB4A51s9l/tiZNIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kX99/gXWIZciXrOiBltglJv5UcPXRGkk6vEMktxyA5Q=;
	b=G3Ai2mGDhUGr1OFEpCUTsXxMRe3OG9mkY0OMZeQKvdjPazI4rJrc7WFSz/SsiO7XaeG8
	 Iq9qe/vLIHEZCQ9HcZ1R/5Z6Cd/LgCPrmm8FrGtJsHTeb8mUWMOJFXcB4y5cYu4upFbRz
	 Yhp3bZ47vvNxlI9MqwIMHhLd9wZWwvEusxek/lJ66brvcznM7aTrms6qxqFixqLzOhfEy
	 cPtRwNF5LQMgKOlott90W/8jOXWeONjB7gnjq1UGxV/kf4aeECmrTPztDgftOpUoMHyQJ
	 Qyu0gGXG/ScTgl5OvhHCyxjcJqFypCZ0E/zDGdwe26YixJ9vAV5jlT6Tis8opbN7ztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=NZelCqgD;
	arc=none smtp.remote-ip=91.218.175.138
Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540C1606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 00:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 540C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=NZelCqgD
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zwMKkgyYaXrDyX5PUeYSmlGf6nUyB94pqRxlWXhE6SE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795394703; v=1; x=1795999503;
 b=NZelCqgDqsQOJ0zY2UY/5riQHs/e1UAK1x9k9GbSxtb5X8h8V7DdK7fRmpia7AZSWlhrzaer
 n/dyjjGMhfK6p7HaOvekaF2C9UWay0o8fZzrraGdJCFiri+DfTI6cuElmArIk3vvUaXSofq0kB7
 SpPFwKWxyDUIpBHJ6ozEtcrd20Jty4n1oafvCHNKOlP5IKxOVTHADtIIAK/si7WpAbgB1m+yaza
 VTFOGa5ycYDMcTQvnVfbrvZXHY+PFaJBWQY60I8TiY+ukeFHGn11RL5EiGUDlGiDAuZOg+3wHuk
 QcuYSbp82oX1D6R2iStrSd35ncgvt0dXRB8e4MtIbjqOA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f5d92b824d053942;
	Mon, 23 Nov 2026 00:45:02 +0000
X-Mizu-Trace-ID: f5d92b824d053942
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 08:44:54 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the
 English original
Message-ID: <awOMhisHPuKu-aGR@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-2-chenyou910331@gmail.com>
 <avRotoTK1Gt9MzAX@wyuan.org>
 <CAKspUhKNVoOBRiXxu3py2M=d5uDCjwFL-dWyt_fCTVKxusSMvg@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhKNVoOBRiXxu3py2M=d5uDCjwFL-dWyt_fCTVKxusSMvg@mail.gmail.com>

On Thu, Nov 19, 2026 at 07:49:00PM +0800, 葉宸佑 wrote:
> On Wed, Nov 11, 2026 at 09:08:06PM +0800, Weijie Yuan wrote:
> > I'm wondering where the term "三子句 BSD" originated from? Sounds like
> > machine-translated to me.
> >
> > I checked that wikipedia (tw) calls it "三句版 BSD". And wikipedia(cn)
> > calls it "三句版 BSD" Or more specific: 三句版 BSD 授權條款 三條款 BSD 授權條款
> 
> It was carried over from the original translation, and I agree it reads
> like a literal one. I'll change it to "三條款BSD授權條款" in v2, which
> also matches the "授權條款" wording I plan to use for "license" across
> zh_TW.

Oh yeah it's carried over, so I think that an independent patch is also
okay and makes sense. Any way you prefer. ;)

Thanks.
