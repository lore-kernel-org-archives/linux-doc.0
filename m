Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224C3E557C
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335038; cv=pass; b=SqiqQVFlbzmF5AOk/z0UBSIm5y9zo2r68GSO6DxFjceZIB2nuEITl9kz6SfiLhoGMoI2jLNvbKu1K1UqjcgfsmD0YOksOSatOdQKN3IzUg0tykGOWn3elL2Kd41f/cPpf+tSaJc1O+P/LMH4oWH3HFStY1Wysk07FMzzNLISHtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335038; c=relaxed/simple;
	bh=ZP8N6p4zyFdYhpwemtjmNbpSTSjuQDSqD/2oIp/CY0o=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTyuLM8/rP2pOtUqsf+U0fTUGndxAyD4yu0shM3jIS8UV33PIAgff70xz+17pFn+2Z8OsjlH1zKtsCFWMPLgDxsMmL+6SWNWattKX5M7hWWBanX7eMN/SulgMFXw9waz7RiqEAE7gmyWdqN9YkmBTmhMz65FlCOmYz2VcK8aZe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mVsKYsqv; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVsKYsqv"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13809223fd4so1808489c88.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782335036; cv=none;
        d=google.com; s=arc-20240605;
        b=Jl4HqTfIBZ3lE8fWGCk72BliYqgZqA9TAEIiaDjZzUYW8SVYZSjmKCG6Y3qa4Vc2UF
         DwSsV+IUh4xTVR8MsiXB0qt61URi2rvbEZ9y6FKAh4kVhCiVSyQs3xHaBDHFlxDSaGQW
         Rqmge/+p9YKKoGLK4R37Zb5Gj+tfmYpirrP/HGD7dOLTqReb8+k2bmx0hWf7KXZR3WA8
         J7e1ocUwfNjii5fd3yBePpLfghRfLC5iv+7f3AYV00J3FJb9sa9wzz2Prd0QMTeZ/3XN
         tik+oj0M+3/+njMwFiRQURd4L1zZK1/k80i+OCp+glYIAtDABlRKCt/aJK3hMER8v4Is
         2X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        fh=UeqpzSAPWF+G47dIpZSgm1JcmmUS/j+4bqNNs2PhPMY=;
        b=PK1m5d1relP80D0CHZtYSouZWQDiwNkX5l/8pBa1YnHbq+p53DV7OAlmfto1aYuC6A
         aWT8PMyEpgvKBoVoHT2uOU+6JbE2jYwvmKoQK1uMtNRsWp86IE7EJLwJ2T4URABUBapk
         G8nRdswxpOSJERlDT7Ta2ntZPMU01WJ4MMCl/7zg3/lFBKHyyYP5Ez9pOvkeUEvTI13d
         8iAKVYk5zX1NkF9uiVWPMSSWOoifwsOGDOhvAkB0bAlxPUhonPrOTZYdcxaFl534n3EA
         zxZSPG0nDNszaSc5nhkRl2duttomP3n1od32NE2uy/PkY1cOMBA8N4Q1iYUJ49iwaRl1
         WM4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782335036; x=1782939836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=mVsKYsqvPnhHjkscTaVCL9NTaVRlQl5cUFxwec1BgKw2e+JJbfVjYFYSqGXsnKgZZ4
         mgFjofxuxGoQHwYeFQmqtz4VvaZvmgkejICgYod+Nh/Puuxa2c1tfntjNkhSiibGXEHO
         cAAvplbvP9mkRidKcFPah2Eti5Q8uI692spAczkb3xxP6jCJP8K1uUGEWXghE36w56qB
         YYyUej/zpfG3cbyB7u9b3qVdn22p9nigT2CHRyTUvjDVHz08eqRBAPNMmzlPxgd9bvFq
         7aiIxVdqTM0VRDqvM69Isr7h6eEMHwZdHiTvNN1EU6aDMDFn02Zwo8qBsIjimCBXWsCs
         CrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335036; x=1782939836;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtXqtocb1qS3/K6xnMYZSBV/6kQD50+mfkfO7ut81Ek=;
        b=q3ZB35UxINCK/DjAxeBsJNGQk2TY0AQ83SCGcQz+aHZhPhP+lWxiOK2bXLsWrGxixT
         J1zQm1ygmS6CCLLRUATkbbrarh79LcnrDVlvPlhY2ItxgoekmNCVARK22ZkWSqX0HhfB
         IQZe1uefQAU1eXdKOUUJJBevBc7VsJm7BwR+gM0K6EGcQhlPX/PHLo3T8GqmWWuBzJcC
         HBOgKjy2Wxck7T6mysdVL4M2/d7Soj6dTTDUanAOFDZKPIX4VtvCp26CntiamJ3jr5zT
         5yi+OT47/bvbOT46eW5ZJulHLtxhidF97vE+TbWqzYW5sHe5VwmxXVI/q5BDkANe2JEj
         04aQ==
