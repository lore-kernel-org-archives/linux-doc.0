Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA9317151
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773294304; cv=pass; b=Euep717oWU+TI4oMcHBRFwRKmbFk+YTecCoPl3Gg6/Z8OaGqSqWuPmsSPo2TAgNG2rmijjiRzMP+j//yMScp1l0a5k45pJJHlr1qE6GCaMK9yLsZ4UdVsSfVlDaaCaZrVgpND4ITVoj+vmLqiRfQBn8BeSSlsTuVjgcyxuSTkXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773294304; c=relaxed/simple;
	bh=GmJK/N0KBkRxDo+pqiY/6G+ZRXyparhw1yW+Cxl6e28=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLtL29nZIgovOt3kYi67Upge0F5TqGVUkDHk5q707bkk2v4gg2rSfIdxX+PlV5KczoSeqHHoLlBT1Vy8h2t7lu2OjUq1hmQ/wdauEZoFlAyfmT3ILqLawa3fqYibrdeWUun1KyQn8dtVUddmEX8FmTNd1EihUv8aw4KQcOKaEWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdZJT0Tx; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdZJT0Tx"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so387753241.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 22:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773294301; cv=none;
        d=google.com; s=arc-20240605;
        b=KlGbOZCJ/XfNqI0kN1ZV1kLp1TcEkknkKZOLJ0xG5tI3RdldcD2LTxR+SoFA+HGTIa
         NW+s2GFPzf+IkO9zUtt6TKLNa4+ZP7LaDSYUC3m+AwBtGSHlFc0mpN/iXCw0YVPzLEIR
         0Go6zcage533Di5s6hNYLOnJz3eL9G94KTyzvvhmY54aDISBByq2SoKhVNwJDko0YIIm
         oUSBgBh6llUGGLp2Xor3CLZaHRS/03wsxemKtVVSC+xb+ZFDCq4nGbTx9CZpXSM4brVZ
         aWjermD4EopfwG+ATNY9O3HtxW2P1pkx1XnJUJ/K5yYNsLp3y/SEW0mj0CSVpjyMaB6g
         wVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WHL+cdGBVdeYzUrRkXUnxuFTgvkDYPGLTyvabwlDW1U=;
        fh=k57Eza6uVY6lrlcnv1r1KMZqhsD+Aa5tRn39QfrAzVk=;
        b=XEQyHnaPFROpcpztcgZMF6kO0LszwoypXVV/XGdSNFkBDADAhNz2oWEW5huyUl30dB
         L+WJG2jzk6zXpJExG2bS84FJaaRFTHTqRl0D3MG0fYmGPL6GrD0/82mKiKv8WBVetxFk
         GlaBqoXSZjGb+jnW7ZDghXJ4CK61fRa8wDpLXDAxBejmk5VhWB0/OwmLN/mU9p4LLw60
         JwJZyvgAbcoNSCznmR+40RmUnSFU9+PCGOOTWJzLB+RmjWqwzL1v929VFscTB0r5X8xe
         DEl8gYmka6a2J0hBQ2/8fX80JomaaGg35ca1m5XEgngMlswLtFJqkugOyjoqybaPd+QX
         AAHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773294301; x=1773899101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHL+cdGBVdeYzUrRkXUnxuFTgvkDYPGLTyvabwlDW1U=;
        b=VdZJT0TxrE2a9giQrcsUQtWWCibe1Z2In7NV0CRlZMWbacWoFRZzPJiR7FY93c03j9
         2yAo6IHTgN6vy8NV77CVpW+HhOc8Y55Q1whsRU7GuexdhiOif0pMktOgLab0yQH24Xmb
         eY626NrC06XAbL+FuZen1nZxylloOh0Xe89KQ40vjxWjixm6s10qgZ4tccTY1C/SL9YU
         idN+6ZtprApYPnh/eGiR+dkQwu97WSop2d6awTVostO+SsiP5p9csP3pOO148vafEevW
         oby0MD9CpiBWwPQcNfulnvgZ3CI41epjzwTw2bXTqHx8ZBGK0yocieKobEXt292GR1Sr
         CfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773294301; x=1773899101;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHL+cdGBVdeYzUrRkXUnxuFTgvkDYPGLTyvabwlDW1U=;
        b=nXeG4qSE73nbj1t5ku3CV6rvWJX8B3RYd1BBIj65C6yNLm+0x+R0L3KgLYD3ZM49Ha
         8+cD2Jwuc+nDzYsutZCvJ+gCgJ5U0Nr/SkB5ZN1cquQ+Tw5EYvju/f6YOUT7DXLCJD5W
         QgeS4rREJVhD0uwPX8EaH4H20elf/BYmawG07vyp5zpBnhWcTeV1A+Skrl6ld2EXqxaV
         BsOMTwVzEvnRa/kNZIFOoBGWv1Oe0hYF0di2X2r/D2u0D2r7LYyv0Nfowr2MeEoMO21q
         mYflU0itv0bBvRMYhNXyWovErOBdqUN2kh0yXCkf9DsekjHnqL6UFR+2uZ0JuIeMZXbD
         oHrA==
