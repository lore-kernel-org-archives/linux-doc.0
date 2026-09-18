Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC69502543
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747449; cv=pass; b=BF1RiFpRHLSmTCLPiwhN2DbuxA5bIlIenSlQeRIjH2xHBHPj/OUOZuataP6ZMtC/7QZVakZStzwMNCN0Lzid5Wl3htQUmlxrmusQofht6gqgMM5AKJXIEtnUnYPGovDRnbSjHhWho4eJlxGGz/Drey3hRRe4VC/aw5PkBeMaRCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747449; c=relaxed/simple;
	bh=e8E1Sd+Sz6mdjj4gnYZyTv8EBELZRQrTF6yHFbOuTR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg5c0zq7l1s9zaaqGXJSa5t35vQzSiMe6sjd4Kb6Zf0tRUtCluhFVbGRyR0XW9kkOyQbPiIRiWQY5aAGmxfgMRMrdJY1HsZuvMB3SBKtGPPee6qaMNqcxKITskuSA9SaIBR+IAqiYJI17PpnLDcAcyOz7wKNY0nYZPwQwvMWdv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOktmTOZ; arc=pass smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOktmTOZ"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so130183566b.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 09:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789747445; cv=none;
        d=google.com; s=arc-20260327;
        b=EXE0xbCUq5Bwt6MDzWjC6WqN5wkVC5jOCVfX7x5wZma7Lemvn/vcCcYq41S0zYPzmD
         nvz4EHhHf+/NPLOuhKuSz6NOtYbXm7gO8QJghMngwLNTUH4qc5kUBtDCCKKDegVEurDO
         MtJLQEKjIfiy7lJCKdvE7tV+sot2KOnrA9NMEbvNmG+039EoMyJELyQzyC4yXiZ6ZwoE
         F4UuJkgFfj0AyZ5GZMDCvwPzpRBpxc9sokTHvne0lvd66HWErO46+KtKpuzn9ECqci5m
         SBQOszh3QGap2lUHJ+9uA4Pyxrxos1AxHYYyfQHeI3qwh/MvotSKvchKfHBxvTgtGbAt
         O6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ppT3r9H6i+luukHF53KqdAzjj96gufCZfRFaRDgHG+g=;
        fh=KRKF34QrmmCdRc5hfaidSYaFDC8TQlAECt4oDm4LZ5Q=;
        b=b5bR6YP6+7VUUyfJpUk1owpIsDVif/b3bfkoTXDfvaG4i5Qk7tqeYymsVfA/Y7pJOx
         3ojIRL+t1mj69/9v+B+o4dwM9BLPpb4zHuGwgAqLVxXAsNwhVe+KfLWnvSSXjXikRriU
         vEQQXFF3ALMkCfWkDJf9p0KO68IlO+T5slxcF88pz98sxnYnB6VAxhXbIU+jeWc18h5M
         B1h0pmjciZdcj5HhTtNg+sXHYH681urbBF0j97CqWMKhFZlCtRjKJ5T/oeEid1RQXZ8p
         hniiNNWU1kia49Wg5Eg+XW2WvNI9egoWfYeui9uI2ckGldmWadGfuGyUUdJIlYEWMdHl
         oVcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789747445; x=1790352245; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppT3r9H6i+luukHF53KqdAzjj96gufCZfRFaRDgHG+g=;
        b=oOktmTOZDFag8SiSHgHc9TTeZATW/5c7ki/GvpG1KeeA9GtX9+w5d+/wDeXMRr4Riw
         HgApXlLtPIeHT3Voh8mYi2IFYX8cMdNgdWwCCT0Q7BPwVrKEVchdMSobnR45LmmjILd9
         L3Dq4DBhS1IboOqmqOJ5mrENGZT46cghimykEE1dd9EYgRMZjs/lK3de+GJw78CteGpe
         yWWvpwIw8m3XunL7WrFa6peg02ElzE5pOJFk7uFy7Z6CPxxKwkOdJfgfN1dTP0Z7z/kD
         P2PBw6nu1sK+AhhA8nuQAWyh4yf2zK3BnAaAGXI4yXXPQfGclVepZ0rNKodWTAyNUYJr
         I6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747445; x=1790352245;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ppT3r9H6i+luukHF53KqdAzjj96gufCZfRFaRDgHG+g=;
        b=u/EaP/6fHiBRMInQjxMGb08oK/UEB4kdnn7OFYecjZh0+kWpiIwEZLj1t8Db8Nxczx
         TUuQkWdG1ZGkxT4AFnWH5ZQ3Uvv5RS2gkzgrfaUNdoFlP9Gaszh/ciTOCuh4WdLWLfVH
         SWyamQsbmVnB+5/ntGb9iZMhEY7z7Wd7FZZmHbvMqj2Nvm9WJUoUekdlfVlvcCAwADkz
         zxKFlR9cdaOJlrQA+FIlH4HMhB3vybuH06zm/z4hCa0sG4e/kmxBpA4S2RN6FAoxKiAd
         ll+fG2ksm8j7YXD6SxCj6d1XmLEY6Xv8oWVDwRM7WYs7kvUwSR1O9vyirCdu/17YbMYx
         ZA1g==
