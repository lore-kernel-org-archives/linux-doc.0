Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D59C3D9DB1
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650362; cv=pass; b=Y7+QHguWroJLkVScU4smA5B1KJaVnwSV84hS213qY7oASI1JdSyq0IND7+hV+aSuDYryHNHCEPTMw8oOqxP3GD825uMoSq6YveMoeWehAtibk1FC9+M0TXC0ZQ3srs9lVKgYpJZkKQo4wO8ytkT6n95UAmv9AU0157xF7N7ZYI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650362; c=relaxed/simple;
	bh=JmR/CB4xNI+jcLTEmH96suuAwtFrH/css1uIDKyeEDE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE6OEoVeqVWg4hHvr/3NvEgqfMr5kuenpF9rerPQ0p9mHkBcl5RjA+ycHSEP499OM5ghHTM+iCW1l5qK1Vo8QJtISFmASdNufC8xtDeOt/z1HF474djKWhZ+ZPTOyezPISveXP6ARBfjbVDqcksskgsEf72XEtd8ESgYkE+Fv90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=COhK4qYv; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="COhK4qYv"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d590ce5cdso31342081cf.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 02:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787650360; cv=none;
        d=google.com; s=arc-20260327;
        b=SipJjffHN3gMVakPYU1TloDweI7tRp+6sJtbTOpGA5JjKLgJ5bHK/01G9Urjd8Sxdy
         Nh0MqhWfrHETmUIX3+DlmMWUt1yT2X0AHlPLIV57f3cHdUbAN4j+w21I1lvu+1d3b/nt
         YC/QBlPGyMvcPk5d8ltMU33MdAAMrsjEUaeo0zmPHkUf7qIjUoGMrykTfc5LLTa5VjLx
         GG0AJAy2Shwy9oEgJgQnbhFGTgbWNmYw2z/e+BWG7BZ8ToYsAXCKo/aVwTDjaiGIzLRJ
         k3OBuistm1Vr8j6Lg18BENxQnfj9Qf8GeSQj57D3xnWdvdwh+eZAtD3/fKNRloKaXzEV
         5Ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        fh=WL+OBuBKyuabK5qfMhvTOP8ACJXUxKR12MyMIq72CMs=;
        b=Tn1eP9fGZgg0nnNN2zKA5Ns3OYQYmRAork2xbgFKcXjpgbqDYLxKgvWOxA4hSmKMl1
         cAPQoQr/ARpAnd52RIuJwqU0qbkek6nczCx4DpDOGunw77VReDjKrE97tOcbLSTWAfc1
         HUkMNBQ4aYMZLR7ZxOf9zedw7bIEgHQ7mPQmcOJzvgYuH50PQ7N6Y6GysNcH4qkw5WRn
         N89PCV49g0YJ1+VUC4zUgpkmFu4vmHgcEWjvbq2dIiDEMy5/1Ri6jy7CpG74Be+sSMVs
         G3bGYgRXKev+sr5JsTeTuyhy9p/JljsNxvn8snplzq3vvsmtQMyx38yMIkByU7pNQKnn
         I5xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787650360; x=1788255160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=COhK4qYvOoJJr+D43V/gT5xoxYixhbuEW3sQWFOSU/YW0eMfUsn7zourAB5zEVeqU4
         0Z+t6WDhX1//5aq5h0a//I/JnlYDqcQSDi1bKpFWXYtKmMuCMMiOCvWm5LDq/Oxlf25r
         ZzNOAZyfhlRKJEan2HpB3IaWqkW52eWyIopB7wRfq9X6476P7foLCSa6fJOK+0VuKbpd
         vUbIsefHSCFqqq3++sDiLAKYscX/2UWlR712PtWS5O/PaQbqx7z0uNmkyw/E9QcvhuBV
         cEJZj0GWoUq+wO8//74+Kk1TD8EkZMoU6TI5qJIDroligGGwhyYEruhOX9xUkiRJSIrv
         UYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650360; x=1788255160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=s9S2VtazJG+pYGTSFU5ahV3FCalwRQY6f/IBOBad7r0xW7tAa848mT3ipqV6368SAm
         SuUERkewgCZ+1kV3NwrmPR5cikYMj6doFPDgOFLswVbWd6xEXqFwS8I9Eg3muQooIpK1
         423jkTryfSi/tOQ+gohlFhsMCMIvfJQ+YbM9hR+JDKPSOvQ62AT+0tBuKo2XCKRJubOO
         dIdl9BjSyHMN0OdY4lorfd2PROJcwNyPW+KjgyXCrduY8ygUPHGwCDc3oSQPjAkls3HD
         xvF1Tc3o/H9uvIcLSymp7lCPVCwQNnLiRcQ6GE1IBx4qEZ7BJNMq8exB5IzzzSQHPzCm
         Mo1g==
