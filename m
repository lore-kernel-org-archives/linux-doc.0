Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C83369236
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582751; cv=pass; b=SnGxx0PbQolSMXKIOXWcFT6cTkfwyXRYQbi3irSObdMwkyfl6Y4Ml8QX68extjmVVYvN16zEOdI7xoDXtlZn6FfiGujXVdZoixRAyoLyDtGGLPJwMXv8v8gYor/LOUlx4LEymt/XJ5Nt8RNUtEjGVm62yInQqhk1Ziy5kBmFWoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582751; c=relaxed/simple;
	bh=HjYwTd5kWmHq4WzayeX05JXI6uq7QkVWkmVqyAOIZIg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzgIuSUPBA0tIdJpVj656ui2g1ta4nt/j/m8VZB8fsPe+fEmYod4+LJkCCDdwiazLtS8UUMF1JoybpjGeakwMz7Q1Us1XdiSBOUXeKLU8RmsYHxFYtRFx/HQBd83taz6eNIkFnMf9Imi+oNLSsPJlKUSG79HIrPLHeKnt+2RcEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bP0h7Zqh; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bP0h7Zqh"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9063b380982so41598856d6.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 07:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582748; cv=none;
        d=google.com; s=arc-20260327;
        b=fxXVs6QQ2w9jW1hYTtvLsevXCqXhqA1gBCLvZWnIG34wHryijLIkXZK58ipmyffLf2
         vIt8dm3qIzaE9LXYyQGZNcc1jkZfdE2Y9WrA/c7wKZSOJ+GknC2R5RMjeIkhmz9mcQ86
         R10N7JJ3LaaEWCVaqhpVI3P0SAIYB6eX5H3PI+dBhxjpjXCglMpHe/bLyGOPc5a/dnPR
         d0ZzbbzQzHZ9PVUHBnUEeHlnbYx9whrRG8F5B/o60A7DVylq/kWFytkC2IKRhqateMWk
         GBv4kgm5iDxlGSe/ohCxPgJZP73iRUSOZdi9mo8x+cmK6U0OTElKGbqXbgKM1wr+bPML
         DHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        fh=SOx7ftwkx0CrEFq8Z8PcOXHFjOZgo/taKRX/DDQ7gwo=;
        b=dkRc+H8BTdF3xdL2HxF1GSa5Xp0qy5Sc/9ZfHUOjK2zsktA429mtz3eOY5a702Qh5e
         335m1TXAamuB/X9zv2KSD4Nz4Gg0Sk4S4gGTJvteadkiXG7A+52BEO5wKZUVHG1fy4Gm
         C3DzFNvo4d36ySBlqRJQBvN3uIv7BMzm2zno1rrwoImpj/oM8dHrHe0p3nmIQX0Sf7dx
         YKLDzRx5hRCNQM4166hTM7QNDrhJ8iqC2nBjR5xsLnP2QRM68Bg2BKn+pXud/r916bMQ
         aJ49mCFYqJlziL2fL2W4KWJYdHiad2hwh9Zp36lNUhD8jvP+vMfgdiWi0OJQQOUNn+En
         yITQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787582748; x=1788187548; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=bP0h7ZqhRP2YZvqVZFGgMR0GPc6dwH6/vzBF6W2hb+DmQUHbkyzIIorUyBAK/VYuoS
         khNXL66K3q3Dbw1lqJVp87tc+5faJbejMLEd5pbky8AHTNu/qv0+CzWTXfiL7NoF1wO9
         gIn8WMJMzMPTvdevPI06JkZ8qaL+ezt+fkYRBb/RNi/bGHuK7fJ4CkYqnOkRJAP++Tsx
         vKWmYJtP/phj0tMvhrH/J1pqucckN7zM3HYb/UqD7CkgP3PpFNhPDwou/xc5GuMhJSaC
         wOBR1ynPpBCfH2eBAWSB3KrKWOSLJGpIpIKTGRRZ2dIawrhmIy8md6FJvyzmo6p9n1wT
         O06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582748; x=1788187548;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skkP3oMbeet6bj4bc4/M8i6L8abYIXvlg1WGbPCJGYM=;
        b=PZzJVMIhbUFmnYTjmaJc3LUR+3iS1gCZ0h/ULyYxh+OaSgpN8moOy0WdDP2qJXsCPJ
         cGCdHWQCtW7WcgmnBJeo7yOw7ebTiPt7NPWP9tyohnbJ7X2Uu1dy3LJVzXe4/C/iXaLf
         EFTDomDNlbY++0/z0L/C8TrKAeu+QQs2xZ9X4ZDLWrADLQiCbcVkOSh2WgpqV17BiXaK
         +vAB88Au3WNTejp2Tc0CQudcQGPTGJgSrd8urQKUCaMv0gG0WZfxcHJFJgpLh5OCDUZk
         pSGs9Z8pcIfb1M7VfwERvH9kFaBLq1qzZxuuEKWHh8n5OAhpe3ZNaAbcqMmdKRj9TjIE
         y0gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAWl5Zr+mCpt2QCGdXD+4++TUPzvHB05zQp3rujpKl9ZM4AsyEfRMo9LUv5OZ9NE+oscN0j0PnT9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mWUSgqdn9xLgx3mwlEoceCssLknTgcmOHU52Yxu6rKChRkQpEl
	IUiJABXRbm8wha2Hl4olgQMVqewJgKaM7h3rEJsT7IcQnXmq3Y3D+2JJRMOE272QWRagLoRbDTz
	uTvNQ+/+gWw+xhThk20EV5D8h0h4NpmfGSfecXebL
