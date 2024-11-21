Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65A15665D
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732204285; cv=none; b=Po0ND2V4nrPADggvCWm3fqEtRWM9G7cijmBJKZ9kyzYZEqCSY72KcCCA3fkX9MlOow3xLDohRUyoYvPlQ2uFH0Y8CGS5aWxHXrv31AO44HWHjjFzxqZQKMTMfejIkDYeOgrf3TmEZ368WfKbSkFZYj+RGQ6gSVcmACXfSJ03pjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732204285; c=relaxed/simple;
	bh=wqwT6sLOKw3cQNoRLXKYtXYhu38OXiMdpn/8NdnhM30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CbJi/PzjFtxC+45FGg2RQXX6J6dE8BehwiJj87FFhvPUFiOm7OGxiThZt0EKzZ6LHWF1ZtjDn16XrxSrDEZGLBoaQq/Or9PUtpjxwNLHihCvxvWvY5A4ex8ES0yIV0/OkDnX31qjh3ofrv8PLF6d8Mi3q4tIZC5JQp+4Ymb1oSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHClG8Wo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHClG8Wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732204283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wqwT6sLOKw3cQNoRLXKYtXYhu38OXiMdpn/8NdnhM30=;
	b=gHClG8WoteMwe1bvTxAx+jtMk8tHAWdKiQWVEbGHTVx4eYMU2cg1i78yBHicHhMP9nrMq8
	4e4oey5nB/nvI2GjeS+25WRHsFIyiX3q+QRcnq6ITdrOLy27MKBbIVKgeYEHCG9iCrpI3O
	Sv3tc4VZVar2wqELZsUNYtoGG+Zd/Ws=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-3CFePs4yPMeeGss0GmhzzA-1; Thu, 21 Nov 2024 10:51:20 -0500
X-MC-Unique: 3CFePs4yPMeeGss0GmhzzA-1
X-Mimecast-MFC-AGG-ID: 3CFePs4yPMeeGss0GmhzzA
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-460e1786265so16772521cf.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 07:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732204279; x=1732809079;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqwT6sLOKw3cQNoRLXKYtXYhu38OXiMdpn/8NdnhM30=;
        b=lyNJqVXmSkxFqXFXvbdtShzD80ev54Aom30kSs69SShaEhND+VH7Wzwgqq+JRrXLQa
         OnNIT0xiL23GjKrLe90rTncrr3Svp3qDjQISl+wU+N21+Q0CZ/vbDsLa+dfgd9Nawxhc
         fDEFw746zLYNaHGhhfLsEzwrlew5M9BSQt5iEKXMQhwzA9mw1GZZ3hOyPaFGnFaUppmi
         A/x3ezllRtwHpHY3taMWvakFgXKWhYcscqq5aU9WKCGVuTgWyBb8GX+N/XWe7o9P2X59
         SwVrmeqXY2p+hve5RRMMXTXgtxFpCgV83Zjkj1zRzRJ52+/DksOJaWQ8xmjitZfGCK9O
         FwTA==
X-Forwarded-Encrypted: i=1; AJvYcCWXekVnT2YNDITDeqrUVOUKnD4+RYzBv8liyGAUnp9vXqdtbpDKYxVb29uRWBOBf8WzeFYLNdZ2EFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxm3EXAX48y15xWOOnFKD2ns9irY74mrDEyIpcMNsJIyge9DXF
	9oNjM1p8cEuTwtklGOAMJxsH7GfpzDr+1bjiNJ8Y5WrdPdXd8eR8TGs2WCrvanMXOGqHgi8Djhn
	3c/C4CDucTeCdRit2oIDJG0ErjElUPZFUG3ab5PMfHxpOLt0/AJrujG1cJQ==
X-Gm-Gg: ASbGncv/I9H1lX4BgmMQFYqKo5G2B0P9YTbI9SRJ5bM1V9uv4EONOQI/lggwhjrlhsb
	SejY7WkPYRwamwz/+5b4xLCMQgKs4LxCt88y6by9ec51XmH7BJJ/2vWagQH50nPTioY9sCpkxb8
	KOQBFPsKRDYoAqLxXLfkjVp2HS3U01Z35orWW8zGgI0aMrCQDO6x6biRszpSj53RQc5Gkun5tQc
	b2GQE3UQMZFnM7Q559d9lletpnl3EWrihtve3OYpHcMcYmB9MY/caTDb5z8tPMdOljs63Sodysg
	SPXOgQGieo7YIWvi0sDSaOn6D5Hg8aeuHOk=
