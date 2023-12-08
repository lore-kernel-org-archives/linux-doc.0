Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e+67vVrk"
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0289A1700
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 11:22:45 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d1d307bbb3so18785ad.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 11:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702063364; x=1702668164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ30NYGkjbX21PN8dBphQWbz/hwhfTyVX43/tAQx5MY=;
        b=e+67vVrkWgtowE8T0B2/6pvrUPb7JRkiDCGV+ZyA4WG047KFlfArw7P2ojuK/uxbwE
         tIZs3Bf3+C6LUFCDFxNDlwhaG89lwY+COojS3pzOIVPBytGELlodDeQITV90Vh4w1oB+
         gHyWsuQBL938RTHdFNlheVWxycfIZQ23SPRcncjkfD9kRNDKP8Ln/xvDfFUrk/4EMb5V
         LFSWwmSdNZV1gIHGZ3HBYiyR1j5tI7oyW997lIn/OtxyFZnUlnRg7ezvnZ7cMQsURzmx
         G+PzGBm6RSPoBKsX18UrAIX38+iLGTE5fmFB6CBWtMDV/T7Zcz1V2k7Umj4olTqsSHB5
         KCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702063364; x=1702668164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ30NYGkjbX21PN8dBphQWbz/hwhfTyVX43/tAQx5MY=;
        b=kS/Zm39uSx03skvJm6n7VgpW035mv4QZOfWQMNF9Q/tN6KhCGIsEg34UGVN61V656X
         7bo6Oe2ydfMvTpDkphHwDarhNcKp2dMa8n9rrirB7JSoKBjDI4wgzN28AJONe57xL3mZ
         Q8YlfmAlfmm59VRKvQKPBDfJqTZrbU9yMb6RAC4u2zkmcJFOUfDh+LOloFfWvWq9wCZO
         0ppj+d09nXuJam4WREVBLg19cuupvUgz6xHc888vIQCRKtvmDu6kaedPKz86SbzVuhsz
         9usd+ANT27lsREEeo6UFv+p+YfdSsvWgtZsfmVL5HMyQ0DpUbLIBYGCP8MY6FSKXPKAf
         BzRg==
X-Gm-Message-State: AOJu0YxI/R3wHIPxNp3Uon7hrai3dZw1hBmXHjGirYC9Ru8qAkSAMQFN
	xKOCM0QjSl5SWCNVSjmebXvpQoFDdpjcFVnlqHDgzg==
X-Google-Smtp-Source: AGHT+IGasWbbXvVDHLeMypAYC8mh/pLHr897bAE6/ckWJyPBsRxFn+J1youQDVPIKNs88w/EVxdL10enFiyIBoZk4VI=
X-Received: by 2002:a17:902:e881:b0:1d0:4548:97ff with SMTP id
 w1-20020a170902e88100b001d0454897ffmr195882plg.13.1702063364214; Fri, 08 Dec
 2023 11:22:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201214737.104444-1-tony.luck@intel.com> <20231207195613.153980-1-tony.luck@intel.com>
 <20231207195613.153980-4-tony.luck@intel.com>
In-Reply-To: <20231207195613.153980-4-tony.luck@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 8 Dec 2023 11:22:33 -0800
Message-ID: <CALPaoCgjHb3HiS9u9v2FZHL=h2VohU+X=GVpDo-u2k2pXQu8PA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] x86/resctrl: Add new "mba_MBps_event" mount option
 to documentation
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	Shaopeng Tan <tan.shaopeng@fujitsu.com>, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 11:56=E2=80=AFAM Tony Luck <tony.luck@intel.com> wro=
te:
>
> New mount option may be used to choose a specific memory bandwidth
> monitoring event to feed the MBA Software Controller(mba_sc) feedback
> loop.
>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  Documentation/arch/x86/resctrl.rst | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/=
resctrl.rst
> index a6279df64a9d..a0c521db6786 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -35,7 +35,8 @@ about the feature from resctrl's info directory.
>
>  To use the feature mount the file system::
>
> - # mount -t resctrl resctrl [-o cdp[,cdpl2][,mba_MBps][,debug]] /sys/fs/=
resctrl
> + # mount -t resctrl resctrl [-o cdp[,cdpl2][,mba_MBps] \
> + [,mba_MBps_event=3D[mbm_local_bytes|mbm_total_bytes]][,debug]] /sys/fs/=
resctrl
>
>  mount options are:
>
> @@ -45,7 +46,12 @@ mount options are:
>         Enable code/data prioritization in L2 cache allocations.
>  "mba_MBps":
>         Enable the MBA Software Controller(mba_sc) to specify MBA
> -       bandwidth in MBps
> +       bandwidth in MBps. Defaults to using MBM local bandwidth,
> +       but will use total bandwidth on systems that do not support
> +       local bandwidth monitoring.
> +"mba_MBps_event=3D[mbm_local_bytes|mbm_total_bytes]":
> +       Enable the MBA Software Controller(mba_sc) with a specific
> +       MBM event as input to the feedback loop.
>  "debug":
>         Make debug files accessible. Available debug files are annotated =
with
>         "Available only with debug option".
> @@ -538,6 +544,12 @@ where as user can switch to the "MBA software contro=
ller" mode using
>  a mount option 'mba_MBps'. The schemata format is specified in the below
>  sections.
>
> +By default the software feedback mechanism uses measurement of local
> +memory bandwidth to make adjustments to throttling levels. If a system
> +is running applications with poor NUMA locality users may want to use
> +the "mba_MBps_event=3Dmbm_total_bytes" mount option which will use total
> +memory bandwidth measurements instead of local.
> +
>  L3 schemata file details (code and data prioritization disabled)
>  ----------------------------------------------------------------
>  With CDP disabled the L3 schemata format is::
> --
> 2.41.0
>

for content:

Reviewed-by: Peter Newman <peternewman@google.com>
