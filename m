Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99137C433E2
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63C8E20786
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="gT8Mt4vz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgICPsx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 11:48:53 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39254 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728458AbgICPsw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 11:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599148131; bh=RCu+Icot5zVZef98hyrEmwiRsqPkaaL/zUGsPUU+mwY=;
        h=Cc:Subject:From:To:Date:In-Reply-To;
        b=gT8Mt4vzYm4KNrP8rkDL/zZaEsAa2YBsV+nPQ0dYmT+SxBNR4DsPF5gX1pVtp/oLi
         MjlKAIpigXp50GFr24az3civE1BJWYT1jmFjY2mr9eJREUwkoMmWhMgBRAyB0/hmns
         e5iZocudHCRFTr4fTdQI1RmvSIlx87AinhW2cjr0=
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc:     <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 1/4] submitting-patches.rst: remove heading numbering
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>
Date:   Thu, 03 Sep 2020 11:48:24 -0400
Message-Id: <C5DUOXCVEV7I.5YC8ALUA77ZJ@homura>
In-Reply-To: <20200903094411.3ca2652b@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu Sep 3, 2020 at 11:44 AM EDT, Jonathan Corbet wrote:
> So why skip section 12 here? You get to that in a later patch, where it
> becomes an unrelated change; it would be better to finish that task
> here.

Whoops, user error splitting up the patches. Sorry for the headache.
