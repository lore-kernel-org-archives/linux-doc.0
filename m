Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66CAC7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 16:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfF1Qdv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Jun 2019 12:33:51 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34171 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfF1Qdu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jun 2019 12:33:50 -0400
Received: by mail-ot1-f67.google.com with SMTP id n5so6598602otk.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2019 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C5XhcDU6eHDsjHZSBvruupbGEAPLyXEBQaVgsJASp/M=;
        b=D1ToJybdEnzma0OsziYT5+nxDaSkNPJrp7CNsMBtITOLU9+/6mSU8iSJzl0odLczf6
         J+NJ1U3WVt6iz4ZNtK7O4B+I6SwhPHdmd0LCP3FM9Q7M8PpdCLD3yCikHMF8JisbHojD
         8KdWhr837Jg14qpnK2c26np5bgqk4Sdt9wQpeW52XG/+opLeMhyE5Zeknlc5DM7hM1vd
         gJXR5dqR48+7h+PE8PF0EAZtcQGoyieYya5bpdNretH4jGkw3uFBm3qz/4rEkogPFffJ
         I8zmVSNFi8wJTP08HjuI3oB0cMcDmI8+DeCY4U9/lHmynz1ISjtE4qtidP1lMsdP9lD1
         2zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C5XhcDU6eHDsjHZSBvruupbGEAPLyXEBQaVgsJASp/M=;
        b=Smvduhi+sLC0VIDvFVKrF6hURCvLVr44+QiKnOPfDghPoetd9ZQ2Sf3tHS4hSZzM6g
         LVQ+HqKGO7UZSMHYfue8wL1EaCqCXc3e/AY+85o+Qfx1xFmpBLs28lTTCB8RcvmFxZOj
         Zpq/WwcXXMTomqgUOIxSXBA0z5hfQU9YqsQjS3eFTerR54odjjCehFdoT71JXvh8M2d/
         qAK9UGUXDXiNBWYqOThNb7KFaRVGtyXw3MTwFh3TFKRA0zX6/B9QKacc90yo2xsY0sB8
         ++TnajIX9mnzGCMbYckJX2gYeTsiifYzwwiTvPJitmhE82IErpPHKUbyoSrkCsji/0WD
         zGBA==
X-Gm-Message-State: APjAAAUb/yfiw4F+QdL/W4nETmd2QTww2buWtaek9FeH6+jPfpT7A855
        hF539jEPxRRgqn2IJpv053m3RIg1QOK8BanTfPbFMQ==
X-Google-Smtp-Source: APXvYqzzYpdHgz4eglyne1uwTiVU7YP+ALyFG4sJtW5FcR4KUORfrVfDmiYmCAAGckLspi0ARU5vSc0QNvBcZT5BUKc=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr8593114oto.207.1561739630274;
 Fri, 28 Jun 2019 09:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561724493.git.mchehab+samsung@kernel.org> <bd756f3565213887a1fe82a382f7dfe7f9119f1f.1561724493.git.mchehab+samsung@kernel.org>
In-Reply-To: <bd756f3565213887a1fe82a382f7dfe7f9119f1f.1561724493.git.mchehab+samsung@kernel.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 28 Jun 2019 09:33:39 -0700
Message-ID: <CAPcyv4jGcXEvqYZ5aE1QUCd-zeJ8cO=yGtjcwGbYd59A+6FYxw@mail.gmail.com>
Subject: Re: [PATCH 04/39] docs: nvdimm: add it to the driver-api book
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Keith Busch <keith.busch@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 28, 2019 at 5:30 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> The descriptions here are from Kernel driver's PoV.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Dan Williams <dan.j.williams@intel.com>
