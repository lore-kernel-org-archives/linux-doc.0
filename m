Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D36CC10F1B
	for <linux-doc@archiver.kernel.org>; Tue, 27 Dec 2022 19:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiL0TMW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Dec 2022 14:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiL0TMW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Dec 2022 14:12:22 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EDFDB0
        for <linux-doc@vger.kernel.org>; Tue, 27 Dec 2022 11:12:20 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id z12so11138083qtv.5
        for <linux-doc@vger.kernel.org>; Tue, 27 Dec 2022 11:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MY00dz11QXJmzg9csm+miCOhFOFpg8643w+bIlCW748=;
        b=XgtKEvI51MYnkAzyEBuWqhrhww1LOXuKa862I6d/g1lpURlPoqNUDlcAIU95DGaj6U
         9soUJD0Zy7BGrxzcD7kXNeqVGcS9+b5oCqY5OkE9awHDkAdzBKMB3zZbvO76kdW/teGw
         ePSKg7K5eJSkoXf0uYilN2N2ArJXarTWemOqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY00dz11QXJmzg9csm+miCOhFOFpg8643w+bIlCW748=;
        b=PVrUFmwxKa3r/2s8jSfTqxPXPV5CAukNU6s1BaS7RIGLyZPRaa1NMbeP5PtPfQWMw4
         HWURGPBcegJOR+PtRT1qMOw3OnPqPd9Z04wd9Y1zJkWhPq3w0wl+/SghEk1nAvk09MW2
         2g1Lecp/bXaGVZTUlR2B+hOY5vELNK5tNybnauAExLCAtzhgHABHX+oSlcDjc8L+I/rg
         OUJstXd1mqu8sowWUwOM9VPRvQ/J1ZuO4cx5Pad7lk3vyitWv9gnDneNgdjhcUQVe8Ix
         jjo5cteexqli+yGfmEyhXVVRZqsMO+Q0ifU6wKaAJFM16Oe6G/byfrmUXXuzYOEP0vmc
         2X+A==
X-Gm-Message-State: AFqh2kpixLwqu1wA2vx2eEqYyJiNvW2IoedZDF7UIX9afy5Gkj+Qu30K
        9xKDW6bvkGuP4MP1Hya4/HfA2w==
X-Google-Smtp-Source: AMrXdXt9W5CNSZWXYIK6xnBTp9OtyvSV1iYtBm/wo3bRBa9tWUhb1911pBfkpCvbvYfhDbMclhoc5Q==
X-Received: by 2002:a05:622a:1e17:b0:3a8:21cb:11d2 with SMTP id br23-20020a05622a1e1700b003a821cb11d2mr29840292qtb.1.1672168339550;
        Tue, 27 Dec 2022 11:12:19 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id h4-20020ac846c4000000b003a7fc70d59csm8866216qto.41.2022.12.27.11.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 11:12:18 -0800 (PST)
Message-ID: <770188c2-d6af-454b-cbda-7ff23339fd74@broadcom.com>
Date:   Tue, 27 Dec 2022 11:12:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
To:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
References: <20221214185714.868374-1-tytso@mit.edu>
From:   Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <20221214185714.868374-1-tytso@mit.edu>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000e743c905f0d40799"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--000000000000e743c905f0d40799
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 12/14/2022 10:57 AM, Theodore Ts'o wrote:
> As a follow-up to a discussion at the 2021 Maintainer's Summit on the
> topic of maintainer recruitment and retention, the TAB took on the
> task of creating a document which to help companies and other
> organizations to grow in their ability to engage with the Linux Kernel
> development community, using the Maturity Model[2] framework.
> 
> The goal is to encourage, in a management-friendly way, companies to
> allow their engineers to contribute with the upstream Linux Kernel
> development community, so we can grow the "talent pipeline" for
> contributors to become respected leaders, and eventually kernel
> maintainers.
> 
> [1] https://lwn.net/Articles/870581/
> [2] https://en.wikipedia.org/wiki/Maturity_model
> 
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---

[snip]

> +The TAB urges organizations to continuously evaluate their Open Source
> +maturity model and commit to improvements to align with this model.  To
> +be effective, this evaluation should incorporate feedback from across
> +the organization, including management and developers at all seniority
> +levels.  In the spirit of Open Source, we encourage organizations to
> +publish their evaluations and plans to improve their engagement with the
> +upstream community.

