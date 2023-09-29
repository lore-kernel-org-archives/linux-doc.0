Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109C2E71D37
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 13:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbjI2NpJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 09:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjI2NpI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 09:45:08 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E113F1AA
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 06:45:06 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41958410e5cso374411cf.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695995106; x=1696599906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkcij4M4qFmfPBJh0ZXRR+rqodBxc/HEVEHdtcfIjHY=;
        b=kyME0vumcYlwgpnwUWzLizAHRLZSEMBT1zd29YG+l+tv2me2gnb5XIWEBSI8FoGKGJ
         IYbUAX8xSkGcN7HIhXAjAUSu8YT4Z3YfVcxLB8KnJcGyRprwm3/FUbJ0A8DxKMURCKpS
         YL6SfFRHOD4a4SlSkuT+CnQ/gV5Ujb3AOdOFs7GE+su0BvtdZ26BQx7QRYej+5RGfjYz
         4/7LjfwahbqZbFXy+yXgvb0yoOIz5PIWNbzKq4w24UA8s5KGRdi/mOqpsKc7QCB1+Gp1
         JhBwzLcM1el64UxYl7RGzrdzKYkmW3SKSq8L0zBBtd1uWwb03Ot07FSYzoEipCoZ2TUz
         S50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695995106; x=1696599906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkcij4M4qFmfPBJh0ZXRR+rqodBxc/HEVEHdtcfIjHY=;
        b=oDAaVk3RM+3ajljinLF27VMmmT18SyvHaR8Tra5WFUf0BrdgZiqiuI4muIhLGb3Ax+
         uddkFrD70N6kDZCCSm2Y9Z+iSQGwgV7ajV0fVYlwRZJVbVR0S31iFtaEG+S/agY3lITk
         vLwmEsfRr1TrDg1fN9wbOGZWnW/7pnbWSRvGrbTfdZyqicSghXEdVyOsPe+2b2yvx/fq
         BKppnZdrd7mqpibqMsczDOGhKpDqGhvHVQIM9u+kO1nZLZ8LbJxIOE2A7PZvgBXjYV9K
         Av2bHfCGL0xEEUkhJykusrJYk97pP861CRCsf87mRb62erjhzop6+yU5mJCuM5opq8fd
         01Kw==
X-Gm-Message-State: AOJu0Yxs0UMJJYRNhvD/Mli6G5vx/ItE3AW/fzkrhpKjJxtXSYVpcVBV
        kVnJgMnMSy6Myl56u752/imc8klTX1FH0LabF+C9fw==
X-Google-Smtp-Source: AGHT+IGqb7C2qGPVFGGU6qDXPjDw5ijpk93eWWclX0RnNuF3jfCQccabAV91wG1NS0ht9vqWAX+tBaD/0xVtgS9Gg0E=
X-Received: by 2002:a05:622a:46:b0:40f:d1f4:aa58 with SMTP id
 y6-20020a05622a004600b0040fd1f4aa58mr1209455qtw.8.1695995105901; Fri, 29 Sep
 2023 06:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230829234426.64421-1-tony.luck@intel.com> <20230928191350.205703-1-tony.luck@intel.com>
 <20230928191350.205703-5-tony.luck@intel.com>
In-Reply-To: <20230928191350.205703-5-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 29 Sep 2023 15:44:54 +0200
Message-ID: <CALPaoCgN2PBQymAXK_f1ggs_JwyARBuWruP-sPA1QKJMxvv9ow@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] x86/resctrl: Split the rdt_domain and
 rdt_hw_domain structures
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
>  /**
> - * struct rdt_hw_domain - Arch private attributes of a set of CPUs that =
share
> - *                       a resource
> + * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs =
that share
> + *                       a resource for a control function

wrapped line not quite aligned anymore

>   * @d_resctrl: Properties exposed to the resctrl file system
>   * @ctrl_val:  array of cache or mem ctrl values (indexed by CLOSID)
> + *
> + * Members of this structure are accessed via helpers that provide abstr=
action.
> + */
> +struct rdt_hw_ctrl_domain {
> +       struct rdt_ctrl_domain          d_resctrl;
> +       u32                             *ctrl_val;
> +};
> +
> +/**
> + * struct rdt_hw_mon_domain - Arch private attributes of a set of CPUs t=
hat share
> + *                       a resource for a monitor function

wrapped line not quite aligned anymore


> --
> 2.41.0
>

Reviewed-by: Peter Newman <peternewman@google.com>
