Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.190
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795578205;
	b=o0HJtw2W6AnwN16XwS5EtHi1otQbaBm8z/XCoJPCnnrwExzeOVAk+x/ESIhTRgMuDOGC
	 n9nSxlEuF9OaV2C8Rb7XfgbTXO+J1f0M/sPaPLimRDpcLyIB7P32D1TSK5dTO6ulkTssC
	 KrXLhsGpr6fX2JThumGgygKD2s7IbUevIhw9LyDMg/rMwIqJ+lTlkO8jGj3YWmP53cdBp
	 kD9XDrM9hGwyDuOBPBva3G6JRQC0DMy9VGSZrUEcvnbYuFlHEJ05vRXCXi+Th1kX67Aje
	 cTA/DhqcqO20glkPThzgy69Ey1x6dN24pPPVamtvX3kqCHpVfQeFfOhIf7vibKRqFCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795578205;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=SoZ7grorL+n8DKqrdd1wAaI5dBboW50o8fMv+joHKz8=;
	b=lm6gzOwoxKagQRK5Dh/IvWW3X1MxMprrSWBTyG6tfAcVqHaTpuj4YPSRKYfo5xGZmpON
	 NfdyVe/mJLUSIbbGDwXFtf+8JXOPqz2KXD7FHrzcPLDnfmeEM/yO6vUBZPESdQu1b2CeZ
	 x5wBH7qnyTps8Ef3NLFbQBw5hlx3fbS1gHyR2lqEv4frpbnbY/8JsxOTBHN1SeAsD1Al3
	 aWkk6+h6F118Tb1M3wh2NFlQ1SQklAcPEmb1icEujU3Gz+QdUogKILWA5r1hvYoT/Fdee
	 4DZtkSLkeEviBCfhWNcMOVHUJh1UBPUcqUUU78o+JlJ/8WEmjC1QkGJxRiUDRjw174g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JVi+Vb13;
	arc=none smtp.remote-ip=95.215.58.190
Received: from mta1.migadu.com (out-190.mta1.migadu.com [95.215.58.190])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B3606A327
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 03:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009B3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=JVi+Vb13
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CbClVjeawVI/BOCBHpvWu57rNo0mDD9eas63Rjr+JY4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795578202; v=1; x=1796183002;
 b=JVi+Vb13T6gOdXif0a2wbiRzxe/Lbbza81Uc4kwNq1trALER7zgK7l4lhdpn406UvOrSmXpn
 pXlVg0ZrxVf/mnuAMdls0RhaD9/k49a2UeadtYu1ac/PrpxzNXhDdXHt1/oe5fZAKSzFcjmhcjW
 4rPJ3zJW7XnyriU+qsJ8NeBdNC1gOKbVxpwxiBILjR7ZIHyHMTiBGow7nM4z7U+qavqPP/VTbMT
 7r7q0Tr9LxxYk7iC7nxYlpTXpj9SK1Og8Fbt8Rwo2lJR9yw03DjW3qXIqSnEfAHhnkgwkTVvel7
 3fEP11pX4rYIPsxwNhiESdku1cH9aUdxXBsulG6aYXzhw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f97d83fc035d789e;
	Wed, 25 Nov 2026 03:43:21 +0000
X-Mizu-Trace-ID: f97d83fc035d789e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 11:43:17 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese
 translation
Message-ID: <awZZVV3BlovD-xNf@wyuan.org>
References: <20261118131636.5131-1-xiongwei.song@linux.dev>
 <20261118131636.5131-3-xiongwei.song@linux.dev>
 <09ef3d3d-0e68-49c6-a6a2-c754104ede9e@hust.edu.cn>
 <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>
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
In-Reply-To: <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>

On Tue, Nov 24, 2026 at 10:23:50PM +0800, Bruce Song wrote:

[...]

> > > +:翻译:
> > > +
> > > + 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
> > > +
> > > +:校译:
> > > +
> > > +.. _zh_cn_whatisrcu_doc:
> > 
> > 
> > Please double check all the references. If one reference is not referred
> > from other places, please remove it in the translation.
> 
> Ok, I will do that.

Let's make it a rule or instruction, shall we?

I didn't find any specific rules for label usage in doc-guide dir. (only
no more top-level label on list) But I suspect there must be unused
labels in English docs.

We either:

(1) make it consistent, i.e. keep adding unused labels.

or

(2) check usused labels and do not create new labels for it.

1 may be easier for manual translating jobs that you don't need to check
every label manually. You just need to add a '_zh' before each original
label. But apparently this will create tons of unused labels. So, no?

2 may costs more attention, but I guess agents could handle this
nowadays with proper prompts.

I forgot to mention this thing in Daniel's series [*], shall we mention
this now, or send a RFC patch after they get merged?

And also, add a rule for English docs that _do_not_ write a label which
is not used? This will make our job easier.

[*] https://lore.kernel.org/linux-doc/20261119041009.63651-1-danielmaraboo@gmail.com/


[...]


> > > +概括起来如下：
> > > +
> > > +-    使用rcu_read_lock()和rcu_read_unlock()守护RCU读端临界区。
> > > +
> > > +-    在一个RCU读端临界区之内, 使用rcu_dereference()解引用RCU保护的指针。
> > > +
> > > +-    使用可靠的设计（例如锁或信号量）保持在互相干扰的情况下并发更新。
> > 
> > 
> > |The original says to use locks or semaphores to prevent concurrent
> > updates from interfering with each other. Please change this to “使用可
> > 靠的设计（例如锁或信号量）防止并发更新互相干扰”。|
> 
> The verb in original doc is "keep", and the objective is "updates" here.
> IMO, "prevent" has changed the original meaning, and the objective has been
> changed to "interfering with each other". Or do you have any other thoughts?

In my dictionary, "keep A from doing B" means "防止 A 做 B",
so something like:

Use some solid design (such as locks or semaphores) to keep
concurrent updates from interfering with each other.

采用可靠的同步机制（例如锁或信号量），防止并发更新相互干扰。

Thanks.
