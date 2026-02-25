Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629632D0E6
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017261; cv=pass; b=koI2AG1AkXN10UJLuQnsZu//m0ZIA4hCDLBX5RIM3PIJIFr0kbjyMCEnauyCZa5MT8CruspQQ+mlqEIbz2BGGw38nVvGnTuPcIIT/fcvHxGhmny1w66iSRrucplSgV085S8M41dENp6SOrgmwOmmEcLH8MyLIWfRzqeE+d4qnBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017261; c=relaxed/simple;
	bh=rFIoBbCtPAaUUxXQN/i55hNZCBkKJS12wFLo9V6DMr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVH+JQ6TpOiHeeat4y/NzLOdI1KaVmKBGfIWwRBJU1YPBYOvXfEcCcph79wGEB3+XUjBnV+p90woW/pNrVKlazVuYc2a4wG/Gmo2q/VWWHYKmwTXigKPmRrA/XG/M+T3tjcShQm6I9f8IlW51p/pNE3Q8Iax51Mv0BB8thuEgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2oGZ0n2; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2oGZ0n2"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-505d3baf1a7so390941cf.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 03:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772017259; cv=none;
        d=google.com; s=arc-20240605;
        b=XQDRWwfK1lkl0xoCa5UW6RJoOmujOkmDSAo984uN9cGXvR4KkTh6117XJyvBsjoozT
         /rX/98BTgePvm/aC+x1z25YbJWHbwsfYN8CGA3iVi3bJmQYoEzcGuK1WIUEol9/+fxhu
         SsED5HvTXsCOhwlnoAHKjF1uSqxaWOaOgx8gb5cztGEeeVNdZem7jQSf/0LdGJkGdEfv
         Orlc0Vxu2PIG2iW3wYgy5ZR0271PZkPJVkhPxrGDEJuPY9tAHnpNvqHKVlIDflkhuCO3
         tIijLIQ/y7lzR+ux3+v1aM2gaEDJ0OWgRP66F3MrAS9IIxiFh0WdO5x3AyLpMgxbVb+E
         hT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aWkoDd2c7adv4SsXtWJWrFlb9EmJVdv0DDRUAC9G+VM=;
        fh=R9QFuwe0EZbCOJWk/27EvQQQ2kkV1neZwZT92LsEL30=;
        b=esgoZTHHyr/PPxWcsgikR2Ejdw2k4Evk+IJddWv6Fah8FWxw4V+S3T/cOzGxiHX0tO
         U7AWDVhNUpDYXC7Nvc5TgziY/UY2gD/44IqOpnIWGRMEhNnFNvMIE06AR0B7q+31FH/q
         edU+Yu+JoQ72ibg/vqR+8ZNwyxajYsflQOid5Hta1Y4B/QIkSTotQvG0A3BCzV88u17L
         hAPsOhsTq4iMUgFJg0bhvtFIpF2LD2UlRJ28pCM39LHj311DHEXBOVBwcSuE7Kfk0RQC
         EDdxkZbMqXO04waoBqgfIS9C0D3OEXwiliUPSOa+w8HdggWVVjDpAWgFl/8ry580o+T5
         AZrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772017259; x=1772622059; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aWkoDd2c7adv4SsXtWJWrFlb9EmJVdv0DDRUAC9G+VM=;
        b=T2oGZ0n2r1stSk2XfcVdVJkpqgcbmN0fziB1D/5ce1tGB5qM0fsgvPbOOEDTcfS8BG
         52gBbuwlZmASU67EobymLLNUDPBrHpguolSyQIs7UDKK68C0HYEPSj9mXYfKMDJUIPpw
         hGLX1Ht7TA7KQ6bfphjgIfGY5pPqB8QRCBdHgT6mgDK4SAW3a6vPEkl5t7VOMxVdJ5Je
         tjgOsMC5dSJS8TIAfD6WoHW6VsWrcAWLAxOqHmbHmq5iMPkc+uR7VSmz3LVcywWBSUEu
         OKox80NEGeLyC+3xWi0Hx1Noj5QL1+DBFt1gU0LHCJCn33z9fjvvIX1kKEhOkmLHMoLv
         sXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017259; x=1772622059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWkoDd2c7adv4SsXtWJWrFlb9EmJVdv0DDRUAC9G+VM=;
        b=sORWfiGpzfnQNn5Skic9NgP8E09f1ddyM4/zdAbqauixu2kLGqjtuUxWcPHmvXUTek
         z81OgGSTAHb01aqGQaCEE3nAL6DoLVyZ0+WBTAda2X6z89/4umadD4cDK7+kF9oW+N6d
         iJ+MEmpUI4ltQg73NkpTZ3H8R01JFj34XAKN+cXkblHkfRnOoM/pLUcshChA7k3BGxvv
         e0/0rKi8AkVIeuFBHF2vFKy2VwbpwlFT5zE6cIE46P2hqwJxo1A2nOAHhCmuy/TMjQbk
         7fDrI+kg823Fvqe/44HbjBY2aWUv9M0MYcKSiE4Ke4m7yr0NQk85jdB0UpKFmOJwNK3w
         ZASg==
