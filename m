Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CE83A12
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718227147; cv=none; b=T5+kNOFfFivb+11OnYsZsBw4Cu5VOinitohsd6HOIt8qZ5mfwY7xjM9PCNLBeYX/K8ojYseOTZNli/436Xr62ioi4/cOYtX5LY4lNYOYVA0Z6AT/JSbSB/19+zNHJUYHqMSqp/7PsMJzApNN+5h1P3y+lzrBPFEy3gdkYRcaht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718227147; c=relaxed/simple;
	bh=MLQYv2BaMO1JDh6FRxrn0183u2i/RhneG1bZBn24Djw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uzAWpDC/NBfspzRQKcxy2JoqhD5QXtgd1rGdy+cXuOLTdM3UcSVvFU2uKgT97JPk+kBQk0c2+jWEkeGhhbimDwnEyTN1TQ5/tRRk9taA1jaGgfP7hC8vCStj55ZJ8es/cD5b9fyrGSK/a/44ACPWiAyx5Wwo2pmn7u6utr1lv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G5pqxlWO; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G5pqxlWO"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-6c72c8b9603so196454a12.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 14:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718227144; x=1718831944; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgahXDJi4rwKNqUUVFC+2hJQOZ9hbHHAlaLc98a2hms=;
        b=G5pqxlWOVTlPvxIPYTb6ajek2CMU9ErhvUwqRFJ98IjN9n4GVFiqbemxT4129b9puw
         dUnJ+7k7avpS5B/6VXMJLbrbkOVSuuDBYxpKHk0AnTyy1CC5oL315PbVcPB8iFpuQcLc
         9uSjNDPPhxVHpINbPujkEq9OvSWd3Z2c6smuTXPDUMeUy+vPSy+W/aUFQD0XKMGk0IVq
         51xIfLhIxNaVeEBFate14JJsLqDm1YLI7Pqg/EYbOUZWlsVkZzsb28YdLr4Vw5uzCN1O
         9MIXrZG8OqsAbLdfkQzrzW4ixYOGNEHNrHq9YR/oXdwzpMRpFbfb+VRlh4wVLAzOUstq
         ZPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718227144; x=1718831944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgahXDJi4rwKNqUUVFC+2hJQOZ9hbHHAlaLc98a2hms=;
        b=JhCH5AgNnUQqX2Ud9ot+HwiE6T2Wl7hQN2YuEUuncAavXyWcMpbIevH76CGYoulYGJ
         i3uVgYYQPUPNTBLgV5F9ZJIFfuFiKyPR73DMQ5wNBlLB0rinLCSaSTuuEAk7T+oWK9DR
         8y10zdV3vbamvqtCEMIfxAevePAUgIcFOmYeGLksaZNYYxFF4HRz5YjUpwydKdbn/Q3u
         JCLSk5TVwJHKHy7iUsltMoTWzjkGh2YdoZntAjr6aQrR1i8rGZI5N1RePEeljH/gCad9
         88JhR0WTWpw8ux5F+cbMfUwC1ncgUKGHAasNtrpwzwcB8X8vjSpetXwKqOS243kC/uNX
         uEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxU53xU3MN8svP2oAUFztyl21v52So4gUl59mTGAxWwANQG/P1WT3KODhN6/6E14zbfqOASMd/LXSECd1nvcAVaNq28pZXPfNu
X-Gm-Message-State: AOJu0YzEAoR2SXdkvzrmUitorjrxNDCnduK1WYQBUha5DHNVkohzrdyR
	8prlmnSx8QtwOVs8mwpUmcW1xDgUd59HWP0eaqKAk3H0nEyW0tLY2qrtQgjYSqswF8biNSqMNNo
	xHg==
X-Google-Smtp-Source: AGHT+IEyX+BvqryxMRr9G0bMzgAJHpudMNKKmYw7eyQeJ8a3uw3AhkQsT+dsqu7wlsIWbs8crlNnEDE965o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:451:b0:6e9:66a5:408d with SMTP id
 41be03b00d2f7-6fae27627b0mr6025a12.1.1718227144135; Wed, 12 Jun 2024 14:19:04
 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:19:02 -0700
In-Reply-To: <20240207172646.3981-7-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-7-xin3.li@intel.com>
Message-ID: <ZmoQxjksn5bWhlBA@google.com>
Subject: Re: [PATCH v2 06/25] KVM: VMX: Defer enabling FRED MSRs save/load
 until after set CPUID
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, vkuznets@redhat.com, peterz@infradead.org, 
	ravi.v.shankar@intel.com, xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 07, 2024, Xin Li wrote:
> Clear FRED VM entry/exit controls when initializing a vCPU, and set
> these controls only if FRED is enumerated after set CPUID.
> 
> FRED VM entry/exit controls need to be set to establish context
> sufficient to support FRED event delivery immediately after VM entry
> and exit.  However it is not required to save/load FRED MSRs for
> a non-FRED guest, which aren't supposed to access FRED MSRs.

Does this actually provide a measurable performance boost?  If not, just do the
unnecessary load/store on entry/exit.

Generally speaking, the only time KVM dynamically toggles entry/exit controls is
when KVM wants to run the guest with a host value, e.g. with the host's
PERF_GLOBAL_CTRL.
