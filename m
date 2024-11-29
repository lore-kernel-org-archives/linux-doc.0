Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819031865E5
	for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2024 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732874366; cv=none; b=fcpsuX/xO0pgSoR66XNgLh8+rMBLzPhI5OCP5UGG3ezuvXmWtYN1FZ9I9kVdHVfaLIQ+4rvwhEerAvpM7DT4OEWp5c0lEpJmsQxOS69j+z2Uil1SeYC64UlG5R+8nyx2ykEPSRRQ+jdRaxq3OhMeaC4r2Cq+IFadmsTmss+kaj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732874366; c=relaxed/simple;
	bh=uSsITzNmSsyWARLL6s/Od36u3VYAEyC/8LCQ4MlYcX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ0IUbHzxo5MAoxka/6T2ZRiwuhI4NkO4WzuZBF46YDPLW3j4OoPz/NLh4SflWLswnv8+CHqp2g+iNgzmGxNJ4AImINNVGfBZV0KgFWzFXOVRWLS3hJGwiiT86DVJBhqpHgtlt7jhKH508V3UvShRsAUsM0nL+yXF8jJZLiXdhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY0375ZE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY0375ZE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0bdeb0419so159023a12.1
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2024 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732874363; x=1733479163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y37ebRaWudSMoIk0DXIIhwp5SG9cfl9SoWUYXI4kDE=;
        b=UY0375ZEuM54u8FBHNm3/8JqZUUceqpPR5/OpwasyOsoKnCLrV5Zz1AD+d7Hcminbo
         ZKs1SSr5vUibRFQTaCtieSKdZIIku9vApffA0Fp6I/mH4e7zf1NMAC3j4vksXFmcqf12
         a0Q55brfA56C10vvKnbg4DfDWjt2GZj4ZYun26E7fji1Tu8Ii77FCgwdXwq3VpMZuPK+
         PJJZjIhoeKPWGIDpyogU490ZLsCY6E4Ud0VLT/KR4IJmJPd4EtBJx9KbgLbIblelbp+H
         AAR9UZqDbEJmFGlzeoSRzxfBDuovwbqQASQ+O2kD9kl8dt5ZhfkyTwPMJizZqTrg6RT3
         CzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732874363; x=1733479163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y37ebRaWudSMoIk0DXIIhwp5SG9cfl9SoWUYXI4kDE=;
        b=mSKvVkhXxTNsXNdMgLJFEIAGGMWXsAZRy5x46q77zStRUAS9w3XZ2Oc27RpPOPSA/p
         ZUFhTQGDVVOBOUsfTxaXt7x0GZp4h6RdSdHNaBf2GqjIlvDlWhlTMmNWRHfmnLayOEfv
         KkuHD9QYFjyFfsJDTPunTSZZpZEhDY/ziny1jDQH0M6i9+tUtLvez2QGDVCBQKm0n3o3
         YBfnOXhzQfkMql8vYj5UZBSI1oyQMVCYg5YztCuc+2DTnjfuxYiA6dBLCpMebIxantJ8
         N2SFvBnWe5qfWHdTumpkzSrS5ZfPSRpR3GjZxOMbY4ayA3q89ptGbayaOHboDLs7Jamo
         PfAA==
X-Forwarded-Encrypted: i=1; AJvYcCWHJGVwRuY3pzsASv2nniqykNv9zCrmSuiKX22g4oZJUiXbKAYSYe3AICXNOlScw0BpwDPMugpu9p8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+mZ3lq08ZQMdzAWVvaQSzYLRexPrQMAGkcdNkuOvqtIUct66
	+RNFNew2NSGfc/m+4gnSqhZ97o5ZfdamT7RVhe6N4qjRvKTXLEbZNC4Q+Mlm5YG0ZFNNY3ztct/
	z1H+axYKb/ZpovJ6KdngWkEhvILU7q+GMFAEf
X-Gm-Gg: ASbGnctAT5vuw5V971hDdBYInXxT9zRJAodYdii7DJ+vnXXj0mBErP+WblAdC4lRbyy
	f9x1+LSnL6aZhSecQ8VRZmDDF8e9InbKs+ru6t9U0/rstEKVi2784/ATtSNfnJg==
