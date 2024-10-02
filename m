Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE411EA80
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727880860; cv=none; b=RE6s+3NQ1Utxaat+6p50alW2wY/qSMp28zIxLDiZJiq0mq83wyEK/6S2o4LEC15hPn9Z5C6gubS3y/Cv62a4YrPl+v6SPuzOEng+kYcg8LQQ0bU1X9SPuNhcxppvGHIkHV0+V/QQs+XOfVBVzZHQi6BgYCBUW22TII2Zx+c6208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727880860; c=relaxed/simple;
	bh=dDOM/miESTYcTc8d+P4O/cys6mYe2R10ZJE2IWdvkSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdTqKdgh2Si+qvUq0RHY28eAWRdRBZzAuXh/n6gmkNqgAKt6Xfyx/2fg2EzzxiRxI4Kh4teUaFgsJuvGfFlU7X4mUDBGI9SbRtuiql6xJHO1fMJ3p7iLW8qTyHpOGWUhvtu97lnWeV0WjZRx3uC46WZr0pISLzthBkHWB/ap70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V/LyAKnQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V/LyAKnQ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d2daa2262so774763166b.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727880856; x=1728485656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbv3ILFUVeEmssaFHftgOo6dWe6k4rKzxdcBQPU2ScY=;
        b=V/LyAKnQnM7BvWBfd6m2sLV/gV9OgaDcchOEJcpXH+zMms96BxWLyhnyhKDLBDdYQj
         V5YVSScPxac1qxnVlAtrNImOGDnncKPtnxFGyvMSDMlJEGpNmLAoRDcUx386pM28OfCK
         hTBPyJBN4zF2A0dZePGOF3dqJ/0rCEB87maJRBRvr8GhCzmw5WanRvqLDbkLjugVu6qv
         E3qL2yu9ixnNurgzTBq51AGp2Hwq3xP+qKKbwl18nv5DQ1nKDNSFvCOCuER7jlfcGuPA
         EgkSPoBFVJK9zk66laPni62x7Jha9MnTmDN4AUc3xuPzox3cVKVBDvZZJJLcGvCmWOlC
         pLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727880856; x=1728485656;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbv3ILFUVeEmssaFHftgOo6dWe6k4rKzxdcBQPU2ScY=;
        b=Cr5Jq6cmcONvJBqettt2BBXpouYQVA/gG+Mdo8yxt1ikC6d3+ZV/AlpqN2hiq+cqpk
         Yo3/vABUXQX0azoT1p+Thp/Vl4Agf1CIykvVVkPqcp96H36cAiwzJcIezHbN4Nesb6t7
         WShzZhrQIjSMb77Ofr3/RsLQ57j6aFQrd+e4YMzg5CPkafwbv2iJ1T2wGj+P2NrZrr51
         LbF2B4oVqMWwxWgMMvqBUF7DJS5ty0+dX6EePsuwxjDa0rRnAaz54tgfwQp3VEMRm+IC
         s5y60ugFwespExjMsHi6HWHIB6AX4UtLLvErsdycejklRDaMw2NKTSDBo0q5GXLOA0L5
         lwIA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxD2qPZnxhxGDsgpjAfSVr6xEOS+ITr39waayV5FWMMA+BFwxTuyvpNVEvno+vKIPvYQNnSKevEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkivpCOI3P9lPPNVbbxl6vfwnd/bnBr/9JBWmPd9Vc7Y57i9l
	eO6kt/qT/CGpnkIrSKLxw10JWuxp4LUIu8Zp/WZJvimgP3CRArn+MAli/3FKyLQ=
X-Google-Smtp-Source: AGHT+IFoM2JxYmW+j01WwZCBfufK95aNjZnSyv8OBtphS7Log3eS4QA/UaGnv4HDmpWQz8FsbSyE4A==
X-Received: by 2002:a17:906:6a02:b0:a8d:3338:a48c with SMTP id a640c23a62f3a-a98f821e810mr331037266b.7.1727880855998;
        Wed, 02 Oct 2024 07:54:15 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:75b8:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:75b8:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2946bddsm869783366b.123.2024.10.02.07.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 07:54:15 -0700 (PDT)
Message-ID: <b5093703-1c86-4706-9e54-b6d2d413c417@suse.com>
Date: Wed, 2 Oct 2024 17:54:14 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/bugs: Clean-up verw mitigations
To: Daniel Sneddon <daniel.sneddon@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: hpa@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 pawan.kumar.gupta@linux.intel.com
References: <20240924223140.1054918-1-daniel.sneddon@linux.intel.com>
 <20240924223140.1054918-7-daniel.sneddon@linux.intel.com>
 <fe2dfd0b-6b2a-496e-b059-0600d2ae474c@suse.com>
 <fdda8f74-4d9a-4aff-ad5b-c7a1f2b0ab0b@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <fdda8f74-4d9a-4aff-ad5b-c7a1f2b0ab0b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.10.24 г. 17:46 ч., Daniel Sneddon wrote:
> On 10/2/24 07:20, Nikolay Borisov wrote:
>>> +	if (boot_cpu_has_bug(X86_BUG_MDS)) {
>>>    		mds_mitigation = MDS_MITIGATION_FULL;
>>>    		mds_select_mitigation();
>>> +	}  else {
>>> +		mds_mitigation = MDS_MITIGATION_OFF;
>>>    	}
>>
>> BUt with this logic if CONFIG_MITIGATION_MDS is deselected meaning
>> mds_mitigations will have the value MDS_MITIGATION_OFF, yet now you will
>> set it to _FULL thereby overriding the compile-time value of the user.
>> So shouldn't this condition be augmented to alsoo consider
>> CONFIG_MITIGATION_MDS compile time value?
> 
> CONFIG_MITIGATION_MDS is used to set the value of the mds_mitigation variable.
> Same goes for all the other mitigations touched here. Those variables are
> checked in verw_mitigations_disabled() which is called just before this code. If
> all of them are configured off, we return without enabling any of the mitigations.

Ah, indeed.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
