Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240819;
	b=EBVMdvjihTNNxu1zGvSh4dVLb5qye9vWoiEHTCqFda1ZVFuhzceZX2hhYkaCOF2vxusO
	 dQr/QEIpN4S25er50Xa+zqeup55s3ba0fP0Kw0eBCPieykgqyupytGqdQlCRhjis10nTm
	 WatsAJTno9JMRjBup95hA+gfHRada8k/OO35lpdcHAHLyKIZqNbDZYtdg3Pv8sCrRuBOn
	 dK+9kgfzal6tujCNZw7WCVu1bGIXuLofPeWAAN1vgwMXQ2XlSXuxRFq7309bNw7in4S4x
	 4dBvBc4ustMqHgHfjZcJhtCIlXPkTqpQ7Po4bkP+fgvVkpx0LLoDz0Qsc/cS3SaZdZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240819;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lTrZrkUaRM/l3SO4Monh9xw6nek+egDiKXFWxce24qM=;
	b=HWGFnZGpNbgUe6pmVDAPibUXwbLNFXIxB823VTnyul5NW1sV9hhZFHX9G2Fb5ZVsiXSX
	 prwKwZtw4MAiZvlUZGGroO0Hx4sA2TfkmoJcEs2f6uoOVAZx8BG1BsBmwkBIZ1ocXgjhw
	 SOTPUJM+YZv+96qDHST4xf5AjBMA9zHzBpBHJ/e3NLvFl+4Hk2EIRUJMfwO9etzE2GhSs
	 57Lo77SvYMUdGVCj06sOyG2FkCaXmF6yApSVqYYp/tZlICTU6ZvuJ6bejOMRNosAIgjas
	 Dd/HQlR0R45MNB0e1egJGhoN+HxtNtxWuwjqV7zOfFIbk+m6cj1Jp78RWNO/VOaMVtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	arc=none smtp.remote-ip=91.218.175.158
Received: from mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CABC606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 16:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CABC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bpDyznseLghcgMhhTxrHfjMITToLDvq49jI8CwoHV0w=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794240810; v=1; x=1794845610;
 b=qaN9yXPZKh4kIyKFecLOhyPnm11nfPLIZvd/MraS1sj/M97Ojt1Zqcio9ae2XHj5vBOtp5XA
 kYqt2qc5Q5iARgPlpdRkHbzIEbxAdqqUt2Qq0dCil59h7h2L4N7Q6Lstl91fxIZhT/Wfkd7ENsG
 Yo0qWE/ulMSplGsefYW+dZ3epvhas6LzElxNvHPFSAkJ0VYXf5AfTvXR4l00MUoUX/JlDmiGLha
 w+9wmRd7BsfHZurepS0+GA+yKGxEGd8Bm/MTHw4cIUkiUXvLCBh8phuMe1uHI6V6rIxQJ+cS3YV
 8zq61tyKNXlffesOf3ZgEMK2uZl+YlMsPRYJLcGSsplIg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b9510a6d7a3dcd8;
	Mon, 09 Nov 2026 16:13:30 +0000
X-Mizu-Trace-ID: 1b9510a6d7a3dcd8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 00:13:21 +0800
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] docs/zh_TW: process: add translations of 13
 documents
Message-ID: <avHxIaArNRciqEqz@wyuan.org>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
 <3bbce43f-476c-4a21-8da3-2be98a696e9c@hust.edu.cn>
 <bab86e6c-bbda-4ad0-bd88-5ace76946eb0@hust.edu.cn>
 <CAKspUh+n2giArsUzKeHq1F-D8VkV89kUNevc-hFnpxjWFWNZsw@mail.gmail.com>
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
In-Reply-To: <CAKspUh+n2giArsUzKeHq1F-D8VkV89kUNevc-hFnpxjWFWNZsw@mail.gmail.com>

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> > In the current stage, it would be more important
> > to fix all severe issues in the translation other than adding more
> > translation.
> 
> Thanks for sharing your plan.  I think you are right that fixing
> existing translations and making them reference each other matters more
> than adding new ones, and I'd like zh_TW to work that way too.
> 
> zh_TW is at an earlier stage, though: it has only a few dozen
> translations, most of them converted from zh_CN, so there are few zh_TW
> documents for references to point at yet.  Much of what needs fixing
> also only became visible while translating; that is how the terminology
> issues and these unused labels came up.
> 
> So my plan is to first finish process/, the area the scope RFC commits
> us to maintaining.  After that I'll follow your approach: resolve the
> references so they point at zh_TW documents where a translation exists,
> fix the remaining issues in the existing translations, and only then
> add new translations.  The terminology cleanup will go in alongside.

Sure, so in conclusion and for later reference:

* We hope and aim to finish the process directory in this cycle.

  Since this has been decided long ago and has been kicked off recently,
  let's finsih process first. During this period, we try to link to
  existing tw translations first; if there's no translations existing,
  fall back to English original for now.

  When finished, we can check what's the status of referencing: how many
  we can refer to tw_docs, how many we are refering outside of our
  translations. Then, depending on the actual situation, a decision will
  be made as to whether the translation scope needs to be expanded.

* Finish "Working with the development community", i.e. cover maintainer
  directory.

  If possible, we can finish it in 7.4 cycle. But there's no hurry, we
  can also leave it for 7.5 cycle to prevent last-minute changes.

We could also do the reference check and decide how our translation will
expand when the above is all done.

That being said, now I'm not at my workstation, I'll try to review
Chen-Yu's patch bomb ;) within this week. And check how much left here
for process (or finished?), then push forward to our goal. A big thank
to Chen-Yu for taking the most arduous work!

And yes, I think most of the translation of tw for now do have
references to the original English text, which is an inevitable
situation at present. That's our intention, isn't it? If we cannot
guarantee the quality of the translations, the best we can do is to
temporarily keep them referring to the original text to avoid any
misunderstandings or errors. Of course, it would be wonderful if all the
content could be included in a native language, just like zh_CN. But for
now, let's finish our first goal of zh_TW, and then catch up with CN.

So I fully agree and support what zh_CN is doing, we can do that for
zh_TW after this goal finished.

By the way, I've started collecting signatures from k.org developers
weeks ago for putting our dev tree on git.k.org as soon as possible to
improve our efficiency. Hope I can get it done soon, but nevermind. This
way, we won't have to bother Alex too much for help. :) Thanks Alex so
much for taking care of us recently, there are enough work for him in
the zh_CN side. :)

Thank you all for pushing this forward.
