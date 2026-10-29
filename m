Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793304091;
	b=JajWN6H/4LFzxuobnXrShjNuU5bla17DQLq+m99/Y9fmSqfrk2eGhPHyzZ/ev2VTDaZK
	 zcAzZBsBYEcs0KEbzhQeF5dDTCsqzzWCY5Ap+fnWwjgxPpIvNYOhbx0H7zpfX+V6nHK0j
	 A6C2A4iMskt/o0EcDjrYtEWU+tXGscqA6N/xGmU2isAwMQ4fOUMmu3EAXC0aqZgw6gPna
	 OAjHn4Y7OLLdCvzzrt6nirFSrAY396rXTqx6xvlbBqu14rcD4+5Kx/E0HOlwxSe3t7K+y
	 XtbZdOFgn3J7qFgwNDVxZSGZX3IcsXNhyPc8n5FmjSBMF/TSSzGkofDLdzuZgqH0Vtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793304091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
	b=ZyuTTDrlqiPAFwRSNcAVhqnXI+NJ1AQV7PxyN/WcJwI4i6xCPLPXOD91kG9H4DkTaBtX
	 jD1ZiJbyOaBkTEZ7xZFBfKROxGBJwOL9ixRNTra339rWR1XFTQMgWgzEwQxrOTxp7hEQw
	 Zwy1w4JC4lX4+LGkzG0kxilxtkUdrD/RMrZNOizzDWacKrXpvnVMo9jcAMtN/Jp0sujhN
	 pqOc7uSi2y/1I4/W1Eh0gcVW8z37APNEi/Pla2q6R+BAsevqnHWqL4plWWgA+ThI8Cd6S
	 J1zudRjmrTcRU1n4TISidEpGqaT3+Qhd3IICBLauDaSZMe1D8lj19/+iemiTu8S1riw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9350606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 20:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9350606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WzkVwYzI
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e64d52949so202843185a.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793304090; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKD6qdE/auOKe9t5wDlDWqn+9aIrrBc9yCR5vEyM59XzndzfU/KJqo7e/jDzZ2TKSq
         ZAnwwsD27g8OH4nvED1lDTI7uQlEBpEzlDEOjP3k8JAkAcMSDjCOOHL/DaFoY5PRyfNd
         4oJJqT+lLb/GwZlRa7iM3S1x7sGZcQZo9fmmNis6G+YcCEpcM0Q3v2qvG8U144Y9Q8bU
         DWcM8PjoZS//DsktZWXd7ykGrAwdMaoBW5r7oklX+MXA4Qpej03jWQwFzRlJ23J5DmCw
         G/5hpu4VnELmCkSa44t8LnAmuqslqY8vSX8CAditGDM4xpm2O2juw4XFOn5qo6+6+/8G
         7y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        fh=mmLbLyZJ5dBx2fCDhfvXoBUVDSPZamk7JLPCnDQFXiA=;
        b=GggcdBRxQHl962sn13tWOF0AYAwolD2xkyRmjijoh1z+Xkb5EqeRi1D4U/KzfDwpT1
         L8C+dk7E0JAxddPs8cJJWjn4yHINFew2sCVL24gmqF/tjh0BqhnGgcRjW94lsMC/tYV2
         EEdZnYSJm8xWvhn0m/x37DB4tLwlgNO3mKN2THsNCqhV8Bwz/PyDxmHFkogyAzWW1vRO
         KkJxfFGaQztpi0otVsIEWr7G/yDtpNu4Xz9tt4g6iB39qjgvKSGcIo0OdEVf/HsSJ9bO
         6H/WZkCjoGJ/zOlut5wKbNuV9f2sA47/oX27MpnBNx+Q2cck3mr0TYb19Bg6NKvChFvV
         /g6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793304090; x=1793908890; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=WzkVwYzIEvlUD4jouGSIwB6FRlfF8hxTgPyyNpqGmkTWIQg0Ole0rsRJIpCMSLmcYo
         xny2WIjTKOduGBsjO3M3Hy3Y5Gpxav5pAEQ+dey/WDXOYqqnfW/4s9rt/5qtlD0o1JQD
         qgNWqEb/ESz1VmMIS/1NOS99QXo6xUINV4qKkkXEUdhm9m1VegHsAvLzUItKmZOIN1QJ
         iIqXI//Wxc9ozlcrU7fWVky9rHoQfM3GQHS/Ns3ot/06EY6+UkCJJuj9LxgFC9LLrk2R
         hMe7EXKbU+My2iqLUjxXv7+wewDozb/5zzK2zqO63rDc2gOPzlMplP5cO5XTnsm8pZwT
         JcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793304090; x=1793908890;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41rEEZJHQ1b0lZW5NZ/hL5Z21i+HuFKPEi+1JbBpXGc=;
        b=zSe2a98u7ZTNBFVGSg5kn9o1jpfgH69O/uxw8sI4yGOYCQ4PviLlCBzQe1xF+Ee2DW
         15AnpEeJ8UYwI1U5YKoBbI0pZXKKiPIpng87ip4VtVMJ7yw9nW3F3HHFkASDoIN7NnuV
         xbJfkrafdHe5PpF2CNHs2leuwjhPEi5flQTL3rvTY4xklVoXOs94c6T3sEY5GmIw6DTL
         5uUl6s3jJbmkOCOCWCpCjW/rbaLbta95T5C6TQGLHJhWDa8UGXtaE7rBPLO/4ldlxR44
         44+EN8NhUk71znv+NQwgYZKyU682fQdv8mlYHIcjX9jYI0AyLN6T49TKErO6uOUGzbtx
         Jl3g==
