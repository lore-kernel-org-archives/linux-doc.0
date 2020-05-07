Return-Path: <SRS0=NPh6=6V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38FFC35280
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 23:07:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98DE8208D6
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 23:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="irn2+fcr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgEGXHZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 May 2020 19:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727828AbgEGXHW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 19:07:22 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ABCC05BD0A
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 16:07:22 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id j2so193407qtr.12
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 16:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=cDgv5RBBNmmZoeVkSdRHbb+p5n1j6gbGkVNuskYknK8=;
        b=irn2+fcrxp6NonlZzAmEkP+IcmaZPlVzbzxmfCG6lVabw4/G0dFt3sq6PNTCVMGxGG
         mHrxFYOqL919h6uaxEl0JW7dIaw8NB10ABm7DPmqf/EhfuWGsilf0Zdh4cihFDxim+Mo
         2oiV63mSEiHMYHoenvD/gjwZA2LAweN8EWw+tYVdcFwe7a8XKwwE9AkeASQmt+OrM6Ud
         66rqMK51DOb0gUzTcrOl8r0cDm0oT8FMB5ERjpMlkKlVh00sAuv1oGi7o++rQCXNEyy3
         NK/+1D+NyYl6NPUHDAAe/3i2dWdBxPkf5biMBOG9YHzAaT3acw0lJR7KTsOkpXlpkwHt
         Jr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=cDgv5RBBNmmZoeVkSdRHbb+p5n1j6gbGkVNuskYknK8=;
        b=YKFP8LwaSYztXcEC50Q4vAXqQ2fuVrhx2JCha//n4I+NmTtZADVJlAlbc/Tf38Fk8e
         RPxllzFuCkMa8HZLGpnUmXlZwOHIOHo2DEog7HIJJFfdN+3kKonzQvVn3dBER2q47cNL
         UJZTAHI2qGJBasgEBkNADUwBiR5QwnTNE+ukjl8j+1MyNaUsZJykzXsJlbNUVGkHN1Ph
         ywG0eFFORCHzHPR9C8ONWUaQSKruXyG5ECd1qzlH0vmEPrmi2G2mRoMIu8cAW6+gq9ju
         6lPgumsn2WnXio2nDc+N1rrAOON1UY579reDa5ovnnF9JoVJP5pc4BwF1v65a1UZA4Fy
         0WGA==
X-Gm-Message-State: AGi0PuZIftiqZyUjmI570gUf1n8fEJeTQ1d0yfxHZM3rhAx4uxxHgMaP
        9H5p9MBNu9bs0aBKTGpzrIEIrg==
X-Google-Smtp-Source: APiQypJ8nv0rS/6ipD0+tlnjwjtkoEW9gBSgFlE4m3C077d6wO4jOE6P+FabQVeufE8QHwU+D1XMog==
X-Received: by 2002:ac8:46c9:: with SMTP id h9mr16757891qto.128.1588892841789;
        Thu, 07 May 2020 16:07:21 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id b126sm5170080qkc.119.2020.05.07.16.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 16:07:21 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] kernel: add panic_on_taint
Date:   Thu, 7 May 2020 19:07:20 -0400
Message-Id: <6B423101-ACF4-49A3-AD53-ACBF87F1ABE0@lca.pw>
References: <20200507221503.GL205881@optiplex-lnx>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        dyoung@redhat.com, Baoquan He <bhe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>
In-Reply-To: <20200507221503.GL205881@optiplex-lnx>
To:     Rafael Aquini <aquini@redhat.com>
X-Mailer: iPhone Mail (17D50)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On May 7, 2020, at 6:15 PM, Rafael Aquini <aquini@redhat.com> wrote:
>=20
> It's a reasonable and self-contained feature that we have a valid use for.=
=20
> I honestly fail to see it causing that amount of annoyance as you are=20
> suggesting here.

It is not a big trouble yet, but keeping an obsolete patch that not very str=
aightforward to figure out that it will be superseded by the panic_on_taint p=
atch will only cause more confusion the longer it has stayed in linux-next.

The thing is that even if you can=E2=80=99t get this panic_on_taint (the sup=
erior solution) patch accepted for some reasons, someone else could still wo=
rk on it until it get merged.

Thus, I failed to see any possibility we will go back to the inferior soluti=
on (mm-slub-add-panic_on_error-to-the-debug-facilities.patch) by all means.=