X-Received: by 2002:ac8:7c4b:0:b0:461:4372:f2b6 with SMTP id d75a77b69052e-4647965fae7mr111014791cf.39.1732204279352;
        Thu, 21 Nov 2024 07:51:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhhGvXxNF9YG7Wn8RkZZVe3HUI8vO3AoWFe5rp5bueN6AbTjXI6+VbxkAuh2ulevplAsAH7Q==
X-Received: by 2002:ac8:7c4b:0:b0:461:4372:f2b6 with SMTP id d75a77b69052e-4647965fae7mr111014101cf.39.1732204278637;
        Thu, 21 Nov 2024 07:51:18 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4646ab21371sm23699431cf.76.2024.11.21.07.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 07:51:17 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 x86@kernel.org, rcu@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li
 <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy
 Lutomirski <luto@kernel.org>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Neeraj Upadhyay
 <quic_neeraju@quicinc.com>, Joel Fernandes <joel@joelfernandes.org>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Jason Baron <jbaron@akamai.com>, Kees Cook
 <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Ard
 Biesheuvel <ardb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Juerg
 Haefliger <juerg.haefliger@canonical.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Nadav Amit <namit@vmware.com>, Dan
 Carpenter <error27@gmail.com>, Chuang Wang <nashuiliang@gmail.com>, Yang
 Jihong <yangjihong1@huawei.com>, Petr Mladek <pmladek@suse.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Song Liu <song@kernel.org>, Julian Pidancet
 <julian.pidancet@oracle.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Juri Lelli <juri.lelli@redhat.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Daniel
 Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v3 06/15] jump_label: Add forceful jump label type
In-Reply-To: <20241121110020.GC24774@noisy.programming.kicks-ass.net>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-7-vschneid@redhat.com>
 <20241119233902.kierxzg2aywpevqx@jpoimboe>
 <20241120145649.GJ19989@noisy.programming.kicks-ass.net>
 <20241120145746.GL38972@noisy.programming.kicks-ass.net>
 <20241120165515.qx4qyenlb5guvmfe@jpoimboe>
 <20241121110020.GC24774@noisy.programming.kicks-ass.net>
Date: Thu, 21 Nov 2024 16:51:09 +0100
Message-ID: <xhsmhcyioa8lu.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 21/11/24 12:00, Peter Zijlstra wrote:
> On Wed, Nov 20, 2024 at 08:55:15AM -0800, Josh Poimboeuf wrote:
>> On Wed, Nov 20, 2024 at 03:57:46PM +0100, Peter Zijlstra wrote:
>> > On Wed, Nov 20, 2024 at 03:56:49PM +0100, Peter Zijlstra wrote:
>> >
>> > > But I think we can make the fall-back safer, we can simply force the IPI
>> > > when we poke at noinstr code -- then NOHZ_FULL gets to keep the pieces,
>> > > but at least we don't violate any correctness constraints.
>> >
>> > I should have read more; that's what is being proposed.
>>
>> Hm, now I'm wondering what you read, as I only see the text poke IPIs
>> being forced when the caller sets force_ipi, rather than the text poke
>> code itself detecting a write to .noinstr.
>
> Right, so I had much confusion and my initial thought was that it would
> do something dangerous. Then upon reading more I see it forces the IPI
> for these special keys -- with that force_ipi thing.
>
> Now, there's only two keys marked special, and both have a noinstr
> presence -- the entire reason they get marked.
>
> So effectively we force the IPI when patching noinstr, no?
>
> But yeah, this is not quite the same as not marking anything and simply
> forcing the IPI when the target address is noinstr.
>
> And having written all that; perhaps that is the better solution, it
> sticks the logic in text_poke and ensure it automagically work for all
> its users, obviating the need for special marking.
>

Okay so forcing the IPI for .noinstr patching lets us get rid of all the
force_ipi faff; however I would still want the special marking to tell
objtool "yep we're okay with this one", and still get warnings when a new
.noinstr key gets added so we double think about it.

