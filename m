Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A701214A78
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754944740; cv=none; b=AEL/YlB8umjVqKUMdqphhDJ90ClbVzzsMY33dgiCRUBNs41z/nH3HnKKuaCmUYgRSJ5CQKhFuid4bNHmH/ZbW+wVAKz6pw8CO7XVUrJutVhj6+J2iA7PNMHktA/aNquXDxSdWGshfVXrYl7jfc02sSq2L43HmIj9U2VdBbWGbnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754944740; c=relaxed/simple;
	bh=BeN3m0xadz9YvYUbHvxtp57LYioc/6gT4/yHr3BKzFM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nuc4leNuIvN/yLY3jWT2XGhwzOt0QTiFu95aBTzhvIrnuNQelR/LcwL9MCWhQ9reZtzlelGjS/yJeou049kBmcNxuI6K0JxeoKdEV9tDCuIZXX1O/9UmYnIcG3n6E9QkeRtuyCN534BmKi0xiq4BOBae81zpmWvethNJaVHZCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIZzW7+N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIZzW7+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754944737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVTZDqLOIqGDACKJQ4iW2Xgu+XIsc1WR3tvSI8VBgFw=;
	b=FIZzW7+NpVLKigKFiF6FBY0KwUnaImM0i+bWiTRDtAdLGSHsoxoJbi3wJFhWAm8dGJmSKu
	G4HYv0y+wBD+H5232B/m/n4oUJHaYcQQ8hyHH1IIslgPi/MD2TK/bv5H+QLhxoKFI5wEtD
	RGvh98p16u+JmYSM7SWryFOCPuX0Uao=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-OEZPFCIbMiSosTngwgHP6Q-1; Mon, 11 Aug 2025 16:38:56 -0400
X-MC-Unique: OEZPFCIbMiSosTngwgHP6Q-1
X-Mimecast-MFC-AGG-ID: OEZPFCIbMiSosTngwgHP6Q_1754944736
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e7fd5f63a0so463423785a.1
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 13:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754944736; x=1755549536;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVTZDqLOIqGDACKJQ4iW2Xgu+XIsc1WR3tvSI8VBgFw=;
        b=X0vH1VA3hlD/yQov2XwREK1W2p2YVzvPlmnaTkgHnyrQBuod+cJD7c+/Zo98poUEhW
         PLk0U8xClCQPH+3Nd8AOEQsFI3lgCMd7ZSpfqG59weRE3/M2M8R7a5fbEFafMkDaHHwH
         p3zhcZ6w8x4x7gn93W5phGspxPA/XoAYcQm0LQ+/SzKYyFSqvUdO0EGN3McA5bKBEk+k
         /maXHoio2z6hTKnTj6npuCRCatT9LhBS/q6U9cvgOZx2oGj+DrS4lPtOWIvw8GuD65KJ
         OnMIubi3MZmwrqrDdzk1DRM5rQK0Cpa2Jq8i7el4CdisCchwOIb4uI5Rsro/AqG/5P+X
         bvLg==
X-Forwarded-Encrypted: i=1; AJvYcCWU9XBZHlSJzboD8QMtbxR9KbZG0iPTWpH3v+RzIHGZBF6mLc37pJ8fOo787+jtii+XGMtj6hXyAUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPME+yOQVEpYjaXurX52N5weN/uTCgoCgRO/SsnbTSRENAXOK
	u/qCgGJUsXB9o4xL5ZECdrhzIYUcLbXSYpSsOpiy3Rri/X+TChN33mcm8VUOJxA4QeFBn35VEUI
	psRKfkaCnJktiytJNTng/Y2gDrMqziYRFq/cdpOOsPl/y4BmIC0I7/ytGnv9oLw==
