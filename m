Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C5307D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 22:48:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732038AbfJIWsV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 18:48:21 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36800 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731140AbfJIWsU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 18:48:20 -0400
Received: by mail-qt1-f194.google.com with SMTP id o12so5894406qtf.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 15:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Z+3EdhKE+AeW2xdFzbCTybbKxG5jLxRNaHCmlepKnCw=;
        b=tPiQH17p72YrZtxFr1LqCPf01LguDgjeCPY7Ev5YfqIPrJ/jRhim9woLkOrLDv86X4
         /aTnTOeJ/t7E8+CWY4V1sCiZYSC0UHo+oyNlRfWZdzCIY98M1Nnf4MHw4wkL2zzQW/S/
         zw4SffqEqQHWaJ9Cj9mIgAzY3aMgpsd0+8CQH/3dmVd5Xt3ED0VnDQNuWzgAmkntww3b
         0sLsxRb5azzyG1iR14POYl4Z2x4ImSvxfU85iuQUVs5nD4C6PdRuUJvuYrd1xElpvJGy
         ZESG2CHc7o63RVUq95aRQ1wFXbsJ6UMNw0XEbffHkKP+h5m4racXVPILlsoVpCcNsU0G
         Eu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Z+3EdhKE+AeW2xdFzbCTybbKxG5jLxRNaHCmlepKnCw=;
        b=iJs4LL++eshBkB+zjksog9nfvOrAaSG2MB1KYUWFpluhGceS9y05+Hpt4rzqUPNxcp
         dqF13nozHmbvuNXXC4srm/s7W3+JV5ZzGMRT1M6/WRgQY4xsC0bOTo5c4nUTatNu+SqH
         ZsRtF1TzNYC8TtOdLySDElv+hwI5a4iz6LHR5j3eESaYG3WLNAhZbhO/GA0UKS1Gr4XQ
         krUCa6Xs5+U1YrH0gXS74qCYR9AbiVS2Hm0BfMzKqrt16m5QKumdR/3a1WBjcHf4Mowh
         v4dKkN62NnM4TL4MltaqFom4WF+Q0woiS/dR8TbtUxSrJpT8cczTgf79HJ4/R9IRr60c
         kgTQ==
X-Gm-Message-State: APjAAAV+E3SbFj+Y5J4V11bg5HLFwWFKNPr76EKuKvGi388OlF938a5n
        RWX1nwh7FXfBplxVINszdqWUyA==
X-Google-Smtp-Source: APXvYqzbI6LUeO5TJ+8XMFJemSA1dYxl8UN4xKPjlcsfjqpVjIN2lEJW3zfkTDGY3/sCKeE6Lff2vw==
X-Received: by 2002:ac8:682:: with SMTP id f2mr6557906qth.149.1570661298493;
        Wed, 09 Oct 2019 15:48:18 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id s16sm1414725qkg.40.2019.10.09.15.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 15:48:18 -0700 (PDT)
Date:   Wed, 9 Oct 2019 15:48:03 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Miller <davem@davemloft.net>, j.neuschaefer@gmx.net,
        linux-doc@vger.kernel.org, jeffrey.t.kirsher@intel.com,
        snelson@pensando.io, drivers@pensando.io,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: device drivers: Remove stray
 asterisks
Message-ID: <20191009154803.34e21bae@cakuba.netronome.com>
In-Reply-To: <20191003082953.396ebc1a@lwn.net>
References: <20191002150956.16234-1-j.neuschaefer@gmx.net>
        <20191002.172526.1832563406015085740.davem@davemloft.net>
        <20191003082953.396ebc1a@lwn.net>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 3 Oct 2019 08:29:53 -0600, Jonathan Corbet wrote:
> On Wed, 02 Oct 2019 17:25:26 -0700 (PDT)
> David Miller <davem@davemloft.net> wrote:
> 
> > Jon, how do you want to handle changes like this?  
> 
> In whatever way works best.  Documentation should make our lives easier,
> not get in the way :)
> 
> > I mean, there are unlikely to be conflicts from something like this so it
> > could simply go via the documentation tree.
> > 
> > Acked-by: David S. Miller <davem@davemloft.net>  
> 
> OK, I'll go ahead and apply it, then.

Hi Jon, I think Dave intended a few more patches to go via the doc
tree, in particular:

 docs: networking: devlink-trap: Fix reference to other document
 docs: networking: phy: Improve phrasing

Looks like those went missing. Would you mind taking those, or
would you prefer for them to land in the networking trees?