X-Forwarded-Encrypted: i=1; AHgh+RrXUlxEAdD0WOjPXoQco12zgStFv31wlNTc/YoUxhvhyFrzKqtbIooPd4bNtl/LEaPpWOFSpBJyoso=@vger.kernel.org
X-Gm-Message-State: AFuF++lAhMVt8Mmk1eKtAwuaWZvF9qjZoUBEG1x3BzXBjnzKfCwGIBFz
	yWkQf159J1buc+xsvRvZgIPUTFDiApsNb5n9P+2GaROtbW0nxetvFyA+5Ync7xTiPr9qUqA1g7a
	kYo5U905j6gAxQ5vPS1/WEHXsBB9UAiY1gkXFCmtU
X-Gm-Gg: AR+sD12w6oZrnSFmtRjG+cnTDJ1jVlwqDerQPJG96hVOiTcRMDek0XG8RaObjbpwfFx
	l8yo72a7oyHVWFk72CH0LMfy0UE8x8U7pHfnR8PHIG3jzMNsyjxUmss48lBOuIejrZN+2VVv5Wd
	sK2FcE7LS5Pn6+XD+wnYDgy469WwMY7UONFwRxOi6qeuOOjhvdQwp8Rk3DtkrGJnDo4Jc+Oqg1K
	MDS8jpb8BDR7/aCH9kl+7GeG0wLH1nIoGmW/Np8rxZYj6dbsOljn0/ibNedADll9OYnkj8up4sz
	KR5warAefLDL356V1K2mz+Nn4Iu7SvnPgZoE6GpEib3NsMBTBBkFozUJ3UEFKbHntd7anAWINwh
	ftTN5N8eoGFtEP6k2h/uwjCdLGEqjvIY=
X-Received: by 2002:ac8:5a8f:0:b0:51c:1eef:4fb6 with SMTP id
 d75a77b69052e-52df572d04fmr316920051cf.10.1787650359267; Tue, 25 Aug 2026
 02:32:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aohEz_1JFVDtlSnE@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-40-2fc18ee6d3ba@google.com>
 <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com> <aohEz_1JFVDtlSnE@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 02:32:38 -0700
X-Gm-Features: AcwNN1WsNauanv_gwVuUewgYIPtJyz0xA7nijfgKendDL3I7JaxAnreMY2X_gzc
Message-ID: <CAEvNRgF8XE2Xsn-g3qzPxcdfLdvJEc1FZw9LQ+deeXsFpdZsOg@mail.gmail.com>
Subject: Re: [PATCH v10 40/41] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Aug 21, 2026, Xiaoyao Li wrote:
>> On 8/8/2026 5:53 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Ackerley Tng<ackerleytng@google.com>
>> >
>> > Update the private memory conversions selftest to also test conversions
>> > that are done "in-place" via per-guest_memfd memory attributes. In-place
>> > conversions require the host to be able to mmap() the guest_memfd so that
>> > the host and guest can share the same backing physical memory.
>> >
>> > This includes several updates, that are conditioned on the system
>> > supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
>> >
>> > 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
>>
>> If I understand correctly, even with in-place gmem, the model that shared
>> memory comes from the userspace_addr and private memory comes from gmem can
>> still work without passing GUEST_MEMFD_FLAG_MMAP flag.
>>
>> Since this model is not prohibited by KVM. I think we should keep the
>> testcase for this model to ensure test coverage?
>
> +1.  Deprecated doesn't mean unsupported.

The original test case was for non-in-place conversion, which wasn't
removed, it still passes.

Is the ask to also test, under kvm_has_gmem_attributes aka
gmem_in_place_conversion, to have guest_memfd used as purely for private
memory and have shared memory taken from somewhere else completely?

I can rephrase the changelog and change the code to clarify that this
patch is meant to specifically test in-place conversion with MMAP, the
intended usage of in-place conversions.

The ask to test gmem for private and something else for shared seems
like a different test that can be added separately, perhaps in a
follow-up series?
