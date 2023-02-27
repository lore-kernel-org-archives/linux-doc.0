Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A5CC64ED8
	for <linux-doc@archiver.kernel.org>; Mon, 27 Feb 2023 13:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjB0Naw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjB0Naw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 08:30:52 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97DF1F93E
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 05:30:50 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id y2so6094108pjg.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 05:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrlqkyNhx5Y9J/eloABTQEhuK4mEKVoWLJBJOEPVQu0=;
        b=mQU8pset9BooU3jzDqbQhgS4BYtT04chvJX646MRug8Def2PUH67YE9LLRZZjtxvoD
         6FnUwhoGoLGiTYUCCMEkd4JmJBsE+LslYcsK7xUe9t8MtYKAXHdUpk4CGxlIZbM1m3Dt
         FZMeMU4UGstobcZBN3TJQ5d1hZzZtR/F0d6dqDPEFNCD6AwGN+ZCJjVQxKqFBCQWoCFp
         j7M/xxiCgLQ+jcbD6kZqPpt0r9oZ+frd5oyfSIXHHB6/64KPvTb9wupL49KOCSsKlydB
         xaEI7pz/vT6EFDi4smuf+uxt5hOvVs9VYsLzdqFePVEtRmDd3kDS09OLeV7TRdLrj/2F
         YS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrlqkyNhx5Y9J/eloABTQEhuK4mEKVoWLJBJOEPVQu0=;
        b=c+rEZ01/Ht+RbUryk2RQ0M81rAGhsOAcx7idAhc5+j81SLfzsBfKMMaCfu0CSxoNLs
         +UlPO1e/pU8VtIsKQS/1MxNxGwXmN33JFzU05gvvwNyC7I9zIXg/H+hZmfzpRPFQ9sxu
         GsuaOdKLf11uwrcozfYLmBsEGvRTrj/aTf0fLaFjBN4u+sZuzTeu4T+rznBHsOJs8+AN
         z59oCmzqqYR3X81RjdkdIx0lFuBjjpScYXU6cxydlJbVEKCenZMVC7L4f4rKaAPBsx61
         crgsTIG07iIF6BUoTiEGBi7ogn4sFjf13ls5UL7i22f3xwb9aJotI7feyKrqDpSlSzee
         ZitA==
X-Gm-Message-State: AO0yUKUi/9d3FtGqTUo2hzCbb6gz0874dIeOVM0+LMAZ9HRmSexgAQUb
        APetGPW8/KOwTypQrH+jARPF1WbEbs4RXONFfkraDQ==
X-Google-Smtp-Source: AK7set+y9/1kpprFY1OXKEHgrB85hu8mL9Xs/CkAgyUFKPWIL513Klt7JDZqMu91zLA0aFlMVuNpZvdkd6ZWQ9+Xmps=
X-Received: by 2002:a17:902:ab07:b0:19a:7e41:5a2c with SMTP id
 ik7-20020a170902ab0700b0019a7e415a2cmr6144088plb.2.1677504649857; Mon, 27 Feb
 2023 05:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20230126184157.27626-1-tony.luck@intel.com> <20230126184157.27626-8-tony.luck@intel.com>
In-Reply-To: <20230126184157.27626-8-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Mon, 27 Feb 2023 14:30:38 +0100
Message-ID: <CALPaoCgnOWLdEqKtonNeq+d_Fj0yr3Y7tgwwmAHmuhL5xBhqyg@mail.gmail.com>
Subject: Re: [PATCH 7/7] x86/resctrl: Determine if Sub-NUMA Cluster is enabled
 and initialize.
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

On Thu, Jan 26, 2023 at 7:42=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
> +static __init int find_snc_ways(void)
> +{
> +       unsigned long *node_caches;
> +       int cpu, node, ret;
> +
> +       node_caches =3D kcalloc(BITS_TO_LONGS(nr_node_ids), sizeof(*node_=
caches), GFP_KERNEL);
> +       if (!node_caches)
> +               return 1;
> +
> +       cpus_read_lock();
> +       for_each_node(node) {

Someone tried this patch on a machine with a CPU-less node...

We need to check for this:

+               if (cpumask_empty(cpumask_of_node(node)))
+                       continue;

> +               cpu =3D cpumask_first(cpumask_of_node(node));
> +               set_bit(get_cpu_cacheinfo_id(cpu, 3), node_caches);
> +       }
> +       cpus_read_unlock();

Thanks!
-Peter
