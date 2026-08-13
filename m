Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A742BC23
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 21:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656245; cv=pass; b=D9kw7Hwme8OY2DAf07ridaIz8p+c8Vrf+8zzdKoUtoVTyHHZE/ylNVnNv5WtxiBitaQMHShypm/tf0YZZVC8rv5oGpncEFGnoJLkEQXvmSSbbWOtRnlYmOpKwVRtcNlLn7TlMnatWsgTx/VivNKvxvYXrqNZxJ1nhu+Teh5j4+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656245; c=relaxed/simple;
	bh=qX1IR39uVwaDaiwu+D13suWfX2py7eKUr7A0OiCh9ro=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abUTOZZww6QiVqmgP9Fjbak7IlRNiAT0F3ThNgEu6CcL5lNEssKL2wXTWRVi8deRsa7IFbo5bQ2gD+B6GTydfY4YjbddsRDcZkrE7G4CGPksJXcBJYtQkBbxgpyuMotvAe1iD3+LQIAROq3aPv9PYDUroeAbe5RJXvgzMq52GnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hmlSZbTm; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hmlSZbTm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e507b079dso154284b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 14:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786656243; cv=none;
        d=google.com; s=arc-20260327;
        b=S1vlWau01w/Jf5yXtyxLn0YuBUpwmuOupvnKrodemvWfEpoRH0xk0IgmgYFJTwuslj
         uyVBBTr+ez1yiVoJ/AUhsCvNsPm9bxO7RIINtSoWA4MFWK24f7DAqx6K7fzr3RqewTYU
         r6MRxZezEVrjofHNh2S3nAWtm/uv7MdKdtINs83R7AGKT4IrllObE1WUjVTcC0oilXiz
         INud6Rd6yvYYDhEcMX2/I/CpSTIMkSqgDEJz3dwxfBGuIj53yqpHYR3gBOWVgdIM8DKa
         VlsmSud9Qkwhg8yolW4owmxH9RYmY3WQCrNwyNa37hOkWIgdIoKLuVMDV5gqXAJTNPqk
         F0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        fh=bgz+DdxrxvdyP6ZH+cVq7NjxDcXHsiV8R4wX8650kVQ=;
        b=BBg7ENpXgXwUeU595ixkjcigywK+yyJPmcVP1ir0wEYj44l0x24ZcP3U3/e/xSX98m
         iv1gLTC5aRZEIjEZJHVVJq2f0SXlUPBkeZRFj4YMy8GnGU0QVUsESSUh0MdxtxW6a4y5
         fUGLKrF3vG6NcGnKxBOpTamwdCq7414mOShuL6vrb9pnmdNoIHnmzfZdVBUthvEzdcZY
         94CquMgNyFRW4WnNKYm3FIEU3dM0+RACWGlCJapzLYGO8L4jz7sDZEX7tN2QGBLJQpud
         hbPXIuq5KteNUhnYkGRjbzTd70etJJe08t0nq1LPvBiyRJb1i4x4ztnqgjaGivMgtcza
         B5UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786656243; x=1787261043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=hmlSZbTmcwlzQzA4RAjRnm1zAMk0yOyDyMiwa5V5oYk5WEKaIOXTCuTjW/Jlww969n
         RaLdn6beYoaRoNFonZ+vIsG7xCCg850Rll5+UitkFZtfYQNfslPNDdeBtmwBg2rli2nU
         MXkUnasQN7YFrsk8p/jha01pyz9cF+pDF2TJhhkTEpyyefnyQE3q1OOsiPiRx7shpwi7
         kjJwqQkjUbmXB9amDQTCo1siV5u0ey8SE6OzW+nyNIZsLGZ6LXYqWXWz3tM1rOwqUHZo
         66SZmjsv/sgA4jd5zAufZ8uZGxGdzR9I3b4fyErxjshJDf+8pU2H+m/XeDZ4NTnRVx4V
         Ef3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786656243; x=1787261043;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJck1umI1gERxZKqi/mE4jPaeCUw7jHUSxZxlUOvdoM=;
        b=ghWFl1zMpkG/9d7Cxj3ye7cIQ0M1aV1YSmYQmBukhbWZ3nr5SixsYl/V+fymyblxaF
         /30KoZz6DSUVdS9m3AJDSpz3ck0qgv1QDGqEH8a0F4qdb0pnGot27FHXG3kjUSbgW88r
         I0bFTA2fJOsxVv39sDKHDK+72knmVTXRZWmu0bco6CqCWXaeolmMAH6Nf9vlnpKQxwFL
         8XXlOuxfTdYkTTSMXTvafROIWOGDiRbvfEVpiMuuevvp/L88lCaz0fTDYAZvvwTLI7Kv
         QTa3qtUJ+MnKPKCU3AZNTBMDbh7aL4Un1EtZSJ+QCuyoo5Pj4aN+VCwpRHU1W9DKFcvi
         7/gQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKLKzPk1RhxgtBnSvttewx8y6jJKI4SQRqjNPgXvK+EMw2HBLphMOEP6/fHh7c9Mqj97uGmzS2xUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNrQxv2Y+vvnTGsa8zz5Zrc/CQL1S+0w/DLChbz43wXd3krbZE
	DIlnSUOHqfcy6eTNXigZpwrS3U4KGe6QvIoWEWS+khjFnnHPmYbCT1D7o7NmHtlOLIrWM2Img9v
	xuLw541LbBr3KqWbfIRy3+BS9yEO7h5sc0kVoaggy
