Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942623;
	b=YiJ6G9OqhSXKbFW61F6pJqfECMl+kP1yavz2lQM5g+foA984KassXwvYr9p7FQOhXah4
	 pxn9zJr6wZeFjZpMvPQFzmJsObhBziPj8p+GR0T7tio4b/2APV8++2xNh+bbPl4HUCeER
	 JYbyrIA0QIXZnhuyY+b1NFzdy0ivYw/fF5gY+DwjkghcEYNFHVQYwc5yXQChp5EFX2ePJ
	 DZY/MlcRwuMu9X0L5lkZoLI4tATY/LggwXeTNWCQYZvD5pGre0apaw3lWectnG0nJlu9I
	 zQSRG0vyKLMWUqqjgOJQUcr9lrFwsac4+92iYCHyN0TYl80+bf5/MIffFLqTsxWuhFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942623;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=E8vHwcZsyMA/z2yHBiWPvoJ/73G3d8tl4r7ZGS6ZsWk=;
	b=SS3Y0aoEWvYUqBDKm7c55hJeFzR0ejntmdBVCeH49cRUP3+5lJifXuETg0X7FM5CMKde
	 RQyQP3pzNr9+XX+Ke3tYgEWDUcXG3sJzVVo2HwTMP/2HitgfdNVz3YDscUHy5cmTfz9yO
	 FSWnmVZJCKswEZ1+aPR/oDFMoNDeTu5le/M7TlB7gU+LnqBdnsJNggFuUW4gZduunjVGp
	 CcubeKuzlX47yyau17An96HNeE8Aeg3uOuEVdFuEah1mitZYNhCmU6G2gyvM2Z//D74Z/
	 8yKBUKwjBqMFg9ZZNFHfRAkrBpsN5bi2BAer1RGtgiRopfhGbxrdiU3mZ7sAB0DaLcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mam9EudY;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2D606A31C;
	Tue, 17 Nov 2026 19:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mam9EudY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794942622; x=1826478622;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IjzbWznuxWLOpVha19yeggp08nZlrK7bxGF9heZWH1I=;
  b=Mam9EudYIijl4hoDJ8JFZ/GaVQlWNZtKNPhhPQGmZXfi8jykwW8rsi3u
   0FcrVC44sW3NUlT0QYAS7rm1bdfhPneDCq3NaceSFZmsuKqeZJ9aZyq+p
   RG+aGIyW/vlRsJiW7WquppIQjm4pe616A50ssXtbUO2ODW7VWzF7EBYCF
   41GfnWxpplO/Jov2TCMt+j7ufwWjn1fKrMmDccwAAkXY4olk/R5HKZGBa
   SQWIbrMhCCeiCxSPnTKJ2YIiM/5hTTDI/N0kOlaXJyhHmGZN/Y8wnBc/T
   8B9N37oqwHNFndd/fp9d/SifCX7NPlqydizIJM7YhFy8QyMpwDmmuSo4k
   w==;