X-Forwarded-Encrypted: i=1; AJvYcCW3w9hXPIt9HyNMA5RcPz/ElcHUFOHk8iIJmtQRWu1r11DQizzbRNH3SXBfIqqauLCvF33xxP0RtVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CZRMGc+aa+xzyMBddOyOHcaEmYbzhFrTNFthTDNdPTQxqLvf
	XSoGiQrMgw32xrogHYXl6KEIezqb/aFU5VtjUsGXZmCKtJZhy4c1nRs2391zK9RIMv4W2z1VTaw
	9fqf3DGHoukLggZRp4nikEXXDqzt6ZbAFd6FDjapK
X-Gm-Gg: ATEYQzyWf39ayehz7H0MRK4DJTCxVdM4rHP7K988iqxB+p53Zx75/T98RxuXfJy0pHT
	jCsDwxffr0Md4y0BG09P/tLe9y6YmLA2g/+Lo0xrZq+pG1j6blSoS+ETS6x8/LQROshRE/7FGf5
	cuxvX/0cU+YgW3fXBnVgEfVtZQUk3RhOYbRur5m0MhB23YtevJ78aNg/kWMkk4plm4xwJ+F0lvt
	bPmESjABTk9pLB6G7sD9a6tw88jcaQZOjTZNJwWt40i91WuOVFr86oOiEKHI+ZU5lMKdrYY3cz9
	y2gB/8IA
X-Received: by 2002:ac8:584c:0:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-5073a3356a2mr846691cf.11.1772017258079; Wed, 25 Feb 2026
 03:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com> <CAEvNRgFBLgvYoR_XTH-LiN1Q00R9u1HGC5URbstLPxYtedS0MA@mail.gmail.com>
In-Reply-To: <CAEvNRgFBLgvYoR_XTH-LiN1Q00R9u1HGC5URbstLPxYtedS0MA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 25 Feb 2026 11:00:20 +0000
X-Gm-Features: AaiRm50WQiuIi1kbMajZ1ibI5GcJzILcOFsYF84COJs9arnL6chtYw6R9I20_qA
Message-ID: <CA+EHjTxDSW=y=sPRwW70Bz9RVYM3kSCLSbWc_X4v9hz6zj=mcg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chao.p.peng@linux.intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com, 
	david@kernel.org, hpa@zytor.com, ira.weiny@intel.com, jgg@nvidia.com, 
	jmattson@google.com, jroedel@suse.de, jthoughton@google.com, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tglx@linutronix.de, vannapurve@google.com, 
	vbabka@suse.cz, willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

Here are my thoughts, at least when it comes to pKVM.


On Tue, 24 Feb 2026 at 10:14, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Ackerley Tng <ackerleytng@google.com> writes:
>
> > Ackerley Tng <ackerleytng@google.com> writes:
> >
> >>
> >> [...snip...]
> >>
> > Before this lands, Sean wants, at the very minimum, an in-principle
> > agreement on guest_memfd behavior with respect to whether or not memory
> > should be preserved on conversion.
> >>
> >> [...snip...]
> >>
>
> Here's what I've come up with, following up from last guest_memfd
> biweekly.
>
> Every KVM_SET_MEMORY_ATTRIBUTES2 request will be accompanied by an
> enum set_memory_attributes_content_policy:
>
>     enum set_memory_attributes_content_policy {
>         SET_MEMORY_ATTRIBUTES_CONTENT_ZERO,
>         SET_MEMORY_ATTRIBUTES_CONTENT_READABLE,
>         SET_MEMORY_ATTRIBUTES_CONTENT_ENCRYPTED,
>     }
>
> Within guest_memfd's KVM_SET_MEMORY_ATTRIBUTES2 handler, guest_memfd
> will make an arch call
>
>     kvm_gmem_arch_content_policy_supported(kvm, policy, gfn, nr_pages)
>
> where every arch will get to return some error if the requested policy
> is not supported for the given range.

This hook provides the validation mechanism pKVM requires.

