Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577909;
	b=sv7NNs1oEiqj3WA0NEcVKkf+EObWIkgWa84If82l/kgKHo3g8MBVdwRlIn5CsPM6Fv4b
	 z3ojgLqnRbB/7HUubsEdMqlt9dEwfktsayk1RU+mLlEMkUEjBQ/09m3Z/zBuDnY9ObNYR
	 ns1YlGlg4LQEVLJfbb8Dl+Mudz9oRffqT0TWoeQXpaV5J4/9EPZYwepVwjq+xOAz4FUli
	 3cR6SC854AxmMEKVSdrCw/OjaB38Dmibe9HBjeztc5YFHakXh6iXidx3GTnVNTV/NuGMT
	 un3VV8Ife8s8zXDWK5s8CxnvmifA6k1J4tLWNeaCzqUeR9pyEVRNDBHdO/+74uv3E1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
	b=ZJdruBvgpDaZV8ASGxxblUoSUGfMpuHYelcpUH06ccfKz51D712fYqhWo5Ho48qwO0Rl
	 CrSV0ICBTyALPF6uW87NBl5qLtY0ZytEc3HiJykAE6izJvUAVJSL+EH2E1aGXKyCYIaYZ
	 NwB0V4YJYvvNv5z5/OokvTsPiTTHwHYUJa5HRHbTl98aWe07zsYEJYUuq0cn74v1BdM7A
	 uxV3LxvWOZ0PLi6zqvOX3JYZt0P1b9dtijYP8FWkoF2IY+W0h/0Lxj15Z+jh9scwwWC+3
	 YKUtXeHr1Z7KMK103Mf1GmHQc5q+eG5E43DVo5NwxUFY+d+901PPqWlPtQrT9vKh06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iyYZiJ8j;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB78606CA26
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB78606CA26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iyYZiJ8j
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1316200a91.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577909; x=1795182709; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
        b=iyYZiJ8jcqBngMg2gOjYjAHJu9i7i3NjGZ32sbMgw2U6zE9Iu4JJc/3fs1BBFmKBym
         TIuntcom/Sfh3JyDk3EnJT0Nbm27Ap95riyXzo/drUcLyTO8S5m98A8uJtl1bZzQGPSM
         9Av30/QYjoYn0k6MhIvN/VbYAOYYffw7NVxeSaMbjQhG1ac6zo1rX0NwtG2zyhB+mHpw
         sXOshidQuBG1WVI4U+H0YDdyXwwXcIN/dW7uwRtyt+rJHO7Xcl/os/JgVGXkqOhyCh2N
         qgTY+deikiW7hYpqnUNjhCwdNHqGSIB1l2KAdLJ/nTbmQJoQi4XMPIB0p6Z6IoZAUTSJ
         c4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577909; x=1795182709;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42M757uFT5De2Shdc7fUSbsmEvk3UICXAJs/eiBakI4=;
        b=EEr/RgIS8JysBwT9BwOpfNBi+cJfnD3BwcubMm8+HGyiBlDTYWV+vXjZlWTdbI0eoZ
         etQ3xvG2dr5Jem38LNXhf1Sw/2zaShDTPnvub1+BJSsNw6qbeKwY8hKzjZzfrDOymwmD
         f7Jc/If5VUw0uUhy0a3Wx0JTtFroLcMRCcPGgTmCGuaMj1VBO3qdZzM+AkqdTPCxiXz0
         D53ul2Oc0X4LgNacHB3HKDEXr+wYSbe8RSk2pfEZa+IlW+nVfHpOUV7CtLSBK63oAiTs
         TEJ68YtXLJ06Weg8Hdhu1lCTxVEXpUed3Xr+DHWkz5Ky7jY3z3+aBIxrrMk8qzMJFwg/
         BOJQ==
X-Forwarded-Encrypted: i=1; AL+hErF7iDhkSAio7+RQ2rEEWmp7lZhoIW7zXUB5RZB7al/ZNplFGdv1SeKs8k6EaqM8T7UnpreefavE1DM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iK12mFOPbVy7MYGf+PbLNdJSaD9Z3zD/A2jw1sJ9RZ0XYtBco
	96PVNkUjufyywMqbUVoqYIkNbHQEO6zHItfr7q9tcuT4z5do8rf4VCKO4Be4TRRQ0YWt5+1/KIZ
	9ryTk7A==
X-Received: from pjbse4.prod.google.com ([2002:a17:90b:5184:b0:3ad:c8d8:70c3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2cf:b0:3ac:74b3:a8f3
 with SMTP id 98e67ed59e1d1-3b1b0ccec81mr2546508a91.44.1794577908610; Fri, 13
 Nov 2026 05:51:48 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:18 -0800
In-Reply-To: <20261030210321.3019901-1-jmattson@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030210321.3019901-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441820842.80495.17224406535846671057.b4-ty@b4>
Subject: Re: [PATCH] KVM: SVM: Stub out MSR_VM_CR to return VM_CR.LOCK and
 ignore writes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, 30 Oct 2026 14:03:21 -0700, Jim Mattson wrote:
> Commit 4a810181c8bc ("KVM: SVM: Implement emulation of vm_cr msr") added
> svm_set_vm_cr() and svm->nested.vm_cr_msr solely because Hyper-V wrote
> to MSR_VM_CR when running under nested SVM [1]. At the time, Avi Kivity
> noted that the MSR needed to be exposed to userspace for save/restore
> [2], but it was never added to KVM_GET_MSR_INDEX_LIST.
> 
> Moreover, KVM's emulation of MSR_VM_CR does not actually wire up any of
> its five defined bits (DPD, R_INIT, DIS_A20M, LOCK, SVMDIS) to their
> architectural behaviors (not even checking VM_CR.SVMDIS on writes to
> MSR_EFER), checks the wrong bit (SVMDIS instead of LOCK) when locking
> bits 4:3, and never resets vm_cr_msr on vCPU reset/INIT.
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] KVM: SVM: Stub out MSR_VM_CR to return VM_CR.LOCK and ignore writes
      https://github.com/kvm-x86/linux/commit/27ddbc70c82a

--
https://github.com/kvm-x86/linux/tree/next
