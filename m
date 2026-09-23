Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C1310652
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160904; cv=none; b=diO8pa7tMX/+azOCaEHaqQTy3acMZnIHeFharSLtTF1I0dqQvMw1OpsNEpLZbGqU6lDefFeIyB1xg5XNOmvX45BHtz7pHYGhOh4ZXrBU4i8Gd0myYVbtIRfLu9S/s+aHBqlfVCs8+NCYvDbP2JheNZ0YbSOz6xGZ4sNTwMEhV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160904; c=relaxed/simple;
	bh=yVmUpuIH4LVI1oZQrr2/nMm/0eXEyin3chUnWBcISSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ju5zQ/tXDwHB6RsJESv4cQTfyLTOjdsc2A04EVGhmJu7P58PA2voMrxjwGrsN01J5UzitBngZk99BIgWCyBxGbMG0/UmI7yM82gq77ws06BFJmzQakkAktXjIvYK/xJwiRC088x2I8C0sCrFxFoG1HOVZs/7aY+yCd3JnsUXml0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fy73+tXc; arc=none smtp.client-ip=95.215.58.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fy73+tXc"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yVmUpuIH4LVI1oZQrr2/nMm/0eXEyin3chUnWBcISSY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790160893; v=1; x=1790765693;
 b=Fy73+tXcz1atg5k5D1Mv2nq1ugcHX/PyDpAK90VH2Z0kIzGvcoSvLXIYAxYlvX5AYPH4JHoI
 x9hqgN0UuEdaMCpZa2o+kZepbL8rPkGL966LWlJGn4Nzqu93gYhsNQHR9x/HE4aP97gkQtek8Xs
 xCCttspZOcDM6Csoy20jLMg8=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9fe5688579383e9f;
	Wed, 23 Sep 2026 10:54:53 +0000
X-Mizu-Trace-ID: 9fe5688579383e9f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso4428e87.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 03:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrPjtWQak7KhqajOOQiYvrEnK37A7RGjKMpoDC4DStfb0nn3IzdrYCLWyDeJurfPjMbVH5YRomRmo=@vger.kernel.org
X-Gm-Message-State: AFuF++noOAMxzY4v2bi4h4XLlLStwl2F1pj6CKb8eSmp68DPh/LXxT0h
	CuNTLLB9jRWvNa6AVeFgjbYxqXQEB74whA2eFucwMbgSrza0ivOVAXoDCZyVAT3GyvolQOsPegt
	wOZ1EXLiJVxAA3RATYe7ofhbb3oQcLpU0cG9SlaGK
X-Received: by 2002:a05:6512:33ca:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8d9160e2emr107555e87.9.1790160892115; Wed, 23 Sep 2026
 03:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org> <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com> <arK5ynpRi7VbY7Ek@gremlin> <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org>
In-Reply-To: <arLD-eZ6dRvfZ52q@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 11:54:15 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
X-Gm-Features: AclHuK-6bXSKYKAlCXF5uVJdAsZAvVzP1kh4sI2y88uNwVQX6Xs_X_01A5MNiE4
Message-ID: <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
To: Oliver Upton <oupton@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
	Jack Thomson <jackabt.amazon@gmail.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 19:07:53 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> I'd favor doing something like below and sticking the comment inline in
> the ioctl handler. Unless I'm missing something blatantly obvious, I
> don't see why the x86 or s390 pre-conditions can't be tested early too.
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> +{
> +        if (!kvm_vcpu_initialized(vcpu))
> +                return -ENOEXEC;
> +
> +        return 0;
> +}

The same goes for arm64's pKVM check: kvm_arch_vcpu_pre_fault_memory()
returns -EOPNOTSUPP for is_protected_kvm_enabled() only after
vcpu_load(), so on a pKVM host the ioctl loads a vCPU the hypervisor
may not have created yet before rejecting it. Could that check move
into kvm_arch_pre_fault_allowed() as well?

Cheers,
/fuad