> ZERO is the simplest of the above, it means that after the conversion
> the memory will be zeroed for the next reader.
>
> + TDX and SNP today will support ZERO since the firmware handles
>   zeroing.
> + pKVM and SW_PROTECTED_VM will apply software zeroing.
> + Purpose: having this policy in the API allows userspace to be sure
>   that the memory is zeroed after the conversion - there is no need to
>   zero again in userspace (addresses concern that Sean pointed out)
>
> READABLE means that after the conversion, the memory is readable by
> userspace (if converting to shared) or readable by the guest (if
> converting to private).
>
> + TDX and SNP (today) can't support this, so return -EOPNOTSUPP
> + SW_PROTECTED_VM will support this and do nothing extra on
>   conversion, since there is no encryption anyway and all content
>   remains readable.
> + pKVM will make use of the arch function above.
>
> Here's where I need input: (David's questions during the call about
> the full flow beginning with the guest prompted this).
>
> Since pKVM doesn't encrypt the memory contents, there must be some way
> that pKVM can say no when userspace requests to convert and retain
> READABLE contents? I think pKVM's arch function can be used to check
> if the guest previously made a conversion request. Fuad, to check that
> the guest made a conversion request, what's other parameters are
> needed other than gfn and nr_pages?

The gfn and nr_pages parameters are enough I think.

To clarify how pKVM would use this hook: all memory sharing and
unsharing must be initiated by the guest via a hypercall. When the
guest issues this hypercall, the pKVM hypervisor (EL2) exits to the
host kernel (EL1). The host kernel records the exit reason (share or
unshare) along with the specific memory address in the kvm_run
structure before exiting to userspace.

We do not track this pending conversion state in the hypervisor. If a
compromised host kernel wants to lie and corrupt the state, it can
crash the system or the guest (which is an accepted DOS risk), but it
cannot compromise guest confidentiality because EL2 still strictly
enforces Stage-2 permissions. Our primary goal here is to prevent a
malicious or buggy userspace VMM from crashing the system.

When the VMM subsequently issues the KVM_SET_MEMORY_ATTRIBUTES2 ioctl
with the READABLE policy, we will use the
kvm_gmem_arch_content_policy_supported() hook in EL1 to validate the
ioctl. We will cross-reference the requested gfn and nr_pages against
the pending exit reason stored in kvm_run.

If the VMM attempts an unsolicited conversion (i.e., there is no
matching exit request in kvm_run, or the addresses do not match), our
current plan is to reject the request and return an error. In the
future, rather than outright rejecting an unsolicited conversion, we
might evolve this to treat it as a host-initiated destructive reclaim,
forcing an unshare and zeroing the memory. For the time being,
explicit rejection is the simplest and safest path.

> ENCRYPTED means that after the conversion, the memory contents are
> retained as-is, with no decryption.
>
> + TDX and SNP (today) can't support this, so return -EOPNOTSUPP
> + pKVM and SW_PROTECTED_VM can do nothing, but doing nothing retains
>   READABLE content, not ENCRYPTED content, hence SW_PROTECTED_VM
>   should return -EOPNOTSUPP.
> + Michael, you mentioned during the call that SNP is planning to
>   introduce a policy that retains the ENCRYPTED version for a special
>   GHCB call. ENCRYPTED is meant for that use case. Does it work? I'm
>   assuming that SNP should only support this policy given some
>   conditions, so would the arch call as described above work?
> + If this policy is specified on conversion from shared to private,
>   always return -EOPNOTSUPP.
> + When this first lands, ENCRYPTED will not be a valid option, but I'm
>   listing it here so we have line of sight to having this support.
>
> READABLE and ENCRYPTED defines the state after conversion clearly
> (instead of DONT_CARE or similar).
>
> DESTROY could be another policy, which means that after the
> conversion, the memory is unreadable. This is the option to address
> what David brought up during the call, for cases where userspace knows
> it is going to free the memory already and doesn't care about the
> state as long as nobody gets to read it. This will not implemented
> when feature first lands, but is presented here just to show how this
> can be extended in future.
>
> Right now, I'm thinking that one of the above policies MUST be
> specified (not specifying a policy will result in -EINVAL).
>
> How does this sound?

I don't think that returning -EINVAL is the right thing to do here. If
userspace omits the policy, the API should default to
SET_MEMORY_ATTRIBUTES_CONTENT_ZERO and proceed with the conversion. I
believe that, in Linux APIs in general, omitting an optional behavior
flag results in the safest, most standard default action.

Also, returning -EINVAL when no policy is specified makes the policy
parameter strictly mandatory. This makes it difficult for userspace's
to seamlessly request clean-slate, destructive conversions. Software
zeroing ensures deterministic behavior across pKVM, TDX, and SNP,
isolating the KVM uAPI from micro-architectural data destruction
nuances.

Cheers,
/fuad
