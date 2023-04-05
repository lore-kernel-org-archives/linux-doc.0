Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70CBC7619A
	for <linux-doc@archiver.kernel.org>; Wed,  5 Apr 2023 13:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237712AbjDEN1f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 09:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237259AbjDEN1e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 09:27:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4386F2705
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 06:27:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-4fd1f2a0f82so52399a12.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Apr 2023 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680701252; x=1683293252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XqX1N9AwIcXh3tEpxCe94h+1QEhsxAem/vTybjTN11k=;
        b=JXSAfvOtNFzK6tv8vKIgjAj2QxudkNTN+gOdh2IAHy0MotU6InrYYubzWWC4V5brU8
         +Iwz08yS0ZLc1ZEFGhg9fpD4K3avpKoWG+Rf2Aw4mDHJXV6tZSo2upS+nG1jDlo0Tylh
         /V9pl+Fa0Mjb6GSn/l601xafWZR6leIYeocfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680701252; x=1683293252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqX1N9AwIcXh3tEpxCe94h+1QEhsxAem/vTybjTN11k=;
        b=r77TadDXzsef9g0hBLd+l7Db+NOQlfmz8sID2l3eHEJP72dAY5TFZjWjjebdvG4Gtv
         YF6wf7ejzMsmVLufuUnsrhHEm3lGIbXPAb8IbmEhnIas5HZXQMXhN4HfetG00UfnuryO
         xEyftstGORB797SMgbq53sTpgQaiAGw/SQLLDYg2zxyasvmltPnC+ajcoWJYCbZCZY3s
         e3RrVApVgX7SLYGqHbSr46atHi4FHs3vufVFI9sFLeywYDyoxl+sAeJ+ChNt4+54KBv4
         LG2tYRSXbbieDuLcw84NNAJ1V4KPY8UGgBSCQX/wy+Ilk3N/vWxG7NWCiqPTbGP1CqKy
         +V4A==
X-Gm-Message-State: AAQBX9dobX7Lr5SPJqho8SyF73K2RDU7fn0d8Y/90hPecO360FVzcMfX
        RYYbzzE1AVpt0QEtRPctCIV/yA==
X-Google-Smtp-Source: AKy350YswyL/2WjlpsmEdGmBnqipwym85alKiP+KkghBft5Jy1eR+adZL60tPSX8iCmHKGIo3/jCOQ==
X-Received: by 2002:a05:6402:524e:b0:4fd:2978:d80 with SMTP id t14-20020a056402524e00b004fd29780d80mr2007567edd.1.1680701251733;
        Wed, 05 Apr 2023 06:27:31 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id q17-20020a50c351000000b004bf76fdfdb3sm7246880edb.26.2023.04.05.06.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 06:27:31 -0700 (PDT)
Date:   Wed, 5 Apr 2023 15:27:29 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Oded Gabbay <ogabbay@kernel.org>
Cc:     Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, airlied@gmail.com,
        daniel@ffwll.ch, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
        bagasdotme@gmail.com
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Message-ID: <ZC13QdSRybIe3nvk@phenom.ffwll.local>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
 <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
 <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 05, 2023 at 03:35:19PM +0300, Oded Gabbay wrote:
> On Wed, Apr 5, 2023 at 2:26 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On 03.04.2023 19:22, Jeffrey Hugo wrote:
> > > On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
> > >> This series introduces a driver under the accel subsystem (QAIC -
> > >> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
> > >> a PCIe adapter card that hosts a dedicated machine learning inference
> > >> accelerator.
> > >>
> > >> The previous version (v4) can be found at:
> > >> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/
> > >
> > > Looks like things have been silent on this revision and we have a number of review tags already.  Seems like this series is ready for merge.
> > >
> > > I'd like to see this queued for 6.4 if possible.  Given that we are at 6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
> > >
> > > Jacek, since you have commit permissions in drm-misc and are an active Accel maintainer, I wonder if it would be appropriate for you to merge this series to drm-misc.  Thoughts?
> >
> > I'm would be happy to merge it but I think it needs to be acked by Oded first.
> >
> > Regards,
> > Jacek
> 
> Hi,
> Entire patch-set is:
> Acked-by: Oded Gabbay <ogabbay@kernel.org>

Once Jacke has pushed this I htink it would also be good to get Jeffrey
commit rights for drm-misc, so that in the future bugfixes for the qaic
driver can be pushed directly by the qaic team. Still with acks/r-b
requirements as per usual, and I guess for anything bigger/new uapi an ack
from oded is needed.

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