X-Google-Smtp-Source: AGHT+IHUBCUGFN9KTRFfHhnJDhilg5gHGAVosZUU0PQWjsA3k3VGUMCfkR6vS7bQHk1RWtatpDvfsUdyggVmrib6WpM=
X-Received: by 2002:a05:6402:26cb:b0:5d0:8889:de02 with SMTP id
 4fb4d7f45d1cf-5d08889deb3mr8840312a12.22.1732874362741; Fri, 29 Nov 2024
 01:59:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730244116.git.babu.moger@amd.com> <265f3700ac0c0d33703806fdc3d096b08c992efc.1730244116.git.babu.moger@amd.com>
 <0dc08082-0f3f-4acc-9285-b925a4ce3b02@intel.com> <5d426af4-a947-4115-b7b7-4eeecfa13fec@amd.com>
 <c587f94a-7920-49cf-94b1-4c52140db914@intel.com> <ef92f1fb-086c-4ee1-b8ec-e08ed68f963a@amd.com>
 <e065b193-dbcc-451b-98db-68a5a69e6ae0@intel.com> <20959b58-a882-4ef7-bd11-e8bb0a998945@amd.com>
 <1a93f4e3-d3d2-4764-90d1-728b9cb70481@intel.com> <36d8fe9f-0000-4d0d-a097-efddc3881a2a@amd.com>
 <5aa7924d-b27d-4ee6-b8dd-4bae0e25267b@intel.com> <CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com>
 <4bf82744-da09-43c3-b8f1-7fc203d1c1c3@amd.com>
In-Reply-To: <4bf82744-da09-43c3-b8f1-7fc203d1c1c3@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 29 Nov 2024 10:59:11 +0100
Message-ID: <CALPaoCjL6FEmVgX-h3_GQEVZNAT3FcH34t9o1PwbUacVzXjZPg@mail.gmail.com>
Subject: Re: [PATCH v9 14/26] x86/resctrl: Introduce interface to display
 number of free counters
To: babu.moger@amd.com
Cc: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, thuth@redhat.com, 
	paulmck@kernel.org, rostedt@goodmis.org, akpm@linux-foundation.org, 
	xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com, 
	daniel.sneddon@linux.intel.com, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	jithu.joseph@intel.com, brijesh.singh@amd.com, xin3.li@intel.com, 
	ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	james.morse@arm.com, tan.shaopeng@fujitsu.com, tony.luck@intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, jpoimboe@kernel.org, 
	thomas.lendacky@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Thu, Nov 28, 2024 at 8:35=E2=80=AFPM Moger, Babu <bmoger@amd.com> wrote:
>
> Hi Peter,
>
> On 11/28/2024 5:10 AM, Peter Newman wrote:
> > Hi Babu, Reinette,
> >
> > On Wed, Nov 27, 2024 at 8:05=E2=80=AFPM Reinette Chatre
> > <reinette.chatre@intel.com> wrote:
> >>
> >> Hi Babu,
> >>
> >> On 11/27/24 6:57 AM, Moger, Babu wrote:

> >>> 1. Each group needs to remember counter ids in each domain for each e=
vent.
> >>>     For example:
> >>>     Resctrl group mon1
> >>>      Total event
> >>>      dom 0 cntr_id 1,
> >>>      dom 1 cntr_id 10
> >>>      dom 2 cntr_id 11
> >>>
> >>>     Local event
> >>>      dom 0 cntr_id 2,
> >>>      dom 1 cntr_id 15
> >>>      dom 2 cntr_id 10
> >>
> >> Indeed. The challenge here is that domains may come and go so it canno=
t be a simple
> >> static array. As an alternative it can be an xarray indexed by the dom=
ain ID with
> >> pointers to a struct like below to contain the counters associated wit=
h the monitor
> >> group:
> >>          struct cntr_id {
> >>                  u32     mbm_total;
> >>                  u32     mbm_local;
> >>          }
> >>
> >>
> >> Thinking more about how this array needs to be managed made me wonder =
how the
> >> current implementation deals with domains that come and go. I do not t=
hink
> >> this is currently handled. For example, if a new domain comes online a=
nd
> >> monitoring groups had counters dynamically assigned, then these counte=
rs are
> >> not configured to the newly online domain.
>
> I am trying to understand the details of your approach here.
> >
> > In my prototype, I allocated a counter id-indexed array to each
> > monitoring domain structure for tracking the counter allocations,
> > because the hardware counters are all domain-scoped. That way the
> > tracking data goes away when the hardware does.
> >
> > I was focused on allowing all pending counter updates to a domain
> > resulting from a single mbm_assign_control write to be batched and
> > processed in a single IPI, so I structured the counter tracker
> > something like this:
>
> Not sure what you meant here. How are you batching two IPIs for two domai=
ns?
>
> #echo "//0=3Dt;1=3Dt" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>
> This is still a single write. Two IPIs are sent separately, one for each
> domain.
>
> Are you doing something different?

