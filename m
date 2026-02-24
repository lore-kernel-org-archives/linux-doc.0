Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2214F376BCD
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928049; cv=pass; b=QgumXDo5DndfT4sMf3Yl8NIW8598Uqp12XOPowiSv7Eg3aI7JEPqMhd0WX0dU0+udjvJEPDpcxmMUOd1Di7esbr3rFeqQuE653SpDBvX2iKAV9Z+zpopr+Q4RdDMCuSsgsNdYRbIv2f7iSO6b6Rmt91F0kiLaRtSiUJKLQ+yASg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928049; c=relaxed/simple;
	bh=IyKhJiJuQRzoX6JzUZnwApPT0auX0X1bnVL6krBBBGY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlFuly0+WAHRzk2LL2DGZy0Vjm9v2nRBxmqZBwRbpNTtwBpWWb7lDnfqQrsoZOnTc+A7o+9C8/k5XRcUKUueqAJ9ErDBB2/eGQvnOzV3s9fsPm7zeQaMqrijQdniQFcxrYu3AHqsL8uc7ssjCOaqscyyBaa4azZ2g6xTdJZQEts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xutZiDmS; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xutZiDmS"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5faddf6db62so3524205137.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 02:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928047; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1xRrQGB4EO5i5PQCabUf/xN8NpPG4rHZvpQ79Y0tqZ8n+4yXoUysujRJhJgKo7K+t
         BaQcI7lBU3LvnZy2sFUZU02u63ylQgn+oHQwMf8QCtdbG5Oj/FCEyXX3P+1xGpBnVd5v
         l3y+eWgWC+BjUXqqtbjx2Q1SfzAEnbn0mCg8DAfQw96+6lzzF6WG6SxJMa+JfR7jgTuz
         YOmNDu864mprQfr17FdLarCRdGJRs00EC0FNwuQ0Jo6dMjjtPkoDhe7+deq3Uwzbrj9L
         6A8No0S4gU3SpvOtgxO9lGQb6tBfYYPQG37a7Os4GacKwjAekxNXU8pAELuwTUkC7HsH
         Rcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        fh=W3JJdjuQiA4Fk30FxJVzwtDve7lHx5wP3dl09SQVavE=;
        b=gzG5xOlk5JS/qFlOnGfSowzo5nZx+z6hgq+dPJN0orYvUUhLN7fQ8Qo6DUp5IYz6up
         3mEBXN4l506r7aBGvNE73GKVpaLKlGirM/mgL+6qyakhBdeH3u3Pr29QgB2kZdLjUNe7
         3BNJJkcQts4i/Xa3tAFjCeiE5iuu0TMa5Lv23UcQI4mrcfdUy4L9F2sZ3qilzJZfQIzM
         EztjYV0wRjC4sy/QmOK5MaEXSRuMOxnhdfbww1D+BBLB7NyQ8+RY1MEJpGJNux8gPkXK
         AbrIijv6VjCBduFS3FmYhoczwoZ0j0K4AcLRYyx6LMS7MXnNFt2T3ZQA5jCHAKv6rRwn
         ukDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771928047; x=1772532847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        b=xutZiDmSUlD/DMw9tfRVwQ9hAjtus32ia4wnAOb4AbBw7jr2Pm/Xeyu4VTDbCOhraH
         MrgT5sQiAEgdjnlWVSDG2WKes5jO3DXmb/YOByUrMxO3MXnvVegtgdeaA9+2fF3Wq1Om
         u9Sv0YWyLXsQQd+5xV6tfBcgSbDj2yKpD5aCdSGwyMZACC0ZPvJX6Q39jfIp8NrTgJjw
         kyq5c4qxILldKJznLZvhwWn3nF/DgY5oMxa84BvNp7Jnaejlif8GJxMO6NswQUUEHtsQ
         DMl5rPYwO77Zq/dJ/jbcRSeY2UsVNhd2Nte7ea3TQgG/BmmYWAzBsySDJUuwnLu+KX14
         Nv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928047; x=1772532847;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        b=XToWvzz9XSdWDGcl7xNq/BtsjgsW1PFUInNiqCGNuoX7f827B4DQZlsYId/8gsGYSj
         OVuKguAycYLHDpA92BPEQ11A3XX2Cv2oe9uByWJrJbehDQn+S/S9/GYFg++XIx3HF3g6
         NNOx+9qEy7dmA0kLqyio03cGYzR1VoDV0WYg7QfQF5q8pnEJ0hh6LddWL3ORkBtxvG0g
         nE+DYp9XWzIYaRP64+VdBqR7Zj+NjOsaMTa5RJzkNpXBScvO0vbusPGcDUhss0HlV3DL
         8sxJdyji+olRDNNwLlyngdrk/SKmFGhg86Uf9PHLx0stxK4n+d89ZwXnESS9eoCQDJC9
         x2wA==
X-Forwarded-Encrypted: i=1; AJvYcCVVCIGZgC4RpnovtfQjwpgyctxHO+Q7c2Yg0b7PZtWxblACLCJRf/IjzPvrSDpdjeqlbG7zmEeRPFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWJ8fqoQ2s9PbR7mBdXmeOkR0fCt95Wotq6tBjTHEFrSK3PzkL
	8HvaESo+AEf5jSXri/DewAkfLSqzCNBKx/EjS72p295ZzkEpqswn54ushbg21ZE8Xm06gGxbIN8
	gdu7cuJuH+uXQgdW2WB1fjxEJ1n4Bsbv47jvIytKx
