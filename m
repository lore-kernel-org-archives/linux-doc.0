Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497E9C77B7C
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 01:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344334AbjD1BPd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 21:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjD1BPb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 21:15:31 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE8A2703
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 18:15:29 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63d32d21f95so1903776b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Apr 2023 18:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682644529; x=1685236529;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdAMIiYmqSQz1GbWDTNHZpSZR6NUQD27x8IVMPn6Rlk=;
        b=sa+18BQfIXdO34J2oBZ5fSNZDw2+/e2xdxFJ6iVqaxb1QxklxwVdWMI6yAs6m/RXcG
         hfCvJZzISTfabi+tC/OLXZyJxmQaWFrefjil/FlgPAPMdVKcCqbLhRn+h8eIWvXlS8iJ
         /I/b9TjLaNJB9EVoYkWPxoRdY4h6oGKU7HwGje2SXoKok/o3pDz+eEsBMclToXbyGCZG
         mFWMsHrQiSG51MpgLF6Vm4jULI7sg02cU6J3SmaHgwSwUU0fEn/C0JuSqoGjF2+SJ95c
         LdX+qb1fRPWe/Sy/EGOigwFdj+uTAUfnCPj7I+qWoFvYbU7FOqL4/hDVkR0bpJetnn2J
         DT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682644529; x=1685236529;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdAMIiYmqSQz1GbWDTNHZpSZR6NUQD27x8IVMPn6Rlk=;
        b=JeTS+nxBv8DEQwWFNDW0iW71Gi5h5Pm09iIf+A9EAuQvisHNVWL710vr5w8SWHPL1J
         zmmqcvaWvoGkoJ0k3t5hyTBwkg12QAkVJ6ud9tQvwmpmqcC0cyWq37HWb2ZRIIkrbpLU
         zkgODfP0n+qYmEKlmgZaF/08S+xJHUrDu1KlB9ajnBKUdWSiuBlJIcJNxd5zQg553PpM
         kEtPNuNR4Trbba3XVRBwXDXYH1cP+UTTEWzduMmF8xotIjaOAkQCv6JlP9YMWrUzZxMb
         04kcNAOvSXutu9DarnY52Lp40SYUPAuCnFITlhIQkqRShaxUeQNlMCK8dD7E1035Bwn2
         f9iA==
X-Gm-Message-State: AC+VfDzMt2QOL06g2yGusdCD2Zsf36DTWDd3uetZI8Jz5CKHJhxVHLZW
        j/Ylt5W44/z+TApZ15mVPtF4Jw==
X-Google-Smtp-Source: ACHHUZ7X+opn2Ubw1AwkQMzsSBun7dBZmvM343LIKmA46Kxphf9kLViwUZGrEMzvdhctRRtKV/mFeQ==
X-Received: by 2002:a05:6a20:7f99:b0:f6:d60d:dbc8 with SMTP id d25-20020a056a207f9900b000f6d60ddbc8mr3325695pzj.2.1682644529298;
        Thu, 27 Apr 2023 18:15:29 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id om12-20020a17090b3a8c00b002405d3bbe42sm13893828pjb.0.2023.04.27.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 18:15:28 -0700 (PDT)
From:   Jens Axboe <axboe@kernel.dk>
To:     josef@toxicpanda.com, linux-block@vger.kernel.org,
        nbd@other.debian.org, Eric Blake <eblake@redhat.com>
Cc:     philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
        christoph.boehmwalder@linbit.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230410180611.1051618-1-eblake@redhat.com>
References: <20230410180611.1051618-1-eblake@redhat.com>
Subject: Re: [PATCH v3 0/4] nbd: s/handle/cookie/
Message-Id: <168264452819.133910.16210912670607469975.b4-ty@kernel.dk>
Date:   Thu, 27 Apr 2023 19:15:28 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Mon, 10 Apr 2023 13:06:07 -0500, Eric Blake wrote:
> v2 was here: https://lkml.org/lkml/2023/3/17/1107
> since then:
> - squash patch 2/5 and 3/5 into 3/4 [Ming]
> - add Josef's R-b
> - tweak commit messages to match commits in userspace NBD (code itself
>   is unchanged, modulo the patch squash)
> 
> [...]

Applied, thanks!

[1/4] uapi nbd: improve doc links to userspace spec
      commit: daf376a366fd2d469d66ab83dfdc074777462bab
[2/4] uapi nbd: add cookie alias to handle
      commit: 2686eb845da7762ee98b17e578b0c081aafb77b9
[3/4] block nbd: use req.cookie instead of req.handle
      commit: bd9e9916c32fd4b4fb4e879e05bd1568ee02ec93
[4/4] docs nbd: userspace NBD now favors github over sourceforge
      commit: 952aa344bf4305ab6fa0d9962ef8c2caa2afef4c

Best regards,
-- 
Jens Axboe



