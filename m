Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA03E5EDC
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777057729; cv=pass; b=cP8fL6BHrC2L9LBgNKJqbv2zVBEtaBrBFmD/ydHG7Xd8LzrIdI49FC+VnrUx4qvOllhm2QK0Nq6ltjmmIjA8sq6M1m4rs3/sfdJsRCWZzyptsrLPIy1+O1tyJw+T6+hMTf2HGgm1OZ5lbAZxnp1+afYXzya8r4zmhRiDSFiHu4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777057729; c=relaxed/simple;
	bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nN3BXZbu/bwWVg4K1PqqspO9LBGX299naQj1eAz4MKZQh8+6qjnECkwRX89Izg23zUn9KrjFHirh1ICwYTC2chUFc10teGLBe23DDAu0FyXH+u5oAF8mvsJd/wqRyfXAnFjJa7lqga0Q0GpeEl9QVzVUTmHqCd8yd4IbXmFq8c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wn8Zmut6; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wn8Zmut6"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56adf76631cso3092393e0c.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 12:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777057727; cv=none;
        d=google.com; s=arc-20240605;
        b=fcjvuzqH6GtcDMU+1qKwIrauq+6hN8QNPfFQ0j3Vq84/+cwxT8j1bipNyui2U/9pAP
         vPP0aJP/0q74BGG+mpAVshZeRGYrc+fAsYv9yYXEKwCJLpL7qSJJ9eEciuuJ8I6LvADz
         AdQO1XFkYIoURxiGaJZvKaAvv5wJu6x14+rYp+CUVB4wZPZDrQDb8Wqly32rOW4lcJa7
         5Huf7anqHr/dkiTC/9oVT3x9X86LHHybWtenCEKLz18Su8HYxvyr53LpzMR8IzwnxcFv
         EstxVSr3WW75bqlXqR79tGaC0t3clZ8k2zaM649OvW63/Hrx6wXgQTf1ZDTM2NhbFxuc
         anVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        fh=OfQ8nyZSKBpQ/WBCwfO4yiNe8jEFeDWyHaiTlN/e/r8=;
        b=RQcPHnxU7Vk1y/lnWmBQeP1xkPxib+ZYZzjZrU096FcSvn4/qoVUafk1QR2V1TG3Zw
         rbIY1TTzNjp02UAYvIrBYXeMOkOIJ5C3LRvq+aQE7tvOypvBr16U8WAUT/foLI/7E1yV
         b6kjhu2Ncb5Nl/vFM7DQTEgWsYSw1B46tlvJQ9Ug+8CCPdH1RIX63STSfo1ce62bxOmr
         JAPupAe2wgmQAmO0kCqce2qgoywF9JaqJRb2W4/Bc7Dto8ORcqGJqd0CP/G+YWf/fgcs
         cU+BFPhsyV2/GVADawkn0LLyNdIN9XaRGoXTeuo9EcPGEuXm+/PnsY58xCmQREFOmnws
         kZsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777057727; x=1777662527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        b=Wn8Zmut6TaIcmSg3y5Y5a+blYeLvO3T/F4cHcw7Y8e65aB9j3gDdqe6JDEYmFaxXsZ
         uIQGVA2a08X7iOx8+HCedIzhEYlzfqxt7TxqduTtq6glVAcYLTiwX5qcK2CUN/+nHq+4
         Jo13b3vYy8hS6wAtD1oyrYQ4hn8tPCncQFjs+VGwm7irmd1cXip0GMtJKIO+Db+OMYLQ
         eSgAOsZe9TTW14NiWWp0Y4karM6mZgVQLZQJ4E5+zz9bwtbeNA8z4rQe8troqd28vD4S
         fDYrv12KqJkch1N8sdlTMc7ddWq5+lsgB3TbbljGW6d1Er6BANNXjsQj0T96BTN9ztdB
         jvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777057727; x=1777662527;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZtEXtNhHfkNb6REgZmVRn/FfCDvY0I1XuFnEkLVDpk=;
        b=VUUmTOL6FpVKb/QYmH890i1m7BJofc5plEex/NB+MBWBp4KOvO0BeTWLEwonynsyKh
         vHJSbXLrZ/212dV0pqE2FZy64LGXeRyvx0mKiJ7K7Ru7JQryTNX6lle73TPCdZ7MdATV
         cTE2HRJRyV4KT4fRxN93lNhTmXB1eji2DRNKfvlE01z2ycBf1m/D+QHpiVAe5luyLR/d
         ACMVmUStvnJLQMryJOGCvoG2SCyAN8mjFJf1vgXqu+2KxyE6nUvZ+i3rZpe6oZaDzqiJ
         ufFkD1YHpvX3qJFRPu97ZVoQnKIGquTHfOXuRaN2CIA9HI0k7B5uZ9Cln/Xm4orsPs8K
         OJSg==
