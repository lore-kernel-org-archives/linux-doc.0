Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D63E71D20
	for <linux-doc@archiver.kernel.org>; Fri, 29 Sep 2023 12:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbjI2MTh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Sep 2023 08:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjI2MTf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Sep 2023 08:19:35 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1147F1AA
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 05:19:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c6052422acso128045ad.1
        for <linux-doc@vger.kernel.org>; Fri, 29 Sep 2023 05:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695989973; x=1696594773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLnTSnR7uTYwv5cSSHGvio2GQZKRL0FdjNM2CJ3aoLI=;
        b=2BaKyLQmry4gd+zHcUfPa0f2FEhhjf2JUKI8tHLGNVFdM0VjJwAyhhyKYDINdElIh9
         xUc42jzLRNYwg6VMA6ZvFuAhy5NcYlRN+imth4p2tH+vpfYvkSTTLt7zAVnJqB5/538G
         gKFoSAd2lS1erTGJNNa9P/Cp9EEoXHTwqjW/gvLjnb5i4mlBDlJqTD0BmB5vWd6jFURy
         opdIvEML6CZtDBoJHrUCttIJAf8Q9SmOIhDOKr0byLzkcjS2uuzhXHRLScCy9UFf7t4k
         VbVAVUQZSHuHAje4eEi864hiD3bfgyq7Ohyxdk4U4+X9jXX2kwqq1htrq9mLMQadLNjD
         Re2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695989973; x=1696594773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLnTSnR7uTYwv5cSSHGvio2GQZKRL0FdjNM2CJ3aoLI=;
        b=BGMy9MVcVygrOkfhVUYdscFtvknJ56g0IoE8zHVmT5VjHOoUpaXwQjtJDFKk+XaFPo
         zjFYYA/YwKopGLB9DTeJIhBkMzLjap/SI4w0Lz9Q2WbnB2vFGaWfTuoWaKPJ4m3B4ANI
         j7DJE7QlOY4xT8Zr2yscXnECwNRZax51VjDOGeVGYbK9R/aJjwUIuEFNcjxw3Pdb0eIM
         8Bm2ZFDHfk9uPKrVnNHfQIIbfomHdSsBrgk2iHyZhv4VtaL2oDCbPfoXN2ImaVgmmg5D
         UOkPvjycNBd61zZw3BfSuqoPKFYBN+S+dfzZdOdJzeIxSdvbmSa0O4QcsU8N+BMkjoch
         pvZw==
X-Gm-Message-State: AOJu0Yxj21pAig7cGyMY/GYc6/6UNjfOEiBWnMiN0E8uDS2BNOZLj7/T
        e0G1jZU1s7Z5+L4onDU9dopuV98X2tuELbFYK2antw==
X-Google-Smtp-Source: AGHT+IHK0oqlHr/4SkAVwSnoYFDhD0879DbB4ErNGUhs0U4worNdVRcdhOsKTjQ4Igq01cBWv+xbWUqPjPXdZzGdc40=
X-Received: by 2002:a17:903:5cc:b0:1c4:36c:b917 with SMTP id
 kf12-20020a17090305cc00b001c4036cb917mr971296plb.6.1695989973149; Fri, 29 Sep
 2023 05:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230829234426.64421-1-tony.luck@intel.com> <20230928191350.205703-1-tony.luck@intel.com>
 <20230928191350.205703-3-tony.luck@intel.com>
In-Reply-To: <20230928191350.205703-3-tony.luck@intel.com>
From:   Peter Newman <peternewman@google.com>
Date:   Fri, 29 Sep 2023 14:19:22 +0200
Message-ID: <CALPaoCiLRA9NnP_rynYi60F_USW0zi_NWqRd702RJC_E2SeCFw@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] x86/resctrl: Prepare to split rdt_domain structure
To:     Tony Luck <tony.luck@intel.com>
Cc:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
        Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Tony,

On Thu, Sep 28, 2023 at 9:14=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
>
> The rdt_domain structure is used for both control and monitor features.
> It is about to be split into separate structures for these two usages
> because the scope for control and monitoring features for a resource
> will be different for future resources.
>
> To allow for common code that scans a list of domains looking for a
> specific domain id, move the "list" and "id" fields into their own
> structure within the rdt_domain structure.

On this one I think you can say "No functional change"

Reviewed-by: Peter Newman <peternewman@google.com>

Thanks!
-Peter