X-Gm-Gg: ATEYQzygAplyJtGPKtSoyaNNtHA5bu9c7Wn20379ZVdfukUJm4NtMsvmqQSh8UfJ8g4
	qOD7ot989frL6/Gef5gMFtdSSxWPxbBDwrr4k2ra9CW2hLVOp4vPmQT81fi3zn43Wu5T+QPE/7o
	ypz7Jd36MO4Fv6INgs7BLAFZihxim5XJGWwdmwHMYNnHoJIsOB3597ZANR9gTFlaB5lW5K11thL
	o2OtSSFDmvYRd7lOPrxeoEDxvWrZy+m2yVI+8gs2HVtjzhR7GWicMmXnS3fcG7jYZTYVwtv5l9F
	RL/qxPlHPhfVvNbH1whrASLKnjPXICljRXzCPWXF
X-Received: by 2002:a05:6102:e11:b0:5f8:d3b4:9517 with SMTP id
 ada2fe7eead31-5feb2c4ea4amr5648164137.0.1771928046467; Tue, 24 Feb 2026
 02:14:06 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 02:14:05 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 02:14:05 -0800
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
Date: Tue, 24 Feb 2026 02:14:05 -0800
X-Gm-Features: AaiRm51EKOaIOw7Xa64Dg1IqVEZq_6qI_aDRRZTOYQVamaSRRKhT7UeHK_oqjfM
Message-ID: <CAEvNRgFBLgvYoR_XTH-LiN1Q00R9u1HGC5URbstLPxYtedS0MA@mail.gmail.com>
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

> Ackerley Tng <ackerleytng@google.com> writes:
>
>>
>> [...snip...]
>>
> Before this lands, Sean wants, at the very minimum, an in-principle
> agreement on guest_memfd behavior with respect to whether or not memory
> should be preserved on conversion.
>>
>> [...snip...]
>>

Here's what I've come up with, following up from last guest_memfd
biweekly.

Every KVM_SET_MEMORY_ATTRIBUTES2 request will be accompanied by an
enum set_memory_attributes_content_policy:

    enum set_memory_attributes_content_policy {
    	SET_MEMORY_ATTRIBUTES_CONTENT_ZERO,
    	SET_MEMORY_ATTRIBUTES_CONTENT_READABLE,
    	SET_MEMORY_ATTRIBUTES_CONTENT_ENCRYPTED,
    }

Within guest_memfd's KVM_SET_MEMORY_ATTRIBUTES2 handler, guest_memfd
will make an arch call

    kvm_gmem_arch_content_policy_supported(kvm, policy, gfn, nr_pages)

where every arch will get to return some error if the requested policy
is not supported for the given range.

ZERO is the simplest of the above, it means that after the conversion
the memory will be zeroed for the next reader.

+ TDX and SNP today will support ZERO since the firmware handles
  zeroing.
+ pKVM and SW_PROTECTED_VM will apply software zeroing.
+ Purpose: having this policy in the API allows userspace to be sure
  that the memory is zeroed after the conversion - there is no need to
  zero again in userspace (addresses concern that Sean pointed out)

READABLE means that after the conversion, the memory is readable by
userspace (if converting to shared) or readable by the guest (if
converting to private).

+ TDX and SNP (today) can't support this, so return -EOPNOTSUPP
+ SW_PROTECTED_VM will support this and do nothing extra on
  conversion, since there is no encryption anyway and all content
  remains readable.
+ pKVM will make use of the arch function above.

Here's where I need input: (David's questions during the call about
the full flow beginning with the guest prompted this).

Since pKVM doesn't encrypt the memory contents, there must be some way
that pKVM can say no when userspace requests to convert and retain
READABLE contents? I think pKVM's arch function can be used to check
if the guest previously made a conversion request. Fuad, to check that
the guest made a conversion request, what's other parameters are
needed other than gfn and nr_pages?

ENCRYPTED means that after the conversion, the memory contents are
retained as-is, with no decryption.

+ TDX and SNP (today) can't support this, so return -EOPNOTSUPP
+ pKVM and SW_PROTECTED_VM can do nothing, but doing nothing retains
  READABLE content, not ENCRYPTED content, hence SW_PROTECTED_VM
  should return -EOPNOTSUPP.
+ Michael, you mentioned during the call that SNP is planning to
  introduce a policy that retains the ENCRYPTED version for a special
  GHCB call. ENCRYPTED is meant for that use case. Does it work? I'm
  assuming that SNP should only support this policy given some
  conditions, so would the arch call as described above work?
+ If this policy is specified on conversion from shared to private,
  always return -EOPNOTSUPP.
+ When this first lands, ENCRYPTED will not be a valid option, but I'm
  listing it here so we have line of sight to having this support.

READABLE and ENCRYPTED defines the state after conversion clearly
(instead of DONT_CARE or similar).

DESTROY could be another policy, which means that after the
conversion, the memory is unreadable. This is the option to address
what David brought up during the call, for cases where userspace knows
it is going to free the memory already and doesn't care about the
state as long as nobody gets to read it. This will not implemented
when feature first lands, but is presented here just to show how this
can be extended in future.

Right now, I'm thinking that one of the above policies MUST be
specified (not specifying a policy will result in -EINVAL).

How does this sound?
