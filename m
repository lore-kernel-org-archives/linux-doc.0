Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280558;
	b=IrIiiwv/DVurDRGD4GNaeA9QpYjiDKjJ91/MILH3aeo0AOE9PrvL9oyAehhS6TuTLCBk
	 Fhyx67lBwkNeANLH3NJ1zrjc0DunBxVuX6udD0Kt0kCDSyoliqFqsmU/DVGfgJnWEcZ3P
	 m4hu/aegIJeBrHjcq87giJpLVp11G9LFA+rLvjyPUv4aEv/iEWXeIakfFIQQBfdqk5PqD
	 aA1RT2rwNsmh8f+JjdcG60NA1lx0nVpspVWkuy4igT+ANRRvIbtGhCfXIj9fpWWN1su8Z
	 ka6QoGAK5lpOk+1056Ws2FjyTTwWKY/NFtwJCc9jIMs9zhoeIfZt+zyuBeEqH1nZxIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
	b=bjWfFk+WSPtWIvKH7XSjkB0JmIbvsvcMG/QW9drToDl4/1HLzQ3yfWMGYyX2IQJmon4s
	 EfMdXt0nobyb124/Oi6W2thYg5q/saJ91UpdKpBu/UReF0SZqPg4Ye3gFr3K/r4WiYjZb
	 8ksuBfWHYGF7l2VhAEW5txW8AUNDKHjnMoHeLBVw48yFQ8UrbRbMs5lrEd8PyLZ1QOQ2v
	 St+827mqos/vOXqzOVx9cgmXp+hkyb97yQxRlGvcbWrtloVsc0CgQh/byQ4gIvXtEkIWS
	 Mc8S1n1fEzK/U8hCVuQg2DEjf15CQlZcM/IQCmYty88EBtr89mQIzE6vjnNvze/7qaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grdncc.com;
	spf=pass smtp.mailfrom=grdncc.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA484606A32E
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA484606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grdncc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grdncc.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so955726a91.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grdncc.com; s=google; t=1794280557; x=1794885357; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=NwxIXfIfED92rj+yFVekhg0PoPvL6YqEIV+8UuPTeCTSJGMCqEVq7hIJ+SflQ/2qz9
         BYV5y3QxZYan/+H9wX4hQnSGdVMybN8ZiGD67y/3gVq0JI/MbBdn6EyqiPRNpSNmG66T
         p5BcQfDjmSFz6UPCTao36rT920jDVb1XwPgkG0GK59HFH+eAqz3PZrtF35lvRKFfTqzE
         Iq34Xg54uBrv2zbo+xSnFkrFcsRvDvdiaLNdc2RS/+e455QrfsSbx3CWYH657zWiUoM4
         z2GWIDCs8gooGGJOV0rqY9f+xuZbR5SbxV3OJvRI9PJZGkA3neqqFc1oCTfcajQFow1Z
         WLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280557; x=1794885357;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=dWaqjzlmDtMFEuPhZyuYfvXbpym5TPN/x0PO0hGVQYMvFulygeYcpR3wf5r/s5JYiM
         E1r4/I7NirwMqW6+molkpEEcvsov5BXH3Zsz+iPW6LFrsLq1iwJ3Wm/LIuUSflEII1Fv
         amsqmYrzkPJzrrII5qE3cwmKev1/jHoOeJRP0DxebiIEwW3IDFwYCKUbO8d4q8zxNTa6
         do2/vkqG437xN1CYVZ/ObgUYRfaOuCQF65K3V8d9fF5OAowKjDXH6dLp77ggafUwRpFt
         aigRAkF05wQsVkoVReGBvKs+Z04N78SOurkOxK9myw94cvQCD5ab4VZyqTeJY36AanYd
         s9uQ==
X-Forwarded-Encrypted: i=1; AL+hErHYvcVqXlRxSCzU7V0evkcFh9hdDrBpHP+v/3kMIg1wMErQ8J3qQdwJA3SRNGPYZ80o0FJO2RmpkxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X7ukgvRVatCRL0R7wWTxjgGL33mBNgPRWVTKQA40kdykc52H8
	eA4MWaRyuYemoLBr42PyC6QsIsiPck82sRhl98qMpUjUzxL5ZtUa40yVTl7hYvE2qdc=
