Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396341;
	b=wNh7IsXZOaJSgWUa1uizJ7fGRpC5mSJmAbuvc6ogPY44K1v4dufGwK8R2MQSW5PIYApE
	 P81mo7UM+l9FRYFc0ZN8GyvgTeuJzKhbZEbVUNeO4RqobfKa0DjbxyMFoaisleyJDCGiv
	 KBDmZQ3QKU/BuWC5lT02HvIfUNJ9+TNmDi+zkQZjRQzT9iGRkNcn19hBHt7dr8Msb8y68
	 x7Pn73oPJggYcBwm2xlidtdjU84Nywrnj6dST7PDoiBgsK3yBXS7NyWRRclqEtQde1HGO
	 PuwDvffipaHjwJCQdRObtK5Z+zwWuJC5QwmIp0EADp6RJckxBpNU3ryvrARTRekEkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=J+HND5YBV7kChPbgIXL61bamk8iqt4LzJEz27wSwaas=;
	b=uR9k9QIYBdIydAOJN0MpCowTq+wqabUCuP1RSSH/V5fCohXnHNz5lPqYgYGjT/tgOECz
	 84s4Gr6TLYw3zLIVEv5XlQQ5q+F910WWYhInLXghSgQUuyyawzHhjcA4c6FZ/dp+EgMS4
	 WL3032UVkVIPp+yQ94c7LSOC7Hx0UfrB9oo4VtpTrIt1eZ/6QQKRCW3MtGAXSea+VyzEX
	 IrSLMQf2S7NcnVFJr/eYqoY4uicelubBNpv0g6VN/PONNmotCrUWn3W8NBEZIiAfrDmpp
	 8RAvaPk1eXQ7WmOIDub9pfWofhM8NswRnT7PS06pDs2tKxb8S52sFLjEfvagwbLOqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=J2WjZIB+;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B064606A31D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 01:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B064606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=J2WjZIB+
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O5EPEU02cgGPXQzJa27xqcB4cI8/JMpEsqVMlNnHGcA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795396338; v=1; x=1796001138;
 b=J2WjZIB+68KWnSeS+N4ktIcRo/uieQMzTNG28RqnpCkl2B5QeY39C/k79X1v5tveYfhrWMGJ
 Z0s8Sisi3XTJ7Wi7Z/t+x7fwc0NHPtummzhG2x3LK3eYQ2f23CsZTQzVSGQNwkKRIcVynbwkmPs
 IkGHMOiKzxbDM2YrbUeJXlb3b4uCwrUi5no6u9oJoxmhtSuFO+xSbWVazLmnbslZTAOjriAeudM
 kmByfaIb/Eu7govPa9b1xn2h9yCes8s/LG3b3VFkjjDUvakGfpItr3GGjbYT8DeJk69EnoJ9iFS
 V6w7eMcssMwrUrNabHycw2GS/x5DLt8I1/jSxrlNmrv1Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9fdd380da22c5a6;
	Mon, 23 Nov 2026 01:12:18 +0000
X-Mizu-Trace-ID: d9fdd380da22c5a6
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 09:12:11 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/25] docs/zh_TW: process: sync 2.Process.rst with the
 English original
Message-ID: <awOS692gFhyjK5Md@wyuan.org>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
 <20261106113142.706783-3-chenyou910331@gmail.com>
 <avR8baubOL7Aoeh9@wyuan.org>
 <CAKspUhKRkx_UW9mep2h2HuDy5Rj7OwurdsmEe6+1f04Rv=2YWw@mail.gmail.com>
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
In-Reply-To: <CAKspUhKRkx_UW9mep2h2HuDy5Rj7OwurdsmEe6+1f04Rv=2YWw@mail.gmail.com>

On Thu, Nov 19, 2026 at 07:49:33PM +0800, 葉宸佑 wrote:
> On Wed, Nov 11, 2026 at 10:32:13PM +0800, Weijie Yuan wrote:
> > The Enlish version uses tab here, not space.
> >
> > Is this a big deal that requires a reroll?
> 
> You're right, the English text uses tabs there and I expanded them. The
> rendered output is the same, but the translation differs from the
> original for no good reason, which also makes future syncs harder to
> compare.
> 
> Since I need a v2 anyway (see my reply to 03/25), I'll restore the tabs
> on the lines kept verbatim from the English text, i.e. the URLs and
> Andrew Morton's quote. For the two tables I'd like to keep spaces, as
> their rows contain CJK text: editors and docutils don't agree on where a
> tab stop falls after double-width characters, so tab-aligned rows easily
> end up misaligned. Does that sound OK to you?

Yes yes, please, using spaces are more friendly to CJK text of course.

It reminds me the discussion a while ago:

https://lore.kernel.org/linux-doc/akn4oYmihmNHFOY7@wyuan.org/
(Ah, seems that my ideas at that time was not accurate)

As long as it doesn't annoy sphinx, I think it's fine.

Thanks for bringing this up.
