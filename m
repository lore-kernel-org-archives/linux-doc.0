Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28583C6A5D
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328373; cv=pass; b=Rgjm39w3z9Wcjkx24K3Z4gij1Fd5DAjUE+oPmvMz3rL1gMkeD/Z0DZny9jPZdZwDvWPmRBVvZkKDAV3ykiEkPEhUnNjXnZejP5jTuOq9cXno0sPo9uWLeLNNwkYRCwk5XFx42NmYE2Q+ssxEwthhgKdCANzFmAHjsYpNe0Ow16c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328373; c=relaxed/simple;
	bh=7YFZADDIkKpHkOE9u07SYpGj3k/kMl91AXKVA2N9GNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bs898O0JuXQEp0JQvVEsiykBtukgnBICopYt5KSwLLtSFRz+JHU7uvAqDvcauxAGv2jBIVknZUEL6Y9m73ai2tMqscVDEPFrSeaIVi/DApUjUnOi5SbgpYxgcA/U8vlqz7UVXGoDl7glNPWKBFKGkkeKza17TS4xsY5jHYb2bC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4Q2sPKdX; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4Q2sPKdX"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-509069a7a7fso636331cf.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 08:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773328371; cv=none;
        d=google.com; s=arc-20240605;
        b=igne4U2tg2oUVrg061vxLg092dxG8OMc/jm5dW4hqFRMlSxwDeBEF4fKZIMDu7b4N6
         uqyaQx7W1Z8+W87ynSjp8l6muQrdJjGRdgrcS5By8rlm3OxpmcfwH7r89j6Cenw4W9Mw
         wj0Dze+EDbGFd9zg7zNBQDZX4J1k5+ubUZxPJg2CVGSjnHDVUIz/cMUyQJlM9Ujl56Zu
         xTdmj2MUtYjufP6AESdkdy+CVTEHvZ67G2WyCenRrMUW9CxK2GUiOu2vMl5euaURO6Qx
         MvvoJEsrLAj9hhuiVTSgGxgwPV/Fa28W+9SIiJuYGGmH5KsTq/O+w45gZO/nvGcxdG8y
         kRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bV1YPTxEaaiJh5nG5MVUucC7TmzLQLODECWQRvstcRw=;
        fh=bhMPcyf6RTGs84DmX2sC8R3kDDRmIoSFMEcC1E2y1pE=;
        b=CRD4FUDD2DOOzPn9+bFosrGdVQWZcK98c8INkSD8LQk7vBnKR7fsERDP7OWSZ6JwyJ
         ftKzQVstAxBNF9sOdfL0RHKY5xR2Y6NnmKvUOBEWe3PqExGNGEplqK3gLdkZKr1PBizl
         n4Oymy2MeZygk3LYxmqtLr30I4/8IX6kQY5ykzyGmkMxYkbByofB9hyCnWqter5RKsr0
         o6s11ZX+GBjGLZeylLs4CPdfb5AscPE6oZHbQ5ri4bORhR3PsgwpM2KGDeDjz9xm6XZ9
         c8m9QR/rjyRMzfhpV9okJWb4DawKWNmIKqL/sF5GrhGHcew8ZFnVV8NeJE7BJRCg3Ooz
         4uIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773328371; x=1773933171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bV1YPTxEaaiJh5nG5MVUucC7TmzLQLODECWQRvstcRw=;
        b=4Q2sPKdX/2dvlWhCTFaO6pjY0GcE7Ac3wo4299c2UzBFA3NCV2GNENpZQ2k9LbMeCA
         7WR3Wrs+TBLQ5qeeTP0LVieQbh+e0Zp4B9dCN/wXv2ccuLaLiJP13yBP98Y7IauYEm4B
         8J6nw0ZrXOE2lw9KpPe8eESOGDYsYAd+F3omC2RjD/qerJ6yLwnB5MSREnuKwmcQeDQk
         A0wD4Ea1hg3Fovmmc9pz0epe1D/EfofAXBHIYfDTleloG/ndc5yjqptDKPKoVClDHMxK
         0ttfZuwnBiEeTIr3dhezC37YrICyB+MYIo7Xr8dyEy6QMA61H4iDbYMuis1NQ8wKjuS3
         5wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328371; x=1773933171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV1YPTxEaaiJh5nG5MVUucC7TmzLQLODECWQRvstcRw=;
        b=BwN2zrlhrmDZhYMX+gzpZEnlSdz0ru9jbiodSnMERoFeTXOe9UTxem8WuQE+EHnyjD
         2LD/oJuO+cwVyyfUT5leeswulMxOXKYgkXiH1l79AfhW0OzqMPfEDVxAGvBpF9pFQA41
         l20Amf2Qw4csGDt81I66T6tamHxutmNIGfxyP5u2MRa4FXdQzwBwRgMxUyDQPmffjuOd
         knqoGRRxgP5WO2s49EJA8m5heaMTFYQr5yRyKytMyuuGc/W616Qz+b9W3Q6wEi7cYQY7
         yQxteATnHmHNZQ6BCG7b+96KGhWXGYW0ZBJvxEg1KpL1JdMDrKLxlCdpcnKhObkCvDiE
         AMXA==
X-Forwarded-Encrypted: i=1; AJvYcCUBdDkoUpzyCtfSerd1W8o+eKurnYVcYc/z2P0fjJm88kWWqi/44MSUVfKjXJPfyDi26FG8/uOiScY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgV7Lozu658iorUzPxoexlrT3gRbT72Bw9c2ZN4IBZsvGPalpF
	dsAiZgDEC08a2P+qfh312VDG+1zJNR40KG20u2Tj/59yBnFYJzSzF7KQ0mBbJj5HSDHUjWCF48e
	vygVfHa95gE6CWGN5j7QHl0rqVXY4GNoW9Uy7eNq7lbBVZPs8MGfrTHR1+Xk=
