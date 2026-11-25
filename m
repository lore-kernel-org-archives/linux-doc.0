Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616283;
	b=vwykbprzAzYwSfwUYDbrD/hZNa6nnPZ3Mf2NglduBPGk25mvy8bUOF1AuBnHICkpSjaq
	 T0KCKMEwJJNbVNDp79aXjT32QJXz6Rh9p3eqLXyF5jKhVu7h/iQZI6pdXDFGNjitb/cUJ
	 DTXO/vYyAroFXBcC87Vk5uckh+A051RSn4z6Zf22nhoWqIcOzmWGFqyHe6qHsbsc6sFCs
	 cYFkp9JE5ccdyRxFW5ijNXa5cqVCsvDBN7/TQWiIKg8DKTYAFSJJbZe2XmVuJtYgd6EPl
	 4uw7FXNMY8wkh76H5gX0YFQbtXHI1T8SfwNsjCEAogwVrlYebwUQfGp4ehsGrkOG5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616283;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=cz6q/stH72VoxzJvriTDyhchEoMpXYcJk6FPeliPcts=;
	b=xa/YsnAzuNGp4s0BoVMzL+Wsuf77bHe60rtLICgpX+uQaN9XpXkee7rO5PFQ/Wtk+kk1
	 XRbpvOWeaBaE/9yCocz2uLVQtFVXm1xHZQt1qDilAp1h0vy3UEu6FdmmYvSNILWNfMfBm
	 /5Qb2PlwvDrN298gDPWrmk8XeRfA+C1NnjU922XXcpLACDZFbnGW6bYCNgXsFuSfkoKKM
	 Xerupyb8XHWtruurviy3QJQSwOIwle553mTvT6jfLDueJyTSQLkdAtR31OhO7NHBNg2nj
	 Yl3q2WKP0E1kqgrOgiXEPJo+AnhWFRDD3pDfqOzcoE88zNCPcZ2FRutqktjshDXFtxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=TACvlVp5;
	arc=none smtp.remote-ip=91.218.175.154
Received: from mta0.migadu.com (out-154.mta0.migadu.com [91.218.175.154])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F310606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F310606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=TACvlVp5
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CCa6MLPgSfC0gSv1/TwQ2U1xBZ9d9xJFhl1N8rsJZyk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795616280; v=1; x=1796221080;
 b=TACvlVp5XJlw0i9zLKjIX6ViIxnQhY68D8+L3z1Qk9/0o7khe0XjfS8bdJNWYmDr35uQposF
 yYsf6F31ATQ9+3UIjLRzQoFdRiAtcq1qSzz/NXX1aEXi0pA8jLcetAz2WdvRzoBdgsXmbx322JJ
 rLod3cW9A+9PU+3UkuLXOnmoqhxQ/A+KhYiLOr+DZy6VnSIoauyZYYlVt+wxM55jEqIhQQl0kG+
 +4lnyRoaeF+0s1NiCSJLOG2svU0H706jcGj457voz4sd8Ie9Z+R29r8Wf94kAE6O2rpm2ZOVV6L
 8e13TDpVgjeQ7WR8s6BlQ+oKuyoWNoE7zvOUEiJUFxnxg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5990fbd04151478c;
	Wed, 25 Nov 2026 14:18:00 +0000
X-Mizu-Trace-ID: 5990fbd04151478c
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 22:17:52 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Bruce Song <xiongwei.song@linux.dev>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add RCU/whatisRCU.rst Chinese
 translation
Message-ID: <awbuEAiOpfpfov2b@wyuan.org>
References: <20261118131636.5131-1-xiongwei.song@linux.dev>
 <20261118131636.5131-3-xiongwei.song@linux.dev>
 <09ef3d3d-0e68-49c6-a6a2-c754104ede9e@hust.edu.cn>
 <946792d2-4241-445d-820b-301a570ee2c3@linux.dev>
 <awZZVV3BlovD-xNf@wyuan.org>
 <9d2b25e4-c5a0-4ef0-8698-1a622d05223e@hust.edu.cn>
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
In-Reply-To: <9d2b25e4-c5a0-4ef0-8698-1a622d05223e@hust.edu.cn>

On Wed, Nov 25, 2026 at 10:00:26PM +0800, Dongliang Mu wrote:
> 
> On 11/25/26 11:43 AM, Weijie Yuan wrote:
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
> > > > Please double check all the references. If one reference is not referred
> > > > from other places, please remove it in the translation.
> > > Ok, I will do that.
> > Let's make it a rule or instruction, shall we?
> > 
> > I didn't find any specific rules for label usage in doc-guide dir. (only
> > no more top-level label on list) But I suspect there must be unused
> > labels in English docs.
> > 
> > We either:
> > 
> > (1) make it consistent, i.e. keep adding unused labels.
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
> 
> 
> I prefer this solution for some reasons:
> 
> 1. If I understand correctly, Jon asked us not to add useless labels in the
> translations.

Yes, true.

> 2. The labels in original English documents may be invalid, we should
> not inherit them blindly. Only if you find some place refers to this label,
> you can add it to our translation.

True. So I also hope that the English documentation includes a note (if
there's no such): do not add unnecessary labels. This way, our new
translations will not be added in correspondence with them.

I will also try to troubleshoot unused labels in English articles when I
have time. Sadly, Sphinx does not print out warnings for this, so I have
to grep them.

> > I forgot to mention this thing in Daniel's series [*], shall we mention
> > this now, or send a RFC patch after they get merged?
> 
> If it is not merged, comment now.

Sure, will draft soon. It is expected that his series will not be merged
quickly.

Thanks.

> > And also, add a rule for English docs that _do_not_ write a label which
> > is not used? This will make our job easier.
> > 
> > [*] https://lore.kernel.org/linux-doc/20261119041009.63651-1-danielmaraboo@gmail.com/

