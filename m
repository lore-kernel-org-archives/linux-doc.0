Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.60
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742868;
	b=EQfJm8WYBz6KeVKbCK4eOydSuH0UDVcXb/04BIflr1WF6dhnmOcaaPrMufxfDeNAi5Lg
	 FYsgCn0WWPnqb/b8YgNXHYVkB4+Lz+wPqhMAevIB4YHpvR7NPFxfo0lRcrs9o6kegU8EC
	 j9JB0N8YhlEFrKU+NbgWYFZPtzekEIaPXfO0XNq3crTWMZ8UHl+cumVdK3kqf+sG9Zte8
	 3Za38YeMZ8lPwt7J58/AtWO03DIirxXizP4qOJVe2vnhdIE7sZlOdMwtSdA7lokfePaR8
	 523KDeDqoWNm9yNKc4zm59D7J+0g0WBaMxcNDH2yeatC3fQ8ty4sPpNhYKK8upYtICA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742868;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vkqZadPllCGKDreYI6GA6t/bzBB5uvi+cURy5w7zs1w=;
	b=jS59R0LOYWQJs7TS9FYb938Aa7Qyi6Iz6RuBgSZThGqICplL79u6fXGoj8s0bOUmhoUr
	 ridyBW3pcmWh0BVhPJEm6DSWnNLQoOl/L0k0s9aRU5r8IB52WmV0iTKMwQQTc+g1QDgJv
	 9heh+iGS5AvR9/ZRSq5DovXov1rw+l+ndfEdJYTlCdvVwkPotWW4R1Jnns1LsK7FBrYqg
	 Aoj6pWYv5XDOmqUCBTUIPZrHhlaCmUOwqcDs37dnd+//U3UckoU9VlxSN/TTi+dOGlISI
	 z3ERJtubK0eKR5Egc7vZm2f+wFBxTEuTl4hzuQ+xbRoiatNRL/MG2Y4xUg+X/FmLsGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=G7jstguW;
	arc=none smtp.remote-ip=95.215.58.60
Received: from mta1.migadu.com (out-60.mta1.migadu.com [95.215.58.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAF606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FEAF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=G7jstguW
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DOP+VRYv6oAtcRsEsnGnVwBwmemJYh4b98yAbR6W+ww=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792742865; v=1; x=1793347665;
 b=G7jstguWA9q/YUsid5EQsuXUEt1xDfSEW5mz0oMH9WIHSevOpo3t3/ky0399zhrjueNN0dSu
 PEhD9e3sibgDTPpyL6RQHgekfrFmuE7PkEHHj9WatYl9BZSh+OsG15EoTlD+vO4xAZ4geDr03Ts
 uErGWWv96b373cLMwWt+lpykfS3Vpm9aOL0YD51bgncGvHHESDH6opOVOtAsXh7ulaf6c9hYhbW
 FwNdes2+q96Ai2YFiKTM8DnYfNCQl1fkXCWyLTBxdBJyFrTgevSuy0BVkx4JWs3ROAispriFErq
 ZCxy2YxhSW/f4H6hRFUgpNTh7ysxELToRxbTnPVeEvGjw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2b39aa43c80c513;
	Fri, 23 Oct 2026 08:07:45 +0000
X-Mizu-Trace-ID: d2b39aa43c80c513
X-Migadu-Flow: FLOW_OUT
Date: Fri, 23 Oct 2026 16:07:41 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <atsVzSRDCKuOhtsp@wyuan.org>
References: <cover.1792569583.git.wy@wyuan.org>
 <d99d7c42d635bc121c82699c9e0a48547f98a972.1792569583.git.wy@wyuan.org>
 <f5df0d7e-94cc-4ccc-931c-8b9af333167d@hust.edu.cn>
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
In-Reply-To: <f5df0d7e-94cc-4ccc-931c-8b9af333167d@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 10/21/26 4:15 PM, Weijie Yuan wrote:
> > The headers related to translators and proofreaders appear multiple
> > times in our directory. Their information is duplicated with that in the
> > commit logs, making it difficult to maintain over an extended period
> > of time, as there have been multiple instances of requests to update the
> > email address.
> > 
> > Remove the translator and proofreader credit fields from the headers.
> 
> Only one issue below.
> 
> After this patch, we can continue to remove the "Original" field.
> 
> Dongliang Mu

Thanks!

> 
> > 
> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> > Maybe Helped-by for Jon is more appropriate, but I did not find that
> > trailer in our docs while Git project has one. :-)

[...]

> > diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
> > index 55d5da974d89..c76b85fc1f07 100644
> > --- a/Documentation/translations/zh_CN/process/coding-style.rst
> > +++ b/Documentation/translations/zh_CN/process/coding-style.rst
> > @@ -4,11 +4,6 @@
> >   .. _cn_codingstyle:
> > -:译者:
> > - - 张乐 Zhang Le <r0bertz@gentoo.org>
> > - - Andy Deng <theandy.deng@gmail.com>
> > - - 吴想成 <bobwxc@email.cn>
> > -
> >   :校译:
> >    - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
> >    - wheelz <kernel.zeng@gmail.com>
> 
> 
> Remove this field too.

Omg, so sorry for my carelessness!

Will reroll soon.

Thanks.
