Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613984;
	b=eLecrktyVNs1ZCFGhqSV36Jzh00ocw7KBczjsSXAPBhB4cyHVZp/NtjYcPxVJCPZYxoM
	 Rj4by3+7zu0rHtZbCeD99UEEdhSAwlr5aLpA1+B5rppLwUSY9nIrh7TF1N9kXvtz/hvOv
	 r3toejr3a9Q8OFK7iBh+oKKf3eroMi9pJV6kEM6gCSKXdl+EvuKzqiZ/ych78uvXLVhtN
	 jala3+xkSrX1BmWYWxVi/doYZn03EgLq2/br2VPSf4hDo2cQV8Bl2JrGNHkooOm/YrezC
	 SSxp5CoL89nQgztCXibrhnx5WA3PSxyVyQLWwkHMxBUTHBrEj6aqOBvCJrTTx/D3TxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613984;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=LhM6iTyXiIOEJIXv0OBGTF8appdtEpEB3/JCzQzxpvc=;
	b=Yjcyomd3uHym8mdUWU4PT54/RCqNA4tSYzrHGjScAe/glaWbWRavhgIQyJR0DiPC5v5T
	 enO0EwGgg8f3ahmz4f5ci+3yPm33dCHNomQ/ZIscck6k0+SWVSdTIytM/Im0xYbgV6iMh
	 VMvznVXT6iZACA0hKmqjOkKuDLukEcWb7/PkARwNzfheMngyLikAJ+FDBD+Jur+ZEBVZN
	 dGMjPZLgs13s9q3OblWSHQaucr8V6q7AeTpt/jXDJR9D/9QYKnIkNipUaxsKltYlrRLMb
	 2YXLx/5dsEPB44NqXoxecVRnE0uAJMg8hyaaooFtNG9MbDcNZ9nkUDERCpMhDJZnMQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=FEBs91P3;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95D606A329
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F95D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=FEBs91P3
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N9ENgSZ+v9UuLjndY4DpD0xAO04Gu2V+C6pDYo21KKk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795613980; v=1; x=1796218780;
 b=FEBs91P3rXNhoFAOm0DecWIxc1fy2YmeNpdM10O/uNVbPLto0pzN4e5B6dABj8K7jB6ABJJ+
 T/1InzPl9R6XPxUolZkondrjRW81QnzOYHydjFuyFgUna/cUlNRHhbcSpD/tl+/FcUKBN+NAvAO
 Yzq580GfQo/ZU3Iw68qJ+MofgHkuyA7v7jI8cx8Sru3lqQyfTD8dM1Qq0alyPRJq02KMnqeLUB6
 Ge0bQ/weshZH0NkmjHZIhkY+2WR4YSgQpMhLKn8gMpksLHu+WugEviWitHXasdfRooIAWxwJste
 XfFtCooWI7i5hyA1fY2eWyxOtJE0iOb6i10Vc5slilQwA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5f5e866f165caebd;
	Wed, 25 Nov 2026 13:39:40 +0000
X-Mizu-Trace-ID: 5f5e866f165caebd
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 21:39:32 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese
 translation
Message-ID: <awblFDdSa7wVStKW@wyuan.org>
References: <20261118131636.5131-1-xiongwei.song@linux.dev>
 <20261118131636.5131-3-xiongwei.song@linux.dev>
 <09ef3d3d-0e68-49c6-a6a2-c754104ede9e@hust.edu.cn>
 <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>
 <awZZVV3BlovD-xNf@wyuan.org>
 <66189c93-6f82-4ac7-9538-2a036842f70e@linux.dev>
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
In-Reply-To: <66189c93-6f82-4ac7-9538-2a036842f70e@linux.dev>


Sorry I missed the first part.

> > > > > +:翻译:
> > > > > +
> > > > > + 宋雄微 Xiongwei Song <xiongwei.song@linux.dev>
> > > > > +
> > > > > +:校译:
> > > > > +
> > > > > +.. _zh_cn_whatisrcu_doc:
> > > > 
> > > > 
> > > > Please double check all the references. If one reference is not referred
> > > > from other places, please remove it in the translation.
> > > 
> > > Ok, I will do that.
> > 
> > Let's make it a rule or instruction, shall we?
> > 
> > I didn't find any specific rules for label usage in doc-guide dir. (only
> > no more top-level label on list) But I suspect there must be unused
> > labels in English docs.
> > 
> > We either:
> > 
> > (1) make it consistent, i.e. keep adding unused labels.
> 
> I feel like this one is better. Maybe the unsued labels will be used in the
> future?

Thanks for your opinion. And yes, maybe. But it is alse okay for me that
if they are needed at that time (later), it can be added as well in that
specific patch.

This is something raised to me recently. (Maybe not fresh news to
old-timers.)  As I said, I don't see any existing docs mentioning about
this (or I missed) , while I haven't searched some threads about this on
list. I was planning to bring this to a discussion and then hope there
will be a consensus. But sorry now it's pending because my and our
schedules are a little bit tight these days.

Thanks.

> > or
> > 
> > (2) check usused labels and do not create new labels for it.
> > 
> > 1 may be easier for manual translating jobs that you don't need to check
> > every label manually. You just need to add a '_zh' before each original
> > label. But apparently this will create tons of unused labels. So, no?
> > 
> > 2 may costs more attention, but I guess agents could handle this
> > nowadays with proper prompts.
> > 
> > I forgot to mention this thing in Daniel's series [*], shall we mention
> > this now, or send a RFC patch after they get merged?
> > 
> > And also, add a rule for English docs that _do_not_ write a label which
> > is not used? This will make our job easier.
> > 
> > [*] https://lore.kernel.org/linux-doc/20261119041009.63651-1-danielmaraboo@gmail.com/
