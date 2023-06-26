Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541A1EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 12:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjFZMtN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 08:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjFZMs5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 08:48:57 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D2E10F4
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 05:47:53 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4007b5bafceso397731cf.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687783670; x=1690375670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyEDqjnLut49ARt31W5hpg3PmjCUAUxnPXi+41gN+q8=;
        b=FRdAoSSh5TQTJl4OqCbbCHsE22mVG6Ok5OCrn5MKeK9kHtq19PJVM8DiZyrC3F9WR1
         m+sAiS7q08Pg26fdbJNUqSUEvU4s7vs3CerZVVemANxcC2JLYHWTTPU9KKFyUOaP9Dhi
         2RuzdRpWzOs57WG+Ych5/DQx5tsVNKd23Fzhgrqoc6UULqtnmt+RZ/DGUkN4Sx/rqLr8
         LcB1VJjSnUFrmUQOx6Mze0kNLJnuoaruY7QRt52ABqThUO8APi9mfloEAh602SmPLt9M
         TbSIGp5jx/iyXRjh+1QT75JKoBGehEg+mDrDwjLHPWke4MMOAWkb/K/0b0WVJQx7YLGu
         +nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687783670; x=1690375670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyEDqjnLut49ARt31W5hpg3PmjCUAUxnPXi+41gN+q8=;
        b=DKI4fTL6vndXcnenUHFZGOqzbM0QGNS/DdudpbmNR51iKDDJR+1pyWRORYMoWRrpIi
         P7p7BR+WF5tCqM8OV/hN1LP9F5AoZ1nPZzNAw4oqmu/Y7RKcFwgOtmxIv0kS2Ynydhiw
         TE0v/RuWWj9pcsPDsGorWhtQsXk6joifMlq9DcP0yIxYr2CEDSUwhuLkY+kcppYYcb2O
         hUk9szQoyDOTnb3nzgFJMwieMMCkfhRzvWzdv/bmqZ+6vdSe6lRJVeIc/XX8/8BB7bqO
         reWQNiPc4TtLw1Ri5LcDCcW06BTiNbpWIDwpfeaB+ESrB7qHMKn01zsS9TBJj2KW1eC4
         esHg==
X-Gm-Message-State: AC+VfDwPV7Cyje9OSsL8OZg35duWDB4DBTYIsCOV4jHGyy3fs5qSd77k
        As7xqnC1C3yeuH5EN8HfFBGAk+bPFhZnwyy67VANwA==
X-Google-Smtp-Source: ACHHUZ491LjK2ZJ8DT1B1XEsv5vgGnY5irD3vwsmbd6T7VFu6qmyS/3Aybli2welLnSM5TpKJT1Voijj6VeAHGptqkU=
X-Received: by 2002:a05:622a:134b:b0:3f3:75c2:7466 with SMTP id
 w11-20020a05622a134b00b003f375c27466mr334768qtk.8.1687783669742; Mon, 26 Jun
 2023 05:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230621174006.42533-1-tony.luck@intel.com> <20230621174006.42533-8-tony.luck@intel.com>
In-Reply-To: <20230621174006.42533-8-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Mon, 26 Jun 2023 14:47:38 +0200
Message-ID: <CALPaoCi+A5TxoReh=HRMsRKYDWb4eQ-NOB75Lj9674L6aV0T=Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] x86/resctrl: Determine if Sub-NUMA Cluster is
 enabled and initialize.
To:     Tony Luck <tony.luck@intel.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Wed, Jun 21, 2023 at 7:40=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:

> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctr=
l.h
> index 255a78d9d906..f95e69bacc65 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -35,6 +35,8 @@ DECLARE_STATIC_KEY_FALSE(rdt_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
>  DECLARE_STATIC_KEY_FALSE(rdt_mon_enable_key);
>
> +DECLARE_PER_CPU(int, rmid_offset);
> +

I assumed that declarations in this file were those needed by
__resctrl_sched_in(). Now that rmid_offset is used when setting
PQR_ASSOC, would this go somewhere else?

Other than this and fixing the MSR update, the series looks fine to me.

Reviewed-By: Peter Newman <peternewman@google.com>

Thanks!
-Peter
