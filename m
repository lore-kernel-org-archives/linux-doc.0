Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C0431E7C
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782942465; cv=none; b=KkO8ek98GFl+6R73GLWRblb/AlZfjt5ffHFzF+YnjFlG4KRwc0vpRGTGzVqEebm745A5yFBUXnroMw4b6gs5ThWgU+zrE7baQgqrxwxp416cnnFYPbbkQEcpitNx5JXnjkLQGfD5cuHd319BiJk4IfECJb8tsl2ov3iNRsKS438=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782942465; c=relaxed/simple;
	bh=s6Cr8zkyzrstP1cxKPxKWWNP4yvLxKRkyvcOWVE4+90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PDSUwS2ut3yEv3k5lyebIvvZRqEYqlqOgYqa4NCvaD5OHl39f7qAvzrAnRyDMD2lqA7XEjh6/tGn+sr+pkcz5/FdDrteI5dkuaXV0MsPLQPNSNXMGbxG9pNhDRwSmggNpOH+O3fG7pPzyye5sH0Q3xU9RCz2V+OiLmr1HaVVTiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rVpsp6AZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rVpsp6AZ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c804e38c65so21351375ad.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 14:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782942463; x=1783547263; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zcs7QN5Kd/BsLm+PUgFcojzf1bXkoGYIJwLkqkM7zHA=;
        b=rVpsp6AZSOy/NLznGTKp2Pw0DZ0B+eF94ddmhpHVgoxEcys5CrnXYKghzp3ABlufZF
         1g5AedcwCOYpu8w4IjF2J9wDkww5bJFp6KEUHRuqyno36Noz4OAjLa8DUFJL8n/YdrqU
         a8VxfcQAbUtpiBel3y07+M6myY0PYPjLlRtpS8nLFQbkUYuL94DgIpp475jnWAjq+Wdh
         hUizv2HLC1hdwRwlSccQzYDddIQjKqlMWg17WvSQvPMQZhz3F5Pr6qdiD6wVTVYXpSk1
         fOzpNm89My0UVP3OTI+55vYxTZqldejdJeDdcz8IT1pm2o6o1txbfhCvM9OzVmeDxkME
         bf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782942463; x=1783547263;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcs7QN5Kd/BsLm+PUgFcojzf1bXkoGYIJwLkqkM7zHA=;
        b=PGU6YjQgWv+Jao3KIqlLAADNY21kVQ9YZ3czqXqV9z/+dhDHi1r1r8xr9DiqKZ489Q
         /IrZfFHocqWvjeFO8oV1FPzlhcf62Aa4Nr7Weh+rHu+JpJO5GjGqU+KocahN/yWspAUA
         A3nJjgr/Icp7orla2QGGPn/LUtUsIaJJKUmdw4bAPFXFZyasgVM+v/VxWdoDoIqSYnkA
         ugwi3sa3cRjRz3ibTqyVEt8ekUyLP5FBAcaZtIeEnkitWFW6uEnVRp6wGmqmcOSJBvxq
         AeyubQ5f/xq3ZaZsj7uWlEh67KO5jZnLsiaKemjueWgvezqY3mGr2AXg5vqlI82UgUT9
         3Tlw==
X-Forwarded-Encrypted: i=1; AHgh+RoKvltIqpOlkThlCITm13rlPVlt7Pjwgh5xmbnqLxD4WYzRgyMjT+COBHmR+QNBxHVbyUlzh0bOwps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RW/QbOvozzmK36PnxzawXzhJ45jXJVZ6YOQHJqpy2/qt9GtW
	vM3W0V1V/2f1ZvHzuWLmjfsQvsqEixSQvwWk91w0IJeGs9av1fGbphIHBW90oeqM+uUs3c4GfrD
	41VgYqQ==
X-Received: from plzv3.prod.google.com ([2002:a17:902:b7c3:b0:2c8:7fe:29ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:32cc:b0:2c9:c083:cd49
 with SMTP id d9443c01a7336-2ca7e69dfe3mr34635215ad.14.1782942462488; Wed, 01
 Jul 2026 14:47:42 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:47:41 -0700
In-Reply-To: <20260608145455.89187-9-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608145455.89187-1-dwmw2@infradead.org> <20260608145455.89187-9-dwmw2@infradead.org>
Message-ID: <akWK_duG7ZsIekt7@google.com>
Subject: Re: [PATCH v5 08/34] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the
 documentation on TSC migration
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 08, 2026, David Woodhouse wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index c1897d939da9..6337f9b9d7ac 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -5930,6 +5930,9 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
>  	case KVM_VCPU_TSC_OFFSET:
>  		r = 0;
>  		break;
> +	case KVM_VCPU_TSC_SCALE:
> +		r = kvm_caps.has_tsc_control ? 0 : -ENXIO;
> +		break;
>  	default:
>  		r = -ENXIO;
>  	}
> @@ -5950,6 +5953,22 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
>  			break;
>  		r = 0;
>  		break;
> +	case KVM_VCPU_TSC_SCALE: {
> +		struct kvm_vcpu_tsc_scale scale;
> +
> +		if (!kvm_caps.has_tsc_control) {
> +			r = -ENXIO;
> +			break;
> +		}

Uber nit.  For consistency with KVM's bizarre pattern here:

		r = -ENXIO;
		if (!kvm_caps.has_tsc_control)
			break;

> +
> +		scale.tsc_ratio = vcpu->arch.l1_tsc_scaling_ratio;
> +		scale.tsc_frac_bits = kvm_caps.tsc_scaling_ratio_frac_bits;
> +		r = -EFAULT;
> +		if (copy_to_user(uaddr, &scale, sizeof(scale)))
> +			break;
> +		r = 0;
> +		break;
> +	}
>  	default:
>  		r = -ENXIO;
>  	}
> @@ -5989,6 +6008,9 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
>  		r = 0;
>  		break;
>  	}
> +	case KVM_VCPU_TSC_SCALE:

Another stupid consistency nit.  Probably do this?

		/*
		 * TSC scaling information is read-only (it's a reflection of
		 * the TSC frequency, which can be set by userspace).
		 */
		r = kvm_caps.has_tsc_control ? -EINVAL : -ENXIO;

> +		r = -EINVAL; /* Read only */
> +		break;
>  	default:
>  		r = -ENXIO;
>  	}
