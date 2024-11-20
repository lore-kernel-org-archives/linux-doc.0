Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE37F145A07
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732120486; cv=none; b=SlaJUnPsloznd8nEdZytC6yVVraWZNumjRSrWojvyzyJTPJIp96hUTUTpOhVd8iqRMgU9kdHtMTui0Oh1tr67F44Vd0gz1EbMISD8DCfZRO7Q7ga/BRzQy5qa2GrHa7PZvW3SHUP4LdjY41Q+pOt2DpTK+9rgccOY1m6GaJ09co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732120486; c=relaxed/simple;
	bh=CnsBTMGWcf5M8NoeZ38IEeXK/Z4PUSA9a8D7eN7JuxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WAlSbm/1gp4T0xkhWy3VwVMekeldFOeh0U/KQBuRU8rLYqI/W65kXw/4H0Cd0fVoQQLUvw0+UYBbDhdPe6X5p0WHrvoUUGq9QcPQucX7knsPUKm0G5R6SobEsoWLTqLczd/emouU8UdLebi3kc/NQxuSDJ//Q10nWHjMULD2JYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXCFidAW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXCFidAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732120483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B86g3yeGl3bc8HkRs4Pts1DK7V5+9VBe3Itq07US390=;
	b=BXCFidAWNlG8BMnMY3uDKEw7+qXgSXahdIjZaUQc0XemgVyatMu7j7EZ6kxjGnzJYajGYN
	Qe8NFeXTASJWhRemYrzVBW2EfgdatuDRrcqaPYdzuvld6lGYS4yhlNvlKPU49A0Aw8OIt4
	QI6m9YyL0Hf8xd/92y2PHpuQ0a2InRw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-7PTNclVFNO-waW3R9uW_JQ-1; Wed, 20 Nov 2024 11:34:42 -0500
X-MC-Unique: 7PTNclVFNO-waW3R9uW_JQ-1
X-Mimecast-MFC-AGG-ID: 7PTNclVFNO-waW3R9uW_JQ
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b15c3ad7ceso320952885a.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 08:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732120482; x=1732725282;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B86g3yeGl3bc8HkRs4Pts1DK7V5+9VBe3Itq07US390=;
        b=DyQjaCqDbKb8kmAEZnjsT7LfvFWePJKlDRJbJF564e8SemuJD+REgbG+C74qADh1dI
         l1qzGoGVX6+BSgzc4uWll+95tDu2m3DR89hp+8vOlFj1R85eSG8vMruOVGPBOD1DkzSo
         xpyfI+hm1sruubGT1tKwfwuMXWuqeCjMTyH3FEqJUGVX9Q4UFSZHO6/PYDO19iXFSjxn
         DwxssD+WUQEQr1ZGdnK+MDWpqamcGJKLE/3ND7dm1tdFaO3pqqAUAy7p328gN1MMqqfq
         8sq47sBbjkPaVVGeK4x7IJCOMH57V8gJjEqU/ycP9ZMcqQh4uxWLV0rN28IlY/WnoSTw
         XFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDi6/ARNsmuz/mv1nRMzplBz7GNciki4/YW2zY6Wa2vEj1c0fHEtBuURxiqlwft/KjEhkE5wtvmCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbXGJ4Ag4h0z1x/FuXXKF3mnja1GZ5ECo+TV+J0PMAkFMFPdF
	NTGi2VYIZXCC0LQfR4M2OiiHBbk5g+Goi14oqiHmcjRnkjgmlzZGQIK6KU23rbYkpZNcoykTNZJ
	wriENUxGeITnLStmSJY2ZAruA9fHWF6OWc2cOLNXwyteLBho1h/RWWeh1nQ==
X-Gm-Gg: ASbGncstYidY57XHiVdYrCvL4xA5zB0WOoXT2wdLQaGn4T1/oCfINjhljKUq4ey9Rc1
	XPT8f02OKPKlfV5tBmrwBYK2ecDnvugRjUUP24xTfBO5ecZHwugOI3rCmXsI8HqOzPfmLNcWAja
	BBhypNxflqSCDHEn25fsJKOHQhlVcGGTqUERudh1T6EBkc5e4eEsjMYqpCiTWHWM9LuiGJK6Qj9
	qLmLzjFNjtW9ckh6QipgdWOF09kc4ZQexOttbVBQiBtuuVwf6a/DCNSrVFJ71LEzH8VtW0476vG
	ffQvYygN76zfirBnfRV9OFEZ+OMIMdJSAq8=
X-Received: by 2002:a05:620a:1a90:b0:7b3:7e5e:8708 with SMTP id af79cd13be357-7b43bed4bd7mr355530685a.59.1732120482235;
        Wed, 20 Nov 2024 08:34:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHW1sR9A/+saR1lpfmvKEOVIZYurnawvss8FWysYqEx/qwbDy9sFoGDQpoH7d4xuTE1Ki3dPQ==
X-Received: by 2002:a05:620a:1a90:b0:7b3:7e5e:8708 with SMTP id af79cd13be357-7b43bed4bd7mr355524385a.59.1732120481951;
        Wed, 20 Nov 2024 08:34:41 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b48523f72bsm112716485a.104.2024.11.20.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 08:34:41 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
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
Subject: Re: [RFC PATCH v3 08/15] sched/clock, x86: Make
 __sched_clock_stable forceful
In-Reply-To: <20241120145904.GK19989@noisy.programming.kicks-ass.net>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-9-vschneid@redhat.com>
 <20241120145904.GK19989@noisy.programming.kicks-ass.net>
Date: Wed, 20 Nov 2024 17:34:32 +0100
Message-ID: <xhsmhv7whhnjb.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 20/11/24 15:59, Peter Zijlstra wrote:
> On Tue, Nov 19, 2024 at 04:34:55PM +0100, Valentin Schneider wrote:
>> Later commits will cause objtool to warn about non __ro_after_init static
>> keys being used in .noinstr sections in order to safely defer instruction
>> patching IPIs targeted at NOHZ_FULL CPUs.
>> 
>> __sched_clock_stable is used in .noinstr code, and can be modified at
>> runtime (e.g. KVM module loading). Suppressing the text_poke_sync() IPI has
>
> Wait, what !? loading KVM causes the TSC to be marked unstable?

Ah, maybe not, I saw the below but that's actually the x86 specific stuff
and IIUC can only be builtin:

  kvm_init_platform()
  `\
    kvmclock_init()
    `\
      kvm_sched_clock_init()
      `\
        clear_sched_clock_stable()

There is however this:

  kvm_arch_vcpu_load()
  `\
    mark_tsc_unstable()

So plugging a VCPU might do that.