X-Forwarded-Encrypted: i=1; AFNElJ8UCP3yf5yHHnEs0wr6j7UkgKs9Pp27XHmNoGW/aujmhSOq5yH6RFVIXe1howc251FpcINxCNkcsLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6gkPPRwd90OiOzdjN8sFppCV3GSk0wwsCyZLzvTxmHs83ym9
	OPGjcb5oGH33fWp7maQsfaQbGVrmth9ls2bB7XNwd2FFyQA3hYUU0z8ZQjs075KPhnkiBKzUpF/
	3tDeFZRvU7hEcsaUPzNzXul8FUXS/brCLPe2r7der
X-Gm-Gg: AeBDietB009dz1Z7RmJCakgV0DQt1EulTtQpqbGQoOr2kH7s/KY/l5Vlfw3OSfATXB6
	+jnypqzGSCMk7je9ucsEsxyNMR46xZ7qJmHvwTIty7BxdmrGKxZMN/NeF/SiqqtkzLddYbWoJXq
	S6xjAYrtgXA6cwLhM9cDAaxunupywSZkVtKOnFDX8RinVNnfbdJf4DgKbaoEVhV8tS5U+oDimcy
	m3QHJlEGGmLSv/kdqIgUS5g4wJC1Cdw3VvBRoxYmHFrSBHGfbxTN9V0xy64VjjFAM8EiA6jsSWy
	ZDjdBrrSnHVfkOzY8uScAtoYV+58etYOcZNG9KMVFCd9MVwoRU+Avna4v+z+5taLVYJWxGs+iks
	MJtPQTcA0WYmSE4k=
X-Received: by 2002:a05:6122:8b8b:b0:56c:ddbf:57e2 with SMTP id
 71dfb90a1353d-56fc6816e2amr12940121e0c.11.1777057726762; Fri, 24 Apr 2026
 12:08:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 12:08:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Apr 2026 12:08:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <eiiecl7jvywvqb4drq7cchmcabcrdka25wxr77uavxqineeedm@rfcnhdz6xoxf> <3blpenhpvysb2ig7efegedx4v3flppl5ftnz6vhpqlatfk3ycn@vmmhs7mvjieg>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 12:08:45 -0700
X-Gm-Features: AQROBzBye4IStJFmb-zjsEcLePEkodFuzsfbkbSYLrRwBVn_bPHs_yld_lwLStI
Message-ID: <CAEvNRgGbMhkX310CkFY_M5x-zod=BDTiuznrZ0XvFPUK7weL1A@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Michael Roth <michael.roth@amd.com> writes:

Thank you for your patches!

>
> [...snip...]
>
>>
>> I also did some minor updates (prefixed with a "[squash]" tag) to advertise
>> the KVM_SET_MEMORY_ATTRIBUTES2_PRESERVED flag so it can be used by
>
> Though I'm not sure how we deal with it if SNP/TDX at some point become
> capable of using the PRESERVED flag *after* populate... but maybe that's
> too unlikely to worry about? If we wanted to address it though, we could
> have both PRESERVED and PRESERVED_BEFORE_LAUNCH so they can be
> enumerated separately from the start.
>

Not sure how likely it is, but if SNP and TDX can honor PRESERVE
semantics after populate, I think we could implement support under a new
flag like CIPHER.

CIPHER can then be used to mean "do the encryption or decryption", and
for platforms not supporting encryption, they'd stick with PRESERVE?

Should we redefine the semantics of PRESERVE to be "ensure that memory
contents don't change while guest_memfd tracking is being updated" and
avoid making a commitment on how the guest should read the memory?

The above update would be aligned with ZERO not being allowed for
conversions to private (because KVM/guest_memfd does not make guarantees
about the contract between the host and guest.

This way, all of those (ZERO, PRESERVE) will focus on KVM's interface
with the host.

This lines up for SW_PROTECTED_VMs too, since reading memory that didn't
change in the guest is the contract between SW_PROTECTED_VMs and the
host.

>> userspace for SNP/TDX in the kvm_gmem_populate() path as agreed upon
>> during PUCK.
>>
>>
>> [...snip...]
>>
