Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57130C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  1 Oct 2022 06:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiJAGvo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Oct 2022 02:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJAGvn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Oct 2022 02:51:43 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B021806EE
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 23:51:41 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id j17so6858152vsp.5
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PHoMGEl74zkwuTo+F0FF6iG7OurZf/UzSxqC2rkvRdk=;
        b=loVNr+AV359Pgdiylim9C17KXTG2DKr0YUtk4dZAkLvq1SHsr/5P7zVR2OqDCOfTlH
         uH2057GTsBAeOM+qfLPZQj1SHlExwbDy2bLIGd9LTmfOu+wMlUaOyBtqN1mDklX/aend
         6U4unT903xu5K8sCtRGRGfla2mGRrBvyORABWeDsmv39Mz+qwSsbhROL66ZON4lIraWT
         PK5+LwjJLFaqPa96AaM2Ei9h5+HiwVNGO6HaWsFxIM1EsL4hNFj1uJMUvTjgE3yv0UNs
         9CMmB1NjUKEVcRXtBWwP9QrosNakEDjfvz1Pwen/L8xFxPdoowtnlQzhqh0RDDEQ96pX
         bHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PHoMGEl74zkwuTo+F0FF6iG7OurZf/UzSxqC2rkvRdk=;
        b=HN/fDJPzWWC2FUouVZXxKf3NlEpooVhWpzBsSqzu5NoVWxqTOlNo2Hdpde+//Juhrv
         lAioGUdPX2i2PArd7/bYQt5//cJXd4JjP9TcgAPZQnx35T/GA0qKYpEBkrkNWrkCYg/X
         iu158phEDVZ0R2whgsVedOhvlSMqnTw4aa5C4Rp2ylkx/30Lu7Lbn3ahL5JU9ODL6X6W
         GaZu37S/XoBWJCVf0IX5K5Z15B1bgm2Bxug9PwH/s4sgsBEBGcWF00ZHUzDHgDyEpE8n
         QTzDYTArjfU1cvDcvlwiOYoB1MPatkOfPARD2RwJvC/yqRBHLTtL6ujP0hfYM5KBqrlJ
         YgkQ==
X-Gm-Message-State: ACrzQf3hadyrfFPQTtb0TqpYezBmSDSqddSDw9GajkYJuyLqkQ2HkIB4
        YLUq2MnJFhKLmMD6Mrc415I8n8K2PSLYuZz6fx4efA==
X-Google-Smtp-Source: AMsMyM6Ian4kpqEw1eufy0DzSSHRP7bY8VgN6YA/tMLLKtNDQjZ6zvg1xki0AgKM5ClkPDUnluSXD/BdQpVi9o0Nym8=
X-Received: by 2002:a67:6d44:0:b0:3a2:9816:20f6 with SMTP id
 i65-20020a676d44000000b003a2981620f6mr6237022vsc.18.1664607100225; Fri, 30
 Sep 2022 23:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220929132549.56452-1-bagasdotme@gmail.com> <CABVgOSkT-EWLqr6R=RvbEgmkMAY0680YbRnEBg1un6h-=TzrUg@mail.gmail.com>
 <464981b6-d9d7-e656-261f-ef48661deaa2@gmail.com> <CABVgOSko6kgA_T3LNgTPxQZS8Ab8E+XhMcOGHFx76nd2HN_RBg@mail.gmail.com>
 <41fe0989-9157-944d-c796-21e28c8265b9@gmail.com>
In-Reply-To: <41fe0989-9157-944d-c796-21e28c8265b9@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Sat, 1 Oct 2022 14:51:29 +0800
Message-ID: <CABVgOSkbBPmNROt2h=M5tZk4OFhsysA8F_GTrPMG1M3e-QzNyg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: rewrite writing first test instructions
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Khalid Masum <khalid.masum.92@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000eb317205e9f38a26"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--000000000000eb317205e9f38a26
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 1, 2022 at 11:07 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 9/30/22 17:32, David Gow wrote:
> >>
> >> The indentation for code-block directive is required, since the preceding
> >> paragraph is multiline; otherwise there will be Sphinx warnings.
> >>
> >
> > I don't see any such warnings on my machine (which claims to have
> > sphinx-build 4.5.0).
> >
> > Could you send an example warning, and your sphinx version to me so I
> > can try to reproduce it.
> >
> > Regardless, if it's causing warnings, keep these changes. (Though it'd
> > be nice to include the warnings in the commit message, so it's obvious
> > that these are being re-aligned for a reason.)
> >
>
> I'm using Sphinx 2.4.4 (as installed from pip through
> Documentation/sphinx/requirements.txt).
>
> Sorry I can't reproduce the warning I mentioned earlier (I forget
> the recipe that triggers it when writing the improv).
>
> In any case, I'd like to keep code block aligning in the separate patch.
> It would be nice to see code blocks aligned to the instructions list.
>

Sounds good. I tried to read through the reStructuredText spec to see
what it said about indentation here, and it was pretty vague, but if
it's causing warnings, we definitely should fix it. It would be nicer
(though not essential) to have it as a separate patch to the other
content changes.

Either way, feel free to send a new version (ideally based on top of
the kselftest/kunit tree, which has just had a number of patches
merged, including v1 of [1]).

Cheers,
-- David

[1]: https://lore.kernel.org/linux-doc/20220929085332.4155-1-khalid.masum.92@gmail.com/

--000000000000eb317205e9f38a26
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCH
aKhzVyVH3HgJH4WEPXM3/Z6Dr2bCUZTVD6FFgA09FjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjEwMDEwNjUxNDBaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAMiaMSuKubtF2Autpp7DQ
+uxaGbf4k97ZoUaCVjtlzqKCSD9Gn/nom4+UViHKThz6kPeTJVtMw5KhtA/FMo7C9YXuQo9vJ1F2
wPnTN+TPWWZ+q2q1r6ZcQtdIhbsuxNG/eD5n3AXNYFkYTiZZ3bDDStWGZRIr/jsR3CvN5qE5CN5C
aJFHy4oBnFSrmFdnRpm53ne9SUi1ui5ARQLLEZvqACYM5GfMd6U/n4+cabl3nemSGGmONi74OEPP
6WE+ki5KFOEWX8inSzNOWsMkW5oSjO92o70B+LM7wzlVVXBxC/M/Mf+LVHgdNgAzvwbV+roUdWhN
5UuxEUQt8vDXXxghEA==
--000000000000eb317205e9f38a26--