X-Forwarded-Encrypted: i=1; AKwUvBx+1/CU/s0NRlV6XqCuKsn3OHbc9ZzyWmIL++2bJQ/5sY6JGivEFUOZnWm1av4iCyB4+WVUch4a0M4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg3jEuktO3M1aZQXGMgAqzDGE3sKbcK3aVc0CWMBv+TMgcYr3M
	ZtZxsufmnsC3SyQESiB7leB+pLoTCdX2V1WP+qdtE9AN9IwrWqVL3kjZUziNWTx6gHbWqtlxVzl
	ESxFRV1WP5daKXoKZNC0b5qhdp9AYPpNsQ6sNA8ki
X-Gm-Gg: AYBFou1Q6vsyPPUsFhk/Xqeq/1DhWRlrdbNkgPaVsSF8yT3zJQlF5DmFJ+RYZRcYFnI
	eoCn4HQBk6KvI7rra0sulHqPlhMmd8BUwGmltB4mqMYAncFCjAnIms5KTiGpjUorgLJC8a8YAjc
	vgR7eFNhOKW3ru3CDNRjCzZOf6rULL06fRiwUjdBFw0bUtxx7SoXQ+5KD6D3VYfGunJjzXcEJmf
	8bJslhsQzw7kV1tm3v2WST73weFzFLrkYlzPLOQaBZx1DfGwyTc2PINZA3dxQJ40vlnr1TcKLDY
	C/PD5uGR7jLbCIJKge//9/O+zo7GPJq95p9KD/WIlg2pZQj0qn1QhrcaJxKEtl4USjoSxvWh4Za
	qmUadem80Xe5Ryv/ObikYEWSGpEYDMipKR1fhD8fElwLsjHmqqCcFg8eFv2/P7RV8eaNxrsNglo
	McAvcUT2uBoJf2tnm/ZiMoQjk=
X-Received: by 2002:a05:620a:439b:b0:93c:b6db:8c with SMTP id
 af79cd13be357-94421400aaemr54046085a.0.1793304088692; Thu, 29 Oct 2026
 13:01:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 13:01:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 13:01:27 -0700
X-Gm-Features: AclHuK8yWAvbtrHc6IRHr91-GPti5braQ_xMkumtHHr_gZTK1th84mOiXH74nIU
Message-ID: <CAEvNRgFtgAFg_nBLXwvXv69zrCQDKRSvLC6DwYPAw30N+BEoeg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] KVM: guest_memfd: Add KVM_LINK_GUEST_MEMFD ioctl
To: Tao Gong <gongtao@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@kernel.org>, Ryan Afranji <afranji@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Sagi Shahar <sagis@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, aneesh.kumar@kernel.org, 
	Fred Griffoul <fgriffo@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, John Hubbard <jhubbard@nvidia.com>, 
	pankaj.gupta@amd.com, "Alain Gefflaut (HE/HIM)" <agefflaut@microsoft.com>, michael.roth@amd.com, 
	Samiullah Khawaja <skhawaja@google.com>, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"

Tao Gong <gongtao@google.com> writes:

Adding a few more people to Cc after today's discussion at guest_memfd
biweekly.

Sean mentioned the link ioctl as the line of sight to sharing memory,
would like people's thoughts on this. Captured some of today's
discussion below.

> [...snip...]
>
> Use cases
> ---------
>
> 1. Intra-host migration of VMs with private memory, where the
>    destination VM takes over the source VM's guest memory in place:
>
>    a. Userspace passes the source VM's guest_memfd fd to the destination
>       VM, e.g. over a Unix socket.
>    b. The destination VM calls KVM_LINK_GUEST_MEMFD to get a new fd for
>       the same inode, bound to the destination VM.
>    c. The destination VM binds the new fd to its memslots with
>       KVM_SET_USER_MEMORY_REGION2, at the same offsets as the source.
>    d. The remaining VM state is moved with KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM
>       (SEV only today; generalized by the follow-up series) and the
>       destination VM is run as normal.
>
>    Linking does not revoke the source VM's access; the source simply
>    stops using the memory, so every private page keeps a single owner.
>
> 2. Sharing guest memory between non-confidential VMs. Both VMs bind the
>    same inode at the same time, each through its own file, and the
>    memory keeps its guest_memfd properties: neither VMM needs a
>    userspace mapping of it, and inode-level operations such as a hole
>    punch apply to every linked VM.
>
>    A related use raised in discussion is Nitro Enclaves-style memory
>    donation, where a guest gives part of its memory to a sibling VM on
>    the same host ("nesting without real nesting").
>

We discussed Fred's "aliased" attribute that was going to be passed to
guest_memfd through .get_pfn(). "aliased" was going to indicate that
this memory is shared between two users of the same memory range.

> Alternatives considered
> -----------------------
>
> [...snip...]
>
> * Keeping the memory and its attributes in a "memory provider" and
>   creating two independent guest_memfd instances on top of it. The
>   guest_memfd inode already plays that role today (page cache,
>   attributes and the list of files), so linking gets the same result
>   without a new abstraction. If guest_memfd grows a provider layer,
>   linking could be expressed on top of it.
>

Sean pointed out that we need to take into account that at some point
there CoCo protected memory might need sharing, where protected
indicates protected for a given guest (and let encryption be orthogonal
to protection).

Then, we'd need to know which struct kvm the memory belongs to, to
determine whether to share or not, and for that, guest_memfd would be
the natural choke point that understands memory, which kvm owns it, and
shared/private state, and hence memory sharing should be handled via
guest_memfd rather than directly through the provider.

>
>
> [...snip...]
>
