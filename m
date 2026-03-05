Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950993988F5
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772730500; cv=none; b=DgYAjB1P5Vb1Q9KGDwH7hAXtafs6p7nGJpWpid1SRPH6rB1wYBSmsx2Kkf9SlFLXXrBzINaw9T3NixLjQO0yft0EKvwsRCKNP71E/keW4JlVsNSADKTxnZ6coJ1JEcizJLnmUdcH5m7a4epmonK8Y4+AiiG7OtXG7FKVZU180S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772730500; c=relaxed/simple;
	bh=dteI1SJNmPAO77bYzItgRmQJ7d6v+OBdOPlxPAFgTGk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Z1CUiGfmXTcNY6S0FnFr6kPETe2yBYQXDlpgyhjKNs2g+OIZMWSBkYnDI0a3RJZgmGVkYeDASRKJaDOrFk7d7VF32SQv9pv6TJd1747TW3//8UJKLJfYYquWpEe0JhNoMakI7NXsdy88Dnx6fdkXanuKMleiAlihNCc/WUSDJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3v3YskBs; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3v3YskBs"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-359887aece0so5368097a91.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 09:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772730499; x=1773335299; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhPw/roeho+7lvMc3SsaU8TxBW1aXYa0qtaNcvm0G9A=;
        b=3v3YskBsqYugbHYIppt4H93BmeUnYSeYOzykoFNOe5fSIeYl5FJyawdXMlIoPa3Be9
         MI6/cZn2H5U3/NGH3/2AKP2E6tYFvZsvXemtusGFTBNgy3qKbkrKhCRxfejT3kpVa0UT
         Q1SVNNyOVB8DiojfcP+Q+mQ0/Y/6QQnckxvUYwhq9+xU0+M2qBduWz3EG7nSgCA99uC8
         Aev0C7NmDEsJ3Egx6k5Zx1Huul7FpGGkwkNocajKs0Y1XKN8kHL59mMxjI4cQ94H+a35
         ldrXil8tZqyHYd9Vuvaf7cnrIf0+K3XQpNeVI7qcq0XsdZwjPnH0/ChnQW0YJ9xplF5+
         WscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730499; x=1773335299;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhPw/roeho+7lvMc3SsaU8TxBW1aXYa0qtaNcvm0G9A=;
        b=sM+hDyby9kqWGCruMCsFitnUXgw4tCZP4Api4sY7J2x9eGFPS08j+7k6y8Bk11l695
         cFJGStQdusr47RWoLPDSphgvHIjEWpivsCLZ5YJ65WmANRPm8TgRYnIvjfuby1clrptz
         kxJHM/OBVaCpP4TWk5Aa+1rs4PoIMiqJOFn0wqSRfg2cSg/0ENRTX84El3o+wfL88rUd
         7hDzZrRPIWkjeQym6diFsRvfDE7/FurDcX+S7IVhz5ZBCXx1//g6GEJirJ820AixIcnf
         wj/ZRR/gsTDfa8pied3wEGfdV0Puil9rxzLT30bYDLpsOQnyvCiZABcFBsexVoNuifp+
         y9rA==
X-Forwarded-Encrypted: i=1; AJvYcCUQepQV3/mMUk6vPi0HYCB1YcA+1Zw7+2UPoBToEcrgd83Ya8oerK3OS72iAb9M3zXpcC0getUU6GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0xGhdEiweSeuU84OG0xogJwOfeOMWK4Eb5xOI5nugBQyU+l2
	UiLf9G6RmKMNDTlzdFILiDvsO00H3TaZOFXjZtpohXhs2nQKA8Q6nOCrZD4fLolFOVBDwu9WQKS
	qpghClw==
X-Received: from pjqc15.prod.google.com ([2002:a17:90a:a60f:b0:358:f40b:c72b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2888:b0:359:7906:d996
 with SMTP id 98e67ed59e1d1-359a6a66a94mr5691416a91.23.1772730498600; Thu, 05
 Mar 2026 09:08:18 -0800 (PST)
Date: Thu,  5 Mar 2026 09:07:29 -0800
In-Reply-To: <20260205231537.1278753-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205231537.1278753-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <177273037616.1571959.14923742089939841879.b4-ty@google.com>
Subject: Re: [PATCH v2] Introduce KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Josh Hilke <jrhilke@google.com>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Feb 2026 15:15:26 -0800, Jim Mattson wrote:
> Add KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC to allow L1 to set FREEZE_IN_SMM
> in vmcs12's GUEST_IA32_DEBUGCTL field, as permitted prior to
> commit 6b1dd26544d0 ("KVM: VMX: Preserve host's DEBUGCTLMSR_FREEZE_IN_SMM
> while running the guest").  The quirk is enabled by default for backwards
> compatibility; userspace can disable it via KVM_CAP_DISABLE_QUIRKS2 for
> consistency with the constraints on WRMSR(IA32_DEBUGCTL).
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] Introduce KVM_X86_QUIRK_VMCS12_FREEZE_IN_SMM_CC
      https://github.com/kvm-x86/linux/commit/0f70db0758be

--
https://github.com/kvm-x86/linux/tree/next
