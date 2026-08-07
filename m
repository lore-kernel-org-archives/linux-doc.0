Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42823476CCE
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104929; cv=none; b=ENgvqCyPkHDNKAlHYjSgT+MVjc69mJKqnHyml4+teIhz4pRl5y9Aci+UNJ1MM9JuV/WTcUfzySb91cVWRFsFt4XndpD6lvQUIi/O2cgVs6x8vSfuwr+QUON+4wHcNMwnXd6I3JUpZ4G+41oSDLEhK4ui5MGKd+0fBgNA7zzcKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104929; c=relaxed/simple;
	bh=Axb9P7ZeqXIDv/YIhN5h9W5JoZulVHyBXtBYYWbUvvs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=WMaeqqfQXXTp6gY8Emz4YBUR0LpDytdeM7NO2WJRVTDhSZF+nty7jGF4ZRytXFr79ij9CcU+6dsGmNStMXBcZFp81QpCqQbU85shklyHNU262Qbb1O+Fz4t0x87nDiH5xmIjq8t77ZFBv77r+Sh4PaxvLU5tDfPnhCZ0KrnP+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2zGDs8j; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2zGDs8j"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2391012a12.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786104903; x=1786709703; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c0uexmqzAqMMSI/hDk3D+mxEC3THwEZ/LbKJuycr+4g=;
        b=K2zGDs8jnFRVhM2XseS2Ng0eDrRZDjctENSF8MHj69AttBphoT32wybOOxOwCWJJ59
         cvE83dKnlhO8p2Sw+vbYRR4R4D28b8doe5siJk33/ymw3ZOMPiyLtyorIRTQK16LHFa9
         4w5pk1dazr+HAMUU1GpfVa2XP/CfVzKwVJk70/kCV6G78/R90nl6qJifkbqdbNtSGQ6g
         ZoKypfAmeRTk2l4dNTeVsuLTYZIRTzuWRi1+X5IUY78ztngySgCIZsNT/YA01dU+058o
         2lVsDd7MhBCXZuRNl1COkYgX/Zd6Bts0+8oAT/Dkxq/mhd7J5Kz/nkZ8rUQ27JofiA8n
         RU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104903; x=1786709703;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0uexmqzAqMMSI/hDk3D+mxEC3THwEZ/LbKJuycr+4g=;
        b=fynxI7IIlIoyfdDfbn0ml4PJ+Q53PzYyYqmkc6m0QhGSTKpvtScO0sNHwgw5ZdKrfc
         a3bm7mYnV9Hk/275NY3aA34DT3A0R59Xj09UtQJ6ViMVNbvIH1prTktmlE35+FRQYVcg
         W6eVbkTOLiK620FqJdLGq19wxERx7uRsPgrQ9qUyuMHfjyJqXBu9PwiAn1GsFxYSSwL1
         0VQ0zO1qi4p4459PJuEId3BHdiO+EnqATpZ4kddzD6gQtzTnUSfmTDoUIxp4BhiBlE8p
         fKPhAX3Wnsv3Ab4SzqYZaqTds2Tgg21zRXLfnBALOkqoVRg2I2F2xokZ6nGLcqeQmSmR
         OOsw==
X-Forwarded-Encrypted: i=1; AHgh+RoDljI+ogvydFFEqJMKRki8416iZWT2Aq8SsYF3uXO/PJzUWwfVTYd8duy5YWn8zaCem9pRSrgiW5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBbFsTojPfZoWUABM3y/es1svlYeIzPd0gsGNrzv3nBFm9zxNF
	YqXBcZQJ4Ts5mFIX8FiI8xTLeAYaymF/sJGGsIS/63sa2TCbxXCfOyis