You probably need to provide a word or two about who is the intended 
recipient of this document, whether this is intended to be utilized by 
software developers, their management chain, or both.

> +
> +Level 0
> +=======
> +
> +* Software Engineers are not allowed to contribute patches to the Linux
> +  kernel.
> +
> +
> +Level 1
> +=======
> +
> +* Software Engineers are allowed to contribute patches to the Linux
> +  kernel, either as part of their job responsibilities or on their own
> +  time.
> +
> +Level 2
> +=======
> +
> +* Software Engineers are expected to contribute to the Linux Kernel as
> +  part of their job responsibilities.
> +* Software Engineers will be supported to attend Linux-related
> +  conferences as a part of their job.

This is not something IMHO that qualifies for Level 2, but rather for 
Level 3. It is reasonably simple and easy for companies to support their 
engineers contributing to the kernel, it is a whole different thing to 
financially support them to attend conference(s).

> +* A Software Engineer’s upstream code contributions shall be considered
> +  in promotion and performance reviews.
> +
> +Level 3
> +=======
> +
> +* Software Engineers are expected to review patches (including patches
> +  authored by engineers from other companies) as part of their job
> +  responsibilities

Would substitute expected with highly encouraged here.

> +* Contributing presentations or papers to Linux-related conferences are
> +  considered part of an engineer’s work.

Again, that seems more of a Level 4 item to me.

> +* A Software Engineer’s community contributions shall be considered in
> +  promotion and performance reviews.
> +* Organizations shall regularly report metrics of their open source
> +  contributions and track these metrics over time.  These metrics may be
> +  published only internally within the organization, or at the
> +  organization’s discretion, some or all may be published externally.
> +  Metrics that are strongly suggested include:
> +
> +  * The number of upstream kernel contributions by engineer, team, and
> +    organization (e.g., all people reporting up to a manager, director,
> +    or VP).
> +  * The percentage of kernel developers who have made upstream
> +    contributions relative to the total kernel developers in the
> +    organization.
> +  * The time interval between kernels used in the organization’s servers
> +    and/or products, and the publication date of the upstream kernel
> +    upon which the internal kernel is based.

That part is a bit difficult to generalize, so as a broad definition of 
metrics to track, it seems appropriate as a possible example. In 
practice lots of people have to work within the bounds of the kernel 
they are provided with, and they may not always entirely control the 
contribution process behind as much as the code getting in. It seems to 
me that we have usually following categories:

- everything lands upstream and/or working upstream first which is the 
case with Intel, AMD, Meta, Oracle, etc.

- maintaining a major distribution kernel: Android, RedHat, SUSE, Oracle 
UKE with as much upstream code downstream as downstream code reaching 
upstream eventually

- working with a well maintained downstream kernel tree based upon a LTS 
version from a vendor where most SoCs companies fall these days hopefully

- working with a not so major distribution kernel in the likes of 
OpenWrt etc.

- unmaintained kernel


> +  * The number of out-of-tree commits present in internal kernels.

The metrics that an organization must provide versus the level a given 
engineer is at is independent from one another, or rather, you may want 
to create different levels, one for engineers which is what you have, 
and one for organizations.

So maybe there needs to be 4 levels for an organization:

0 - no support/awareness/will to engage
1 - mild engagement with the community in one form of another, including 
maintenance of metrics
2 - organization is largely supportive of upstream work and does so with 
pouring some occasional resources to attend/organize conferences, albeit 
not at the "gold" sponsor level
3 - organization heavily leans on upstream work for its products and is 
a regular sponsor at major events

> +
> +Level 4
> +=======
> +
> +* Software Engineers are encouraged to spend a portion of their work
> +  time focused on Upstream Work, which is defined as reviewing patches
> +  or papers, improving core project infrastructure such as writing or
> +  maintaining tests, upstream tech debt reduction, writing
> +  documentation, etc.
> +* Software Engineers are supported in helping to organize Linux-related
> +  conferences.

Likewise, this seems to be more of a Level 5 aspect rather than Level 4.

> +* Organizations shall consider community member feedback in official
> +  performance reviews.
> +
> +Level 5

And I would make this essentially Level 6.

