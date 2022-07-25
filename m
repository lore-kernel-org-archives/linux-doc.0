Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5113DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 21:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbiGYVNT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 17:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235324AbiGYVNS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 17:13:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2908A237F8
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 14:13:17 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id p8so11506748plq.13
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ozt8sHHqZgbZuYyTK0Kigy2DmFbzoRnwE8nXsCUn0/A=;
        b=8O32Q50qgt+t88V3SkklD+ABsiAMUak6audDQGkQO01QkkTv5crBH9d6M3viJa9icO
         Vuv5OsINpQ5AquttUJlDiX7iwnsrrIZtNBdTMO534w8rGiHQvsxlCinDHUBd7hxKGYk3
         O1c3Z+HYaHHhPQE9NdcDR/6rONJMjL8ITKuMcHfZLT8zMGyZ3Lk8Xe3nwXGIS1EDzy+b
         /zeKX5kCRfL9efv1mgMc9DW9qEGFyLXLpWLUIQ6nnM/drJRjBhzXi9FnQCMc7rfmdPSl
         ldnf83bmbpZCwZr8vBJ+Zu4kwpZuMgF0Lq/x8102J7qi4pZq1N2U+XysWp4YkvXF1WBS
         36Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ozt8sHHqZgbZuYyTK0Kigy2DmFbzoRnwE8nXsCUn0/A=;
        b=s7j5cdX7H4MNiKsSBefyRGal2f4MlfMawlW2QcUbWjHcEjd69KTQlftgBBNIrC/NZL
         hJRyCSiHmR3MdSD5H9FoOAdXwsvV+sthpa5tu5DcnzH/QR+UdMv7aYM1inzKiyPkg49B
         FXfx+omdauHf1jLWPtWR9c2iMwhMccADWvyy6RqiOFp9UzAQpl0jw1291e1P1f4LPJZr
         tgxPL3tMTtLlteNXalHyT1Wqc+Van2UAzEgRulfHzYOVz5GDhfihHOQpWyFzjh90zp53
         M3UuRTgD6rh9cSp63BD3aHhDllUpfilSS5Ux/109Ap04h4bhN/jYAO4U87XLERz3vBpt
         U2Rg==
X-Gm-Message-State: AJIora+c7/YOUaeTaw5cbUsoQDZeA8Yu6g7JKEVqUJrDOpLAsfqq/qsh
        nzEoysfHE7ANrzGq7I5Uzs6bVA==
X-Google-Smtp-Source: AGRyM1sPOrTFKyoV6Exk9Xp+nvt9MmyjIf7cS/pH7qd711jzfBBT+2FtG0GXlGWduK4uxHIznlXE3g==
X-Received: by 2002:a17:903:1c4:b0:16c:4e45:38a3 with SMTP id e4-20020a17090301c400b0016c4e4538a3mr13606299plh.41.1658783596690;
        Mon, 25 Jul 2022 14:13:16 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090aa50400b001ef83bcc262sm9317991pjq.43.2022.07.25.14.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:13:16 -0700 (PDT)
Date:   Mon, 25 Jul 2022 14:13:14 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Jacob Keller <jacob.e.keller@intel.com>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jiri Pirko <jiri@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        David Ahern <dsahern@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [iproute2-next v3 3/3] devlink: add dry run attribute support
 to devlink flash
Message-ID: <20220725141314.01771885@hermes.local>
In-Reply-To: <20220725205650.4018731-4-jacob.e.keller@intel.com>
References: <20220725205650.4018731-1-jacob.e.keller@intel.com>
        <20220725205650.4018731-4-jacob.e.keller@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Jul 2022 13:56:50 -0700
Jacob Keller <jacob.e.keller@intel.com> wrote:

> To avoid potential issues, only allow the attribute to be added to
> commands when the kernel recognizes it. This is important because some
> commands do not perform strict validation. If we were to add the
> attribute without this check, an old kernel may silently accept the
> command and perform an update even when dry_run was requested.

Sigh. Looks like the old kernels are buggy. The workaround in userspace
is also likely to be source of bugs.
