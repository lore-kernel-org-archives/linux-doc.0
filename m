Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K71/BA7x"
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54478199B
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 11:46:08 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35d68239732so9655ab.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 11:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702064767; x=1702669567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT8WusYF3MgKW2hWDO1w1/JmENKh7p+RAqmgfjq6meU=;
        b=K71/BA7xht2VhlYTAYMDvVv52u5Ju+v+1w+xXWFJN+HFL13QLcF1v3mtB+y2ECvGl6
         zhy5mMyuOTFMaFTJNNKUoTcMa4y130V3uTCoeJINUYQpmSVM0xmlnzETh7/ncD0M7fW1
         NM7tsJJKAPJMg4b7U3btqJiOVXe1YlEnVP3z4J9Q21LcR4Y59gyAkB50TFZm5mi7/HQ2
         9DGTxNEsn814d2miG3WXQe6xaETbCgRRnpVq81b8TDEV4ouRSgXXm3W324G1NyM6DhKV
         7W9uw1HmkAuFFZsDmUjmRNdH9IbNSjHbmr18CPa8OASAfbiOjC5acybCfNazKDmW4HrX
         wyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702064767; x=1702669567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT8WusYF3MgKW2hWDO1w1/JmENKh7p+RAqmgfjq6meU=;
        b=WygdpAjs1ofNQG+5KN9LswO6E4k+8JIovYyTb4ANcK9Snc0oSsgR+A52T3AXgZ7D+X
         v6t91bOcB3N+luSUx5o/Eq9CEjeFkyBKm5jV87xF1CQ/Ga0Th1bFkJl/9ZzNaD3taPi5
         xs1+MyC/oBqKUUL9pb2sWWXk6Ba/NtTJIRoB5IbZAibmtVJqeqU2sO8TJwapPi8wYtnH
         DY1kBcgxE00mFuokrnFwlkU5XAtA8slP+goCVB54QWXC+Af3zXBJNCHyCi/ZG1AcyHWE
         aBz6G6fj6kGCScNAl0xFbZYI/T4baqcYhwCTMmrsy7eQY2RNkVNSz+zmNdanTUpqzlwr
         c3Sw==
X-Gm-Message-State: AOJu0YwdzxCaXEGOHFRXfQO8MCiUI/LE/J1NkOEhCmGT+mlfSuGBWPGs
	0ERlEd3FEWLNuh3QgcZ5a1NgWu0FPMY7u34fk/uYSQ==
X-Google-Smtp-Source: AGHT+IHQwOrL1J8qlP4kXqYjgTDngQ2pVRBMbtxEwv5/cpx9SR/XfiEtCC74zU9ZHMG6Rr8MXyMiA24xdScSXUxvq+o=
X-Received: by 2002:a92:d283:0:b0:35d:176f:77d4 with SMTP id
 p3-20020a92d283000000b0035d176f77d4mr216401ilp.22.1702064766459; Fri, 08 Dec
 2023 11:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201005720.235639-1-babu.moger@amd.com> <d97cbeba-af6d-4b64-b5c8-32dc437a67b6@intel.com>
In-Reply-To: <d97cbeba-af6d-4b64-b5c8-32dc437a67b6@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 8 Dec 2023 11:45:54 -0800
Message-ID: <CALPaoCjNgv4rFpbovyayNynuAqYGP0rVLv=djVnDO1LR+zU55g@mail.gmail.com>
Subject: Re: [PATCH 00/15] x86/resctrl : Support AMD QoS RMID Pinning feature
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, fenghua.yu@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, James Morse <james.morse@arm.com>, x86@kernel.org, 
	hpa@zytor.com, paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, seanjc@google.com, kim.phillips@amd.com, 
	jmattson@google.com, ilpo.jarvinen@linux.intel.com, jithu.joseph@intel.com, 
	kan.liang@linux.intel.com, nikunj@amd.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, rick.p.edgecombe@intel.com, rppt@kernel.org, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, dhagiani@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 3:17=E2=80=AFPM Reinette Chatre
<reinette.chatre@intel.com> wrote:
> On 11/30/2023 4:57 PM, Babu Moger wrote:
> > c. Read the monitor states. There will be new file "monitor_state"
> >    for each monitor group when ABMC feature is enabled. By default,
> >    both total and local MBM events are in "unassign" state.
> >
> >       #cat /sys/fs/resctrl/monitor_state
> >       total=3Dunassign;local=3Dunassign
> >
> > d. Read the event mbm_total_bytes and mbm_local_bytes. Note that MBA
> >    events are not available until the user assigns the events explicitl=
y.
> >    Users need to assign the counters to monitor the events in this mode=
.
> >
> >       #cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> >       Unavailable
>
> How is the llc_occupancy event impacted when ABMC is enabled? Can all RMI=
Ds
> still be used to track cache occupancy?
>
> >
> >       #cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> >       Unavailable
>
> I believe that "Unavailable" already has an accepted meaning within curre=
nt
> interface and is associated with temporary failure. Even the AMD spec sta=
tes "This
> is generally a temporary condition and subsequent reads may succeed". In =
the
> scenario above there is no chance that this counter would produce a value=
 later.
> I do not think it is ideal to overload existing interface with different =
meanings
> associated with a new hardware specific feature ... something like "Disab=
led" seems
> more appropriate.

Could we hide event counter files if they're not enabled? Is there
value in displaying the value of a non-running counter that will be
reset the next time it's enabled?


>
> Considering this we may even consider using these files themselves as a
> way to enable the counters if they are disabled. For example, just
> "echo 1 > /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes" can be used
> to enable this counter. No need for a new "monitor_state". Please note th=
at this
> is not an official proposal since there are two other use cases that stil=
l need to
> be considered as we await James's feedback on how this may work for MPAM =
and
> also how this may be useful on AMD hardware that does not support ABMC bu=
t
> users may want to get similar benefits ([1])

We plan to use the ABMC counters as a window to sample the MB/s rate
of a very large number of groups, so there's a serious concern about
the number of write syscalls this will take, as they will add up
quickly for a large RMID*domain count.

To that end, the ideal would be the ability to re-assign all ABMC
counters on all domains in a single system call.

-Peter
