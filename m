Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F2A1E87B
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152168; cv=none; b=BwbfL8oUl8Njhp/l2jkjYAk58JRk0lmnt/Ks7KjDlWFLu9gU6Z9/2JE387PMEAgig1Zvehj9psPTjFiGPp2miC9h/WynK9DlzbI+sllAqdat5hMm3DknvuAFExf5nA7AhPAaISvEnL9XEUmIeVRxI13ely9Vo13XSHlnQX1HIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152168; c=relaxed/simple;
	bh=DLSCqwpXg5JE6IlskrkJzVCf92FiqmwfRs7ztERMGUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLzvTBBZYhJFMk46W48ZS/d6grZbJ86tPkIF4D7giHgku6oEKPLq/GGLaL5qKJSMj4Fn7hCwaiVDD3iLKCGCeTtkAxvWPFmU6Z3fFgrpz1ParIQ2A5cpFZ8crKMVem/Eq/mYKoOQ/FUgCRDz/+bpEDc9V1I3AyFkujxQkxO6DtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e+Igh1Dq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e+Igh1Dq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so316927666b.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740152164; x=1740756964; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d5l4zz1sMG3mtHShUobc7HnHdYCuofJA4lkceeZVq4Q=;
        b=e+Igh1DqcIbm68dfARHdNcNudZxqDaUKqDGxFMO0zyGqpyk/J4UESGPSEMbnN3hqA+
         7QHCT/7WZ6kro64SZYZTLv5OjSK00DLComj7HkCFPuHLwCLelGZTF9cZfo1CueKtAaqP
         OH/QXaiUl2j3mmTjJJtkwEP96dhDMrfHQon8e55Y0Fz7aaORZvOOfzaqd0yWsiRhohqm
         MY4UaFN0kr0YBSFFwtkQcPTfnsoOjBs08FxgzhMX06NM47IZlaLQWz1jHgRt1j8fOus2
         znrBmtuhdczwZOLbgw3/UmwSvYWSrYDthjYKlgKQiyPoDD5lrI+eZYHUFiOf2uqeowe9
         B2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740152164; x=1740756964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5l4zz1sMG3mtHShUobc7HnHdYCuofJA4lkceeZVq4Q=;
        b=kFdDkiHNhUePzFk0JFCJ/+a5h/NgT1vy3Bh2tjEjO5OAhFzeGjUrPMhPK1Hd/hJLg4
         1LWh3agt6ONmlpSMPXx9Ehn3GA1FdfbVk4LIMJWRJTIKja7uvJoLt9JbXSD1yuw0Cqco
         z52PLYLg9gq70YA+kn78gp1xutddAbtjh2d7mIYrCRZVgQGPY5nwS9t4teaSfUwqtRbl
         hcxEn8LhatAIEE535XRil7PiUPJGmFRdxVuoJdw+Uh4kP99llXJtVb/wdYNbfDcF0Jdj
         Cjng8z96FjAJVaVq7HrWo19xxQH82BkSIDtQJzs4uwZ42KaxHXazIchRLkSz6b0DSnk+
         u9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNWycvwfa0t5hyOb4CH9jq8hXrBAFU9yac4D8yLn+Y2eD4oj2m76M0dAM50IGy37et9dDzqDxnDQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQs6FDD7BiE0FccPmqdWyc10x1mzcFPBQ2gD4Zxcmkz5qVSsq8
	4Ibu73s7/DV6ZnPFteyS2lqBWz8qU8eTDBTKu7+Rmcfi6nfL1qRKhuGaYLGX05U=
