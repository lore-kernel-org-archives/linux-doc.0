Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 540D77D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Jan 2019 11:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfAQLDS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Jan 2019 06:03:18 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44416 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfAQLDS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jan 2019 06:03:18 -0500
Received: by mail-ot1-f65.google.com with SMTP id f18so10696799otl.11;
        Thu, 17 Jan 2019 03:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0OXdYXxFWOfsVx3YA0VujecxoFNtrwGDh+A4t7tEvOc=;
        b=jw+v11kf9PoHq6N4zPok63uX2i23UySCsmzWhgUJUhIjh0UpzfPqABO/C9vXZOf7sw
         CZzRDyc969ZaW3JzjiVvLB2vRB+kWZQnFJzOd/c/unQrAY/BNiiUjz0VO/XRjeKgwkUe
         sFYQR1GmFic57wrAoDTu2qAgWz9xYChaVp2aZ5P8WO9u5E1CnKLyUAZMCpRz7OQuFAN+
         87V3N2CGLGBiJBfUyzqNqiOG3EsUQd1XUP/6P8vu7z9qmgqRhe7RRCJHz33KTdLjPab3
         +FaUmAfTONwCzh9tu6VKH7yTNz/PRoDoMiLz17Yp/tyMfBC8OFxk17CDQoca0etoU/5Z
         X6+A==
X-Gm-Message-State: AJcUukcfDcJ0r08NVRSdyoC3QjinKImnlJd8AhrcOSqVSIUU43WqHKLP
        gPACOhd8Gg23XRjAx4UHMm7SlsvdojNVt+HI3d8=
X-Google-Smtp-Source: ALg8bN5C4k8ybuX+hUwwllZw8hDiXdkGlx1DZ84Png8vVt9+KFE9ViU+iAsWL1ADU0cIJmJdAGQBMFTZoZ1E/f6iFJg=
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr8892524otl.343.1547722997958;
 Thu, 17 Jan 2019 03:03:17 -0800 (PST)
MIME-Version: 1.0
References: <6027163.jfBZkT499p@aspire.rjw.lan> <CAJZ5v0hhZN_HYyQBaKSquWCH6yeC35XSCqpFDLPGrF5cDaMy6g@mail.gmail.com>
 <CAPDyKFpZ7L94PDk4VCdfLGcrRnhT5igbF=MKfZd9oJv_grxe-A@mail.gmail.com>
In-Reply-To: <CAPDyKFpZ7L94PDk4VCdfLGcrRnhT5igbF=MKfZd9oJv_grxe-A@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 17 Jan 2019 12:03:07 +0100
Message-ID: <CAJZ5v0hNfRbqz+L8NPTGku1a=4JEPbtWLzjhw7BVi7Ds3Uy88A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: driver-api: PM: Add cpuidle document
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kevin Hilman <khilman@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 17, 2019 at 11:56 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 16 Jan 2019 at 23:10, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, Jan 9, 2019 at 11:54 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > >
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Replace the remaining documents under Documentation/cpuidle/
> > > with one more complete governor and driver API document for cpuidle
> > > under Documentation/driver-api/pm/.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > In the face of the lack of any feedback I'm assuming that this is fine
> > by everyone.
>
> I have look through it, looks good and sorry for the delay.

No worries.

> Feel free to add:
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thank you!
