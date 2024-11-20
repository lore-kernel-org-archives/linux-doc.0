Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C4153BF8
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732119335; cv=none; b=Uq+U5UNmOCEZGnxfiXjmy6ssMeV6CITf0tLKmA11JNGLcVWw//k5hakdfkwaI9DF+ZMDTrqJjqtt07oN4adFHP7kxuE9DNsFaT2IJHfyE9kM6PAoqvVc6nVB2yuk2bBtfZn5D+ql6JpnTCV+b8t8ac4T0gsO3UKQU0TY2zsL7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732119335; c=relaxed/simple;
	bh=VNWYPyllDhn6wyHA8vHCBZcrdTpypW9KdBxrUGgTSiU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dnjJaJ7eXR7W7GVymDQaW006lxiQ8VnJYUBPzkV5ojqcNAlQYRMGAF8nRFujZtcXYiZg2EvHwxyLg8VUg8lNks6f3Jt5WsB3J9nrPRgkXneLH2rsJStiQQCcKXizkbLCsKtPzbodq3z2JQA9g6u8SIEiFbEsKD8kIUA3AgzNJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S+hTe9iz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S+hTe9iz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732119330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9neiNV5Ecw1Rm63FFkLc6Zp+LPvspTbTCjcardEBqA=;
	b=S+hTe9izdKeycP41NI7EqHuLsq4riQ2r3ilYqj5AWmPl3pbFNfbGvKpw3Y4YhTWVa+hgZX
	LkFOHKfWJ3YY0JeIF6BecxJlFaSsa19PMdk9FYBZlBvNKV5VB080E0HFJi4A5u0v35mqCk
	EfTHoPeEgYFbs3i631saifvvfh+1BWk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-cEtoSP3LPWawDeCfRCKcXA-1; Wed, 20 Nov 2024 11:15:25 -0500
X-MC-Unique: cEtoSP3LPWawDeCfRCKcXA-1
X-Mimecast-MFC-AGG-ID: cEtoSP3LPWawDeCfRCKcXA
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d4189482d8so32440406d6.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 08:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732119324; x=1732724124;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9neiNV5Ecw1Rm63FFkLc6Zp+LPvspTbTCjcardEBqA=;
        b=Ilag1K8sacS2wRmnqws1JsXkmyIinlEo1GS5IrOhnFt81JloFcfM0faQ1NEqjjz8Kj
         1tEbapk4lp3VTl7u7qhfXVBs9dj+/0Uig/vJAzOYCq8B7S0+sGJazfFEue2QOsD2lzP/
         qKVsmtevfsrTAfyXz87swCHa/a8LtA2Zh2xTU63LC5lgIqESb5/r9hSjw9CkVgwjDEJk
         /n9HKWIFn/rEcSGE8p10rDFkFRfkmsF3jQ4W8AEkSbDR0nle/YIrg4ibwzdF1X+s6oHT
         vnrBka/FJDmPrtRNTO1v5OazLwsO8MvIeJbWey9ctrO4ltCtzSbFkq5Odd7YwFWM+7oC
         2wIg==
X-Forwarded-Encrypted: i=1; AJvYcCW5mlC0gDaLcxCpc5bJh3dtchyskeFtWgO9EuzLpg9QJuo1neJ7m7mBe2a1X3gnugZDpJf3i6Vmz+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CYclGk0KzI4LJA6fg5mfk9CWXoB1uIeIW1kdrcWKWGCg3vep
	2XtEiAAa8kbZXZdC84UzhKB1On6UG+jeJcs1V5QE6ZiFT936zicLCFgDzR3kpGK0tKL2l3E49F+
	nwHc9v05rmazkrwqyAk2X8LxH732flUDgY9vy1mxofisnaX1wy3yEqtPglA==
X-Gm-Gg: ASbGncsadvEzYRw15XdvIrCi20/71Fbl2imaBdREBeqBNAa8btVZFWdxMfDy4vvSWwm
	iSQYx0MZOc5OtGBCbN5JZatp62rWSjX1tXdIgGBuJSlRuAQlobmQJnHFnnsJwf7U/ZN9vr3xyKI
	KgNmeQ45cVIX1LCMHq/hzyQ+BmB0ELovS4OneN4DDtaQAwW44bZZ+vXAWiIVoBIuFmrPj/RIKDB
	tH0vs0pr/MYNC5EMfD5SEhsq5Iocd3MKGDmBAoZ25uhR+d63FUSvz0BOTG+QcpxIa+Y63/O4X+d
	65xtvbj1ZfQcfKoO3qgDVNzj3jFaIRWenI0=
X-Received: by 2002:a05:6214:2aa7:b0:6d4:1f86:b1f2 with SMTP id 6a1803df08f44-6d4377bd8bcmr43340616d6.11.1732119324063;
        Wed, 20 Nov 2024 08:15:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErytLY/ydBtG/c68cV9sB/Rs0q2MHssCkf2mLl/ZoHSY4DaUVm1Hfo6p7yhhfkcknSTmK2WQ==
X-Received: by 2002:a05:6214:2aa7:b0:6d4:1f86:b1f2 with SMTP id 6a1803df08f44-6d4377bd8bcmr43339716d6.11.1732119323729;
        Wed, 20 Nov 2024 08:15:23 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d43812ab67sm12352206d6.88.2024.11.20.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 08:15:22 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 x86@kernel.org, rcu@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay
 <quic_neeraju@quicinc.com>, Joel Fernandes <joel@joelfernandes.org>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen
 <samitolvanen@google.com>, Ard Biesheuvel <ardb@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Juerg Haefliger
 <juerg.haefliger@canonical.com>, Nicolas Saenz Julienne
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
Subject: Re: [RFC PATCH v3 04/15] rcu: Add a small-width RCU watching
 counter debug option
In-Reply-To: <20241120145049.GI19989@noisy.programming.kicks-ass.net>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-5-vschneid@redhat.com>
 <20241120145049.GI19989@noisy.programming.kicks-ass.net>
Date: Wed, 20 Nov 2024 17:15:14 +0100
Message-ID: <xhsmh1pz5j2zx.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 20/11/24 15:50, Peter Zijlstra wrote:
> On Tue, Nov 19, 2024 at 04:34:51PM +0100, Valentin Schneider wrote:
>> A later commit will reduce the size of the RCU watching counter to free up
>> some bits for another purpose. Paul suggested adding a config option to
>> test the extreme case where the counter is reduced to its minimum usable
>> width for rcutorture to poke at, so do that.
>> 
>> Make it only configurable under RCU_EXPERT. While at it, add a comment to
>> explain the layout of context_tracking->state.
>
> Note that this means it will get selected by allyesconfig and the like,
> is that desired?
>

I would say no

> If no, depends on !COMPILE_TEST can help here.

Noted, thank you!