X-CSE-ConnectionGUID: tYmsx7htSQusNoYCqexrjw==
X-CSE-MsgGUID: bQYHfFEfQg++TT+rMKabHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3755496"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3755496"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 11:10:21 -0800
X-CSE-ConnectionGUID: 1C7jFGKzRaS2adnshm+/DQ==
X-CSE-MsgGUID: HHaphYuzRlmYVfDLu+G0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11734830"
Received: from unknown (HELO [10.241.242.245]) ([10.241.242.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 11:10:20 -0800
Message-ID: <0f6295ad41cce262149b939c8a245df76bfe5719.camel@linux.intel.com>
Subject: Re: [PATCH] sched/topology: Add new kernel parameter to tune NUMA
 domain flags
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Jianyong Wu <wujianyong@hygon.cn>, Peter Zijlstra
 <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot	 <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt	
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman	
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak	 <kprateek.nayak@amd.com>, Chen Yu <yu.c.chen@intel.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap	 <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jianyong.wu@outlook.com, wangfengyu@hygon.cn,
 	zhongyuan@hygon.cn, huangsj@hygon.cn
Date: Tue, 17 Nov 2026 11:10:19 -0800
In-Reply-To: <20261117131854.924760-1-wujianyong@hygon.cn>
References: <20261117131854.924760-1-wujianyong@hygon.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-17 at 21:18 +0800, Jianyong Wu wrote:
> Sched domain flags can largely affect performance on systems with
> multiple NUMA levels, especially SD_BALANCE_FORK, SD_BALANCE_EXEC,
> SD_WAKE_AFFINE and SD_BALANCE_NEWIDLE.

Jianyong,

A few thoughts on the three flags.

>=20
> SD_BALANCE_FORK and SD_BALANCE_EXEC decide how far the slow path of
> select_task_rq_fair() searches. Stripping them from the high NUMA levels
> reduces the number of CPUs to traverse and speeds up fork/exec.
> SD_WAKE_AFFINE decides the wakeup scope: if the waker and the wakee are
> farther apart than the highest level carrying it, the wakee cannot be
> pulled next to the waker on wakeup, which may hurt performance.=C2=A0
>=20

On your data later for Machine B, you say that levels at 32, 35 and 38 are
beyond node_reclaim_distance, so probably Hygon is running with the generic
node reclaim distance 30.

AMD sets node reclaim_distance=3D32 in init_amd_zen_common() for this reaso=
n.
You can probably do the same for Hygon, to retain SD_BALANCE_FORK and
SD_BALANCE_EXEC at the right level.

> However,
> these three flags are all controlled by a single static threshold,
> node_reclaim_distance, which can neither tell them apart nor be changed.
> Different workloads on the same system favour different settings, so no
> single static value fits them all.
>=20
> The same applies to SD_BALANCE_NEWIDLE, which is set on every NUMA level
> and cannot be stripped. Newidle balance on a high NUMA level can take a
> long time, even when there is no task in the system to pull.

There is an existing boot knob relax_domain_level=3D ,
which clears SD_BALANCE_NEWIDLE on every domain at or above=C2=A0
the given level, see set_domain_attribute(). On Machine A,                 =
                                                                           =
                =20
relax_domain_level=3D<level of the distance-25 NUMA domain> should give    =
                                                                           =
                              =20
the same domain flags as newidle:20. Can you confirm with the              =
                                                                           =
                            =20
/sys/kernel/debug/sched/domains/ flags and rerun schbench with that        =
                                                                           =
                            =20
boot parameter and NI_RANDOM set?  I think we shouldn't introduce
another boot parameter to control the same flag.

I've made similar suggestions before to Kunyu in his test on Hygon system:
https://lore.kernel.org/lkml/6d8ff4593cc93c0033c6537eeac281085726c220.camel=
@linux.intel.com/

Will you achieve most of the gain for your workload after adjusting
node_reclaim_distance and setting appropriate relax_domain_level,
instead of introducing a new kernel parameter?=20

Tim
                                               =20
>=20
> Introduce a new kernel parameter, sched_numa_flag_distance, to let users
> tune the flags above separately on the NUMA levels. A group is stripped
> from the levels whose node distance is greater than the given value;
> once set, this overrides the default for that group:
>=20
>   sched_numa_flag_distance=3Dforkexec:<d>,newidle:<d>,wakeaffine:<d>
>=20
> Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
> ---
>=20
> Notes:
>     Test results
>    =20
>     All results are normalized to the default (no parameter) =3D 1.00.
>     UnixBench: higher is better; latency and time: lower is better.
>     kernel.numa_balancing=3D0 for all tests.
>    =20
>     Machine A: Hygon, 2 sockets, 256 CPUs, 8 nodes. All NUMA levels (15,
>     25, 27) are below node_reclaim_distance, so by default every NUMA lev=
el
>     has fork/exec, newidle and wake_affine.
>    =20
>       node   0   1   2   3   4   5   6   7
>         0:  10  15  15  15  25  27  27  27
>         1:  15  10  15  15  27  25  27  27
>         2:  15  15  10  15  27  27  25  27
>         3:  15  15  15  10  27  27  27  25
>         4:  25  27  27  27  10  15  15  15
>         5:  27  25  27  27  15  10  15  15
>         6:  27  27  25  27  15  15  10  15
>         7:  27  27  27  25  15  15  15  10
>    =20
>     Each setting was tested in its own boot of the same kernel:
>     forkexec:10 drops fork/exec balancing on every NUMA level, newidle:20
>     drops newidle balancing at distance 25 and 27. The default column is
>     the average of two boots without the parameter.
>    =20
>     forkexec:10, tested with C2 disabled on all CPUs
>     (echo 1 > /sys/devices/system/cpu/cpu*/cpuidle/state2/disable). The
>     two default boots differ by at most 2.9%.
>    =20
>     UnixBench (byte-unixbench), 1 copy, average of 3 rounds:
>    =20
>       ./Run -c 1 -i 3 execl spawn shell1 shell8
>    =20
>                                     default  forkexec:10
>       Execl Throughput                 1.00      1.27
>       Process Creation                 1.00      1.29
>       Shell Scripts (1 concurrent)     1.00      1.35
>       Shell Scripts (8 concurrent)     1.00      2.07
>    =20
>     Time spent in select_task_rq_fair() (function_graph) while one task
>     forks and reaps 10000 children, then forks 5000 children that exec
>     /bin/true, 3 times:
>    =20
>                                     default  forkexec:10
>       fork                             1.00      0.05
>       exec                             1.00      0.05
>    =20
>     newidle:20, tested with all C-states enabled. The two default boots
>     differ by at most 1%.
>    =20
>     schbench (git.kernel.org/pub/scm/linux/kernel/git/mason/schbench.git)=
,
>     8 message threads with 32 workers each, i.e. 256 worker threads, 30s
>     run after a 5s warmup, average of 3 runs:
>    =20
>       schbench -m 8 -t 32 -r 30 -w 5
>    =20
>                                     default  newidle:20
>       p99 wakeup latency               1.00      0.56
>       requests per second              1.00      1.00
>    =20
>     Machine B: Hygon, 2 sockets, 384 CPUs, 12 nodes. The NUMA levels at 3=
2,
>     35 and 38 are beyond node_reclaim_distance, so by default they have n=
o
>     fork/exec and no wake_affine.
>    =20
>       node   0   1   2   3   4   5   6   7   8   9  10  11
>         0:  10  19  15  12  15  12  32  35  32  29  38  35
>         1:  19  10  12  15  12  15  35  32  35  38  29  32
>         2:  15  12  10  12  15  12  32  35  38  35  32  35
>         3:  12  15  12  10  19  15  29  38  35  32  35  32
>         4:  15  12  15  19  10  12  38  29  32  35  32  35
>         5:  12  15  12  15  12  10  35  32  35  32  35  38
>         6:  32  35  32  29  38  35  10  19  15  12  15  12
>         7:  35  32  35  38  29  32  19  10  12  15  12  15
>         8:  32  35  38  35  32  35  15  12  10  12  15  12
>         9:  29  38  35  32  35  32  12  15  12  10  19  15
>        10:  38  29  32  35  32  35  15  12  15  19  10  12
>        11:  35  32  35  32  35  38  12  15  12  15  12  10
>    =20
>     Booted with sched_numa_flag_distance=3Dwakeaffine:255, i.e. wake_affi=
ne
>     on every NUMA level.
>    =20
>     hackbench from rt-tests (v2.20), pipes, each group being 20 senders a=
nd
>     20 receivers (40 tasks), 3 rounds of 3 runs:
>    =20
>       hackbench -p -g 4 -l 5000          (processes, 160 tasks)
>       hackbench -p -g 16 -l 1500         (processes, 640 tasks)
>       hackbench -p -T -g 4 -l 5000       (threads, 160 tasks)
>       hackbench -p -T -g 16 -l 1500      (threads, 640 tasks)
>    =20
>       time                          default  wakeaffine:255
>       processes, 4 groups              1.00      0.80
>       processes, 16 groups             1.00      0.69
>       threads, 4 groups                1.00      0.77
>       threads, 16 groups               1.00      0.69
>    =20
>     Open question
>    =20
>     This version only adds a boot parameter. Since the best setting follo=
ws
>     the workload, a runtime knob would be more useful. Would one be
>     acceptable, and if so, where: sysfs, or debugfs next to the other
>     scheduler tunables? Changing it at runtime would rebuild the sched
>     domains.
>=20
>  .../admin-guide/kernel-parameters.txt         | 15 +++
>  kernel/sched/topology.c                       | 92 ++++++++++++++++++-
>  2 files changed, 102 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 6169787d3805..e4d504992cce 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6798,6 +6798,21 @@ Kernel parameters
>  			cost of significant additional memory use for tables.
> =20
> =20
> +	sched_numa_flag_distance=3D [KNL,NUMA]
> +			Format: <group>:<distance>[,<group>:<distance>...]
> +			Strip a group of scheduler balance flags from the
> +			NUMA sched domain levels whose node distance is
> +			greater than <distance>. <group> is one of:
> +			forkexec   - SD_BALANCE_FORK and SD_BALANCE_EXEC,
> +				     default: node_reclaim_distance
> +			newidle    - SD_BALANCE_NEWIDLE, default: never
> +			wakeaffine - SD_WAKE_AFFINE,
> +				     default: node_reclaim_distance
> +			node_reclaim_distance is 30 (RECLAIM_DISTANCE), or
> +			32 on AMD Zen. A distance of 255 keeps the group on
> +			every NUMA level.
> +			Example: sched_numa_flag_distance=3Dforkexec:10,newidle:20
> +
>  	sched_proxy_exec=3D [KNL]
>  			Enables or disables "proxy execution" style
>  			solution to mutex-based priority inversion.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 919d0fb00bd9..3bcf0db0800a 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1947,6 +1947,92 @@ static struct cpumask		***sched_domains_numa_masks=
;
>  	 SD_NUMA		|	\
>  	 SD_ASYM_PACKING)
> =20
> +#ifdef CONFIG_NUMA
> +/*
> + * sched_numa_flag_distance=3D<group>:<distance>[,...]
> + *
> + * Strip a group of balance flags from the NUMA sched domain levels whos=
e
> + * node distance is greater than <distance>. Groups left unset keep the
> + * default: fork/exec and wake_affine are stripped beyond
> + * node_reclaim_distance, newidle is never stripped.
> + *
> + * Node distances grow with the level, so a group is stripped from a lev=
el
> + * and every level above it, as the SDF_SHARED_CHILD flags require.
> + */
> +enum {
> +	SD_DIST_FORKEXEC,
> +	SD_DIST_NEWIDLE,
> +	SD_DIST_WAKEAFFINE,
> +	SD_DIST_NR,
> +};
> +
> +static const struct {
> +	const char	*name;
> +	unsigned int	flags;
> +} sd_dist_groups[SD_DIST_NR] =3D {
> +	[SD_DIST_FORKEXEC]	=3D { "forkexec",	  SD_BALANCE_FORK | SD_BALANCE_EXE=
C },
> +	[SD_DIST_NEWIDLE]	=3D { "newidle",	  SD_BALANCE_NEWIDLE },
> +	[SD_DIST_WAKEAFFINE]	=3D { "wakeaffine", SD_WAKE_AFFINE },
> +};
> +
> +/* -1: not set on the command line. */
> +static int sd_dist[SD_DIST_NR] __ro_after_init =3D { -1, -1, -1 };
> +
> +static int __init setup_sched_numa_flag_distance(char *str)
> +{
> +	int dist[SD_DIST_NR] =3D { -1, -1, -1 };
> +	char *tok;
> +	int i;
> +
> +	while ((tok =3D strsep(&str, ",")) !=3D NULL) {
> +		char *val =3D strchr(tok, ':');
> +		int d;
> +
> +		if (!val)
> +			goto invalid;
> +		*val++ =3D '\0';
> +
> +		for (i =3D 0; i < SD_DIST_NR; i++) {
> +			if (!strcmp(tok, sd_dist_groups[i].name))
> +				break;
> +		}
> +		if (i =3D=3D SD_DIST_NR || kstrtoint(val, 10, &d) || d < 0)
> +			goto invalid;
> +
> +		dist[i] =3D d;
> +	}
> +
> +	memcpy(sd_dist, dist, sizeof(sd_dist));
> +	return 1;
> +
> +invalid:
> +	pr_warn("sched_numa_flag_distance=3D: invalid entry \"%s\", ignored\n",=
 tok);
> +	return 1;
> +}
> +__setup("sched_numa_flag_distance=3D", setup_sched_numa_flag_distance);
> +
> +/* Balance flags to strip from a NUMA level of node distance @distance. =
*/
> +static unsigned int sd_numa_strip_flags(int distance)
> +{
> +	unsigned int flags =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < SD_DIST_NR; i++) {
> +		int d =3D sd_dist[i];
> +
> +		if (d < 0) {
> +			if (i =3D=3D SD_DIST_NEWIDLE)
> +				continue;
> +			d =3D node_reclaim_distance;
> +		}
> +		if (distance > d)
> +			flags |=3D sd_dist_groups[i].flags;
> +	}
> +
> +	return flags;
> +}
> +#endif /* CONFIG_NUMA */
> +
>  static struct sched_domain *
>  sd_init(struct sched_domain_topology_level *tl,
>  	const struct cpumask *cpu_map,
> @@ -2030,11 +2116,7 @@ sd_init(struct sched_domain_topology_level *tl,
> =20
>  		sd->flags &=3D ~SD_PREFER_SIBLING;
>  		sd->flags |=3D SD_SERIALIZE;
> -		if (sched_domains_numa_distance[tl->numa_level] > node_reclaim_distanc=
e) {
> -			sd->flags &=3D ~(SD_BALANCE_EXEC |
> -				       SD_BALANCE_FORK |
> -				       SD_WAKE_AFFINE);
> -		}
> +		sd->flags &=3D ~sd_numa_strip_flags(sched_domains_numa_distance[tl->nu=
ma_level]);
> =20
>  #endif /* CONFIG_NUMA */
>  	} else {
