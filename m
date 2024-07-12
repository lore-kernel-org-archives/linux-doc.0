Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9CF175560
	for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720801671; cv=none; b=PnOosY+abueGppr6t2qrx0wImRwq5zRs2PmwizV6IEbGu8a5wxHdwtdSip4mT9NvhmR+kqrUZZc9ifs1Mah7dUworfQoXTx20dMATglchWDFcM1VJ0VkruiQ6FDYlg6f7pJXQsI9EYyA7ussIU6ligmg+ewfHVFFhMuX3jNvKmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720801671; c=relaxed/simple;
	bh=qwr8oCZNV/KmUE+KTkQdbZ4A96F4ooAb3w3bj6Z7kBU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tpp75LfQg6aOXQA+pVAww600W24GrbdfZt/qcLmnNaVjGn8gjVzlD570s7p0ZC7A6wOpmJcmAsfkBWb6KIJ4VCJgYJBiMuBAL8xN7mk+hJRWbOb03qV1G3uMCNeE1s4hkT8OBnmGl45jc2ro+ry2FeygzYOolKKJIE6ZIhfW9j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0762GMVx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0762GMVx"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2c96cb48a8bso1928441a91.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jul 2024 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720801669; x=1721406469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wEYr9JA8qEfnEiiFVxdx0TK1LeJE+9gMywwztiTkPVc=;
        b=0762GMVx/dDBDmRsp4aAYeGY/VnLjuoMlkFevxfmJS+HX2N6PUR9Qdh1voUJzjR3Mk
         BQOIb+KUSFci8ZR1cmeYYJ8mWjGChj4DWGx5PvEPxAOKHBc1bFVeSaGqHKcIhvdO3Q6E
         wi+T9Mnz5jSO7YpcX9/1yKQzZMAiotJ4zDsfEmIxV/2/3MNG8+RRsOBExNmcyX1TjPw5
         MUr5rom2OJVi2PaSAcnDyOwSMVkLYNuf5UU+a5nGO98qw5SaGkZDFr5wlG31VR14qBBJ
         xrG6oH+Ykt3zpvqnkJjvIo0dZrknYhSdjAJEpegQVWwb86WQZsC+Qevt6q98JWXprX3M
         6LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801669; x=1721406469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEYr9JA8qEfnEiiFVxdx0TK1LeJE+9gMywwztiTkPVc=;
        b=SWZj4F/3AG2oSBnE28JE7mA3vCFoKNu1iJtekpCQRlumP0sG1fXRpH5AGSlrDQT716
         JF86dR79jJ68ULxdJ9E6QvQIjXgfJcp+2lR+1ICx7KxlfTyLtJ+UqKAA4Izjx4emWUvp
         PrWwyHMDlSPUQO6i3kwzqhJEEDyfX5F5BD9ZpmK2JOHPgJGnNwCJ0UIlZirGxFRo1Zrd
         OmYMlWqrgwr/t/2q7hkk2+ryW/g7MaVBODTYBXwWaaUsusxHEsZ9ROnHuJtUNHnG5kdE
         6p/OL89TSkCYDhxzk6JXYmbhD+aRnkUFAz0EqkYjCyuL1kkJdRhNkjC0PO7WLMaWDpaF
         SFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPZJZJkgnMWgBKtaTHtk8TfGj0+Ivn7zqp6sodyhE3gkA5OHSP9HJZMMMTLzrfT1nnQHGAiS1svwrjirTLe1ZFQIhRhhaBS2Zd
X-Gm-Message-State: AOJu0YwDPeCQqT4Ag2h6d2ISFkiHV6/kpOCBDLvTZ0sPQSkKqZrMiKl1
	UW+8RO30QDdw9U2nZzCphYgw+WsVkl9YqL40rdJ7mlL0D16rtCqaYoRIJEltnRe82ha32Gxv/gX
	MOQ==
X-Google-Smtp-Source: AGHT+IExMjSzRoFzJZULA3iZrj2G4RD4SsmatrlRYdXUdzDN8jkO4bSuFKvy2f442Y3Vs24dL56BOimEEwQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:257:b0:2c9:a168:9719 with SMTP id
 98e67ed59e1d1-2ca35d4ea2bmr27995a91.6.1720801669355; Fri, 12 Jul 2024
 09:27:49 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:27:47 -0700
In-Reply-To: <SA1PR11MB67341A4D3E4D11DAE8AF6D2EA8A62@SA1PR11MB6734.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-10-xin3.li@intel.com>
 <ZmoYvcbFBPJ5ARma@google.com> <SA1PR11MB67348BD07CCCF8D52FCAC8FEA8A42@SA1PR11MB6734.namprd11.prod.outlook.com>
 <ZpFH86n_YY5ModwK@google.com> <SA1PR11MB67341A4D3E4D11DAE8AF6D2EA8A62@SA1PR11MB6734.namprd11.prod.outlook.com>
Message-ID: <ZpFZg-9MTveHfn_4@google.com>
Subject: Re: [PATCH v2 09/25] KVM: VMX: Switch FRED RSP0 between host and guest
From: Sean Christopherson <seanjc@google.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	Ravi V Shankar <ravi.v.shankar@intel.com>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 12, 2024, Xin3 Li wrote:
> > > > > Switch MSR_IA32_FRED_RSP0 between host and guest in
> > Alternatively, is the desired RSP0 value tracked anywhere other than the MSR?
> 
> Yes, It's simply "(unsigned long)task_stack_page(task) + THREAD_SIZE".
> 
> > E.g. if it's somewhere in task_struct, then kvm_on_user_return() would restore
> > the current task's desired RSP0.
> 
> So you're suggesting to extend the framework to allow per task constants?

Yeah, or more likely, special case MSR_IA32_FRED_RSP0.  If KVM didn't already
have the user return framework, I wouldn't suggest this as I doubt avoiding WRMSR
when switching between vCPU tasks will be very meaningful, but it's easy to handle
FRED_RSP0, so why not.

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1783986d8626..ebecb205e5de 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -352,6 +352,7 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
                = container_of(urn, struct kvm_user_return_msrs, urn);
        struct kvm_user_return_msr_values *values;
        unsigned long flags;
+       u64 host_val;
 
        /*
         * Disabling irqs at this point since the following code could be
@@ -365,9 +366,15 @@ static void kvm_on_user_return(struct user_return_notifier *urn)
        local_irq_restore(flags);
        for (slot = 0; slot < kvm_nr_uret_msrs; ++slot) {
                values = &msrs->values[slot];
-               if (values->host != values->curr) {
-                       wrmsrl(kvm_uret_msrs_list[slot], values->host);
-                       values->curr = values->host;
+
+               if (kvm_uret_msrs_list[slot] == MSR_IA32_FRED_RSP0)
+                       host_val = get_current_fred_rsp0();
+               else
+                       host_val = values->host;
+
+               if (host_val != values->curr) {
+                       wrmsrl(kvm_uret_msrs_list[slot], host_val);
+                       values->curr = host_val;
                }
        }
 }
