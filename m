Return-Path: <SRS0=3DvY=77=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1182CC433DF
	for <linux-doc@archiver.kernel.org>; Thu, 18 Jun 2020 16:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D31432083B
	for <linux-doc@archiver.kernel.org>; Thu, 18 Jun 2020 16:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Daa8kGSC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731969AbgFRQuP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Jun 2020 12:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730668AbgFRQuO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jun 2020 12:50:14 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B97C0613ED
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 09:50:14 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x207so3044373pfc.5
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2020 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=12wguNIOpAai+aK7V0UMJZpRX5txJ+g8ecK8VN8zlk0=;
        b=Daa8kGSChA8GE609NzPdLbnbxSL1yp2GIOtobIGkw213Q6/jN+pqpcohXWQuXWKVyJ
         peFqEQtL1Z9btJVYzVkWtnVrRQCgmNJ3st9Ldy6vmMigidwJIzcpqDTbji5gbe/SeZZ8
         GxJQtsEhr/A9o5Thu6mk2R0CMsTqGWeM5Ec66CgEVcVpr7k76LA6ofh++rqtcAhn886E
         36envhHSlJ8pWCrKO0jv3b0ZBGsLTn/joJ63Ot0JXxMczcsaNhT5KHAPy+hzZXynvNou
         dRUKdyPX+8x5NIGlXRDlzEHd1DSZB+9IF6mo4g1UiAFkMAAImGsXhLc4rrnXstSqBbhE
         H6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=12wguNIOpAai+aK7V0UMJZpRX5txJ+g8ecK8VN8zlk0=;
        b=AUnPAyGX8AowoCBvjPPeSqKeNoVqnOvzhk8DemqNwYl0nNHBu2kXZq7fAQJmEcO5X6
         AlNyfTI3s2JSlaNg04KIWihJd7sbAawi/GyCLJ0nkEAredygZF4lQ/RCDzWUGyq1ENpe
         9kb3LxK2PG8Ylq2x7g96BuxPOf8qXESpalJLm+c8BtCxEvOjPhB6pjwbbeIceWLOdH+G
         xEVO8epUF1jAVKwNZkA+3aAd87Rd/nbwH8oRyk5FTb4UhkiC9z4twu/7N+narinKvr4z
         FkOyCFJWB0mx+f62sbkekfpGcgoZqMcbYLQgNykA6ZhaKUBua3JiwXmEw0OdwSliyo61
         pLDg==
X-Gm-Message-State: AOAM533SP4KzFaBoftWkOQDPEu9oY1ZMBjZHmiLzQB76I+a/rXOFjhmC
        fIl//S5kgKH10h5iYJq3WjlPpA==
X-Google-Smtp-Source: ABdhPJwQv/SRknVfzl7s0fd5YGcHkIu/0H0T9dpTN4FKjOEnDG7eWQSrqBX1H2vFyL3jUAUbV4QzQA==
X-Received: by 2002:a63:63c2:: with SMTP id x185mr716198pgb.57.1592499013421;
        Thu, 18 Jun 2020 09:50:13 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id u1sm2981749pgf.28.2020.06.18.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 09:50:12 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:50:06 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Mike Snitzer <snitzer@redhat.com>
Cc:     JeongHyeon Lee <jhs2.lee@samsung.com>, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agk@redhat.com, corbet@lwn.net
Subject: Re: [dm-devel] New mode DM-Verity error handling
Message-ID: <20200618165006.GA103290@google.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
 <98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
 <20200618154444.GB18007@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618154444.GB18007@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
> I do not accept that panicing the system because of verity failure is
> reasonable.
> 
> In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
> 
> The device should be put in a failed state and left for admin recovery.

That's exactly how the restart mode works on some Android devices. The
bootloader sees the verification error and puts the device in recovery
mode. Using the restart mode on systems without firmware support won't
make sense, obviously.

Sami
