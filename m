Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A73A0E85
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905642; cv=none; b=YanM1p56KQvX50+woCuSth2sHR6eBg96dRxXEGKzh8IwiswuHnPUgipCBHcjtUGpaCKoCGy7cPDdDEn5jZ0MlIFggEv6awR8ChxeHRbPxu7TTXNFMEXecQGpU9e8fQFDAq7aPZeNYQlCy9XZcO+RkaJ+zBa5aqdw7ofcazaTcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905642; c=relaxed/simple;
	bh=AhNDDZecnmD2xFm+TNWATlQbxsUvN8KlFepA01COIwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j251cJEAbPnRRIdctZSplN8NkcEIplWdlxmDwL2qkg9yMrHWWFt5jqZgIw5pktRPoRO+kAT3NrkhsuEYC4eJeWcIpKR8dryFEnnBzKs/MNkihrd9N+GOcmB0me7GeXGcPycoWLADsvMSn1UmcGMvTFEeWCCNvKnuqQviPi6cK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvOkIInU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvOkIInU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b4915161fso516886f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773905637; x=1774510437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfnoZII81lwHDQG+q8k3CqLmv9bwI5/ooG/r2BOJypo=;
        b=IvOkIInU/YzZLqaHZgSxaRamre1CKdkvdI70PFUfeH49IfziLVMMlBx8JBwXExRU+I
         gVRhh17h9JfspgTMMC/rrvpb6csmLx8UMmMITDH5bpFdSylsCAMhN1Lb8AzT8GzNRKmr
         N+tZrhu9OWY5JmnPNsVUJjwjoIu07UIG/l/+kGr0XiojwstpSLa9eE3RBkwl3qeFJmxu
         t0lzdAmp1R867dvF3FnUE6WLp2dQXwUnWLam6WCwjp8wJ6DKtsj1brcR/9puwlQMk37V
         sffUCzBXmHbcM6FgB8e0rvmV9AhfAia6M6odtwKzHbGlQfiiTnQpney5fyj3ZKr3Mj/L
         UTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905637; x=1774510437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfnoZII81lwHDQG+q8k3CqLmv9bwI5/ooG/r2BOJypo=;
        b=AVXrXb9O3TF16fdD+S4xW+1Y3G+ixnKKqs3un3raTwg4cpZXuq+WX0T/g5rPhgFaY/
         5SPSKpXvD8YdEar7S9p7Jd+gkaWye8DkXbTqNVsumr458cynR+MTnAWHedF3cczO6j5y
         fMaStv8R5ZXMmcmpj2ca5F8zNEWAPm747I25Cxtz15Dxh+GNYzgscbzwnfVAOEfoxz/6
         H31B9dn7kqcvXBJfLmiCOanNHIfA2Wr39SfOTk/fW+eSea12ILNNOPitK7SC+3Fpirwp
         AN+8SYbNfyaFsPKMZPqHPCrxVj9RnHoKpgwuPHJYvfeay0938Q7/TTfTb62lKdp2tJoL
         zTUA==
X-Forwarded-Encrypted: i=1; AJvYcCXW3UicIKi0bLyjXIKLcIX/rNnJeh0UdzS8XbpnKhcpTwBwSJZR8TmgN1mZm6eIZQlXin+6dN97KE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFpOgsCUmJl9Q304ApPHwgXJDoNHWoxAAe8bMd1UI+hO4+CzX
	TBP0J11Kd0I+KZEMe4TTve8hJphdWEGEDIKicQe70NMv1fUNOlpjju3n7UkkiTBM3fg=
X-Gm-Gg: ATEYQzw78pmW44cVqriNAxuCIIQ1n5gp8+Ib0q4YUkM8oU8wIJTgQFz1OlARa8Fr8zE
	F/0fbUAYefv88yCbcPUypkhG1Ku6jttQCNVuVW71fYFrfgcJCm7hnn7E5JgKSLCU1JJkD1cIpcV
	WA3pc/5OFoVLkMivvNbqsLOXH6HI6j75ztI4DJlIQUE38k2qYXFLWxDmzSy3cugF6a8OHtl1us7
	yZsf9J0HYpv8/dgiGPhXvGlzib8i60JHtlWXKURryXSHYfrGZMkPv+hjWgL9DaB2znx6UhKKPeO
	N9z9PM4FpkUFGSrnFQUB1eUt4X/fpe519FY0zBXuEY0r+vXPskMK3RErolU3HYTtZBc1hX8UOSh
	JHll+JMtqoOIMh0ZBfkpYGUUBLPuxOfC5y3X76Nyc5OsZQ6psICCZK/sz2PKfm95Slh9/fKIb4d
	J5paDsfu2YvJEwEnOOa5n7RpPlVqwnynM=
X-Received: by 2002:a05:6000:25c6:b0:43b:4ae5:d7c8 with SMTP id ffacd0b85a97d-43b527a50cfmr10368836f8f.2.1773905636943;
        Thu, 19 Mar 2026 00:33:56 -0700 (PDT)
Received: from [192.168.0.34] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899622sm15875212f8f.28.2026.03.19.00.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:33:56 -0700 (PDT)
Message-ID: <46c47101-2672-4970-a212-71e2c8555d80@linaro.org>
Date: Thu, 19 Mar 2026 09:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/25] Introduce meminspect
To: Bjorn Andersson <andersson@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <abdnp90cC5PI9wyz@baldur>
 <20260316181647.m7x4ncmwdjho6yvr@hu-mojha-hyd.qualcomm.com>
 <abtlUQqMOxj5PwGB@baldur>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <abtlUQqMOxj5PwGB@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/19/26 04:55, Bjorn Andersson wrote:
> On Mon, Mar 16, 2026 at 11:46:47PM +0530, Mukesh Ojha wrote:
>> On Sun, Mar 15, 2026 at 09:24:39PM -0500, Bjorn Andersson wrote:
>>> On Wed, Mar 11, 2026 at 01:45:44AM +0530, Mukesh Ojha wrote:
> [..]
>>>> , to get all the regions as
>>>> separate files.  The tool from the host computer will list the regions
>>>> in the order they were downloaded.
>>>>
>>>> Once you have all the files simply use `cat` to put them all together,
>>>> in the order of the indexes.  For my kernel config and setup, here is my
>>>> cat command : (you can use a script or something, I haven't done that so
>>>> far):
>>>
>>> So these need to be sorted in numerical order, by that number at the end
>>> of the file name?
>>>
>>> Do you manually punch these in? How do we make this user friendly?
>>
>> Yes, manually.. but I think we can do better. We could make
>> this more user‑friendly by using the section header and string table in
>> the md_KELF binary both of which existed in the earlier implementation.
>> Then, we can write an upstream‑friendly script that reads this KELF
>> metadata file, checks whether a binary with the registered name is
>> present, and stitches everything together to form a complete ELF that
>> the crash tool can consume.  Let me know if you have any suggestion..
>>
> 
> Can we somehow identify that these regions belong to the minidump and
> teach QDL to build the ELF for us?

We could integrate the feature that Mukesh suggests directly into QDL as
a separate command
e.g. qdl download-and-build-minidump

The first region (the ELF header) is mandatory, because all the regions
themselves contain only data. To be able to use any of the regions, one
needs to know at least the physical and virtual address of that memory.
And this information is saved in the ELF header.
So QDL could join together all the regions into a single crashdump-like
file.

> 
> Regards,
> Bjorn