X-Forwarded-Encrypted: i=1; AJvYcCUf2FHmGwiIpNURRMckABkbPUQELeFg+AXGcsrF6r5mM2C8CwY45fTj46FuPa9h6F93urp211myiE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuv8VtQdg6MZ+Y+HZTt3w9stlvYNKpbWYq3EXkmDWKS8bGI7nb
	krlsxeznnqU9+gA3EKW2Gl1fC8xdVIB3yGMi/+ByWiD6H9cmdOR2bc61JrqqEK+8WuTgMPzuhIN
	QYrEZMP6TBL2BoyWweYlE0dqj+3ezIbLBv50UN0Cp
X-Gm-Gg: ATEYQzyyBZimT8nP9ut5xJOHRdRfnQgc5DNu3BiBVh/McuJ1zJoF7oZtJOD1MAuJjOC
	murvf3Fq6HejkUoCRfEqTTeUWK3GMXPhUdM2eklgmon/+2IB1YtBW3hNPTGJqRVSB3pQcAws3FE
	7TlpRCTaPJTkBBxy+Aj3axm3/DImLq1AnRpVWzecj8dAKeK0GF9NE24khI+dKeRPBPvIVwpEHnx
	+t4SRUSE8mJeEX2hI/nSOprvmTB9Z+6HrxVMQe0Ce+nKOunePTi5dl96bYFzhAF4zLIkwR6prKI
	WQezbnbu8FXatriJERsCLUOdmRoWELtoq7OsuQ==
X-Received: by 2002:a05:6102:418e:b0:5ff:ba2d:17c1 with SMTP id
 ada2fe7eead31-601deb8f595mr2321310137.9.1773294300559; Wed, 11 Mar 2026
 22:45:00 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 22:44:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 22:44:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Mar 2026 22:44:59 -0700
X-Gm-Features: AaiRm50qY80lG_kPAevYiMiI4iaIYG-rOHvoXqEdwljZn3zJnS7kUqoIvI7enLE
Message-ID: <CAEvNRgG-L+GBcm+u_thGvXAxV-Nqzu5VtgXy0PfND6SG0FiyVg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

Here's iteration 2 of the attributes, after getting a much clearer idea
of the use cases across platforms at the last guest_memfd biweekly.

Please comment in this context! I'm planning for this text to make it to
Documentation/virt/kvm/api.rst.

> Ackerley Tng <ackerleytng@google.com> writes:
>
>>
>> [...snip...]
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 23ec0b0c3e22..26e80745c8b4 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -117,7 +117,7 @@ description:
>>        x86 includes both i386 and x86_64.
>>
>>    Type:
>> -      system, vm, or vcpu.
>> +      system, vm, vcpu or guest_memfd.
>>
>>    Parameters:
>>        what parameters are accepted by the ioctl.
>> @@ -6523,11 +6523,22 @@ the capability to be present.
>>  ---------------------------------
>>
>>  :Capability: KVM_CAP_MEMORY_ATTRIBUTES2
>> -:Architectures: x86
>> -:Type: vm ioctl
>> +:Architectures: all
>> +:Type: vm, guest_memfd ioctl
>>  :Parameters: struct kvm_memory_attributes2 (in/out)
>>  :Returns: 0 on success, <0 on error
>>
>> +Errors:
>> +
>> +  ========== ===============================================================
>> +  EINVAL     The specified `offset` or `size` were invalid (e.g. not
>> +             page aligned, causes an overflow, or size is zero).
>> +  EFAULT     The parameter address was invalid.
>> +  EAGAIN     Some page within requested range had unexpected refcounts. The
>> +             offset of the page will be returned in `error_offset`.
>> +  ENOMEM     Ran out of memory trying to track private/shared state
      EOPNOTSUPP The specified content policy is not supported while
                 setting the requested attribute