> +=======
> +
> +* Upstream kernel development is considered a formal job position, with
> +  at least a third of the engineer’s time spent doing Upstream Work.
> +* Organizations shall actively seek out community member feedback as a
> +  factor in official performance reviews.
> +* Organizations shall regularly report internally on the ratio of
> +  Upstream Work to work focused on directly pursuing business goals.
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index d4b6217472b0..33715da7e684 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -50,6 +50,7 @@ Other guides to the community that are of interest to most developers are:
>      embargoed-hardware-issues
>      maintainers
>      researcher-guidelines
> +   contribution-maturity-model
>   
>   These are some overall technical guides that have been put here for now for
>   lack of a better place.

-- 
Florian

--000000000000e743c905f0d40799
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVgwggRAoAMCAQICDBP8P9hKRVySg3Qv5DANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAxMjE4MTFaFw0yNTA5MTAxMjE4MTFaMIGW
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xGTAXBgNVBAMTEEZsb3JpYW4gRmFpbmVsbGkxLDAqBgkqhkiG
9w0BCQEWHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA+oi3jMmHltY4LMUy8Up5+1zjd1iSgUBXhwCJLj1GJQF+GwP8InemBbk5rjlC
UwbQDeIlOfb8xGqHoQFGSW8p9V1XUw+cthISLkycex0AJ09ufePshLZygRLREU0H4ecNPMejxCte
KdtB4COST4uhBkUCo9BSy1gkl8DJ8j/BQ1KNUx6oYe0CntRag+EnHv9TM9BeXBBLfmMRnWNhvOSk
nSmRX0J3d9/G2A3FIC6WY2XnLW7eAZCQPa1Tz3n2B5BGOxwqhwKLGLNu2SRCPHwOdD6e0drURF7/
Vax85/EqkVnFNlfxtZhS0ugx5gn2pta7bTdBm1IG4TX+A3B1G57rVwIDAQABo4IB3jCCAdowDgYD
VR0PAQH/BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3Vy
ZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEG
CCsGAQUFBzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWdu
MmNhMjAyMDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93
d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6
hjhodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNy
bDAoBgNVHREEITAfgR1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggr
BgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUwwfJ6/F
KL0fRdVROal/Lp4lAF0wDQYJKoZIhvcNAQELBQADggEBAKBgfteDc1mChZjKBY4xAplC6uXGyBrZ
kNGap1mHJ+JngGzZCz+dDiHRQKGpXLxkHX0BvEDZLW6LGOJ83ImrW38YMOo3ZYnCYNHA9qDOakiw
2s1RH00JOkO5SkYdwCHj4DB9B7KEnLatJtD8MBorvt+QxTuSh4ze96Jz3kEIoHMvwGFkgObWblsc
3/YcLBmCgaWpZ3Ksev1vJPr5n8riG3/N4on8gO5qinmmr9Y7vGeuf5dmZrYMbnb+yCBalkUmZQwY
NxADYvcRBA0ySL6sZpj8BIIhWiXiuusuBmt2Mak2eEv0xDbovE6Z6hYyl/ZnRadbgK/ClgbY3w+O
AfUXEZ0xggJtMIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwT
/D/YSkVckoN0L+QwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEILs6OejaZpRhJrKn
bJpfURrEbvHFiQrsjZXHCndJQPmQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTIyMTIyNzE5MTIxOVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZI
AWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEH
MAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAo1JcTTFkBUPJKbcEuDGc1PFzvFn9k/hT2
9LQ5Z8zYsqKnNrweuyt52GcnmDMxOHZUPHNlE3dKsHnhqCYnQPVQ83VprxPO0QjsYc+tD89+QuDF
d7qZ9buz1PvRcPdMHu7XGCtv+Z6HvKzaC3/95Appln538VXKptBSfqx7A6I4XcrTXM+9NZpU1Du3
vttDoEWnvJt8ZE1uF9BYcDKd9r5iDnLIcZGuR5iou+SbQ2px1fkkTbpJ7jnk2LUlsPNH1tRFEiIV
e2w+t7MAE1QsZAXE28TwvkdgSU5i2REHdi6usKyZHzquZrKg/sQacZg1Huux2HlhUhC3Lw/sUhWC
8cMK
--000000000000e743c905f0d40799--