X-Forwarded-Encrypted: i=1; AFNElJ894qjMgEyZYsrH8ky1DqvLHDeOC9ZqURJYZpfIlgtPtKiypj/IbEbkp0fL4n2rnnvNlEQsireOG1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOIpUrkrEMVvgti/M6PSkslLsEdHjQk02JpoZyxOk8RToSKtK6
	6ol4aOTp2BM/KLWh2pg/isFrpOPvmEQmC/R0s6YqCartMEh7cvO1FHrwt8I+nysTDmnZPly/R61
	ZpAQu+z6QCAdnPARqEYYxRCpeIjS7/Wly3pVKthr+
X-Gm-Gg: AfdE7ck/6KuUhiBp8hoOB9h8CN+xbpWrzTSvlrSzi68p2010fuh38QYXgbXtOwBA648
	42ZZwTUeTupHjhZFlXMC37ui8iQ9qws8djfBdd5gDUhtGc3nxPyfsO4yaJo0K6ftpXE37Ki9oIS
	73xjFUTLtSDv3UbIlcalZ877t372uyxmZ6dFNf2Ayg+T6QcxWkEfSh5bWcGE2sJWYGr9sknRa4y
	E4PsGZ8oGt9HG6l/qlt5ymOLEti089KoCSufM/7ly+hW6anVABtieUzidtS5hEEzc6wRMfztWRf
	zeeoAqE2OHnCoCCsftn40Yp0+N/Kf3lboJoRG1MaNW32tuXl/zffHJM9kFE=
X-Received: by 2002:a05:7023:a57:b0:139:d82f:2fd6 with SMTP id
 a92af1059eb24-139d82f32c6mr811137c88.22.1782335034214; Wed, 24 Jun 2026
 14:03:54 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 14:03:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
 <CA+EHjTx2xKjheiW5VzHw_TdWFUqdJqfgu=dOPa=_yaYBMY8uyw@mail.gmail.com>
 <ajnRxuJ19OzZ8zJC@google.com> <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 14:03:53 -0700
X-Gm-Features: AVVi8CdCAqwoqTik6utb0yHbQZV7yiwfOGNo-KA9dUnC-gGzh63Sika6JXlmCvk
Message-ID: <CAEvNRgFDcwXAx0YYZOGzA+adVhtMLXaR6KkYtW=p4xL-Hp4pjg@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <fuad.tabba@linux.dev> writes:

>
> [...snip...]
>
>> >
>> > Note sure if it's user error on my part, if I'm applying this to the
>> > wrong base, but I found a build break here on patch 13:
>> > kvm_gmem_invalidate_start() doesn't exist in the base tree. The
>> > function is kvm_gmem_invalidate_begin() here. The rename
>> > (190cc5370a8b6) landed via a different merge path and isn't an
>> > ancestor of the stated base.
>> >
>> > Patches 19 and 20 have the same mismatch. Fix for all three is
>> > s/kvm_gmem_invalidate_start/kvm_gmem_invalidate_begin/.

I took Sean's patches (off-list) and tried to combine it onto my
existing state. (I'm using b4 [1] to manage these series and I didn't
know I had to manually update the base-commit. Will try again next
revision.

[1] https://b4.docs.kernel.org/en/latest/

>>
>> Ya, Ackerley used a slightly older kvm/next to send the patches.  I at least was
>> testing against kvm-x86/next, which does have the rename.
>>
>> Other than noting that this should be applied against the current kvm/next, I
>> don't think there's anything else to be done?

Should I base v9 on kvm/next, or kvm-x86/next?

>
> Agree. Sorry, didn't mean to be nit-picky, but this really threw me off :)
>
> Cheers,
> /fuad
