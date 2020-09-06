Return-Path: <SRS0=MEcI=CP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B2C43461
	for <linux-doc@archiver.kernel.org>; Sun,  6 Sep 2020 14:11:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC7F120714
	for <linux-doc@archiver.kernel.org>; Sun,  6 Sep 2020 14:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="JDynh6Ll"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgIFOLS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Sep 2020 10:11:18 -0400
Received: from mout.gmx.net ([212.227.15.15]:59087 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725803AbgIFOLQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 6 Sep 2020 10:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1599401474;
        bh=/6GY+vCiDq3r2TFREQwT9xodDtp5h9Zbvasvf+ukhDc=;
        h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To;
        b=JDynh6Ll8et5IWUpSlCvUTLb4daVCwHX6nksQi+h0oUuNzNH8gJha3m2+7OU2gx+K
         bH8+JCsiqSLUJYBM+zq2/18MX8YOO/Hbbp6GSF/h6uPvpJmARJgeZfsW/RyHmDWCpq
         6DzZ5ILiv3SjvBWCRhaeyZ3RpPSdfHPu2X8afHx0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu ([79.150.73.70]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N95e9-1kaQ7x00b1-0165ih for
 <linux-doc@vger.kernel.org>; Sun, 06 Sep 2020 16:11:14 +0200
Date:   Sun, 6 Sep 2020 16:11:12 +0200
From:   John Wood <john.wood@gmx.com>
To:     linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] Fork brute force attack mitigation (fbfam)
Message-ID: <20200906141112.GQ4823@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200906121544.4204-1-john.wood@gmx.com>
X-Provags-ID: V03:K1:IofvoHfoW4+zvv86mcRzEOZd8xQ3k9PZn/x33HccB32c4nGCZn2
 MQAKWWVdXdooWOjMc2UMKQAL60qnO+g5s+9LaMyp8Etl/UqhhFTXPkH/TMU7ehYgOOKwHj7
 /XNdA9YTOV7QV30qrHQWz8OqrAZj5gPRlkLSa5sRFjWfbCCaSFX5yg5pMPOV+5BLFLMO4oz
 S5ONDsD8k1fmBuY2dMzRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H9Z1oNsF79U=:qygXfxFC4qBup4KnL9pMYI
 nAf5yKuaZVaedR8Ez7a5E4BQIojVgT/N2TDDelfde+62QTDaIuphOZ4loQqqRcf9hOZtNrUea
 Pw8dOOQGfbj7yMG2p+1rPD8e6SfEV9Xh4SZtWZE5adrzNxyTFwoCYaXkTuJ6L4X6m/wnpGf2M
 woFFzvLeBrElOAInfjatQkNihhSOUp1yZYdaTNHJPx/jL8KZQYFjDFFESFNK8LHOsoPgCxmWC
 P2JWkgm94ODUm8j3HGCRtbF1nrsb4c1hNWR7Y//1iVLPKHPLRiXxtlVf3elpuNBkjUZcE5P1w
 ZyjhbxF8uAYE+XoPtK7qpBgIYtHIE6oKBUSwZpSzb9T0z/PVMi2j00WImjNWTK/NPSoC64zcY
 j1zhkX0UnbVKGCDufktSZcSId9ewsNkOObkI67vUIpSz+GxBcziad8e2P2m2YGUgyChRJR5OU
 4zbfGFNtGJpQWhgpo7Y1oGt6f0BQ7YUnLXFdFkaG7LUHTG9UA0vTTPLA8WWenuogYBxvEmX32
 Qu+7DqynYQGNL1k7H12PFS7oDRo4Y8YthPByVNCPU9zF4k+gtzt1DvLXnAi2V1rD2exgRd0rf
 yExrY7O+LR4vSnBkyYi7Z/cAWH/zJtxyRbPPQEO0iTcU3Ps+BZsRVhko6tddoyg1lr108/imN
 uaDnegt892j7OTmNksCNdnDTuwB70dCtdYxSmteoGOcY4bpkl1L4aqO9cvEnTZyLzX7ayaENL
 SwjugLg8Ah7OKtr6X0LI+tIURSLZyEkTUnYLr2Tjq5zF+AcWLXHXx42AOzf7xqh9/Y1tg2vPt
 OsK8TMfnP8PExb9PWn50Mco+K1JuASn6pA71xcU6Pq+LfWFvcXcJW3YzIy3zmDADKZMGRNi7l
 e55UVqehPuw1rKbtchpAbuAe4J/Sw1YMG6gW0ntcLGHWmLLUozqQi4tvyW3rkiv24skCmIrM2
 Pfy3GSfig5nxWHma0+0+WzNZlFVQHTK7eaH94kJlPknZ+jRzsGoLPwCIAOSP5QM9T1cKWC+nR
 +Ev26qTNFpGXOHMTgGpwyNv3qZ7eIuXQhuhYtCA/+awnxAua/mL9mhh9ySlO/9p74ltfhnaB6
 cn4e4CwXJzmTTKmN1SzTD53XEm3ZjltnAgU25B4sUy/kGkGUESyqQaILBiG6U+wtk9/FOlSRy
 Cu2SIpyv1GkJ8rLPAXsQblKHYLzSX71ELljlpUFrDHECdnmNhkck1h7MJqLYch37kORT0RcyD
 NoKdPreLnT8V57IPaYhrcBVkUuC7b4aG4WvyDiA==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi. I have problems with my email account to send the patch serie  [1] to
all the recipients. My account blocks if I send an email to a big amount of
recipients.

Please don't reply to this message.
Thanks

[1] https://lore.kernel.org/kernel-hardening/20200906121544.4204-1-john.wood@gmx.com/