X-Gm-Gg: AR+sD10OfJlI8UpApZBZbe3eec7mVTA0wD+rVqGiZXBLHfVHb0iRc90+n3WmJUT5CcE
	BAQESJ5gkN3uAPOvFuuhFIHdmdYte/SE29GDRlJQ7rWYizwEdeAIpawKEobq/GK0aNGsfgT02DQ
	mavpYvNore0HWM69eYDXt/WL7Ut8PdMr6TU3qTovO9Y2qeUP2+3yPCyDSW2T3SHWHZpHsVJEWYo
	aBSjpa5w7rPiNn5/x2HTxy1h4IdSuScQMvSc6alBGzcF9qjYOPm95VSLs1cWrGwEq9rYP2QG8sS
	/JoBaGyFh6PwERm8tFA7oKq4WaZflzfjU+YwgPfTBFZvvp7JfdXC9IJHOZtxjajsaAX9N7yOrLH
	RV1epSg0NC7nB8beAh2PBbLs/w/jwsg==
X-Received: by 2002:a05:6a21:a4a:b0:3cb:d156:d362 with SMTP id
 adf61e73a8af0-3cc7196e785mr831997637.3.1786656241969; Thu, 13 Aug 2026
 14:24:01 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 14:23:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-20-2fc18ee6d3ba@google.com> <82ded1ea-e0f6-48d9-8bcb-38a6bc5e9176@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 14:23:59 -0700
X-Gm-Features: AUfX_mzbri1ixV_zlf2Jna8d8Me5Qvc_rxP8xrcIgsSaQjjAlnxnniHAuo3sYt0
Message-ID: <CAEvNRgHpy52iynKfXeEkyCixhhu0_Hnu5jSNT8i+BNxvEoG7Cg@mail.gmail.com>
Subject: Re: [PATCH v10 20/41] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
To: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>>
>> [...snip...]
>>
>> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
>> index abb108886733a..2c3c22aeafa54 100644
>> --- a/arch/x86/kvm/Kconfig
>> +++ b/arch/x86/kvm/Kconfig
>> @@ -81,13 +81,21 @@ config KVM_WERROR
>>  	  If in doubt, say "N".
>>
>>  config KVM_VM_MEMORY_ATTRIBUTES
>> -	bool
>> +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>> +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> +	help
>> +	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
>> +	  memory attributes.  Using per-VM attributes is deprecated in favor of
>> +	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
>> +	  CoCo VMs using a VMM that doesn't support guest_memfd memory
>> +	  attributes.
>> +
>> +	  If unsure, say N.
>
> Hm, does that imply that a distribution that must support both, cannot ship a
> single kernel?
>

Did you mean this as a documentation comment? Should the above read:

	help
	  Enable support for tracking PRIVATE vs. SHARED memory using per-VM
	  memory attributes.  Using per-VM attributes is deprecated in favor of
	  tracking PRIVATE state in guest_memfd.  Select this if you need to run
	  CoCo VMs using a VMM that doesn't support guest_memfd memory
-	  attributes.
+	  attributes. Select this to defer selection of where PRIVATE vs. SHARED
+	  attributes are tracked to KVM module load time, where
+	  gmem_in_place_conversion can be specified as a module parameter.

	  If unsure, say N.

I think we should do _without_ the above clarification since using VM
memory attributes for shared/private status is intended to be
deprecated.

Is it fair to say distributions should not support both, and if they
_must_ support both, they need to read code to figure this out?

> --
> Cheers,
>
> David
