Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B2CE92717
	for <linux-doc@archiver.kernel.org>; Thu,  5 Oct 2023 15:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbjJEPsr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234047AbjJEPsG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Oct 2023 11:48:06 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E2F2D0F4
        for <linux-doc@vger.kernel.org>; Thu,  5 Oct 2023 07:28:05 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-351367c1c24so85945ab.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Oct 2023 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696516084; x=1697120884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybf0NvxyfgOVHv/GEAtcS44ETu+aNcIhjMUXTQXq/oo=;
        b=357qa53z+AAunQ8oS3QXRiObclCY2UhybS3AxEnWS74QqMf9qMduUuUhQnXT7QYlKC
         gQ4DHE8YGflB1cSJ07i4vFdk6zbM1OKAyfrY+6RC+TeFK8yhboV8HONlvGGS44kOIMUP
         34tnCc7cYnft3IQlPNXO3TZMHbHbTksOS0MDmnXRE43kSyHgd6QKCwJav4CKi6bseg/b
         PR4YpK4puUMtQHxHAcjmzThNycNH4ItR1paTBejvJkXdH8M1SQwbnoEosJf7+ZOHuS/G
         Vj/p724bFZ0bGMvCemUpjxzHu/hSz+DeqANCqBmN//ZwBATvtvTlwD6Uf4n5B7LY5oJJ
         BQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696516084; x=1697120884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybf0NvxyfgOVHv/GEAtcS44ETu+aNcIhjMUXTQXq/oo=;
        b=EmFJPUVPmq/SMlEUG5h/xQN1lhhmqZwB/IuP6/2RTjHs+isqRVcJZKYmZLd72i3pQb
         0qESHwmxKEaO8Z3MkFaKUJbrv4k+ag7P5jns4B/JS7nxuuZE1sEAgjz1D41IjOZSd8GL
         5xOZSXOy+F58x1E8Wh8UbxJmnITm2BOvbn4ZzbqSgX0RzpseinKXZAU6TrtnAhTMDNJq
         gpFwRVkXSNCuQU1bnQjUUO4e3gwrUVs5c2MCb1aVSdpCrrvwaUKefPbMTJBxYe9dKMAJ
         4TPwEYiA9O63HWQG+a2/Bfyquc7jGQvdNpnkTzKgOS/xqmIf/kfldjvyPCm+e5o5HQqd
         ZcSQ==
X-Gm-Message-State: AOJu0YyZG/OZRBn/51d7Df8wu7BGOANnjbNlVoP3LrgLLx1WypVs/Kmv
        AichYoeo6afUTXiL/bkOrJtal8lXKUL/qgsD8EJ7fw==
X-Google-Smtp-Source: AGHT+IFvw6IhRVN0H3jLFsLkccwcXRU0R1gonoMQf+gJvBTEY0T903zokI27tID8lLZZIeAVp3qcWUQFrGbYz0QRbi4=
X-Received: by 2002:a05:6e02:2141:b0:34d:f90f:d42a with SMTP id
 d1-20020a056e02214100b0034df90fd42amr124815ilv.1.1696516084281; Thu, 05 Oct
 2023 07:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230928191350.205703-1-tony.luck@intel.com> <20231003213043.13565-1-tony.luck@intel.com>
 <20231003213043.13565-2-tony.luck@intel.com>
In-Reply-To: <20231003213043.13565-2-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Thu, 5 Oct 2023 16:27:53 +0200
Message-ID: <CALPaoCg7ov97uSKk8K4O5_GFKvnHSCSK79g-boPMQKhziS49hw@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] x86/resctrl: Prepare for new domain scope
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

On Tue, Oct 3, 2023 at 11:30=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index 725344048f85..04c164f6d39d 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -1345,10 +1345,13 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_reso=
urce *r,
>         unsigned int size =3D 0;
>         int num_b, i;
>
> +       if (WARN_ON_ONCE(r->scope !=3D RESCTRL_L2_CACHE && r->scope !=3D =
RESCTRL_L3_CACHE))
> +               return size;

Thanks!

Reviewed-by: Peter Newman <peternewman@google.com>