X-Gm-Gg: ASbGncvHukl8fX9rZ+RI72UklraRNMcyA2D/Uh8Gvxs6XhlXNrjeiFbrlrB61R6BZ43
	nCpjGZa5t+8IBwSmKMcSW9wLEs9bDyP/PwumnaOVUAUkVWXEc7zKvujRgmtEHl33nM7fjjMJQKk
	hwPTMrq72tVSlAsgq5Yaf7XonV0X3r7na3bVzB2t6VLGpIJB8HYBICgKb5NwgeroPfDiYdLNr/9
	k+6lTBz0xoiKW01hAZXW3XVKuTL4t7VM1qWB0wPiXVx5dzkjSwiBjMx7W+hUEDz+T3waXJh4qzR
	y1WCCuG8JfF/mrXFFBtArw78Th9K
X-Google-Smtp-Source: AGHT+IE7R4MDw76EG5se1usjek3sk3eePWqQqCBEriY44mGinrtsqBn3iUcohkd9RyhQa0/COxWmNA==
X-Received: by 2002:a17:906:c142:b0:ab7:5cc9:66fc with SMTP id a640c23a62f3a-abc09e46652mr372546066b.50.1740152164419;
        Fri, 21 Feb 2025 07:36:04 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5323225fsm1661890566b.24.2025.02.21.07.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:36:04 -0800 (PST)
Date: Fri, 21 Feb 2025 16:36:02 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Tejun Heo <tj@kernel.org>, Abel Wu <wuyun.abel@bytedance.com>, 
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Yury Norov <yury.norov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
Message-ID: <m3og4sktkzf6j62terh4xcbfiw45ziymhmt7x7iuyzcogl67cy@ufqvgzttd2n7>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
 <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
 <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>
 <qt3qdbvmrqtbceeogo32bw2b7v5otc3q6gfh7vgsk4vrydcgix@33hepjadeyjb>
 <Z6onPMIxS0ixXxj9@slm.duckdns.org>
 <20250210182545.GA2484@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210182545.GA2484@cmpxchg.org>

On Mon, Feb 10, 2025 at 01:25:45PM -0500, Johannes Weiner <hannes@cmpxchg.org> wrote:
> Yes, a more detailed description of the usecase would be helpful.
> 
> I'm not exactly sure how the sum of wait times in a cgroup would be
> used to gauge load without taking available concurrency into account.
> One second of aggregate wait time means something very different if
> you have 200 cpus compared to if you have 2.
> 
> This is precisely what psi tries to capture. "Some" does provide group
> loading information in a sense, but it's a
>
> ratio over available concurrency,

This comes as a surprise to me (I originally assumed it's only
time(some)/time(interval)).
But I confirm that after actually looking at the avg* values it is over
nr_tasks.
If the value is already normalized by nr_tasks, I'm seeing less of a
benefit of Σ run_delay.

> and currently capped at 100%. I.e.  if you have N cpus, 100% some is
> "at least N threads waiting at all times." There is a gradient below
> that, but not above.

Is this a typo? (s/some/full/ or s/at least N/at least 1/)

(Actually, if I correct my thinking with the nr_tasks normalization,
then your statement makes sense. OTOH, what is the difference betwen
'full' and 'some' at 100%?)

Also I played a bit.

cat >/root/cpu_n.sh <<EOD
#!/bin/bash

worker() {
	echo "$BASHPID: starting on $1"
	taskset -c -p $i $BASHPID
	while true ; do
		true
	done
}

for i in $(seq ${1:-1}) ; do
	worker $i &
	pids+=($!)
done

echo pids: ${pids[*]}
wait
EOD

systemd-run -u test.service /root/cpu_n.sh 2
# test.service/cpu.pressure:some is ~0

systemd-run -u pressure.service /root/cpu_n.sh 1
# test.service/cpu.pressure:some settles at ~25%, cpu1 is free, cpu2 half
# test.service/cpu.pressure:full settles at ~25% too(?!), I'd expect 0
                                            ^^^^^^^^^^^^

(kernel v6.13)

# pressure.service/cpu.pressure:some settles at ~50%, makes sense
# pressure.service/cpu.pressure:full settles at ~50%, makes sense

Thanks,
Michal
