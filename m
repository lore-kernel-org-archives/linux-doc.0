Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C86359481C
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066399; cv=pass; b=YZp2tReStcl2S21bcdm/lTl5RfMILaU+v52KIzuCURg8LEhk63Vyr4ygyDIg9oH7HMb25dAdT/5QWaIWuUIW5n4BRdGPCQJE7l4m38F1Zpgk/7HyHpsDZGujLyHguvMS6gI/kCHf5Xoe0vGxDP0l3RljUFXQPgE01Ypzha+aKn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066399; c=relaxed/simple;
	bh=dT4FNCiiMtIXPLJOvuFJF0jefoKwdOcRJ3SvzlEgqv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3U4SIlXgDlZwBWAcgLh5wl4uPze3zfhD7mtJOPjsI8o5oLyBZ0T6utUNkWqu4acvPNCmClU9qoY12eRYNNyJMPzs62ncorIyjCw/4MrzBWOJz4llJ4SWnsa9uQ3t+gsHUb5NP1ZAlNUYrf6ZF3VBN69UofMXNBcIKlySFm1mk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sw2RHwaa; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sw2RHwaa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so9577e87.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 11:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066392; cv=none;
        d=google.com; s=arc-20260327;
        b=R5ju6dru9Dj5zHdvE6YwAr0QQS9SiU1Ek4lplloRv9LMRxdf/SDTb5+v7yuL1wVbMJ
         L4KmHt8f2D59e61vbIDgBIptZuJb8G5BhE4OnvCVlDdhC/qnzq7/HktYalFRbZLuidxd
         TLpSYCJxpL0V+AGHwOwFpx7oM+4FxNlIoVyQ/mYKtYyDBNyPuWa/5oR9/b3EMfQITRs4
         3oX1HpIcQdHJ2SkMCTNjIeNmWzOECnRZWdTMpLe7gpOXj8qrCL8NU8ifBS3S9r75MY2f
         g7cTmNuz9P8zkhmXs8KrM5O3/EIyQv9qCMArslwhcoChEgHsxyFaQVOsO3biKiM1RHEq
         W/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        fh=dONZLHU8xaQk6mE6boqky1qCZfx+e97Z9ZWokkGv5RY=;
        b=lYKubluCF36R7lmfcOU2MxULDELu46nY/KvhP0OdwCLgpsIuVwjNJ3cbxxCCwVRTSJ
         DV318Ry7oUNwi71AH/kCUN273MFuVkaN4LnOM9XCv8sAUUQq2xj/PBt/xB2qs+DPeCqS
         rgAGVsED8gvjXelaNK+xATFvwzwmKyUQFaBwXIIATniERz8QazraPykBIyoK/uf05BYd
         XQ2wSxbiS+JD8RvxygpfIzh1hp23IgnmdwmSjgnjn3acHYS3rhUW6QAsuK8pdV4IaHPN
         rTcRcnaO9OywTMa59SaNxOyA9LX8vX7LP6h5TXoUNwh3rmKTRGpI4eFDCYkVOES+2RYs
         f1qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066392; x=1789671192; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=Sw2RHwaaXxf51aB+WhflsVPXZjPmG14dd4LokBPYZn/6ZK7idt0TuWHcwAav/rWQ/J
         eDL6t8jrNOzhMjtU1SidTyEOOIwal+t61/w4oylo6ShSyZHYn7vrPXaTTkeJ125mtlzp
         6dgwX6oRGqeQoen7xjJiFujW4kOEQWd5pX8BhfUxGS+fNbJQ7XnqkrnIWsCw0ykKcA1V
         Hru4wYgKWBHQ9f1dQi3R0+hFBxyDmOm4+9SCetyVRT2TG1svlCRnmbi7ps8RcMSy/x+b
         QMEzSPV81L3d30DWJPWPvUFoT7OY6HznQulPA05Ceuu5BvYhjvJPtKUhjtANy084mqoZ
         EVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066392; x=1789671192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=JDJpEIBu7WFmWrNsbmXo+DaWWE/ns34+uHyF4IipkBiVvbDcbAGgxjjqarFSGy7PdC
         QeTm9IIQkGJvYVMJsTS7N21a4GalRtsWMwhtF3Clod3Q1HZ/J9bRbVMNb+wpRQHu4Bm9
         rQlgpNA0Dl19oDHCPYikyP9Rkr2HXByNLWQFCfi3T99IUEoloPbQQZCzAUhZZFiib8uj
         GNdZ6y9SmHHj706TSA3RnrLsH8pRfd/JCtjnNs6wM9uB3zvBNf+AUSLKNct/ShZzT/tY
         j16mXpdpeMjIZnWOOMdn2C18W3vC7GhC3zk3ZUtgGl273UTPNPWiB9LmNIfj4RZFiPFF
         Um2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxE09W1PcA1WQVeNuATAXRdQwCZmxc9aP8DFM09udeLVw8CPNygtgOi85N146dZQIG8NTab1l8Ivs8=@vger.kernel.org
X-Gm-Message-State: AFuF++n7dk3Ozb0QR/e3UP271ZgbwFT1D+pm6L+QNOOWdgwdL98FzATy
	ReImklp4hMU7n8K/uwRClahESGTN8ZFSUh4axxNKxYIfXU6/Kom0CPiqDcFqP+LG6cXd8iIujkL
	rl9uPWEXrchydsmZJHYSMOG6dqI30bZkkv2tZEjK/
X-Gm-Gg: AYBFou1mLokHUxoHL/hUS1VL/NbAfXnj0IgXvS6zc7cdHXiasT+GnRt0gl4YkZa9NzP
	P2YBqDhk0v3VD+PcwURNwVPxtLRLaxG55WxeCd+JJCm/lttXDNLEu0/H3MPjWEKV9MeswnAdG5F
	Hto/0T21tp8U2/1R8G5FtKad9BnOYb94HKipjHix6eIaSYMFtYEJpQAW09dL1LbLT0rsN/OLo4O
	kquZm/O+1K9sDP76vxn1ouxu/yhLsnoj32BA0kSih2Veax79wCKZY5JRptTsnCeptSsl/7EWnjI
	Fm+sECbRE3UkArlnwikhnkoMfPZlq+P4gVXJgx4FrmBxDqh+4pGOznP/22FNbPKeu+xOYvdLBKb
	CVFwQOWpScvaE6Q==
X-Received: by 2002:a05:6512:4009:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8a07a0e5fmr23463e87.3.1789066391400; Thu, 10 Sep 2026
 11:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:52:35 +0100
X-Gm-Features: AcwNN1XPPeWtd-a0jzst6s0fMnTr0aHfMbhg6rA4kjyMckfbadgDOVe553duj-k
Message-ID: <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: selftests: Enable pre_fault_memory_test for arm64
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Update the test_assert to compare against the UCALL_EXIT_REASON, for
> portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.

The message says this updates the test_assert for portability, but the
parent has no exit-reason assert and no struct kvm_run; this patch
adds both, so there was no hardcoded KVM_EXIT_IO to make portable.

...

>  int main(int argc, char *argv[])
>  {
...
> +
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>
>         test_pre_fault_memory(0, false);

Would it be worth adding an arm64 case for gmem_abort()'s pre-fault path?

Cheers,
/fuad

>
> --
> 2.55.0
>
