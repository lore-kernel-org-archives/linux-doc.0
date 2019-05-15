Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7AB717D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 15 May 2019 02:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfEOCCa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 22:02:30 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46730 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfEOCC3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 22:02:29 -0400
Received: by mail-vs1-f67.google.com with SMTP id e2so615265vsc.13
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 19:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxA0x4PyivVs2YLv3eXq9QQMTB5geMHM8Hexc+yQ7mo=;
        b=dXjwoQpnVsDqYDrL0Cnicd2MotWpdOFr7GH9DOjbDlq67I4sZGEfis+5EBw95xXMvF
         IbOJ8aq5o2OSe/E7ekC9qYayFL/4Wjs7wGz4Vkxxeyhz7svrgu3CUlX0qU6XlLarlsQE
         XLWo7ChQkbI13KqRlSEnD8eB0HxjVgLq5LeTWAevPIARzl9nozOucpkTw+LRMnlA7+18
         /O/337lLvdFHIcpZmhd14DxEzXu03cShUorZmYGRMoofO+96lypySevQRzuJXtRpwv2S
         sGVTvHKEtLmNl/s4FHPbSoCR0/QUdyBpjEvrq0s48VL5Xh62HHKjEgOThv0ACml6uYjh
         ncvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxA0x4PyivVs2YLv3eXq9QQMTB5geMHM8Hexc+yQ7mo=;
        b=OtZMxbPPkaAhLJ2JwH+97Uid8/9JL6aCx2J6h4o1otqvdK8XsKbfBT5C35ZP0kr9dP
         evm6Mzis8cyTQb0yQhHVcaKcx/XnrrdBYZZPmVp614y5GLrayJV/9Al5MOYfyP+Xnkge
         44oAYRZba+JvO4uXNyvJ9o0Vdo3Tz4iBs0nekmS0epLvJdZwMc9QZEC2lG3KJGaiM5IW
         Ik/TK6C9YJyGAVYWhWICcVDHrVoaRn8s1I8xRfZSH7FMyJqaQutjSlEwtx8WohahfcO3
         NIuzq0DZUJnZDBFZOlyuIZPgqQsY4q1XnL1VW0HecWvR2VBgMWzv5atiOvQbfsPGViEr
         00ng==
X-Gm-Message-State: APjAAAUrRlCUdienNxLZ1V+FB1nfhEZFtK1mUSJx14n1gkGiSA/9AKBv
        GNOc+mCrQkhA10B2Z4O+rJowGMB8S7uziTIMiE/D0Q==
X-Google-Smtp-Source: APXvYqxIRDuESb28VHPDBf2noVQZmbwLgfSNzYuspFpDWguKCT7rP6ucq1S57/0nWplSsbRvDowflcDST1f72rVZ2Dk=
X-Received: by 2002:a67:2781:: with SMTP id n123mr1212734vsn.141.1557885748720;
 Tue, 14 May 2019 19:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190415155636.32748-1-sashal@kernel.org> <20190507174020.GH1747@sasha-vm>
 <20190508124436.GE7642@linux.intel.com> <20190514193056.GN11972@sasha-vm>
In-Reply-To: <20190514193056.GN11972@sasha-vm>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 15 May 2019 07:32:17 +0530
Message-ID: <CAFA6WYM06E0y9o6+CLNPe48spiL=UDEqoGsidMbk1dBa5Rbmkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ftpm: a firmware based TPM driver
To:     Sasha Levin <sashal@kernel.org>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        peterhuewe@gmx.de, jgg@ziepe.ca, corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@microsoft.com, thiruan@microsoft.com,
        bryankel@microsoft.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 May 2019 at 01:00, Sasha Levin <sashal@kernel.org> wrote:
>
> On Wed, May 08, 2019 at 03:44:36PM +0300, Jarkko Sakkinen wrote:
> >On Tue, May 07, 2019 at 01:40:20PM -0400, Sasha Levin wrote:
> >> On Mon, Apr 15, 2019 at 11:56:34AM -0400, Sasha Levin wrote:
> >> > From: "Sasha Levin (Microsoft)" <sashal@kernel.org>
> >> >
> >> > Changes since v2:
> >> >
> >> > - Drop the devicetree bindings patch (we don't add any new ones).
> >> > - More code cleanups based on Jason Gunthorpe's review.
> >> >
> >> > Sasha Levin (2):
> >> >  ftpm: firmware TPM running in TEE
> >> >  ftpm: add documentation for ftpm driver
> >>
> >> Ping? Does anyone have any objections to this?
> >
> >Sorry I've been on vacation week before last week and last week
> >I was extremely busy because I had been on vacation. This in
> >my TODO list. Will look into it tomorrow in detail.
> >
> >Apologies for the delay with this!
>
> Hi Jarkko,
>
> If there aren't any big objections to this, can we get it merged in?
> We'll be happy to address any comments that come up.

I guess you have missed or ignored this comment [1]. Please address it.

[1] https://lkml.org/lkml/2019/5/8/11

-Sumit

>
> --
> Thanks,
> Sasha
