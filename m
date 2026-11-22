Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361624;
	b=FSvCDPI3dqtUI/RHpr2DipbufGpRBWAk2S1ZJEi/MOjBERiOTLT+a0a9xLP0XGDCbwLt
	 QJie8BmA7v9AUDgCf1vft3f2WcNFHsH/xJnjEIRvPLNoosy1AXaZ4ZqF3qNgB9cf69N+t
	 gGttbVouLKMv6ltU3YI//FqTBMP7K18j1mzmv7Th3uV++JlA6r1loJZFhY0oK0eza6/PK
	 P77u92H4ZTQCBXuUQFiW8hUmbH66xKlFfYxMaZMUGSRg/9lz+ktU9shASQUuYrlf3MWLV
	 CgI2nEVopeALxc3Iy2IyuhmSjnF+p1iYFAkzrpP364FpWkqklSZvGcyMGNggrZB5kDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361624;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QvvmssuybqTv8q2QIaMWx2V33OSc2x/b/sJk7yTktHc=;
	b=WmAavHQP1osqRUpFnHR8kt1dP7Wz7z8T8SaHxibyk/cPuB818GDRMuqa5Cfuv0Jl4Jki
	 6YdxhfA52XdvN2dUl6jBZhlXSxh+ZSiZUeHd043SztKcHJvq+uV1jDpNxdiajlfOXxTT1
	 Ue/aFKVjn5IpgEhJZViFlNcIZoXyzVODhBUYysc/vHCZEFp/8THnbjMxgCP+EwNmkSQGm
	 RoVhWR+go4dzJrJjVkM26WuTk04UryfCewIyZklgbQW5zFHcS3iHFV/Ywb18wRQJYvFNq
	 GgK0QUi6HtlEc9PI6+WUYPHvtVyD3h8NE2mzQqYAI7LMGXrySyuSDnCQbh6iN9NJU2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=IEgLZYcu;
	arc=none smtp.remote-ip=95.215.58.202
Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67458606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 15:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67458606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=IEgLZYcu
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n2X55n4gVRDi9zeoPy/iih0d0q3UG4/dCHxnxDOuPYQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795361621; v=1; x=1795966421;
 b=IEgLZYcumV9oyqHFfjrJouG+tfNCvNlQLflGMSyQtVGVULtKsLXoQIYz8TH1j+ydU7BCU/Bm
 mfmhv6uZTvzrn+17Th11bsmFB4NJcIe9UPhfIverAMbeXnh4RuWsK5zpcs9HRBYEL55CeIXmj3f
 2HheTJTwZWCGXdRsy+aWetldfJW8bPxAwKf4PIHUNLqkDyUjoyyKAHilLZ3sjtTjT/FG3R8Ncoq
 B9gCEOECCgDOlinZJJVKoaV1iI2g/TXGwQa8k+TcNjbNh20W2XJ+MBOJ4m9AfYl3nvYJBbuQVRl
 jD1UsMLAyBhg255YL2mcR98xzi6jMLW/10GFcevvX4XQw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a5e907202f526ed;
	Sun, 22 Nov 2026 15:33:41 +0000
X-Mizu-Trace-ID: 1a5e907202f526ed
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 23:33:32 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: dreduardocruz@gmail.com, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: submitting-patches: update LKML role as
 last resort
Message-ID: <awMLTBtZEjzgwg-y@wyuan.org>
References: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
 <CAMAsx6dNK3NjZvF-3wd9RH3dy3V7TiUoJJxnoLi0FPVn4eVJSQ@mail.gmail.com>
 <awLeAd_x7yCNRafK@wyuan.org>
 <CAMAsx6e5mQa-_E_nxWgY3+FiN=QJ5umtc0MrG4w5CQO6oS+t5A@mail.gmail.com>
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
In-Reply-To: <CAMAsx6e5mQa-_E_nxWgY3+FiN=QJ5umtc0MrG4w5CQO6oS+t5A@mail.gmail.com>

On Sun, Nov 22, 2026 at 10:28:37AM -0300, Daniel Pereira wrote:
> Hi Eduardo, Weijie,
> 
> Thanks for catching this, Weijie. My Reviewed-by was for the content
> of the translation, which matches Konstantin's change to the English
> text. The commit message formatting is a separate point and I should
> have flagged it too.

Sure, thanks.

I thought these two patches were still in Andrew's tree, didn't notice
that they had already been merged into the mainline a few days ago.
Looks like we need to catch up too. ;-)

Thanks.
