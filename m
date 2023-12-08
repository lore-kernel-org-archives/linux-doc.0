Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cu40gsxW"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F87110EB
	for <linux-doc@vger.kernel.org>; Thu,  7 Dec 2023 18:19:10 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d10f5bf5d9so16103257b3.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Dec 2023 18:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702001949; x=1702606749; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxWoNxQ7Re4hEPxspP07a4pO5MrpwCF1ltmlTW1Q1tA=;
        b=cu40gsxWLQw2D/KR+vCrTQMieXnAqNYo6SvyYOuM0rOUwV5LDCekbYizw0hdtmnPfc
         Ii/dsfg+btFEhju9cHNQctQ0mP/b/v5ayN7f7lvWSwoocQ/S+o6A8MY3ZnV7i66yuOBk
         m41AtGH+XFlypqf0KhrV504v7/hFAXDDlSwSTMdAePgn3mR5YL2oy72WmwfkpO40WZ5r
         gzBA2khtVxL2tIrtngOEtiumxw3T+ZUvj3E5TSRsOKQyoRTpOqzBtfCLfpmrlhoSotW3
         NsFvy3GFa/xUyst3E8CCKKCw1nxAAYr+xUv77VJnTuAPH4zSxHtU0ZG8juCQidmb0M2i
         GpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702001949; x=1702606749;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxWoNxQ7Re4hEPxspP07a4pO5MrpwCF1ltmlTW1Q1tA=;
        b=bHJFT/d80Vme5wdqU6S0J+nKCKeTz4IyKxPp144EWEOucxk+Fib03+lSQEUjnB+drt
         c5bdqOvt4UFVVw4krgdvVyPLjn5PuyByEvCQ1kibu82/5TxbuFeZL6MZWVx1HQTtDTmj
         xvcTa2lFFvCK/6RWFukhYNh8OtMUSN0EIxDz5xhGxm9HiiIZuKKIr+oWxFfJxRULfuym
         A+nvBb/NSFk52crUk4q3DGyrGym353pGkgeDFPIXiCu4dotkNSw4Klc2VdTDZlNLgeRz
         Wr0meS9sGK3IsxM7wX/xq/RFnsgb+/TplZJ7FYH0x2GL8f5PH03Anto2+vEQ8dl5bB4D
         EXCg==
X-Gm-Message-State: AOJu0Yyfs/xfPr4Z0nMfuXgmnT2ZOlqDw95OHIuFBfuQqWsHB/T9Z2NS
	oSxnH9Cd3iGWHIOnCjTB0nviG73o9xM=
X-Google-Smtp-Source: AGHT+IGLAarIGot/mOxhybAJOqF5zuI2ZbCf7KZAbIPPAPtRn+CDvmhNB9rGKAeknxv5s/UJNTS1xhf9MMM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:844:b0:5d6:cb62:4793 with SMTP id
 bz4-20020a05690c084400b005d6cb624793mr51973ywb.0.1702001949309; Thu, 07 Dec
 2023 18:19:09 -0800 (PST)
Date: Thu,  7 Dec 2023 18:17:39 -0800
In-Reply-To: <20231102162128.2353459-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231102162128.2353459-1-paul@xen.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <170199319421.1675545.670609241239795412.b4-ty@google.com>
Subject: Re: [PATCH v5] KVM x86/xen: add an override for PVCLOCK_TSC_STABLE_BIT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"

On Thu, 02 Nov 2023 16:21:28 +0000, Paul Durrant wrote:
> Unless explicitly told to do so (by passing 'clocksource=tsc' and
> 'tsc=stable:socket', and then jumping through some hoops concerning
> potential CPU hotplug) Xen will never use TSC as its clocksource.
> Hence, by default, a Xen guest will not see PVCLOCK_TSC_STABLE_BIT set
> in either the primary or secondary pvclock memory areas. This has
> led to bugs in some guest kernels which only become evident if
> PVCLOCK_TSC_STABLE_BIT *is* set in the pvclocks. Hence, to support
> such guests, give the VMM a new Xen HVM config flag to tell KVM to
> forcibly clear the bit in the Xen pvclocks.
> 
> [...]

Applied to kvm-x86 xen (and not on a Friday!), thanks!

[1/1] KVM x86/xen: add an override for PVCLOCK_TSC_STABLE_BIT
      https://github.com/kvm-x86/linux/commit/6d7228352609

--
https://github.com/kvm-x86/linux/tree/next
