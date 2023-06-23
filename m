Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CC1C001B0
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 15:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjFWPUc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 11:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjFWPTv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 11:19:51 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AAF2116
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:19:49 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-40079620a83so267551cf.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687533588; x=1690125588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9o7YVEzoV5lz+8vLzrqhGQ2D/1rlU+02uMgaoqMDIE=;
        b=XOZa9v/7zkAy73pr3ZosKiB+YlVu1jh81K1h3okUGFyHrTz3LBIiwz9T7hZZYuYYoP
         1eJXPInd8MxtXYaRsw3/KyCOmOCEOd4vH//EOjT3V1LeHr9MjT6UKbp9Wz7taUTe9er9
         HvdSX2AdFgfPC1+iC8ASCipcxIuLrvmfGn7ikZ2wffnpoFwOXYpNpkkZeeeiTnHw8UEl
         FuIKXZes0KemJ79vfVC7K8DTPCIJNd0cc8Ml8Ax7SgBqks232XTp2TBiapLSkhzGSvjK
         gO0L5GkCvIadtQSpbolNbX4PFQAuIaaPbCJmPwv2afZ0sDJ+WKTKlaYYJyahHnJOvmAd
         /xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533588; x=1690125588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9o7YVEzoV5lz+8vLzrqhGQ2D/1rlU+02uMgaoqMDIE=;
        b=T3E8UcSlTSYQPlyBCG98JeNAUbZvWXMpWPqHaGfn8DFNQgxikqBigqs6/QIIgfFAXx
         OJhPbgp7/T8A13lOJW6B7A0SB7eDGVt9eR9lz9Zqwx4Gh8EOTkZVnbA52Tsy8kS8vCGd
         EavWM65jE/709M6uoMQPaQbgp5TZys2Z6y98CQ+12Dn7umShG6Ex+6fnx6XAav7eaMj8
         xg+lq0T7LG9u8ijOJfvOAKh2BarNQsdvkFc949qnIUNdcY2cAwaWCwdv7Y6/673YqYn2
         HoMsXsvTRxohEjFPrjsIez/tCL3QEadGC9yvb5qFl4iKv9Hc67DItqvKCgARpPRUUlil
         GWfw==
X-Gm-Message-State: AC+VfDx+li9Ijae1//xISgUs33YYGZPBpv1HV8qXwF5CAM05JK6r5J9j
        nKAU3eh/yhkrlRQx0hdPecnmbxvTpihAcpoW4RtIHg==
X-Google-Smtp-Source: ACHHUZ6CDS5pW+9OsHA6eKMXUWXt6u0FtfKRp+ZdZdMi3tmcJaNbZ2dNV8prqFcjyEwsBEWAfs/EzXe+4ASIB+DlLV8=
X-Received: by 2002:ac8:5952:0:b0:3ef:5f97:258f with SMTP id
 18-20020ac85952000000b003ef5f97258fmr143411qtz.16.1687533588350; Fri, 23 Jun
 2023 08:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174006.42533-1-tony.luck@intel.com> <20230621174006.42533-8-tony.luck@intel.com>
 <CALPaoCgF04M0Jc-c4VmbKkRSFo677SBGoPHzNCSeQ4S6Bqb60w@mail.gmail.com> <SJ1PR11MB60836CD7493B0EAF0F687051FC22A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60836CD7493B0EAF0F687051FC22A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 23 Jun 2023 17:19:37 +0200
Message-ID: <CALPaoCiaknUMSU4CunSQrRP=WS8DAbToVo5jibh8TaWNZXGMbQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] x86/resctrl: Determine if Sub-NUMA Cluster is
 enabled and initialize.
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     "Yu, Fenghua" <fenghua.yu@intel.com>,
        "Chatre, Reinette" <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "x86@kernel.org" <x86@kernel.org>,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        "Eranian, Stephane" <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Thu, Jun 22, 2023 at 6:02=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> > Unfortunately I'm not getting as good of results with the new series.
> > The main difference seems to be updating the 0xca0 MSR instead of
> > applying the offset to PQR_ASSOC.
>
> I think I may have reversed the actions to update the MSR in one of
> my refactor/rebase. The comment here is correct, but that's not
> what the code is doing :-(
>
> Can you swap the bodies of these two functions and retest?

It's a small improvement, but still not great. Still only node 0
giving believable results, but at least no more empty results from the
second package.

I poked around in /proc/kcore and noticed that my snc_ways is still 1, thou=
gh.

-Peter
