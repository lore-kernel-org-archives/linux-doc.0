Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D72ECD17
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587638; cv=none; b=OL7Rxqv5jdA15vOPEMUlgbv0v31id/yQ4iRJiQRK/C1kcDbMjovjbvx9HhG2jXqwfQbKPdF4n3FarNN/6hANpNu0ZGdNjPlKeZ7xYSKeHyuR88aowROphAEcPJSNJP6J9sM/C6tjGPrESJSSHaIsNoRvJEdlpRr8ofRTJ92UZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587638; c=relaxed/simple;
	bh=uwwxjasqJO4igk7PtzbSMKJC28eJ5VJq6uwNzKFK2rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZXXXU0REvikLjqznkgRLvmcHMvojeOK1X5pTmtTEUS+vliGZVmAB9WV/b8cy1vR7B3woh78Ub4a+xhT2pLCqd7kB63pRgvqpKZR5quhHT2UcuhRVlbAhDJA2EmPqeACSu5PYCi1ds33sS0k8NRAdDK/CvKRFqsLepP14IX36GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GRJtgFS7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GRJtgFS7"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae708b0e83eso680043066b.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752587635; x=1753192435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+emUCSqonhgPO/mBqwd8p0rIuEhAfbqyYT1Ou3tLrYA=;
        b=GRJtgFS75TXsxrXHZgjPwGwVIuo4p8bh5lWkLM4qSoXskkfXsqON1K+7K/8+OBCgtY
         Xy68Hsya4oDDkfcMAwumZsm+j3zUoT5bpDk/rR+TTINVao/YXpiz2C1bT1z/kV1Xlx6D
         ZcUJH/SbkLYmusMHYv6vDdLY0XlhD25Kn8KZv4duza0Fb+Ea024ijfKH9FeejuHVN+Na
         +M96n6M1twVL0oERpbxV3axL9r1JbzdVxzQEnOaU5WolYnM8cSyhmyEhA3SexzCjHIAP
         4cm0UKIjsJgvBr+1Qtfyor+yi28TSbSENO3Iq1P8yGVtduH+vhSlph9HTambmdrItyda
         TyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752587635; x=1753192435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+emUCSqonhgPO/mBqwd8p0rIuEhAfbqyYT1Ou3tLrYA=;
        b=COR+YedBYYvaPFhn9ZwIq6sWqWmtynOOCxNrt0QneI/+ItjrRXKNyX0va7pZXkTfMx
         6zlye/ZCbCSDtcXyVEIWDtGb0CV/VgGrNT3mzd7TbBefq1dHX53ajd6iKu8zJ4TWYYeO
         ALE+FJcOQ4jcCZN8Si7xt+4baBS0Qug5b2MMgsXPM9aFVPes1UGcSecIQENUd0ASZyqh
         P7ETtrqNxrxhsNZWJQDJPO7YiaMaerf+XpoRY15/Oj+Uoz1+n1/V5IMXgt1xKhb+uaCi
         dJLeqNEAt93AfXlX/eN9Kw6LgPPjE2mGoyTQbkskEVUSYtXJld0LZefEojFybNnpZk+Y
         ftfw==
X-Forwarded-Encrypted: i=1; AJvYcCW4vKL8I5mIxZ04z/ytHP2LJo95xN5qlACE1GO+ISKzClNxO4/nBS4dQmKPb5sydfH7JYQbOLigYfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbHwW08puAshlrDhJgK8ZyaadLMla6V5GUDSRwiA1LDykX0AQ
	gZdcNnLCzTbqxUqgFJ9jwzpD5J2uSihQNmqTr2ckmm4ARuGWPFT0ayxj95Evs4LMpau+/79m7lQ
	TIEPF0QbrjGKifWCSlnUFDXwfoVphYFZ+HagOk0Tr
X-Gm-Gg: ASbGnctvUm6DInF9lDwx0cCudpL3/Gw/kQqkjaJbwyOSs+n1TNQczL53CmKMN9d+Yhy
	D5FJ/7tnkLjKH7BAzPgc8n5S8EPCXUGCGiq1QWF/yFYJ5wMuFItAxWm+PUC0rWy3bUYha5VDEoa
	eQgE04w2TL1/VdxpySZ4gY8SNRiVMzJNhvDRd+oL4H89aGK6AuZORJ1DnP4m75YhnRjveRJU/76
	EAkpokWEka0iWv6c9Aq0tn2//hiyFtabB5HFesfRxwp+l+Z52EyNjjRRw4=
X-Google-Smtp-Source: AGHT+IERF1/bo0VQBuoWVJ9tpQdiclnsg8TMQW/I/rho0GuxJPXxVFv2J9fakl2U5LCZCZQ8xTHhKdK/oecdr3Ua8ME=
X-Received: by 2002:a17:906:d553:b0:ae6:c561:764a with SMTP id
 a640c23a62f3a-ae6fbe131b4mr1920472066b.2.1752587634822; Tue, 15 Jul 2025
 06:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1752013061.git.babu.moger@amd.com> <ef5934fc2b04654c7ff3e6bb910e7c5cf38ba62d.1752013061.git.babu.moger@amd.com>
