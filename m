Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3D30C60D
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260082; cv=pass; b=Ctcj5PRMWZ8jFkk46FyceznWEF3VfZvNq/+ftb1I8QO5cV7+tM16BNgZlLCuIWEGczOBCu1/VC6ncb0LTaZJUOCm7GYmndVlD3HlnWM5T7LEVRTyFNA0CRYNxBdi3M0qJX+BLjfIQbbo4A0V54hoSttzpow64iykNnF6H5Etbk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260082; c=relaxed/simple;
	bh=kcSIA8QoE0LN3l35tQtfo0jow3WHaPbc3lLYMPju8ik=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAckUalAg5suVgJUltV+f/Jz2/SqNfmfBaBbOm1fCOnPUAg0adAyyVV0fYXJvPabz6q13sRSuEo44kgVLp0WzxAF6TZ7j0uFGt6tQiL5bl7CUgLNl80IjSapEBy/JtxqzYaGISAMAQNZdIHB9m4qzpC30mRYXZwK8lpuWqsLWZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLQGNMZN; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLQGNMZN"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13986d61b4eso901026c88.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 17:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260080; cv=none;
        d=google.com; s=arc-20240605;
        b=fQn9sw5b/F+H9Qs3PXT5nKR2lybNXrB5BUwd7fyy+RTi4oW9iYMoXOPrKrU6APU/A7
         /bH2HqfzyFVS8gBo54yuxp0G2T/hBNoKuYpe0xf6DuY+s4iIdHzpbwgT39qGxFN23VN8
         GN7lx/U5T2ZBtLTDs0t6UV+BjRp299IKM4nirSP4rSQa2vhXtv1JbIVSxK8VXDaRAbi5
         64vBi3MJV9X/kJ7EO1mkce3mRSc8Plpu/6M7mpQOSh81WaFx8g1oazG9OLG3HQzE/iG7
         dAKqqIoFMMUqJraGCIQYbfuVcP6gTN3y/yubAF9m6sfODvDT89jiVs/HIU1gTdtvWiZh
         /nLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        fh=Iy068rlQ2Sg3csqnZB4dHXA2ofTwh+wvOASL8Wk9OdA=;
        b=O7jtdpyHk+PrhGTc06NeNVS1y94JJhiA9Z3+rEdKVdyJiPKNp5Jst2bHWPtPy+Az9y
         eUO0w4HTELZrLh0tk/4/YwO+TuZPRqpYi1l2Ef6+/eW7aFkQqKGOd15a+JYjhqhlKEgs
         2mu8AzwAKBhyi6aLFzeNk+X+XIWPbYjw+hC3nBAB9zbBlOKlgx8atOvnuSd8nnTL4OyM
         M7yuv0fF+rFKRmKr6Exwq9gcbqYVyUigunYKS4JaL2x6te3+4lCK3p0eU+avOaPLARzo
         AuHyOd4yylKKYUpFbpZpbgA+ZeXOxXWCSAq0tIf17Yug1nqkDzisHnwM+1Mfhz1UNmfR
         2Qzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260080; x=1782864880; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=LLQGNMZNBVde46DeOm10QrXFme7gPCLlmzfdjn1u29omu4Ul8I2WMRqAGvKGTWmeug
         p5SzL/dv2Jbb7ZxUU94M9T4VuzT5pDrNWMNqJJJQqzwPd9Evc/PLxdGdpyzdE8Zkwalc
         YSJ/2mV3x9o8WUDzo6vvCjoX6OgPDmoiVdpZ5ltMW2w+SsdnDRolaRUgug5/gZhWLI8n
         26qEZawRYF308lK36dmIOVAm0+eXufYvwMrmcumR62LukVdGOw4+U3dhIfl2YXAYS+MQ
         ZrW5i607QqoyZ1k4daJMagtAkfWdMAPjtxsMWAb2BbuI99lzK7cZviFIBLoI8+LZhjrO
         K8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260080; x=1782864880;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=ktZZQBGtlrrB/9vtpTX/eGLkc77RbySJSzurkML16HTXq5WFetu5rtFERK+kfqYlLF
         ABwZvReY4ojUSEFHXlxLZpfIxLI8XefHvPoOiduBeuztrowqQh6G4lHf2JFtc0/7210o
         w8V7WCDmbDRQNMrGWIaFWIbMBMzufsx1mBjJPbAk9RNnUyFF4wOrPQc5tuevcier0d9Y
         v+OYRK5FpUiOnHQUkjoZgo9zP6NN2g83rAp9Bd2angWcfL4v0NTjJ66M4PpQ0ciS6Aqh
         buIbbD1d6LOrB0bl8SQru0mfxiiz753jo07gl3kWp1ZPCETvkZdn8TucS4YnsCQPgElK
         sTYg==
