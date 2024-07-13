Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C858BFF
	for <linux-doc@vger.kernel.org>; Sat, 13 Jul 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720879248; cv=none; b=LHjipVpdBV22t7LkM33XyTppdwW6Q8N5lrqmqRUXsKDTo/oUWCLkjq1a9XwYEq3NWxX3DDlYhRoua47QY03XzOQRhgXB+yxWfaa5hTF8CvKx90SfFraS73yN2+pyUkeiMapNnp8KL9aSR3c9G9CV3mMrjGD5PDYEdP+fnS++pTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720879248; c=relaxed/simple;
	bh=r5lGOjgT5uLqu8REsWqs+Y9CdWQ5tNLhWl74AZ1XqOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alNzkDFSxW2RHmjx22tSlCVwMokHvu72EFtWDYcMeJWckfbx68/sClom3v4s/qUoH3rcxhUbz5SIdIecHbt3S/PU312NOYPU39MHOK2NuOgEbocMLIZbUPrJ7ISLKbbx9zsISvGFXebXRcKqZO6rBiDm1h0m8CQc6kuhxXBT75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=EtD9zI/y; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="EtD9zI/y"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-25d634c5907so1695785fac.2
        for <linux-doc@vger.kernel.org>; Sat, 13 Jul 2024 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1720879245; x=1721484045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MB9URCEqqudada+qa1wxvDyMrOj1iFWXQ/v4RlOO34=;
        b=EtD9zI/ywQLaZm5btQSgGh3rVy1Lp2uF41oDy+mxP3RHXFjLBvCtDcTJg5QOX5bbUY
         NT7qwR5iIVS56Jw3HPqv9WY4MLHGP0AkyME1naFizIIcLWGFL/KbKk7TrgxWw7MtwEP0
         m0bi55RdDe2CmRnvPOuC1+FvmFN+stz+Khq5ydZJED/+t27EX4HGmjc5ioT0TpUmtLm1
         QaVrQe1wlq2Wzq5gYp2iPv5lCU/NhIk8BME9O6A6CCUEskQmM1prpfoPq71EzT8R2gAM
         LjHzYCd/YWgm+L8Idz0GblY/ozAjJRDUvFPovqZM5u6tG8iloKY4fYHycz/Z5vaODOGS
         3Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720879245; x=1721484045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MB9URCEqqudada+qa1wxvDyMrOj1iFWXQ/v4RlOO34=;
        b=BJVGJ2K7y1ffH6ZfCYIcZiBRCAniVRcDQK4McySNjcNYlOphc0zBGHavWSmThGvQyn
         cYaYFylywBuFeu4thxr6gAbmFkz+HSpyjBdL/Ws2bB3vCXqR4gnYtCWQ3lIwQNTOQ8q+
         hM2q2u+alaSBWeXdMMUFnRLSjK97hZp+LAb9Iu6In4xBwkCTlF/TPcv/VrC/NxtQKFLD
         8HQ0jpSLMA9Q/hUIVUl42TAdlsyVRhr+FX+JS4dCQIrwTKgG6HqWg2XbVVdv+uJgyM2U
         7baFWQsuP+YecftCJhrFub/HOAT1A8mLwX+Odqw6XbyGyZYWDZrDkprtgxMF/vqvN1UH
         COog==
X-Forwarded-Encrypted: i=1; AJvYcCU95cN8paAPNY/jCM+ZiD5vbREMyksn8WppW9cIWvqMd0ItrHkpZaXmsW6QIZpoROfxnTyx4dhLygoW5nnV95j2heuM4AhFuCWT
X-Gm-Message-State: AOJu0Yxi9CHAydua3lKYuupms80pZthR5aYW6Tt2jNfnJsuP4/m7Almz
	lkOYBJBVu26PAJknrDDUcuQrzf1LJ5t15rEhAR/g5p5juyLDLfUXzQl0F8D+i54=
X-Google-Smtp-Source: AGHT+IE06bXE66ACQQ0PJhjCztRDwyWNUdp2P64UQikCEcfdm9ALzdNjzr0pqNjCPRvNshFct+R/4Q==
X-Received: by 2002:a05:6870:638d:b0:254:c842:46f0 with SMTP id 586e51a60fabf-25eaec5538dmr11200811fac.59.1720879244572;
        Sat, 13 Jul 2024 07:00:44 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26075176419sm247933fac.31.2024.07.13.07.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jul 2024 07:00:43 -0700 (PDT)
Message-ID: <236c6306-0d7d-462c-a127-0d130230b961@vt.edu>
Date: Sat, 13 Jul 2024 09:00:42 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: scheduler: Start documenting the EEVDF
 scheduler
To: Randy Dunlap <rdunlap@infradead.org>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, corbet@lwn.net,
 sergio.collado@gmail.com, peterz@infradead.org
Cc: jembid@ucm.es, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240713003213.4008440-1-carlos.bilbao.osdev@gmail.com>
 <20240713003213.4008440-2-carlos.bilbao.osdev@gmail.com>
 <201d597e-e0c7-411b-a29c-dfc3111aa863@infradead.org>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <201d597e-e0c7-411b-a29c-dfc3111aa863@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 7/12/24 23:22, Randy Dunlap wrote:
