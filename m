Return-Path: <SRS0=hUYu=46=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C44C10DCE
	for <linux-doc@archiver.kernel.org>; Fri, 13 Mar 2020 19:56:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 184E0206E2
	for <linux-doc@archiver.kernel.org>; Fri, 13 Mar 2020 19:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWKXimb/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgCMT4x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Mar 2020 15:56:53 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42704 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCMT4x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Mar 2020 15:56:53 -0400
Received: by mail-il1-f195.google.com with SMTP id p2so2446942ile.9
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2020 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e0nZcrWW+XWUA13+VyJ2F8NUVji6aYhnawU95UaXq7I=;
        b=RWKXimb/9wsHUnK7Swa0yTzLr3ojhDWBxT+i4Xq/OjRUG1d/lnf+po7cGm5zLDvWRA
         AsH3LpnnW4qVf3aw49f5Ird4gNTjSHLS6ckjdgYhRW9+eqCt0spoCfaZKPRkFJE9FbRN
         7Im760gSM4OyZXoh2931W8azaUMSnYMC0iNmCUtWLW37+hxYKxpE+p0EOmdS2OG6Fuz/
         zGdiWHQTVGO3sIIe2ZaW8CP45oG2Zr1warA7GYzsJA2VtroVYsNgagxHGptiwrrB3+fy
         3H05BkZHtTxUjY59jQisi8unV1IW439hn0jmnQ49aZ/thqZ8ov8Owco8WOir2ZsENk3h
         Q/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e0nZcrWW+XWUA13+VyJ2F8NUVji6aYhnawU95UaXq7I=;
        b=mB2U/0zks7f3b0xLH84ozXBvTxDBf/eF/piIRCJfXOSO98C+n1DpFT3Xt8fR2ZxrH+
         8ZCXuz/g47NWiXmZ8MvhJDhpQGiNbzDmbeP7QCSm7rtgrCqB5HoNdPBwRqYaQRMagY0a
         puTLoGWrkyDUWnYNmM6/kahlPy3W3trdAfdFHV/kR7ssZULQKh/GdHs9fD/przfykdCf
         GAaQRuo4UEhwocapCj6Fe+3Sh+BHagDaCTggCrS2T7Bl0wTDwa/HJn9m4x0ZjI5QvqnB
         sAG20sebzEtrEW0oib6+XKU5/CTquaFy8rCJTI9x6HPFViBKiQXFp+35/aLeKeTjlXu+
         mu2A==
X-Gm-Message-State: ANhLgQ3zpisr6EpTxtRmCZvXLD8fZ+Er2HbYuQChYbeOUEE+LVPF4Clq
        wo8/sz1JgFEsF5jZmj0wY3jAvmteIWxzBs8Y8Lah9A==
X-Google-Smtp-Source: ADFU+vvWsuACVinNssETDSwh96yZazoS+/mO6s+BXyEncZRyfkh8iRO4nXCNyy07Ha6URY2D4tNo7Lq+OOjMabx2PZU=
X-Received: by 2002:a92:8352:: with SMTP id f79mr11006887ild.58.1584129412372;
 Fri, 13 Mar 2020 12:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200227151416.14271-1-mike.leach@linaro.org>
In-Reply-To: <20200227151416.14271-1-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 13 Mar 2020 13:56:41 -0600
Message-ID: <CANLsYkzbOCaL6kYbD6bDrqA9CF=V5Qr6CzJMgYNsanhGZBrU2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Describe CoreSight topology using sysfs links
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Feb 2020 at 08:14, Mike Leach <mike.leach@linaro.org> wrote:
>
> The connections between CoreSight sources, links and sinks is not obvious
> without documentation or access to the device tree / ACPI definitions for
> the platform.
>
> This patchset provides sysfs links to enable the user to follow the trace
> patch from source to sink.
>
> Components in the trace path are updated to have a connections sysfs
> group, which collates all the links for that component.
>
> The CTI components which exist aside from the main trace patch, also
> have an added connections directory showing connections to other
> CoreSight devices.
>
> This patchset applies on top of the recent CTI v10 patchset [1].
>
> Adaptation of an original patchset [2] from Suzuki, reusing 2 patches
> unchanged with update to 3rd adapt to the new common code for trace
> path and CTI component links & add a default connections group.
>
> Tested on Juno r1, DB410c; kernel 5.6-rc3
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2020-February/714140.html
> [2] https://lists.linaro.org/pipermail/coresight/2019-May/002803.html
>
> Changes since v4:
> 1) Rebased for v10 CTI set[1].
> 2) Code for adding in the CTI->[other CoreSight] links revised to ensure
> consistent create / release process. Warn on highly unlikely event that
> link cannot be made & remove any programmatic association between the
> components.
>
> Changes since v3:
> 1) Rebased onto 5.6-rc1 kernel with CTI set[1].
>
> Changes since v2:
> 1) Fixed issues with signature ordering noted by Suzuki.
> 2) Alterations to main CTI set[1] to overcome issue noted by Matthieu.
>
> Changes since v1:
> 1) Code from original v4 CTI set moved here so that all connections related
> code in this set.
> 2) Connections directory mandatory for all CoreSight components and
> generated as part of the registration process.
> Mike Leach (3):
>   coresight: Add generic sysfs link creation functions
>   coresight: cti: Add in sysfs links to other coresight devices
>   coresight: docs: Add information about the topology representations
>
> Suzuki K Poulose (3):
>   coresight: Pass coresight_device for coresight_release_platform_data
>   coresight: add return value for fixup connections
>   coresight: Expose device connections via sysfs
>
>  .../trace/coresight/coresight-ect.rst         |   5 +-
>  Documentation/trace/coresight/coresight.rst   |  85 ++++++++
>  drivers/hwtracing/coresight/Makefile          |   3 +-
>  drivers/hwtracing/coresight/coresight-cti.c   |  52 ++++-
>  .../hwtracing/coresight/coresight-platform.c  |   2 +-
>  drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
>  drivers/hwtracing/coresight/coresight-sysfs.c | 204 ++++++++++++++++++
>  drivers/hwtracing/coresight/coresight.c       |  75 ++++---
>  include/linux/coresight.h                     |  22 ++
>  9 files changed, 428 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-sysfs.c
>

I have applied this set.

Thanks,
Mathieu

> --
> 2.17.1
>
