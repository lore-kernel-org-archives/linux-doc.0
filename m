Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6ACECAAD3
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 13:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiIINgT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 09:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbiIINgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 09:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CC012A312
        for <linux-doc@vger.kernel.org>; Fri,  9 Sep 2022 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662730576;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r+j5NRBRWTe4dwiHyAiQIy4Dst2HaG54q1byj2vgh9A=;
        b=Pm4Un1c14ij9ifplVWSJx663rrDOhST3ySl93FHP7hpb+rZ5tdJXm893rTSVEWFAaQIGbM
        nj/q/tUcgJIpP9p3+2TU7ixJGTC7LS/CUa4j3w5nX7IRGzXhZ6Bm96C8rdcRY3qBSnSRcs
        2/3jjD87HbNGcA4ZGQsjae8gYxJwrkc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-42IJ19vdP2GnRRkhjRCjBQ-1; Fri, 09 Sep 2022 09:36:13 -0400
X-MC-Unique: 42IJ19vdP2GnRRkhjRCjBQ-1
Received: by mail-pg1-f200.google.com with SMTP id e187-20020a6369c4000000b0041c8dfb8447so975430pgc.23
        for <linux-doc@vger.kernel.org>; Fri, 09 Sep 2022 06:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=r+j5NRBRWTe4dwiHyAiQIy4Dst2HaG54q1byj2vgh9A=;
        b=he7nJSwWGl3QkpwBNsmcvOIfhB9Q0kFPbKgacmL5YpuCjLUOiSnP6Y2DxvrerFmUpS
         uDIBVyrsrqso/drcr73oHwDEd//Yz0zvSp338SUjM8dz5RIalenK3Wh7fp5LNrAfH7iZ
         aYWwR25oPb3dQOirrIuF/aOX2DFusJVQCpYlt9y701mj+eCe+ztU2tG9X1hPTT3JJko+
         Yb+nU2FHEaw3Qe62e8j9TuUy6PljUWv68JKe9EVZuJkL7SR8xQ3rpe5DnyiM2IzFy0ro
         xjBlxhVt2LfB1E9kHhq85i2hQMXYZ8BgARy4FT6hfDhWK6RRGGda6dP1kmfzMvBYCH5J
         0ySA==
X-Gm-Message-State: ACgBeo0CREcQ1K8fxndrLycwIwRuNga8mZxJr0qBgGLM+FKpif2ALMhz
        Opwb+EML8cJc2/O4J74GtstWjPLv8e+rbyrcTPhs3f4KO7mDBZ8/auTebTbWlQ/HdFvZmObgI7J
        MPR+3SqIYsn5eMIiwUQnuIPd6J8G/VROc+Xhb
X-Received: by 2002:a63:f74c:0:b0:42b:77c2:ce7c with SMTP id f12-20020a63f74c000000b0042b77c2ce7cmr12592096pgk.473.1662730571984;
        Fri, 09 Sep 2022 06:36:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5SuJp+5hF11ORlTCZwHRZ31liJYmxmCrru4MNb9MY8mX5OINDPGCydElCCxBRT4j/66jaTrmZy9iz49jm7DGI=
X-Received: by 2002:a63:f74c:0:b0:42b:77c2:ce7c with SMTP id
 f12-20020a63f74c000000b0042b77c2ce7cmr12592074pgk.473.1662730571756; Fri, 09
 Sep 2022 06:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220908002723.923241-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20220908002723.923241-3-sathyanarayanan.kuppuswamy@linux.intel.com>
 <Yxn5VDzJMUxSKz0Z@fedora> <23a76ce3-d568-3c73-eecc-fa499aeecfcd@linux.intel.com>
In-Reply-To: <23a76ce3-d568-3c73-eecc-fa499aeecfcd@linux.intel.com>
From:   Wander Lairson Costa <wander@redhat.com>
Date:   Fri, 9 Sep 2022 10:36:00 -0300
Message-ID: <CAAq0SUk9_DS4T5_uAg+3re7=wrGXMkiXgw_oPsWfrmgY79P=2g@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] selftests: tdx: Test TDX attestation GetReport support
To:     Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Shuah Khan <shuah@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kai Huang <kai.huang@intel.com>,
        Isaku Yamahata <isaku.yamahata@gmail.com>,
        marcelo.cerri@canonical.com, tim.gardner@canonical.com,
        khalid.elmously@canonical.com, philip.cox@canonical.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 8, 2022 at 8:45 PM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
>
> On 9/8/22 7:16 AM, Wander Lairson Costa wrote:
> >> +#ifdef DEBUG
> >> +static void print_array_hex(const char *title, const char *prefix_str,
> >> +            const void *buf, int len)
> >> +{
> >> +    const __u8 *ptr = buf;
> >> +    int i, rowsize = HEX_DUMP_SIZE;
> >> +
> >> +    if (!len || !buf)
> >> +            return;
> >> +
> >> +    printf("\t\t%s", title);
> >> +
> >> +    for (i = 0; i < len; i++) {
> >> +            if (!(i % rowsize))
> >> +                    printf("\n%s%.8x:", prefix_str, i);
> >> +            printf(" %.2x", ptr[i]);
> >> +    }
> >> +
> >> +    printf("\n");
> >> +}
> >> +#endif
> >> +
> >> +TEST(verify_report)
> >> +{
> >> +    __u8 reportdata[TDX_REPORTDATA_LEN];
> >> +    struct tdreport tdreport;
> >> +    struct tdx_report_req req;
> >> +    int devfd, i;
> >> +
> >> +    devfd = open(TDX_GUEST_DEVNAME, O_RDWR | O_SYNC);
> >> +
> >> +    ASSERT_LT(0, devfd);
> >> +
> >> +    /* Generate sample report data */
> >> +    for (i = 0; i < TDX_REPORTDATA_LEN; i++)
> >> +            reportdata[i] = i;
> >> +
> >> +    /* Initialize IOCTL request */
> >> +    req.subtype     = 0;
> >> +    req.reportdata  = (__u64)reportdata;
> >> +    req.rpd_len     = TDX_REPORTDATA_LEN;
> >> +    req.tdreport    = (__u64)&tdreport;
> >> +    req.tdr_len     = sizeof(tdreport);
> >> +
> >> +    /* Get TDREPORT */
> >> +    ASSERT_EQ(0, ioctl(devfd, TDX_CMD_GET_REPORT, &req));
> >> +
> >> +#ifdef DEBUG
> >> +    print_array_hex("\n\t\tTDX report data\n", "",
> >> +                    reportdata, sizeof(reportdata));
> >> +
> >> +    print_array_hex("\n\t\tTDX tdreport data\n", "",
> >> +                    &tdreport, sizeof(tdreport));
> >> +#endif
> > You can unconditionally define print_array_hex, and
> > use `if (DEBUG)` instead of #ifdef `DEBUG here`. The compiler
> > will get rid of the unused code when DEBUG is not defined
> > as expected, but you get the parser to validate it
> > independent of the definition of DEBUG.
>
> Currently, DEBUG is a macro, so we cannot use if (DEBUG) directly.
> You are suggesting to change DEBUG to a variable? Any reason to
> make this change? I think both changes are functionally similar.
> So I am wondering why to make this change?
>

My thought is always to define DEBUG. If in debug mode it is defined
to 1; otherwise to 0.
Then, you can use `if (DEBUG)` instead of `#ifdef DEBUG`. But the
former will always check the syntax of the debug code,
independent of the value of DEBUG, and the compiler will generate the
same code. The GNU coding standard [1] explains that
better than I do.

[1] https://www.gnu.org/prep/standards/standards.html#Conditional-Compilation

> >
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>

