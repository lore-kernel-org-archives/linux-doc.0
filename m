Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613153;
	b=eksQ3AvIUtqY88ESJiqJqncTm5WxQh2LE8KsFnCDk8Hi/esS9F8AjfKB6BtFrD8fdpFx
	 E11XB7lmkroaSI6oXbf6m3mLG6tljexY1/CqOisA4jz55hs3rBBvqmUPQ7hvskjM/46/9
	 hJgP/yGIl6ZA4EeEhISSxhEDmGG8qK9eru4/QKKjdDe99P1PsFygUtfY9zd29iUawNHjQ
	 E3OJwpRzB5PyE3dEd3JSFlT4llXp/DUXgUEeWFOk+U22TKXZW8qcy2KbYGRG7Hi1bfAqr
	 3I9LaH8W2idouCnIjUzjgbFW1A5kLqH98lwIWxl5XDYFMUAo3K2Qr+/TWbhFcOf0XRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=HbIdcR0wI49MGRVPfZrgHFwb+AvBA40KkuNLrNWIzbE=;
	b=twzT5uaPvlL12Kqt2OaBvkPYG5N4aIxs2P4gNQpntO+5MiLAULWv+bA4JVLfL4Lxea5v
	 o3Re2g2AxSysCY1Ia/op0OjXrBRABYoAax1VqH6EQb3WDLYjaK/x6KRVZGyfCk01aSvqM
	 esLClVXXlPILIvz/tadtC7wKU+DAS8UmaSDocmDAekDBHOa+F7Ln/AzSFLbzzLWcU0lTg
	 Yf2gvPVD7chdCZPkniwigExrs+FOAQTzyNFUB96vfh0nQSXWVyJ8/z5QfVPrFzcmvP7Lv
	 UW4lsreXB+5L193RkdL1UiY2paR31zWwKpFtlGOVZwm8qRjKpLj055nhvdqM8gnWGzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=s3U6AbpO;
	arc=none smtp.remote-ip=91.218.175.85
Received: from mta0.migadu.com (out-85.mta0.migadu.com [91.218.175.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013C6606A690
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 013C6606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=s3U6AbpO
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ztrTNlbe/EoB32+GFExbbnOihiqmDaAyMHnrHhteuLM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795613145; v=1; x=1796217945;
 b=s3U6AbpOrBYsvCB6fVgYeDlPFKNQBwlDEe7ZPeHyXxC2mACtM82D/PdjLmpklJQBSrpsVaFB
 cA+L4KcCpMeSbkKFXIGIgYszHzA4O+Jlgev95rfGIaKO3SxzT9ELEcFDyNWW9fZZX+FLkI+O/Lk
 OEOhNGRy6sXrWTeewdo1eSa6NPhELFuDnncWZeIydCpDuI3Sn10nH6pzFV8T2vwAkj6IIGEPo9P
 KwC+4unyoLDRkPAVElhIp0hiBWqhAvSAhVFh1IslCl+NvHW/9V4Kf0fmhLiq/ew+PHA7hPxuzR0
 SxXqbgn+qVqqrciHTw1lpyc3HpBQ4MaulKLqYKRB4zVEA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5427324283b5a104;
	Wed, 25 Nov 2026 13:25:44 +0000
X-Mizu-Trace-ID: 5427324283b5a104
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 21:25:40 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Bruce Song <xiongwei.song@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese
 translation
Message-ID: <awbh1KS3N14bZ2sa@wyuan.org>
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

On Wed, Nov 25, 2026 at 09:14:22PM +0800, Bruce Song wrote:
> On 11/25/2026 11:43 AM, Weijie Yuan wrote:
> > On Tue, Nov 24, 2026 at 10:23:50PM +0800, Bruce Song wrote:
> > 
> > [...]
> > 
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
> 
> > 
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
> > 
> > 
> > [...]
> > 
> > 
> > > > > +概括起来如下：
> > > > > +
> > > > > +-    使用rcu_read_lock()和rcu_read_unlock()守护RCU读端临界区。
> > > > > +
> > > > > +-    在一个RCU读端临界区之内, 使用rcu_dereference()解引用RCU保护的指针。
> > > > > +
> > > > > +-    使用可靠的设计（例如锁或信号量）保持在互相干扰的情况下并发更新。
> > > > 
> > > > 
> > > > |The original says to use locks or semaphores to prevent concurrent
> > > > updates from interfering with each other. Please change this to “使用可
> > > > 靠的设计（例如锁或信号量）防止并发更新互相干扰”。|
> > > 
> > > The verb in original doc is "keep", and the objective is "updates" here.
> > > IMO, "prevent" has changed the original meaning, and the objective has been
> > > changed to "interfering with each other". Or do you have any other thoughts?
> > 
> > In my dictionary, "keep A from doing B" means "防止 A 做 B",
> > so something like:
> > 
> > Use some solid design (such as locks or semaphores) to keep
> > concurrent updates from interfering with each other.
> > 
> > 采用可靠的同步机制（例如锁或信号量），防止并发更新相互干扰。
> 
> I tried the google translator, and the translation looks similar with the
> above one. But one thing I'd like to mention is maybe "采用可靠的设计" is
> more accurate than "采用可靠的同步机制"？

Yes, I just copy-paste what my llm told me as an example ;-). This looks
like a freer translation, though we generally prefer to stick closer to
the original wording. I suspect the llm interpreted the phrase in light
of the surrounding context and translated it accordingly. So I'm of
course fine with 设计.

> To be honest, I used the google translator sometimes when I translated this
> article. However, I don't think the results are good as we expected, so I
> never trust it 100%.

That's really a good parctice IMO. Btw nowadays LLMs do translate better
than google translate, I feel like. But yeah, if you are familiar with
these certain parts, you certainly know whether it's doing good or bad.
So please double check the output of these tools manually. Otherwise
reviewers are going to have a hard time ;-)

Thanks.
