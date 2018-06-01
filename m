Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE41E7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 13:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751423AbeFANoS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 09:44:18 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37387 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750850AbeFANoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 09:44:17 -0400
Received: by mail-wm0-f68.google.com with SMTP id l1-v6so2750081wmb.2;
        Fri, 01 Jun 2018 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+te47mI6OG637eGf6wohuSIzWT5NeYTEapA9O1nE8GI=;
        b=hB52nc49JUIjXMk968u2YCVDPbxwvrkH+Dyj/CDUN9CFGM/ojJkHMh9OLcOng8BqWq
         m5gmvIkcLZErFhnAZM881ChzbvMJgV7Y4hw+BgkGOKbsvO1Z1xCILOZBGv14ktX8ia1H
         PPL/bp0zQIghCoGFL9isV9VDeXccEQWVZ6hkV+IWuuWJ2kIgCIE9Tb5BIDjHRcKwx9Gp
         EpeElo2OZtvaai9ClOkBC1o24eHGRrbK2NM1J/mV7Xy/16ksbmEKziAF7b96W14RjF0n
         WOWP4+cgeY+XuTKDAO747bbkyRiFZQ+pXqrtIs66jk22HOWOOG8b+uD9ELgxBCOWe5LF
         XoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+te47mI6OG637eGf6wohuSIzWT5NeYTEapA9O1nE8GI=;
        b=rMM8Qiq+psShDIX+WXO3KILjzMg/MGALX3505SQufsthjHluAVdNPt1NJg0Y/7f0Rb
         ItxGeamotFdJrc/y3O87saTfGhFS18wWHMSKOuuPLBOsNTBvbTE2c2tUbgb6Q3yX9OzM
         VchPBuLCLfdngGcwJ7nc40bnlN/BBDcgiBqTND8KOM2/qePiOk1W7P1AantqwNzFnLYb
         ++rhbsrF4wTW8jHXQB7FEfol1lO1QRhggkVzBEl/2Yiv9QLf+ezXNMHsYFwuUqYAdxFu
         d0JsLb4Mf+RwUmQ7/sOtnWZJMTj8APaCjBYgiaVUYm86e8Fm9k+eBJNFvdpG/GFZtbuD
         sXCA==
X-Gm-Message-State: APt69E1BwzqmIb8+Ksu8BwkLOHaLLmWbMC1dXPjUYBhD9uVcgoAkjmsX
        42DBrkxaJz0q2W3a6FhcMbtInGP7awxuMmt9hW8=
X-Google-Smtp-Source: ADUXVKIl7TsiGt7p8zcSR/UPesXPG/1WS8hsrD5gke7CoLIWvk3HfATQAjiqnrLSvZB+n708sYDyuaG1SvTbBU6clgA=
X-Received: by 2002:a1c:8742:: with SMTP id j63-v6mr2564322wmd.105.1527860656145;
 Fri, 01 Jun 2018 06:44:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:dd4f:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 06:44:15 -0700 (PDT)
In-Reply-To: <b458561f-b4e5-58bb-eee0-e3451312ae41@daenzer.net>
References: <20180531161708.5894-1-michel@daenzer.net> <20180531161708.5894-3-michel@daenzer.net>
 <CADnq5_O5-m_=xqszq41eOAVaLTytHUHmtDaSc1MeEorZML6T5g@mail.gmail.com> <b458561f-b4e5-58bb-eee0-e3451312ae41@daenzer.net>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 1 Jun 2018 09:44:15 -0400
Message-ID: <CADnq5_M-kS58ScgOBVQG7Mxxepae9b9gqUdMdFgaPaaxQ4NkjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Add documentation for PRIME related code
To:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 1, 2018 at 9:40 AM, Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:
> On 2018-06-01 02:58 PM, Alex Deucher wrote:
>> On Thu, May 31, 2018 at 12:17 PM, Michel D=C3=A4nzer <michel@daenzer.net=
> wrote:
>>> From: Michel D=C3=A4nzer <michel.daenzer@amd.com>
>>>
>>> Signed-off-by: Michel D=C3=A4nzer <michel.daenzer@amd.com>
>>
>> Series is:
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> Thanks. Is it okay to merge all of these via the amdgpu tree, or should
> I wait for an ack from Jon and/or core DRM maintainers for that?

GPU documentation usually goes through the drm trees.  You might want
to push patch 1 (drm_mm.rst fix) via drm_misc, but the rest are can go
in via the amdgpu tree since they are amdgpu specific.

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
