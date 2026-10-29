Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793279032;
	b=bQo5UTmPCV7kp6N7qJWcEiSv+vLJlCufe73E2z9Gd3HIcfUA2yswXiVNSbFjMQWnwlUO
	 56yZK9Z6lFuWMs5dLoeNhTJiQRc1Us06+BQxNtAb6FjpEk5sdYgIxiEYQgol7ayNIneQT
	 3r75ffSWYkLnd4shVUs1yEYSUFNyA8AGDbk8RbU42uJx72FDaqWJAhUhXbF6njHM/BXtC
	 TxzUDE5RVQb4/v1vPld+zzH6pQofJUB2O4cNf8qPqyCtffSzPV09VnVD3zEXF/REeAkgh
	 qUd/hzweOz0y1QFbYIcPyec8dVUiGPw2KtpAzLZg1yg8m/Cdqy5IA+BewVEquDijvaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
	b=WvMmIBhAaOqbgj6gfJOt5By5JFh5sb9VuGUUUB1a6hnpPNstPx9mCDblyLzeYtxSrNe7
	 TTS5+6KSCiaMqdQ/yfJJ+Y4F1bbFqCT/2faiAkL92xwPZjYuP63hi7wczzpx25wzMQbOH
	 sJH7qfcmcRytIqBUmb5rZuJVOR6BCRlUXBLZgq4+0B7qxhzYHELcfwbTAfyIWPG+fbgBa
	 pax6nTls80K6frjkGLkz0DExOtbva/D1+oXTxkIGPuiqSmBwOKdXXh+SvNjudqk5O66WT
	 5xC176kmxLrq5HZh2JMes/s0dZ8AN/plJPspZPYLZ4X/AXR2KfK8yKyDN0n1h9qntOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JwJdO9ql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF234606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF234606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JwJdO9ql
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53c4b82919fso28757201cf.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279031; cv=none;
        d=google.com; s=arc-20260327;
        b=I+NZ81Z8q9Qyui43/mOUTRcjMNZO/CaFC9jf8mI57mYFttkfEfdl8gT1ZV6o8edU/Z
         3Ee/FNVy9Ji+yp85NJJH8Uryt03hHNboBodi/L33jXJx8QGYUWhZUEW05TstIVCpLZO/
         m+k8Ldp4xCLBNI/A0j9eXNmAAWZUV97L2Cls08bNuoXIduJ8P18GhMzzWAaJR6RqfUwo
         J3uBY3iNZ188IGyO1ck9xWhk0UW++lQ7Nmd5DLTAB9WQkJ+vAuY3adM/Kii0DSOzx7tK
         WMXDiMt1UP5jYozK8cIPcJ1EQEs5aGp3MyTrACKa9U2D1q0QlsvAMvbHHL/Twc18keog
         8iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        fh=MoaD1A9TO4mAvAe86bLA8NifGcjy0QZWmNOmjCjMl8I=;
        b=c50SajjCpIoMtuf7b4XixY/myWRWS3PWiFduoVHZVdV68II2I6eNKf+Hsd3OpGlpvt
         x3etwydaBFVgpGCFZlm9VSm3Qnm3jf11K/1CKZQaKPaWv16sPPweTIgPyqxW40jBzbiQ
         yB9tMttxw9I1g8zWtKN09rQG1p7R8DfyhLYGtwa5H0JDZc/yymz1ruvYhPOi9fiySeD/
         Zc/QXBIuESpRxrOLiIlbg70+jTaWKCoRy2agPixjxhNs5w8ZQJG5G+IPOrKG76rIYfof
         XMMuzGBp57HexPBLzPmYGfr7TlsJQG/TShpSogtiBjU9cFaPb3ua3oy8Hp74Lxx2mnJp
         UxZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793279031; x=1793883831; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=JwJdO9ql3YoIt8zBMbQ6DcJiK3EoGyjfaD6ow9t2eimSe16lwkFLytNpDFUYAxsnDt
         3bYWEvfEvItDKw4/vcQNM1jcChKI5VezLKcavxFZXDgJIN84p7qOtAQLcaE8aPu2ERV+
         spbJHkPKs3VKst9LDrg8YDAHFt1URkPgCvuplhNhjRtFZmIpuQ7G7ke2JiXwiA+GoOAB
         ksQ/PnIZDoxNjOSLzXgf9b4dyCgDDKYSil8+bD8yfQx917mFBt95+mZW8vbMGMJmP0bt
         wUmhD+c8be1LIGTAPMbNjX0SGz2hlFPr1mVCp4kSHnfj38fHX9YK7dOCxx1glkqbWcO7
         /w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279031; x=1793883831;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KF90/0GARuMWHyMTMB3Xwv0e5GgnH85LGW7qmrj44J0=;
        b=P4eR9oVrz0H6QdT5RyawCN7Jkof7GmV1cvbjDtQmSzoLKcw+vWp3B4O9N/yu09erkQ
         svV+4zgFnz8jgEc1f7hPBMm6M1Si2dGd4cLMtEGCiOpB4Li/za2d6Sl1AYtR8irU9LV6
         JTqJNiCn9mn7oKiFopTlIPpcX+Asj47yw2B2AMn6OrVwR+gqYHLlVoSZdP81X3TdGCqN
         xK19HAmZ4N4RtdY8NU39wjT+eiC/Dr73jEu06xLvFzerd8cvcJZr2AxVht984ciMz86H
         goBjqKfSXclhkZgsKXXJUi0nTv3FBZVsLSqvTVDhqSMYkIqrolQ1eUfoH7DWbbJL0MuD
         wVlg==