X-Forwarded-Encrypted: i=1; AKwUvByxLte4y9NHB1fS8ZeRqJsM9h0+wEAIbVSvIsIE0jCRDJTR3WnNjP5qwsEVBqBJMejn9Dcg065mcWs=@vger.kernel.org
X-Gm-Message-State: AFuF++lpbprpFssv6oYdufe2eZ/ppGObR9tWRL2zDcjR7pjJkMofynO6
	+H1rHTxR7xM79XvWWTCW2wtfm130X9Hz+3J/ema08txcpKtQUn7hT6lAQ2ZYPIRC0K5eNqq2ETY
	f8OiyoAVFxR8yjxp0/svA262XPLecCC47Ymr5xxXYxA==
X-Gm-Gg: AYBFou1M30BZSNagT9FZNNkaIxphdec9CkMs5nB6qry1CvWMwC2EHFkrVHZ6DYcnZOx
	MOkoqKOGOXT2+a9OgEV2/Hvcaj1NPlqTO4Gmx1IhGZn5aqkVhG2Kqsdp30TVPh2qQsRpucT+pJD
	ZAGWyKVqRKdfH6TgBn7QZM+htRDjwDV1ehtKoLuMtbKT7p3dXRcYp2cXhRRRXxpHkF4EYfHqWZV
	2ron9byPri3vI/yL/K8Qp0LSdmWtZxoqtmVS7DaJGyXGyJFqa/8M1RAA+1uekcBu3woqpt6+TcK
	Emf7T8s8OnwYCAP6whqYrB/P94VIcnR+E1HVUytVrQp5Fb2+ciDKJwJ3lGnKtVqtrTj+0J/39UF
	3P5ON4eY/z5TH9obUAomIAuo=
X-Received: by 2002:a17:907:6d18:b0:c25:1b4f:6d95 with SMTP id
 a640c23a62f3a-c2a15846860mr322061066b.6.1789747445182; Fri, 18 Sep 2026
 09:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917140707.3807229-1-arighi@nvidia.com> <20260917140707.3807229-3-arighi@nvidia.com>
 <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
In-Reply-To: <97c99014-d488-4468-896a-decf55636fa5@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 18:03:53 +0200
X-Gm-Features: AcwNN1USB5p2YVPGgPCgBjy8koye-M1_CjYA522mynrjae0MUkzSe9gahiKJVgo
Message-ID: <CAKfTPtD6i7BMpfnj4pEPJMMOSXyMWL63YDX00d+jRTn0x+ot7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/topology: Add asymmetric SMT packing override
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Andrea Righi <arighi@nvidia.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Christian Loehle <christian.loehle@arm.com>, Srikar Dronamraju <srikar@linux.ibm.com>, 
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 16:15, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>
> Hi Andrea,
>
> On 9/17/26 7:35 PM, Andrea Righi wrote:
> > Architectures can use SD_ASYM_PACKING to describe preferred CPU ordering
> > at the SMT scheduling domain. Some systems benefit from the same policy,
> > but their firmware cannot currently describe the preference. Inferring
> > it from the CPU model would embed a platform-specific policy in the
> > kernel.
> >
> > Add the sched_smt_asym_packing boot option to override SD_ASYM_PACKING
> > at the SMT level. Accept auto, on and off. Auto preserves the
> > architecture-provided topology and is also the default when the option
> > is absent. On and off force the flag without changing asymmetric packing
> > at higher topology levels.
> >
> > Apply the override centrally to domains with SD_SHARE_CPUCAPACITY so it
> > also covers architectures with custom SMT topology callbacks, including
> > powerpc. When forced on, priority remains defined by
> > arch_asym_cpu_priority(). The weak default prefers lower-numbered
> > logical CPUs, while architecture overrides remain authoritative.
> > Siblings with equal priorities remain unordered.
> >
>
> Wasn't this a temporary solution you wanted until the firmware changes are
> sorted out? or something changed in between?
>
> If yes, could you please capture that in changelog or in comment.
>
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >   .../admin-guide/kernel-parameters.txt         | 11 +++++
> >   kernel/sched/topology.c                       | 49 +++++++++++++++++++
> >   2 files changed, 60 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 33cd30996e47e..36c3b2e563441 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -6799,6 +6799,17 @@ Kernel parameters
> >                       solution to mutex-based priority inversion.
> >                       Format: <bool>
> >
> > +     sched_smt_asym_packing= [KNL,SMP]
> > +                     Override asymmetric packing at the SMT scheduling domain.
> > +                     Format: { auto | on | off }
> > +                     auto: Preserve the architecture default. This is the
> > +                     default when the option is omitted.