X-Gm-Gg: AR+sD13jTwTru58QYSGBdvm3x4vzHgBg1tgTHAJNV0kwLCrVb/LtPTKF5B5HwDd6rJi
	vcd+A37Smizq0B/7mJfhM2k6qoWWD7JCjJR47OVuUrqBvVRtjXpMBdsiNMrYLMVYW8srFTe+WR/
	Pte3VOvzNFE4OuqNfeCrBIbY3Z7iVW4xnBKWxgIPqfYdWClA7BkiGz3Hv8R3LYOJZCyk2qKuilV
	rk0rUvfElZsEobml48yGNTwZpn79SxuRZ4sm3T2+KffzQz5jt+AlvN6cZLTHurCRkBlU1dLHuWZ
	Z7FwpV0aWTfw5JrkkVFUzYAjZQJZMR7z41uX/llb9Baw+Qra2KctueNhuvKPKPkIb+2eD4dtkxr
	A4IED6523/2/UHeaGStz7nPjj6qfaQIjwSKgJl9fOZi/BChvrijlKTxxajIPN1mFyOth3/qTJUH
	NKoMUWin/F68O2SgxxFh0Rm3AW9/4Pkr7TEzk4UaeYAjoV9W0W5a3V3E9iVJc=
X-Received: by 2002:a05:6a20:2450:b0:3c3:89cf:f43 with SMTP id adf61e73a8af0-3cb85eb92a7mr21944976637.30.1786104903263;
        Fri, 07 Aug 2026 05:15:03 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3fcsm7231096eec.4.2026.08.07.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 05:15:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v7 3/4] KVM: PPC: Book3S HV: Add support for compat CPU capabilities for KVM on PowerNV
In-Reply-To: <20260807170704.3280f54c-e2-amachhiw@linux.ibm.com>
Date: Fri, 07 Aug 2026 17:43:07 +0530
Message-ID: <7bm2ku24.ritesh.list@gmail.com>
References: <20260806170645.11892-1-amachhiw@linux.ibm.com> <20260806170645.11892-4-amachhiw@linux.ibm.com> <bjbeledh.ritesh.list@gmail.com> <20260807170704.3280f54c-e2-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> On 2026/08/07 10:24 AM, Ritesh Harjani wrote:
>> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
>
> <snip>
>
>> >  
>> >  static int kvmppc_get_compat_caps(struct kvm_ppc_compat_caps *host_caps)
>> >  {
>> > +	struct device_node *np;
>> >  	unsigned long capabilities = 0;
>> >  	long rc = -EINVAL;
>> > +	u32 cpu_version = 0;
>> >  
>> >  	if (kvmhv_on_pseries()) {
>> >  		if (kvmhv_is_nestedv2()) {
>> >  			WARN_ON_ONCE(!nested_capabilities);
>> >  			capabilities = nested_capabilities;
>> >  			rc = 0;
>> > +		} else {
>> > +			for_each_node_by_type(np, "cpu") {
>> > +				if (!of_property_read_u32(np, "cpu-version",
>> > +							  &cpu_version)) {
>> > +					of_node_put(np);
>> > +					break;
>> > +				}
>> > +			}
>> 
>> What happens when we don't have "cpu-version" DT property?
>> Check this commit
>> 5a61ef74f269f2 ("powerpc/64s: Support new device tree binding for discovering CPU features")
>> 
>> And also why do we need to parse the DT properties again?
>> Shouldn't we check something like this?
>> 
>> 	if (cpu_has_feature(CPU_FTR_P11_PVR))
>> 		capabilities |= KVM_PPC_COMPAT_CAP_POWER11;
>> 	if (cpu_has_feature(CPU_FTR_ARCH_31))
>> 		capabilities |= KVM_PPC_COMPAT_CAP_POWER10;
>> 	if (cpu_has_feature(CPU_FTR_ARCH_300))
>> 		capabilities |= KVM_PPC_COMPAT_CAP_POWER9;
>> 	
>
> Thanks for the suggestion, Ritesh! After closer analysis, cpu_has_feature()
> would give the same result on pseries, but I believe that using 'cpu-version'
> directly is both more correct and more explicit for this context.
>
> Here's why:
>
> 1. 'ibm,powerpc-cpu-features' / dt-cpu-ftrs is baremetal (powernv/OPAL) only.

Arghh. That make sense. Thanks for checking.
The design with "cpu-version" sounds good in that case.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