X-Forwarded-Encrypted: i=1; AKwUvBzT/qftL6xhAOVWoAyNZTQjLEWm7sHa4nmr5c8mWJHKK0p1XlBIiQGCu7BbvoFPh0Cxhiq7/TJw/Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhVLoAZ92KamAqc8twqUDoAE5bRqfecsNIrrFS3uIVcLm36QCf
	p/O5Ce9FK6JDcR49v6m4wyu5AkjMxpcdURhqLWPq5qalNvFLmhpOrad6jQE6b2qReDq+DwkQksV
	SgKNOdl91r8KIeICLTD2zvznetwIQNkvf6f29SSRk
X-Gm-Gg: AYBFou07uwnZz6vnvlPkoMRurukM5QMGIsEBeOnPC/AEQXCmGAj0rJ2/D/u4U2POv9u
	yd+uDhils46MeHfib6ObVbtsVMAEWylupcfQ2NML9tajF70M+k+s2WTSfbb6LPXrKj62DauaBAP
	tuJHl+7Dm/wUbPdvkE4EfoX/cVY7SBEDvko3wb6gWBsp8j8hJAJMi/ehHp7HoYcd+u5JzUbyXc2
	9HoAsOVt1QOMocg7lBZ8Q3VQJ5TtnqNpbDQY+tQnCjVp1WPYR4i8Z4RDkK2y70YxJ50FzmclbX6
	i20lXkNjX+dyWYKe09eEIrzcC8cTEj/6R5lk0nZ4ukxjZx/EvCTiRhE0DFoY9uUwher4/Dy+VHO
	ytX+zUr/2hKqJvNC+Dl8rAxQaAtgXfXDCQooL95LugVduieLljIE=
X-Received: by 2002:a05:622a:528f:b0:537:b9f5:e05 with SMTP id
 d75a77b69052e-53fcc7cc0camr87903901cf.69.1793279029444; Thu, 29 Oct 2026
 06:03:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 06:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261027154649.91571-14-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com> <20261027154649.91571-14-griffoul@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 06:03:47 -0700
X-Gm-Features: AclHuK_J4_B8WHMj3lc3Bqk_zMBRzyMWVypxyBk9aFiFYwwISWnD_-KRrJmOcto
Message-ID: <CAEvNRgFYecSKycFLkxwyK7gWZqKTXTPJVetSZm8YBbo0kg9tTA@mail.gmail.com>
Subject: Re: [RFC PATCH 13/14] samples/kvm: Back absent pages on demand in the
 sample provider
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Alexey Kardashevskiy <aik@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Connor Williamson <connordw@amazon.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, David Hildenbrand <david@kernel.org>, 
	David Rientjes <rientjes@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Erdem Aktas <erdemaktas@google.com>, Frank van der Linden <fvdl@google.com>, 
	Gregory Price <gourry@gourry.net>, "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	James Houghton <jthoughton@google.com>, Jan Kara <jack@suse.cz>, Jianxiong Gao <jxgao@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Joey Gouly <joey.gouly@arm.com>, 
	John Starks <John.Starks@microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Lorenzo Stoakes <ljs@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Michael Roth <michael.roth@amd.com>, Mike Rapoport <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Oliver Upton <oupton@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <shuah@kernel.org>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Tycho Andersen <tycho@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, x86@kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Fuad Tabba <fuad.tabba@linux.dev>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> From: Fred Griffoul <fgriffo@amazon.co.uk>
>
> The sample provider fails get_pfn() for an absent page and keeps its
> frames on a punch hole, so tests cannot exercise a provider that backs
> a hole when it is asked for a frame, one that backs more than the page
> asked for, or one that frees the frames that a punch hole gives back.
>
> Add MPS_NEW_FILE_FILL: get_pfn() then backs an absent page with the
> whole 2 MiB block around it, and put_pfn_range() makes the pages absent
> again.
>

Can what MPS_NEW_FILE_FILL is meant to illustrate be illustrated with
the ioctl that sets memory present?

> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>
> [...snip...]
>
