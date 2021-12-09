Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21277C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 21:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhLIVHs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 16:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbhLIVHr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 16:07:47 -0500
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F80C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 13:04:13 -0800 (PST)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
        by smtp6-g21.free.fr (Postfix) with ESMTP id 0938878032A;
        Thu,  9 Dec 2021 22:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1639083850;
        bh=+WXsEAHH5vCBcT2J8DWaD7xuCyUCU3o6JlVEOcbdWnY=;
        h=Date:From:To:Cc:In-Reply-To:Subject:From;
        b=kFmS3cCzRF/RRlT/rps/gvf3A3mAW039uprP2bdk26JzJoQ8x4oq5ruAqA30Pfw/h
         PMuusyA2H/FLzwOrUdwZmvt08VvXGZkDzl2PRp7xY3DtTNfKLoDmJ+89cqEdCmZgm2
         dpgbDACl9T9FqmduyaikvyzOZbegvGMEqloZ8EKIoMgTJZwgMbMaPa0SGez+q7sAQC
         alOPb55Y6xkcXNJpbPkI7yWXFoF83awCMhWOLMFHGn+Ey+yimzV4Cv6bSQBbbLbLwp
         LKIRXfBbUrUo2JtDrwHbJLitnPiq00TF8EqXISkwSbdOfBbbIbHxXIuHIG/GHFX7y+
         zfFpXGrGOA5eA==
Date:   Thu, 9 Dec 2021 22:04:09 +0100 (CET)
From:   Yann Dirson <ydirson@free.fr>
To:     Harry Wentland <harry.wentland@amd.com>
Cc:     linux-doc@vger.kernel.org, qingqing zhuo <qingqing.zhuo@amd.com>,
        roman li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org,
        aurabindo pillai <aurabindo.pillai@amd.com>,
        nicholas choi <nicholas.choi@amd.com>,
        dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        bhawanpreet lakha <bhawanpreet.lakha@amd.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Simon Ser <contact@emersion.fr>,
        Michel Daenzer <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Marek Olsak <marek.olsak@amd.com>,
        Roman Gilg <subdiff@gmail.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Message-ID: <1142902978.47042257.1639083849979.JavaMail.root@zimbra39-e7>
In-Reply-To: <e4ca7200-24bb-163d-7e7b-0664e56f7766@amd.com>
Subject: Re: [PATCH v4 0/6] Expand display core documentation
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Thanks for this. It's really good to see this.
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Hearfully seconded, let's get this rolling :)

Reviewed-by: Yann Dirson <ydirson@free.fr>

> 
> Harry
> 
> On 2021-12-09 09:20, Rodrigo Siqueira wrote:
> > Display Core (DC) is one of the components under amdgpu, and it has
> > multiple features directly related to the KMS API. Unfortunately,
> > we
> > don't have enough documentation about DC in the upstream, which
> > makes
> > the life of some external contributors a little bit more
> > challenging.
> > For these reasons, this patchset reworks part of the DC
> > documentation
> > and introduces a new set of details on how the display core works
> > on DCN
> > IP. Another improvement that this documentation effort tries to
> > bring is
> > making explicit some of our hardware-specific details to guide
> > user-space developers better.
> > 
> > In my view, it is easier to review this series if you apply it in
> > your
> > local kernel and build the HTML version (make htmldocs). I'm
> > suggesting
> > this approach because I added a few SVG diagrams that will be
> > easier to
> > see in the HTML version. If you cannot build the documentation, try
> > to
> > open the SVG images while reviewing the content. In summary, in
> > this
> > series, you will find:
> > 
> > 1. Patch 1: Re-arrange of display core documentation. This is
> >    preparation work for the other patches, but it is also a way to
> >    expand
> >    this documentation.
> > 2. Patch 2 to 4: Document some common debug options related to
> > display.
> > 3. Patch 5: This patch provides an overview of how our display core
> > next
> >    works and a brief explanation of each component.
> > 4. Patch 6: We use a lot of acronyms in our driver; for this
> > reason, we
> >    exposed a glossary with common terms used by display core.
> > 
> > Please let us know what you think we can improve this series and
> > what
> > kind of content you want to see for the next series.
> > 
> > Changes since V3:
> >  - Add new acronyms to amdgpu glossary
> >  - Add link between dc and amdgpu glossary
> > Changes since V2:
> >  - Add a comment about MMHUBBUB
> > Changes since V1:
> >  - Group amdgpu documentation together.
> >  - Create index pages.
> >  - Mirror display folder in the documentation.
> >  - Divide glossary based on driver context.
> >  - Make terms more consistent and update CPLIB
> >  - Add new acronyms to the glossary
> > 
> > Thanks
> > Siqueira
> > 
> > Rodrigo Siqueira (6):
> >   Documentation/gpu: Reorganize DC documentation
> >   Documentation/gpu: Document amdgpu_dm_visual_confirm debugfs
> >   entry
> >   Documentation/gpu: Document pipe split visual confirmation
> >   Documentation/gpu: How to collect DTN log
> >   Documentation/gpu: Add basic overview of DC pipeline
> >   Documentation/gpu: Add amdgpu and dc glossary
> > 
> >  Documentation/gpu/amdgpu-dc.rst               |   74 --
> >  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   87 ++
> >  .../gpu/amdgpu/display/config_example.svg     |  414 ++++++
> >  Documentation/gpu/amdgpu/display/dc-debug.rst |   77 ++
> >  .../gpu/amdgpu/display/dc-glossary.rst        |  237 ++++
> >  .../amdgpu/display/dc_pipeline_overview.svg   | 1125
> >  +++++++++++++++++
> >  .../gpu/amdgpu/display/dcn-overview.rst       |  171 +++
> >  .../gpu/amdgpu/display/display-manager.rst    |   42 +
> >  .../gpu/amdgpu/display/global_sync_vblank.svg |  485 +++++++
> >  Documentation/gpu/amdgpu/display/index.rst    |   29 +
> >  .../gpu/{amdgpu.rst => amdgpu/index.rst}      |   25 +-
> >  Documentation/gpu/drivers.rst                 |    3 +-
> >  12 files changed, 2690 insertions(+), 79 deletions(-)
> >  delete mode 100644 Documentation/gpu/amdgpu-dc.rst
> >  create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/config_example.svg
> >  create mode 100644 Documentation/gpu/amdgpu/display/dc-debug.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/dc-glossary.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/dc_pipeline_overview.svg
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/dcn-overview.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/display-manager.rst
> >  create mode 100644
> >  Documentation/gpu/amdgpu/display/global_sync_vblank.svg
> >  create mode 100644 Documentation/gpu/amdgpu/display/index.rst
> >  rename Documentation/gpu/{amdgpu.rst => amdgpu/index.rst} (95%)
> > 
> 
> 
