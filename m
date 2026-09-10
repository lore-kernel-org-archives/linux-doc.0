Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE091549382
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 18:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066663; cv=pass; b=JCKrJdvC6QTtkHyyL5LAKORdv101oSr2+HxqIJjU2X/yN15cMBSh4FG7O3NbqbRXKRvSrCcOl7lNCxLUNsND3cnQG6dNmco/l5Rdh6ReKhHPYj5DeGugYocMiVGwM4Kehnru2mv3SOiGW8sQgMhsgitrhIgJA0h8BrNVo3eeBOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066663; c=relaxed/simple;
	bh=LvLi2WG97zBBaTutxiZFhYxTjRdgTSJJxA2epdOyf9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoQMnQUQ61hpC6rN7ra1pswym+3w9URiNX/AZWlAGbH6uiOHBjyA/kdVvclRxw8HR8oBkpr0wN8nizq9z6k60RhELYnaXzOVmUUrYpGaGkdBFknk6DVkEJEak5y4a3LXIO+Ffuct4SaXZs6rsIiMbjEaYBNMPG5Fh3XTthsGpgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJOtVM85; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJOtVM85"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so10177e87.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 11:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066660; cv=none;
        d=google.com; s=arc-20260327;
        b=RfTvGYiB88nwjyzeE/SUFNRgKQyjpk6ER+T5zM0m22IxGxv3TSMt/IqD4YyVk1c+gh
         SFGZLxZl0mG43L5Cvi91r8cJ8x/xBAuwqOkLE3p/SUGOS9+I2GXkq/PyuJVPMr/YPT8T
         SBArMY9XU2RjKfVoP8pwNYpOxaiXioLJSurEcNl2dKPadvYRLxWxSZRk5QBhlPeMgvpk
         GVwUTnrAJLj70D4tSW8aKOdT5Vwk8JHFguGTFfDi7R8d+AHQAyvCp7zrOktJwsjdU/za
         EOtNJqO/M6w9X72edImwkrHy4Civxo/0BFISGPC+3sxhSOwvA7Mmnqi2LyOn+fEYfiER
         DjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        fh=1w/GdexYeVCpLx8KV7YIUV8SK1jpFzr/v4fQmN7X9fo=;
        b=RAwUhXPgRm2EwT2FsfoDNNHfdxejRgJROfb+OVkPEoZ7BhSwz3uSbVNPi+BO638kUV
         25/6vGVdJeN5JYreCa0LWxEWdIdIQQuBa4FXTIUG0Y7iPjQlbQ7/mDv9xxEIe02iWnH8
         vCfAspYxdChPBhtv1T2Yvs8IfxUC2a06YjBGqymK0GXUTVNHylTZRXNP+F4m84j2EbG4
         11tn09r9kytFt4kdX9V6uvIewh+i4EexrvTjqb82qGnpgu7UHNezVUxeOHJvHItTdO5o
         tw7n5E6BAqFy1SkxQsSKpgE0LvydrKI6OBuF+/K8r9RGVsTihw0Me3dU363lbDuXScjC
         QClQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066660; x=1789671460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=oJOtVM85a9xcyN7YMuseSSWyp8vAN2Qfn8tI8OVrWxUeIsBShlbI0OEAysQ6gLuG6p
         IyfC+Azdn+tz1fniwC4FOS+kyKTdW7UlptpNUrd3+w0KiBiNevQSPciVjvpiExxAsQIa
         NSl5/L4pB2ug9R3/9LdXDkcE27tmYnbD89oOi2w6ZXnee5diXL15ovuRmc7o+MbuW5nA
         AauSZEoUy+qpV51brEhIaXQd60IPDVLI6vVI4p6IGVMBvZYRtnaOF2vve6vofXJ2srJ/
         9x759VHui0Fg02/EFz97Tn+v0DYbCg4VPdsQOP+BdTq0+l6E1HV7FgkkSwETo2zHn1Ap
         fyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066660; x=1789671460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=LgzDeEhjBDTWf6qv1eKpSIg8qPvfq4nG8wv8ly7hRDHbKK3oYT5qvQXVTnyckoPdUr
         MYS3ALMA6IEOPgBGHnTjd6uytNuVfkF6xuaSf4fZCgfYEcnfxVreiVuzr19ajqibtuzb
         KKpzS1DhLbN9ASWfDumdUEREBdPxImI3xZauwMwTPBJcft1fYQ7yaw3MJDfNA8LbkGFG
         DZmyTHf6kO6dMqJ51a8Zx0JPrukbLSpJwnCVraL7zRf9jLTtTMEUdbOU+aeFNHlhimtY
         N/SQS9VaEqd6wtI1OpJ6CM4Fpxys5YCge3qAC+GqWZxgsqHLJ+arvRDx7qBdWGx0Ur5M
         HlsA==
