Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B186C51DAEC
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173998; cv=none; b=SRxs5BQqepfxLE4FD1X1pk0jxWJAyA7c7QOSXpdeEMjC9i5pNeYajpc67tsHsmXyMyLFSDkQOqbikaLb7+aDQj5inn85h2C6fUbu7tYj24gBg66oOy5UFgSb+EKPbC/TV25Gg+D2ZYQBc84AY/PLje+DSKbTtx0r++xnccroa40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173998; c=relaxed/simple;
	bh=9SziFnm+aShDkRNqNWK4TN1HFS1h14/qWjFuIX4GFYA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=liFfxrPaJpYEWDzzFle5O9vwBRjCNb5qbaRh4ACBlO78EsAArSQusPPQcZY46N6LPqEE5L54NUtmabo2dvmsHk+GpsDN3CRrsRcK1yqmsDD/PRrXTF9FTrihixVTceJ5pHvTROdI9Q5GW+42m0VE1Vj7GAlvRyX4faBSdqwiJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4djl8C3; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4djl8C3"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8679cfe5019so1170278b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790173996; x=1790778796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AX/aeWxWgB/GKGsHNXt+UF87Ro0pQpzXrq2csA576lg=;
        b=G4djl8C3qxRTsRmvPNo5MOrfBBswMKCGB6TDoGTiEKAlra62ktjDTE69fVMNHfDiRB
         6nwEsCtA47lYdmfdQC8e/d13TBE0tfs3znkzlWpxNNfwzchICxPfyhqaHKU87a9weD2J
         NRXNDMBr1teRUBUiubml1aNnXs93x+joWSp7oOxW7B0LqvvEAaYiklk2u7rWX7fgRy5U
         X9IWtepwDWlJe+kBfbHziUx4RFhKzQiSVXt2OVG57BQ9rXGa2EUTl5CnRiQWp82kEAyg
         o6FYT3jccLBqcl51Hb+ZvnlUj74dDlA1EgIRNsqpxwUzVIVXMfvuYFiPQ2cLWiu1/nBH
         n8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173996; x=1790778796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AX/aeWxWgB/GKGsHNXt+UF87Ro0pQpzXrq2csA576lg=;
        b=gts9+Qw7JicOh9Sb7pqQODf3aVVZO5kUoix99UFyS+UQyt4jV1OCKOyeo0thckH8S3
         cJdzgxB/MjsNnZwq2D2EstNI5t/B0+fYmGQH1lU/REHqQnXi90DznV+2kruyblEXngLI
         kzo6LIepR4gLnMV32eeypd0H4sL2bry9N6KafINRNbVSrrMy+MLMtAMToiX1EsIBQZhw
         NgatPgk4ipD49Itn0EwYs14CSzTE8IjVVQH1AXCBwxnLZPRQ/GPgGA5U8Lc3pPo5Pm8f
         H0ydS3KgBA381+fH+HoqEDL0TQWrrEhagI1yzCSlFIUW0/MwcVgwdQhDapXP5nj7McyB
         EVuA==
X-Forwarded-Encrypted: i=1; AKwUvBwj3hd1bnmg4HxGDFRGVJymcqrIRXfAEu0jojOfXca1T4aIcyQBdOYSusVovje30pWtPlBOqJU7jIA=@vger.kernel.org
X-Gm-Message-State: AFuF++m60sWRJmR5S5c8ZvZyslc5UkVeUa6UV7Vx8+SwuQF1gfM1U+HD
	qT63GAM6CahJQuoHqog73DJt650I4i8KKOZCvrGeJPTeHj2klhKmY4s6yN9NaPoCQTdlVcGpFq/
	M3L20pw==
X-Received: from pfet15.prod.google.com ([2002:aa7:938f:0:b0:87b:94d4:77a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3319:b0:87c:e44e:5683
 with SMTP id d2e1a72fcca58-87d1a4b357amr2446190b3a.23.1790173995748; Wed, 23
 Sep 2026 07:33:15 -0700 (PDT)
Date: Wed, 23 Sep 2026 07:33:15 -0700
In-Reply-To: <20260923085139.GV776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <179005108298.388919.4535333252892590932.stgit@devnote2>
 <179005110742.388919.1509641807739909065.stgit@devnote2> <20260923085139.GV776954@noisy.programming.kicks-ass.net>
Message-ID: <arPjK1-PVp_UqAsQ@google.com>
Subject: Re: [PATCH v17 02/13] perf/x86, KVM: Prevent host debug register leak
 into guest OS on NMI
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@kernel.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 01:25:07PM +0900, Masami Hiramatsu (Google) wrote:
> > From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > 
> > When KVM enters a guest OS, host hardware breakpoints are disabled
> > before running the guest. However, an NMI can occur while executing
> > in guest mode or during guest transition, where
> > arch_install_hw_breakpoint() can be invoked from NMI context.
> 
> How? AFAICT perf doesn't do that. arch_install_hw_breakpoint() is called
> through pmu::add() which is strictly IPI context.

I assume it's:

  kgdb_nmi_handler()
  |
  -> kgdb_nmicallin()
     |
     -> kgdb_cpu_enter()
        |
        -> arch_kgdb_ops.correct_hw_break()
           |
           -> kgdb_correct_hw_break()
              |
              -> arch_install_hw_breakpoint()
