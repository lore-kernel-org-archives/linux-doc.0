Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9F0E71D42
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 14:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbjI2Oyg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 10:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbjI2Oyf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 10:54:35 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507591AE
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 07:54:33 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41958410e5cso399781cf.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695999272; x=1696604072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBAL4EDpae0eUiRs93XffuRh0a5um0LmWA13bYCfeZo=;
        b=U2S9dFQl2JN5OJg948CTWsigjb3Pt5S1wqjHTmwJeHOpx8NKFZrLo2SDyW6sKlX2C5
         DW5F2kKuW+dgkx8cjq02BwV3C0N5Tc9qv4UZaRdfptMw+0C89vkkC3BiYdsnHxN55Vmq
         riSgNDSTG7XkXWOHhuE7e4nRIb3IPPMHMgYvK31WidtiuaFsYgUyOAZaoKPWpYV7KFIY
         WBXzaNHJ7ic2OgNH59mJQ+h/hW72dOtf2HjB1BjkoqdlPz8AgRUGZsaPPNw/VMZ37Qvq
         JdkrY4du2ahazHlE0PdeVpABEwlto7ozVE2dEQrdm0Xbwb9GV1AEyh+aWoR8s07OJgWT
         gTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695999272; x=1696604072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBAL4EDpae0eUiRs93XffuRh0a5um0LmWA13bYCfeZo=;
        b=I4DX2VWGLFZkTxj9FKeoBSNzZxM0gHQw0KpxWqF6Max2JVggCV01ZW+wPGbX55IHz7
         H7r1JSrDMN2qAIRMi7+FIe3yvI8yvI2mMaUhkiJY1uiKP/qxV+Rued+KbalwEQPPnk0q
         Xf5MVJF/al1iFR4JiNCfHtQHVsvxWBK6qJhH16LI3I0oiH/G4axG3xU0ZOzuDIGPMJX9
         D5B2wC8MiMp89jha2NRMnusXlNsN7EdXQWcw6d9UNmNIqsa8dMW1u8uYZC20rEPAsFIw
         8Cy5CKFL2GCmk5a7aMkbv+a3cG6JDpc12mef4x2fZ3v0EGwd/EQlCWaguMIY3MePYM0a
         8x6g==
X-Gm-Message-State: AOJu0YweCbIGQ3PJY1+ocas1rAUlXS5pQuk5R9/L7C9ZuoxiuyDOu0Az
        Y1sTIJjaK8V6OnPXcYxupa8+G+D8pUQljcArCDNKyw==
X-Google-Smtp-Source: AGHT+IHdknSO/VSzS3NkRmSfc1a0t3O7BBzcNPYBrwXaAE1EUNUzAdWqe3maQyYUj8GbUdaFGM+Ua3YJrM7ZZKjlU7U=
X-Received: by 2002:ac8:5684:0:b0:419:6cf4:2474 with SMTP id
 h4-20020ac85684000000b004196cf42474mr337653qta.2.1695999272306; Fri, 29 Sep
 2023 07:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230829234426.64421-1-tony.luck@intel.com> <20230928191350.205703-1-tony.luck@intel.com>
 <20230928191350.205703-9-tony.luck@intel.com>
In-Reply-To: <20230928191350.205703-9-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 29 Sep 2023 16:54:21 +0200
Message-ID: <CALPaoCgPXPF_fn9fh15rW0JWUhxth5wOO51n+oHqibP+a6Qjfg@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] x86/resctrl: Update documentation with Sub-NUMA
 cluster changes
To:     Tony Luck <tony.luck@intel.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Thu, Sep 28, 2023 at 9:14=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/=
resctrl.rst
> index cb05d90111b4..d6b6a4cfd967 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -345,9 +345,15 @@ When control is enabled all CTRL_MON groups will als=
o contain:
>  When monitoring is enabled all MON groups will also contain:
>
>  "mon_data":
> -       This contains a set of files organized by L3 domain and by
> -       RDT event. E.g. on a system with two L3 domains there will
> -       be subdirectories "mon_L3_00" and "mon_L3_01".  Each of these
> +       This contains a set of files organized by L3 domain or by NUMA
> +       node (depending on whether Sub-NUMA Cluster (SNC) mode is disable=
d
> +       or enabled respectively) and by RDT event. E.g. on a system with
> +       SNC mode disabled with two L3 domains there will be subdirectorie=
s
> +       "mon_L3_00" and "mon_L3_01". The numerical suffix refers to the
> +       L3 cache id.  With SNC enabled the directory names are the same,
> +       but the numerical suffix refers to the node id.
> +       Mappings from node ids to CPUs are available in the
> +       /sys/devices/system/node/node*/cpulist files. Each of these

The explanation of mon_data seems overwhelmingly SNC-centric now.
Maybe the SNC section should be responsible for explaining its impact
on the mon_data directory. Mainly by reminding the reader that domain
ids in the mon_data directory are node ids in SNC mode.


>         directories have one file per event (e.g. "llc_occupancy",
>         "mbm_total_bytes", and "mbm_local_bytes"). In a MON group these
>         files provide a read out of the current value of the event for
> @@ -452,6 +458,28 @@ and 0xA are not.  On a system with a 20-bit mask eac=
h bit represents 5%
>  of the capacity of the cache. You could partition the cache into four
>  equal parts with masks: 0x1f, 0x3e0, 0x7c00, 0xf8000.
>
> +Notes on Sub-NUMA Cluster mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +When SNC mode is enabled the "llc_occupancy", "mbm_total_bytes", and
> +"mbm_local_bytes" will only give meaningful results for well behaved NUM=
A
> +applications. I.e. those that perform the majority of memory accesses
> +to memory on the local NUMA node to the CPU where the task is executing.

Not being specific about why the results aren't meaningful, this
sounds vague and alarming.

> +Note that Linux may load balance tasks between Sub-NUMA nodes much
> +more readily than between regular NUMA nodes since the CPUs on SNC
> +share the same L3 cache and the system may report the NUMA distance
> +between SNC nodes with a lower value than used for regular NUMA nodes.
> +Tasks that migrate between nodes will have their traffic recorded by the
> +counters in different SNC nodes so a user will need to read mon_data
> +files from each node on which the task executed to get the full
> +view of traffic for which the task was the source.
> +
> +
> +The cache allocation feature still provides the same number of
> +bits in a mask to control allocation into the L3 cache. But each
> +of those ways has its capacity reduced because the cache is divided
> +between the SNC nodes. The values reported in the resctrl
> +"size" files are adjusted accordingly.
> +
>  Memory bandwidth Allocation and monitoring
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.41.0
>

Reviewed-by: Peter Newman <peternewman@google.com>