In-Reply-To: <ef5934fc2b04654c7ff3e6bb910e7c5cf38ba62d.1752013061.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Tue, 15 Jul 2025 15:53:43 +0200
X-Gm-Features: Ac12FXy18Iy0Vh7y87naP_-8Yfnci7AJuMjWFtBmmx9YWoDFzxmVXKFcUP3ysqI
Message-ID: <CALPaoCjN7-1fBF+6x1X4SfhRyx6L8aWaOfqOLQzKMRp=zHiyFg@mail.gmail.com>
Subject: Re: [PATCH v15 28/34] fs/resctrl: Introduce mbm_assign_on_mkdir to
 enable assignments on mkdir
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, 
	james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, Dave.Martin@arm.com, x86@kernel.org, 
	hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org, 
	rostedt@goodmis.org, Neeraj.Upadhyay@amd.com, david@redhat.com, arnd@arndb.de, 
	fvdl@google.com, seanjc@google.com, jpoimboe@kernel.org, 
	pawan.kumar.gupta@linux.intel.com, xin@zytor.com, manali.shukla@amd.com, 
	tao1.su@linux.intel.com, sohil.mehta@intel.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, peterz@infradead.org, xin3.li@intel.com, 
	kan.liang@linux.intel.com, mario.limonciello@amd.com, thomas.lendacky@amd.com, 
	perry.yuan@amd.com, gautham.shenoy@amd.com, chang.seok.bae@intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, eranian@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Jul 9, 2025 at 12:22=E2=80=AFAM Babu Moger <babu.moger@amd.com> wro=
te:
>
> The "mbm_event" counter assignment mode allows users to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.
>
> Introduce a user-configurable option that determines if a counter will
> automatically be assigned to an RMID, event pair when its associated
> monitor group is created via mkdir.
>
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v15: Fixed the static checker warning in resctrl_mbm_assign_on_mkdir_writ=
e() reported in
>      https://lore.kernel.org/lkml/dd4a1021-b996-438e-941c-69dfcea5f22a@in=
tel.com/
>
> v14: Added rdtgroup_mutex in resctrl_mbm_assign_on_mkdir_show().
>      Updated resctrl.rst for clarity.
>      Fixed squashing of few previous changes.
>      Added more code documentation.
>
> v13: Added Suggested-by tag.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c/monitor.c file has now been split between the FS and =
ARCH directories.
>
> v12: New patch. Added after the discussion on the list.
>      https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVG=
bQ86nD+Q2_SA@mail.gmail.com/
> ---
>  Documentation/filesystems/resctrl.rst | 16 ++++++++++
>  fs/resctrl/monitor.c                  |  2 ++
>  fs/resctrl/rdtgroup.c                 | 43 +++++++++++++++++++++++++++
>  include/linux/resctrl.h               |  3 ++
>  4 files changed, 64 insertions(+)
>
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesy=
stems/resctrl.rst
> index 06c8c08d0341..f9e9a8a66cae 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -354,6 +354,22 @@ with the following files:
>           # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes=
/event_filter
>            local_reads,local_non_temporal_writes
>
> +"mbm_assign_on_mkdir":
> +       Determines if a counter will automatically be assigned to an RMID=
, event pair
> +       when its associated monitor group is created via mkdir. It is ena=
bled by default
> +       on boot and users can disable by writing to the interface.
> +
> +       "0":
> +               Auto assignment is disabled.
> +       "1":
> +               Auto assignment is enabled.
> +
> +       Example::
> +
> +         # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
> +         # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
> +         0
> +
>  "max_threshold_occupancy":
>                 Read/write file provides the largest value (in
>                 bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 0722e72f6cb1..ccca2330eebd 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -984,6 +984,8 @@ int resctrl_mon_resource_init(void)
>                 resctrl_file_fflags_init("available_mbm_cntrs",
>                                          RFTYPE_MON_INFO | RFTYPE_RES_CAC=
HE);
>                 resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CO=
NFIG);
> +               resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MO=
N_INFO |
> +                                        RFTYPE_RES_CACHE);
>         }
>
>         return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 4889e7556cc7..b7289ce2b3a6 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1987,6 +1987,42 @@ static ssize_t event_filter_write(struct kernfs_op=
en_file *of, char *buf,
>         return ret ?: nbytes;
>  }
>
> +static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
> +                                           struct seq_file *s, void *v)
> +{
> +       struct rdt_resource *r =3D rdt_kn_parent_priv(of->kn);
> +
> +       mutex_lock(&rdtgroup_mutex);
> +       rdt_last_cmd_clear();
> +
> +       seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
> +
> +       mutex_unlock(&rdtgroup_mutex);
> +
> +       return 0;
> +}
> +
> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file=
 *of,
> +                                                char *buf, size_t nbytes=
, loff_t off)
> +{
> +       struct rdt_resource *r =3D rdt_kn_parent_priv(of->kn);
> +       bool value;
> +       int ret;
> +
> +       ret =3D kstrtobool(buf, &value);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&rdtgroup_mutex);
> +       rdt_last_cmd_clear();
> +
> +       r->mon.mbm_assign_on_mkdir =3D value;
> +
> +       mutex_unlock(&rdtgroup_mutex);
> +
> +       return 0;

I noticed that "echo 0 > mbm_assign_on_mkdir" never completes. This
should return nbytes.

Thanks,
-Peter