X-Gm-Gg: AYBFou2dARN0z/XST4l9BKf0P7w+8q5PWGBdOCyejKK0CuAQg3rtykgBl9c8vd2PQU3
	YFEHTHx0vzx1YaGq622IjZuqCo8/EUw1TcBkuTxs8Rm/zIYbcR2Iqn/WyjXBUg2g+9dlv0dcUZ/
	fhMUJ8x0W9k/cLYhULbF4K/2oLSk+bUAZbnVWE5cV0+Q25FiCp1PyKapMDFlMTOQ9EEq7FFE4UU
	omKyLXZ3Oop5pXXHTdWtrFGNfmjFgcTfJn2R9ps340JPBwCk/O/5+BI4NliizfynF/ce+9uOHiY
	ZQLSc8DO+sRWPVc+6skaVy+l5b/1fx5zXbzOOx2c+jyJmkafbz1uetv+ABPQXkOb5KaLyLD+0Qt
	STaqR6X9PoykRVDDSQpSiy8/c2/LQFFddMTderko6OpuO0vwzpTKgVZIOTqr7/7ebt31ZdDgmUy
	qCeqF5sewYMmr0ngRfZtFwvHx98zgnoqI2jEpm6NWw7nFB9udxfy6TKXjVRsmawlJqBz+QDmmOZ
	tJLljIWHvA6HYJwlb4CudqeT+PrwS9YAuw5UOtLoBolz6nWno+/0WOMfHHfo8Gwn6xhdr6mTiIR
	MHkIwQpr3V7wmKi9roHfY/LF2HFFwM3ckJwZHjbX5oyIrFQEQdNTQNB4QOVRqkbmuL2+DMfrsLa
	yHjS6JxDtZRkj27Wk5gKBzunVP3wy/i9/og==
X-Received: by 2002:a17:90a:e7d2:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b166d11497mr1560555a91.42.1794280556688;
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Received: from smtpclient.apple ([103.243.98.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm1826210a91.14.2026.11.09.19.15.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 0/6] sched: Expose writable interface for preferred CPUs
 mask
From: Maxim Kuvyrkov <maxim.kuvyrkov@grdncc.com>
In-Reply-To: <20261101192203.6979-1-ynorov@nvidia.com>
Date: Tue, 10 Nov 2026 16:15:31 +1300
Cc: Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Righi <arighi@nvidia.com>,
 Ben Segall <bsegall@google.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Johan Hovold <johan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Mel Gorman <mgorman@suse.de>,
 Mete Durlu <meted@linux.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 driver-core@lists.linux.dev,
 linux-s390@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2B09626-39F0-4EC3-B57D-CD83D77DD208@grdncc.com>
References: <20261101192203.6979-1-ynorov@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On Nov 2, 2026, at 08:21, Yury Norov <ynorov@nvidia.com> wrote:
>=20
> The preferred CPU mask currently lets the steal governor reduce vCPU
> demand when physical CPUs are contended. This series adds manual =
control,
> opening more use cases.
>=20
> For example, setting CPUs aside for selected fair tasks at runtime =
while
> steering other fair tasks toward the remaining CPUs.

Hi Yury,

I've been trying to do this with crutches in user-space for a long time. =
 Thanks for implementing this in the kernel, and with a convenient user =
interface.

>=20
> A user can mark a CPU non-preferred and pin a workload to it. Fair =
tasks
> whose affinity includes preferred CPUs are steered away, while tasks
> whose allowed CPUs contain no preferred CPU can still run there. The =
CPU
> stays online, task affinity is preserved, and the selection can be
> reversed without rebooting:
>=20
>    # rmmod steal_governor
>    # echo 0 > /sys/devices/system/cpu/cpu3/preferred
>    # taskset -c 3 ./my_workload
>    # echo 1 > /sys/devices/system/cpu/cpu3/preferred

My use-case (being a compiler optimization engineer) is to pin =
benchmarks to specific cores, and stop the system from using those cores =
even when the cores are idle.  This prevents L1/L2 cache pollution and =
makes performance numbers more stable.

Thanks!

--
Maxim Kuvyrkov
Garden City Compilers