AFAICT "auto" equals nothing added in the command line so why is it needed ?

> > +                     on: Force asymmetric packing at the SMT scheduling domain.
> > +                     Idle CPU selection prefers siblings with a higher
> > +                     architecture-defined priority. Siblings with equal
> > +                     priorities remain unordered.
> > +                     off: Ignore SMT sibling priorities.

Is this for debugging purposes?

only the sched_smt_asym_packing=on is really useful to force
asym_packing when firmware doesn't provide the info

> > +
>
> Wasn't this option/parameter to come from arch specific file?
>
> Isn't it going to be confusing for archs which don't benefit from asym packing at SMT,
> but now there is kernel parameter to say on.
>
> >       sched_verbose   [KNL,EARLY] Enables verbose scheduler debug messages.
> >
> >       schedstats=     [KNL,X86] Enable or disable scheduled statistics.
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 0248227d983a7..cdfcecf673fd7 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -32,6 +32,46 @@ static int __init sched_debug_setup(char *str)
> >   }
> >   early_param("sched_verbose", sched_debug_setup);
> >
> > +#ifdef CONFIG_SCHED_SMT
> > +enum sched_smt_asym_packing_mode {
> > +     SCHED_SMT_ASYM_PACKING_AUTO,
> > +     SCHED_SMT_ASYM_PACKING_ON,
> > +     SCHED_SMT_ASYM_PACKING_OFF,
> > +     SCHED_SMT_ASYM_PACKING_NR,
> > +};
> > +
> > +static enum sched_smt_asym_packing_mode sched_smt_asym_packing __read_mostly =
> > +     SCHED_SMT_ASYM_PACKING_AUTO;
> > +
> > +static const char * const sched_smt_asym_packing_modes[SCHED_SMT_ASYM_PACKING_NR] = {
> > +     [SCHED_SMT_ASYM_PACKING_AUTO]   = "auto",
> > +     [SCHED_SMT_ASYM_PACKING_ON]     = "on",
> > +     [SCHED_SMT_ASYM_PACKING_OFF]    = "off",
> > +};
> > +
> > +static int __init sched_smt_asym_packing_parse(const char *str)
> > +{
> > +     for (int mode = 0; mode < SCHED_SMT_ASYM_PACKING_NR; mode++) {
> > +             if (!strcmp(str, sched_smt_asym_packing_modes[mode]))
> > +                     return mode;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int __init setup_sched_smt_asym_packing(char *str)
> > +{
> > +     int mode = sched_smt_asym_packing_parse(str);
> > +
> > +     if (mode < 0)
> > +             return 0;
> > +
> > +     sched_smt_asym_packing = mode;
> > +     return 1;
> > +}
> > +__setup("sched_smt_asym_packing=", setup_sched_smt_asym_packing);
> > +#endif
> > +
> >   static inline bool sched_debug(void)
> >   {
> >       return sched_debug_verbose;
> > @@ -1950,6 +1990,15 @@ sd_init(struct sched_domain_topology_level *tl,
> >       if (WARN_ONCE(sd_flags & ~TOPOLOGY_SD_FLAGS,
> >                     "wrong sd_flags in topology description\n"))
> >               sd_flags &= TOPOLOGY_SD_FLAGS;
> > +#ifdef CONFIG_SCHED_SMT
> > +     if (sd_flags & SD_SHARE_CPUCAPACITY) {
> > +             if (sched_smt_asym_packing == SCHED_SMT_ASYM_PACKING_ON)
> > +                     sd_flags |= SD_ASYM_PACKING;
> > +             else if (sched_smt_asym_packing ==
> > +                      SCHED_SMT_ASYM_PACKING_OFF)
> > +                     sd_flags &= ~SD_ASYM_PACKING;
> > +     }
> > +#endif
> >       sd_flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
> >
> >       *sd = (struct sched_domain){
>
