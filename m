Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325719;
	b=LWvDtQtLc6lV2nryDXdgJT85n4u2BX/i8X2/vyjYcq1bxJ2kUEd9HV78q7DeVyUs28pi
	 RQBGf/l4ByTexBXZlQnoth5xssC/HXWogy9zu2FWcTBhCemF6q9QL9L3DbVPTYW3Dc4Xo
	 yPz6flg6dSsKxpRqN7u2KhYwItNxDx6lOWAwp7Q/uXY9xISwuH2EgFbOq2L87x30aEDlB
	 LwH0FW+GZiekYpVbmuysQ1KhxTuUmj1e28baYL+hsubX6RJrW3AajO72RfiTvw0sSM4bj
	 s06MbRsz5Ec2ZsKUTV1ZioqXHg92qlGub9jYJt2oMN8uI0B3c2+uHsA+yzL/+fELNGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
	b=maCkO50rIEFkzjZVk03by78fWugrYMpyLMicrXS+p3CjgbWRF6VaGzoxKjuAeLrNVEq9
	 Raco4eXdzBGJR7SX5uBMN60B0J8QAnGyVKrXVzOrTO2yMMDnwrTaNNgnzrLv8/rpx8/Am
	 f/Igtdy1Tjl3T8cVn9jV3zW46580g4Gm2eqC63grg99wD+h23VAmUZvmTcY47KiOoHI5w
	 U62/+/AlUblbzFb1+7PNQocKXjyaGTfGIltRc7+9GkiJKNcV+GEGXh/v9JZ6bNkgjgsiJ
	 YtbnhQi/2hw9I8JOPJsSSWedpgLYZJ09kxVEsI2HVyfOxEJQY93fdN70+dtdcVY4IIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VEDWmjx9;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4346760A2610
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4346760A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VEDWmjx9
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso19383115ad.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794325718; x=1794930518; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
        b=VEDWmjx9ptAoyITql445r9a4r7M3NFRes+rAAKiIqo0108JuRGXtjwrsrFF1aGwJub
         tjOjLHcpweM3cxaKwy+gYTKpimW8Sh3JwaVyg21n1qQQBvzxbeV+G/ZEwsCo8TQBLPTz
         MTFd3LK0X2LpE45of44khmYMQaaJncnHcCP8Y8tHETeL/lsBxUhom6olGpAdjhZX8t7P
         i4dv44F9rrNKjMYWvUvjkWBfrv1P1FY4EF0ZkSxmgiYBXfptCh4ieM1+fPMHWgWi/gSM
         pZK2hJZrQ/6N1x7B7zZ0KdR4+yWlo4sL6UlLigySUFU4DkEBcJW7YiBvPfvPPb0MmsMX
         I8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325718; x=1794930518;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6krrngdHCsjiOW3bLfxtRylPnkwePlq//L1F5r6HtXs=;
        b=QtQwCVN5yd5B+fcKgd+ZcoFdTyxlBkQyuBzh0pmJZ+rWUNW/eExMN3Nqz6nxOXeV28
         zVCxUDT+sMdI9bsff3d6vDUR5K9fWZxKF+UoZC70F4+yaWQxT42Q9PLjE0+sa0x7y8TO
         6usTWT+kkfcg/uNR9RzltU2tIWw+BlZqBGafFC7G20cSpE+E2coQDRhDgfJfD1ZEFGca
         TnPDqnb4KsXsMVW0W27dodxYxZt1i0aFj0DoIz6b6ZxgyC/qBaGnrYwHpO2++0t2exTd
         lc8k4zIVVYj/yRpra7PUS+EvbleWbgbRU2IaphVeDN55vxIGFVhEYfdvW+JTMOcpHUc9
         gJSw==
X-Forwarded-Encrypted: i=1; AL+hErEOMt7mOOkP4pimFID8LUzaZ6GVKiLd/xRGO33uqAva0LehZpv7CKAa3nnjuWFjVWM82nJWE+tPFsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rBQ85dLb3gJq6s8mcoI8nJM4a7iD6doAvY8TOR2B/1n7wgRG0
	7PUYw8IbTgVTt0vAqod0z2CRjYkePrSeZeMmtoHeDZSks+dJ1JVouOwMtUKQIWjFXTraHbs9pOr
	/SPnKig==
X-Received: from plzu6.prod.google.com ([2002:a17:902:82c6:b0:2eb:809:b8ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d547:b0:2ed:218:6043
 with SMTP id d9443c01a7336-2edb93052e6mr23931165ad.59.1794325718280; Tue, 10
 Nov 2026 07:48:38 -0800 (PST)
Date: Tue, 10 Nov 2026 07:48:37 -0800
In-Reply-To: <20261110110724.3614412-2-fuad.tabba@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev> <20261110110724.3614412-2-fuad.tabba@linux.dev>
Message-ID: <avM81YcTBTJ8zCMX@seanjc-mac.roam.internal>
Subject: Re: [PATCH 1/2] KVM: Stop KVM_PRE_FAULT_MEMORY when the vCPU's dirty
 ring is full
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 10, 2026, Fuad Tabba wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cf4cb586f1407..da1b76ceb65e3 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4461,6 +4461,12 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
>  			break;
>  		}
>  
> +		/* Like KVM_RUN: only the iteration crossing the soft limit uses the reserve. */

Please don't include AI comments verbatim.

> +		if (vcpu->kvm->dirty_ring_size && kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {

Eh, I vote to just use kvm_dirty_ring_check_request(), I don't see any harm in
clobbering vcpu->run->exit_reason.

Side topic, kvm_dirty_ring_check_request() is rather confusing (clears and then
re-sets the requests).  AFAICT, it can be this instead:

	lockdep_assert_held(vcpu->mutex);

	/*
	 * The vCPU isn't runnable when the dirty ring becomes soft full.  Keep
	 * the requests set until the dirty pages are harvested and the dirty
	 * ring is reset by userspace.  Note, checking if the ring is soft-full
	 * can get a false positive, but not a false negative, because only the
	 * vCPU can add entries to the ring, and its mutex is held.
	 */
	if (kvm_test_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu) &&
	    kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
		vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
		trace_kvm_dirty_ring_exit(vcpu);
		return true;
	}

	kvm_clear_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu);
	return false;

> +			r = -ENOSPC;
> +			break;
> +		}
> +
>  		r = kvm_arch_vcpu_pre_fault_memory(vcpu, range);
>  		if (WARN_ON_ONCE(r == 0 || r == -EIO))
>  			break;
> -- 
> 2.47.3
> 