> Hi,
> 
> On 7/12/24 5:32 PM, Carlos Bilbao wrote:
>> Add some documentation regarding the newly introduced scheduler EEVDF.
>>
>> Signed-off-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>> ---
>>  Documentation/scheduler/index.rst            |  1 +
>>  Documentation/scheduler/sched-design-CFS.rst | 10 +++--
>>  Documentation/scheduler/sched-eevdf.rst      | 44 ++++++++++++++++++++
>>  3 files changed, 51 insertions(+), 4 deletions(-)
>>  create mode 100644 Documentation/scheduler/sched-eevdf.rst
>>
>> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
>> index 43bd8a145b7a..444a6fef1464 100644
>> --- a/Documentation/scheduler/index.rst
>> +++ b/Documentation/scheduler/index.rst
>> @@ -11,6 +11,7 @@ Scheduler
>>      sched-arch
>>      sched-bwc
>>      sched-deadline
>> +    sched-eevdf
> 
> I would have probably put EEVDF just after CFS instead of before it...
> whatever.
> 
>>      sched-design-CFS
>>      sched-domains
>>      sched-capacity
>> diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
>> index bc1e507269c6..b703c6dcb3cd 100644
>> --- a/Documentation/scheduler/sched-design-CFS.rst
>> +++ b/Documentation/scheduler/sched-design-CFS.rst
>> @@ -8,10 +8,12 @@ CFS Scheduler
>>  1.  OVERVIEW
>>  ============
>>  
>> -CFS stands for "Completely Fair Scheduler," and is the new "desktop" process
>> -scheduler implemented by Ingo Molnar and merged in Linux 2.6.23.  It is the
>> -replacement for the previous vanilla scheduler's SCHED_OTHER interactivity
>> -code.
>> +CFS stands for "Completely Fair Scheduler," and is the "desktop" process
>> +scheduler implemented by Ingo Molnar and merged in Linux 2.6.23. When
>> +originally merged, it was the replacement for the previous vanilla
>> +scheduler's SCHED_OTHER interactivity code. Nowadays, CFS is making room
>> +for EEVDF, for which documentation can be found in
>> +:ref:`sched_design_EEVDF`.
>>  
>>  80% of CFS's design can be summed up in a single sentence: CFS basically models
>>  an "ideal, precise multi-tasking CPU" on real hardware.
>> diff --git a/Documentation/scheduler/sched-eevdf.rst b/Documentation/scheduler/sched-eevdf.rst
>> new file mode 100644
>> index 000000000000..31ad8f995360
>> --- /dev/null
>> +++ b/Documentation/scheduler/sched-eevdf.rst
>> @@ -0,0 +1,44 @@
>> +.. _sched_design_EEVDF:
>> +
>> +===============
>> +EEVDF Scheduler
>> +===============
>> +
>> +The "Earliest Eligible Virtual Deadline First" (EEVDF) was first introduced
>> +in a scientific publication in 1995 [1]. The Linux kernel began
>> +transitioning to EEVDF in version 6.6 (as a new option in 2024), moving
>> +away from the earlier Completely Fair Scheduler (CFS) in favor of a version
>> +of EEVDF proposed by Peter Zijlstra in 2023 [2-4]. More information
>> +regarding CFS can be found in :ref:`sched_design_CFS`.
>> +
>> +Similarly to CFS, EEVDF aims to distribute CPU time equally among all
>> +runnable tasks with the same priority. To do so, it assigns a virtual run
>> +time to each task, creating a "lag" value that can be used to determine
>> +whether a task has received its fair share of CPU time. In this way, a task
>> +with a positive lag is owed CPU time, while a negative lag means the task
>> +has exceeded its portion. EEVDF picks tasks with lag greater or equal to
>> +zero and calculates a virtual deadline (VD) for each, selecting the task
>> +with the earliest VD to execute next. It's important to note that this
>> +allows latency-sensitive tasks with shorter time slices to be prioritized,
>> +which helps with their responsiveness.
>> +
>> +There are ongoing discussions on how to manage lag, especially for sleeping
>> +tasks; but at the time of writing EEVDF uses a "decaying" mechanism based
>> +on virtual run time (VRT). This prevents tasks from exploiting the system
>> +by sleeping briefly to reset their negative lag: when a task sleeps, it
>> +remains on the run queue but marked for "deferred dequeue," allowing its
>> +lag to decay over VRT. Hence, long-sleeping tasks eventually have their lag
>> +reset. Finally, tasks can preempt others if their VD is earlier, and tasks
>> +can request specific time slices using the new sched_setattr() system call,
>> +which further facilitates the job of latency-sensitive applications.
>> +
>> +4. REFERENCES
>> +=============
> 
> Why is this section numbered 4?
> No other sections here are numbered.
> 
>> +
>> +[1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
>> +
>> +[2] https://lore.kernel.org/lkml/a79014e6-ea83-b316-1e12-2ae056bda6fa@linux.vnet.ibm.com/
>> +
>> +[3] https://lwn.net/Articles/969062/
>> +
>> +[4] https://lwn.net/Articles/925371/
> 
> Other than those 2 comments:
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thank you for reviewing and providing feedback, Randy. I'm sending v2 now.

> 
> 
> Thanks.
> 

Thanks,
Carlos