X-Forwarded-Encrypted: i=1; AKwUvByT0oPsE7IijBVK7efPj4fyx2UbXtwifPDssyw8X7/nIrKlJsHZM1SQLVKBJKlA1wKLFcTj/xGM4u0=@vger.kernel.org
X-Gm-Message-State: AFuF++nYyiXHGUqoAmXjoRhYlrcPwtGmDWC9diXU27XTEdD42ARPjRGS
	IRr8z2rMzt1EQXezvYnC+qkQcaHA5M2zgJOQArV4sDlbRA9DppxWJMjqWLSrKKyoS5v6XpLctSl
	6P6UE1va0m0Sm5ZHntPpQ7d5kWYVJSM1YOgYmGMzv
X-Gm-Gg: AYBFou1DWRDJVCM+Efjz5xNrC3c5nJj+5oF4tZ6NqAGN4lMCgTpJx8z4CDEWlZAOVMZ
	OLEygKBZ2rnfnirflJRP0htH+BT1NDAVYV9ZKQz5uinTdLLBUyB04wMDGeJgzjgm1yFvZLEphvu
	zxl8dxMNQfYbDt44aMcHjzvHHYjdBcP/k3NlDApksqBLM9SY1908WJJJF3OuEVuk7N2nBWKl2ga
	naYPfPhbysT52PqcrOBbKbmVvBuKHP/ADR5bRh1LG33NKAKsQlkRMpAp9lX8wqOa93tgDbQSeZ0
	0oRTMkIdpaIjEvPADdtru59HvqyUPLgB8bH5+l7pqjQObYwFcNlbre7qPrwQP0osLCK/GS0Co+w
	lhaXSlv8+S2Bdrsf5F+DYXM9J
X-Received: by 2002:a05:6512:108c:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b8a07ad04amr18706e87.7.1789066659207; Thu, 10 Sep 2026
 11:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:57:03 +0100
X-Gm-Features: AcwNN1WRbRt_RViN6lNXEa633ZkRLMSCIUfMJ0FeZLRCcdVLjr-AEUXzwXInRdA
Message-ID: <CA+EHjTy8m=b8D6sLOTv3AW05vXqFPRrTYvG7-t3D64Vt1+jAWQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] KVM: selftests: Add nested pre-fault test for arm64
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

Hi,

On Tue, 25 Aug 2026 at 17:02, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
..
> +int main(void)
> +{
> +       struct nested_s2_state s2;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vcpu *vcpu;
> +       struct kvm_vm *vm;
> +       struct ucall uc;
> +       u64 npages;
> +
> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));

Would test_supports_el2() work better here? It honours the NV=0
opt-out, and since HAS_EL2 is set unconditionally below, NV=0 doesn't
disable this test as things stand.

Cheers,
/fuad

> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
> +
> +       vm = vm_create(1);
> +
> +       kvm_get_default_vcpu_target(vm, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> +       vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       npages = TEST_MEM_SIZE / vm->page_size;
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_MEM_GPA,
> +                                   TEST_MEM_SLOT, npages, 0);
> +       virt_map(vm, TEST_MEM_GPA, TEST_MEM_GPA, npages);
> +
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   NESTED_S2_ROOT_GPA, NESTED_S2_ROOT_SLOT,
> +                                   vm_adjust_num_guest_pages(vm->mode, 1), 0);
> +
> +       /* Run the guest until it has ERET'd from vEL2 to vEL1. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_SYNC:
> +               TEST_ASSERT_EQ(uc.args[1], 1);
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       /*
> +        * The vCPU's last-run context is vEL1, backed by a shadow stage-2
> +        * MMU. Enable nested stage-2 with an empty root so that the ioctl
> +        * fails if it tries to interpret the userspace GPA as an L2 IPA.
> +        *
> +        * Prefault in two halves so that the second ioctl exercises a
> +        * repeated shadow-MMU attach and canonical stage-2 swap.
> +        *
> +        * (Note that an implementation that wrongly populates shadow
> +        * stage-2 page tables would not be caught as userland can't
> +        * inspect these.)
> +        */
> +       s2 = enable_empty_nested_s2(vcpu);
> +       pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
> +       pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
> +       restore_nested_s2(vcpu, &s2);
> +
> +       /* Resume at vEL1 and touch the prefaulted range. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_DONE:
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       kvm_vm_free(vm);
> +       return 0;
> +}
>
> --
> 2.55.0
>
