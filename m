Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50D1C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 08:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242796AbiFCIUi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242804AbiFCIUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 04:20:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F351ADAF
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 01:20:34 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so6714007pjq.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4NXs0gM6EmWNl9SZtPfrcFL6Z+go5/snO+sCnoTH3o=;
        b=OJVPOaSK5wJTmLCMhuJyeLXIlXkwAYg5vYpjvrV87ZVWAzh4cSaT6wr/ggQuS7LBKj
         SFRu4wk1Waz92BT/Utiz2+hcY/6cI2Y5mYyu+smntCrAfKCi9HxZvtWN04I8wznOrCyw
         7am54LTnDKZ6O7A3JPJeUzkc9ydHffkYzx3oS6+dLE1ooMYoIQ3fDv3QGR8W+q5WUz2+
         B8tJpbVoJBIblSD8uTt0lDqlgKnVtErwPVBrwXmtZf1eHzs0cv0f/F+96gFGmqdcPE9l
         ka+PNtLZZaRI/9ZNyZ5TkClEnZPWZCi5bSOP9R9Xoml/NUGVTVHsfwEkon7Es14bu+yS
         IqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4NXs0gM6EmWNl9SZtPfrcFL6Z+go5/snO+sCnoTH3o=;
        b=IxRLmSdlVyzFD/044Fs4dGKbXEyvScs7FenuhwaAV6olTMw5Hb3otjk8JdhzRucNZE
         Umr6pDoI2WWA+84fwGyX72JL0RPoq0l9clNC+OD6y71kma0y/WNZjXf5CSWnYexIBIgK
         xfIswOtaVdUGOv1s3F6LFS15RgOx32rL6y/GPLSQ1MxIjuzLr34iLyBzk0LewPrS98QU
         W07FcO+9mFkw0dqrOhqWrwuDhS7RzdMVf2ggln++dzIeao9dymoZ4FhZ+MySxV5HEZ3e
         UTTqYvKN9aG6Y85ToFARA1S4uG3cTH9IeSJIWRzcCQBXHLOYC7bWgBfvp7ARyUOCk/QS
         d8DQ==
X-Gm-Message-State: AOAM530YyQPofzq8+W4p14D5ndMFooAkFN09VbKsoDzXQxW7DfE2x9tG
        o6zmul2QMyxDCTOFi1SKuJrx8EbI8TqcggWofEv41g==
X-Google-Smtp-Source: ABdhPJwvMSX7bJ0sMwvdFp20lychh+sXCuA4C/mut7/HEWAGVctaQxnXeAwtCZxAMkeOUv+YHq4v2qAr7hpIJA5Njmw=
X-Received: by 2002:a17:903:130d:b0:164:17f5:9de5 with SMTP id
 iy13-20020a170903130d00b0016417f59de5mr9406413plb.132.1654244433615; Fri, 03
 Jun 2022 01:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220521124745.8747-1-roger@norberthealth.com>
 <a728cf17-4866-1151-0740-56b06257c917@infradead.org> <CAO_iFwrHcSWJm17fL-Q83DZ5i1xr+_dkEjh5Yt3Hxso0VtnzZw@mail.gmail.com>
 <47a68855-4547-49dd-d7eb-8ef83630552c@infradead.org> <Ypjwh5f6ByoZl5YE@zx2c4.com>
In-Reply-To: <Ypjwh5f6ByoZl5YE@zx2c4.com>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Fri, 3 Jun 2022 10:20:22 +0200
Message-ID: <CAO_iFwrAm-bqRgkD+1QSW8JwjV+Whp_BfNz9Bv1-9XOwy2poFw@mail.gmail.com>
Subject: Re: [PATCH v5] crc-itu-t: Fix typo in CRC ITU-T polynom comment
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        Ivo van Doorn <IvDoorn@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        Kristian Hoegsberg <krh@redhat.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 2, 2022 at 7:17 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Jun 02, 2022 at 09:31:24AM -0700, Randy Dunlap wrote:
> > Yes, Andrew can merge it.
> > Or possibly Jason (also Cc-ed).
>
> Sure, I can take this.
>
> Jason

Great, thanks Jason
