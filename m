Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E91388873
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433173; cv=pass; b=c30U1CgUjkPBKvRASAcE6COMaGLDs8hDDiFvFDMp8STw/xYe7V0nZgOWlnafx8Akp/4o7BHeqhI7gNT3v4+kckbOo5N8rqa4w2DgEVqpsbkUvXg8XcKdkk9BwkNUNd/jb8cZVglqlZQiDQT1r1t2ENyT8pLKsf0kEqLdDQpMtDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433173; c=relaxed/simple;
	bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDTA/xAL64XN591TznDY30oORB6RCKtsYq53gPOOygXlzurivCA6uo4FsC0PLCkEC/2As/1LzCj3R6ZhGGstbfBMJWfaeOolJb6ltUAsamuBljBn6k4zEYEKwuafwwS5P0oBSU7WsTM8Rl2FKORNHz5dXpNli2sp5O/PcGkYJ9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J96zf1ao; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J96zf1ao"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137335bc3caso10472967c88.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 13:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780433171; cv=none;
        d=google.com; s=arc-20240605;
        b=ihM7gRy3lXX2fDMUwkngn0CzGlCvqNR4rJwW6xDkazzDRp3rAzTbmtzXaUs18zM7Ch
         Bb2zcLvsfBZH6gt2miTKnddfCEbDLSyfOZOKEDUmBN/NSp78Csa7iBSW+qFxHn6jzHwz
         il2pOO0XTXyShUAMieZG1mV0Fvzj6jJnKq43fPSZj9AIgPOmwdqhdbea++Wmt/1iksL0
         sJNWY8sT4ZrZ9KQDoFfPExOKZg86XToQgCRchT61I20bDyoGvtBnKo45nwBKV7P5KUwZ
         iUaIduTasXLJ7FFvVAq6QWUPh6aWR6r/A+6mE+7ukbyNdRWZRPSpKx+okNFh9McQXoG+
         lm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        fh=g5oNacbtAiXwacOB4KMYa3e3cVmd12zQ0jY88uBCuvk=;
        b=N58zvgGMqB8LC6NG18N8otmNZqtUfy+NPnfXmqK8d3twvXpr2PhTXtjVamT+jQpBta
         /9xommLiQA9TkG8Giu/OW5j0ZtB7wY7B8MxNcYmroVsjiJQZAbnQ7olJ1iKeKr53YJZd
         nXSF6qPY2XuSOJ3cwD2Iqo4l/h0kPFWqCifi6g2wndDaJSD6EIrqOuRq1mu424vVKtCr
         DPDLja8zuBKr/m34N1dw7Eqird1tDg5y/efP2lWXfrim0lRQVTbAX2aesm2/kM9w1/5T
         Kg4E56UHGDBANkAnrJ4o6ataPOYL1uwr3tVvFiCcsRcGePP/LYUzGQwTwG/oeOXukHiG
         bHmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780433171; x=1781037971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=J96zf1aoHutplBwfLO/64O+CNeopimd5AR+Qq0gZztktw3Mj53SEgF3ePR6KnN5fL/
         sT14QVXNxC3L6LNgESEqBwZDtkaGBb7kF6pM7YkYc2Y/BTQeaPbtxVTPz18MXW5ub2eE
         7zG5ouhBHW2QqdcMUkYkbEQwPc8XbnHCSWvKkVca2qP/pKyViikNglV6lUzyvwo3tplM
         gjPJHNesb0t6QQ9RRyldKevy+k+kNb9ww6yXVHHeHKvYETvJcd0r0RwxaBvhASDzI6NB
         l8U9CLVO/LL2PhRQsBZKy0D4tbyIAREFylXIkrW82+ajcNG/FCfQW3Vb2MEPN4QVXdMW
         /DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433171; x=1781037971;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=oUgWIhkZxHWT0M2LnXvFDTy8UGfkWE66anLb3M+A5uSL7l/MH1iV97Bp5XWGMClffC
         Fyj5YU1enmUq7Pc5ngngSUhARfpPxbA5kmKhyZuT36FXNWIPFxYvVCTw66gGjsIKL0vu
         rRuNqPV6pKAzprh5NDpdN/4lYL5J8wPhDSw4O/HpVpo0+lB4c83X8qPFjq/oRiFgqFOp
         mSq+GXjNrkKHWv7tUTDMX4yLHPhLefq4WRy34RI63Vj3rH5skH+1vegK30OC2Oa61obE
         ZG+jaop/B0PQhvVMWsyJiyc72n137j+1t5TCSk25I3jmgzD7IZp8Atko5HFbjmS6vQd8
         VhZw==
X-Forwarded-Encrypted: i=1; AFNElJ94DaDp/8clTFOSEesJlzw4KB60JdohWuhcxA1XIWLr1IeQAe6hlfhRxfxype8TgfOxfsfutMldP8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJwnoOgRQYWtV0karbiCD+L+cQ4ttOi2yixtc7RyNqO6J4DPf
	46IQsoQS7hI5/4PQ278LhwW9GduRVw6OQ9DKiVSiFgtQWdjewd1QkCtwEPNDME0DLQif4Ww8FxB
	esjJUunnMR8rutxbjGyVyDjz8JNI01ggfkgiZEmzk
X-Gm-Gg: Acq92OGaylsWxfW9nPVFxIWtuZif1zNAjSH3lQMwJbCqC0O9UXezq9dOo+e9MYdS8P1
	3BpTyglDQGIZr703bRmGXVWygKxW7sk+NStDxY5vBBdo5naSoAi12YXvF/NYvgdUS0k1woProk3
	RmnL7TcoL2OrSve7VI+ardzfKbZ/p21qgEwW2qNKIxsmynBvkBkKYsYggEmK0bYB4Ub29AGaZxH
	F7IR74VHQjT9gvNJn8DVuY/6UZC058g02J+nfBF1tAftQvRN3F+7lmuhusZPCIoYVxtIOBN/zmO
	r1mG3STyLjTxrWsR9nn/VVi9tJA79b28/SpyKHY6vC97/N0P/9JNKwSp4eDmHJb0IwkyMG+8RFz
	h0cKzzLWuMRE78ik=
X-Received: by 2002:a05:7022:ec86:b0:128:d7a7:5271 with SMTP id
 a92af1059eb24-137f6bf3cd0mr110847c88.28.1780433170429; Tue, 02 Jun 2026
 13:46:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com> <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 13:46:09 -0700
X-Gm-Features: AVHnY4LuAokUCPsMDhhGv1NZjrPxAfRb9eFwDvC0vBskqE74-aUqfHm3K8vBqpY
Message-ID: <CAEvNRgGzOnA34WyOHtkOx5MZDZhOHaXAe+nD75AiJsZ-PsTSFQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 23/05/2026 01:17, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> All-shared guest_memfd used to be only supported for non-CoCo VMs where
>> preparation doesn't apply. INIT_SHARED is about to be supported for
>> non-CoCo VMs in a later patch in this series.
>
> nit: s/non-CoCo/CoCo ?
>

Yes, thanks!

>>
>> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
>> guest_memfd in a later patch in this series.
>>
>> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
>> shared folio for a CoCo VM where preparation applies.
>>
>> Add a check to make sure that preparation is only performed for private
>> folios.
>>
>> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
>> conversion to shared.
>>
>> Signed-off-by: Michael Roth <michael.roth@amd.com>
>
> nit: Missing Co-Developed-by: ?
>

IIRC this should have been

Suggested-by: Michael Roth <michael.roth@amd.com>

IIRC Michael suggested this on one of the guest_memfd calls, Michael
please let me know if you remember otherwise!

>>
>> [...snip...]
>>