X-Gm-Gg: ATEYQzzmgGmGf2JVxfo7/ajvx76DmdoNdmzqfHimOuEL4P2OQDrss5ZqJP8g4Hs5Ji9
	kcKmhfEtAl1VofIHLpqLBUZ987YwZE6aQJQTGL421bdSIXldbDU6TpCmFvtc7gZZzgEHlRLq3bQ
	sAUJ75ePi1NX8h+wBIJKMj8ClrPtXtVEdzCWTceJ/LShIzOPaeWuWWzqW7aRzOJK9B2t7pq7ZY5
	q5kuH6iXuq7STTByCFHmG9rEIQJGzYvIAIaa1S19pF5fVLQZJ1q7cPmYzeeElWHdLs8euAsJIPc
	P9GNBBce
X-Received: by 2002:ac8:7d4f:0:b0:509:1471:1bc2 with SMTP id
 d75a77b69052e-509497b388cmr12752831cf.17.1773328370105; Thu, 12 Mar 2026
 08:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com> <CAEvNRgG-L+GBcm+u_thGvXAxV-Nqzu5VtgXy0PfND6SG0FiyVg@mail.gmail.com>
In-Reply-To: <CAEvNRgG-L+GBcm+u_thGvXAxV-Nqzu5VtgXy0PfND6SG0FiyVg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 12 Mar 2026 15:12:12 +0000
X-Gm-Features: AaiRm522D6XFcNwSUoten5LdH11xVpfwhWEV7958HaqQ2gjfWSDLGgyuH4UYDI0
Message-ID: <CA+EHjTy2urW2Tj5czQDKUHdri7FCLfw2mafTgmmtFs+-7ueoiw@mail.gmail.com>
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

Before getting into the UAPI semantics, thank you for all the heavy
lifting you've done here. Figuring out how to make it all work across
the different platforms is not easy :)

<snip>

> The policy definitions below provide more details:
>
> ``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_ZERO`` (default)
>
>   On a private to shared conversion, the host will read zeros from the
>   converted memory on the next fault after successful return of the
>   KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
>   This is not supported (-EOPNOTSUPP) for a shared to private
>   conversion. While some CoCo implementations do zero memory contents
>   such that the guest reads zeros after conversion, the guest is not
>   expected to trust host-provided zeroing, hence as a UAPI policy, KVM
>   does not make any such guarantees.

The rationale for not supporting this in the UAPI isn't quite right
and I think that the prohibition should be removed. It's true that the
guest is not expected to trust host-provided zeroing. However, if the
VMM invokes this ioctl with the ZERO policy, the zeroing is performed
by the hypervisor, not by the (untrusted) host.

Although pKVM handles fresh, zeroed memory provisioning via donation
rather than attribute conversion, stating that the UAPI cannot make
guarantees due to trust boundaries is incorrect. The hypervisor is
precisely the entity the guest trusts to enforce this.

The UAPI should define the semantics for a shared-to-private ZERO
conversion, even if current architectures return -EOPNOTSUPP because
they handle fresh memory provisioning via other mechanisms (like
pKVM's donation path).

How about something like the following:

On a shared to private conversion, the hypervisor will zero the memory
contents before mapping it into the guest's private address space,
preventing the untrusted host from injecting arbitrary data into the
guest. If an architecture handles zeroed-provisioning via mechanisms
other than attribute conversion, it may return -EOPNOTSUPP.

>   For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle
>   will support this policy and ensure zeroing for conversions in both
>   directions.
>
> ``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_PRESERVE``
>
>   On private/shared conversions in both directions, memory contents
>   will be preserved and readable. As a concrete example, if the host
>   writes ``0xbeef`` to memory and converts the memory to shared, the
>   guest will also read ``0xbeef``, after any necessary hardware or
>   software provided decryption. After a reverse shared to private
>   conversion, the host will also read ``0xbeef``.

I think that this example is backwards. If the host writes to memory,
that memory is already shared, isn't it? Converting it to shared is
redundant. More importantly, if memory undergoes a shared-to-private
conversion, the host must lose access entirely.

Maybe a clearer example would reflect actual payload injection and
bounce buffer sharing:
- Shared-to-Private (Payload Injection): The host writes a payload
(e.g., 0xbeef) to shared memory and converts it to private. The guest
reads 0xbeef in its private address space. The host loses access.
- Private-to-Shared (Bounce Buffer): The guest writes 0xbeef to
private memory and converts it to shared. The host reads 0xbeef.

>   pKVM (ARM) is the first user of this policy. Since pKVM does not
>   protect memory with encryption, a content policy to preserve memory
>   will not will not involve any decryption. The guest will be able to
>   read what the host wrote with full content preservation.

This is correct, but to be precise, I think it should explicitly
mention Stage-2 page tables as the protection mechanism, maybe:

Because pKVM protects private memory via Stage-2 page table isolation
rather than hardware encryption, content preservation does not require
cryptographic operations. The hypervisor (at EL2) simply transfers
page ownership while retaining the data.

Cheers,
/fuad


>   For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle
>   will support this policy and the contents of converted memory will
>   be preserved.
>
> ``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_NONE``
>
>   This is an explicit request that KVM provide no guarantees on memory
>   contents after conversion. Neither host nor guest should expect any
>   guarantees about the memory contents after conversion.
>
>   For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle will
>   support this policy and every byte of converted memory will read
>   ``0xab``.
>
> >>  See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
> >>
> >
> > [...snip...]
> >