X-Forwarded-Encrypted: i=1; AFNElJ8wxhVueFdxGhpZb99M+IMAa7xo7kAsNYu/1xrjP6Z8UzbcOH3VFZ8zP85pLlBriIxClhe97EL5sXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxznfJ8Do2wfint56qpVDBdGs8ehZWiJ7XGX3JcOToEH6JSiQVm
	D8Zl0ZWQj6tg/Y99zaMOpL4WHR/1gPzQH9afDpfEmclCHvMVWeLHf8/gNRkB/UjXqBfATFRszFP
	bax6oGT6nN0XmzmFP596BPmNh4mZ4HbMs53xA1NHo
X-Gm-Gg: AfdE7clf5QEgtLvVRyeremtgLk0zTK2dZlNawAryZuvQ7WvcASO8yqgo94r8a04DgbV
	xVBSzpnT2OwqUCpavS5CfyIwnx+OT3d2l2yhyGpt1/rb0DLAm60scbnlrkqTrGH0pYkVCm02HkE
	n4JFMB9t5EyNbEk3zH7Rt9wYeJ4xU6EMJg39b2MBhIXJWRP7E1anWZC2DT3H0DtKCBsfiMl/V68
	45NcX3U/s52S3svTz9qGCFmHARdxSGzTqQ2yd3lmqxe+Yw/eTBc+zOtTgGyBCFw+8nlyUhtkWQi
	JubaAtTxFYDLQsYcl6gMmA+0RwQD2ViCSLTklQ8KALDq3SphiG4qkYMB05I=
X-Received: by 2002:a05:7022:7a4:b0:136:5e4c:7aba with SMTP id
 a92af1059eb24-139ad6ac8ccmr13781633c88.16.1782260078995; Tue, 23 Jun 2026
 17:14:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnQVkLvFl_lMuGB@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
 <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com> <ajnQVkLvFl_lMuGB@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:14:38 -0700
X-Gm-Features: AVVi8CcXn2j2iTyhoMEqe261E6HKS7rSa97Iz0Ayq-UgAfPllC9cKLpff9jWWSE
Message-ID: <CAEvNRgGhWL-tWfu8EHf-zsU4C127xKT2wyV7wMBnLKs8g=pEmg@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
To: Sean Christopherson <seanjc@google.com>, Julian Braha <julianbraha@gmail.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 19, 2026, Julian Braha wrote:
>> Hi Ackerley,
>>
>> On 6/19/26 01:31, Ackerley Tng via B4 Relay wrote:
>>
>> >  config KVM_VM_MEMORY_ATTRIBUTES
>> > -	bool
>> > +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> > +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>>
>> Sorry for the style nitpick, but could you keep the type and prompt as
>> the first attribute in the Kconfig option definition (like the other
>> options do)?
>
> No need to be sorry, I've no idea why I put the "depends" first.  I don't even
> know if that qualifies as a nit :-)
>
> Ackerley, if you can provide your SoB (for Fuad's feedback), I can fixup when
> applying (assuming nothing else necessitates v9).

Thanks, didn't notice this when consolidating this revision.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