>> +  ========== ===============================================================
>> +
>>  KVM_SET_MEMORY_ATTRIBUTES2 is an extension to
>>  KVM_SET_MEMORY_ATTRIBUTES that supports returning (writing) values to
>>  userspace.  The original (pre-extension) fields are shared with
>> @@ -6538,15 +6549,42 @@ Attribute values are shared with KVM_SET_MEMORY_ATTRIBUTES.
>>  ::
>>
>>    struct kvm_memory_attributes2 {
>> -	__u64 address;
>> +	/* in */
>> +	union {
>> +		__u64 address;
>> +		__u64 offset;
>> +	};
>>  	__u64 size;
>>  	__u64 attributes;
>>  	__u64 flags;
>> -	__u64 reserved[12];
>> +	/* out */
>> +	__u64 error_offset;
>> +	__u64 reserved[11];
>>    };
>>
>>    #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
>>
>> +Set attributes for a range of offsets within a guest_memfd to
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE to limit the specified guest_memfd backed
>> +memory range for guest_use. Even if KVM_CAP_GUEST_MEMFD_MMAP is
>> +supported, after a successful call to set
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE, the requested range will not be mappable
>> +into host userspace and will only be mappable by the guest.
>> +
>> +To allow the range to be mappable into host userspace again, call
>> +KVM_SET_MEMORY_ATTRIBUTES2 on the guest_memfd again with
>> +KVM_MEMORY_ATTRIBUTE_PRIVATE unset.
>> +
>> +If this ioctl returns -EAGAIN, the offset of the page with unexpected
>> +refcounts will be returned in `error_offset`. This can occur if there
>> +are transient refcounts on the pages, taken by other parts of the
>> +kernel.
>> +
>> +Userspace is expected to figure out how to remove all known refcounts
>> +on the shared pages, such as refcounts taken by get_user_pages(), and
>> +try the ioctl again. A possible source of these long term refcounts is
>> +if the guest_memfd memory was pinned in IOMMU page tables.
>> +

Memory *content* policies can be requested while setting memory
attributes. This defines:

  - What the host reads after a private to shared conversion
  - What the guest reads after a shared to private conversion (if
    applicable)

The policy definitions below provide more details:

``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_ZERO`` (default)

  On a private to shared conversion, the host will read zeros from the
  converted memory on the next fault after successful return of the
  KVM_SET_MEMORY_ATTRIBUTES2 ioctl.

  This is not supported (-EOPNOTSUPP) for a shared to private
  conversion. While some CoCo implementations do zero memory contents
  such that the guest reads zeros after conversion, the guest is not
  expected to trust host-provided zeroing, hence as a UAPI policy, KVM
  does not make any such guarantees.

  For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle
  will support this policy and ensure zeroing for conversions in both
  directions.

``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_PRESERVE``

  On private/shared conversions in both directions, memory contents
  will be preserved and readable. As a concrete example, if the host
  writes ``0xbeef`` to memory and converts the memory to shared, the
  guest will also read ``0xbeef``, after any necessary hardware or
  software provided decryption. After a reverse shared to private
  conversion, the host will also read ``0xbeef``.

  pKVM (ARM) is the first user of this policy. Since pKVM does not
  protect memory with encryption, a content policy to preserve memory
  will not will not involve any decryption. The guest will be able to
  read what the host wrote with full content preservation.

  For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle
  will support this policy and the contents of converted memory will
  be preserved.

``KVM_SET_MEMORY_ATTRIBUTES2_CONTENT_POLICY_NONE``

  This is an explicit request that KVM provide no guarantees on memory
  contents after conversion. Neither host nor guest should expect any
  guarantees about the memory contents after conversion.

  For testing purposes, the KVM_X86_SW_PROTECTED_VM testing vehicle will
  support this policy and every byte of converted memory will read
  ``0xab``.

>>  See also: :ref: `KVM_SET_MEMORY_ATTRIBUTES`.
>>
>
> [...snip...]
>