I said "all pending counter updates to a domain", whereby I meant
targeting a single domain.

Depending on the CPU of the caller, your example write requires 1 or 2 IPIs=
.

What is important is that the following write also requires 1 or 2 IPIs:

(assuming /sys/fs/resctrl/mon_groups/[g1-g31] exist, line breaks added
for readability)

echo $'//0=3Dt;1=3Dt\n
/g1/0=3Dt;1=3Dt\n
/g2/0=3Dt;1=3Dt\n
/g3/0=3Dt;1=3Dt\n
/g4/0=3Dt;1=3Dt\n
/g5/0=3Dt;1=3Dt\n
/g6/0=3Dt;1=3Dt\n
/g7/0=3Dt;1=3Dt\n
/g8/0=3Dt;1=3Dt\n
/g9/0=3Dt;1=3Dt\n
/g10/0=3Dt;1=3Dt\n
/g11/0=3Dt;1=3Dt\n
/g12/0=3Dt;1=3Dt\n
/g13/0=3Dt;1=3Dt\n
/g14/0=3Dt;1=3Dt\n
/g15/0=3Dt;1=3Dt\n
/g16/0=3Dt;1=3Dt\n
/g17/0=3Dt;1=3Dt\n
/g18/0=3Dt;1=3Dt\n
/g19/0=3Dt;1=3Dt\n
/g20/0=3Dt;1=3Dt\n
/g21/0=3Dt;1=3Dt\n
/g22/0=3Dt;1=3Dt\n
/g23/0=3Dt;1=3Dt\n
/g24/0=3Dt;1=3Dt\n
/g25/0=3Dt;1=3Dt\n
/g26/0=3Dt;1=3Dt\n
/g27/0=3Dt;1=3Dt\n
/g28/0=3Dt;1=3Dt\n
/g29/0=3Dt;1=3Dt\n
/g30/0=3Dt;1=3Dt\n
/g31/0=3Dt;1=3Dt\n'

My ultimate goal is for a thread bound to a particular domain to be
able to unassign and reassign the local domain's 32 counters in a
single write() with no IPIs at all. And when IPIs are required, then
no more than one per domain, regardless of the number of groups
updated.


>
> >
> > struct resctrl_monitor_cfg {
> >      int closid;
> >      int rmid;
> >      int evtid;
> >      bool dirty;
> > };
> >
> > This mirrors the info needed in whatever register configures the
> > counter, plus a dirty flag to skip over the ones that don't need to be
> > updated.
>
> This is what my understanding of your implementation.
>
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index d94abba1c716..9cebf065cc97 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -94,6 +94,13 @@ struct rdt_ctrl_domain {
>          u32                             *mbps_val;
>   };
>
> +struct resctrl_monitor_cfg {
> +    int closid;
> +    int rmid;
> +    int evtid;
> +    bool dirty;
> +};
> +
>   /**
>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor
> resource
>    * @hdr:               common header for different domain types
> @@ -116,6 +123,7 @@ struct rdt_mon_domain {
>          struct delayed_work             cqm_limbo;
>          int                             mbm_work_cpu;
>          int                             cqm_work_cpu;
> +     /* Allocate num_mbm_cntrs entries in each domain */
> +       struct resctrl_monitor_cfg      *mon_cfg;
>   };
>
>
> When a user requests an assignment for total event to the default group
> for domain 0, you go search in rdt_mon_domain(dom 0) for empty mon_cfg
> entry.
>
> If there is an empty entry, then use that entry for assignment and
> update closid, rmid, evtid and dirty =3D 1. We can get all these
> information from default group here.
>
> Does this make sense?

Yes, sounds correct.

>
> >
> > For the benefit of displaying mbm_assign_control, I put a pointer back
> > to any counter array entry allocated in the mbm_state struct only
> > because it's an existing structure that exists for every rmid-domain
> > combination.
>
> Pointer in mbm_state may not be required here.
>
> We are going to loop over resctrl groups. We can search the
> rdt_mon_domain to see if specific closid, rmid, evtid is already
> assigned or not in that domain.

No, not required I guess. High-performance CPUs can probably search a
32-entry array very quickly.

-Peter