X-Gm-Gg: AR+sD11+V/Z6X3uopStroPQ5TfR4XAH+CpJcXX5InsB9jCEbgVQ3gV4+ecg2Hcdlyt8
	S23aX0p8iUuYWU/XgsphIwJrUcyITVAaXcOzfNpJyBAT47PNCDw/GfBjdj9mqKcMstRsvwrxm90
	Onxs+NHXiab9d/8B0qmq+c0jBuj2sqloTAuRnjvGKlPfJyG0aDMah0X7iYMbdOwTVEDw3qclaCb
	QIYHWLqkQkrLr4/7QPScpvG7kuJkaoDaEdlYCS8WiaR8qjVbx8+7N1dDjk8S4tjorkcgyFg6v8N
	BpAwmRugtswgbG1EjHuUrtX1H5+k/LkooB+M8653X7VuPvdpKgEoJax14tsGLK7bAuHSq6douQh
	f1wE=
X-Received: by 2002:a05:6214:246a:b0:908:2369:df1c with SMTP id
 6a1803df08f44-90c8f9f6e2amr182627906d6.20.1787582747578; Mon, 24 Aug 2026
 07:45:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 07:45:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com> <a410cca6-0776-44af-8353-9b7375e2fd4e@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 07:45:46 -0700
X-Gm-Features: AcwNN1X5oDcPBaq55pm-MNepv-y7g9QlVSIhzW239c93dbXJQTRPUD7hBagIvPo
Message-ID: <CAEvNRgGvxMus6pp=xuDYOumH3Ge4oi0=YKjTaFykFHwXuzRDwg@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Xiaoyao Li <xiaoyao.li@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/8/2026 5:52 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> Stub in global variable to enable in-place guest_memfd private<=>shared
>> memory conversion, which will eventually be exposed to userspace via a
>> module param, and wire up the __kvm_mem_is_private() static call to the
>> guest_memfd version when in-place conversion is enabled, i.e. when gmem is
>> the sole authority on private vs. shared memory.
>
> I find this patch changes the default memory type for a @gfn.
>
> - When memory attribute is tracked per-VM, the default memory type is
> always shared.
>
> - when gmem_in_place_conversion is true,
>    - if the @gfn has no memslot, or the memslot where the @gfn locates
>      doesn't have gmem bound, the default memory type is shared,
>    - otherwise, the default memory type is determined by the
>      GUEST_MEMFD_FLAG_INIT_SHARED flag.
>
> I think we should document this change.
>

In a way it's not really a "change" since gmem_in_place_conversion is
set up as false in this patch.

When it is enabled in a later patch, another way to see it is that the
default remains "shared unless defined as private".

Before:

+ no memslot, or memslot not bound to gmem => shared
+ memory is shared unless VM ioctl used to make gfn private.

After:

+ no memslot, or memslot not bound to gmem => still shared
+ otherwise, ask gmem about status, which I think is already captured in
  the module param concept.
    + The very usage of gmem (without INIT_SHARED) is defining memory as
      private, I think that is already documented elsewhere when
      INIT_SHARED was introduced, that now the default is private.

So in summary, I feel that this has already been documented in various
places. I'll also add the following in v11's "KVM: Let userspace disable
per-VM mem attributes, enable per-gmem attributes", in
Documentation/admin-guide/kernel-parameters.txt:

	kvm.gmem_in_place_conversion=
			[KVM] Controls whether KVM enables in-place conversion
			support for guest_memfd and tracks the private/shared
			state of memory per guest_memfd instead of per VM.

			If enabled (the default), KVM enables the
			KVM_SET_MEMORY_ATTRIBUTES2 ioctl on guest_memfd file
			descriptors and disables the legacy VM-scoped
			KVM_SET_MEMORY_ATTRIBUTES ioctl for private memory state
			tracking. Only the KVM_MEMORY_ATTRIBUTE_PRIVATE
			attribute moves to per-guest_memfd tracking; other
			attributes remain per-VM.

			This parameter toggles KVM's in-place conversion
			capability support. Whether a VMM uses separate backends
			or out-of-place memory management is determined by
			userspace VMM design.

			Note, this parameter is only available when
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES=y. When
			CONFIG_KVM_VM_MEMORY_ATTRIBUTES is not set, in-place
			conversion is unconditionally enabled.

			Default is Y (on).


>>
>> [...snip...]
>>