X-Gm-Gg: ASbGncsE04WXBYANXt/RQKO3sLX0ZHhJ9kddHu14TBQuq9fBKBX0CCZjPdU7eaotGuk
	O+pDOl7/j31PgJyQOOBoE4+46bMkizztDIC0XYEehNE2nHKQOD6DofDje18Nt0l7HHc0r1ns7lL
	nZsfb6ZYn+XrOp0mNytttOaQiUu20yWvc4Tdmcn9xUkzXBKJEGc3/lW0s4D2le0AuMlfECG2u6l
	LnpMkYy7yL61yFYQd8blmrQ25/ngj/vFBsjQ0E79xR25qMcfiXGQswDcp8Df6KOWhQfVJRr+uCW
	+frIL1m2J2/W6DUE3NM9jC4SKuzjKfNHmZlN1sT+l/lF4tLNK/fqT0GbHZ4oEYlYbMCgKzcH6YP
	yHsRkO9+2bg==
X-Received: by 2002:a05:620a:3190:b0:7e8:46ff:a520 with SMTP id af79cd13be357-7e846ffa5f3mr1032836085a.59.1754944735848;
        Mon, 11 Aug 2025 13:38:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6TJypRwgs9RgO0ZOhG4M9sxvgnyPxPyFGPY0oojF+MNjTWDK6x8l3AWs8blAumYeOx/efOw==
X-Received: by 2002:a05:620a:3190:b0:7e8:46ff:a520 with SMTP id af79cd13be357-7e846ffa5f3mr1032832285a.59.1754944735406;
        Mon, 11 Aug 2025 13:38:55 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e856555efbsm102176285a.11.2025.08.11.13.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 13:38:54 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8f357de1-72ba-497f-997a-f9a61aec6190@redhat.com>
Date: Mon, 11 Aug 2025 16:38:53 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-doc@vger.kernel.org
References: <20250809094247.8384-1-frederic@kernel.org>
Content-Language: en-US
In-Reply-To: <20250809094247.8384-1-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/25 5:42 AM, Frederic Weisbecker wrote:
> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 12 years.
>
> The shoemaker's children always go barefoot. And working on timers
> hasn't made me arriving on time either.
>
> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
>
> Introduce a new page that gives an overview of CPU isolation in general.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Thanks for working on this document. It will be really useful for those 
customers that need CPU isolation.


> ---
>   Documentation/admin-guide/cpu-isolation.rst | 338 ++++++++++++++++++++
>   Documentation/admin-guide/index.rst         |   1 +
>   2 files changed, 339 insertions(+)
>   create mode 100644 Documentation/admin-guide/cpu-isolation.rst
>
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> new file mode 100644
> index 000000000000..250027acf7b2
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,338 @@
> +=============
> +CPU Isolation
> +=============
> +
> +Introduction
> +============
> +
> +"CPU Isolation" means leaving a CPU exclusive to a given userspace
> +workload without any undesired code interference from the kernel.
> +
> +Those interferences, commonly pointed out as "noise", can be triggered
> +by asynchronous events (interrupts, timers, scheduler preemption by
> +workqueues and kthreads, ...) or synchronous events (syscalls and page
> +faults).
> +
> +Such noise usually goes unnoticed. After all synchronous events are a
> +component of the requested kernel service. And asynchronous events are
> +either sufficiently well distributed by the scheduler when executed
> +as tasks or reasonably fast when executed as interrupt. The timer
> +interrupt can even execute 1024 times per seconds without
> +significantly measurable impact most of the time.

"significantly measurable" looks odd to me. Maybe "without a significant 
and measurable impact most of the time".

> +
> +Tradeoffs
> +~~~~~~~~~
> +
> +In terms of cost, this is the most invasive isolation feature. It is
> +assumed to be used when the workload spends most of its time in
> +userspace and doesn't rely on the kernel except for preparatory
> +work because:
> +
> +- RCU is slower due to the locked, offloaded and threaded callbacks
> +  processing (the same that would be obtained with "rcu_nocb=" boot
> +  parameter).
Should be "rcu_nocbs". The '=' is optional.

Cheers,
Longman

